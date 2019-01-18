import * as assert from "assert";
import "mocha";
import { CodeChain } from "../codeChain";
import { loadData, loadSchema } from "../db";
import { Index } from "../indexer";

describe("Payment", function() {
  const indexer: Index = new Index();
  /// We start an empty CodeChain because Indexer need it.
  const codeChain: CodeChain = new CodeChain();
  before(async function() {
    await codeChain.run();
    await loadSchema();
    await loadData("payment");
    await indexer.start();
  });

  after(async function() {
    await codeChain.stop();
    await indexer.stop();
  });

  it("Payment transaction should be exist", async function() {
    const transactions = await indexer.rpc.getTx({
      name: "d1dffb192188b2d55ed5e05ace6998a73a6a1920878f6175b163a8d80df24e53"
    });
    assert(parseInt(transactions[0].pay.quantity, 10) > 0);
  });
});
