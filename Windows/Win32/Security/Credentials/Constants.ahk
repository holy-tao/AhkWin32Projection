#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Credentials
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MAX_CREDENTIAL_BLOB_SIZE := 2560

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MAX_USERNAME_LENGTH := 513

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MAX_DOMAIN_TARGET_NAME_LENGTH := 337

/**
 * @type {Integer (UInt32)}
 */
export global FILE_DEVICE_SMARTCARD := 49

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_SMARTCARD_READER := Guid("{50dd5230-ba8a-11d1-bf5d-0000f805f530}")

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_ATR_LENGTH := 33

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROTOCOL_UNDEFINED := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROTOCOL_T0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROTOCOL_T1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROTOCOL_RAW := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROTOCOL_DEFAULT := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROTOCOL_OPTIMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_POWER_DOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_COLD_RESET := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_WARM_RESET := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_ATTR_STRING_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAXIMUM_SMARTCARD_READERS := 10

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_VENDOR_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_COMMUNICATIONS := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_PROTOCOL := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_POWER_MGMT := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_SECURITY := 5

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_MECHANICAL := 6

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_VENDOR_DEFINED := 7

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_IFD_PROTOCOL := 8

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_ICC_STATE := 9

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_PERF := 32766

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_CLASS_SYSTEM := 32767

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_T0_HEADER_LENGTH := 7

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_T0_CMD_LENGTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_T1_PROLOGUE_LENGTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_T1_EPILOGUE_LENGTH := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_T1_EPILOGUE_LENGTH_LRC := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_T1_MAX_IFS := 254

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_ABSENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PRESENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_SWALLOWED := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_POWERED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_NEGOTIABLE := 5

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_SPECIFIC := 6

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_SWALLOWS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_EJECTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_CONFISCATES := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_CONTACTLESS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_SERIAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_PARALELL := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_KEYBOARD := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_SCSI := 8

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_IDE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_USB := 32

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_PCMCIA := 64

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_TPM := 128

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_NFC := 256

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_UICC := 512

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_NGC := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_EMBEDDEDSE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_READER_TYPE_VENDOR := 240

/**
 * @type {Integer (Int32)}
 */
export global STATUS_LOGON_FAILURE := -1073741715

/**
 * @type {Integer (Int32)}
 */
export global STATUS_WRONG_PASSWORD := -1073741718

/**
 * @type {Integer (Int32)}
 */
export global STATUS_PASSWORD_EXPIRED := -1073741711

/**
 * @type {Integer (Int32)}
 */
export global STATUS_PASSWORD_MUST_CHANGE := -1073741276

/**
 * @type {Integer (Int32)}
 */
export global STATUS_DOWNGRADE_DETECTED := -1073740920

/**
 * @type {Integer (Int32)}
 */
export global STATUS_AUTHENTICATION_FIREWALL_FAILED := -1073740781

/**
 * @type {Integer (Int32)}
 */
export global STATUS_ACCOUNT_DISABLED := -1073741710

/**
 * @type {Integer (Int32)}
 */
export global STATUS_ACCOUNT_RESTRICTION := -1073741714

/**
 * @type {Integer (Int32)}
 */
export global STATUS_ACCOUNT_LOCKED_OUT := -1073741260

/**
 * @type {Integer (Int32)}
 */
export global STATUS_ACCOUNT_EXPIRED := -1073741421

/**
 * @type {Integer (Int32)}
 */
export global STATUS_LOGON_TYPE_NOT_GRANTED := -1073741477

/**
 * @type {Integer (Int32)}
 */
export global STATUS_NO_SUCH_LOGON_SESSION := -1073741729

/**
 * @type {Integer (Int32)}
 */
export global STATUS_NO_SUCH_USER := -1073741724

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MAX_STRING_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MAX_GENERIC_TARGET_NAME_LENGTH := 32767

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MAX_TARGETNAME_NAMESPACE_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MAX_TARGETNAME_ATTRIBUTE_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MAX_VALUE_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRED_MAX_ATTRIBUTES := 64

/**
 * @type {String}
 */
export global CRED_SESSION_WILDCARD_NAME_W := "*Session"

/**
 * @type {String}
 */
export global CRED_SESSION_WILDCARD_NAME_A := "*Session"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_DOMAIN_NAMESPACE_W := "Domain"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_DOMAIN_NAMESPACE_A := "Domain"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_W := "LegacyGeneric"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_A := "LegacyGeneric"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_TARGET_W := "target"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_TARGET_A := "target"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_NAME_W := "name"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_NAME_A := "name"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_BATCH_W := "batch"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_BATCH_A := "batch"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_W := "interactive"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_A := "interactive"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_SERVICE_W := "service"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_SERVICE_A := "service"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_NETWORK_W := "network"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_NETWORK_A := "network"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_W := "networkcleartext"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_A := "networkcleartext"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_W := "remoteinteractive"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_A := "remoteinteractive"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_W := "cachedinteractive"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_A := "cachedinteractive"

/**
 * @type {String}
 */
export global CRED_SESSION_WILDCARD_NAME := "*Session"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_DOMAIN_NAMESPACE := "Domain"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_NAME := "name"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_TARGET := "target"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_BATCH := "batch"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE := "interactive"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_SERVICE := "service"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_NETWORK := "network"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT := "networkcleartext"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE := "remoteinteractive"

/**
 * @type {String}
 */
export global CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE := "cachedinteractive"

/**
 * @type {Integer (UInt32)}
 */
export global CRED_LOGON_TYPES_MASK := 61440

/**
 * @type {Integer (UInt32)}
 */
export global CRED_TI_SERVER_FORMAT_UNKNOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRED_TI_DOMAIN_FORMAT_UNKNOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRED_TI_ONLY_PASSWORD_REQUIRED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRED_TI_USERNAME_TARGET := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRED_TI_CREATE_EXPLICIT_CRED := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRED_TI_WORKGROUP_MEMBER := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRED_TI_DNSTREE_IS_DFS_SERVER := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRED_TI_VALID_FLAGS := 61567

/**
 * @type {Integer (UInt32)}
 */
export global CERT_HASH_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global CREDUI_MAX_MESSAGE_LENGTH := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CREDUI_MAX_CAPTION_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global CREDUI_MAX_GENERIC_TARGET_LENGTH := 32767

/**
 * @type {Integer (UInt32)}
 */
export global CREDUI_MAX_DOMAIN_TARGET_LENGTH := 337

/**
 * @type {Integer (UInt32)}
 */
export global CREDUI_MAX_USERNAME_LENGTH := 513

/**
 * @type {Integer (UInt32)}
 */
export global CREDUIWIN_USE_V2 := 64

/**
 * @type {Integer (UInt32)}
 */
export global CREDUIWIN_IGNORE_CLOUDAUTHORITY_NAME := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CREDUIWIN_DOWNLEVEL_HELLO_AS_SMART_CARD := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global BACK_BUTTON_IDENTIFY_AUTH_PACKAGE := 3402629121

/**
 * @type {Integer (UInt32)}
 */
export global CREDUI_FOOTER_LINK_AUTHPACKAGE_ID := 212664322

/**
 * @type {Integer (UInt32)}
 */
export global CREDUI_PICKERSCREEN_AUTHPACKAGE_ID := 212664323

/**
 * @type {Integer (UInt32)}
 */
export global CRED_PRESERVE_CREDENTIAL_BLOB := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRED_CACHE_TARGET_INFORMATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRED_ALLOW_NAME_RESOLUTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRED_PROTECT_AS_SELF := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRED_PROTECT_TO_SYSTEM := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRED_UNPROTECT_AS_SELF := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRED_UNPROTECT_ALLOW_TO_SYSTEM := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_SCOPE_TERMINAL := 1

/**
 * @type {String}
 */
export global SCARD_ALL_READERS := "SCard$AllReaders" Chr(0) "00"

/**
 * @type {String}
 */
export global SCARD_DEFAULT_READERS := "SCard$DefaultReaders" Chr(0) "00"

/**
 * @type {String}
 */
export global SCARD_LOCAL_READERS := "SCard$LocalReaders" Chr(0) "00"

/**
 * @type {String}
 */
export global SCARD_SYSTEM_READERS := "SCard$SystemReaders" Chr(0) "00"

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROVIDER_PRIMARY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROVIDER_CSP := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_PROVIDER_KSP := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_STATE_UNPOWERED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_SHARE_EXCLUSIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_SHARE_SHARED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_SHARE_DIRECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_LEAVE_CARD := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_RESET_CARD := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_UNPOWER_CARD := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_EJECT_CARD := 3

/**
 * @type {Integer (UInt32)}
 */
export global SC_DLG_MINIMAL_UI := 1

/**
 * @type {Integer (UInt32)}
 */
export global SC_DLG_NO_UI := 2

/**
 * @type {Integer (UInt32)}
 */
export global SC_DLG_FORCE_UI := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCERR_NOCARDNAME := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SCERR_NOGUIDS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_AUDIT_CHV_FAILURE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCARD_AUDIT_CHV_SUCCESS := 1

/**
 * @type {String}
 */
export global CREDSSP_NAME := "CREDSSP"

/**
 * @type {String}
 */
export global TS_SSP_NAME_A := "TSSSP"

/**
 * @type {String}
 */
export global TS_SSP_NAME := "TSSSP"

/**
 * @type {String}
 */
export global szOID_TS_KP_TS_SERVER_AUTH := "1.3.6.1.4.1.311.54.1.2"

/**
 * @type {Integer (UInt32)}
 */
export global CREDSSP_SERVER_AUTH_NEGOTIATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREDSSP_SERVER_AUTH_CERTIFICATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CREDSSP_SERVER_AUTH_LOOPBACK := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ALT_ATTR := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SECPKG_ATTR_C_FULL_IDENT_TOKEN := 2147483781

/**
 * @type {Integer (UInt32)}
 */
export global CREDSSP_CRED_EX_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CREDSSP_FLAG_REDIRECT := 1
;@endregion Constants
