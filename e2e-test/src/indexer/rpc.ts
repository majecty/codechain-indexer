import * as rp from "request-promise";

export class IndexerRPC {
  public async getTx(qs: { name: string }): Promise<any> {
    const text = await rp("http://localhost:9001/api/tx", {
      qs
    });

    return JSON.parse(text);
  }
}
