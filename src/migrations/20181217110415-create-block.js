"use strict";
module.exports = {
    up: (queryInterface, Sequelize) => {
        return queryInterface.createTable("Blocks", {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: Sequelize.BIGINT
            },
            hash: {
                unique: true,
                allowNull: false,
                type: Sequelize.STRING
            },
            parentHash: {
                allowNull: false,
                type: Sequelize.STRING
            },
            timestamp: {
                allowNull: false,
                type: Sequelize.INTEGER
            },
            number: {
                allowNull: false,
                type: Sequelize.INTEGER
            },
            author: {
                allowNull: false,
                type: Sequelize.STRING
            },
            extraData: {
                allowNull: false,
                type: Sequelize.JSONB
            },
            parcelsRoot: {
                allowNull: false,
                type: Sequelize.STRING
            },
            stateRoot: {
                allowNull: false,
                type: Sequelize.STRING
            },
            invoicesRoot: {
                allowNull: false,
                type: Sequelize.STRING
            },
            score: {
                allowNull: false,
                type: Sequelize.STRING
            },
            seal: {
                allowNull: false,
                type: Sequelize.JSONB
            },
            isRetracted: {
                allowNull: false,
                type: Sequelize.BOOLEAN
            },
            miningReward: {
                allowNull: false,
                type: Sequelize.STRING
            },
            createdAt: {
                allowNull: false,
                type: Sequelize.DATE
            },
            updatedAt: {
                allowNull: false,
                type: Sequelize.DATE
            }
        });
    },
    down: (queryInterface, Sequelize) => {
        return queryInterface.dropTable("Blocks");
    }
};