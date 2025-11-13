#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QoS {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_MAX_OBJECT_STRING_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_TRAFFIC_GENERAL_ID_BASE => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NOTRAFFIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_BESTEFFORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_CONTROLLEDLOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_GUARANTEED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NETWORK_UNAVAILABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_GENERAL_INFORMATION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NOCHANGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NONCONFORMING => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_NETWORK_CONTROL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICETYPE_QUALITATIVE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_BESTEFFORT => 2147549184

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROLLEDLOAD => 2147614720

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_GUARANTEED => 2147745792

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_QUALITATIVE => 2149580800

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NO_TRAFFIC_CONTROL => 2164260864

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NO_QOS_SIGNALING => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_NOT_SPECIFIED => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static POSITIVE_INFINITY_RATE => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_GENERAL_ID_BASE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NONCONF_BORROW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NONCONF_SHAPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NONCONF_DISCARD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NONCONF_BORROW_PLUS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CURRENT_TCI_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_IFC_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_IFC_CLOSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_IFC_CHANGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_PARAM_CHANGED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TC_NOTIFY_FLOW_CLOSE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_STRING_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_OUTGOING_DEFAULT_MINIMUM_BANDWIDTH => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_QUERYFLOW_FRESH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QOS_NON_ADAPTIVE_FLOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_OBJECT_ID_BASE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_DEFAULT_STYLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_WILDCARD_STYLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_FIXED_FILTER_STYLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RSVP_SHARED_EXPLICIT_STYLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static AD_FLAG_BREAK_BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static mIOC_IN => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static mIOC_OUT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static mIOC_VENDOR => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static mCOMPANY => 402653184

    /**
     * @type {Integer (UInt32)}
     */
    static ioctl_code => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QOSSPBASE => 50000

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOWED_TO_SEND_DATA => 50001

    /**
     * @type {Integer (UInt32)}
     */
    static ABLE_TO_RECV_RSVP => 50002

    /**
     * @type {Integer (UInt32)}
     */
    static LINE_RATE => 50003

    /**
     * @type {Integer (UInt32)}
     */
    static LOCAL_TRAFFIC_CONTROL => 50004

    /**
     * @type {Integer (UInt32)}
     */
    static LOCAL_QOSABILITY => 50005

    /**
     * @type {Integer (UInt32)}
     */
    static END_TO_END_QOSABILITY => 50006

    /**
     * @type {Integer (UInt32)}
     */
    static INFO_NOT_AVAILABLE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static ANY_DEST_ADDR => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MODERATELY_DELAY_SENSITIVE => 4294967293

    /**
     * @type {Integer (UInt32)}
     */
    static HIGHLY_DELAY_SENSITIVE => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static QOSSP_ERR_BASE => 56000

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_NO_ERRORCODE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_NO_ERRORVALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_ERRORCODE_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_ERRORVALUE_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_NET_ADMISSION => 56100

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_NET_POLICY => 56200

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_RSVP => 56300

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_API => 56400

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_KERNEL_TC_SYS => 56500

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_RSVP_SYS => 56600

    /**
     * @type {Integer (UInt32)}
     */
    static GQOS_KERNEL_TC => 56700

    /**
     * @type {Integer (UInt32)}
     */
    static PE_TYPE_APPID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PE_ATTRIB_TYPE_POLICY_LOCATOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_LOCATOR_SUB_TYPE_ASCII_DN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_LOCATOR_SUB_TYPE_UNICODE_DN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_LOCATOR_SUB_TYPE_ASCII_DN_ENC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_LOCATOR_SUB_TYPE_UNICODE_DN_ENC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PE_ATTRIB_TYPE_CREDENTIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_ASCII_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_UNICODE_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_KERBEROS_TKT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_X509_V3_CERT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CREDENTIAL_SUB_TYPE_PGP_CERT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TCBASE => 7500

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCOMPATIBLE_TCI_VERSION => 7501

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SERVICE_TYPE => 7502

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TOKEN_RATE => 7503

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PEAK_RATE => 7504

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SD_MODE => 7505

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_QOS_PRIORITY => 7506

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TRAFFIC_CLASS => 7507

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ADDRESS_TYPE => 7508

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DUPLICATE_FILTER => 7509

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILTER_CONFLICT => 7510

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ADDRESS_TYPE_NOT_SUPPORTED => 7511

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TC_SUPPORTED_OBJECTS_EXIST => 7512

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCOMPATABLE_QOS => 7513

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TC_NOT_SUPPORTED => 7514

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TC_OBJECT_LENGTH_INVALID => 7515

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FLOW_MODE => 7516

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DIFFSERV_FLOW => 7517

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MAPPING_EXISTS => 7518

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SHAPE_RATE => 7519

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DS_CLASS => 7520

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_CLIENTS => 7521

    /**
     * @type {Guid}
     */
    static GUID_QOS_REMAINING_BANDWIDTH => Guid("{c4c51720-40ec-11d1-2c91-00aa00574915}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_BESTEFFORT_BANDWIDTH => Guid("{ed885290-40ec-11d1-2c91-00aa00574915}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_LATENCY => Guid("{fc408ef0-40ec-11d1-2c91-00aa00574915}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_FLOW_COUNT => Guid("{1147f880-40ed-11d1-2c91-00aa00574915}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_NON_BESTEFFORT_LIMIT => Guid("{185c44e0-40ed-11d1-2c91-00aa00574915}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_MAX_OUTSTANDING_SENDS => Guid("{161ffa86-6120-11d1-2c91-00aa00574915}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_STATISTICS_BUFFER => Guid("{bb2c0980-e900-11d1-b07e-0080c71382bf}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_FLOW_MODE => Guid("{5c82290a-515a-11d2-8e58-00c04fc9bfcb}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_ISSLOW_FLOW => Guid("{abf273a4-ee07-11d2-be1b-00a0c99ee63b}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_TIMER_RESOLUTION => Guid("{ba10cc88-f13e-11d2-be1b-00a0c99ee63b}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_FLOW_IP_CONFORMING => Guid("{07f99a8b-fcd2-11d2-be1e-00a0c99ee63b}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_FLOW_IP_NONCONFORMING => Guid("{087a5987-fcd2-11d2-be1e-00a0c99ee63b}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_FLOW_8021P_CONFORMING => Guid("{08c1e013-fcd2-11d2-be1e-00a0c99ee63b}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_FLOW_8021P_NONCONFORMING => Guid("{09023f91-fcd2-11d2-be1e-00a0c99ee63b}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_ENABLE_AVG_STATS => Guid("{bafb6d11-27c4-4801-a46f-ef8080c188c8}")

    /**
     * @type {Guid}
     */
    static GUID_QOS_ENABLE_WINDOW_ADJUSTMENT => Guid("{aa966725-d3e9-4c55-b335-2a00279a1e64}")

    /**
     * @type {Integer (UInt32)}
     */
    static FSCTL_TCP_BASE => 18

    /**
     * @type {String}
     */
    static DD_TCP_DEVICE_NAME => "\Device\Tcp"

    /**
     * @type {Integer (UInt32)}
     */
    static IF_MIB_STATS_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MIB_STATS_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IP_MIB_ADDRTABLE_ENTRY_ID => 258

    /**
     * @type {Integer (UInt32)}
     */
    static IP_INTFC_INFO_ID => 259

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PHYSADDR_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_PREBOOT_CERT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_POST_CODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_UNUSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_NO_ACTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_SEPARATOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_ACTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EVENT_TAG => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_S_CRTM_CONTENTS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_S_CRTM_VERSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_CPU_MICROCODE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_PLATFORM_CONFIG_FLAGS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TABLE_OF_DEVICES => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_COMPACT_HASH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_IPL => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_IPL_PARTITION_DATA => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_NONHOST_CODE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_NONHOST_CONFIG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_NONHOST_INFO => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_OMIT_BOOT_DEVICE_EVENTS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_EVENT_BASE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_VARIABLE_DRIVER_CONFIG => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_VARIABLE_BOOT => 2147483650

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_BOOT_SERVICES_APPLICATION => 2147483651

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_BOOT_SERVICES_DRIVER => 2147483652

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_RUNTIME_SERVICES_DRIVER => 2147483653

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_GPT_EVENT => 2147483654

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_ACTION => 2147483655

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB => 2147483656

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_HANDOFF_TABLES => 2147483657

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_PLATFORM_FIRMWARE_BLOB2 => 2147483658

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_HANDOFF_TABLES2 => 2147483659

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_VARIABLE_BOOT2 => 2147483660

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_HCRTM_EVENT => 2147483664

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_VARIABLE_AUTHORITY => 2147483872

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_SPDM_FIRMWARE_BLOB => 2147483873

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_EFI_SPDM_FIRMWARE_CONFIG => 2147483874

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_EVENT_BASE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_PCR_MAPPING => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_HASH_START => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_COMBINED_HASH => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_MLE_HASH => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_BIOSAC_REG_DATA => 1034

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_CPU_SCRTM_STAT => 1035

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_LCP_CONTROL_HASH => 1036

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_ELEMENTS_HASH => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_STM_HASH => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_OSSINITDATA_CAP_HASH => 1039

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_SINIT_PUBKEY_HASH => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_LCP_HASH => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_LCP_DETAILS_HASH => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_LCP_AUTHORITIES_HASH => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_NV_INFO_HASH => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_COLD_BOOT_BIOS_HASH => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_KM_HASH => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_BPM_HASH => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_KM_INFO_HASH => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_BPM_INFO_HASH => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_BOOT_POL_HASH => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_RANDOM_VALUE => 1278

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_TXT_CAP_VALUE => 1279

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_EVENT_BASE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_LOAD => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_PSP_FW_SPLT => 32770

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_TSME_RB_FUSE => 32771

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_PUB_KEY => 32772

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_SVN => 32773

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_LOAD_1 => 32774

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SL_SEPARATOR => 32775

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_NO_ACTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_BASE_2 => 33280

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SPL_TABLE_ROM => 33281

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_BL_STAGE_1 => 33282

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_KEYDB => 33283

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SPL_TABLE_FW => 33284

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_BL_STAGE_2 => 33285

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_L0_SEC_POL => 33286

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PMFW0 => 33287

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_MP2_CONFIG => 33288

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_MP2_FW => 33289

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_1 => 33290

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_2 => 33291

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_3 => 33292

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_4 => 33293

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_5 => 33294

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_6 => 33295

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_7 => 33296

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_8 => 33297

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_9 => 33298

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_10 => 33299

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_11 => 33300

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_12 => 33301

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_13 => 33302

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_14 => 33303

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_15 => 33304

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_16 => 33305

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_17 => 33306

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_18 => 33307

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_19 => 33308

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_20 => 33309

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_21 => 33310

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_22 => 33311

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_23 => 33312

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_24 => 33313

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_25 => 33314

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_26 => 33315

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_27 => 33316

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_28 => 33317

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_29 => 33318

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_30 => 33319

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_31 => 33320

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_32 => 33321

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_33 => 33322

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_34 => 33323

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_35 => 33324

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_36 => 33325

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_37 => 33326

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_38 => 33327

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_39 => 33328

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_40 => 33329

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_41 => 33330

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_42 => 33331

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_43 => 33332

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_44 => 33333

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_45 => 33334

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_46 => 33335

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_47 => 33336

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_48 => 33337

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_MID_SMU => 33338

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PM_FW1 => 33339

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_1 => 33340

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_2 => 33341

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_3 => 33342

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_4 => 33343

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_5 => 33344

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_6 => 33345

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_7 => 33346

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_8 => 33347

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_9 => 33348

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_VBL_10 => 33349

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_L1_SEC_POL => 33350

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_IP_DISCOVERY => 33351

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SYS_DRV => 33352

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_TOS => 33353

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_TOS_KEYDB => 33354

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_ABL_TOC => 33355

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PMU1_DATA => 33356

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PMU2_DATA => 33357

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PMU1 => 33358

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PMU2 => 33359

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_MPIO_FW => 33360

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_MP5 => 33361

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_MPCCX => 33362

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_GMI3 => 33363

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_TPMLITE => 33364

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_SPIROM_CONFIG => 33365

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB_TOC => 33366

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB0 => 33367

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB1 => 33368

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB2 => 33369

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB3 => 33370

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB4 => 33371

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB5 => 33372

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB6 => 33373

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB7 => 33374

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB8 => 33375

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB9 => 33376

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB10 => 33377

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB11 => 33378

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB12 => 33379

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB13 => 33380

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB14 => 33381

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_DF_RIB15 => 33382

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_SECURE_DEBUG_UNLOCK => 33383

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_BL_END => 33535

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_FTPM_DRV => 33536

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_DRTM_DRV => 33537

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_AGESA_DRV => 33538

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEV_AMD_PSP_END => 33791

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_NONMEASURED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_AGGREGATION => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_CONTAINER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_INFORMATION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_ERROR => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_PREOSPARAMETER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_OSPARAMETER => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_AUTHORITY => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_LOADEDMODULE => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_TRUSTPOINT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_ELAM => 589824

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_VBS => 655360

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_KSR => 720896

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENTTYPE_DRTM => 786432

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAERROR_FIRMWAREFAILURE => 196609

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAERROR_INTERNALFAILURE => 196611

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAERROR_HYPERVISORFAILURE => 196613

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_INFORMATION => 131073

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_BOOTCOUNTER => 131074

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_TRANSFER_CONTROL => 131075

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_APPLICATION_RETURN => 131076

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_BITLOCKER_UNLOCK => 131077

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_EVENTCOUNTER => 131078

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_COUNTERID => 131079

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_MORBIT_NOT_CANCELABLE => 131080

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_APPLICATION_SVN => 131081

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SVN_CHAIN_STATUS => 131082

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_MORBIT_API_STATUS => 131083

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_BOOTDEBUGGING => 262145

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_BOOT_REVOCATION_LIST => 262146

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_OSKERNELDEBUG => 327681

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_CODEINTEGRITY => 327682

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_TESTSIGNING => 327683

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DATAEXECUTIONPREVENTION => 327684

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SAFEMODE => 327685

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_WINPE => 327686

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_PHYSICALADDRESSEXTENSION => 327687

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_OSDEVICE => 327688

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SYSTEMROOT => 327689

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_LAUNCH_TYPE => 327690

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_PATH => 327691

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_IOMMU_POLICY => 327692

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_DEBUG => 327693

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRIVER_LOAD_POLICY => 327694

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SI_POLICY => 327695

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_MMIO_NX_POLICY => 327696

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_MSR_FILTER_POLICY => 327697

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_LAUNCH_TYPE => 327698

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_OS_REVOCATION_LIST => 327699

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SMT_STATUS => 327700

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_IDK_INFO => 327712

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_FLIGHTSIGNING => 327713

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_PAGEFILE_ENCRYPTION_ENABLED => 327714

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_IDKS_INFO => 327715

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HIBERNATION_DISABLED => 327716

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DUMPS_DISABLED => 327717

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DUMP_ENCRYPTION_ENABLED => 327718

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DUMP_ENCRYPTION_KEY_DIGEST => 327719

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_LSAISO_CONFIG => 327720

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SBCP_INFO => 327721

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HYPERVISOR_BOOT_DMA_PROTECTION => 327728

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SI_POLICY_SIGNER => 327729

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_SI_POLICY_UPDATE_SIGNER => 327730

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_REFS_VOLUME_CHECKPOINT_RECORD_CHECKSUM => 327731

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_REFS_ROLLBACK_PROTECTION_FROZEN_VOLUME_CHECKSUM => 327732

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_REFS_ROLLBACK_PROTECTION_USER_PAYLOAD_HASH => 327733

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_REFS_ROLLBACK_PROTECTION_VERIFICATION_SUCCEEDED => 327734

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_REFS_ROLLBACK_PROTECTION_VOLUME_FIRST_EVER_MOUNT => 327735

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_SEALED_SI_POLICY => 327738

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_DRTM_KEYROLL_DETECTED => 327739

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_SRTM_UNSEAL_POLICY => 327740

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VSM_SRTM_ANTI_ROLLBACK_COUNTER => 327741

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VTL1_DUMP_CONFIG => 327744

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_NOAUTHORITY => 393217

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYPUBKEY => 393218

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_FILEPATH => 458753

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_IMAGESIZE => 458754

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_HASHALGORITHMID => 458755

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHENTICODEHASH => 458756

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYISSUER => 458757

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYSERIAL => 458758

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_IMAGEBASE => 458759

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYPUBLISHER => 458760

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_AUTHORITYSHA1THUMBPRINT => 458761

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_IMAGEVALIDATED => 458762

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_MODULE_SVN => 458763

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_MODULE_PLUTON => 458764

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_ELAM_KEYNAME => 589825

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_ELAM_CONFIGURATION => 589826

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_ELAM_POLICY => 589827

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_ELAM_MEASURED => 589828

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_VSM_REQUIRED => 655361

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_SECUREBOOT_REQUIRED => 655362

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_IOMMU_REQUIRED => 655363

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_MMIO_NX_REQUIRED => 655364

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_MSR_FILTERING_REQUIRED => 655365

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_MANDATORY_ENFORCEMENT => 655366

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_HVCI_POLICY => 655367

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_MICROSOFT_BOOT_CHAIN_REQUIRED => 655368

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_DUMP_USES_AMEROOT => 655369

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_VBS_VSM_NOSECRETS_ENFORCED => 655370

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_KSR_SIGNATURE => 720897

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRTM_STATE_AUTH => 786433

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRTM_SMM_LEVEL => 786434

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRTM_AMD_SMM_HASH => 786435

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAEVENT_DRTM_AMD_SMM_SIGNER_KEY => 786436

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_CACHED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_MEDIA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_TPM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_PIN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_EXTERNAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_RECOVERY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_PASSPHRASE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_NBP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FVEB_UNLOCK_FLAG_AUK_OSFVEINFO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_HARDDISK => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_REMOVABLEDISK => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_CDROM => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_PARTITION => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_FILE => 65541

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_RAMDISK => 65542

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_BLOCKIO_VIRTUALHARDDISK => 65543

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_SERIAL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_UDP => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_VMBUS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_COMPOSITE => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static OSDEVICE_TYPE_CIMFS => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAHDRSIGNATURE => 1279476311

    /**
     * @type {Integer (UInt32)}
     */
    static SIPALOGVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIPAKSRHDRSIGNATURE => 1297240907

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA_1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA_2_256 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA_2_384 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA_2_512 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SM3_256 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA3_256 => 39

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA3_384 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_ID_SHA3_512 => 41

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA_2_256 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA_2_384 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA_2_512 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SM3_256 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA3_256 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA3_384 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_DIGEST_ALG_BITMAP_SHA3_512 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PLUTON_UPGRADE_FILENAME_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_MAX_PLUTON_UPGRADE_HASH_LEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WBCL_HASH_LEN_SHA1 => 20
;@endregion Constants

;@region Methods
    /**
     * This function initializes the QOS subsystem and the QOSHandle parameter. The QOSHandle parameter is used when calling other QOS functions. QOSCreateHandle must be called before any other functions.
     * @param {Pointer<QOS_VERSION>} Version Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_version">QOS_VERSION</a> structure that indicates the version of QOS being used.  The <b>MajorVersion</b> member must be set to 1, and the <b>MinorVersion</b> member must be set to 0.
     * @param {Pointer<HANDLE>} QOSHandle Pointer to a variable that receives a QOS handle.  This handle is used when calling other QOS functions.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GEN_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal logic error.  Initialization failed.  For example, if the host goes into sleep or standby mode, all existing handles and flows are rendered invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resource required by the service is unavailable.  This error may be returned if the user has not enabled the firewall exception for the qWAVE service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DEPENDENCY_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the dependencies of this service is unavailable.  The qWAVE service could not be started.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qoscreatehandle
     * @since windows6.0.6000
     */
    static QOSCreateHandle(Version, QOSHandle) {
        result := DllCall("qwave.dll\QOSCreateHandle", "ptr", Version, "ptr", QOSHandle, "int")
        return result
    }

    /**
     * The QOSCloseHandle function closes a handle returned by the QOSCreateHandle function.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qosclosehandle
     * @since windows6.0.6000
     */
    static QOSCloseHandle(QOSHandle) {
        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle

        result := DllCall("qwave.dll\QOSCloseHandle", "ptr", QOSHandle, "int")
        return result
    }

    /**
     * The QOSStartTrackingClient function notifies the QOS subsystem of the existence of a new client.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer<SOCKADDR>} DestAddr A pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the IP address of the client device.  Clients are identified by their IP address and address family.  Any port number specified in the sockaddr structure will be ignored.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>DestAddr</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qosstarttrackingclient
     * @since windows6.0.6000
     */
    static QOSStartTrackingClient(QOSHandle, DestAddr) {
        static Flags := 0 ;Reserved parameters must always be NULL

        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle

        result := DllCall("qwave.dll\QOSStartTrackingClient", "ptr", QOSHandle, "ptr", DestAddr, "uint", Flags, "int")
        return result
    }

    /**
     * The QOSStopTrackingClient function notifies the QoS subsystem to stop tracking a client that has previously used the QOSStartTrackingClient function. If a flow is currently in progress, this function will not affect it.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer<SOCKADDR>} DestAddr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the IP address of the client device.  Clients are identified by their IP address and address family.  A port number is not required and will be ignored.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>DestAddr</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qosstoptrackingclient
     * @since windows6.0.6000
     */
    static QOSStopTrackingClient(QOSHandle, DestAddr) {
        static Flags := 0 ;Reserved parameters must always be NULL

        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle

        result := DllCall("qwave.dll\QOSStopTrackingClient", "ptr", QOSHandle, "ptr", DestAddr, "uint", Flags, "int")
        return result
    }

    /**
     * Enumerates all existing flows.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer<Integer>} Size Indicates the size of the <i>Buffer</i> parameter, in bytes.
     * 
     * On function return, if successful, this parameter will specify the number of bytes copied into <i>Buffer</i>.
     * 
     * If this call fails with <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter will indicate the minimum required <i>Buffer</i> size in order to successfully complete this operation.
     * @param {Pointer} Buffer Pointer to an array of <b>QOS_FlowId</b> flow identifiers. A <b>QOS_FlowId</b> is an unsigned 32-bit integer.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffer is too small.  On output, <i>Size</i> will contain the minimum required buffer size. This function should then be called again with a buffer of the indicated size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>DestAddr</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qosenumerateflows
     * @since windows6.0.6000
     */
    static QOSEnumerateFlows(QOSHandle, Size, Buffer) {
        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle

        SizeMarshal := Size is VarRef ? "uint*" : "ptr"

        result := DllCall("qwave.dll\QOSEnumerateFlows", "ptr", QOSHandle, SizeMarshal, Size, "ptr", Buffer, "int")
        return result
    }

    /**
     * Adds a new flow for traffic.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {SOCKET} Socket Identifies the socket that the application will use to flow traffic.
     * @param {Pointer<SOCKADDR>} DestAddr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the destination IP address to which the application will send traffic.  The sockaddr structure must specify a destination port.
     * 
     * <div class="alert"><b>Note</b>  <i>DestAddr</i> is optional if the socket is already connected. If this parameter is specified, the remote IP address and port must match those used in the socket's connect call.<p class="note">If the socket is not connected, this parameter must be specified.  If the socket is already connected, this parameter does not need to be specified.  In this case, if the parameter is still specified, the destination host and port must match what was specified during the socket connect call.
     * 
     * <p class="note">Since, under TCP, the socket connect call can be delayed, <b>QOSAddSocketToFlow</b> can be called before a connection is established, passing in the remote system's IP address and port number in the <i>DestAddr</i> parameter.
     * 
     * </div>
     * <div> </div>
     * @param {Integer} TrafficType A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_traffic_type">QOS_TRAFFIC_TYPE</a> constant that specifies the type of traffic for which this flow will be used.
     * @param {Integer} Flags Optional flag values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOS_NON_ADAPTIVE_FLOW"></a><a id="qos_non_adaptive_flow"></a><dl>
     * <dt><b>QOS_NON_ADAPTIVE_FLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If specified, the QoS subsystem will not gather data about the network path for this flow.  As a result, functions which rely on bandwidth estimation techniques will not be available.  For example, this would block <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosqueryflow">QOSQueryFlow</a> with an <i>Operation</i> value  of <b>QOSQueryFlowFundamentals</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosnotifyflow">QOSNotifyFlow</a> with an <i>Operation</i> value of <b>QOSNotifyCongested</b>, <b>QOSNotifyUncongested</b>, and <b>QOSNotifyAvailable</b>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} FlowId Pointer to a buffer that receives a flow identifier. On input, this value must be 0.  On output, the buffer contains a flow identifier if the call succeeds.  
     * 
     * If a socket is being added to an existing flow, this parameter will be the identifier of that flow.
     * 
     * An application can make use of this parameter if multiple sockets used can share the same QoS flow properties.  The QoS subsystem, then does not have to incur the overhead of provisioning new flows for subsequent sockets with the same properties.  Note that only non-adaptive flows can have multiple sockets attached to an existing flow.  
     * 
     * A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CONNECTION_REFUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote system refused the network connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter is invalid.
     * 
     * <div class="alert"><b>Note</b>  This value is also returned if a IPv4/v6 mixed address was supplied through the <i>DestAddr</i> parameter.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qosaddsockettoflow
     * @since windows6.0.6000
     */
    static QOSAddSocketToFlow(QOSHandle, Socket, DestAddr, TrafficType, Flags, FlowId) {
        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle
        Socket := Socket is Win32Handle ? NumGet(Socket, "ptr") : Socket

        FlowIdMarshal := FlowId is VarRef ? "uint*" : "ptr"

        result := DllCall("qwave.dll\QOSAddSocketToFlow", "ptr", QOSHandle, "ptr", Socket, "ptr", DestAddr, "int", TrafficType, "uint", Flags, FlowIdMarshal, FlowId, "int")
        return result
    }

    /**
     * Notifies the QOS subsystem that a previously added flow has been terminated.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {SOCKET} Socket Socket to be removed from the flow.
     * 
     * Only flows created with the <b>QOS_NON_ADAPTIVE_FLOW</b> flag may have multiple sockets added to the same flow.  By passing the <i>Socket</i> parameter in this call, each socket can be removed individually.  If the <i>Socket</i> parameter is not passed, the entire flow will be destroyed.  If only one socket was attached to the flow, passing this socket as a parameter to this function and passing <b>NULL</b> as a socket are equivalent calls.
     * @param {Integer} FlowId A flow identifier. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient system resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request was blocked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qosremovesocketfromflow
     * @since windows6.0.6000
     */
    static QOSRemoveSocketFromFlow(QOSHandle, Socket, FlowId) {
        static Flags := 0 ;Reserved parameters must always be NULL

        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle
        Socket := Socket is Win32Handle ? NumGet(Socket, "ptr") : Socket

        result := DllCall("qwave.dll\QOSRemoveSocketFromFlow", "ptr", QOSHandle, "ptr", Socket, "uint", FlowId, "uint", Flags, "int")
        return result
    }

    /**
     * Is called by an application to request the QOS subsystem to prioritize the application's packets and change the flow traffic.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Integer} FlowId A flow identifier. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @param {Integer} Operation A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_set_flow">QOS_SET_FLOW</a> enumerated type that identifies what will be changed in the flow.  This parameter specifies what structure the <i>Buffer</i> will contain.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSSetTrafficType"></a><a id="qossettraffictype"></a><a id="QOSSETTRAFFICTYPE"></a><dl>
     * <dt><b>QOSSetTrafficType</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The traffic type of the flow will be changed.  The <i>Buffer</i> will contain a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_traffic_type">QOS_TRAFFIC_TYPE</a> constant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSSetOutgoingRate"></a><a id="qossetoutgoingrate"></a><a id="QOSSETOUTGOINGRATE"></a><dl>
     * <dt><b>QOSSetOutgoingRate</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow rate will be changed. The <i>Buffer</i> will contain a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_flowrate_outgoing">QOS_FLOWRATE_OUTGOING</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSSetOutgoingDSCPValue"></a><a id="qossetoutgoingdscpvalue"></a><a id="QOSSETOUTGOINGDSCPVALUE"></a><dl>
     * <dt><b>QOSSetOutgoingDSCPValue</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows 7, Windows Server 2008 R2, and later: The outgoing DSCP value will be changed. The <i>Buffer</i> will contain a pointer to a <b>DWORD</b> value that defines the arbitrary DSCP value.
     * 
     * <div class="alert"><b>Note</b>  This setting requires the calling application be a member of the Administrators or the  Network Configuration Operators group.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Size The size of the <i>Buffer</i> parameter, in bytes.
     * @param {Pointer} Buffer Pointer to the structure specified by the value of the <i>Operation</i> parameter.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an OVERLAPPED structure used for asynchronous output.  This must be set to <b>NULL</b> if this function is not being called asynchronously.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QoS subsystem is currently configured by policy to not allow this operation on the network path between this host and the destination host.  For example, the default policy prevents qWAVE experiments from running to off-link destinations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The update flow request was successfully received.  Results will be returned during overlapped completion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have sufficient privileges for the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NETWORK_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested flow properties were not available on this path.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter specified cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation being performed requires information that the QoS subsystem does not have.  Obtaining this information on this network is currently not supported.  For example, bandwidth estimations cannot be obtained on a network path where the destination host is off-link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently insufficient data about networking conditions to answer the query.  This is typically a transient state where qWAVE has erred on the side of caution as it awaits more data before ascertaining the state of the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNEXP_NET_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection with the remote host failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qossetflow
     * @since windows6.0.6000
     */
    static QOSSetFlow(QOSHandle, FlowId, Operation, Size, Buffer, Overlapped) {
        static Flags := 0 ;Reserved parameters must always be NULL

        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle

        result := DllCall("qwave.dll\QOSSetFlow", "ptr", QOSHandle, "uint", FlowId, "int", Operation, "uint", Size, "ptr", Buffer, "uint", Flags, "ptr", Overlapped, "int")
        return result
    }

    /**
     * Requests information about a specific flow.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Integer} FlowId Specifies a flow identifier. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @param {Integer} Operation Specifies which type of flow information is being queried. This parameter specifies what structure the <i>Buffer</i> will contain.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSQueryFlowFundamentals"></a><a id="qosqueryflowfundamentals"></a><a id="QOSQUERYFLOWFUNDAMENTALS"></a><dl>
     * <dt><b>QOSQueryFlowFundamentals</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>Buffer</i> will contain a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_flow_fundamentals">QOS_FLOW_FUNDAMENTALS</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSQueryPacketPriority"></a><a id="qosquerypacketpriority"></a><a id="QOSQUERYPACKETPRIORITY"></a><dl>
     * <dt><b>QOSQueryPacketPriority</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>Buffer</i> will contain a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_packet_priority">QOS_PACKET_PRIORITY</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOSQueryOutgoingRate"></a><a id="qosqueryoutgoingrate"></a><a id="QOSQUERYOUTGOINGRATE"></a><dl>
     * <dt><b>QOSQueryOutgoingRate</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>Buffer</i> will contain a <b>UINT64</b> value that indicates the flow rate specified when requesting the contract, in bits per second.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} Size Indicates the size of the <i>Buffer</i> parameter, in bytes.
     * 
     * On function return, if successful, this parameter will specify the number of bytes copied into <i>Buffer</i>.
     * 
     * If this call fails with <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter will indicate the minimum required <i>Buffer</i> size in order to successfully complete this operation.
     * @param {Pointer} Buffer Pointer to the structure specified by the value of the <i>Operation</i> parameter.
     * @param {Integer} Flags Flags pertaining to the data being returned.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QOS_QUERYFLOW_FRESH"></a><a id="qos_queryflow_fresh"></a><dl>
     * <dt><b>QOS_QUERYFLOW_FRESH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QOS subsystem will only return fresh, not cached,  data.  If fresh data is unavailable, it will try to obtain such data, at the expense of possibly taking more time.  If this is not possible, the call will fail with the error code <b>ERROR_RETRY</b>.
     * 
     * This flag is only applicable when the <i>Operation</i> parameter is set to <b>QOSQueryFlowFundamentals</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an OVERLAPPED structure used for asynchronous output. This must be set to <b>NULL</b> if this function is not being called asynchronously.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QoS subsystem is currently configured by policy to not allow this operation on the network path between this host and the destination host.  For example, the default policy prevents qWAVE experiments from running to off-link destinations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request to the QOS subsystem timed out before enough useful information could be gathered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer length as specified by the <b>Size</b> parameter is not sufficient for the queried data.  The <b>Size</b> parameter now contains the minimum required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter or <i>Buffer</i> size is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid <i>FlowId</i> specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation being performed requires information that the QoS subsystem does not have.  Obtaining this information on this network is currently not supported.  For example, bandwidth estimations cannot be obtained on a network path where the destination host is off-link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the update flow request was successfully initiated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The is no valid data to be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is currently insufficient data about networking conditions to answer the query.  This is typically a transient state where qWAVE has erred on the side of caution as it awaits more data before ascertaining the state of the network.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qosqueryflow
     * @since windows6.0.6000
     */
    static QOSQueryFlow(QOSHandle, FlowId, Operation, Size, Buffer, Flags, Overlapped) {
        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle

        SizeMarshal := Size is VarRef ? "uint*" : "ptr"

        result := DllCall("qwave.dll\QOSQueryFlow", "ptr", QOSHandle, "uint", FlowId, "int", Operation, SizeMarshal, Size, "ptr", Buffer, "uint", Flags, "ptr", Overlapped, "int")
        return result
    }

    /**
     * Registers the calling application to receive a notification.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Integer} FlowId Specifies the flow identifier from which the application wishes to receive notifications. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
     * @param {Integer} Operation A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_notify_flow">QOS_NOTIFY_FLOW</a> value that indicates what the type of  notification being requested.
     * @param {Pointer<Integer>} Size Indicates the size of the <i>Buffer</i> parameter, in bytes.
     * 
     * On function return, if successful, this parameter will specify the number of bytes copied into <i>Buffer</i>.
     * 
     * If this call fails with <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter will indicate the minimum required <i>Buffer</i> size in order to successfully complete this operation.
     * @param {Pointer} Buffer Pointer to a UINT64 that indicates the bandwidth at which point a notification will be sent.  This parameter is only used if the <i>Operation</i> parameter is set to <b>QOSNotifyAvailable</b>. For the <b>QOSNotifyCongested</b> and <b>QOSNotifyUncongested</b> options, this parameter must be set to <b>NULL</b> on input.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to an OVERLAPPED structure used for asynchronous output. This must be se to <b>NULL</b> if this function is not being called asynchronously.
     * @returns {BOOL} If the function succeeds, a return value of nonzero is sent when the conditions set by the <i>Operation</i> parameter are met.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QoS subsystem is currently configured by policy to not allow this operation on the network path between this host and the destination host.  For example, the default policy prevents qWAVE experiments from running to off-link destinations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that notification request was successfully received.  Results will be returned during overlapped completion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>FlowId</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid <i>FlowId</i> specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation being performed requires information that the QoS subsystem does not have.  Obtaining this information on this network is currently not supported.  For example, bandwidth estimations cannot be obtained on a network path where the destination host is off-link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QOS subsystem has determined that the operation requested could not be completed on the network path specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network location cannot be reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNEXP_NET_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection with the remote host failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is already a request for notifications of the same type pending on this flow.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qosnotifyflow
     * @since windows6.0.6000
     */
    static QOSNotifyFlow(QOSHandle, FlowId, Operation, Size, Buffer, Overlapped) {
        static Flags := 0 ;Reserved parameters must always be NULL

        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle

        SizeMarshal := Size is VarRef ? "uint*" : "ptr"

        result := DllCall("qwave.dll\QOSNotifyFlow", "ptr", QOSHandle, "uint", FlowId, "int", Operation, SizeMarshal, Size, "ptr", Buffer, "uint", Flags, "ptr", Overlapped, "int")
        return result
    }

    /**
     * Cancels a pending overlapped operation, like QOSSetFlow.
     * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
     * @param {Pointer<OVERLAPPED>} Overlapped Pointer to the OVERLAPPED structure used in the operation to be canceled.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>. Some possible error codes follow.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>QOSHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Overlapped</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are insufficient resources to carry out the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request could not be performed because of an I/O device error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network adapter hardware error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qos2/nf-qos2-qoscancel
     * @since windows6.0.6000
     */
    static QOSCancel(QOSHandle, Overlapped) {
        QOSHandle := QOSHandle is Win32Handle ? NumGet(QOSHandle, "ptr") : QOSHandle

        result := DllCall("qwave.dll\QOSCancel", "ptr", QOSHandle, "ptr", Overlapped, "int")
        return result
    }

    /**
     * The TcRegisterClient function is used to register a client with the traffic control interface (TCI). The TcRegisterClient function must be the first function call a client makes to the TCI.
     * @param {Integer} TciVersion Traffic control version expected by the client, included to ensure compatibility between traffic control and the client. Clients can pass CURRENT_TCI_VERSION, defined in Traffic.h.
     * @param {HANDLE} ClRegCtx Client registration context. <i>ClRegCtx</i> is returned when the client's notification handler function is called. This can be a container to hold an arbitrary client-defined context for this instance of the interface.
     * @param {Pointer<TCI_CLIENT_FUNC_LIST>} ClientHandlerList Pointer to a list of client-supplied handlers. Client-supplied handlers are used for notification events and asynchronous completions. Each completion routine is optional, with the exception of the notification handler. Setting the notification handler to <b>NULL</b> will return an ERROR_INVALID_PARAMETER.
     * @param {Pointer<HANDLE>} pClientHandle Pointer to the buffer that traffic control uses to return a registration handle to the client.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INCOMPATIBLE_TCI_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCI version is wrong.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Traffic control failed to open a system device. The likely cause is insufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TOO_MANY_CLIENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Traffic Control was unable to register with the kernel component GPC. The likely cause is too many traffic control clients are currently connected.
     * 
     * <b>Windows 2000:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcregisterclient
     * @since windows5.0
     */
    static TcRegisterClient(TciVersion, ClRegCtx, ClientHandlerList, pClientHandle) {
        ClRegCtx := ClRegCtx is Win32Handle ? NumGet(ClRegCtx, "ptr") : ClRegCtx

        result := DllCall("TRAFFIC.dll\TcRegisterClient", "uint", TciVersion, "ptr", ClRegCtx, "ptr", ClientHandlerList, "ptr", pClientHandle, "uint")
        return result
    }

    /**
     * The TcEnumerateInterfaces function enumerates all traffic control�enabled network interfaces. Clients are notified of interface changes through the ClNotifyHandler function.
     * @param {HANDLE} ClientHandle Handle used by traffic control to identify the client. Clients receive handles when registering with traffic control through the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a> function.
     * @param {Pointer<Integer>} pBufferSize Pointer to a value indicating the size of the buffer. For input, this value is the size of the buffer, in bytes, allocated by the caller. For output, this value is the actual size of the buffer, in bytes, used or needed by traffic control. A value of zero on output indicates that no traffic control interfaces are available, indicating that the QOS Packet Scheduler is not installed.
     * @param {Pointer<TC_IFC_DESCRIPTOR>} InterfaceBuffer Pointer to the buffer containing the returned list of interface descriptors.
     * @returns {Integer} Successful completion returns the device name of the interface.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to enumerate all interfaces. If this error is returned, the correct (required) size of the buffer is passed back in <i>pBufferSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcenumerateinterfaces
     * @since windows5.0
     */
    static TcEnumerateInterfaces(ClientHandle, pBufferSize, InterfaceBuffer) {
        ClientHandle := ClientHandle is Win32Handle ? NumGet(ClientHandle, "ptr") : ClientHandle

        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TRAFFIC.dll\TcEnumerateInterfaces", "ptr", ClientHandle, pBufferSizeMarshal, pBufferSize, "ptr", InterfaceBuffer, "uint")
        return result
    }

    /**
     * The TcOpenInterface function opens an interface.
     * @param {PSTR} pInterfaceName Pointer to the text string identifying the interface to be opened. This text string is part of the information returned in a previous call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateinterfaces">TcEnumerateInterfaces</a>.
     * @param {HANDLE} ClientHandle Handle used by traffic control to identify the client, obtained through the <i>pClientHandle</i> parameter of the client's call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a>.
     * @param {HANDLE} ClIfcCtx Client's interface–context handle for the opened interface. Used as a callback parameter by traffic control when communicating with the client about the opened interface. This can be a container to hold an arbitrary client-defined context for this instance of the interface.
     * @param {Pointer<HANDLE>} pIfcHandle Pointer to the buffer where traffic control can return an interface handle. The interface handle returned to <i>pIfcHandle</i> must be used by the client to identify the interface in subsequent calls to traffic control.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Traffic control failed to find an interface with the name provided in <i>pInterfaceName</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcopeninterfacea
     * @since windows5.0
     */
    static TcOpenInterfaceA(pInterfaceName, ClientHandle, ClIfcCtx, pIfcHandle) {
        pInterfaceName := pInterfaceName is String ? StrPtr(pInterfaceName) : pInterfaceName
        ClientHandle := ClientHandle is Win32Handle ? NumGet(ClientHandle, "ptr") : ClientHandle
        ClIfcCtx := ClIfcCtx is Win32Handle ? NumGet(ClIfcCtx, "ptr") : ClIfcCtx

        result := DllCall("TRAFFIC.dll\TcOpenInterfaceA", "ptr", pInterfaceName, "ptr", ClientHandle, "ptr", ClIfcCtx, "ptr", pIfcHandle, "uint")
        return result
    }

    /**
     * The TcOpenInterface function opens an interface.
     * @param {PWSTR} pInterfaceName Pointer to the text string identifying the interface to be opened. This text string is part of the information returned in a previous call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateinterfaces">TcEnumerateInterfaces</a>.
     * @param {HANDLE} ClientHandle Handle used by traffic control to identify the client, obtained through the <i>pClientHandle</i> parameter of the client's call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a>.
     * @param {HANDLE} ClIfcCtx Client's interface–context handle for the opened interface. Used as a callback parameter by traffic control when communicating with the client about the opened interface. This can be a container to hold an arbitrary client-defined context for this instance of the interface.
     * @param {Pointer<HANDLE>} pIfcHandle Pointer to the buffer where traffic control can return an interface handle. The interface handle returned to <i>pIfcHandle</i> must be used by the client to identify the interface in subsequent calls to traffic control.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Traffic control failed to find an interface with the name provided in <i>pInterfaceName</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcopeninterfacew
     * @since windows5.0
     */
    static TcOpenInterfaceW(pInterfaceName, ClientHandle, ClIfcCtx, pIfcHandle) {
        pInterfaceName := pInterfaceName is String ? StrPtr(pInterfaceName) : pInterfaceName
        ClientHandle := ClientHandle is Win32Handle ? NumGet(ClientHandle, "ptr") : ClientHandle
        ClIfcCtx := ClIfcCtx is Win32Handle ? NumGet(ClIfcCtx, "ptr") : ClIfcCtx

        result := DllCall("TRAFFIC.dll\TcOpenInterfaceW", "ptr", pInterfaceName, "ptr", ClientHandle, "ptr", ClIfcCtx, "ptr", pIfcHandle, "uint")
        return result
    }

    /**
     * The TcCloseInterface function closes an interface previously opened with a call to TcOpenInterface. All flows and filters on a particular interface should be closed before closing the interface with a call to TcCloseInterface.
     * @param {HANDLE} IfcHandle Handle associated with the interface to be closed. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_SUPPORTED_OBJECTS_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all flows have been deleted for this interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tccloseinterface
     * @since windows5.0
     */
    static TcCloseInterface(IfcHandle) {
        IfcHandle := IfcHandle is Win32Handle ? NumGet(IfcHandle, "ptr") : IfcHandle

        result := DllCall("TRAFFIC.dll\TcCloseInterface", "ptr", IfcHandle, "uint")
        return result
    }

    /**
     * The TcQueryInterface function queries traffic control for related per-interface parameters.
     * @param {HANDLE} IfcHandle Handle associated with the interface to be queried. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the traffic control parameter being queried.
     * @param {BOOLEAN} NotifyChange Used to request notifications from traffic control for the parameter being queried. If <b>TRUE</b>, traffic control will notify the client, through the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_notify_handler">ClNotifyHandler</a> function, upon changes to the parameter corresponding to the GUID provided in <i>pGuidParam</i>. Notifications are off by default.
     * @param {Pointer<Integer>} pBufferSize Indicates the size of the buffer, in bytes. For input, this value is the size of the buffer allocated by the caller. For output, this value is the actual size of the buffer, in bytes, used by traffic control.
     * @param {Pointer} Buffer Pointer to a client-allocated buffer into which returned data will be written.
     * @returns {Integer} Note that, with regard to a requested notification state, only a return value of NO_ERROR will result in the application of the requested notification state. If a return value other than NO_ERROR is returned from a call to the 
     * <b>TcQueryInterface</b> function, the requested change in notification state will not be accepted.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid interface handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid or <b>NULL</b> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to store the results.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Querying for the GUID provided is not supported on the provided interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely because the interface is in the process of being closed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcqueryinterface
     * @since windows5.0
     */
    static TcQueryInterface(IfcHandle, pGuidParam, NotifyChange, pBufferSize, Buffer) {
        IfcHandle := IfcHandle is Win32Handle ? NumGet(IfcHandle, "ptr") : IfcHandle

        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TRAFFIC.dll\TcQueryInterface", "ptr", IfcHandle, "ptr", pGuidParam, "char", NotifyChange, pBufferSizeMarshal, pBufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcSetInterface function sets individual parameters for a given interface.
     * @param {HANDLE} IfcHandle Handle associated with the interface to be set. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the parameter to be set. A list of available GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Integer} BufferSize Size of the client-provided buffer, in bytes.
     * @param {Pointer} Buffer Pointer to a client-provided buffer. <i>Buffer</i> must contain the value to which the traffic control parameter provided in <i>pGuidParam</i> should be set.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid interface handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Setting the GUID for the provided interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GUID is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcsetinterface
     * @since windows5.0
     */
    static TcSetInterface(IfcHandle, pGuidParam, BufferSize, Buffer) {
        IfcHandle := IfcHandle is Win32Handle ? NumGet(IfcHandle, "ptr") : IfcHandle

        result := DllCall("TRAFFIC.dll\TcSetInterface", "ptr", IfcHandle, "ptr", pGuidParam, "uint", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcQueryFlow function queries traffic control for the value of a specific flow parameter based on the name of the flow. The name of a flow can be retrieved from the TcEnumerateFlows function or from the TcGetFlowName function.
     * @param {PSTR} pFlowName Name of the flow being queried.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the flow parameter of interest. A list of traffic control's GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Pointer<Integer>} pBufferSize Pointer to the size of the client-provided buffer or the number of bytes used by traffic control. For input, points to the size of <i>Buffer</i>, in bytes. For output, points to the actual amount of buffer space written with returned flow-parameter data, in bytes.
     * @param {Pointer} Buffer Pointer to the client-provided buffer in which the returned flow parameter is written.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided buffer is too small to hold the results.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested GUID is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely because the flow or the interface is in the process of being closed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcqueryflowa
     * @since windows5.0
     */
    static TcQueryFlowA(pFlowName, pGuidParam, pBufferSize, Buffer) {
        pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TRAFFIC.dll\TcQueryFlowA", "ptr", pFlowName, "ptr", pGuidParam, pBufferSizeMarshal, pBufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcQueryFlow function queries traffic control for the value of a specific flow parameter based on the name of the flow. The name of a flow can be retrieved from the TcEnumerateFlows function or from the TcGetFlowName function.
     * @param {PWSTR} pFlowName Name of the flow being queried.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the flow parameter of interest. A list of traffic control's GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Pointer<Integer>} pBufferSize Pointer to the size of the client-provided buffer or the number of bytes used by traffic control. For input, points to the size of <i>Buffer</i>, in bytes. For output, points to the actual amount of buffer space written with returned flow-parameter data, in bytes.
     * @param {Pointer} Buffer Pointer to the client-provided buffer in which the returned flow parameter is written.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided buffer is too small to hold the results.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested GUID is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely because the flow or the interface is in the process of being closed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcqueryfloww
     * @since windows5.0
     */
    static TcQueryFlowW(pFlowName, pGuidParam, pBufferSize, Buffer) {
        pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TRAFFIC.dll\TcQueryFlowW", "ptr", pFlowName, "ptr", pGuidParam, pBufferSizeMarshal, pBufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcSetFlow function sets individual parameters for a given flow.
     * @param {PSTR} pFlowName Name of the flow being set. The value for this parameter is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateflows">TcEnumerateFlows</a> function or the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcgetflownamea">TcGetFlowName</a> function.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the parameter to be set. A list of available GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Integer} BufferSize Size of the client-provided buffer, in bytes.
     * @param {Pointer} Buffer Pointer to a client-provided buffer. Buffer must contain the value to which the traffic control parameter provided in <i>pGuidParam</i> should be set.
     * @returns {Integer} The 
     * <b>TcSetFlow</b> function has the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow is currently being modified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size was insufficient for the GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Setting the GUID for the provided flow is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely due to the flow or the interface being in the process of being closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcsetflowa
     * @since windows5.0
     */
    static TcSetFlowA(pFlowName, pGuidParam, BufferSize, Buffer) {
        pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

        result := DllCall("TRAFFIC.dll\TcSetFlowA", "ptr", pFlowName, "ptr", pGuidParam, "uint", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcSetFlow function sets individual parameters for a given flow.
     * @param {PWSTR} pFlowName Name of the flow being set. The value for this parameter is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateflows">TcEnumerateFlows</a> function or the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcgetflownamea">TcGetFlowName</a> function.
     * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the parameter to be set. A list of available GUIDs can be found in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
     * @param {Integer} BufferSize Size of the client-provided buffer, in bytes.
     * @param {Pointer} Buffer Pointer to a client-provided buffer. Buffer must contain the value to which the traffic control parameter provided in <i>pGuidParam</i> should be set.
     * @returns {Integer} The 
     * <b>TcSetFlow</b> function has the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow is currently being modified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size was insufficient for the GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Setting the GUID for the provided flow is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance name was not found, likely due to the flow or the interface being in the process of being closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device did not register for this GUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcsetfloww
     * @since windows5.0
     */
    static TcSetFlowW(pFlowName, pGuidParam, BufferSize, Buffer) {
        pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

        result := DllCall("TRAFFIC.dll\TcSetFlowW", "ptr", pFlowName, "ptr", pGuidParam, "uint", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * The TcAddFlow function adds a new flow on the specified interface.
     * @param {HANDLE} IfcHandle Handle associated with the interface on which the flow is to be added. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @param {HANDLE} ClFlowCtx Client provided–flow context handle. Used subsequently by traffic control when referring to the added flow.
     * @param {Integer} Flags Reserved for future use. Must be set to zero.
     * @param {Pointer<TC_GEN_FLOW>} pGenericFlow Pointer to a description of the flow being installed.
     * @param {Pointer<HANDLE>} pFlowHandle Pointer to a location into which traffic control will return the flow handle. This flow handle should be used in subsequent calls to traffic control to refer to the installed flow.
     * @returns {Integer} There are many reasons why a request to add a flow might be rejected. Error codes returned by traffic control from calls to 
     * <b>TcAddFlow</b> are provided to aid in determining the reason for rejection.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SIGNAL_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is being executed asynchronously; the client will be called back through the client-exposed 
     * <a href="/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_add_flow_complete_handler">ClAddFlowComplete</a> function when the flow has been added or when the process has been completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified or bad <b>INTSERV</b> service type has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TOKEN_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified or bad TOKENRATE value has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PEAK_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PEAKBANDWIDTH value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SD_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SHAPEDISCARDMODE is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_QOS_PRIORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The priority value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TRAFFIC_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The traffic class value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are not enough resources to accommodate the requested flow.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_OBJECT_LENGTH_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bad length specified for the TC objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DIFFSERV_FLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies to Diffserv flows. Indicates that the 
     * <a href="/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv">QOS_DIFFSERV</a> object was passed with an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DS_MAPPING_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies to Diffserv flows. Indicates that the QOS_DIFFSERV_RULE specified in 
     * <a href="/windows/desktop/api/traffic/ns-traffic-tc_gen_flow">TC_GEN_FLOW</a> already applies to an existing flow on the interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SHAPE_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/qos/ns-qos-qos_shaping_rate">QOS_SHAPING_RATE</a> object was passed with an invalid <b>ShapingRate</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DS_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The QOS_DS_CLASS is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NETWORK_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network cable is not plugged into the adapter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcaddflow
     * @since windows5.0
     */
    static TcAddFlow(IfcHandle, ClFlowCtx, Flags, pGenericFlow, pFlowHandle) {
        IfcHandle := IfcHandle is Win32Handle ? NumGet(IfcHandle, "ptr") : IfcHandle
        ClFlowCtx := ClFlowCtx is Win32Handle ? NumGet(ClFlowCtx, "ptr") : ClFlowCtx

        result := DllCall("TRAFFIC.dll\TcAddFlow", "ptr", IfcHandle, "ptr", ClFlowCtx, "uint", Flags, "ptr", pGenericFlow, "ptr", pFlowHandle, "uint")
        return result
    }

    /**
     * The TcGetFlowName function provides the name of a flow that has been created by the calling client.
     * @param {HANDLE} FlowHandle Handle for the flow.
     * @param {Integer} StrSize Size of the string buffer provided in <i>pFlowName</i>.
     * @param {PSTR} pFlowName Pointer to the output buffer holding the flow name.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to contain the results.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcgetflownamea
     * @since windows5.0
     */
    static TcGetFlowNameA(FlowHandle, StrSize, pFlowName) {
        FlowHandle := FlowHandle is Win32Handle ? NumGet(FlowHandle, "ptr") : FlowHandle
        pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

        result := DllCall("TRAFFIC.dll\TcGetFlowNameA", "ptr", FlowHandle, "uint", StrSize, "ptr", pFlowName, "uint")
        return result
    }

    /**
     * The TcGetFlowName function provides the name of a flow that has been created by the calling client.
     * @param {HANDLE} FlowHandle Handle for the flow.
     * @param {Integer} StrSize Size of the string buffer provided in <i>pFlowName</i>.
     * @param {PWSTR} pFlowName Pointer to the output buffer holding the flow name.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to contain the results.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcgetflownamew
     * @since windows5.0
     */
    static TcGetFlowNameW(FlowHandle, StrSize, pFlowName) {
        FlowHandle := FlowHandle is Win32Handle ? NumGet(FlowHandle, "ptr") : FlowHandle
        pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

        result := DllCall("TRAFFIC.dll\TcGetFlowNameW", "ptr", FlowHandle, "uint", StrSize, "ptr", pFlowName, "uint")
        return result
    }

    /**
     * The TcModifyFlow function modifies an existing flow. When calling TcModifyFlow, new Flowspec parameters and any traffic control objects should be filled.
     * @param {HANDLE} FlowHandle Handle for the flow, as received from a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> function.
     * @param {Pointer<TC_GEN_FLOW>} pGenericFlow Pointer to a description of the flow modifications.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SIGNAL_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is being executed asynchronously; the client will be called back through the client-exposed 
     * <a href="/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_mod_flow_complete_handler">ClModifyFlowComplete</a> function when the flow has been added, or when the process has been completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Action performed on the flow by a previous function call to the 
     * <a href="/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a>, 
     * <a href="/previous-versions/windows/desktop/api/traffic/nf-traffic-tcmodifyflow">TcModifyFlow</a>, or 
     * <a href="/previous-versions/windows/desktop/api/traffic/nf-traffic-tcdeleteflow">TcDeleteFlow</a> has not yet completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified or bad intserv service type has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TOKEN_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified or bad <i>TokenRate</i> value has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PEAK_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>PeakBandwidth</i> value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SD_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ShapeDiscardMode</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_QOS_PRIORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The priority value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TRAFFIC_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The traffic class value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are not enough resources to accommodate the requested flow.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_OBJECT_LENGTH_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bad length specified for the TC objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DIFFSERV_FLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies to Diffserv flows. Indicates that the 
     * <a href="/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv">QOS_DIFFSERV</a> object was passed with an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DS_MAPPING_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies to Diffserv flows. Indicates that the 
     * <a href="/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv_rule">QOS_DIFFSERV_RULE</a> specified in 
     * <a href="/windows/desktop/api/traffic/ns-traffic-tc_gen_flow">TC_GEN_FLOW</a> already applies to an existing flow on the interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SHAPE_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * <a href="/windows/desktop/api/qos/ns-qos-qos_shaping_rate">QOS_SHAPING_RATE</a> was passed with an invalid ShapeRate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DS_CLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/qosobjs/ns-qosobjs-qos_ds_class">QOS_DS_CLASS</a> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NETWORK_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network cable is not plugged into the adapter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcmodifyflow
     * @since windows5.0
     */
    static TcModifyFlow(FlowHandle, pGenericFlow) {
        FlowHandle := FlowHandle is Win32Handle ? NumGet(FlowHandle, "ptr") : FlowHandle

        result := DllCall("TRAFFIC.dll\TcModifyFlow", "ptr", FlowHandle, "ptr", pGenericFlow, "uint")
        return result
    }

    /**
     * The TcAddFilter function associates a new filter with an existing flow that allows packets matching the filter to be directed to the associated flow.
     * @param {HANDLE} FlowHandle Handle for the flow, as received from a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> function.
     * @param {Pointer<TC_GEN_FILTER>} pGenericFilter Pointer to a description of the filter to be installed.
     * @param {Pointer<HANDLE>} pFilterHandle Pointer to a buffer where traffic control returns the filter handle. This filter handle is used by the client in subsequent calls to refer to the added filter.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid address type has been provided.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUPLICATE_FILTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An identical filter exists on a flow on this interface.
     * 
     * <div class="alert"><b>Note</b>   In Windows Vista, this code will not be returned.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILTER_CONFLICT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A conflicting filter exists on a flow on this interface.
     * 
     * <div class="alert"><b>Note</b>   In Windows Vista, this code will not be returned.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow is either being installed, modified, or deleted, and is not in a state that accepts filters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcaddfilter
     * @since windows5.0
     */
    static TcAddFilter(FlowHandle, pGenericFilter, pFilterHandle) {
        FlowHandle := FlowHandle is Win32Handle ? NumGet(FlowHandle, "ptr") : FlowHandle

        result := DllCall("TRAFFIC.dll\TcAddFilter", "ptr", FlowHandle, "ptr", pGenericFilter, "ptr", pFilterHandle, "uint")
        return result
    }

    /**
     * The TcDeregisterClient function deregisters a client with the Traffic Control Interface (TCI).
     * @param {HANDLE} ClientHandle Handle assigned to the client through the previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid interface handle, or the handle was set to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_SUPPORTED_OBJECTS_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Interfaces are still open for this client. all interfaces must be closed to deregister a client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcderegisterclient
     * @since windows5.0
     */
    static TcDeregisterClient(ClientHandle) {
        ClientHandle := ClientHandle is Win32Handle ? NumGet(ClientHandle, "ptr") : ClientHandle

        result := DllCall("TRAFFIC.dll\TcDeregisterClient", "ptr", ClientHandle, "uint")
        return result
    }

    /**
     * The TcDeleteFlow function deletes a flow that has been added with the TcAddFlow function. Clients should delete all filters associated with a flow before deleting it, otherwise, an error will be returned and the function will not delete the flow.
     * @param {HANDLE} FlowHandle Handle for the flow, as received from a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SIGNAL_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is being executed asynchronously; the client will be called back through the client-exposed 
     * <a href="/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_del_flow_complete_handler">ClDeleteFlowComplete</a> function when the flow has been added, or when the process has been completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flow handle is invalid or <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Action performed on the flow by a previous function call to 
     * <a href="/previous-versions/windows/desktop/api/traffic/nf-traffic-tcmodifyflow">TcModifyFlow</a>, 
     * <a href="/previous-versions/windows/desktop/api/traffic/nf-traffic-tcdeleteflow">TcDeleteFlow</a>, or 
     * <a href="/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> has not yet completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TC_SUPPORTED_OBJECTS_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one filter associated with this flow exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcdeleteflow
     * @since windows5.0
     */
    static TcDeleteFlow(FlowHandle) {
        FlowHandle := FlowHandle is Win32Handle ? NumGet(FlowHandle, "ptr") : FlowHandle

        result := DllCall("TRAFFIC.dll\TcDeleteFlow", "ptr", FlowHandle, "uint")
        return result
    }

    /**
     * The TcDeleteFilter function deletes a filter previously added with the TcAddFilter function.
     * @param {HANDLE} FilterHandle Handle to the filter to be deleted, as received in a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddfilter">TcAddFilter</a> function.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Use of the 
     * <b>TcDeleteFilter</b> function requires administrative privilege.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcdeletefilter
     * @since windows5.0
     */
    static TcDeleteFilter(FilterHandle) {
        FilterHandle := FilterHandle is Win32Handle ? NumGet(FilterHandle, "ptr") : FilterHandle

        result := DllCall("TRAFFIC.dll\TcDeleteFilter", "ptr", FilterHandle, "uint")
        return result
    }

    /**
     * The TcEnumerateFlows function enumerates installed flows and their associated filters on an interface.
     * @param {HANDLE} IfcHandle Handle associated with the interface on which flows are to be enumerated. This handle is obtained by a previous call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
     * @param {Pointer<HANDLE>} pEnumHandle Pointer to the enumeration token, used internally by traffic control to maintain returned flow information state. 
     * 
     * 
     * 
     * 
     * For input of the initial call to 
     * <b>TcEnumerateFlows</b>, <i>pEnumToken</i> should be set to <b>NULL</b>. For input on subsequent calls, <i>pEnumToken</i> must be the value returned as the <i>pEnumToken</i> OUT parameter from the immediately preceding call to 
     * <b>TcEnumerateFlows</b>.
     * 
     * For output, <i>pEnumToken</i> is the refreshed enumeration token that must be used in the following call to 
     * <b>TcEnumerateFlows</b>.
     * @param {Pointer<Integer>} pFlowCount Pointer to the number of requested or returned flows. For input, this parameter designates the number of requested flows or it can be set to <b>0xFFFF</b> to request all flows. For output, <i>pFlowCount</i> returns the number of flows actually returned in <i>Buffer</i>.
     * @param {Pointer<Integer>} pBufSize Pointer to the size of the client-provided buffer or the number of bytes used by traffic control. For input, points to the size of <i>Buffer</i>, in bytes. For output, points to the actual amount of buffer space, in bytes, written or needed with flow enumerations.
     * @param {Pointer<ENUMERATION_BUFFER>} Buffer Pointer to the buffer containing flow enumerations. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-enumeration_buffer">ENUMERATION_BUFFER</a> for more information about flow enumerations.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function executed without errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid interface handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the pointers is <b>NULL</b>, or <i>pFlowCount</i> or <i>pBufSize</i> are set to zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to store even a single flow's information and attached filters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration token is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//traffic/nf-traffic-tcenumerateflows
     * @since windows5.0
     */
    static TcEnumerateFlows(IfcHandle, pEnumHandle, pFlowCount, pBufSize, Buffer) {
        IfcHandle := IfcHandle is Win32Handle ? NumGet(IfcHandle, "ptr") : IfcHandle

        pFlowCountMarshal := pFlowCount is VarRef ? "uint*" : "ptr"
        pBufSizeMarshal := pBufSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TRAFFIC.dll\TcEnumerateFlows", "ptr", IfcHandle, "ptr", pEnumHandle, pFlowCountMarshal, pFlowCount, pBufSizeMarshal, pBufSize, "ptr", Buffer, "uint")
        return result
    }

;@endregion Methods
}
