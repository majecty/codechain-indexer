import * as assert from "assert";
import { SDK } from "codechain-sdk";
import * as Docker from "dockerode";
import { logger } from "./logger";

const codechainImage =
  "kodebox/codechain:bbf16b0be43bdee3da7aef55bd2721c835a298a0";

const delay = (num: number) => {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, num);
  });
};

export class CodeChain {
  private docker: Docker;
  private container: Docker.Container | null;
  private sdk: SDK;

  constructor() {
    this.docker = new Docker();
    this.container = null;
    this.sdk = new SDK({
      server: "http://localhost:18080",
      keyStoreType: "memory"
    });

    process.on("SIGINT", async () => {
      console.log("Caught interrupt signal");

      if (this.container !== null) {
        this.stop();
      }
    });
  }

  public async run(): Promise<void> {
    assert(this.container === null);
    logger.info("Pull docker image");
    await this.pullImage(codechainImage);

    logger.info("Create container");
    this.container = await this.docker.createContainer({
      Image: codechainImage,
      Cmd: [
        "--jsonrpc-interface",
        "0.0.0.0",
        "-c",
        "solo",
        "--reseal-min-period",
        "0",
        "--enable-devel-api"
      ],
      ExposedPorts: { "18080/tcp": {} },
      HostConfig: {
        PortBindings: {
          "18080/tcp": [
            {
              HostPort: "18080"
            }
          ]
        }
      }
    });
    logger.debug("Start container");
    await this.container.start();

    while (true) {
      try {
        await delay(500);
        logger.silly("Ping to CodeChain");
        await this.sdk.rpc.node.ping();
        break;
      } catch (err) {
        logger.silly(`Ping to CodeChain failed ${err}`);
      }
    }
  }

  public async stop() {
    if (this.container !== null) {
      const container = this.container;
      this.container = null;
      await container.stop();
      await container.remove();
    }
  }

  private async pullImage(codeChainImage: string): Promise<void> {
    await new Promise((resolve, reject) => {
      this.docker.pull(codeChainImage, {}, (err, stream) => {
        if (err) {
          reject(err);
          return;
        }

        this.docker.modem.followProgress(stream, onFinished, onProgress);

        function onFinished(finishedErr: any) {
          if (finishedErr) {
            reject(finishedErr);
            return;
          }

          resolve();
        }

        function onProgress(event: any) {
          logger.silly("", event);
        }
      });
    });
  }
}
