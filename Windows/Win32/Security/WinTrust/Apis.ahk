#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WinTrust {

;@region Constants

    /**
     * @type {String}
     */
    static WINTRUST_CONFIG_REGPATH => "Software\Microsoft\Cryptography\Wintrust\Config"

    /**
     * @type {String}
     */
    static WINTRUST_MAX_HEADER_BYTES_TO_MAP_VALUE_NAME => "MaxHeaderBytesToMap"

    /**
     * @type {Integer (UInt32)}
     */
    static WINTRUST_MAX_HEADER_BYTES_TO_MAP_DEFAULT => 10485760

    /**
     * @type {String}
     */
    static WINTRUST_MAX_HASH_BYTES_TO_MAP_VALUE_NAME => "MaxHashBytesToMap"

    /**
     * @type {Integer (UInt32)}
     */
    static WINTRUST_MAX_HASH_BYTES_TO_MAP_DEFAULT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_DETACHED_SIG => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_PROV_FLAGS_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_USE_LOCAL_MACHINE_CERTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CODE_INTEGRITY_DRIVER_MODE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_VERIFY_SEALING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_INPUT_FLAG_MASK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_OUT_SEALING_STATUS_VERIFIED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_OUT_HAS_SEALING_INTENT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_OUT_FILE_SUPPORTS_SEAL => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_OUTPUT_FLAG_MASK => 3758096384

    /**
     * @type {Integer (UInt32)}
     */
    static WINTRUST_DETACHED_SIG_CHOICE_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINTRUST_DETACHED_SIG_CHOICE_BLOB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTCI_DONT_OPEN_STORES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTCI_OPEN_ONLY_ROOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTCI_USE_LOCAL_MACHINE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_WVTPARAMS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_FILEIO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_SIP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_SIPSUBJINFO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_CATALOGFILE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_CERTSTORE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MESSAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MSG_SIGNERCOUNT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MSG_INNERCNTTYPE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MSG_INNERCNT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MSG_STORE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MSG_SIGNERINFO => 13

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MSG_SIGNERCERT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MSG_CERTCHAIN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MSG_COUNTERSIGINFO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_MSG_COUNTERSIGCERT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_VERIFY_MSGHASH => 18

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_VERIFY_MSGINDIRECTDATA => 19

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_FINAL_WVTINIT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_FINAL_INITPROV => 31

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_FINAL_OBJPROV => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_FINAL_SIGPROV => 33

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_FINAL_CERTPROV => 34

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_FINAL_CERTCHKPROV => 35

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_FINAL_POLICYPROV => 36

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_STEP_FINAL_UIPROV => 37

    /**
     * @type {Integer (UInt32)}
     */
    static TRUSTERROR_MAX_STEPS => 38

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_CHOICE_SIP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_USE_NT5_CHAIN_FLAG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_REVOCATION_CHECK_NONE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_REVOCATION_CHECK_END_CERT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_REVOCATION_CHECK_CHAIN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_RETURN_LOWER_QUALITY_CHAINS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_RFC3161v21 => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_UISTATE_MODE_PROMPT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_UISTATE_MODE_BLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_UISTATE_MODE_ALLOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPD_UISTATE_MODE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_OBJTRUST_SUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_SIGTRUST_SUPPORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_CERTTRUST_SUPPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SGNR_TYPE_TIMESTAMP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CONFIDENCE_SIG => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CONFIDENCE_TIME => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CONFIDENCE_TIMENEST => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CONFIDENCE_AUTHIDEXT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CONFIDENCE_HYGIENE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CONFIDENCE_HIGHEST => 286330880

    /**
     * @type {Integer (UInt32)}
     */
    static WT_CURRENT_VERSION => 512

    /**
     * @type {String}
     */
    static WT_PROVIDER_DLL_NAME => "WINTRUST.DLL"

    /**
     * @type {String}
     */
    static WT_PROVIDER_CERTTRUST_FUNCTION => "WintrustCertificateTrust"

    /**
     * @type {Integer (UInt32)}
     */
    static WT_ADD_ACTION_ID_RET_RESULT_FLAG => 1

    /**
     * @type {String}
     */
    static szOID_TRUSTED_CODESIGNING_CA_LIST => "1.3.6.1.4.1.311.2.2.1"

    /**
     * @type {String}
     */
    static szOID_TRUSTED_CLIENT_AUTH_CA_LIST => "1.3.6.1.4.1.311.2.2.2"

    /**
     * @type {String}
     */
    static szOID_TRUSTED_SERVER_AUTH_CA_LIST => "1.3.6.1.4.1.311.2.2.3"

    /**
     * @type {String}
     */
    static SPC_COMMON_NAME_OBJID => "2.5.4.3"

    /**
     * @type {String}
     */
    static SPC_TIME_STAMP_REQUEST_OBJID => "1.3.6.1.4.1.311.3.2.1"

    /**
     * @type {String}
     */
    static SPC_INDIRECT_DATA_OBJID => "1.3.6.1.4.1.311.2.1.4"

    /**
     * @type {String}
     */
    static SPC_SP_AGENCY_INFO_OBJID => "1.3.6.1.4.1.311.2.1.10"

    /**
     * @type {String}
     */
    static SPC_STATEMENT_TYPE_OBJID => "1.3.6.1.4.1.311.2.1.11"

    /**
     * @type {String}
     */
    static SPC_SP_OPUS_INFO_OBJID => "1.3.6.1.4.1.311.2.1.12"

    /**
     * @type {String}
     */
    static SPC_CERT_EXTENSIONS_OBJID => "1.3.6.1.4.1.311.2.1.14"

    /**
     * @type {String}
     */
    static SPC_PE_IMAGE_DATA_OBJID => "1.3.6.1.4.1.311.2.1.15"

    /**
     * @type {String}
     */
    static SPC_RAW_FILE_DATA_OBJID => "1.3.6.1.4.1.311.2.1.18"

    /**
     * @type {String}
     */
    static SPC_STRUCTURED_STORAGE_DATA_OBJID => "1.3.6.1.4.1.311.2.1.19"

    /**
     * @type {String}
     */
    static SPC_JAVA_CLASS_DATA_OBJID => "1.3.6.1.4.1.311.2.1.20"

    /**
     * @type {String}
     */
    static SPC_INDIVIDUAL_SP_KEY_PURPOSE_OBJID => "1.3.6.1.4.1.311.2.1.21"

    /**
     * @type {String}
     */
    static SPC_COMMERCIAL_SP_KEY_PURPOSE_OBJID => "1.3.6.1.4.1.311.2.1.22"

    /**
     * @type {String}
     */
    static SPC_CAB_DATA_OBJID => "1.3.6.1.4.1.311.2.1.25"

    /**
     * @type {String}
     */
    static SPC_GLUE_RDN_OBJID => "1.3.6.1.4.1.311.2.1.25"

    /**
     * @type {String}
     */
    static SPC_MINIMAL_CRITERIA_OBJID => "1.3.6.1.4.1.311.2.1.26"

    /**
     * @type {String}
     */
    static SPC_FINANCIAL_CRITERIA_OBJID => "1.3.6.1.4.1.311.2.1.27"

    /**
     * @type {String}
     */
    static SPC_LINK_OBJID => "1.3.6.1.4.1.311.2.1.28"

    /**
     * @type {String}
     */
    static SPC_SIGINFO_OBJID => "1.3.6.1.4.1.311.2.1.30"

    /**
     * @type {String}
     */
    static SPC_PE_IMAGE_PAGE_HASHES_V1_OBJID => "1.3.6.1.4.1.311.2.3.1"

    /**
     * @type {String}
     */
    static SPC_PE_IMAGE_PAGE_HASHES_V2_OBJID => "1.3.6.1.4.1.311.2.3.2"

    /**
     * @type {String}
     */
    static szOID_NESTED_SIGNATURE => "1.3.6.1.4.1.311.2.4.1"

    /**
     * @type {String}
     */
    static szOID_INTENT_TO_SEAL => "1.3.6.1.4.1.311.2.4.2"

    /**
     * @type {String}
     */
    static szOID_SEALING_SIGNATURE => "1.3.6.1.4.1.311.2.4.3"

    /**
     * @type {String}
     */
    static szOID_SEALING_TIMESTAMP => "1.3.6.1.4.1.311.2.4.4"

    /**
     * @type {String}
     */
    static szOID_ENHANCED_HASH => "1.3.6.1.4.1.311.2.5.1"

    /**
     * @type {String}
     */
    static SPC_RELAXED_PE_MARKER_CHECK_OBJID => "1.3.6.1.4.1.311.2.6.1"

    /**
     * @type {String}
     */
    static SPC_ENCRYPTED_DIGEST_RETRY_COUNT_OBJID => "1.3.6.1.4.1.311.2.6.2"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_INTERNAL_NAME => "1.3.6.1.4.1.311.2.7.1"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_FILE_VERSION => "1.3.6.1.4.1.311.2.7.2"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_FILE_DESCRIPTION => "1.3.6.1.4.1.311.2.7.3"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_PRODUCT => "1.3.6.1.4.1.311.2.7.4"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_PRODUCT_VERSION => "1.3.6.1.4.1.311.2.7.5"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_ORIGINAL_FILENAME => "1.3.6.1.4.1.311.2.7.6"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_LANGUAGE => "1.3.6.1.4.1.311.2.7.7"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_AUTHOR => "1.3.6.1.4.1.311.2.7.8"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_PUBLISH_TIME => "1.3.6.1.4.1.311.2.7.9"

    /**
     * @type {String}
     */
    static szOID_SIGNED_ATTRIBUTE_SOURCE_URL => "1.3.6.1.4.1.311.2.7.10"

    /**
     * @type {String}
     */
    static szOID_PKCS_9_SEQUENCE_NUMBER => "1.2.840.113549.1.9.25.4"

    /**
     * @type {String}
     */
    static CAT_NAMEVALUE_OBJID => "1.3.6.1.4.1.311.12.2.1"

    /**
     * @type {String}
     */
    static CAT_MEMBERINFO_OBJID => "1.3.6.1.4.1.311.12.2.2"

    /**
     * @type {String}
     */
    static CAT_MEMBERINFO2_OBJID => "1.3.6.1.4.1.311.12.2.3"

    /**
     * @type {String}
     */
    static SPC_WINDOWS_HELLO_COMPATIBILITY_OBJID => "1.3.6.1.4.1.311.10.41.1"

    /**
     * @type {String}
     */
    static SPC_NATURAL_AUTH_PLUGIN_OBJID => "1.3.6.1.4.1.311.96.1.1"

    /**
     * @type {Integer (Int32)}
     */
    static SPC_SP_AGENCY_INFO_STRUCT => 2000

    /**
     * @type {Integer (Int32)}
     */
    static SPC_MINIMAL_CRITERIA_STRUCT => 2001

    /**
     * @type {Integer (Int32)}
     */
    static SPC_FINANCIAL_CRITERIA_STRUCT => 2002

    /**
     * @type {Integer (Int32)}
     */
    static SPC_INDIRECT_DATA_CONTENT_STRUCT => 2003

    /**
     * @type {Integer (Int32)}
     */
    static SPC_PE_IMAGE_DATA_STRUCT => 2004

    /**
     * @type {Integer (Int32)}
     */
    static SPC_LINK_STRUCT => 2005

    /**
     * @type {Integer (Int32)}
     */
    static SPC_STATEMENT_TYPE_STRUCT => 2006

    /**
     * @type {Integer (Int32)}
     */
    static SPC_SP_OPUS_INFO_STRUCT => 2007

    /**
     * @type {Integer (Int32)}
     */
    static SPC_CAB_DATA_STRUCT => 2008

    /**
     * @type {Integer (Int32)}
     */
    static SPC_JAVA_CLASS_DATA_STRUCT => 2009

    /**
     * @type {Integer (Int32)}
     */
    static INTENT_TO_SEAL_ATTRIBUTE_STRUCT => 2010

    /**
     * @type {Integer (Int32)}
     */
    static SEALING_SIGNATURE_ATTRIBUTE_STRUCT => 2011

    /**
     * @type {Integer (Int32)}
     */
    static SEALING_TIMESTAMP_ATTRIBUTE_STRUCT => 2012

    /**
     * @type {Integer (Int32)}
     */
    static SPC_SIGINFO_STRUCT => 2130

    /**
     * @type {Integer (Int32)}
     */
    static CAT_NAMEVALUE_STRUCT => 2221

    /**
     * @type {Integer (Int32)}
     */
    static CAT_MEMBERINFO_STRUCT => 2222

    /**
     * @type {Integer (Int32)}
     */
    static CAT_MEMBERINFO2_STRUCT => 2223

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_UUID_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_URL_LINK_CHOICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_MONIKER_LINK_CHOICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_FILE_LINK_CHOICE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIN_CERT_REVISION_1_0 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WIN_CERT_REVISION_2_0 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WIN_CERT_TYPE_X509 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WIN_CERT_TYPE_PKCS_SIGNED_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WIN_CERT_TYPE_RESERVED_1 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WIN_CERT_TYPE_TS_STACK_SIGNED => 4

    /**
     * @type {Guid}
     */
    static WIN_TRUST_SUBJTYPE_RAW_FILE => Guid("{959dc450-8d9e-11cf-8736-00aa00a485eb}")

    /**
     * @type {Guid}
     */
    static WIN_TRUST_SUBJTYPE_PE_IMAGE => Guid("{43c9a1e0-8da0-11cf-8736-00aa00a485eb}")

    /**
     * @type {Guid}
     */
    static WIN_TRUST_SUBJTYPE_JAVA_CLASS => Guid("{08ad3990-8da1-11cf-8736-00aa00a485eb}")

    /**
     * @type {Guid}
     */
    static WIN_TRUST_SUBJTYPE_CABINET => Guid("{d17c5374-a392-11cf-9df5-00aa00c184e0}")

    /**
     * @type {Guid}
     */
    static WIN_TRUST_SUBJTYPE_RAW_FILEEX => Guid("{6f458110-c2f1-11cf-8a69-00aa006c3706}")

    /**
     * @type {Guid}
     */
    static WIN_TRUST_SUBJTYPE_PE_IMAGEEX => Guid("{6f458111-c2f1-11cf-8a69-00aa006c3706}")

    /**
     * @type {Guid}
     */
    static WIN_TRUST_SUBJTYPE_JAVA_CLASSEX => Guid("{6f458113-c2f1-11cf-8a69-00aa006c3706}")

    /**
     * @type {Guid}
     */
    static WIN_TRUST_SUBJTYPE_CABINETEX => Guid("{6f458114-c2f1-11cf-8a69-00aa006c3706}")

    /**
     * @type {Guid}
     */
    static WIN_TRUST_SUBJTYPE_OLE_STORAGE => Guid("{c257e740-8da0-11cf-8736-00aa00a485eb}")

    /**
     * @type {Guid}
     */
    static WIN_SPUB_ACTION_TRUSTED_PUBLISHER => Guid("{66426730-8da1-11cf-8736-00aa00a485eb}")

    /**
     * @type {Guid}
     */
    static WIN_SPUB_ACTION_NT_ACTIVATE_IMAGE => Guid("{8bc96b00-8da1-11cf-8736-00aa00a485eb}")

    /**
     * @type {Guid}
     */
    static WIN_SPUB_ACTION_PUBLISHED_SOFTWARE => Guid("{64b9d180-8da2-11cf-8736-00aa00a485eb}")

    /**
     * @type {Integer (UInt32)}
     */
    static WT_TRUSTDBDIALOG_NO_UI_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WT_TRUSTDBDIALOG_ONLY_PUB_TAB_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WT_TRUSTDBDIALOG_WRITE_LEGACY_REG_FLAG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WT_TRUSTDBDIALOG_WRITE_IEAK_STORE_FLAG => 512

    /**
     * @type {String}
     */
    static SP_POLICY_PROVIDER_DLL_NAME => "WINTRUST.DLL"

    /**
     * @type {Guid}
     */
    static WINTRUST_ACTION_GENERIC_VERIFY_V2 => Guid("{00aac56b-cd44-11d0-8cc2-00c04fc295ee}")

    /**
     * @type {String}
     */
    static SP_INIT_FUNCTION => "SoftpubInitialize"

    /**
     * @type {String}
     */
    static SP_OBJTRUST_FUNCTION => "SoftpubLoadMessage"

    /**
     * @type {String}
     */
    static SP_SIGTRUST_FUNCTION => "SoftpubLoadSignature"

    /**
     * @type {String}
     */
    static SP_CHKCERT_FUNCTION => "SoftpubCheckCert"

    /**
     * @type {String}
     */
    static SP_FINALPOLICY_FUNCTION => "SoftpubAuthenticode"

    /**
     * @type {String}
     */
    static SP_CLEANUPPOLICY_FUNCTION => "SoftpubCleanup"

    /**
     * @type {Guid}
     */
    static WINTRUST_ACTION_TRUSTPROVIDER_TEST => Guid("{573e31f8-ddba-11d0-8ccb-00c04fc295ee}")

    /**
     * @type {String}
     */
    static SP_TESTDUMPPOLICY_FUNCTION_TEST => "SoftpubDumpStructure"

    /**
     * @type {Guid}
     */
    static WINTRUST_ACTION_GENERIC_CERT_VERIFY => Guid("{189a3842-3041-11d1-85e1-00c04fc295ee}")

    /**
     * @type {String}
     */
    static SP_GENERIC_CERT_INIT_FUNCTION => "SoftpubDefCertInit"

    /**
     * @type {Guid}
     */
    static WINTRUST_ACTION_GENERIC_CHAIN_VERIFY => Guid("{fc451c16-ac75-11d1-b4b8-00c04fb66ea0}")

    /**
     * @type {String}
     */
    static GENERIC_CHAIN_FINALPOLICY_FUNCTION => "GenericChainFinalProv"

    /**
     * @type {String}
     */
    static GENERIC_CHAIN_CERTTRUST_FUNCTION => "GenericChainCertificateTrust"

    /**
     * @type {Guid}
     */
    static HTTPSPROV_ACTION => Guid("{573e31f8-aaba-11d0-8ccb-00c04fc295ee}")

    /**
     * @type {String}
     */
    static HTTPS_FINALPOLICY_FUNCTION => "HTTPSFinalProv"

    /**
     * @type {String}
     */
    static HTTPS_CHKCERT_FUNCTION => "HTTPSCheckCertProv"

    /**
     * @type {String}
     */
    static HTTPS_CERTTRUST_FUNCTION => "HTTPSCertificateTrust"

    /**
     * @type {Guid}
     */
    static OFFICESIGN_ACTION_VERIFY => Guid("{5555c2cd-17fb-11d1-85c4-00c04fc295ee}")

    /**
     * @type {String}
     */
    static OFFICE_POLICY_PROVIDER_DLL_NAME => "WINTRUST.DLL"

    /**
     * @type {String}
     */
    static OFFICE_INITPROV_FUNCTION => "OfficeInitializePolicy"

    /**
     * @type {String}
     */
    static OFFICE_CLEANUPPOLICY_FUNCTION => "OfficeCleanupPolicy"

    /**
     * @type {Guid}
     */
    static DRIVER_ACTION_VERIFY => Guid("{f750e6c3-38ee-11d1-85e5-00c04fc295ee}")

    /**
     * @type {String}
     */
    static DRIVER_INITPROV_FUNCTION => "DriverInitializePolicy"

    /**
     * @type {String}
     */
    static DRIVER_FINALPOLPROV_FUNCTION => "DriverFinalPolicy"

    /**
     * @type {String}
     */
    static DRIVER_CLEANUPPOLICY_FUNCTION => "DriverCleanupPolicy"

    /**
     * @type {Guid}
     */
    static CONFIG_CI_ACTION_VERIFY => Guid("{6078065b-8f22-4b13-bd9b-5b762776f386}")

    /**
     * @type {Integer (UInt32)}
     */
    static CCPI_RESULT_ALLOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CCPI_RESULT_DENY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CCPI_RESULT_AUDIT => 3
;@endregion Constants

;@region Methods
    /**
     * Performs a trust verification action on a specified object.
     * @param {HWND} hwnd Optional handle to a caller window. A trust provider can use this value to determine whether it can interact with the user. However, trust providers typically perform verification actions without input from the user.
     * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies an action and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action. This value indicates the type of verification action to be performed on the structure pointed to by <i>pWinTrustData</i>.
     * 
     * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
     * 
     * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRIVER_ACTION_VERIFY"></a><a id="driver_action_verify"></a><dl>
     * <dt><b>DRIVER_ACTION_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify the
     * authenticity of a Windows Hardware Quality Labs (WHQL) signed driver.  This is an Authenticode add-on
     * policy provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
     * <dt><b>HTTPSPROV_ACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify an SSL/TLS connection through Internet Explorer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OFFICESIGN_ACTION_VERIFY"></a><a id="officesign_action_verify"></a><dl>
     * <dt><b>OFFICESIGN_ACTION_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  This Action ID is not supported. Verify the
     * authenticity of a structured storage file by using the Microsoft Office
     * Authenticode add-on policy provider.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This Action ID is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_CHAIN_VERIFY"></a><a id="wintrust_action_generic_chain_verify"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_CHAIN_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify
     * certificate chains created from any object type.
     * A callback is provided to implement the final chain policy by using
     * the chain context for each signer and counter signer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify a file or object using the Authenticode policy provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_TRUSTPROVIDER_TEST"></a><a id="wintrust_action_trustprovider_test"></a><dl>
     * <dt><b>WINTRUST_ACTION_TRUSTPROVIDER_TEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure to a file after calling the
     * Authenticode policy provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} pWVTData A pointer that, when cast as a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure, contains information that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> needs to process the specified action identifier. Typically, the structure includes information that identifies the object that the trust provider must evaluate.
     * 
     * The format of the structure depends on the action identifier. For information about the data required for a specific action identifier, see the documentation for the trust provider that supports that action.
     * @returns {Integer} If the trust provider verifies that the subject is trusted for the specified action, the return value is zero.  No other value besides zero should be considered a successful return.
     * 
     * If the trust provider does not verify that the subject is trusted for the specified action, the function returns a status code from the <a href="/windows/desktop/SecGloss/t-gly">trust provider</a>.<div class="alert"><b>Note</b>  The return value is a <b>LONG</b>, not an <b>HRESULT</b> as previously documented. Do not use <b>HRESULT</b> macros such as <b>SUCCEEDED</b> to determine whether the function succeeded. Instead, check the return value for equality to zero.</div>
     * <div> </div>
     * 
     * 
     * For example, a trust provider might indicate that the subject is not trusted, or is trusted but with limitations or warnings. The return value can be a trust-provider-specific value described in the documentation for an individual trust provider, or it can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_SUBJECT_NOT_TRUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject failed the specified verification action. Most trust providers return a more detailed error code that describes the reason for the failure.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The <b>TRUST_E_SUBJECT_NOT_TRUSTED</b> return code may be returned depending on the value of the <b>EnableCertPaddingCheck</b> registry key under <b>HKLM\Software\Microsoft\Cryptography\Wintrust\Config</b>. If <b>EnableCertPaddingCheck</b> is set to "1", then an additional check is performed to verify that the <b>WIN_CERTIFICATE</b> structure does not contain extraneous information. The check validates that there is no non-zero data beyond the PKCS #7 structure. The <b>EnableCertPaddingCheck</b> key will be set to "1" by default on June 10, 2014. For more information, please refer to the following security advisory: <a href="/security-updates/SecurityAdvisories/2014/2915720">http://technet.microsoft.com/security/advisory/2915720#section1</a>.
     * 
     * </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_PROVIDER_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trust provider is not recognized on this system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_ACTION_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trust provider does not support the specified action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_SUBJECT_FORM_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trust provider does not support the form specified for the subject.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-winverifytrust
     * @since windows5.1.2600
     */
    static WinVerifyTrust(hwnd, pgActionID, pWVTData) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pWVTDataMarshal := pWVTData is VarRef ? "ptr" : "ptr"

        result := DllCall("WINTRUST.dll\WinVerifyTrust", "ptr", hwnd, "ptr", pgActionID, pWVTDataMarshal, pWVTData, "int")
        return result
    }

    /**
     * Performs a trust verification action on a specified object and takes a pointer to a WINTRUST_DATA structure.
     * @param {HWND} hwnd Optional handle to a caller window. A trust provider can use this value to determine whether it can interact with the user. However, trust providers typically perform verification actions without input from the user.
     * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies an action and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action. This value indicates the type of verification action to be performed on the structure pointed to by <i>pWinTrustData</i>.
     * 
     * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
     * 
     * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRIVER_ACTION_VERIFY"></a><a id="driver_action_verify"></a><dl>
     * <dt><b>DRIVER_ACTION_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify the
     * authenticity of a Windows Hardware Quality Labs (WHQL) signed driver.  This is an Authenticode add-on
     * policy provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
     * <dt><b>HTTPSPROV_ACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify an SSL/TLS connection through Internet Explorer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OFFICESIGN_ACTION_VERIFY"></a><a id="officesign_action_verify"></a><dl>
     * <dt><b>OFFICESIGN_ACTION_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  This Action ID is not supported. Verify the
     * authenticity of a structured storage file by using the Microsoft Office
     * Authenticode add-on policy provider.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This Action ID is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_CERT_VERIFY"></a><a id="wintrust_action_generic_cert_verify"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_CERT_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify
     * a certificate chain only.  This is only valid when passing in a
     * certificate context in the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrust">WinVerifyTrust</a> input structures.
     * 
     * <div class="alert"><b>Note</b>  We do not recommend  using this function to perform certificate verification. To perform certificate verification, use the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain">CertGetCertificateChain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifycertificatechainpolicy">CertVerifyCertificateChainPolicy</a> functions.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_CHAIN_VERIFY"></a><a id="wintrust_action_generic_chain_verify"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_CHAIN_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify
     * certificate chains created from any object type.
     * A callback is provided to implement the final chain policy by using
     * the chain context for each signer and counter signer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify a file or object using the Authenticode policy provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_TRUSTPROVIDER_TEST"></a><a id="wintrust_action_trustprovider_test"></a><dl>
     * <dt><b>WINTRUST_ACTION_TRUSTPROVIDER_TEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure to a file after calling the
     * Authenticode policy provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<WINTRUST_DATA>} pWinTrustData A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure that contains information that the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> needs to process the specified action identifier. Typically, the structure includes information that identifies the object that the trust provider must evaluate.
     * 
     * The format of the structure depends on the action identifier. For information about the data required for a specific action identifier, see the documentation for the trust provider that supports that action.
     * @returns {Integer} Note, while the return type is declared as HRESULT this API returns Win32 error codes, do not use SUCCEEDED() or FAILED() to test the result.
     * 
     * If the trust provider verifies that the subject is trusted for the specified action, the return value is ERROR_SUCCESS. Otherwise, the function returns a status code from the <a href="/windows/desktop/SecGloss/t-gly">trust provider</a>.
     * 
     * For example, a trust provider might indicate that the subject is not trusted, or is trusted but with limitations or warnings. The return value can be a trust provider–specific value described in the documentation for an individual trust provider, or it can be one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_SUBJECT_NOT_TRUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subject failed the specified verification action. Most trust providers return a more detailed error code that describes the reason for the failure.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The <b>TRUST_E_SUBJECT_NOT_TRUSTED</b> return code may be returned depending on the value of the <b>EnableCertPaddingCheck</b> registry key under <b>HKLM\Software\Microsoft\Cryptography\Wintrust\Config</b>. If <b>EnableCertPaddingCheck</b> is set to "1", then an additional check is performed to verify that the <b>WIN_CERTIFICATE</b> structure does not contain extraneous information. The check validates that there is no non-zero data beyond the PKCS #7 structure. The <b>EnableCertPaddingCheck</b> key will be set to "1" by default on June 10, 2014. For more information, please refer to the following security advisory: <a href="/security-updates/SecurityAdvisories/2014/2915720">http://technet.microsoft.com/security/advisory/2915720#section1</a>.
     * 
     * </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_PROVIDER_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trust provider is not recognized on this system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_ACTION_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trust provider does not support the specified action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUST_E_SUBJECT_FORM_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The trust provider does not support the form specified for the subject.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-winverifytrustex
     * @since windows5.1.2600
     */
    static WinVerifyTrustEx(hwnd, pgActionID, pWinTrustData) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("WINTRUST.dll\WinVerifyTrustEx", "ptr", hwnd, "ptr", pgActionID, "ptr", pWinTrustData, "int")
        return result
    }

    /**
     * Retrieves policy flags for a policy provider.
     * @param {Pointer<Integer>} pdwPolicyFlags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wintrustgetregpolicyflags
     * @since windows5.1.2600
     */
    static WintrustGetRegPolicyFlags(pdwPolicyFlags) {
        pdwPolicyFlagsMarshal := pdwPolicyFlags is VarRef ? "uint*" : "ptr"

        DllCall("WINTRUST.dll\WintrustGetRegPolicyFlags", pdwPolicyFlagsMarshal, pdwPolicyFlags)
    }

    /**
     * Sets policy flags for a policy provider.
     * @param {Integer} dwPolicyFlags 
     * @returns {BOOL} Returns nonzero if the policy flags were set successfully or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wintrustsetregpolicyflags
     * @since windows5.1.2600
     */
    static WintrustSetRegPolicyFlags(dwPolicyFlags) {
        result := DllCall("WINTRUST.dll\WintrustSetRegPolicyFlags", "uint", dwPolicyFlags, "int")
        return result
    }

    /**
     * Adds a trust provider action to the user's system.
     * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies the action to add  and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action.
     * 
     * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
     * 
     * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY"></a><a id="wintrust_action_generic_verify"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify a certificate chain only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify a file or object using the Authenticode policy provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
     * <dt><b>HTTPSPROV_ACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify an SSL/PCT connection through Internet Explorer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} fdwFlags a value that determines whether registry errors are reported by this function. If <i>fdwFlags</i> is zero and this function experiences a registry error, the registry error will not be propagated to the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>  function. If <i>fdwFlags</i> is WT_ADD_ACTION_ID_RET_RESULT_FLAG (0x1) and this function experiences a registry error, the registry error will be propagated to the <b>GetLastError</b>  function.
     * @param {Pointer<CRYPT_REGISTER_ACTIONID>} psProvInfo A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_register_actionid">CRYPT_REGISTER_ACTIONID</a> structure that defines the information for the trust provider.
     * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b>  if the function fails.   If the function fails, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function  to determine the reason for failure.  For information about any registry errors that this function may encounter, see the description for <i>fdwFlags</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wintrustaddactionid
     * @since windows5.1.2600
     */
    static WintrustAddActionID(pgActionID, fdwFlags, psProvInfo) {
        A_LastError := 0

        result := DllCall("WINTRUST.dll\WintrustAddActionID", "ptr", pgActionID, "uint", fdwFlags, "ptr", psProvInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes an action added by the WintrustAddActionID function. This function has no associated import library.
     * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies the action to remove and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action.
     * 
     * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
     * 
     * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY"></a><a id="wintrust_action_generic_verify"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify a certificate chain only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify a file or object using the Authenticode policy provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
     * <dt><b>HTTPSPROV_ACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify an SSL/PCT connection through Internet Explorer.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wintrustremoveactionid
     * @since windows5.1.2600
     */
    static WintrustRemoveActionID(pgActionID) {
        result := DllCall("WINTRUST.dll\WintrustRemoveActionID", "ptr", pgActionID, "int")
        return result
    }

    /**
     * Loads function entry points for a specified action GUID. This function has no associated import library.
     * @param {Pointer<Guid>} pgActionID A pointer to a <b>GUID</b> structure that identifies the action whose function pointers are being loaded and the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trust provider</a> that supports that action.
     * 
     * The WinTrust service is designed to work with trust providers implemented by third parties. Each trust provider provides its own unique set of action identifiers. For information about the action identifiers supported by a trust provider, see the documentation for that trust provider.
     * 
     * For example, Microsoft provides a Software Publisher Trust Provider that can establish the trustworthiness of software being downloaded from the Internet or some other public network. The Software Publisher Trust Provider supports the following action identifiers. These constants are defined in Softpub.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY"></a><a id="wintrust_action_generic_verify"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify a certificate chain only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINTRUST_ACTION_GENERIC_VERIFY_V2"></a><a id="wintrust_action_generic_verify_v2"></a><dl>
     * <dt><b>WINTRUST_ACTION_GENERIC_VERIFY_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify a file or object using the Authenticode policy provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTPSPROV_ACTION"></a><a id="httpsprov_action"></a><dl>
     * <dt><b>HTTPSPROV_ACTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Verify an SSL/PCT connection through Internet Explorer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<CRYPT_PROVIDER_FUNCTIONS>} pPfns A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_functions">CRYPT_PROVIDER_FUNCTIONS</a> structure that receives the addresses of the function pointers.
     * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wintrustloadfunctionpointers
     * @since windows5.1.2600
     */
    static WintrustLoadFunctionPointers(pgActionID, pPfns) {
        result := DllCall("WINTRUST.dll\WintrustLoadFunctionPointers", "ptr", pgActionID, "ptr", pPfns, "int")
        return result
    }

    /**
     * Specifies the default usage identifier and callback information for a provider.
     * @param {PSTR} pszUsageOID Pointer to a string that contains the identifier.
     * @param {Pointer<CRYPT_PROVIDER_REGDEFUSAGE>} psDefUsage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_regdefusage">CRYPT_PROVIDER_REGDEFUSAGE</a> structure that contains callback information.
     * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b>  if the function fails.   If the function fails, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function  to determine the reason for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wintrustadddefaultforusage
     * @since windows5.1.2600
     */
    static WintrustAddDefaultForUsage(pszUsageOID, psDefUsage) {
        pszUsageOID := pszUsageOID is String ? StrPtr(pszUsageOID) : pszUsageOID

        A_LastError := 0

        result := DllCall("WINTRUST.dll\WintrustAddDefaultForUsage", "ptr", pszUsageOID, "ptr", psDefUsage, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the default usage identifier and callback information.
     * @param {Integer} dwAction 
     * @param {PSTR} pszUsageOID Pointer to a string that contains the identifier.
     * @param {Pointer<CRYPT_PROVIDER_DEFUSAGE>} psUsage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_defusage">CRYPT_PROVIDER_DEFUSAGE</a> structure that contains callback information to be retrieved.
     * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b>  if the function fails.   If the function fails, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function  to determine the reason for failure.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wintrustgetdefaultforusage
     * @since windows5.1.2600
     */
    static WintrustGetDefaultForUsage(dwAction, pszUsageOID, psUsage) {
        pszUsageOID := pszUsageOID is String ? StrPtr(pszUsageOID) : pszUsageOID

        A_LastError := 0

        result := DllCall("WINTRUST.dll\WintrustGetDefaultForUsage", "uint", dwAction, "ptr", pszUsageOID, "ptr", psUsage, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a signer or countersigner by index from the chain.
     * @param {Pointer<CRYPT_PROVIDER_DATA>} pProvData A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure that contains the signer and countersigner information.
     * @param {Integer} idxSigner The index of the signer. The index is zero based.
     * @param {BOOL} fCounterSigner If <b>TRUE</b>, the countersigner, as specified by <i>idxCounterSigner</i>, is retrieved by this function; the signer that contains the countersigner is identified by  <i>idxSigner</i>. If <b>FALSE</b>, the signer, as specified by <i>idxSigner</i>, is retrieved by this function.
     * @param {Integer} idxCounterSigner The index of the countersigner. The index is zero based. The countersigner applies to the signer identified by <i>idxSigner</i>.
     * @returns {Pointer<CRYPT_PROVIDER_SGNR>} If the function succeeds, the function returns a pointer to a <a href="/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_sgnr">CRYPT_PROVIDER_SGNR</a> structure for the requested signer or countersigner.
     * 
     * If the function fails, it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wthelpergetprovsignerfromchain
     * @since windows5.1.2600
     */
    static WTHelperGetProvSignerFromChain(pProvData, idxSigner, fCounterSigner, idxCounterSigner) {
        result := DllCall("WINTRUST.dll\WTHelperGetProvSignerFromChain", "ptr", pProvData, "uint", idxSigner, "int", fCounterSigner, "uint", idxCounterSigner, "ptr")
        return result
    }

    /**
     * Retrieves a trust provider certificate from the certificate chain.
     * @param {Pointer<CRYPT_PROVIDER_SGNR>} pSgnr A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_sgnr">CRYPT_PROVIDER_SGNR</a> structure that represents the signers. This pointer is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wthelpergetprovsignerfromchain">WTHelperGetProvSignerFromChain</a> function.
     * @param {Integer} idxCert The index of the certificate. The index is zero based.
     * @returns {Pointer<CRYPT_PROVIDER_CERT>} If the function succeeds, the function returns a pointer to a  <a href="/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_cert">CRYPT_PROVIDER_CERT</a> structure that represents the trust provider certificate.
     * 
     * If the function fails, it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wthelpergetprovcertfromchain
     * @since windows5.1.2600
     */
    static WTHelperGetProvCertFromChain(pSgnr, idxCert) {
        result := DllCall("WINTRUST.dll\WTHelperGetProvCertFromChain", "ptr", pSgnr, "uint", idxCert, "ptr")
        return result
    }

    /**
     * Retrieves trust provider information from a specified handle.
     * @param {HANDLE} hStateData A handle previously set by the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrustex">WinVerifyTrustEx</a> function as the <b>hWVTStateData</b>	 member of the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure.
     * @returns {Pointer<CRYPT_PROVIDER_DATA>} If the function succeeds, the function returns a pointer to a <a href="/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure. The returned pointer can be used by the <a href="/windows/desktop/api/wintrust/nf-wintrust-wthelpergetprovsignerfromchain">WTHelperGetProvSignerFromChain</a>   function.
     * 
     * If the function fails, it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wthelperprovdatafromstatedata
     * @since windows5.1.2600
     */
    static WTHelperProvDataFromStateData(hStateData) {
        hStateData := hStateData is Win32Handle ? NumGet(hStateData, "ptr") : hStateData

        result := DllCall("WINTRUST.dll\WTHelperProvDataFromStateData", "ptr", hStateData, "ptr")
        return result
    }

    /**
     * Receives a CRYPT_PROVIDER_PRIVDATA structure from the chain by using the provider ID.
     * @param {Pointer<CRYPT_PROVIDER_DATA>} pProvData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure that contains the provider's private information.
     * @param {Pointer<Guid>} pgProviderID A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the provider.
     * @returns {Pointer<CRYPT_PROVIDER_PRIVDATA>} If the function succeeds, the function returns a pointer to a  <a href="/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_privdata">CRYPT_PROVIDER_PRIVDATA</a> structure that represents the trust provider's private information.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wthelpergetprovprivatedatafromchain
     * @since windows5.1.2600
     */
    static WTHelperGetProvPrivateDataFromChain(pProvData, pgProviderID) {
        result := DllCall("WINTRUST.dll\WTHelperGetProvPrivateDataFromChain", "ptr", pProvData, "ptr", pgProviderID, "ptr")
        return result
    }

    /**
     * Checks whether a certificate is self-signed.
     * @param {Integer} dwEncoding A <b>DWORD</b> value that specifies the encoding types of the certificate to check. For information about possible encoding types, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certificate-and-message-encoding-types">Certificate and Message Encoding Types</a>.
     * @param {Pointer<CERT_INFO>} pCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a> structure that contains information about  the certificate to check.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wthelpercertisselfsigned
     * @since windows5.1.2600
     */
    static WTHelperCertIsSelfSigned(dwEncoding, pCert) {
        result := DllCall("WINTRUST.dll\WTHelperCertIsSelfSigned", "uint", dwEncoding, "ptr", pCert, "int")
        return result
    }

    /**
     * Checks whether a signature is valid.
     * @param {Pointer<CRYPT_PROVIDER_DATA>} pProvData A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_provider_data">CRYPT_PROVIDER_DATA</a> structure that contains the signer and countersigner information.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of possible error values, see <a href="/windows/desktop/api/wintrust/nf-wintrust-winverifytrust">WinVerifyTrust</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wthelpercertcheckvalidsignature
     * @since windows6.0.6000
     */
    static WTHelperCertCheckValidSignature(pProvData) {
        result := DllCall("WINTRUST.dll\WTHelperCertCheckValidSignature", "ptr", pProvData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Displays the Certificates dialog box.
     * @param {HWND} hwndParent The handle of the parent window for the dialog box. If this parameter is <b>NULL</b>, the dialog box has no parent.
     * @param {Integer} dwFlags A set of flags that modify the behavior of this function. This can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WT_TRUSTDBDIALOG_ONLY_PUB_TAB_FLAG"></a><a id="wt_trustdbdialog_only_pub_tab_flag"></a><dl>
     * <dt><b>WT_TRUSTDBDIALOG_ONLY_PUB_TAB_FLAG</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only display the          <b>Trusted Publisher</b> tab. By default, all of the user interface tabs are displayed and the <b>Trusted Publisher</b> tab is initially selected.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Void>>} pvReserved Not used. Must be <b>NULL</b>.
     * @returns {BOOL} Returns nonzero if the dialog box was opened successfully or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-openpersonaltrustdbdialogex
     * @since windows5.1.2600
     */
    static OpenPersonalTrustDBDialogEx(hwndParent, dwFlags, pvReserved) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        pvReservedMarshal := pvReserved is VarRef ? "ptr*" : "ptr"

        result := DllCall("WINTRUST.dll\OpenPersonalTrustDBDialogEx", "ptr", hwndParent, "uint", dwFlags, pvReservedMarshal, pvReserved, "int")
        return result
    }

    /**
     * Displays the Certificates dialog box.
     * @param {HWND} hwndParent The handle of the parent window for the dialog box. If this parameter is <b>NULL</b>, the dialog box has no parent.
     * @returns {BOOL} Returns nonzero if the dialog box was opened successfully or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-openpersonaltrustdbdialog
     * @since windows5.1.2600
     */
    static OpenPersonalTrustDBDialog(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("WINTRUST.dll\OpenPersonalTrustDBDialog", "ptr", hwndParent, "int")
        return result
    }

    /**
     * Sets the default setting that determines whether page hashes are included when creating subject interface package (SIP) indirect data for PE files.
     * @remarks
     * 
     * This setting applies to each instance of Wintrust.dll.
     * 
     * 
     * @param {BOOL} fIncludePEPageHashes Determines whether page hashes are included when creating SIP indirect data for PE files. If this parameter is nonzero, page hashes are included. If this parameter is zero, page hashes are not included. The value is zero by default.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wintrust/nf-wintrust-wintrustsetdefaultincludepepagehashes
     * @since windows6.0.6000
     */
    static WintrustSetDefaultIncludePEPageHashes(fIncludePEPageHashes) {
        DllCall("WINTRUST.dll\WintrustSetDefaultIncludePEPageHashes", "int", fIncludePEPageHashes)
    }

;@endregion Methods
}
