#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global QOS_MAX_OBJECT_STRING_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global QOS_TRAFFIC_GENERAL_ID_BASE := 4000

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_NOTRAFFIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_BESTEFFORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_CONTROLLEDLOAD := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_GUARANTEED := 3

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_NETWORK_UNAVAILABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_GENERAL_INFORMATION := 5

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_NOCHANGE := 6

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_NONCONFORMING := 9

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_NETWORK_CONTROL := 10

/**
 * @type {Integer (UInt32)}
 */
export global SERVICETYPE_QUALITATIVE := 13

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_BESTEFFORT := 2147549184

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROLLEDLOAD := 2147614720

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_GUARANTEED := 2147745792

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_QUALITATIVE := 2149580800

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_NO_TRAFFIC_CONTROL := 2164260864

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_NO_QOS_SIGNALING := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global QOS_NOT_SPECIFIED := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global POSITIVE_INFINITY_RATE := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global QOS_GENERAL_ID_BASE := 2000

/**
 * @type {Integer (UInt32)}
 */
export global TC_NONCONF_BORROW := 0

/**
 * @type {Integer (UInt32)}
 */
export global TC_NONCONF_SHAPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global TC_NONCONF_DISCARD := 2

/**
 * @type {Integer (UInt32)}
 */
export global TC_NONCONF_BORROW_PLUS := 3

/**
 * @type {Integer (UInt32)}
 */
export global CURRENT_TCI_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global TC_NOTIFY_IFC_UP := 1

/**
 * @type {Integer (UInt32)}
 */
export global TC_NOTIFY_IFC_CLOSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TC_NOTIFY_IFC_CHANGE := 3

/**
 * @type {Integer (UInt32)}
 */
export global TC_NOTIFY_PARAM_CHANGED := 4

/**
 * @type {Integer (UInt32)}
 */
export global TC_NOTIFY_FLOW_CLOSE := 5

/**
 * @type {Integer (UInt32)}
 */
export global MAX_STRING_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global QOS_OUTGOING_DEFAULT_MINIMUM_BANDWIDTH := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global QOS_QUERYFLOW_FRESH := 1

/**
 * @type {Integer (UInt32)}
 */
export global QOS_NON_ADAPTIVE_FLOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global RSVP_OBJECT_ID_BASE := 1000

/**
 * @type {Integer (UInt32)}
 */
export global RSVP_DEFAULT_STYLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global RSVP_WILDCARD_STYLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RSVP_FIXED_FILTER_STYLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RSVP_SHARED_EXPLICIT_STYLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global AD_FLAG_BREAK_BIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global mIOC_IN := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global mIOC_OUT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global mIOC_VENDOR := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global mCOMPANY := 402653184

/**
 * @type {Integer (UInt32)}
 */
export global ioctl_code := 1

/**
 * @type {Integer (UInt32)}
 */
export global QOSSPBASE := 50000

/**
 * @type {Integer (UInt32)}
 */
export global ALLOWED_TO_SEND_DATA := 50001

/**
 * @type {Integer (UInt32)}
 */
export global ABLE_TO_RECV_RSVP := 50002

/**
 * @type {Integer (UInt32)}
 */
export global LINE_RATE := 50003

/**
 * @type {Integer (UInt32)}
 */
export global LOCAL_TRAFFIC_CONTROL := 50004

/**
 * @type {Integer (UInt32)}
 */
export global LOCAL_QOSABILITY := 50005

/**
 * @type {Integer (UInt32)}
 */
export global END_TO_END_QOSABILITY := 50006

/**
 * @type {Integer (UInt32)}
 */
export global INFO_NOT_AVAILABLE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global ANY_DEST_ADDR := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global MODERATELY_DELAY_SENSITIVE := 4294967293

/**
 * @type {Integer (UInt32)}
 */
export global HIGHLY_DELAY_SENSITIVE := 4294967294

/**
 * @type {Integer (UInt32)}
 */
export global QOSSP_ERR_BASE := 56000

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_NO_ERRORCODE := 0

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_NO_ERRORVALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_ERRORCODE_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_ERRORVALUE_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_NET_ADMISSION := 56100

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_NET_POLICY := 56200

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_RSVP := 56300

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_API := 56400

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_KERNEL_TC_SYS := 56500

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_RSVP_SYS := 56600

/**
 * @type {Integer (UInt32)}
 */
export global GQOS_KERNEL_TC := 56700

/**
 * @type {Integer (UInt32)}
 */
export global PE_TYPE_APPID := 3

/**
 * @type {Integer (UInt32)}
 */
export global PE_ATTRIB_TYPE_POLICY_LOCATOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_LOCATOR_SUB_TYPE_ASCII_DN := 1

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_LOCATOR_SUB_TYPE_UNICODE_DN := 2

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_LOCATOR_SUB_TYPE_ASCII_DN_ENC := 3

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_LOCATOR_SUB_TYPE_UNICODE_DN_ENC := 4

/**
 * @type {Integer (UInt32)}
 */
export global PE_ATTRIB_TYPE_CREDENTIAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CREDENTIAL_SUB_TYPE_ASCII_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREDENTIAL_SUB_TYPE_UNICODE_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global CREDENTIAL_SUB_TYPE_KERBEROS_TKT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CREDENTIAL_SUB_TYPE_X509_V3_CERT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CREDENTIAL_SUB_TYPE_PGP_CERT := 5

/**
 * @type {Integer (UInt32)}
 */
export global TCBASE := 7500

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INCOMPATIBLE_TCI_VERSION := 7501

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_SERVICE_TYPE := 7502

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_TOKEN_RATE := 7503

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_PEAK_RATE := 7504

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_SD_MODE := 7505

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_QOS_PRIORITY := 7506

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_TRAFFIC_CLASS := 7507

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_ADDRESS_TYPE := 7508

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DUPLICATE_FILTER := 7509

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FILTER_CONFLICT := 7510

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ADDRESS_TYPE_NOT_SUPPORTED := 7511

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TC_SUPPORTED_OBJECTS_EXIST := 7512

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INCOMPATABLE_QOS := 7513

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TC_NOT_SUPPORTED := 7514

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TC_OBJECT_LENGTH_INVALID := 7515

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_FLOW_MODE := 7516

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_DIFFSERV_FLOW := 7517

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_DS_MAPPING_EXISTS := 7518

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_SHAPE_RATE := 7519

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INVALID_DS_CLASS := 7520

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_TOO_MANY_CLIENTS := 7521

/**
 * @type {Guid}
 */
export global GUID_QOS_REMAINING_BANDWIDTH := Guid("{c4c51720-40ec-11d1-2c91-00aa00574915}")

/**
 * @type {Guid}
 */
export global GUID_QOS_BESTEFFORT_BANDWIDTH := Guid("{ed885290-40ec-11d1-2c91-00aa00574915}")

/**
 * @type {Guid}
 */
export global GUID_QOS_LATENCY := Guid("{fc408ef0-40ec-11d1-2c91-00aa00574915}")

/**
 * @type {Guid}
 */
export global GUID_QOS_FLOW_COUNT := Guid("{1147f880-40ed-11d1-2c91-00aa00574915}")

/**
 * @type {Guid}
 */
export global GUID_QOS_NON_BESTEFFORT_LIMIT := Guid("{185c44e0-40ed-11d1-2c91-00aa00574915}")

/**
 * @type {Guid}
 */
export global GUID_QOS_MAX_OUTSTANDING_SENDS := Guid("{161ffa86-6120-11d1-2c91-00aa00574915}")

/**
 * @type {Guid}
 */
export global GUID_QOS_STATISTICS_BUFFER := Guid("{bb2c0980-e900-11d1-b07e-0080c71382bf}")

/**
 * @type {Guid}
 */
export global GUID_QOS_FLOW_MODE := Guid("{5c82290a-515a-11d2-8e58-00c04fc9bfcb}")

/**
 * @type {Guid}
 */
export global GUID_QOS_ISSLOW_FLOW := Guid("{abf273a4-ee07-11d2-be1b-00a0c99ee63b}")

/**
 * @type {Guid}
 */
export global GUID_QOS_TIMER_RESOLUTION := Guid("{ba10cc88-f13e-11d2-be1b-00a0c99ee63b}")

/**
 * @type {Guid}
 */
export global GUID_QOS_FLOW_IP_CONFORMING := Guid("{07f99a8b-fcd2-11d2-be1e-00a0c99ee63b}")

/**
 * @type {Guid}
 */
export global GUID_QOS_FLOW_IP_NONCONFORMING := Guid("{087a5987-fcd2-11d2-be1e-00a0c99ee63b}")

/**
 * @type {Guid}
 */
export global GUID_QOS_FLOW_8021P_CONFORMING := Guid("{08c1e013-fcd2-11d2-be1e-00a0c99ee63b}")

/**
 * @type {Guid}
 */
export global GUID_QOS_FLOW_8021P_NONCONFORMING := Guid("{09023f91-fcd2-11d2-be1e-00a0c99ee63b}")

/**
 * @type {Guid}
 */
export global GUID_QOS_ENABLE_AVG_STATS := Guid("{bafb6d11-27c4-4801-a46f-ef8080c188c8}")

/**
 * @type {Guid}
 */
export global GUID_QOS_ENABLE_WINDOW_ADJUSTMENT := Guid("{aa966725-d3e9-4c55-b335-2a00279a1e64}")

/**
 * @type {Integer (UInt32)}
 */
export global FSCTL_TCP_BASE := 18

/**
 * @type {String}
 */
export global DD_TCP_DEVICE_NAME := "\Device\Tcp"

/**
 * @type {Integer (UInt32)}
 */
export global IF_MIB_STATS_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global IP_MIB_STATS_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global IP_MIB_ADDRTABLE_ENTRY_ID := 258

/**
 * @type {Integer (UInt32)}
 */
export global IP_INTFC_INFO_ID := 259

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PHYSADDR_SIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_PREBOOT_CERT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_POST_CODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_UNUSED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_NO_ACTION := 3

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_SEPARATOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ACTION := 5

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EVENT_TAG := 6

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_S_CRTM_CONTENTS := 7

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_S_CRTM_VERSION := 8

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_CPU_MICROCODE := 9

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_PLATFORM_CONFIG_FLAGS := 10

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TABLE_OF_DEVICES := 11

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_COMPACT_HASH := 12

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_IPL := 13

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_IPL_PARTITION_DATA := 14

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_NONHOST_CODE := 15

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_NONHOST_CONFIG := 16

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_NONHOST_INFO := 17

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_OMIT_BOOT_DEVICE_EVENTS := 18

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_EVENT_BASE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_VARIABLE_DRIVER_CONFIG := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_VARIABLE_BOOT := 2147483650

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_BOOT_SERVICES_APPLICATION := 2147483651

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_BOOT_SERVICES_DRIVER := 2147483652

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_RUNTIME_SERVICES_DRIVER := 2147483653

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_GPT_EVENT := 2147483654

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_ACTION := 2147483655

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB := 2147483656

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_HANDOFF_TABLES := 2147483657

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB2 := 2147483658

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_HANDOFF_TABLES2 := 2147483659

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_VARIABLE_BOOT2 := 2147483660

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_HCRTM_EVENT := 2147483664

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_VARIABLE_AUTHORITY := 2147483872

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_SPDM_FIRMWARE_BLOB := 2147483873

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_EFI_SPDM_FIRMWARE_CONFIG := 2147483874

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_EVENT_BASE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_PCR_MAPPING := 1025

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_HASH_START := 1026

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_COMBINED_HASH := 1027

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_MLE_HASH := 1028

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_BIOSAC_REG_DATA := 1034

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_CPU_SCRTM_STAT := 1035

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_LCP_CONTROL_HASH := 1036

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_ELEMENTS_HASH := 1037

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_STM_HASH := 1038

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_OSSINITDATA_CAP_HASH := 1039

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_SINIT_PUBKEY_HASH := 1040

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_LCP_HASH := 1041

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_LCP_DETAILS_HASH := 1042

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_LCP_AUTHORITIES_HASH := 1043

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_NV_INFO_HASH := 1044

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_COLD_BOOT_BIOS_HASH := 1045

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_KM_HASH := 1046

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_BPM_HASH := 1047

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_KM_INFO_HASH := 1048

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_BPM_INFO_HASH := 1049

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_BOOT_POL_HASH := 1050

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_RANDOM_VALUE := 1278

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_TXT_CAP_VALUE := 1279

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SL_EVENT_BASE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SL_LOAD := 32769

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SL_PSP_FW_SPLT := 32770

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SL_TSME_RB_FUSE := 32771

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SL_PUB_KEY := 32772

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SL_SVN := 32773

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SL_LOAD_1 := 32774

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SL_SEPARATOR := 32775

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_NO_ACTION := 3

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_BASE_2 := 33280

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SPL_TABLE_ROM := 33281

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_BL_STAGE_1 := 33282

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_KEYDB := 33283

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SPL_TABLE_FW := 33284

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_BL_STAGE_2 := 33285

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_L0_SEC_POL := 33286

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PMFW0 := 33287

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_MP2_CONFIG := 33288

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_MP2_FW := 33289

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_1 := 33290

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_2 := 33291

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_3 := 33292

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_4 := 33293

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_5 := 33294

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_6 := 33295

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_7 := 33296

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_8 := 33297

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_9 := 33298

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_10 := 33299

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_11 := 33300

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_12 := 33301

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_13 := 33302

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_14 := 33303

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_15 := 33304

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_16 := 33305

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_17 := 33306

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_18 := 33307

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_19 := 33308

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_20 := 33309

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_21 := 33310

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_22 := 33311

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_23 := 33312

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_24 := 33313

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_25 := 33314

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_26 := 33315

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_27 := 33316

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_28 := 33317

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_29 := 33318

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_30 := 33319

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_31 := 33320

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_32 := 33321

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_33 := 33322

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_34 := 33323

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_35 := 33324

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_36 := 33325

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_37 := 33326

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_38 := 33327

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_39 := 33328

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_40 := 33329

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_41 := 33330

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_42 := 33331

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_43 := 33332

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_44 := 33333

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_45 := 33334

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_46 := 33335

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_47 := 33336

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_48 := 33337

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_MID_SMU := 33338

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PM_FW1 := 33339

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_1 := 33340

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_2 := 33341

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_3 := 33342

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_4 := 33343

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_5 := 33344

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_6 := 33345

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_7 := 33346

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_8 := 33347

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_9 := 33348

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_VBL_10 := 33349

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_L1_SEC_POL := 33350

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_IP_DISCOVERY := 33351

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SYS_DRV := 33352

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_TOS := 33353

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_TOS_KEYDB := 33354

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_ABL_TOC := 33355

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PMU1_DATA := 33356

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PMU2_DATA := 33357

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PMU1 := 33358

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PMU2 := 33359

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_MPIO_FW := 33360

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_MP5 := 33361

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_MPCCX := 33362

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_GMI3 := 33363

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_TPMLITE := 33364

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_SPIROM_CONFIG := 33365

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB_TOC := 33366

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB0 := 33367

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB1 := 33368

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB2 := 33369

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB3 := 33370

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB4 := 33371

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB5 := 33372

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB6 := 33373

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB7 := 33374

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB8 := 33375

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB9 := 33376

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB10 := 33377

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB11 := 33378

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB12 := 33379

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB13 := 33380

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB14 := 33381

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_DF_RIB15 := 33382

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_SECURE_DEBUG_UNLOCK := 33383

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_BL_END := 33535

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_FTPM_DRV := 33536

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_DRTM_DRV := 33537

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_AGESA_DRV := 33538

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_AMD_PSP_END := 33791

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_BASE := 36864

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_PCR_SCHEMA := 36865

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_DCE := 36866

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_DCE_PUBKEY := 36867

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_DLME := 36868

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_DLME_ENTRY_POINT := 36869

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_DEBUG_CONFIG := 36870

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_NONSECURE_CONFIG := 36871

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_DCE_SECONDARY := 36872

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_TZFW := 36873

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_SEPARATOR := 36874

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_DLME_PUBKEY := 36875

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_DLME_SVN := 36876

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_NO_ACTION := 36877

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEV_ARM_SECURE_INT_DISABLE := 36878

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_NONMEASURED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_AGGREGATION := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_CONTAINER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_INFORMATION := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_ERROR := 196608

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_PREOSPARAMETER := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_OSPARAMETER := 327680

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_AUTHORITY := 393216

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_LOADEDMODULE := 458752

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_TRUSTPOINT := 524288

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_ELAM := 589824

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_VBS := 655360

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_KSR := 720896

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENTTYPE_DRTM := 786432

/**
 * @type {Integer (UInt32)}
 */
export global SIPAERROR_FIRMWAREFAILURE := 196609

/**
 * @type {Integer (UInt32)}
 */
export global SIPAERROR_INTERNALFAILURE := 196611

/**
 * @type {Integer (UInt32)}
 */
export global SIPAERROR_HYPERVISORFAILURE := 196613

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_INFORMATION := 131073

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_BOOTCOUNTER := 131074

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_TRANSFER_CONTROL := 131075

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_APPLICATION_RETURN := 131076

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_BITLOCKER_UNLOCK := 131077

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_EVENTCOUNTER := 131078

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_COUNTERID := 131079

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_MORBIT_NOT_CANCELABLE := 131080

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_APPLICATION_SVN := 131081

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_SVN_CHAIN_STATUS := 131082

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_IDK_GENERATION_STATUS := 131084

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_MORBIT_API_STATUS := 131083

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_BOOTDEBUGGING := 262145

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_BOOT_REVOCATION_LIST := 262146

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_OSKERNELDEBUG := 327681

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_CODEINTEGRITY := 327682

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_TESTSIGNING := 327683

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_DATAEXECUTIONPREVENTION := 327684

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_SAFEMODE := 327685

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_WINPE := 327686

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_PHYSICALADDRESSEXTENSION := 327687

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_OSDEVICE := 327688

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_SYSTEMROOT := 327689

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_HYPERVISOR_LAUNCH_TYPE := 327690

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_HYPERVISOR_PATH := 327691

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_HYPERVISOR_IOMMU_POLICY := 327692

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_HYPERVISOR_DEBUG := 327693

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_DRIVER_LOAD_POLICY := 327694

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_SI_POLICY := 327695

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_HYPERVISOR_MMIO_NX_POLICY := 327696

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_HYPERVISOR_MSR_FILTER_POLICY := 327697

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VSM_LAUNCH_TYPE := 327698

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_OS_REVOCATION_LIST := 327699

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_SMT_STATUS := 327700

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VSM_IDK_INFO := 327712

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_FLIGHTSIGNING := 327713

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_PAGEFILE_ENCRYPTION_ENABLED := 327714

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VSM_IDKS_INFO := 327715

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_HIBERNATION_DISABLED := 327716

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_DUMPS_DISABLED := 327717

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_DUMP_ENCRYPTION_ENABLED := 327718

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_DUMP_ENCRYPTION_KEY_DIGEST := 327719

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_LSAISO_CONFIG := 327720

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_SBCP_INFO := 327721

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_HYPERVISOR_BOOT_DMA_PROTECTION := 327728

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_SI_POLICY_SIGNER := 327729

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_SI_POLICY_UPDATE_SIGNER := 327730

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_REFS_VOLUME_CHECKPOINT_RECORD_CHECKSUM := 327731

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_REFS_ROLLBACK_PROTECTION_FROZEN_VOLUME_CHECKSUM := 327732

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_REFS_ROLLBACK_PROTECTION_USER_PAYLOAD_HASH := 327733

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_REFS_ROLLBACK_PROTECTION_VERIFICATION_SUCCEEDED := 327734

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_REFS_ROLLBACK_PROTECTION_VOLUME_FIRST_EVER_MOUNT := 327735

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VSM_SEALED_SI_POLICY := 327738

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VSM_DRTM_KEYROLL_DETECTED := 327739

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VSM_SRTM_UNSEAL_POLICY := 327740

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VSM_SRTM_ANTI_ROLLBACK_COUNTER := 327741

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VTL1_DUMP_CONFIG := 327744

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_NOAUTHORITY := 393217

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_AUTHORITYPUBKEY := 393218

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_FILEPATH := 458753

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_IMAGESIZE := 458754

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_HASHALGORITHMID := 458755

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_AUTHENTICODEHASH := 458756

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_AUTHORITYISSUER := 458757

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_AUTHORITYSERIAL := 458758

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_IMAGEBASE := 458759

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_AUTHORITYPUBLISHER := 458760

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_AUTHORITYSHA1THUMBPRINT := 458761

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_IMAGEVALIDATED := 458762

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_MODULE_SVN := 458763

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_MODULE_PLUTON := 458764

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_MODULE_ORIGINAL_FILENAME := 458765

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_MODULE_VERSION := 458766

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_PUBLISHER_OEMNAME := 458767

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_ELAM_KEYNAME := 589825

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_ELAM_CONFIGURATION := 589826

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_ELAM_POLICY := 589827

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_ELAM_MEASURED := 589828

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_VSM_REQUIRED := 655361

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_SECUREBOOT_REQUIRED := 655362

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_IOMMU_REQUIRED := 655363

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_MMIO_NX_REQUIRED := 655364

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_MSR_FILTERING_REQUIRED := 655365

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_MANDATORY_ENFORCEMENT := 655366

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_HVCI_POLICY := 655367

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_MICROSOFT_BOOT_CHAIN_REQUIRED := 655368

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_DUMP_USES_AMEROOT := 655369

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_VBS_VSM_NOSECRETS_ENFORCED := 655370

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_KSR_SIGNATURE := 720897

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_DRTM_STATE_AUTH := 786433

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_DRTM_SMM_LEVEL := 786434

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_DRTM_AMD_SMM_HASH := 786435

/**
 * @type {Integer (UInt32)}
 */
export global SIPAEVENT_DRTM_AMD_SMM_SIGNER_KEY := 786436

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_CACHED := 1

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_MEDIA := 2

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_TPM := 4

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_PIN := 16

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_EXTERNAL := 32

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_RECOVERY := 64

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_PASSPHRASE := 128

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_NBP := 256

/**
 * @type {Integer (UInt32)}
 */
export global FVEB_UNLOCK_FLAG_AUK_OSFVEINFO := 512

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_BLOCKIO_HARDDISK := 65537

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_BLOCKIO_REMOVABLEDISK := 65538

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_BLOCKIO_CDROM := 65539

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_BLOCKIO_PARTITION := 65540

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_BLOCKIO_FILE := 65541

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_BLOCKIO_RAMDISK := 65542

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_BLOCKIO_VIRTUALHARDDISK := 65543

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_SERIAL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_UDP := 196608

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_VMBUS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_COMPOSITE := 327680

/**
 * @type {Integer (UInt32)}
 */
export global OSDEVICE_TYPE_CIMFS := 393216

/**
 * @type {Integer (UInt32)}
 */
export global SIPAHDRSIGNATURE := 1279476311

/**
 * @type {Integer (UInt32)}
 */
export global SIPALOGVERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SIPAKSRHDRSIGNATURE := 1297240907

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_ID_SHA_1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_ID_SHA_2_256 := 11

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_ID_SHA_2_384 := 12

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_ID_SHA_2_512 := 13

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_ID_SM3_256 := 18

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_ID_SHA3_256 := 39

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_ID_SHA3_384 := 40

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_ID_SHA3_512 := 41

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_BITMAP_SHA_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_BITMAP_SHA_2_256 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_BITMAP_SHA_2_384 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_BITMAP_SHA_2_512 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_BITMAP_SM3_256 := 16

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_BITMAP_SHA3_256 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_BITMAP_SHA3_384 := 64

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_DIGEST_ALG_BITMAP_SHA3_512 := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PLUTON_UPGRADE_FILENAME_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_MAX_PLUTON_UPGRADE_HASH_LEN := 64

/**
 * @type {Integer (UInt32)}
 */
export global WBCL_HASH_LEN_SHA1 := 20
;@endregion Constants
