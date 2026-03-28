#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 * @version v4.0.30319
 */
class WebAuthn {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_VERSION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_VERSION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_VERSION_6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_VERSION_7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_VERSION_8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_VERSION_9 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_CURRENT_VERSION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_RP_ENTITY_INFORMATION_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_RP_ENTITY_INFORMATION_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_MAX_USER_ID_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_ENTITY_INFORMATION_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_ENTITY_INFORMATION_CURRENT_VERSION => 1

    /**
     * @type {String}
     */
    static WEBAUTHN_HASH_ALGORITHM_SHA_256 => "SHA-256"

    /**
     * @type {String}
     */
    static WEBAUTHN_HASH_ALGORITHM_SHA_384 => "SHA-384"

    /**
     * @type {String}
     */
    static WEBAUTHN_HASH_ALGORITHM_SHA_512 => "SHA-512"

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CLIENT_DATA_CURRENT_VERSION => 1

    /**
     * @type {String}
     */
    static WEBAUTHN_CREDENTIAL_TYPE_PUBLIC_KEY => "public-key"

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_COSE_ALGORITHM_ECDSA_P256_WITH_SHA256 => -7

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_COSE_ALGORITHM_ECDSA_P384_WITH_SHA384 => -35

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_COSE_ALGORITHM_ECDSA_P521_WITH_SHA512 => -36

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA256 => -257

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA384 => -258

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_COSE_ALGORITHM_RSASSA_PKCS1_V1_5_WITH_SHA512 => -259

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA256 => -37

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA384 => -38

    /**
     * @type {Integer (Int32)}
     */
    static WEBAUTHN_COSE_ALGORITHM_RSA_PSS_WITH_SHA512 => -39

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_COSE_CREDENTIAL_PARAMETER_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAP_TRANSPORT_USB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAP_TRANSPORT_NFC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAP_TRANSPORT_BLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAP_TRANSPORT_TEST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAP_TRANSPORT_INTERNAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAP_TRANSPORT_HYBRID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAP_TRANSPORT_SMART_CARD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAP_TRANSPORT_FLAGS_MASK => 127

    /**
     * @type {String}
     */
    static WEBAUTHN_CTAP_TRANSPORT_USB_STRING => "usb"

    /**
     * @type {String}
     */
    static WEBAUTHN_CTAP_TRANSPORT_NFC_STRING => "nfc"

    /**
     * @type {String}
     */
    static WEBAUTHN_CTAP_TRANSPORT_BLE_STRING => "ble"

    /**
     * @type {String}
     */
    static WEBAUTHN_CTAP_TRANSPORT_SMART_CARD_STRING => "smart-card"

    /**
     * @type {String}
     */
    static WEBAUTHN_CTAP_TRANSPORT_HYBRID_STRING => "hybrid"

    /**
     * @type {String}
     */
    static WEBAUTHN_CTAP_TRANSPORT_INTERNAL_STRING => "internal"

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_EX_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTAPCBOR_HYBRID_STORAGE_LINKED_DATA_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTAPCBOR_HYBRID_STORAGE_LINKED_DATA_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_DETAILS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_DETAILS_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_DETAILS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_DETAILS_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_DETAILS_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_DETAILS_VERSION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_DETAILS_CURRENT_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_GET_CREDENTIALS_OPTIONS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_GET_CREDENTIALS_OPTIONS_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAP_ONE_HMAC_SECRET_LENGTH => 32

    /**
     * @type {String}
     */
    static WEBAUTHN_EXTENSIONS_IDENTIFIER_HMAC_SECRET => "hmac-secret"

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_VERIFICATION_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_VERIFICATION_OPTIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_VERIFICATION_OPTIONAL_WITH_CREDENTIAL_ID_LIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_VERIFICATION_REQUIRED => 3

    /**
     * @type {String}
     */
    static WEBAUTHN_EXTENSIONS_IDENTIFIER_CRED_PROTECT => "credProtect"

    /**
     * @type {String}
     */
    static WEBAUTHN_EXTENSIONS_IDENTIFIER_CRED_BLOB => "credBlob"

    /**
     * @type {String}
     */
    static WEBAUTHN_EXTENSIONS_IDENTIFIER_MIN_PIN_LENGTH => "minPinLength"

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_ATTACHMENT_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_ATTACHMENT_PLATFORM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_ATTACHMENT_CROSS_PLATFORM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_ATTACHMENT_CROSS_PLATFORM_U2F_V2 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_VERIFICATION_REQUIREMENT_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_VERIFICATION_REQUIREMENT_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_VERIFICATION_REQUIREMENT_PREFERRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_USER_VERIFICATION_REQUIREMENT_DISCOURAGED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_INDIRECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ATTESTATION_CONVEYANCE_PREFERENCE_DIRECT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ENTERPRISE_ATTESTATION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ENTERPRISE_ATTESTATION_VENDOR_FACILITATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ENTERPRISE_ATTESTATION_PLATFORM_MANAGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_LARGE_BLOB_SUPPORT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_LARGE_BLOB_SUPPORT_REQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_LARGE_BLOB_SUPPORT_PREFERRED => 2

    /**
     * @type {String}
     */
    static WEBAUTHN_CREDENTIAL_HINT_SECURITY_KEY => "security-key"

    /**
     * @type {String}
     */
    static WEBAUTHN_CREDENTIAL_HINT_CLIENT_DEVICE => "client-device"

    /**
     * @type {String}
     */
    static WEBAUTHN_CREDENTIAL_HINT_HYBRID => "hybrid"

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_9 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_CURRENT_VERSION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_OPERATION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_OPERATION_GET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_OPERATION_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_OPERATION_DELETE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_VERSION_9 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_CURRENT_VERSION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_HMAC_SECRET_VALUES_FLAG => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ATTESTATION_DECODE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ATTESTATION_DECODE_COMMON => 1

    /**
     * @type {String}
     */
    static WEBAUTHN_ATTESTATION_VER_TPM_2_0 => "2.0"

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_COMMON_ATTESTATION_CURRENT_VERSION => 1

    /**
     * @type {String}
     */
    static WEBAUTHN_ATTESTATION_TYPE_PACKED => "packed"

    /**
     * @type {String}
     */
    static WEBAUTHN_ATTESTATION_TYPE_U2F => "fido-u2f"

    /**
     * @type {String}
     */
    static WEBAUTHN_ATTESTATION_TYPE_TPM => "tpm"

    /**
     * @type {String}
     */
    static WEBAUTHN_ATTESTATION_TYPE_NONE => "none"

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_CURRENT_VERSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_NOT_SUPPORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_INVALID_DATA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_INVALID_PARAMETER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_NOT_FOUND => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_MULTIPLE_CREDENTIALS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_LACK_OF_SPACE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_PLATFORM_ERROR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CRED_LARGE_BLOB_STATUS_AUTHENTICATOR_ERROR => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ASSERTION_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ASSERTION_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ASSERTION_VERSION_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ASSERTION_VERSION_4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ASSERTION_VERSION_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ASSERTION_VERSION_6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_ASSERTION_CURRENT_VERSION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST_CURRENT_VERSION => 1
;@endregion Constants

;@region Methods
    /**
     * Gets the API version number.
     * @returns {Integer} The WebAuthN API version number.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetapiversionnumber
     */
    static WebAuthNGetApiVersionNumber() {
        result := DllCall("webauthn.dll\WebAuthNGetApiVersionNumber", "uint")
        return result
    }

    /**
     * Determines if the platform authenticator service is available.
     * @returns {BOOL} A pointer to a **BOOL** that is set to **TRUE** if the authenticator service is available, or **FALSE** otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnisuserverifyingplatformauthenticatoravailable
     */
    static WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable() {
        result := DllCall("webauthn.dll\WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable", "int*", &pbIsUserVerifyingPlatformAuthenticatorAvailable := 0, "HRESULT")
        return pbIsUserVerifyingPlatformAuthenticatorAvailable
    }

    /**
     * Creates a public key credential source bound to a managing authenticator and returns the credential public key associated with its credential private key.
     * @param {HWND} _hWnd 
     * @param {Pointer<WEBAUTHN_RP_ENTITY_INFORMATION>} pRpInformation The Relying Party's **WEBAUTHN_RP_ENTITY_INFORMATION**.
     * @param {Pointer<WEBAUTHN_USER_ENTITY_INFORMATION>} pUserInformation The user account’s **WEBAUTHN_USER_ENTITY_INFORMATION**, containing the user handle given by the Relying Party.
     * @param {Pointer<WEBAUTHN_COSE_CREDENTIAL_PARAMETERS>} pPubKeyCredParams A sequence of pairs of public key credential type and public key algorithms requested by the Relying Party. This sequence is ordered from most preferred to least preferred. The authenticator makes a best-effort to create the most preferred credential that it can.
     * @param {Pointer<WEBAUTHN_CLIENT_DATA>} pWebAuthNClientData The client data to be sent to the authenticator for the Relying Party.
     * @param {Pointer<WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS>} pWebAuthNMakeCredentialOptions Provides the options to use when creating the public key credential source.
     * @returns {Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>} On successful completion of this operation, the authenticator returns the attestation object to the client.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnauthenticatormakecredential
     */
    static WebAuthNAuthenticatorMakeCredential(_hWnd, pRpInformation, pUserInformation, pPubKeyCredParams, pWebAuthNClientData, pWebAuthNMakeCredentialOptions) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := DllCall("webauthn.dll\WebAuthNAuthenticatorMakeCredential", "ptr", _hWnd, "ptr", pRpInformation, "ptr", pUserInformation, "ptr", pPubKeyCredParams, "ptr", pWebAuthNClientData, "ptr", pWebAuthNMakeCredentialOptions, "ptr*", &ppWebAuthNCredentialAttestation := 0, "HRESULT")
        return ppWebAuthNCredentialAttestation
    }

    /**
     * Produces an assertion signature representing an assertion by the authenticator that the user has consented to a specific transaction.
     * @remarks
     * > Note:
     * > Before performing this operation, all other operations in progress in the authenticator session MUST be aborted by running the [WebAuthNCancelCurrentOperation](./nf-webauthn-webauthncancelcurrentoperation.md) operation.
     * 
     * If the authenticator cannot find any credential corresponding to the specified Relying Party that matches the specified criteria, it terminates the operation and returns an error.
     * @param {HWND} _hWnd 
     * @param {PWSTR} pwszRpId The ID of the Relying Party.
     * @param {Pointer<WEBAUTHN_CLIENT_DATA>} pWebAuthNClientData The client data to be sent to the authenticator for the Relying Party.
     * @param {Pointer<WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS>} pWebAuthNGetAssertionOptions The options for the **WebAuthNAuthenticatorGetAssertion** operation.
     * @returns {Pointer<WEBAUTHN_ASSERTION>} A pointer to a **WEBAUTHN_ASSERTION** that receives the assertion.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnauthenticatorgetassertion
     */
    static WebAuthNAuthenticatorGetAssertion(_hWnd, pwszRpId, pWebAuthNClientData, pWebAuthNGetAssertionOptions) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd
        pwszRpId := pwszRpId is String ? StrPtr(pwszRpId) : pwszRpId

        result := DllCall("webauthn.dll\WebAuthNAuthenticatorGetAssertion", "ptr", _hWnd, "ptr", pwszRpId, "ptr", pWebAuthNClientData, "ptr", pWebAuthNGetAssertionOptions, "ptr*", &ppWebAuthNAssertion := 0, "HRESULT")
        return ppWebAuthNAssertion
    }

    /**
     * Frees a previously allocated credential attestation.
     * @param {Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>} pWebAuthNCredentialAttestation The credential attestation to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreecredentialattestation
     */
    static WebAuthNFreeCredentialAttestation(pWebAuthNCredentialAttestation) {
        DllCall("webauthn.dll\WebAuthNFreeCredentialAttestation", "ptr", pWebAuthNCredentialAttestation)
    }

    /**
     * Frees a previously allocated WebAuthN assertion.
     * @param {Pointer<WEBAUTHN_ASSERTION>} pWebAuthNAssertion The **WEBAUTHN_ASSERTION** to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreeassertion
     */
    static WebAuthNFreeAssertion(pWebAuthNAssertion) {
        DllCall("webauthn.dll\WebAuthNFreeAssertion", "ptr", pWebAuthNAssertion)
    }

    /**
     * Gets the cancellation ID for a canceled operation.
     * @param {Pointer<Guid>} pCancellationId The **GUID** returned, representing the ID of the cancelled operation.
     * @returns {HRESULT} An **HRESULT** indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetcancellationid
     */
    static WebAuthNGetCancellationId(pCancellationId) {
        result := DllCall("webauthn.dll\WebAuthNGetCancellationId", "ptr", pCancellationId, "HRESULT")
        return result
    }

    /**
     * Terminates operation currently in progress in the authenticator session.
     * @remarks
     * This operation is ignored if it is invoked in an authenticator session which does not have an **WebAuthNAuthenticatorMakeCredential** or **WebAuthNAuthenticatorGetAssertion** operation currently in progress.
     * @param {Pointer<Guid>} pCancellationId The **GUID** returned, representing the ID of the cancelled operation.
     * @returns {HRESULT} Returns an **HRESULT** indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthncancelcurrentoperation
     */
    static WebAuthNCancelCurrentOperation(pCancellationId) {
        result := DllCall("webauthn.dll\WebAuthNCancelCurrentOperation", "ptr", pCancellationId, "HRESULT")
        return result
    }

    /**
     * Gets the list of stored credentials.
     * @param {Pointer<WEBAUTHN_GET_CREDENTIALS_OPTIONS>} pGetCredentialsOptions The options for the operation.
     * @returns {Pointer<WEBAUTHN_CREDENTIAL_DETAILS_LIST>} The credentials list returned by the operation.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetplatformcredentiallist
     */
    static WebAuthNGetPlatformCredentialList(pGetCredentialsOptions) {
        result := DllCall("webauthn.dll\WebAuthNGetPlatformCredentialList", "ptr", pGetCredentialsOptions, "ptr*", &ppCredentialDetailsList := 0, "HRESULT")
        return ppCredentialDetailsList
    }

    /**
     * Frees the allocation for the platform credential list.
     * @param {Pointer<WEBAUTHN_CREDENTIAL_DETAILS_LIST>} pCredentialDetailsList The platform credential list to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreeplatformcredentiallist
     */
    static WebAuthNFreePlatformCredentialList(pCredentialDetailsList) {
        DllCall("webauthn.dll\WebAuthNFreePlatformCredentialList", "ptr", pCredentialDetailsList)
    }

    /**
     * Removes a credential source stored on an authenticator.
     * @param {Integer} cbCredentialId The ID of the credential to be removed.
     * @param {Pointer} pbCredentialId A pointer to the credential ID to be removed.
     * @returns {HRESULT} Returns an **HRESULT** indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthndeleteplatformcredential
     */
    static WebAuthNDeletePlatformCredential(cbCredentialId, pbCredentialId) {
        result := DllCall("webauthn.dll\WebAuthNDeletePlatformCredential", "uint", cbCredentialId, "ptr", pbCredentialId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_AUTHENTICATOR_DETAILS_OPTIONS>} pWebAuthNGetAuthenticatorListOptions 
     * @returns {Pointer<WEBAUTHN_AUTHENTICATOR_DETAILS_LIST>} 
     */
    static WebAuthNGetAuthenticatorList(pWebAuthNGetAuthenticatorListOptions) {
        result := DllCall("webauthn.dll\WebAuthNGetAuthenticatorList", "ptr", pWebAuthNGetAuthenticatorListOptions, "ptr*", &ppAuthenticatorDetailsList := 0, "HRESULT")
        return ppAuthenticatorDetailsList
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_AUTHENTICATOR_DETAILS_LIST>} pAuthenticatorDetailsList 
     * @returns {String} Nothing - always returns an empty string
     */
    static WebAuthNFreeAuthenticatorList(pAuthenticatorDetailsList) {
        DllCall("webauthn.dll\WebAuthNFreeAuthenticatorList", "ptr", pAuthenticatorDetailsList)
    }

    /**
     * Gets the error name for an error code.
     * @remarks
     * Returns the following error codes:
     * 
     * | Error Code | Error Name |
     * |------------|------------|
     * | **S_OK** | Success |
     * | **NTE_EXISTS** | InvalidStateError |
     * | **HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)**<br>**NTE_NOT_SUPPORTED**<br>**NTE_TOKEN_KEYSET_STORAGE_FULL** | ConstraintError |
     * | **NTE_INVALID_PARAMETER** | NotSupporedError |
     * | **NTE_DEVICE_NOT_FOUND**<br>**NTE_NOT_FOUND**<br>**HRESULT_FROM_WIN32(ERROR_CANCELLED)**<br>**NTE_USER_CANCELLED**<br>**HRESULT_FROM_WIN32(ERROR_TIMEOUT)** | NotAllowedError |
     * | All other **HRESULT** values | UnknownError |
     * @param {HRESULT} hr The **HRESULT** to get the error name for.
     * @returns {PWSTR} An error name string.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngeterrorname
     */
    static WebAuthNGetErrorName(hr) {
        result := DllCall("webauthn.dll\WebAuthNGetErrorName", "int", hr, "ptr")
        return result
    }

    /**
     * Gets the W3C DOM error code for the last failed operation.
     * @param {HRESULT} hr The **HRESULT** returned by the last failed operation in the session.
     * @returns {HRESULT} An **HRESULT** with the failure status.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetw3cexceptiondomerror
     */
    static WebAuthNGetW3CExceptionDOMError(hr) {
        result := DllCall("webauthn.dll\WebAuthNGetW3CExceptionDOMError", "int", hr, "HRESULT")
        return result
    }

;@endregion Methods
}
