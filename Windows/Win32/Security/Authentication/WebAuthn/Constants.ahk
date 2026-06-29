#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_VERSION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_VERSION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_VERSION_6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_VERSION_7 := 7

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_VERSION_8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_VERSION_9 := 9

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_API_CURRENT_VERSION := 9

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_RP_ENTITY_INFORMATION_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_RP_ENTITY_INFORMATION_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_MAX_USER_ID_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_ENTITY_INFORMATION_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_ENTITY_INFORMATION_CURRENT_VERSION := 1

/**
 * @type {String}
 */
export global WEBAUTHN_HASH_ALGORITHM_SHA_256 := "SHA-256"

/**
 * @type {String}
 */
export global WEBAUTHN_HASH_ALGORITHM_SHA_384 := "SHA-384"

/**
 * @type {String}
 */
export global WEBAUTHN_HASH_ALGORITHM_SHA_512 := "SHA-512"

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CLIENT_DATA_CURRENT_VERSION := 1

/**
 * @type {String}
 */
export global WEBAUTHN_CREDENTIAL_TYPE_PUBLIC_KEY := "public-key"

/**
 * @type {Integer (Int32)}
 */
export global WEBAUTHN_COSE_ALGORITHM_ECDSA_P256_WITH_SHA256 := -7

/**
 * @type {Integer (Int32)}
 */
export global WEBAUTHN_COSE_ALGORITHM_ECDSA_P384_WITH_SHA384 := -35

/**
 * @type {Integer (Int32)}
 */
export global WEBAUTHN_COSE_ALGORITHM_ECDSA_P521_WITH_SHA512 := -36

/**
 * @type {Integer (Int32)}
 */
export global WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA256 := -257

/**
 * @type {Integer (Int32)}
 */
export global WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA384 := -258

/**
 * @type {Integer (Int32)}
 */
export global WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA512 := -259

/**
 * @type {Integer (Int32)}
 */
export global WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA256 := -37

/**
 * @type {Integer (Int32)}
 */
export global WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA384 := -38

/**
 * @type {Integer (Int32)}
 */
export global WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA512 := -39

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_COSE_CREDENTIAL_PARAMETER_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAP_TRANSPORT_USB := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAP_TRANSPORT_NFC := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAP_TRANSPORT_BLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAP_TRANSPORT_TEST := 8

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAP_TRANSPORT_INTERNAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAP_TRANSPORT_HYBRID := 32

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAP_TRANSPORT_SMART_CARD := 64

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAP_TRANSPORT_FLAGS_MASK := 127

/**
 * @type {String}
 */
export global WEBAUTHN_CTAP_TRANSPORT_USB_STRING := "usb"

/**
 * @type {String}
 */
export global WEBAUTHN_CTAP_TRANSPORT_NFC_STRING := "nfc"

/**
 * @type {String}
 */
export global WEBAUTHN_CTAP_TRANSPORT_BLE_STRING := "ble"

/**
 * @type {String}
 */
export global WEBAUTHN_CTAP_TRANSPORT_SMART_CARD_STRING := "smart-card"

/**
 * @type {String}
 */
export global WEBAUTHN_CTAP_TRANSPORT_HYBRID_STRING := "hybrid"

/**
 * @type {String}
 */
export global WEBAUTHN_CTAP_TRANSPORT_INTERNAL_STRING := "internal"

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_EX_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTAPCBOR_HYBRID_STORAGE_LINKED_DATA_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTAPCBOR_HYBRID_STORAGE_LINKED_DATA_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_DETAILS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_DETAILS_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_DETAILS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_DETAILS_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_DETAILS_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_DETAILS_VERSION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_DETAILS_CURRENT_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_GET_CREDENTIALS_OPTIONS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_GET_CREDENTIALS_OPTIONS_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAP_ONE_HMAC_SECRET_LENGTH := 32

/**
 * @type {String}
 */
export global WEBAUTHN_EXTENSIONS_IDENTIFIER_HMAC_SECRET := "hmac-secret"

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_VERIFICATION_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_VERIFICATION_OPTIONAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_VERIFICATION_OPTIONAL_WITH_CREDENTIAL_ID_LIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_VERIFICATION_REQUIRED := 3

/**
 * @type {String}
 */
export global WEBAUTHN_EXTENSIONS_IDENTIFIER_CRED_PROTECT := "credProtect"

/**
 * @type {String}
 */
export global WEBAUTHN_EXTENSIONS_IDENTIFIER_CRED_BLOB := "credBlob"

/**
 * @type {String}
 */
export global WEBAUTHN_EXTENSIONS_IDENTIFIER_MIN_PIN_LENGTH := "minPinLength"

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_ATTACHMENT_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_ATTACHMENT_PLATFORM := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_ATTACHMENT_CROSS_PLATFORM := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_ATTACHMENT_CROSS_PLATFORM_U2F_V2 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_VERIFICATION_REQUIREMENT_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_VERIFICATION_REQUIREMENT_REQUIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_VERIFICATION_REQUIREMENT_PREFERRED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_USER_VERIFICATION_REQUIREMENT_DISCOURAGED := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_INDIRECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_DIRECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ENTERPRISE_ATTESTATION_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ENTERPRISE_ATTESTATION_VENDOR_FACILITATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ENTERPRISE_ATTESTATION_PLATFORM_MANAGED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_LARGE_BLOB_SUPPORT_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_LARGE_BLOB_SUPPORT_REQUIRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_LARGE_BLOB_SUPPORT_PREFERRED := 2

/**
 * @type {String}
 */
export global WEBAUTHN_CREDENTIAL_HINT_SECURITY_KEY := "security-key"

/**
 * @type {String}
 */
export global WEBAUTHN_CREDENTIAL_HINT_CLIENT_DEVICE := "client-device"

/**
 * @type {String}
 */
export global WEBAUTHN_CREDENTIAL_HINT_HYBRID := "hybrid"

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_7 := 7

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_9 := 9

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_CURRENT_VERSION := 9

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_OPERATION_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_OPERATION_GET := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_OPERATION_SET := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_OPERATION_DELETE := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_7 := 7

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_9 := 9

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_CURRENT_VERSION := 9

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_AUTHENTICATOR_HMAC_SECRET_VALUES_FLAG := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ATTESTATION_DECODE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ATTESTATION_DECODE_COMMON := 1

/**
 * @type {String}
 */
export global WEBAUTHN_ATTESTATION_VER_TPM_2_0 := "2.0"

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_COMMON_ATTESTATION_CURRENT_VERSION := 1

/**
 * @type {String}
 */
export global WEBAUTHN_ATTESTATION_TYPE_PACKED := "packed"

/**
 * @type {String}
 */
export global WEBAUTHN_ATTESTATION_TYPE_U2F := "fido-u2f"

/**
 * @type {String}
 */
export global WEBAUTHN_ATTESTATION_TYPE_TPM := "tpm"

/**
 * @type {String}
 */
export global WEBAUTHN_ATTESTATION_TYPE_NONE := "none"

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_7 := 7

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CREDENTIAL_ATTESTATION_CURRENT_VERSION := 8

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_SUCCESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_NOT_SUPPORTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_INVALID_DATA := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_INVALID_PARAMETER := 4

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_NOT_FOUND := 5

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_MULTIPLE_CREDENTIALS := 6

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_LACK_OF_SPACE := 7

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_PLATFORM_ERROR := 8

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CRED_LARGE_BLOB_STATUS_AUTHENTICATOR_ERROR := 9

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ASSERTION_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ASSERTION_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ASSERTION_VERSION_3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ASSERTION_VERSION_4 := 4

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ASSERTION_VERSION_5 := 5

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ASSERTION_VERSION_6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_ASSERTION_CURRENT_VERSION := 6

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_CURRENT_VERSION := 1
;@endregion Constants
