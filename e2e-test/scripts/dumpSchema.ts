import { writeFileSync } from "fs";
import * as path from "path";
import { dumpSchema } from "../src/db";

const main = async (): Promise<void> => {
  try {
    const schemaSQL = await dumpSchema();
    writeFileSync(path.join(__dirname, "..", `sqls/schema.sql`), schemaSQL);
  } catch (err) {
    throw err;
  }
};

main().catch(console.error);
