#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */

;@region Constants

/**
 * @type {String}
 */
export global WINTRUST_CONFIG_REGPATH := "Software\Microsoft\Cryptography\Wintrust\Config"

/**
 * @type {String}
 */
export global WINTRUST_MAX_HEADER_BYTES_TO_MAP_VALUE_NAME := "MaxHeaderBytesToMap"

/**
 * @type {Integer (UInt32)}
 */
export global WINTRUST_MAX_HEADER_BYTES_TO_MAP_DEFAULT := 10485760

/**
 * @type {String}
 */
export global WINTRUST_MAX_HASH_BYTES_TO_MAP_VALUE_NAME := "MaxHashBytesToMap"

/**
 * @type {Integer (UInt32)}
 */
export global WINTRUST_MAX_HASH_BYTES_TO_MAP_DEFAULT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WTD_CHOICE_DETACHED_SIG := 6

/**
 * @type {Integer (UInt32)}
 */
export global WTD_PROV_FLAGS_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global WTD_USE_LOCAL_MACHINE_CERTS := 8

/**
 * @type {Integer (UInt32)}
 */
export global WTD_CODE_INTEGRITY_DRIVER_MODE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WSS_VERIFY_SEALING := 4

/**
 * @type {Integer (UInt32)}
 */
export global WSS_INPUT_FLAG_MASK := 7

/**
 * @type {Integer (UInt32)}
 */
export global WSS_OUT_SEALING_STATUS_VERIFIED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global WSS_OUT_HAS_SEALING_INTENT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global WSS_OUT_FILE_SUPPORTS_SEAL := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global WSS_OUTPUT_FLAG_MASK := 3758096384

/**
 * @type {Integer (UInt32)}
 */
export global WINTRUST_DETACHED_SIG_CHOICE_HANDLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINTRUST_DETACHED_SIG_CHOICE_BLOB := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTCI_DONT_OPEN_STORES := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTCI_OPEN_ONLY_ROOT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTCI_USE_LOCAL_MACHINE := 4

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_WVTPARAMS := 0

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_FILEIO := 2

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_SIP := 3

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_SIPSUBJINFO := 5

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_CATALOGFILE := 6

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_CERTSTORE := 7

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MESSAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MSG_SIGNERCOUNT := 9

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MSG_INNERCNTTYPE := 10

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MSG_INNERCNT := 11

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MSG_STORE := 12

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MSG_SIGNERINFO := 13

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MSG_SIGNERCERT := 14

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MSG_CERTCHAIN := 15

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MSG_COUNTERSIGINFO := 16

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_MSG_COUNTERSIGCERT := 17

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_VERIFY_MSGHASH := 18

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_VERIFY_MSGINDIRECTDATA := 19

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_FINAL_WVTINIT := 30

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_FINAL_INITPROV := 31

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_FINAL_OBJPROV := 32

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_FINAL_SIGPROV := 33

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_FINAL_CERTPROV := 34

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_FINAL_CERTCHKPROV := 35

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_FINAL_POLICYPROV := 36

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_STEP_FINAL_UIPROV := 37

/**
 * @type {Integer (UInt32)}
 */
export global TRUSTERROR_MAX_STEPS := 38

/**
 * @type {Integer (UInt32)}
 */
export global CPD_CHOICE_SIP := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPD_USE_NT5_CHAIN_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CPD_REVOCATION_CHECK_NONE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CPD_REVOCATION_CHECK_END_CERT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CPD_REVOCATION_CHECK_CHAIN := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CPD_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT := 524288

/**
 * @type {Integer (UInt32)}
 */
export global CPD_RETURN_LOWER_QUALITY_CHAINS := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CPD_RFC3161v21 := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CPD_UISTATE_MODE_PROMPT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CPD_UISTATE_MODE_BLOCK := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPD_UISTATE_MODE_ALLOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPD_UISTATE_MODE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global WSS_OBJTRUST_SUPPORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WSS_SIGTRUST_SUPPORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WSS_CERTTRUST_SUPPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global SGNR_TYPE_TIMESTAMP := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CONFIDENCE_SIG := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CONFIDENCE_TIME := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CONFIDENCE_TIMENEST := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CONFIDENCE_AUTHIDEXT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CONFIDENCE_HYGIENE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CERT_CONFIDENCE_HIGHEST := 286330880

/**
 * @type {Integer (UInt32)}
 */
export global WT_CURRENT_VERSION := 512

/**
 * @type {String}
 */
export global WT_PROVIDER_DLL_NAME := "WINTRUST.DLL"

/**
 * @type {String}
 */
export global WT_PROVIDER_CERTTRUST_FUNCTION := "WintrustCertificateTrust"

/**
 * @type {Integer (UInt32)}
 */
export global WT_ADD_ACTION_ID_RET_RESULT_FLAG := 1

/**
 * @type {String}
 */
export global szOID_TRUSTED_CODESIGNING_CA_LIST := "1.3.6.1.4.1.311.2.2.1"

/**
 * @type {String}
 */
export global szOID_TRUSTED_CLIENT_AUTH_CA_LIST := "1.3.6.1.4.1.311.2.2.2"

/**
 * @type {String}
 */
export global szOID_TRUSTED_SERVER_AUTH_CA_LIST := "1.3.6.1.4.1.311.2.2.3"

/**
 * @type {String}
 */
export global SPC_COMMON_NAME_OBJID := "2.5.4.3"

/**
 * @type {String}
 */
export global SPC_TIME_STAMP_REQUEST_OBJID := "1.3.6.1.4.1.311.3.2.1"

/**
 * @type {String}
 */
export global SPC_INDIRECT_DATA_OBJID := "1.3.6.1.4.1.311.2.1.4"

/**
 * @type {String}
 */
export global SPC_SP_AGENCY_INFO_OBJID := "1.3.6.1.4.1.311.2.1.10"

/**
 * @type {String}
 */
export global SPC_STATEMENT_TYPE_OBJID := "1.3.6.1.4.1.311.2.1.11"

/**
 * @type {String}
 */
export global SPC_SP_OPUS_INFO_OBJID := "1.3.6.1.4.1.311.2.1.12"

/**
 * @type {String}
 */
export global SPC_CERT_EXTENSIONS_OBJID := "1.3.6.1.4.1.311.2.1.14"

/**
 * @type {String}
 */
export global SPC_PE_IMAGE_DATA_OBJID := "1.3.6.1.4.1.311.2.1.15"

/**
 * @type {String}
 */
export global SPC_RAW_FILE_DATA_OBJID := "1.3.6.1.4.1.311.2.1.18"

/**
 * @type {String}
 */
export global SPC_STRUCTURED_STORAGE_DATA_OBJID := "1.3.6.1.4.1.311.2.1.19"

/**
 * @type {String}
 */
export global SPC_JAVA_CLASS_DATA_OBJID := "1.3.6.1.4.1.311.2.1.20"

/**
 * @type {String}
 */
export global SPC_INDIVIDUAL_SP_KEY_PURPOSE_OBJID := "1.3.6.1.4.1.311.2.1.21"

/**
 * @type {String}
 */
export global SPC_COMMERCIAL_SP_KEY_PURPOSE_OBJID := "1.3.6.1.4.1.311.2.1.22"

/**
 * @type {String}
 */
export global SPC_CAB_DATA_OBJID := "1.3.6.1.4.1.311.2.1.25"

/**
 * @type {String}
 */
export global SPC_GLUE_RDN_OBJID := "1.3.6.1.4.1.311.2.1.25"

/**
 * @type {String}
 */
export global SPC_MINIMAL_CRITERIA_OBJID := "1.3.6.1.4.1.311.2.1.26"

/**
 * @type {String}
 */
export global SPC_FINANCIAL_CRITERIA_OBJID := "1.3.6.1.4.1.311.2.1.27"

/**
 * @type {String}
 */
export global SPC_LINK_OBJID := "1.3.6.1.4.1.311.2.1.28"

/**
 * @type {String}
 */
export global SPC_SIGINFO_OBJID := "1.3.6.1.4.1.311.2.1.30"

/**
 * @type {String}
 */
export global SPC_PE_IMAGE_PAGE_HASHES_V1_OBJID := "1.3.6.1.4.1.311.2.3.1"

/**
 * @type {String}
 */
export global SPC_PE_IMAGE_PAGE_HASHES_V2_OBJID := "1.3.6.1.4.1.311.2.3.2"

/**
 * @type {String}
 */
export global szOID_NESTED_SIGNATURE := "1.3.6.1.4.1.311.2.4.1"

/**
 * @type {String}
 */
export global szOID_INTENT_TO_SEAL := "1.3.6.1.4.1.311.2.4.2"

/**
 * @type {String}
 */
export global szOID_SEALING_SIGNATURE := "1.3.6.1.4.1.311.2.4.3"

/**
 * @type {String}
 */
export global szOID_SEALING_TIMESTAMP := "1.3.6.1.4.1.311.2.4.4"

/**
 * @type {String}
 */
export global szOID_ENHANCED_HASH := "1.3.6.1.4.1.311.2.5.1"

/**
 * @type {String}
 */
export global SPC_RELAXED_PE_MARKER_CHECK_OBJID := "1.3.6.1.4.1.311.2.6.1"

/**
 * @type {String}
 */
export global SPC_ENCRYPTED_DIGEST_RETRY_COUNT_OBJID := "1.3.6.1.4.1.311.2.6.2"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_INTERNAL_NAME := "1.3.6.1.4.1.311.2.7.1"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_FILE_VERSION := "1.3.6.1.4.1.311.2.7.2"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_FILE_DESCRIPTION := "1.3.6.1.4.1.311.2.7.3"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_PRODUCT := "1.3.6.1.4.1.311.2.7.4"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_PRODUCT_VERSION := "1.3.6.1.4.1.311.2.7.5"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_ORIGINAL_FILENAME := "1.3.6.1.4.1.311.2.7.6"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_LANGUAGE := "1.3.6.1.4.1.311.2.7.7"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_AUTHOR := "1.3.6.1.4.1.311.2.7.8"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_PUBLISH_TIME := "1.3.6.1.4.1.311.2.7.9"

/**
 * @type {String}
 */
export global szOID_SIGNED_ATTRIBUTE_SOURCE_URL := "1.3.6.1.4.1.311.2.7.10"

/**
 * @type {String}
 */
export global szOID_PKCS_9_SEQUENCE_NUMBER := "1.2.840.113549.1.9.25.4"

/**
 * @type {String}
 */
export global CAT_NAMEVALUE_OBJID := "1.3.6.1.4.1.311.12.2.1"

/**
 * @type {String}
 */
export global CAT_MEMBERINFO_OBJID := "1.3.6.1.4.1.311.12.2.2"

/**
 * @type {String}
 */
export global CAT_MEMBERINFO2_OBJID := "1.3.6.1.4.1.311.12.2.3"

/**
 * @type {String}
 */
export global SPC_WINDOWS_HELLO_COMPATIBILITY_OBJID := "1.3.6.1.4.1.311.10.41.1"

/**
 * @type {String}
 */
export global SPC_NATURAL_AUTH_PLUGIN_OBJID := "1.3.6.1.4.1.311.96.1.1"

/**
 * @type {Integer (Int32)}
 */
export global SPC_SP_AGENCY_INFO_STRUCT := 2000

/**
 * @type {Integer (Int32)}
 */
export global SPC_MINIMAL_CRITERIA_STRUCT := 2001

/**
 * @type {Integer (Int32)}
 */
export global SPC_FINANCIAL_CRITERIA_STRUCT := 2002

/**
 * @type {Integer (Int32)}
 */
export global SPC_INDIRECT_DATA_CONTENT_STRUCT := 2003

/**
 * @type {Integer (Int32)}
 */
export global SPC_PE_IMAGE_DATA_STRUCT := 2004

/**
 * @type {Integer (Int32)}
 */
export global SPC_LINK_STRUCT := 2005

/**
 * @type {Integer (Int32)}
 */
export global SPC_STATEMENT_TYPE_STRUCT := 2006

/**
 * @type {Integer (Int32)}
 */
export global SPC_SP_OPUS_INFO_STRUCT := 2007

/**
 * @type {Integer (Int32)}
 */
export global SPC_CAB_DATA_STRUCT := 2008

/**
 * @type {Integer (Int32)}
 */
export global SPC_JAVA_CLASS_DATA_STRUCT := 2009

/**
 * @type {Integer (Int32)}
 */
export global INTENT_TO_SEAL_ATTRIBUTE_STRUCT := 2010

/**
 * @type {Integer (Int32)}
 */
export global SEALING_SIGNATURE_ATTRIBUTE_STRUCT := 2011

/**
 * @type {Integer (Int32)}
 */
export global SEALING_TIMESTAMP_ATTRIBUTE_STRUCT := 2012

/**
 * @type {Integer (Int32)}
 */
export global SPC_SIGINFO_STRUCT := 2130

/**
 * @type {Integer (Int32)}
 */
export global CAT_NAMEVALUE_STRUCT := 2221

/**
 * @type {Integer (Int32)}
 */
export global CAT_MEMBERINFO_STRUCT := 2222

/**
 * @type {Integer (Int32)}
 */
export global CAT_MEMBERINFO2_STRUCT := 2223

/**
 * @type {Integer (UInt32)}
 */
export global SPC_UUID_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global SPC_URL_LINK_CHOICE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SPC_MONIKER_LINK_CHOICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SPC_FILE_LINK_CHOICE := 3

/**
 * @type {Integer (UInt32)}
 */
export global WIN_CERT_REVISION_1_0 := 256

/**
 * @type {Integer (UInt32)}
 */
export global WIN_CERT_REVISION_2_0 := 512

/**
 * @type {Integer (UInt32)}
 */
export global WIN_CERT_TYPE_X509 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WIN_CERT_TYPE_PKCS_SIGNED_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global WIN_CERT_TYPE_RESERVED_1 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WIN_CERT_TYPE_TS_STACK_SIGNED := 4

/**
 * @type {Guid}
 */
export global WIN_TRUST_SUBJTYPE_RAW_FILE := Guid("{959dc450-8d9e-11cf-8736-00aa00a485eb}")

/**
 * @type {Guid}
 */
export global WIN_TRUST_SUBJTYPE_PE_IMAGE := Guid("{43c9a1e0-8da0-11cf-8736-00aa00a485eb}")

/**
 * @type {Guid}
 */
export global WIN_TRUST_SUBJTYPE_JAVA_CLASS := Guid("{08ad3990-8da1-11cf-8736-00aa00a485eb}")

/**
 * @type {Guid}
 */
export global WIN_TRUST_SUBJTYPE_CABINET := Guid("{d17c5374-a392-11cf-9df5-00aa00c184e0}")

/**
 * @type {Guid}
 */
export global WIN_TRUST_SUBJTYPE_RAW_FILEEX := Guid("{6f458110-c2f1-11cf-8a69-00aa006c3706}")

/**
 * @type {Guid}
 */
export global WIN_TRUST_SUBJTYPE_PE_IMAGEEX := Guid("{6f458111-c2f1-11cf-8a69-00aa006c3706}")

/**
 * @type {Guid}
 */
export global WIN_TRUST_SUBJTYPE_JAVA_CLASSEX := Guid("{6f458113-c2f1-11cf-8a69-00aa006c3706}")

/**
 * @type {Guid}
 */
export global WIN_TRUST_SUBJTYPE_CABINETEX := Guid("{6f458114-c2f1-11cf-8a69-00aa006c3706}")

/**
 * @type {Guid}
 */
export global WIN_TRUST_SUBJTYPE_OLE_STORAGE := Guid("{c257e740-8da0-11cf-8736-00aa00a485eb}")

/**
 * @type {Guid}
 */
export global WIN_SPUB_ACTION_TRUSTED_PUBLISHER := Guid("{66426730-8da1-11cf-8736-00aa00a485eb}")

/**
 * @type {Guid}
 */
export global WIN_SPUB_ACTION_NT_ACTIVATE_IMAGE := Guid("{8bc96b00-8da1-11cf-8736-00aa00a485eb}")

/**
 * @type {Guid}
 */
export global WIN_SPUB_ACTION_PUBLISHED_SOFTWARE := Guid("{64b9d180-8da2-11cf-8736-00aa00a485eb}")

/**
 * @type {Integer (UInt32)}
 */
export global WT_TRUSTDBDIALOG_NO_UI_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global WT_TRUSTDBDIALOG_ONLY_PUB_TAB_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global WT_TRUSTDBDIALOG_WRITE_LEGACY_REG_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global WT_TRUSTDBDIALOG_WRITE_IEAK_STORE_FLAG := 512

/**
 * @type {String}
 */
export global SP_POLICY_PROVIDER_DLL_NAME := "WINTRUST.DLL"

/**
 * @type {Guid}
 */
export global WINTRUST_ACTION_GENERIC_VERIFY_V2 := Guid("{00aac56b-cd44-11d0-8cc2-00c04fc295ee}")

/**
 * @type {String}
 */
export global SP_INIT_FUNCTION := "SoftpubInitialize"

/**
 * @type {String}
 */
export global SP_OBJTRUST_FUNCTION := "SoftpubLoadMessage"

/**
 * @type {String}
 */
export global SP_SIGTRUST_FUNCTION := "SoftpubLoadSignature"

/**
 * @type {String}
 */
export global SP_CHKCERT_FUNCTION := "SoftpubCheckCert"

/**
 * @type {String}
 */
export global SP_FINALPOLICY_FUNCTION := "SoftpubAuthenticode"

/**
 * @type {String}
 */
export global SP_CLEANUPPOLICY_FUNCTION := "SoftpubCleanup"

/**
 * @type {Guid}
 */
export global WINTRUST_ACTION_TRUSTPROVIDER_TEST := Guid("{573e31f8-ddba-11d0-8ccb-00c04fc295ee}")

/**
 * @type {String}
 */
export global SP_TESTDUMPPOLICY_FUNCTION_TEST := "SoftpubDumpStructure"

/**
 * @type {Guid}
 */
export global WINTRUST_ACTION_GENERIC_CERT_VERIFY := Guid("{189a3842-3041-11d1-85e1-00c04fc295ee}")

/**
 * @type {String}
 */
export global SP_GENERIC_CERT_INIT_FUNCTION := "SoftpubDefCertInit"

/**
 * @type {Guid}
 */
export global WINTRUST_ACTION_GENERIC_CHAIN_VERIFY := Guid("{fc451c16-ac75-11d1-b4b8-00c04fb66ea0}")

/**
 * @type {String}
 */
export global GENERIC_CHAIN_FINALPOLICY_FUNCTION := "GenericChainFinalProv"

/**
 * @type {String}
 */
export global GENERIC_CHAIN_CERTTRUST_FUNCTION := "GenericChainCertificateTrust"

/**
 * @type {Guid}
 */
export global HTTPSPROV_ACTION := Guid("{573e31f8-aaba-11d0-8ccb-00c04fc295ee}")

/**
 * @type {String}
 */
export global HTTPS_FINALPOLICY_FUNCTION := "HTTPSFinalProv"

/**
 * @type {String}
 */
export global HTTPS_CHKCERT_FUNCTION := "HTTPSCheckCertProv"

/**
 * @type {String}
 */
export global HTTPS_CERTTRUST_FUNCTION := "HTTPSCertificateTrust"

/**
 * @type {Guid}
 */
export global OFFICESIGN_ACTION_VERIFY := Guid("{5555c2cd-17fb-11d1-85c4-00c04fc295ee}")

/**
 * @type {String}
 */
export global OFFICE_POLICY_PROVIDER_DLL_NAME := "WINTRUST.DLL"

/**
 * @type {String}
 */
export global OFFICE_INITPROV_FUNCTION := "OfficeInitializePolicy"

/**
 * @type {String}
 */
export global OFFICE_CLEANUPPOLICY_FUNCTION := "OfficeCleanupPolicy"

/**
 * @type {Guid}
 */
export global DRIVER_ACTION_VERIFY := Guid("{f750e6c3-38ee-11d1-85e5-00c04fc295ee}")

/**
 * @type {String}
 */
export global DRIVER_INITPROV_FUNCTION := "DriverInitializePolicy"

/**
 * @type {String}
 */
export global DRIVER_FINALPOLPROV_FUNCTION := "DriverFinalPolicy"

/**
 * @type {String}
 */
export global DRIVER_CLEANUPPOLICY_FUNCTION := "DriverCleanupPolicy"

/**
 * @type {Guid}
 */
export global CONFIG_CI_ACTION_VERIFY := Guid("{6078065b-8f22-4b13-bd9b-5b762776f386}")

/**
 * @type {Integer (UInt32)}
 */
export global CCPI_RESULT_ALLOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global CCPI_RESULT_DENY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CCPI_RESULT_AUDIT := 3
;@endregion Constants
