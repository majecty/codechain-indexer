import { execFile } from "child_process";
import * as inquirer from "inquirer";
import * as path from "path";
import { logger } from "./logger";

export const dumpData = async (): Promise<string> => {
  const { databaseName } = await inquirer.prompt<any>([
    {
      type: "string",
      name: "databaseName",
      message: "Please give the database name",
      default: "codechain-indexer-dev"
    }
  ]);
  logger.silly(`DB Name is ${databaseName}`);

  return new Promise<string>((resolve, reject) => {
    execFile(
      "pg_dump",
      ["-T", '"SequelizeMeta"', "-a", databaseName],
      (err: any, stdout: string, stderr: string) => {
        if (stderr) {
          console.error(stderr);
        }

        if (err) {
          reject(err);
        } else {
          resolve(stdout);
        }
      }
    );
  });
};

export const dumpSchema = async (): Promise<string> => {
  const { databaseName } = await inquirer.prompt<any>([
    {
      type: "string",
      name: "databaseName",
      message: "Please give the database name",
      default: "codechain-indexer-dev"
    }
  ]);
  logger.silly(`DB Name is ${databaseName}`);

  const schemaText = await new Promise<string>((resolve, reject) => {
    execFile(
      "pg_dump",
      ["-T", '"SequelizeMeta"', "-csOx", databaseName],
      (err: any, stdout: string, stderr: string) => {
        if (stderr) {
          console.error(stderr);
        }

        if (err) {
          reject(err);
        } else {
          resolve(stdout);
        }
      }
    );
  });

  const lines = schemaText.split("\n");
  return lines
    .filter(line => {
      if (line.startsWith("CREATE SCHEMA")) {
        logger.silly(`${line} removed`);
        return false;
      }
      if (line.startsWith("DROP SCHEMA")) {
        logger.silly(`${line} removed`);
        return false;
      }
      if (line.startsWith("CREATE EXTENSION")) {
        logger.silly(`${line} removed`);
        return false;
      }
      if (line.startsWith("DROP EXTENSION")) {
        logger.silly(`${line} removed`);
        return false;
      }
      if (line.startsWith("COMMENT ON")) {
        return false;
      }
      return true;
    })
    .join("\n");
};

export const loadSchema = async (): Promise<void> => {
  const projectPath = path.join(__dirname, "..");

  logger.silly("Load schema file");
  return new Promise<void>((resolve, reject) => {
    execFile(
      "psql",
      [
        "codechain-indexer-test-int",
        "-f",
        "sqls/schema.sql",
        "-U",
        "user",
        "-h",
        "localhost"
      ],
      {
        cwd: projectPath,
        env: {
          ...process.env,
          PGPASSWORD: "password"
        }
      },
      (err: any, _stdout: string, stderr: string) => {
        if (stderr) {
          logger.silly(stderr);
        }

        if (err) {
          reject(err);
        } else {
          resolve();
        }
      }
    );
  });
};

/**
 * Load data to integration test database
 * @param dataFileName - File name in sqls directory like "payment"
 */
export const loadData = async (dataFileName: string): Promise<void> => {
  const projectPath = path.join(__dirname, "..");

  logger.silly(`Load sqls/${dataFileName}.sql file`);
  return new Promise<void>((resolve, reject) => {
    execFile(
      "psql",
      [
        "codechain-indexer-test-int",
        "-f",
        `sqls/${dataFileName}.sql`,
        "-U",
        "user",
        "-h",
        "localhost"
      ],
      {
        cwd: projectPath,
        env: {
          ...process.env,
          PGPASSWORD: "password"
        }
      },
      (err: any, _stdout: string, stderr: string) => {
        if (stderr) {
          console.error(stderr);
        }

        if (err) {
          reject(err);
        } else {
          resolve();
        }
      }
    );
  });
};
