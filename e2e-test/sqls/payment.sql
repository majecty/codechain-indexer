--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: Accounts; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Accounts" (address, balance, seq, "createdAt", "updatedAt") FROM stdin;
tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqyca3rwt	1000000	0	2019-01-21 01:21:09.522+00	2019-01-21 01:21:09.522+00
tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqvxf40sk	1000000	0	2019-01-21 01:21:09.523+00	2019-01-21 01:21:09.523+00
tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqgfrhflv	1000000	0	2019-01-21 01:21:09.522+00	2019-01-21 01:21:09.522+00
tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqszkma5z	1000000	0	2019-01-21 01:21:09.523+00	2019-01-21 01:21:09.523+00
tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq5duemmc	1000000	0	2019-01-21 01:21:09.523+00	2019-01-21 01:21:09.523+00
tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqcuzl32l	1000000	0	2019-01-21 01:21:09.537+00	2019-01-21 01:21:09.537+00
tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqungah99	1000000	0	2019-01-21 01:21:09.537+00	2019-01-21 01:21:09.537+00
tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqpqc2ul2h	1000000	0	2019-01-21 01:21:09.537+00	2019-01-21 01:21:09.537+00
tccq8vapdlstar6ghmqgczp6j2e83njsqq0tsvaxm9u	1000000	0	2019-01-21 01:21:09.538+00	2019-01-21 01:21:09.538+00
tccq9h7vnl68frvqapzv3tujrxtxtwqdnxw6yamrrgd	9999999999999989990	1	2019-01-21 01:21:09.537+00	2019-01-21 01:21:09.815+00
tccqxv9y4cw0jwphhu65tn4605wadyd2sxu5yezqghw	10000	0	2019-01-21 01:21:09.819+00	2019-01-21 01:21:09.819+00
tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqhhn9p3	10	0	2019-01-21 01:21:09.537+00	2019-01-21 01:21:09.819+00
\.


--
-- Data for Name: Blocks; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Blocks" (hash, "parentHash", "timestamp", number, author, "extraData", "transactionsRoot", "stateRoot", "invoicesRoot", score, seal, "miningReward", "createdAt", "updatedAt") FROM stdin;
6a2dac92462a6bc36c4c28a60847a908b5fecd03d5b9d9a43c65fb8771bda873	0000000000000000000000000000000000000000000000000000000000000000	0	0	tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqhhn9p3	[182, 141, 189, 58, 47, 86, 49, 47, 145, 49, 179, 200, 61, 170, 129, 220, 97, 24, 64, 143, 134, 178, 219, 106, 158, 203, 95, 6, 176, 63, 151, 233]	45b0cfc220ceec5b7c1c62c4d4193d38e4eba48e8815729ce75f9c0ab0e4c1c0	44f7eb213cd7cbab9d2144b8fe57149fca9a3be43805bf5cb57c93aeb12a78b5	45b0cfc220ceec5b7c1c62c4d4193d38e4eba48e8815729ce75f9c0ab0e4c1c0	131072	[]	0	2019-01-21 01:21:09.452+00	2019-01-21 01:21:09.452+00
bd738f6c8be921d223192d45e4380cdc29ecdcc6c50d67baa626529522bce109	6a2dac92462a6bc36c4c28a60847a908b5fecd03d5b9d9a43c65fb8771bda873	1548033643	1	tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqhhn9p3	[]	17d39987c9c8c647a91b733825dc69f193d7db0ce21d3cd2e4cc396421e4b437	355a275d40325b268a3a23fd3a93c024d8bfc392eb34c1b8992deeed8499267a	697f3a971cb540dd322189f306d1e274c78be5f4d7e077f2924cc75955f2464c	131072	[]	10	2019-01-21 01:21:09.671+00	2019-01-21 01:21:09.671+00
\.


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Transactions" (hash, "blockNumber", "blockHash", tracker, "transactionIndex", type, seq, fee, "networkId", sig, signer, invoice, "errorType", "timestamp", "isPending", "pendingTimestamp", "createdAt", "updatedAt") FROM stdin;
d1dffb192188b2d55ed5e05ace6998a73a6a1920878f6175b163a8d80df24e53	1	bd738f6c8be921d223192d45e4380cdc29ecdcc6c50d67baa626529522bce109	\N	0	pay	0	10	tc	0xf6ac8165150768147922db84cc18628f196923c0f50aa2ee0f9c598e94cd01735070fb23462a3b351ba09aeb868b9e842079c2cd45d0c4b2a34584bd25ca332301	tccq9h7vnl68frvqapzv3tujrxtxtwqdnxw6yamrrgd	t	\N	1548033643	f	\N	2019-01-21 01:21:09.736+00	2019-01-21 01:21:09.736+00
\.


--
-- Data for Name: AssetSchemes; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."AssetSchemes" ("transactionHash", "assetType", metadata, approver, administrator, "allowedScriptHashes", supply, "networkId", "shardId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: AssetImages; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."AssetImages" ("transactionHash", "assetType", image, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: AssetTransferBurns; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."AssetTransferBurns" (id, "transactionHash", "prevOut", owner, "assetType", timelock, "lockScript", "unlockScript", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: AssetTransferInputs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."AssetTransferInputs" (id, "transactionHash", "prevOut", owner, "assetType", timelock, "lockScript", "unlockScript", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: AssetTransferOutputs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."AssetTransferOutputs" (id, "transactionHash", "lockScriptHash", parameters, "assetType", quantity, owner, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ComposeAssets; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."ComposeAssets" ("transactionHash", "networkId", "shardId", metadata, approver, administrator, "allowedScriptHashes", approvals, "lockScriptHash", parameters, supply, "assetName", recipient, "assetType", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CreateShards; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."CreateShards" ("transactionHash", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Customs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Customs" ("transactionHash", "handlerId", content, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: DecomposeAssets; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."DecomposeAssets" ("transactionHash", "networkId", approvals, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Logs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Logs" (id, date, count, type, value, "createdAt", "updatedAt") FROM stdin;
1970-01-01-BLOCK_COUNT-N	1970-01-01	1	BLOCK_COUNT	\N	2019-01-21 01:21:09.607+00	2019-01-21 01:21:09.607+00
1970-01-01-BLOCK_MINING_COUNT-tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqhhn9p3	1970-01-01	1	BLOCK_MINING_COUNT	tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqhhn9p3	2019-01-21 01:21:09.632+00	2019-01-21 01:21:09.632+00
2019-01-21-BLOCK_COUNT-N	2019-01-21	1	BLOCK_COUNT	\N	2019-01-21 01:21:09.854+00	2019-01-21 01:21:09.854+00
2019-01-21-BLOCK_MINING_COUNT-tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqhhn9p3	2019-01-21	1	BLOCK_MINING_COUNT	tccqyqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqhhn9p3	2019-01-21 01:21:09.882+00	2019-01-21 01:21:09.882+00
2019-01-21-PAY_COUNT-N	2019-01-21	1	PAY_COUNT	\N	2019-01-21 01:21:09.944+00	2019-01-21 01:21:09.944+00
2019-01-21-TX_COUNT-N	2019-01-21	2	TX_COUNT	\N	2019-01-21 01:21:09.914+00	2019-01-21 01:21:09.96+00
\.


--
-- Data for Name: MintAssets; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."MintAssets" ("transactionHash", "networkId", "shardId", metadata, approver, administrator, "allowedScriptHashes", approvals, "lockScriptHash", parameters, supply, "assetName", recipient, "assetType", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Pays; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Pays" ("transactionHash", receiver, quantity, "createdAt", "updatedAt") FROM stdin;
d1dffb192188b2d55ed5e05ace6998a73a6a1920878f6175b163a8d80df24e53	tccqxv9y4cw0jwphhu65tn4605wadyd2sxu5yezqghw	2710	2019-01-21 01:21:09.77+00	2019-01-21 01:21:09.77+00
\.


--
-- Data for Name: Removes; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Removes" ("transactionHash", "textHash", signature, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SetRegularKeys; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."SetRegularKeys" ("transactionHash", key, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SetShardOwnerses; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."SetShardOwnerses" ("transactionHash", "shardId", owners, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SetShardUserses; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."SetShardUserses" ("transactionHash", "shardId", users, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SnapshotRequests; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."SnapshotRequests" (id, "timestamp", "assetType", status, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Stores; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."Stores" ("transactionHash", content, certifier, signature, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TransferAssets; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."TransferAssets" ("transactionHash", "networkId", approvals, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: UTXOSnapshots; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."UTXOSnapshots" ("snapshotId", "blockNumber", snapshot, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: UTXOs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public."UTXOs" (id, address, "assetType", "lockScriptHash", parameters, quantity, "transactionHash", "transactionOutputIndex", "assetScheme", "usedTransactionHash", "blockNumber", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: AssetTransferBurns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."AssetTransferBurns_id_seq"', 1, false);


--
-- Name: AssetTransferInputs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."AssetTransferInputs_id_seq"', 1, false);


--
-- Name: AssetTransferOutputs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."AssetTransferOutputs_id_seq"', 1, false);


--
-- Name: SnapshotRequests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."SnapshotRequests_id_seq"', 1, false);


--
-- Name: UTXOs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."UTXOs_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

