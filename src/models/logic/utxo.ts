import { H160, H256, U64 } from "codechain-sdk/lib/core/classes";
import * as Sequelize from "sequelize";
import models from "..";
import * as Exception from "../../exception";
import { AssetSchemeAttribute } from "../assetscheme";
import { UTXOInstance } from "../utxo";
import * as AssetSchemeModel from "./assetscheme";
import * as BlockModel from "./block";

export async function createUTXO(
    address: string,
    utxo: {
        assetType: H256;
        lockScriptHash: H160;
        parameters: string[];
        quantity: U64;
        orderHash?: H256 | null;
        transactionHash: H256;
        transactionOutputIndex: number;
    },
    blockNumber: number
): Promise<UTXOInstance> {
    let utxoInstance;
    try {
        const assetScheme = await getAssetSheme(utxo.assetType);
        utxoInstance = await models.UTXO.create({
            address,
            assetType: utxo.assetType.value,
            lockScriptHash: utxo.lockScriptHash.value,
            parameters: utxo.parameters,
            quantity: utxo.quantity.value.toString(10),
            transactionHash: utxo.transactionHash.value,
            transactionOutputIndex: utxo.transactionOutputIndex,
            assetScheme,
            blockNumber
        });
    } catch (err) {
        console.error(err);
        throw Exception.DBError;
    }
    return utxoInstance;
}

export async function setUsed(id: string, usedTransactionHash: H256) {
    try {
        return await models.UTXO.update(
            {
                usedTransactionHash: usedTransactionHash.value
            },
            {
                where: {
                    id
                }
            }
        );
    } catch (err) {
        console.error(err);
        throw Exception.DBError;
    }
}

async function getAssetSheme(assetType: H256): Promise<AssetSchemeAttribute> {
    const assetSchemeInstance = await AssetSchemeModel.getByAssetType(
        assetType
    );
    if (!assetSchemeInstance) {
        throw Exception.InvalidTransaction;
    }
    return assetSchemeInstance.get({
        plain: true
    });
}

export async function getByAddress(address: string): Promise<UTXOInstance[]> {
    try {
        return await models.UTXO.findAll({
            where: {
                address,
                usedTransactionHash: null
            }
        });
    } catch (err) {
        console.error(err);
        throw Exception.DBError;
    }
}

export async function getByAssetType(assetType: H256) {
    try {
        return await models.UTXO.findAll({
            where: {
                assetType: assetType.value,
                usedTransactionHash: null
            }
        });
    } catch (err) {
        console.error(err);
        throw Exception.DBError;
    }
}

async function getUTXOQuery(params: {
    address?: string | null;
    assetType?: H256 | null;
    onlyConfirmed?: boolean | null;
    confirmThreshold?: number | null;
}) {
    const { address, onlyConfirmed, confirmThreshold, assetType } = params;
    const query = [];
    if (address) {
        query.push({
            address
        });
    }
    if (assetType) {
        query.push({
            assetType: assetType.value
        });
    }
    if (onlyConfirmed) {
        const latestBlockInst = await BlockModel.getLatestBlock();
        const latestBlockNumber = latestBlockInst
            ? latestBlockInst.get().number
            : 0;
        query.push({
            blockNumber: {
                [Sequelize.Op.lte]: latestBlockNumber - confirmThreshold!
            }
        });
        query.push({
            [Sequelize.Op.or]: [
                {
                    usedTransactionHash: null
                },
                {
                    [Sequelize.Op.not]: {
                        [Sequelize.Op.and]: [
                            {
                                usedTransactionHash: {
                                    [Sequelize.Op.not]: null
                                }
                            },
                            {
                                $usedTransaction$: null
                            }
                        ]
                    }
                }
            ]
        });
    } else {
        query.push({
            usedTransactionHash: null
        });
    }
    return query;
}

export async function getUTXO(params: {
    address?: string | null;
    assetType?: H256 | null;
    page?: number | null;
    itemsPerPage?: number | null;
    onlyConfirmed?: boolean | null;
    confirmThreshold?: number | null;
}) {
    const {
        address,
        assetType,
        page = 1,
        itemsPerPage = 15,
        onlyConfirmed = false,
        confirmThreshold = 0
    } = params;
    const query: any = await getUTXOQuery({
        address,
        assetType,
        onlyConfirmed,
        confirmThreshold
    });
    let includeArray: any = [
        {
            as: "usedTransaction",
            model: models.Transaction
        }
    ];
    if (onlyConfirmed) {
        const latestBlockInst = await BlockModel.getLatestBlock();
        const latestBlockNumber = latestBlockInst
            ? latestBlockInst.get().number
            : 0;
        includeArray = [
            {
                as: "usedTransaction",
                model: models.Transaction,
                required: false,
                where: {
                    blockNumber: {
                        [Sequelize.Op.lte]:
                            latestBlockNumber - confirmThreshold!
                    }
                }
            }
        ];
    }
    try {
        return await models.UTXO.findAll({
            where: {
                [Sequelize.Op.and]: query
            },
            order: [["id", "DESC"]],
            limit: itemsPerPage!,
            offset: (page! - 1) * itemsPerPage!,
            include: includeArray
        });
    } catch (err) {
        console.error(err);
        throw Exception.DBError;
    }
}

export async function getAggsUTXO(params: {
    address?: string | null;
    assetType?: H256 | null;
    page?: number | null;
    itemsPerPage?: number | null;
    onlyConfirmed?: boolean | null;
    confirmThreshold?: number | null;
}) {
    const {
        address,
        assetType,
        page = 1,
        itemsPerPage = 15,
        onlyConfirmed = false,
        confirmThreshold = 0
    } = params;
    const query: any = await getUTXOQuery({
        address,
        assetType,
        onlyConfirmed,
        confirmThreshold
    });
    let includeArray: any = [];
    if (onlyConfirmed) {
        const latestBlockInst = await BlockModel.getLatestBlock();
        const latestBlockNumber = latestBlockInst
            ? latestBlockInst.get().number
            : 0;
        includeArray = [
            {
                as: "usedTransaction",
                model: models.Transaction,
                required: false,
                where: {
                    blockNumber: {
                        [Sequelize.Op.lte]:
                            latestBlockNumber - confirmThreshold!
                    }
                },
                attributes: []
            }
        ];
    }
    try {
        return await models.UTXO.findAll({
            where: {
                [Sequelize.Op.and]: query
            },
            attributes: [
                [
                    Sequelize.fn("SUM", Sequelize.col("quantity")),
                    "totalAssetQuantity"
                ],
                "assetType",
                [
                    Sequelize.fn("COUNT", Sequelize.col("assetType")),
                    "utxoQuantity"
                ]
            ],
            order: Sequelize.literal(
                `"totalAssetQuantity" DESC, "assetType" DESC`
            ),
            limit: itemsPerPage!,
            offset: (page! - 1) * itemsPerPage!,
            include: includeArray,
            group: ["assetType"]
        });
    } catch (err) {
        console.error(err);
        throw Exception.DBError;
    }
}

export async function getCountOfAggsUTXO(params: {
    address?: string | null;
    assetType?: H256 | null;
    onlyConfirmed?: boolean | null;
    confirmThreshold?: number | null;
}) {
    const {
        address,
        assetType,
        onlyConfirmed = false,
        confirmThreshold = 0
    } = params;
    const query: any = await getUTXOQuery({
        address,
        assetType,
        onlyConfirmed,
        confirmThreshold
    });
    let includeArray: any = [];
    if (onlyConfirmed) {
        const latestBlockInst = await BlockModel.getLatestBlock();
        const latestBlockNumber = latestBlockInst
            ? latestBlockInst.get().number
            : 0;
        includeArray = [
            {
                as: "usedTransaction",
                model: models.Transaction,
                required: false,
                where: {
                    blockNumber: {
                        [Sequelize.Op.lte]:
                            latestBlockNumber - confirmThreshold!
                    }
                },
                attributes: []
            }
        ];
    }
    try {
        return await models.UTXO.count({
            where: {
                [Sequelize.Op.and]: query
            },
            distinct: true,
            col: "assetType",
            include: includeArray
        });
    } catch (err) {
        console.error(err);
        throw Exception.DBError;
    }
}

export async function getByTxHashIndex(
    transactionHash: H256,
    outputIndex: number
) {
    try {
        return await models.UTXO.findOne({
            where: {
                transactionHash: transactionHash.value,
                transactionOutputIndex: outputIndex
            }
        });
    } catch (err) {
        console.error(err);
        throw Exception.DBError;
    }
}
