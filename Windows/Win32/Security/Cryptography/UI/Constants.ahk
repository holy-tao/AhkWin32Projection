#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global CRYTPDLG_FLAGS_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTDLG_REVOCATION_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTDLG_REVOCATION_ONLINE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTDLG_REVOCATION_CACHE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTDLG_REVOCATION_NONE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTDLG_CACHE_ONLY_URL_RETRIEVAL := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTDLG_DISABLE_AIA := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTDLG_POLICY_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global POLICY_IGNORE_NON_CRITICAL_BC := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTDLG_ACTION_MASK := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global ACTION_REVOCATION_DEFAULT_ONLINE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global ACTION_REVOCATION_DEFAULT_CACHE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISPWELL_SELECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISPWELL_TRUST_CA_CERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISPWELL_TRUST_LEAF_CERT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISPWELL_TRUST_ADD_CA_CERT := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISPWELL_TRUST_ADD_LEAF_CERT := 5

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISPWELL_DISTRUST_CA_CERT := 6

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISPWELL_DISTRUST_LEAF_CERT := 7

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISPWELL_DISTRUST_ADD_CA_CERT := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_DISPWELL_DISTRUST_ADD_LEAF_CERT := 9

/**
 * @type {Integer (UInt32)}
 */
export global CSS_SELECTCERT_MASK := 16777215

/**
 * @type {Integer (UInt32)}
 */
export global SELCERT_PROPERTIES := 100

/**
 * @type {Integer (UInt32)}
 */
export global SELCERT_FINEPRINT := 101

/**
 * @type {Integer (UInt32)}
 */
export global SELCERT_CERTLIST := 102

/**
 * @type {Integer (UInt32)}
 */
export global SELCERT_ISSUED_TO := 103

/**
 * @type {Integer (UInt32)}
 */
export global SELCERT_VALIDITY := 104

/**
 * @type {Integer (UInt32)}
 */
export global SELCERT_ALGORITHM := 105

/**
 * @type {Integer (UInt32)}
 */
export global SELCERT_SERIAL_NUM := 106

/**
 * @type {Integer (UInt32)}
 */
export global SELCERT_THUMBPRINT := 107

/**
 * @type {Integer (UInt32)}
 */
export global CM_VIEWFLAGS_MASK := 16777215

/**
 * @type {Integer (UInt32)}
 */
export global CERTVIEW_CRYPTUI_LPARAM := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILTER_OP_EXISTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILTER_OP_NOT_EXISTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILTER_OP_EQUALITY := 3

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILTER_INCLUDE_V1_CERTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILTER_VALID_TIME_RANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILTER_VALID_SIGNATURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILTER_LEAF_CERTS_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILTER_ISSUER_CERTS_ONLY := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_FILTER_KEY_EXISTS := 32

/**
 * @type {Guid}
 */
export global CERT_CERTIFICATE_ACTION_VERIFY := Guid("{7801ebd0-cf4b-11d0-851f-0060979387ea}")

/**
 * @type {String}
 */
export global szCERT_CERTIFICATE_ACTION_VERIFY := "{7801ebd0-cf4b-11d0-851f-0060979387ea}"

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_BEFORE_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_AFTER_END := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_SIGNATURE_FAILS := 4

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_CERTIFICATE_REVOKED := 8

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_KEY_USAGE_EXT_FAILURE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_EXTENDED_USAGE_FAILURE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_NAME_CONSTRAINTS_FAILURE := 64

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_UNKNOWN_CRITICAL_EXTENSION := 128

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_ISSUER_INVALID := 256

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_OTHER_EXTENSION_FAILURE := 512

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_PERIOD_NESTING_FAILURE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_OTHER_ERROR := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_ISSUER_DISTRUST := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_EXPLICITLY_DISTRUSTED := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_NO_ISSUER_CERT_FOUND := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_NO_CRL_FOUND := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_CRL_OUT_OF_DATE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_NO_TRUST_DATA := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_MASK_TRUST := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global CERT_VALIDITY_MASK_VALIDITY := 65535

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_MASK := 16777215

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_DO_FULL_SEARCH := 1

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_PERMIT_MISSING_CRLS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CERT_TRUST_DO_FULL_TRUST := 5

/**
 * @type {Integer (Int32)}
 */
export global CERT_CREDENTIAL_PROVIDER_ID := -509

/**
 * @type {Integer (UInt64)}
 */
export global CRYPTUI_SELECT_ISSUEDTO_COLUMN := 1

/**
 * @type {Integer (UInt64)}
 */
export global CRYPTUI_SELECT_ISSUEDBY_COLUMN := 2

/**
 * @type {Integer (UInt64)}
 */
export global CRYPTUI_SELECT_INTENDEDUSE_COLUMN := 4

/**
 * @type {Integer (UInt64)}
 */
export global CRYPTUI_SELECT_FRIENDLYNAME_COLUMN := 8

/**
 * @type {Integer (UInt64)}
 */
export global CRYPTUI_SELECT_LOCATION_COLUMN := 16

/**
 * @type {Integer (UInt64)}
 */
export global CRYPTUI_SELECT_EXPIRATION_COLUMN := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTUI_CERT_MGR_TAB_MASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTUI_CERT_MGR_PUBLISHER_TAB := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTUI_CERT_MGR_SINGLE_TAB_FLAG := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTUI_WIZ_DIGITAL_SIGN_EXCLUDE_PAGE_HASHES := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTUI_WIZ_DIGITAL_SIGN_INCLUDE_PAGE_HASHES := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRYPTUI_WIZ_EXPORT_FORMAT_SERIALIZED_CERT_STORE := 5
;@endregion Constants
