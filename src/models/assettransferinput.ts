import { Timelock } from "codechain-sdk/lib/core/classes";
import * as Sequelize from "sequelize";
import { AssetSchemeAttribute } from "./assetscheme";

export interface AssetTransferInputAttribute {
    id?: string;
    transactionHash: string;
    prevOut: AssetOutPointAttribute;
    timelock?: Timelock | null;
    owner?: string | null;
    assetType: string;
    lockScript: Buffer;
    unlockScript: Buffer;
}

export interface AssetOutPointAttribute {
    tracker: string;
    index: number;
    assetType: string;
    assetScheme: AssetSchemeAttribute;
    quantity: string;
    owner?: string | null;
    lockScriptHash?: string | null;
    parameters?: string[] | null;
}

export interface AssetTransferInputInstance
    extends Sequelize.Instance<AssetTransferInputAttribute> {}

export default (
    sequelize: Sequelize.Sequelize,
    DataTypes: Sequelize.DataTypes
) => {
    const AssetTransferInput = sequelize.define(
        "AssetTransferInput",
        {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: DataTypes.BIGINT
            },
            transactionHash: {
                allowNull: false,
                type: DataTypes.STRING,
                onDelete: "CASCADE",
                references: {
                    model: "Transactions",
                    key: "hash"
                }
            },
            prevOut: {
                allowNull: false,
                type: DataTypes.JSONB
            },
            owner: {
                type: DataTypes.STRING
            },
            assetType: {
                allowNull: false,
                type: DataTypes.STRING
            },
            timelock: {
                type: DataTypes.JSONB
            },
            lockScript: {
                allowNull: false,
                type: DataTypes.JSONB
            },
            unlockScript: {
                allowNull: false,
                type: DataTypes.JSONB
            },
            createdAt: {
                allowNull: false,
                type: DataTypes.DATE
            },
            updatedAt: {
                allowNull: false,
                type: DataTypes.DATE
            }
        },
        {}
    );
    AssetTransferInput.associate = () => {
        // associations can be defined here
    };
    return AssetTransferInput;
};
