--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.11
-- Dumped by pg_dump version 9.5.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public."WrapCCCs" DROP CONSTRAINT "WrapCCCs_transactionHash_fkey";
ALTER TABLE ONLY public."UnwrapCCCs" DROP CONSTRAINT "UnwrapCCCs_transactionHash_fkey";
ALTER TABLE ONLY public."UTXOs" DROP CONSTRAINT "UTXOs_usedTransactionHash_fkey";
ALTER TABLE ONLY public."UTXOs" DROP CONSTRAINT "UTXOs_transactionHash_fkey";
ALTER TABLE ONLY public."UTXOSnapshots" DROP CONSTRAINT "UTXOSnapshots_snapshotId_fkey";
ALTER TABLE ONLY public."TransferAssets" DROP CONSTRAINT "TransferAssets_transactionHash_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_blockHash_fkey";
ALTER TABLE ONLY public."Stores" DROP CONSTRAINT "Stores_transactionHash_fkey";
ALTER TABLE ONLY public."SetShardUserses" DROP CONSTRAINT "SetShardUserses_transactionHash_fkey";
ALTER TABLE ONLY public."SetShardOwnerses" DROP CONSTRAINT "SetShardOwnerses_transactionHash_fkey";
ALTER TABLE ONLY public."SetRegularKeys" DROP CONSTRAINT "SetRegularKeys_transactionHash_fkey";
ALTER TABLE ONLY public."Removes" DROP CONSTRAINT "Removes_transactionHash_fkey";
ALTER TABLE ONLY public."Pays" DROP CONSTRAINT "Pays_transactionHash_fkey";
ALTER TABLE ONLY public."MintAssets" DROP CONSTRAINT "MintAssets_transactionHash_fkey";
ALTER TABLE ONLY public."DecomposeAssets" DROP CONSTRAINT "DecomposeAssets_transactionHash_fkey";
ALTER TABLE ONLY public."Customs" DROP CONSTRAINT "Customs_transactionHash_fkey";
ALTER TABLE ONLY public."CreateShards" DROP CONSTRAINT "CreateShards_transactionHash_fkey";
ALTER TABLE ONLY public."ComposeAssets" DROP CONSTRAINT "ComposeAssets_transactionHash_fkey";
ALTER TABLE ONLY public."AssetTransferOutputs" DROP CONSTRAINT "AssetTransferOutputs_transactionHash_fkey";
ALTER TABLE ONLY public."AssetTransferInputs" DROP CONSTRAINT "AssetTransferInputs_transactionHash_fkey";
ALTER TABLE ONLY public."AssetTransferBurns" DROP CONSTRAINT "AssetTransferBurns_transactionHash_fkey";
ALTER TABLE ONLY public."AssetSchemes" DROP CONSTRAINT "AssetSchemes_transactionHash_fkey";
ALTER TABLE ONLY public."AssetImages" DROP CONSTRAINT "AssetImages_transactionHash_fkey";
DROP INDEX public.blocks_timestamp_idx;
DROP INDEX public.blocks_number_idx;
ALTER TABLE ONLY public."WrapCCCs" DROP CONSTRAINT "WrapCCCs_pkey";
ALTER TABLE ONLY public."UnwrapCCCs" DROP CONSTRAINT "UnwrapCCCs_pkey";
ALTER TABLE ONLY public."UTXOs" DROP CONSTRAINT "UTXOs_pkey";
ALTER TABLE ONLY public."UTXOSnapshots" DROP CONSTRAINT "UTXOSnapshots_pkey";
ALTER TABLE ONLY public."TransferAssets" DROP CONSTRAINT "TransferAssets_pkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
ALTER TABLE ONLY public."Stores" DROP CONSTRAINT "Stores_pkey";
ALTER TABLE ONLY public."SnapshotRequests" DROP CONSTRAINT "SnapshotRequests_pkey";
ALTER TABLE ONLY public."SetShardUserses" DROP CONSTRAINT "SetShardUserses_pkey";
ALTER TABLE ONLY public."SetShardOwnerses" DROP CONSTRAINT "SetShardOwnerses_pkey";
ALTER TABLE ONLY public."SetRegularKeys" DROP CONSTRAINT "SetRegularKeys_pkey";
ALTER TABLE ONLY public."Removes" DROP CONSTRAINT "Removes_pkey";
ALTER TABLE ONLY public."Pays" DROP CONSTRAINT "Pays_pkey";
ALTER TABLE ONLY public."MintAssets" DROP CONSTRAINT "MintAssets_pkey";
ALTER TABLE ONLY public."Logs" DROP CONSTRAINT "Logs_pkey";
ALTER TABLE ONLY public."DecomposeAssets" DROP CONSTRAINT "DecomposeAssets_pkey";
ALTER TABLE ONLY public."Customs" DROP CONSTRAINT "Customs_pkey";
ALTER TABLE ONLY public."CreateShards" DROP CONSTRAINT "CreateShards_pkey";
ALTER TABLE ONLY public."ComposeAssets" DROP CONSTRAINT "ComposeAssets_pkey";
ALTER TABLE ONLY public."Blocks" DROP CONSTRAINT "Blocks_pkey";
ALTER TABLE ONLY public."AssetTransferOutputs" DROP CONSTRAINT "AssetTransferOutputs_pkey";
ALTER TABLE ONLY public."AssetTransferInputs" DROP CONSTRAINT "AssetTransferInputs_pkey";
ALTER TABLE ONLY public."AssetTransferBurns" DROP CONSTRAINT "AssetTransferBurns_pkey";
ALTER TABLE ONLY public."AssetSchemes" DROP CONSTRAINT "AssetSchemes_pkey";
ALTER TABLE ONLY public."AssetImages" DROP CONSTRAINT "AssetImages_pkey";
ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_pkey";
ALTER TABLE public."UTXOs" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."SnapshotRequests" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."AssetTransferOutputs" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."AssetTransferInputs" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."AssetTransferBurns" ALTER COLUMN id DROP DEFAULT;
DROP TABLE public."WrapCCCs";
DROP TABLE public."UnwrapCCCs";
DROP SEQUENCE public."UTXOs_id_seq";
DROP TABLE public."UTXOs";
DROP TABLE public."UTXOSnapshots";
DROP TABLE public."TransferAssets";
DROP TABLE public."Transactions";
DROP TABLE public."Stores";
DROP SEQUENCE public."SnapshotRequests_id_seq";
DROP TABLE public."SnapshotRequests";
DROP TABLE public."SetShardUserses";
DROP TABLE public."SetShardOwnerses";
DROP TABLE public."SetRegularKeys";
DROP TABLE public."Removes";
DROP TABLE public."Pays";
DROP TABLE public."MintAssets";
DROP TABLE public."Logs";
DROP TABLE public."DecomposeAssets";
DROP TABLE public."Customs";
DROP TABLE public."CreateShards";
DROP TABLE public."ComposeAssets";
DROP TABLE public."Blocks";
DROP SEQUENCE public."AssetTransferOutputs_id_seq";
DROP TABLE public."AssetTransferOutputs";
DROP SEQUENCE public."AssetTransferInputs_id_seq";
DROP TABLE public."AssetTransferInputs";
DROP SEQUENCE public."AssetTransferBurns_id_seq";
DROP TABLE public."AssetTransferBurns";
DROP TABLE public."AssetSchemes";
DROP TABLE public."AssetImages";
DROP TABLE public."Accounts";
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--



--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--



--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--



--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--



SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Accounts" (
    address character varying(255) NOT NULL,
    balance numeric(20,0) NOT NULL,
    seq integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: AssetImages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AssetImages" (
    "transactionHash" character varying(255) NOT NULL,
    "assetType" character varying(255) NOT NULL,
    image bytea NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: AssetSchemes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AssetSchemes" (
    "transactionHash" character varying(255) NOT NULL,
    "assetType" character varying(255) NOT NULL,
    metadata character varying(255) NOT NULL,
    approver character varying(255),
    administrator character varying(255),
    "allowedScriptHashes" jsonb NOT NULL,
    supply numeric(20,0),
    "networkId" character varying(255),
    "shardId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: AssetTransferBurns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AssetTransferBurns" (
    id bigint NOT NULL,
    "transactionHash" character varying(255) NOT NULL,
    "prevOut" jsonb NOT NULL,
    owner character varying(255),
    "assetType" character varying(255) NOT NULL,
    timelock jsonb,
    "lockScript" jsonb NOT NULL,
    "unlockScript" jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: AssetTransferBurns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "AssetTransferBurns_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: AssetTransferBurns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "AssetTransferBurns_id_seq" OWNED BY "AssetTransferBurns".id;


--
-- Name: AssetTransferInputs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AssetTransferInputs" (
    id bigint NOT NULL,
    "transactionHash" character varying(255) NOT NULL,
    "prevOut" jsonb NOT NULL,
    owner character varying(255),
    "assetType" character varying(255) NOT NULL,
    timelock jsonb,
    "lockScript" jsonb NOT NULL,
    "unlockScript" jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: AssetTransferInputs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "AssetTransferInputs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: AssetTransferInputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "AssetTransferInputs_id_seq" OWNED BY "AssetTransferInputs".id;


--
-- Name: AssetTransferOutputs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "AssetTransferOutputs" (
    id bigint NOT NULL,
    "transactionHash" character varying(255) NOT NULL,
    "lockScriptHash" character varying(255) NOT NULL,
    parameters jsonb NOT NULL,
    "assetType" character varying(255) NOT NULL,
    quantity numeric(20,0) NOT NULL,
    owner character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: AssetTransferOutputs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "AssetTransferOutputs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: AssetTransferOutputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "AssetTransferOutputs_id_seq" OWNED BY "AssetTransferOutputs".id;


--
-- Name: Blocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Blocks" (
    hash character varying(255) NOT NULL,
    "parentHash" character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    number integer NOT NULL,
    author character varying(255) NOT NULL,
    "extraData" jsonb NOT NULL,
    "transactionsRoot" character varying(255) NOT NULL,
    "stateRoot" character varying(255) NOT NULL,
    "invoicesRoot" character varying(255) NOT NULL,
    score character varying(255) NOT NULL,
    seal jsonb NOT NULL,
    "miningReward" numeric(20,0) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: ComposeAssets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ComposeAssets" (
    "transactionHash" character varying(255) NOT NULL,
    "networkId" character varying(255) NOT NULL,
    "shardId" integer NOT NULL,
    metadata character varying(255) NOT NULL,
    approver character varying(255),
    administrator character varying(255),
    "allowedScriptHashes" jsonb NOT NULL,
    approvals jsonb NOT NULL,
    "lockScriptHash" character varying(255) NOT NULL,
    parameters jsonb NOT NULL,
    supply numeric(20,0) NOT NULL,
    "assetName" character varying(255),
    recipient character varying(255) NOT NULL,
    "assetType" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: CreateShards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "CreateShards" (
    "transactionHash" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Customs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Customs" (
    "transactionHash" character varying(255) NOT NULL,
    "handlerId" integer NOT NULL,
    content character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: DecomposeAssets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "DecomposeAssets" (
    "transactionHash" character varying(255) NOT NULL,
    "networkId" character varying(255) NOT NULL,
    approvals jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Logs" (
    id character varying(255) NOT NULL,
    date character varying(255) NOT NULL,
    count integer NOT NULL,
    type character varying(255) NOT NULL,
    value character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: MintAssets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "MintAssets" (
    "transactionHash" character varying(255) NOT NULL,
    "networkId" character varying(255) NOT NULL,
    "shardId" integer NOT NULL,
    metadata character varying(255) NOT NULL,
    approver character varying(255),
    administrator character varying(255),
    "allowedScriptHashes" jsonb NOT NULL,
    approvals jsonb NOT NULL,
    "lockScriptHash" character varying(255) NOT NULL,
    parameters jsonb NOT NULL,
    supply numeric(20,0) NOT NULL,
    "assetName" character varying(255),
    recipient character varying(255) NOT NULL,
    "assetType" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Pays; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Pays" (
    "transactionHash" character varying(255) NOT NULL,
    receiver character varying(255) NOT NULL,
    quantity numeric(20,0) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Removes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Removes" (
    "transactionHash" character varying(255) NOT NULL,
    "textHash" character varying(255) NOT NULL,
    signature character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: SetRegularKeys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SetRegularKeys" (
    "transactionHash" character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: SetShardOwnerses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SetShardOwnerses" (
    "transactionHash" character varying(255) NOT NULL,
    "shardId" integer NOT NULL,
    owners jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: SetShardUserses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SetShardUserses" (
    "transactionHash" character varying(255) NOT NULL,
    "shardId" integer NOT NULL,
    users jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: SnapshotRequests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SnapshotRequests" (
    id bigint NOT NULL,
    "timestamp" integer NOT NULL,
    "assetType" character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: SnapshotRequests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "SnapshotRequests_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: SnapshotRequests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "SnapshotRequests_id_seq" OWNED BY "SnapshotRequests".id;


--
-- Name: Stores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Stores" (
    "transactionHash" character varying(255) NOT NULL,
    content character varying(255) NOT NULL,
    certifier character varying(255) NOT NULL,
    signature character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Transactions" (
    hash character varying(255) NOT NULL,
    "blockNumber" integer,
    "blockHash" character varying(255),
    tracker character varying(255),
    "transactionIndex" integer,
    type character varying(255) NOT NULL,
    seq numeric(20,0) NOT NULL,
    fee character varying(255) NOT NULL,
    "networkId" character varying(255) NOT NULL,
    sig character varying(255) NOT NULL,
    signer character varying(255) NOT NULL,
    invoice boolean,
    "errorType" character varying(255),
    "timestamp" integer,
    "isPending" boolean NOT NULL,
    "pendingTimestamp" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: TransferAssets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "TransferAssets" (
    "transactionHash" character varying(255) NOT NULL,
    "networkId" character varying(255) NOT NULL,
    approvals jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: UTXOSnapshots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "UTXOSnapshots" (
    "snapshotId" bigint NOT NULL,
    "blockNumber" integer NOT NULL,
    snapshot jsonb NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: UTXOs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "UTXOs" (
    id bigint NOT NULL,
    address character varying(255) NOT NULL,
    "assetType" character varying(255) NOT NULL,
    "lockScriptHash" character varying(255) NOT NULL,
    parameters jsonb NOT NULL,
    quantity numeric(20,0) NOT NULL,
    "transactionHash" character varying(255) NOT NULL,
    "transactionOutputIndex" integer NOT NULL,
    "assetScheme" jsonb NOT NULL,
    "usedTransactionHash" character varying(255),
    "blockNumber" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: UTXOs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "UTXOs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UTXOs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "UTXOs_id_seq" OWNED BY "UTXOs".id;


--
-- Name: UnwrapCCCs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "UnwrapCCCs" (
    "transactionHash" character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: WrapCCCs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "WrapCCCs" (
    "transactionHash" character varying(255) NOT NULL,
    "shardId" integer NOT NULL,
    "lockScriptHash" character varying(255) NOT NULL,
    parameters jsonb NOT NULL,
    quantity numeric(20,0) NOT NULL,
    recipient character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetTransferBurns" ALTER COLUMN id SET DEFAULT nextval('"AssetTransferBurns_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetTransferInputs" ALTER COLUMN id SET DEFAULT nextval('"AssetTransferInputs_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetTransferOutputs" ALTER COLUMN id SET DEFAULT nextval('"AssetTransferOutputs_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SnapshotRequests" ALTER COLUMN id SET DEFAULT nextval('"SnapshotRequests_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UTXOs" ALTER COLUMN id SET DEFAULT nextval('"UTXOs_id_seq"'::regclass);


--
-- Name: Accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (address);


--
-- Name: AssetImages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetImages"
    ADD CONSTRAINT "AssetImages_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: AssetSchemes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetSchemes"
    ADD CONSTRAINT "AssetSchemes_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: AssetTransferBurns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetTransferBurns"
    ADD CONSTRAINT "AssetTransferBurns_pkey" PRIMARY KEY (id);


--
-- Name: AssetTransferInputs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetTransferInputs"
    ADD CONSTRAINT "AssetTransferInputs_pkey" PRIMARY KEY (id);


--
-- Name: AssetTransferOutputs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetTransferOutputs"
    ADD CONSTRAINT "AssetTransferOutputs_pkey" PRIMARY KEY (id);


--
-- Name: Blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Blocks"
    ADD CONSTRAINT "Blocks_pkey" PRIMARY KEY (hash);


--
-- Name: ComposeAssets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ComposeAssets"
    ADD CONSTRAINT "ComposeAssets_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: CreateShards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CreateShards"
    ADD CONSTRAINT "CreateShards_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: Customs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Customs"
    ADD CONSTRAINT "Customs_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: DecomposeAssets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "DecomposeAssets"
    ADD CONSTRAINT "DecomposeAssets_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: Logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Logs"
    ADD CONSTRAINT "Logs_pkey" PRIMARY KEY (id);


--
-- Name: MintAssets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MintAssets"
    ADD CONSTRAINT "MintAssets_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: Pays_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Pays"
    ADD CONSTRAINT "Pays_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: Removes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Removes"
    ADD CONSTRAINT "Removes_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: SetRegularKeys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SetRegularKeys"
    ADD CONSTRAINT "SetRegularKeys_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: SetShardOwnerses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SetShardOwnerses"
    ADD CONSTRAINT "SetShardOwnerses_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: SetShardUserses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SetShardUserses"
    ADD CONSTRAINT "SetShardUserses_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: SnapshotRequests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SnapshotRequests"
    ADD CONSTRAINT "SnapshotRequests_pkey" PRIMARY KEY (id);


--
-- Name: Stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Stores"
    ADD CONSTRAINT "Stores_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (hash);


--
-- Name: TransferAssets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "TransferAssets"
    ADD CONSTRAINT "TransferAssets_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: UTXOSnapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UTXOSnapshots"
    ADD CONSTRAINT "UTXOSnapshots_pkey" PRIMARY KEY ("snapshotId");


--
-- Name: UTXOs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UTXOs"
    ADD CONSTRAINT "UTXOs_pkey" PRIMARY KEY (id);


--
-- Name: UnwrapCCCs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UnwrapCCCs"
    ADD CONSTRAINT "UnwrapCCCs_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: WrapCCCs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "WrapCCCs"
    ADD CONSTRAINT "WrapCCCs_pkey" PRIMARY KEY ("transactionHash");


--
-- Name: blocks_number_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blocks_number_idx ON "Blocks" USING btree (number);


--
-- Name: blocks_timestamp_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX blocks_timestamp_idx ON "Blocks" USING btree ("timestamp");


--
-- Name: AssetImages_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetImages"
    ADD CONSTRAINT "AssetImages_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "AssetSchemes"("transactionHash") ON DELETE CASCADE;


--
-- Name: AssetSchemes_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetSchemes"
    ADD CONSTRAINT "AssetSchemes_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: AssetTransferBurns_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetTransferBurns"
    ADD CONSTRAINT "AssetTransferBurns_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: AssetTransferInputs_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetTransferInputs"
    ADD CONSTRAINT "AssetTransferInputs_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: AssetTransferOutputs_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "AssetTransferOutputs"
    ADD CONSTRAINT "AssetTransferOutputs_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: ComposeAssets_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ComposeAssets"
    ADD CONSTRAINT "ComposeAssets_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: CreateShards_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CreateShards"
    ADD CONSTRAINT "CreateShards_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: Customs_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Customs"
    ADD CONSTRAINT "Customs_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: DecomposeAssets_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "DecomposeAssets"
    ADD CONSTRAINT "DecomposeAssets_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: MintAssets_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "MintAssets"
    ADD CONSTRAINT "MintAssets_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: Pays_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Pays"
    ADD CONSTRAINT "Pays_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: Removes_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Removes"
    ADD CONSTRAINT "Removes_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: SetRegularKeys_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SetRegularKeys"
    ADD CONSTRAINT "SetRegularKeys_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: SetShardOwnerses_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SetShardOwnerses"
    ADD CONSTRAINT "SetShardOwnerses_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: SetShardUserses_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SetShardUserses"
    ADD CONSTRAINT "SetShardUserses_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: Stores_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Stores"
    ADD CONSTRAINT "Stores_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: Transactions_blockHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_blockHash_fkey" FOREIGN KEY ("blockHash") REFERENCES "Blocks"(hash) ON DELETE CASCADE;


--
-- Name: TransferAssets_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "TransferAssets"
    ADD CONSTRAINT "TransferAssets_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: UTXOSnapshots_snapshotId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UTXOSnapshots"
    ADD CONSTRAINT "UTXOSnapshots_snapshotId_fkey" FOREIGN KEY ("snapshotId") REFERENCES "SnapshotRequests"(id) ON DELETE CASCADE;


--
-- Name: UTXOs_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UTXOs"
    ADD CONSTRAINT "UTXOs_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: UTXOs_usedTransactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UTXOs"
    ADD CONSTRAINT "UTXOs_usedTransactionHash_fkey" FOREIGN KEY ("usedTransactionHash") REFERENCES "Transactions"(hash) ON DELETE SET NULL;


--
-- Name: UnwrapCCCs_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UnwrapCCCs"
    ADD CONSTRAINT "UnwrapCCCs_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- Name: WrapCCCs_transactionHash_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "WrapCCCs"
    ADD CONSTRAINT "WrapCCCs_transactionHash_fkey" FOREIGN KEY ("transactionHash") REFERENCES "Transactions"(hash) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

