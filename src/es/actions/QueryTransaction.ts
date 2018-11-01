import { AssetSchemeDoc, TransactionDoc } from "codechain-indexer-types/lib/types";
import { Type } from "codechain-indexer-types/lib/utils";
import { H256 } from "codechain-sdk/lib/core/classes";
import { Client, CountResponse, SearchResponse } from "elasticsearch";
import * as _ from "lodash";
import { ElasticSearchAgent } from "..";
import { BaseAction } from "./BaseAction";

export class QueryTransaction implements BaseAction {
    public agent!: ElasticSearchAgent;
    public client!: Client;

    public async getTransaction(hash: H256): Promise<TransactionDoc | null> {
        const response = await this.searchTransaction({
            query: {
                bool: {
                    must: [{ term: { "data.hash": hash.value } }, { term: { isRetracted: false } }]
                }
            }
        });
        if (response.hits.total === 0) {
            return null;
        }
        return response.hits.hits[0]._source;
    }

    public async getTransactions(
        params?: {
            lastBlockNumber?: number | null;
            lastParcelIndex?: number | null;
            lastTransactionIndex?: number | null;
            itemsPerPage?: number | null;
        } | null
    ): Promise<TransactionDoc[]> {
        const response = await this.searchTransaction({
            sort: [
                { "data.blockNumber": { order: "desc" } },
                { "data.parcelIndex": { order: "desc" } },
                { "data.transactionIndex": { order: "desc" } }
            ],
            search_after: [
                params && params.lastBlockNumber != undefined ? params.lastBlockNumber : Number.MAX_VALUE,
                params && params.lastParcelIndex != undefined ? params.lastParcelIndex : Number.MAX_VALUE,
                params && params.lastTransactionIndex != undefined ? params.lastTransactionIndex : Number.MAX_VALUE
            ],
            size: params && params.itemsPerPage != undefined ? params.itemsPerPage : 25,
            query: {
                bool: {
                    must: [{ term: { isRetracted: false } }]
                }
            }
        });
        return _.map(response.hits.hits, hit => hit._source);
    }

    public async getTotalTransactionCount(): Promise<number> {
        const count = await this.countTransaction({
            query: {
                term: { isRetracted: false }
            }
        });
        return count.count;
    }

    public async getTransactionsByAssetType(
        assetType: H256,
        params?: {
            page?: number | null;
            itemsPerPage?: number | null;
        } | null
    ): Promise<TransactionDoc[]> {
        const response = await this.searchTransaction({
            sort: [
                { "data.blockNumber": { order: "desc" } },
                { "data.parcelIndex": { order: "desc" } },
                { "data.transactionIndex": { order: "desc" } }
            ],
            from:
                ((params && params.page != undefined ? params.page : 1) - 1) *
                (params && params.itemsPerPage != undefined ? params.itemsPerPage : 25),
            size: params && params.itemsPerPage != undefined ? params.itemsPerPage : 25,
            query: {
                bool: {
                    must: [
                        { term: { isRetracted: false } },
                        {
                            bool: {
                                should: [
                                    {
                                        term: {
                                            "data.inputs.prevOut.assetType": assetType.value
                                        }
                                    },
                                    {
                                        term: {
                                            "data.burns.prevOut.assetType": assetType.value
                                        }
                                    },
                                    {
                                        term: {
                                            "data.output.assetType": assetType.value
                                        }
                                    }
                                ]
                            }
                        }
                    ]
                }
            }
        });
        return _.map(response.hits.hits, hit => hit._source);
    }

    public async getTotalTransactionCountByAssetType(assetType: H256): Promise<number> {
        const count = await this.countTransaction({
            query: {
                bool: {
                    must: [
                        { term: { isRetracted: false } },
                        {
                            bool: {
                                should: [
                                    {
                                        term: {
                                            "data.inputs.prevOut.assetType": assetType.value
                                        }
                                    },
                                    {
                                        term: {
                                            "data.burns.prevOut.assetType": assetType.value
                                        }
                                    },
                                    {
                                        term: {
                                            "data.output.assetType": assetType.value
                                        }
                                    }
                                ]
                            }
                        }
                    ]
                }
            }
        });
        return count.count;
    }

    public async getTransactionsByAssetTransferAddress(
        address: string,
        params?: {
            page?: number | null;
            itemsPerPage: number | null;
        } | null
    ): Promise<TransactionDoc[]> {
        const response = await this.searchTransaction({
            sort: [
                { "data.blockNumber": { order: "desc" } },
                { "data.parcelIndex": { order: "desc" } },
                { "data.transactionIndex": { order: "desc" } }
            ],
            from:
                ((params && params.page != undefined ? params.page : 1) - 1) *
                (params && params.itemsPerPage != undefined ? params.itemsPerPage : 6),
            size: params && params.itemsPerPage != undefined ? params.itemsPerPage : 6,
            query: {
                bool: {
                    must: [
                        { term: { isRetracted: false } },
                        {
                            bool: {
                                should: [
                                    { term: { "data.outputs.owner": address } },
                                    {
                                        term: {
                                            "data.inputs.prevOut.owner": address
                                        }
                                    },
                                    {
                                        term: {
                                            "data.burns.prevOut.owner": address
                                        }
                                    },
                                    { term: { "data.output.owner": address } }
                                ]
                            }
                        }
                    ]
                }
            }
        });
        return _.map(response.hits.hits, hit => hit._source);
    }

    public async getTotalTxCountByAssetTransferAddress(address: string): Promise<number> {
        const count = await this.countTransaction({
            query: {
                bool: {
                    must: [
                        { term: { isRetracted: false } },
                        {
                            bool: {
                                should: [
                                    { term: { "data.outputs.owner": address } },
                                    {
                                        term: {
                                            "data.inputs.prevOut.owner": address
                                        }
                                    },
                                    {
                                        term: {
                                            "data.burns.prevOut.owner": address
                                        }
                                    },
                                    { term: { "data.output.owner": address } }
                                ]
                            }
                        }
                    ]
                }
            }
        });
        return count.count;
    }

    public async getAssetScheme(assetType: H256): Promise<AssetSchemeDoc | null> {
        const response = await this.searchTransaction({
            sort: [
                { "data.blockNumber": { order: "desc" } },
                { "data.parcelIndex": { order: "desc" } },
                { "data.transactionIndex": { order: "desc" } }
            ],
            size: 1,
            query: {
                bool: {
                    must: [{ term: { isRetracted: false } }, { term: { "data.output.assetType": assetType.value } }]
                }
            }
        });
        if (response.hits.total === 0) {
            return null;
        }
        return Type.getAssetSchemeDoc(response.hits.hits[0]._source);
    }

    public async getAssetInfosByAssetName(name: string): Promise<{ assetScheme: AssetSchemeDoc; assetType: string }[]> {
        const response = await this.searchTransaction({
            sort: [
                { "data.blockNumber": { order: "desc" } },
                { "data.parcelIndex": { order: "desc" } },
                { "data.transactionIndex": { order: "desc" } }
            ],
            size: 10,
            query: {
                bool: {
                    must: [
                        { term: { isRetracted: false } },
                        {
                            match: {
                                "data.assetName": { query: name, fuzziness: 3 }
                            }
                        }
                    ]
                }
            }
        });
        if (response.hits.total === 0) {
            return [];
        }
        return _.map(response.hits.hits, hit => {
            const tx = hit._source;
            const assetScheme = Type.getAssetSchemeDoc(tx);
            return {
                assetScheme,
                assetType: tx.data.output.assetType
            };
        });
    }

    public async searchTransaction(body: any): Promise<SearchResponse<any>> {
        return this.client.search({
            index: "transaction",
            type: "_doc",
            body
        });
    }

    public async retractTransaction(transactionHash: H256): Promise<void> {
        return this.updateTransaction(transactionHash, { isRetracted: true });
    }

    public async indexTransaction(transactionDoc: TransactionDoc): Promise<any> {
        return this.client.index({
            index: "transaction",
            type: "_doc",
            id: transactionDoc.data.hash,
            body: transactionDoc
        });
    }

    public async updateTransaction(hash: H256, partial: any): Promise<any> {
        return this.client.update({
            index: "transaction",
            type: "_doc",
            id: hash.value,
            body: {
                doc: partial
            }
        });
    }

    public async countTransaction(body: any): Promise<CountResponse> {
        return this.client.count({
            index: "transaction",
            type: "_doc",
            body
        });
    }
}