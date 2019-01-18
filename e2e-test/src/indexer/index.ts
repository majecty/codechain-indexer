import * as assert from "assert";
import { ChildProcess, spawn } from "child_process";
import * as inquirer from "inquirer";
import * as path from "path";
import { logger } from "../logger";
import { IndexerRPC } from "./rpc";
const treeKill = require("tree-kill");
const isPortReachable = require("is-port-reachable");

const delay = (num: number) => {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, num);
  });
};

export const waitIndexer = async () => {
  await inquirer.prompt({
    name: "any",
    message: "Please run indexer and press enter when finished"
  });
};

export class Index {
  public rpc: IndexerRPC = new IndexerRPC();
  private process: ChildProcess | null;

  constructor() {
    this.process = null;
  }

  public async start() {
    assert(this.process === null);

    const indexerPath = path.join(__dirname, "../../..");

    this.process = spawn("yarn", ["run", "start"], {
      cwd: indexerPath,
      env: {
        ...process.env,
        NODE_ENV: "test-int"
      }
    });

    this.process.stderr.on("data", chunk => {
      logger.warn(`STDERR from indexer, ${chunk}`);
    });

    this.process.stdout.on("data", chunk => {
      logger.silly(`STDOUT from indexer, ${chunk}`);
    });

    this.process.on("error", err => {
      logger.warn(`Indexer failed with ${err}`);
    });

    this.process.on("exit", (code, signal) => {
      logger.debug(`Indexer process exit(${code}) with signal(${signal})`);
      this.process = null;
    });

    while (true) {
      const reachable = await isPortReachable(9001, { host: "localhost" });
      if (reachable) {
        break;
      }
      logger.debug(
        "Indexer's port(9001) is not reachable in 1 second try again"
      );
      await delay(500);
    }
  }

  public async stop() {
    if (this.process !== null) {
      logger.silly(`Kill the indexer process ${this.process.pid}`);
      const process = this.process;
      treeKill(process.pid);
      await delay(500);

      if (this.process !== null && !process.killed) {
        treeKill(process.pid, "SIGKILL");
      }
      this.process = null;
    }
  }
}
