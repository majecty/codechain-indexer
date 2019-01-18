import { writeFileSync } from "fs";
import * as inquirer from "inquirer";
import * as path from "path";
import { CodeChain } from "../src/codeChain";
import { queryExampleFilesFromUser, runExamplesWithSetup } from "../src/sdkExample";
import { dumpData } from "../src/db";
import { waitIndexer } from "../src/indexer";

const main = async (): Promise<void> => {
  const codeChain = new CodeChain();
  try {
    await codeChain.run();
    const examples = await queryExampleFilesFromUser();
    await runExamplesWithSetup(examples);
    await waitIndexer();
    await codeChain.stop();
    const dataSQL = await dumpData();

    const { fixtureFileName } = await inquirer.prompt<any>([{
      type: "string",
      name: "fixtureFileName",
      message: "Please give the output file name",
    }]);
    writeFileSync(path.join(__dirname, "..", `sqls/${fixtureFileName}.sql`), dataSQL);
  } catch (err) {
    await codeChain.stop();
    throw err;
  }
};

main().catch(console.error);
