#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WindowsWebServices {

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
    static EXPERIMENTAL_WEBAUTHN_API_VERSION_8 => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_API_CURRENT_VERSION => 7

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
    static WEBAUTHN_CTAP_TRANSPORT_FLAGS_MASK => 63

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
    static WEBAUTHN_CREDENTIAL_DETAILS_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_DETAILS_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXPERIMENTAL_WEBAUTHN_CREDENTIAL_DETAILS_VERSION_3 => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_DETAILS_CURRENT_VERSION => 2

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
    static EXPERIMENTAL_WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_VERSION_8 => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS_CURRENT_VERSION => 7

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
    static WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS_CURRENT_VERSION => 7

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
    static EXPERIMENTAL_WEBAUTHN_CREDENTIAL_ATTESTATION_VERSION_7 => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static WEBAUTHN_CREDENTIAL_ATTESTATION_CURRENT_VERSION => 6

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
    static WEBAUTHN_ASSERTION_CURRENT_VERSION => 5

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
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_MAPPING_COMMA_SEPARATOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_MAPPING_SEMICOLON_SEPARATOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_MAPPING_QUOTED_VALUE => 4

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_RESPONSE_MAPPING_STATUS_CODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_RESPONSE_MAPPING_STATUS_TEXT => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_REQUEST_MAPPING_VERB => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_DNS_HOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_DNS_FULLY_QUALIFIED_HOST => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_NETBIOS_HOST => 4

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_LOCAL_HOST => 8

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_HOST_ADDRESSES => 16

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_THIS_HOST => 31

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_PORT => 32

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_EXACT_PATH => 64

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_PREFIX_PATH => 128

    /**
     * @type {Integer (Int32)}
     */
    static WS_MATCH_URL_NO_QUERY => 256

    /**
     * @type {Integer (Int32)}
     */
    static WS_MUST_UNDERSTAND_HEADER_ATTRIBUTE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_RELAY_HEADER_ATTRIBUTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_SCHEME_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_SCHEME_BASIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_SCHEME_DIGEST => 4

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_SCHEME_NTLM => 8

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_SCHEME_NEGOTIATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static WS_HTTP_HEADER_AUTH_SCHEME_PASSPORT => 32

    /**
     * @type {Integer (Int32)}
     */
    static WS_CERT_FAILURE_CN_MISMATCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_CERT_FAILURE_INVALID_DATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_CERT_FAILURE_UNTRUSTED_ROOT => 4

    /**
     * @type {Integer (Int32)}
     */
    static WS_CERT_FAILURE_WRONG_USAGE => 8

    /**
     * @type {Integer (Int32)}
     */
    static WS_CERT_FAILURE_REVOCATION_OFFLINE => 16

    /**
     * @type {Integer (Int32)}
     */
    static WS_STRUCT_ABSTRACT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_STRUCT_IGNORE_TRAILING_ELEMENT_CONTENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_STRUCT_IGNORE_UNHANDLED_ATTRIBUTES => 4

    /**
     * @type {Integer (Int32)}
     */
    static WS_FIELD_POINTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_FIELD_OPTIONAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_FIELD_NILLABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static WS_FIELD_NILLABLE_ITEM => 8

    /**
     * @type {Integer (Int32)}
     */
    static WS_FIELD_OTHER_NAMESPACE => 16

    /**
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_OPERATION_MESSAGE_NILLABLE_ELEMENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_URL_FLAGS_ALLOW_HOST_WILDCARDS => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_URL_FLAGS_NO_PATH_COLLAPSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_URL_FLAGS_ZERO_TERMINATE => 4
;@endregion Constants

;@region Methods
    /**
     * This operation begins the process of putting the specified XML Reader in a standard or &quot;canonized&quot; form.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object on which canonicalization is started.  The pointer must reference a valid <b>XML Reader</b> object.
     * @param {Pointer<WS_WRITE_CALLBACK>} writeCallback A  callback function invoked to write the canonical bytes as they are generated.
     *           <div class="alert"><b>Note</b>  This callback is invoked synchronously.</div>
     * <div> </div>
     * @param {Pointer<Void>} writeCallbackState A pointer to a caller-defined state that is passed when invoking the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">WS_WRITE_CALLBACK</a>.
     * @param {Pointer<WS_XML_CANONICALIZATION_PROPERTY>} properties An "array" reference of optional properties controlling how canonicalization is performed.  <div class="alert"><b>Note</b>  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_canonicalization_property">WS_XML_CANONICALIZATION_PROPERTY</a> for details.</div>
     * <div> </div>
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsstartreadercanonicalization
     * @since windows6.1
     */
    static WsStartReaderCanonicalization(reader, writeCallback, writeCallbackState, properties, propertyCount, error) {
        writeCallbackStateMarshal := writeCallbackState is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsStartReaderCanonicalization", "ptr", reader, "ptr", writeCallback, writeCallbackStateMarshal, writeCallbackState, "ptr", properties, "uint", propertyCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function stops XML canonicalization started by a preceding WsStartReaderCanonicalization function call. Any remaining canonical bytes buffered by the reader will be written to the callback function.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the XML reader on which canonicalization should be stopped.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsendreadercanonicalization
     * @since windows6.1
     */
    static WsEndReaderCanonicalization(reader, error) {
        result := DllCall("webservices.dll\WsEndReaderCanonicalization", "ptr", reader, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Starts canonicalization on the specified XML writer.
     * @param {Pointer<WS_XML_WRITER>} writer The XML writer on which canonicalization should be started.
     * @param {Pointer<WS_WRITE_CALLBACK>} writeCallback The callback that to be invoked to write the canonical bytes as they are generated. This callback will always be invoked synchronously.
     * @param {Pointer<Void>} writeCallbackState Caller-defined state that should be passed when invoking the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">WS_WRITE_CALLBACK</a>.
     * @param {Pointer<WS_XML_CANONICALIZATION_PROPERTY>} properties An array of optional properties controlling how canonicalization is to be performed.  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_canonicalization_property">WS_XML_CANONICALIZATION_PROPERTY</a>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsstartwritercanonicalization
     * @since windows6.1
     */
    static WsStartWriterCanonicalization(writer, writeCallback, writeCallbackState, properties, propertyCount, error) {
        writeCallbackStateMarshal := writeCallbackState is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsStartWriterCanonicalization", "ptr", writer, "ptr", writeCallback, writeCallbackStateMarshal, writeCallbackState, "ptr", properties, "uint", propertyCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function stops XML canonicalization started by the preceding WsStartWriterCanonicalization call. Remaining canonical bytes buffered by the writer are written to the callback function.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object on which canonicalization should be stopped.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsendwritercanonicalization
     * @since windows6.1
     */
    static WsEndWriterCanonicalization(writer, error) {
        result := DllCall("webservices.dll\WsEndWriterCanonicalization", "ptr", writer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an XML Buffer which can be used to process XML data .
     * @param {Pointer<WS_HEAP>} heap Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a> from which to allocate memory for the returned XML buffer.
     * @param {Pointer<WS_XML_BUFFER_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_buffer_property">WS_XML_BUFFER_PROPERTY</a> structures containing optional properties for the XML buffer.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<Pointer<WS_XML_BUFFER>>} buffer On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> structure representing the created XML buffer. The memory for this buffer is released when its heap is reset or released.
     *         
     * 
     * The XML buffer is initially  empty.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatexmlbuffer
     * @since windows6.1
     */
    static WsCreateXmlBuffer(heap, properties, propertyCount, buffer, error) {
        bufferMarshal := buffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateXmlBuffer", "ptr", heap, "ptr", properties, "uint", propertyCount, bufferMarshal, buffer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes the node at the specified position from the xml buffer. If positioned on an element it will remove the element including all of its children and its corresponding end element, otherwise it will remove a single node.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition The position of the node that should be removed.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsremovenode
     * @since windows6.1
     */
    static WsRemoveNode(nodePosition, error) {
        result := DllCall("webservices.dll\WsRemoveNode", "ptr", nodePosition, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an XML reader with the specified properties.
     * @param {Pointer<WS_XML_READER_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_property">WS_XML_READER_PROPERTY</a> structures containing optional properties for the XML reader.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     *                 
     * 
     * For the properties that tiy can use to configure the XML reader, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_reader_property_id">WS_XML_READER_PROPERTY_ID</a> enumeration.
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<Pointer<WS_XML_READER>>} reader On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> structure representing the new XML reader.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreereader">WsFreeReader</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatereader
     * @since windows6.1
     */
    static WsCreateReader(properties, propertyCount, reader, error) {
        readerMarshal := reader is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateReader", "ptr", properties, "uint", propertyCount, readerMarshal, reader, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the encoding and input sources for an XML Reader.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object for which the input will be set.
     * @param {Pointer<WS_XML_READER_ENCODING>} encoding A to an encoding value that describes the format of the input bytes.  This value should be one of:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_text_encoding">WS_XML_READER_TEXT_ENCODING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_binary_encoding">WS_XML_READER_BINARY_ENCODING</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_mtom_encoding">WS_XML_READER_MTOM_ENCODING</a>
     * </li>
     * </ul>
     * @param {Pointer<WS_XML_READER_INPUT>} input A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_input">WS_XML_READER_INPUT</a> structure that indicates the reader type.
     * @param {Pointer<WS_XML_READER_PROPERTY>} properties An array reference of optional Reader properties.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetinput
     * @since windows6.1
     */
    static WsSetInput(reader, encoding, input, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsSetInput", "ptr", reader, "ptr", encoding, "ptr", input, "ptr", properties, "uint", propertyCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets Reader input to a specified XML buffer. Reader properties specified to WsSetInputToBuffer override properties set by WsCreateReader.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object for which the input will be set.
     * @param {Pointer<WS_XML_BUFFER>} buffer A pointer to the XML buffer to read.
     * @param {Pointer<WS_XML_READER_PROPERTY>} properties A pointer that references an array of optional Reader properties.  <div class="alert"><b>Note</b>  For more information see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_property">WS_XML_READER_PROPERTY</a>.</div>
     * <div> </div>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetinputtobuffer
     * @since windows6.1
     */
    static WsSetInputToBuffer(reader, buffer, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsSetInputToBuffer", "ptr", reader, "ptr", buffer, "ptr", properties, "uint", propertyCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory resource associated with an XML_Reader object.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatereader">WsCreateReader</a>    and the referenced <b>XML Reader</b> value may not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreereader
     * @since windows6.1
     */
    static WsFreeReader(reader) {
        DllCall("webservices.dll\WsFreeReader", "ptr", reader)
    }

    /**
     * This function returns a property of the specified XML Reader.
     * @param {Pointer<WS_XML_READER>} reader A pointer to a WS_XML_READER object containing the desired property value.
     * @param {Integer} id An enumerator value identifier of the Reader property.
     * @param {Pointer} value A pointer to the address for returning the retrieved value.
     *             The pointer must have an alignment compatible with the type
     *             of the property.
     * @param {Integer} valueSize A byte count of the buffer that the caller has allocated for the retrieved value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetreaderproperty
     * @since windows6.1
     */
    static WsGetReaderProperty(reader, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetReaderProperty", "ptr", reader, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The function returns the XML node at the current position of the XML reader.
     * @param {Pointer<WS_XML_READER>} xmlReader A pointer to the reader for which the current node will be obtained.  This must be valid WS_XML_READER object.
     * @param {Pointer<Pointer<WS_XML_NODE>>} node A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node">WS_XML_NODE</a> structure where the current node is returned.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetreadernode
     * @since windows6.1
     */
    static WsGetReaderNode(xmlReader, node, error) {
        nodeMarshal := node is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsGetReaderNode", "ptr", xmlReader, nodeMarshal, node, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Ensures that the reader has buffered the minimum byte count of XML data for use by subsequent reader functions.
     * @param {Pointer<WS_XML_READER>} reader A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> structure used for obtaining the data.
     * @param {Integer} minSize Specifies the minimum number of bytes that the reader should have obtained.  If the current byte count buffered is equal to or greater than the value of <i>minSize</i> the function will do nothing and will return immediately.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure with information about invoking the function asynchronously.  A <b>NULL</b> 
     *                  value indicates a request for synchronous operation.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *         
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfillreader
     * @since windows6.1
     */
    static WsFillReader(reader, minSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsFillReader", "ptr", reader, "uint", minSize, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Calling this function advances the reader past a start element skipping any whitespace.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> object used to read the Start element.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadstartelement
     * @since windows6.1
     */
    static WsReadStartElement(reader, error) {
        result := DllCall("webservices.dll\WsReadStartElement", "ptr", reader, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Advances the reader to the next start element skipping whitespace and comments if necessary. Optionally, it may also verify the localName and namespace of the element.
     * @param {Pointer<WS_XML_READER>} reader The reader which is to read to the start element.
     * @param {Pointer<WS_XML_STRING>} localName The localName name that the element should be.  If <b>NULL</b>, any localName is permitted.
     * @param {Pointer<WS_XML_STRING>} ns The namespace that the element should be.  If <b>NULL</b>, any namespace is permitted.
     * @param {Pointer<BOOL>} found If specified then this will indicate whether an element is found and the localName and namespace, if also specified, match.
     *           If not specified, and an element is not found or the localName and namespace don't match, then it will return 
     *           <b>WS_E_INVALID_FORMAT</b>. (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadtostartelement
     * @since windows6.1
     */
    static WsReadToStartElement(reader, localName, ns, found, error) {
        result := DllCall("webservices.dll\WsReadToStartElement", "ptr", reader, "ptr", localName, "ptr", ns, "ptr", found, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Moves the Reader to the specified attribute so that the content may be read using WsReadValue, WsReadChars, or WsReadBytes.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> object used to read the Start attribute.
     * @param {Integer} attributeIndex The index of the attribute to read.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadstartattribute
     * @since windows6.1
     */
    static WsReadStartAttribute(reader, attributeIndex, error) {
        result := DllCall("webservices.dll\WsReadStartAttribute", "ptr", reader, "uint", attributeIndex, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Moves the reader back to the element node containing the attribute that was read.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> that reads the <b>End attribute</b>.
     *                   The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadendattribute
     * @since windows6.1
     */
    static WsReadEndAttribute(reader, error) {
        result := DllCall("webservices.dll\WsReadEndAttribute", "ptr", reader, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This operation advances the Reader to the next node in the input stream.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> object to advance.
     *           The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> and it may not be <b>NULL</b>.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format, or did not have the expected value, or multiple top-level elements were found and <b>WS_XML_READER_PROPERTY_ALLOW_FRAGMENT</b> is <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An element was read that exceeded some limit such as <b>WS_XML_READER_PROPERTY_MAX_DEPTH</b> or <b>WS_XML_READER_PROPERTY_MAX_ATTRIBUTES</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadnode
     * @since windows6.1
     */
    static WsReadNode(reader, error) {
        result := DllCall("webservices.dll\WsReadNode", "ptr", reader, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Advances the reader in the input stream.
     * @param {Pointer<WS_XML_READER>} reader The reader which is to skip to the next node.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsskipnode
     * @since windows6.1
     */
    static WsSkipNode(reader, error) {
        result := DllCall("webservices.dll\WsSkipNode", "ptr", reader, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function ensures that the current Reader node is an End elementand advances the reader to the next node.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> that is reads the <b>End element</b>. The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadendelement
     * @since windows6.1
     */
    static WsReadEndElement(reader, error) {
        result := DllCall("webservices.dll\WsReadEndElement", "ptr", reader, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Searches the attributes of the current element for an attribute with the specified name and namespace and returns its index which may be passed to WsReadStartAttribute.
     * @param {Pointer<WS_XML_READER>} reader The reader on which to find the attribute.
     * @param {Pointer<WS_XML_STRING>} localName The local name of the attribute to search for.
     * @param {Pointer<WS_XML_STRING>} ns The namespace of the attribute to search for.
     * @param {BOOL} required If required is <b>TRUE</b> and the attribute is not found,  the function will return <b>WS_E_INVALID_FORMAT</b>.
     *           (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.) if required is <b>FALSE</b> and the attribute is not found, the function will return S_FALSE.
     * @param {Pointer<Integer>} attributeIndex If the attribute is found, then the index of the attribute, is returned here.
     *           This index can then be passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadstartattribute">WsReadStartAttribute</a>.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfindattribute
     * @since windows6.1
     */
    static WsFindAttribute(reader, localName, ns, required, attributeIndex, error) {
        attributeIndexMarshal := attributeIndex is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsFindAttribute", "ptr", reader, "ptr", localName, "ptr", ns, "int", required, attributeIndexMarshal, attributeIndex, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads text from a Reader and parses it according to the specified value type.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> from which the value is read.
     * @param {Integer} valueType The text interpretation type.
     * @param {Pointer} value A pointer to the parsed data if parsing was successful according to the specified value type.  The size required is determined by value type.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_value_type">WS_VALUE_TYPE</a> for more information.
     * @param {Integer} valueSize The byte size of the retrieved value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadvalue
     * @since windows6.1
     */
    static WsReadValue(reader, valueType, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadValue", "ptr", reader, "int", valueType, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a specified number of text characters from the Reader.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> from which the character data should be read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {PWSTR} chars A pointer to a location for  the characters that have been read.
     * @param {Integer} maxCharCount The maximum number of characters that should be read.
     * @param {Pointer<Integer>} actualCharCount A pointer to a ULONG value of 
     *           the actual number of characters that were read.  This may be less than maxCharCount even when there
     *           are more characters remaining.  There are no more characters when this returns zero.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadchars
     * @since windows6.1
     */
    static WsReadChars(reader, chars, maxCharCount, actualCharCount, error) {
        chars := chars is String ? StrPtr(chars) : chars

        actualCharCountMarshal := actualCharCount is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsReadChars", "ptr", reader, "ptr", chars, "uint", maxCharCount, actualCharCountMarshal, actualCharCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a specified number of text characters from the reader and returns them encoded in UTF-8.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> from which the character data should be read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {Pointer<Integer>} bytes A pointer to the buffer to place the encoded bytes that have been read.
     * @param {Integer} maxByteCount The maximum number of bytes that should be read.
     * @param {Pointer<Integer>} actualByteCount A pointer to a ULONG value of 
     *           the actual number of bytes that were read.  This may be less than maxByteCount even when there
     *           are more bytes remaining.  There are no more bytes when this returns zero.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadcharsutf8
     * @since windows6.1
     */
    static WsReadCharsUtf8(reader, bytes, maxByteCount, actualByteCount, error) {
        bytesMarshal := bytes is VarRef ? "char*" : "ptr"
        actualByteCountMarshal := actualByteCount is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsReadCharsUtf8", "ptr", reader, bytesMarshal, bytes, "uint", maxByteCount, actualByteCountMarshal, actualByteCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads text from the Reader and decodes the characters as bytes according to the base64 specification.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> from which the bytes should be read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {Pointer} bytes A pointer to a location to place the decoded bytes.
     * @param {Integer} maxByteCount The maximum number of bytes that should be read.
     * @param {Pointer<Integer>} actualByteCount A pointer to a ULONG value of 
     *           the actual number of bytes that were read.  This may be less than maxByteCount even when there
     *           are more bytes remaining.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadbytes
     * @since windows6.1
     */
    static WsReadBytes(reader, bytes, maxByteCount, actualByteCount, error) {
        actualByteCountMarshal := actualByteCount is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsReadBytes", "ptr", reader, "ptr", bytes, "uint", maxByteCount, actualByteCountMarshal, actualByteCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a series of elements from the reader and interprets their content according to the specified value type.
     * @param {Pointer<WS_XML_READER>} reader The reader from which the array should be read.
     * @param {Pointer<WS_XML_STRING>} localName The localName of the repeating element.
     * @param {Pointer<WS_XML_STRING>} ns The namespace of the repeating element.
     * @param {Integer} valueType The value type to use to parse the content of each element.
     * @param {Pointer} array The array to populate with parsed values.  The size of the array items is determined by the value type.
     *           See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_value_type">WS_VALUE_TYPE</a> for more information.
     * @param {Integer} arraySize The size in bytes (not items) of the array.
     * @param {Integer} itemOffset The item (not byte) offset within the array at which to read.
     * @param {Integer} itemCount The number of items (not bytes) to read into the array.
     * @param {Pointer<Integer>} actualItemCount The actual number of items that were read.  This may be less than itemCount even when there
     *           are more items remaining.  There are no more elements when this returns zero.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadarray
     * @since windows6.1
     */
    static WsReadArray(reader, localName, ns, valueType, array, arraySize, itemOffset, itemCount, actualItemCount, error) {
        actualItemCountMarshal := actualItemCount is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsReadArray", "ptr", reader, "ptr", localName, "ptr", ns, "int", valueType, "ptr", array, "uint", arraySize, "uint", itemOffset, "uint", itemCount, actualItemCountMarshal, actualItemCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the current position of the reader. This can only be used on a reader that is set to an XmlBuffer.
     * @param {Pointer<WS_XML_READER>} reader The reader for which the current position will be obtained.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition The current position of the reader.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetreaderposition
     * @since windows6.1
     */
    static WsGetReaderPosition(reader, nodePosition, error) {
        result := DllCall("webservices.dll\WsGetReaderPosition", "ptr", reader, "ptr", nodePosition, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the current position of the Reader. The position must have been obtained by a call to WsGetReaderPosition or WsGetWriterPosition. This function can only be used on a reader that is set to a WS_XML_BUFFER.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object for which the current position is set.  The pointer must reference a valid <b>XML Reader</b> object.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition A pointer to the position to set the Reader.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetreaderposition
     * @since windows6.1
     */
    static WsSetReaderPosition(reader, nodePosition, error) {
        result := DllCall("webservices.dll\WsSetReaderPosition", "ptr", reader, "ptr", nodePosition, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Moves the current position of the reader as specified by the moveTo parameter. This function can only be used on a reader that is set to an XmlBuffer.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> object with the position to move.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object and the referenced <b>Reader</b> value may not be <b>NULL</b>.
     * @param {Integer} moveTo This enumerator specifies direction or next position of the Reader relative to the current position.
     * @param {Pointer<BOOL>} found Indicates success or failure of the specified move.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsmovereader
     * @since windows6.1
     */
    static WsMoveReader(reader, moveTo, found, error) {
        result := DllCall("webservices.dll\WsMoveReader", "ptr", reader, "int", moveTo, "ptr", found, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * creates an XML Writer with the specified properties.
     * @param {Pointer<WS_XML_WRITER_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_property">WS_XML_WRITER_PROPERTY</a> structures containing optional properties for the XML writer.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<Pointer<WS_XML_WRITER>>} writer On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> structure representing the created XML writer.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreewriter">WsFreeWriter</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatewriter
     * @since windows6.1
     */
    static WsCreateWriter(properties, propertyCount, writer, error) {
        writerMarshal := writer is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateWriter", "ptr", properties, "uint", propertyCount, writerMarshal, writer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory resource associated with an XML Writer object.
     * @remarks
     * 
     * If necessary, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsflushwriter">WsFlushWriter</a> should be called before calling <b>WsFreeWriter</b> to guarantee
     *         all data is emitted.
     * 
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <b>XML Writer</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatewriter">WsCreateWriter</a> and   the referenced value may not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreewriter
     * @since windows6.1
     */
    static WsFreeWriter(writer) {
        DllCall("webservices.dll\WsFreeWriter", "ptr", writer)
    }

    /**
     * Sets the encoding and output callbacks for the writer. The callbacks are used to provides buffers to the writer and to perform asynchronous i/o.
     * @param {Pointer<WS_XML_WRITER>} writer The writer for which the output will be set.
     * @param {Pointer<WS_XML_WRITER_ENCODING>} encoding The encoding describes the format of the input bytes.  This should be one of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_text_encoding">WS_XML_WRITER_TEXT_ENCODING</a>,
     *           <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_binary_encoding">WS_XML_WRITER_BINARY_ENCODING</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_mtom_encoding">WS_XML_WRITER_MTOM_ENCODING</a>.
     * @param {Pointer<WS_XML_WRITER_OUTPUT>} output Specifies where the writer should place its data.
     * @param {Pointer<WS_XML_WRITER_PROPERTY>} properties An array of optional properties of the writer.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_property">WS_XML_WRITER_PROPERTY</a>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetoutput
     * @since windows6.1
     */
    static WsSetOutput(writer, encoding, output, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsSetOutput", "ptr", writer, "ptr", encoding, "ptr", output, "ptr", properties, "uint", propertyCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This operation positions the Writer at the end of the specified buffer.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object for which the output is set.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_BUFFER>} buffer A pointer to the buffer where the Writer sends the data.
     * @param {Pointer<WS_XML_WRITER_PROPERTY>} properties A WS_XML_WRITER_PROPERTY pointer that  references an "array" of optional Writer properties.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetoutputtobuffer
     * @since windows6.1
     */
    static WsSetOutputToBuffer(writer, buffer, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsSetOutputToBuffer", "ptr", writer, "ptr", buffer, "ptr", properties, "uint", propertyCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a specified XML Writer property. The property to retrieve is identified by a WS_XML WRITER_PROPERTY_ID input parameter.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer  to a WS_XML_WRITER structure that contains the property value to retrieve.
     * @param {Integer} id This is a <b>WS_XML_WRITER_PROPERTY_ID</b> enumerator that identifies the property to retrieve.
     * @param {Pointer} value A void pointer to a location for storing the retrieved property value.
     * @param {Integer} valueSize The byte-length buffer size allocated by the caller to store the retrieved property value.
     *                 The pointer must have an alignment compatible with the type
     *             of the property.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetwriterproperty
     * @since windows6.1
     */
    static WsGetWriterProperty(writer, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetWriterProperty", "ptr", writer, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Instructs the writer to invoke the callbackspecified in WS_XML_WRITER_STREAM_OUTPUT if sufficient data has been buffered.
     * @param {Pointer<WS_XML_WRITER>} writer The writer to flush.
     * @param {Integer} minSize Specifies the minimum number of bytes that must be buffered in order for the
     *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">callback</a> to be invoked. If fewer than this number of bytes
     *           are buffered, then the <b>callback</b> will not be invoked.  This can be
     *           used to minimize the number of i/o's that occur when writing small amounts of data.
     *         
     * 
     * Zero should be specified to guarantee that the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">callback</a> is invoked.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *         
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsflushwriter
     * @since windows6.1
     */
    static WsFlushWriter(writer, minSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsFlushWriter", "ptr", writer, "uint", minSize, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a start element to the writer.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the start element is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_STRING>} prefix A WS_XML_STRING pointer to the prefix to use for the start element.  If the value referenced by this parameter is <b>NULL</b> the Writer will choose a attribute.
     * @param {Pointer<WS_XML_STRING>} localName A WS_XML_STRING pointer to the local name used by the start element.  It must be at least one character long.
     * @param {Pointer<WS_XML_STRING>} ns A WS_XML_STRING pointer to the namespace to be used for the start element.
     *         
     * If no prefix is specified the Writer may use a prefix in scope that is bound to the specified namespace or it may generate a prefix and include an XMLNS attribute. If a prefix is specified the Writer will use that prefix and may include an XMLNS attribute if needed to override an existing prefix in scope.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritestartelement
     * @since windows6.1
     */
    static WsWriteStartElement(writer, prefix, localName, ns, error) {
        result := DllCall("webservices.dll\WsWriteStartElement", "ptr", writer, "ptr", prefix, "ptr", localName, "ptr", ns, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Forces the writer to commit the current element and prevent further attributes from being written to the element.
     * @param {Pointer<WS_XML_WRITER>} writer The writer for which the current element should be committed.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswriteendstartelement
     * @since windows6.1
     */
    static WsWriteEndStartElement(writer, error) {
        result := DllCall("webservices.dll\WsWriteEndStartElement", "ptr", writer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes an Xmlns attribute to the current element.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the Xmlns attribute is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_STRING>} prefix A WS_XML_STRING pointer to the prefix to use for the start element.  If the value referenced by this parameter is <b>NULL</b> the Writer will choose a attribute.
     *         
     * 
     * Specifies the prefix to use for the xmlns attribute.
     * @param {Pointer<WS_XML_STRING>} ns A WS_XML_STRING pointer to the namespace to bind to the prefix.
     * @param {BOOL} singleQuote Determines whether to use a single or a double quote for the attribute value.
     *         <div class="alert"><b>Note</b>  If <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_binary_encoding">WS_XML_WRITER_BINARY_ENCODING</a> is set the quotation character is  not preserved and this
     *           parameter has have no effect.
     *         </div>
     * <div> </div>
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritexmlnsattribute
     * @since windows6.1
     */
    static WsWriteXmlnsAttribute(writer, prefix, ns, singleQuote, error) {
        result := DllCall("webservices.dll\WsWriteXmlnsAttribute", "ptr", writer, "ptr", prefix, "ptr", ns, "int", singleQuote, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This operation starts writing an attribute to the current element.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the attribute is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_STRING>} prefix A WS_XML_STRING pointer to the prefix to use for the attribute.  If the value referenced by this parameter is <b>NULL</b> the Writer will choose a attribute.
     * @param {Pointer<WS_XML_STRING>} localName A WS_XML_STRING pointer to the local name used by the attribute.  It must be at least one character long.
     * @param {Pointer<WS_XML_STRING>} ns A WS_XML_STRING pointer to the namespace to be used for the attribute.
     *         
     * If no prefix is specified the Writer may use a prefix in scope that is bound to the specified namespace or it may generate a prefix and include an XMLNS attribute.
     * 
     * If a prefix is specified the Writer will use that prefix and may include an XMLNS attribute if needed to override an existing prefix in scope.
     * @param {BOOL} singleQuote Determines whether to use a single or a double quote for the attribute value.
     * 
     * <div class="alert"><b>Note</b>  With <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_binary_encoding">WS_XML_WRITER_BINARY_ENCODING</a> the quote character is not preserved and this parameter has no effect.
     * </div>
     * <div> </div>
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritestartattribute
     * @since windows6.1
     */
    static WsWriteStartAttribute(writer, prefix, localName, ns, singleQuote, error) {
        result := DllCall("webservices.dll\WsWriteStartAttribute", "ptr", writer, "ptr", prefix, "ptr", localName, "ptr", ns, "int", singleQuote, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This operation finishes writing an attribute to the current element. If WsWriteStartAttribute is called the Writer does not permit another element or attribute to be written until WsWriteEndAttribute is called.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the attribute is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswriteendattribute
     * @since windows6.1
     */
    static WsWriteEndAttribute(writer, error) {
        result := DllCall("webservices.dll\WsWriteEndAttribute", "ptr", writer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This operation derives the best representation for a primitive value from the underlying encoding and passes the derived value to a Writer object.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the value is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Integer} valueType Indicates the Type of primitive value referenced by the <i>value</i> parameter.
     * 
     * I
     * @param {Pointer} value A void  pointer to the primitive value.
     * @param {Integer} valueSize The size in bytes of the value being written.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritevalue
     * @since windows6.1
     */
    static WsWriteValue(writer, valueType, value, valueSize, error) {
        result := DllCall("webservices.dll\WsWriteValue", "ptr", writer, "int", valueType, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a WS_XML_BUFFER to a writer.
     * @param {Pointer<WS_XML_WRITER>} writer The writer to which the XML buffer will be written.
     * @param {Pointer<WS_XML_BUFFER>} xmlBuffer The XML buffer to write.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritexmlbuffer
     * @since windows6.1
     */
    static WsWriteXmlBuffer(writer, xmlBuffer, error) {
        result := DllCall("webservices.dll\WsWriteXmlBuffer", "ptr", writer, "ptr", xmlBuffer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the current node from a reader into a WS_XML_BUFFER.
     * @param {Pointer<WS_XML_READER>} reader The reader from which to read into the XML buffer.
     * @param {Pointer<WS_HEAP>} heap The heap from which to allocate the XML buffer.
     * @param {Pointer<Pointer<WS_XML_BUFFER>>} xmlBuffer The XML buffer is returned here.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadxmlbuffer
     * @since windows6.1
     */
    static WsReadXmlBuffer(reader, heap, xmlBuffer, error) {
        xmlBufferMarshal := xmlBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsReadXmlBuffer", "ptr", reader, "ptr", heap, xmlBufferMarshal, xmlBuffer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Uses a writer to convert a WS_XML_BUFFER to an encoded set of bytes.
     * @param {Pointer<WS_XML_WRITER>} writer The writer to use to generate the encoded bytes.
     * @param {Pointer<WS_XML_BUFFER>} xmlBuffer The XML buffer to write.
     * @param {Pointer<WS_XML_WRITER_ENCODING>} encoding The encoding to use when generating the bytes.  If <b>NULL</b>, the bytes will be encoded in utf8.
     * @param {Pointer<WS_XML_WRITER_PROPERTY>} properties An array of optional properties of the writer.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_property">WS_XML_WRITER_PROPERTY</a>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<WS_HEAP>} heap The heap from which to allocate the bytes.
     * @param {Pointer<Pointer<Void>>} bytes The generated bytes are returned here.
     * @param {Pointer<Integer>} byteCount The number of generated bytes are returned here.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritexmlbuffertobytes
     * @since windows6.1
     */
    static WsWriteXmlBufferToBytes(writer, xmlBuffer, encoding, properties, propertyCount, heap, bytes, byteCount, error) {
        bytesMarshal := bytes is VarRef ? "ptr*" : "ptr"
        byteCountMarshal := byteCount is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsWriteXmlBufferToBytes", "ptr", writer, "ptr", xmlBuffer, "ptr", encoding, "ptr", properties, "uint", propertyCount, "ptr", heap, bytesMarshal, bytes, byteCountMarshal, byteCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Uses a reader to convert a set of encoded bytes to a WS_XML_BUFFER.
     * @param {Pointer<WS_XML_READER>} reader The reader to use to parse the encoded bytes.
     * @param {Pointer<WS_XML_READER_ENCODING>} encoding The encoding to use when parsing the bytes.  If <b>NULL</b>, a <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_text_encoding">WS_XML_READER_TEXT_ENCODING</a> 
     *           with a charset of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_AUTO</a> will be used.
     * @param {Pointer<WS_XML_READER_PROPERTY>} properties An array of optional properties of the reader.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_property">WS_XML_READER_PROPERTY</a>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer} bytes The bytes to parse.
     * @param {Integer} byteCount The number of bytes to parse.
     * @param {Pointer<WS_HEAP>} heap The heap from which to allocate the XML buffer.
     * @param {Pointer<Pointer<WS_XML_BUFFER>>} xmlBuffer The XML buffer into which the bytes were read is returned here.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadxmlbufferfrombytes
     * @since windows6.1
     */
    static WsReadXmlBufferFromBytes(reader, encoding, properties, propertyCount, bytes, byteCount, heap, xmlBuffer, error) {
        xmlBufferMarshal := xmlBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsReadXmlBufferFromBytes", "ptr", reader, "ptr", encoding, "ptr", properties, "uint", propertyCount, "ptr", bytes, "uint", byteCount, "ptr", heap, xmlBufferMarshal, xmlBuffer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This operation sends a series of elements to an XML Writer.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the Writer where the elements are written.
     * @param {Pointer<WS_XML_STRING>} localName A pointer to the localName of the repeating element.
     * @param {Pointer<WS_XML_STRING>} ns A pointer to the namespace of the repeating element.
     * @param {Integer} valueType The value type for the elements
     * @param {Pointer} array A void pointer to the values written to <i>writer</i>.  The size of the items is determined by  value type.
     *           <div class="alert"><b>Note</b>  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_value_type">WS_VALUE_TYPE</a> for more information.
     *         </div>
     * <div> </div>
     * @param {Integer} arraySize The total byte length of the array.
     * @param {Integer} itemOffset The item offset within the array to write.
     * @param {Integer} itemCount The total number of items to write from the array.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritearray
     * @since windows6.1
     */
    static WsWriteArray(writer, localName, ns, valueType, array, arraySize, itemOffset, itemCount, error) {
        result := DllCall("webservices.dll\WsWriteArray", "ptr", writer, "ptr", localName, "ptr", ns, "int", valueType, "ptr", array, "uint", arraySize, "uint", itemOffset, "uint", itemCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes an XML qualified name to the Writer.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the qualified name is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_STRING>} prefix A WS_XML_STRING pointer to the prefix used by the qualified name.  If the value referenced by this parameter is <b>NULL</b> the Writer will choose a prefix.
     * @param {Pointer<WS_XML_STRING>} localName A WS_XML_STRING pointer to the local name used by the qualified name.  It must be at least one character long.
     * @param {Pointer<WS_XML_STRING>} ns A WS_XML_STRING pointer to the namespace used for the qualified name.
     *         
     * If no prefix is specified the Writer may use a prefix in scope that is bound to the specified namespace or it may generate a prefix and include an XMLNS attribute.
     * 
     * If a prefix is specified the Writer uses that prefix and may include an XMLNS attribute if needed to override an existing prefix in scope.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritequalifiedname
     * @since windows6.1
     */
    static WsWriteQualifiedName(writer, prefix, localName, ns, error) {
        result := DllCall("webservices.dll\WsWriteQualifiedName", "ptr", writer, "ptr", prefix, "ptr", localName, "ptr", ns, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a series of characters to an element or attribute.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the characters are written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {PWSTR} chars A pointer to the characters to write.
     * @param {Integer} charCount The number of characters to write.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritechars
     * @since windows6.1
     */
    static WsWriteChars(writer, chars, charCount, error) {
        chars := chars is String ? StrPtr(chars) : chars

        result := DllCall("webservices.dll\WsWriteChars", "ptr", writer, "ptr", chars, "uint", charCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a series of characters encoded as UTF-8 to an element or attribute.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the characters are written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<Integer>} bytes A pointer to the encoded UTF-8 characters to write.
     * @param {Integer} byteCount The number of bytes to write.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritecharsutf8
     * @since windows6.1
     */
    static WsWriteCharsUtf8(writer, bytes, byteCount, error) {
        bytesMarshal := bytes is VarRef ? "char*" : "ptr"

        result := DllCall("webservices.dll\WsWriteCharsUtf8", "ptr", writer, bytesMarshal, bytes, "uint", byteCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes bytes to the writer in a format optimized for the encoding. When writing in a text encoding, it will emit the bytes encoded in base64. When writing to a binary format, it will emit the bytes directly.
     * @param {Pointer<WS_XML_WRITER>} writer The writer to which the bytes will be written.
     * @param {Pointer} bytes The bytes to write to the document.
     * @param {Integer} byteCount The number bytes to write to the document.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritebytes
     * @since windows6.1
     */
    static WsWriteBytes(writer, bytes, byteCount, error) {
        result := DllCall("webservices.dll\WsWriteBytes", "ptr", writer, "ptr", bytes, "uint", byteCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Establishes a callback to be invoked to write bytes within an element. In some encodings this can be more efficient by eliminating a copy of the data.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the XML Writer object to which the bytes are written.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> and   the referenced value may not be <b>NULL</b>.
     * @param {Pointer<WS_PUSH_BYTES_CALLBACK>} callback This parameter is the callback to invoke to write the data.
     * @param {Pointer<Void>} callbackState A pointer to a user-defined state that is  passed to the callback function.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wspushbytes
     * @since windows6.1
     */
    static WsPushBytes(writer, callback, callbackState, error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsPushBytes", "ptr", writer, "ptr", callback, callbackStateMarshal, callbackState, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets up a callback to be invoked to obtain the bytes to be written within an element. In some encodings this can be more efficient by eliminating a copy of the data.
     * @param {Pointer<WS_XML_WRITER>} writer The writer to which the bytes will be written.
     * @param {Pointer<WS_PULL_BYTES_CALLBACK>} callback The callback to invoke when its time to write the binary data.
     * @param {Pointer<Void>} callbackState User-defined state to be passed to the callback.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wspullbytes
     * @since windows6.1
     */
    static WsPullBytes(writer, callback, callbackState, error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsPullBytes", "ptr", writer, "ptr", callback, callbackStateMarshal, callbackState, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes an end element to a Writer.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the end element is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswriteendelement
     * @since windows6.1
     */
    static WsWriteEndElement(writer, error) {
        result := DllCall("webservices.dll\WsWriteEndElement", "ptr", writer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes the specified text to the XML writer.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the text is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_TEXT>} text A pointer to the text to write.  <div class="alert"><b>Note</b>  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a> and its derived classes for more information on the text object.
     *         </div>
     * <div> </div>
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritetext
     * @since windows6.1
     */
    static WsWriteText(writer, text, error) {
        result := DllCall("webservices.dll\WsWriteText", "ptr", writer, "ptr", text, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This operation starts a CDATA section in the writer.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the CDATA section is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritestartcdata
     * @since windows6.1
     */
    static WsWriteStartCData(writer, error) {
        result := DllCall("webservices.dll\WsWriteStartCData", "ptr", writer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Ends a CDATA section in the writer.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the end CDATA section is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswriteendcdata
     * @since windows6.1
     */
    static WsWriteEndCData(writer, error) {
        result := DllCall("webservices.dll\WsWriteEndCData", "ptr", writer, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes the specified node to the XML Writer.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the node is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_NODE>} node A pointer to the Node object to write to the document.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritenode
     * @since windows6.1
     */
    static WsWriteNode(writer, node, error) {
        result := DllCall("webservices.dll\WsWriteNode", "ptr", writer, "ptr", node, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function returns the prefix to which a namespace is bound. There may be more than one prefix in scope and this function is free to return any one of them.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to a Writer with the namespace to search.  This must be a valid <b>WS_XML_WRITER</b> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatewriter">WsCreateWriter</a> and   may not be <b>NULL</b>.
     * @param {Pointer<WS_XML_STRING>} ns The namespace to search for.
     * @param {BOOL} required Indicates whether or not an error should be returned if a matching prefix is not found.
     * @param {Pointer<Pointer<WS_XML_STRING>>} prefix A reference to a prefix bound to the namespace or <b>NULL</b> if the value of the <i>required</i> parameter is <b>FALSE</b> and a matching
     *           namespace is not found.
     *         <div class="alert"><b>Note</b>  The value returned is valid only until the writer advances.</div>
     * <div> </div>
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetprefixfromnamespace
     * @since windows6.1
     */
    static WsGetPrefixFromNamespace(writer, ns, required, prefix, error) {
        prefixMarshal := prefix is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsGetPrefixFromNamespace", "ptr", writer, "ptr", ns, "int", required, prefixMarshal, prefix, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the current position of the writer. This can only be used on a writer that is set to an XmlBuffer. When writing to a buffer, the position represents the xml node before which new data will be placed.
     * @param {Pointer<WS_XML_WRITER>} writer The writer for which the current position will be obtained.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition The current position of the writer is returned here.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetwriterposition
     * @since windows6.1
     */
    static WsGetWriterPosition(writer, nodePosition, error) {
        result := DllCall("webservices.dll\WsGetWriterPosition", "ptr", writer, "ptr", nodePosition, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the current position of the writer. The position must have been obtained by a call to WsGetReaderPosition or WsGetWriterPosition.
     * @param {Pointer<WS_XML_WRITER>} writer The writer for which the current position will be set.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition The position to set the writer to.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetwriterposition
     * @since windows6.1
     */
    static WsSetWriterPosition(writer, nodePosition, error) {
        result := DllCall("webservices.dll\WsSetWriterPosition", "ptr", writer, "ptr", nodePosition, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Moves the current position of the writer as specified by the moveTo parameter.
     * @param {Pointer<WS_XML_WRITER>} writer The writer to move.
     * @param {Integer} moveTo The relative position to move the writer.
     * @param {Pointer<BOOL>} found If this is non-<b>NULL</b>, then whether or not the new position could be moved to is returned here.
     *         
     * 
     * If this is <b>NULL</b>, and the position could not be moved to, then the function will return <b>WS_E_INVALID_FORMAT</b>.
     *         (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsmovewriter
     * @since windows6.1
     */
    static WsMoveWriter(writer, moveTo, found, error) {
        result := DllCall("webservices.dll\WsMoveWriter", "ptr", writer, "int", moveTo, "ptr", found, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes leading and trailing whitespace from a sequence of characters.
     * @param {PWSTR} chars The string to be trimmed.
     * @param {Integer} charCount The length of the string to be trimmed.
     * @param {Pointer<Pointer<Integer>>} trimmedChars Returns a pointer into the original string starting at the first non-whitespace character.
     * @param {Pointer<Integer>} trimmedCount Returns the length of the trimmed string.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wstrimxmlwhitespace
     * @since windows6.1
     */
    static WsTrimXmlWhitespace(chars, charCount, trimmedChars, trimmedCount, error) {
        chars := chars is String ? StrPtr(chars) : chars

        trimmedCharsMarshal := trimmedChars is VarRef ? "ptr*" : "ptr"
        trimmedCountMarshal := trimmedCount is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsTrimXmlWhitespace", "ptr", chars, "uint", charCount, trimmedCharsMarshal, trimmedChars, trimmedCountMarshal, trimmedCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Verifies whether the input string is a valid XML NCName.
     * @param {PWSTR} ncNameChars The string to be verified.
     * @param {Integer} ncNameCharCount The length of the <i>ncNameChars</i> string.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string is not a valid NCName.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsverifyxmlncname
     * @since windows6.1
     */
    static WsVerifyXmlNCName(ncNameChars, ncNameCharCount, error) {
        ncNameChars := ncNameChars is String ? StrPtr(ncNameChars) : ncNameChars

        result := DllCall("webservices.dll\WsVerifyXmlNCName", "ptr", ncNameChars, "uint", ncNameCharCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compares two WS_XML_STRING objects for equality. The operation performs an ordinal comparison of the character values contained by the String objects.
     * @param {Pointer<WS_XML_STRING>} string1 A pointer to the first string to compare.
     * @param {Pointer<WS_XML_STRING>} string2 A pointer to the second string to compare.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The strings are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The strings are not equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are not correct.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsxmlstringequals
     * @since windows6.1
     */
    static WsXmlStringEquals(string1, string2, error) {
        result := DllCall("webservices.dll\WsXmlStringEquals", "ptr", string1, "ptr", string2, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function returns a namespace from the prefix to which it is bound.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the reader for which the prefix should be searched.
     * @param {Pointer<WS_XML_STRING>} prefix A pointer to the Prefix to search for.
     * @param {BOOL} required The value of this Boolean parameter determines
     *           whether or not an error should be returned if a matching namespace is not found.
     * @param {Pointer<Pointer<WS_XML_STRING>>} ns A reference to a namespace to which the prefix is bound if successful.  The value returned is valid only until the writer advances.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetnamespacefromprefix
     * @since windows6.1
     */
    static WsGetNamespaceFromPrefix(reader, prefix, required, ns, error) {
        nsMarshal := ns is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsGetNamespaceFromPrefix", "ptr", reader, "ptr", prefix, "int", required, nsMarshal, ns, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a qualified name and separates it into its prefix, localName and namespace based on the current namespace scope of the XML_READER.
     * @param {Pointer<WS_XML_READER>} reader The reader which should read the qualified name.
     * @param {Pointer<WS_HEAP>} heap The heap on which the resulting strings should be allocated.
     * @param {Pointer<WS_XML_STRING>} prefix The prefix of the qualified name is returned here.
     * @param {Pointer<WS_XML_STRING>} localName The localName of the qualified name is returned here.
     * @param {Pointer<WS_XML_STRING>} ns The namespace to which the qualified name is bound is returned here.
     * @param {Pointer<WS_ERROR>} error If the localName is missing the function will return <b>WS_E_INVALID_FORMAT</b>.  
     *           If the ns parameter is specified, but the prefix is not bound to a namespace, 
     *            <b>WS_E_INVALID_FORMAT</b> will be returned.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadqualifiedname
     * @since windows6.1
     */
    static WsReadQualifiedName(reader, heap, prefix, localName, ns, error) {
        result := DllCall("webservices.dll\WsReadQualifiedName", "ptr", reader, "ptr", heap, "ptr", prefix, "ptr", localName, "ptr", ns, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Finds the nearest xml attribute in scope with the specified localName and returns its value. The returned value is placed on the specified heap.
     * @param {Pointer<WS_XML_READER>} reader The reader for which the xml attribute will be searched.
     * @param {Pointer<WS_XML_STRING>} localName The localName of the xml attribute for which to search.
     * @param {Pointer<WS_HEAP>} heap The heap on which the resulting value should be allocated.
     * @param {Pointer<Pointer<Integer>>} valueChars The value of the attribute is stored here.
     * @param {Pointer<Integer>} valueCharCount The length of the valueChars.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The xml attribute was not found.
     *       
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetxmlattribute
     * @since windows6.1
     */
    static WsGetXmlAttribute(reader, localName, heap, valueChars, valueCharCount, error) {
        valueCharsMarshal := valueChars is VarRef ? "ptr*" : "ptr"
        valueCharCountMarshal := valueCharCount is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsGetXmlAttribute", "ptr", reader, "ptr", localName, "ptr", heap, valueCharsMarshal, valueChars, valueCharCountMarshal, valueCharCount, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Copies the current node from the specified XML reader to the specified XML writer.
     * @param {Pointer<WS_XML_WRITER>} writer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> to which to copy the XML node.
     * @param {Pointer<WS_XML_READER>} reader Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a>   from which to copy the XML node.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscopynode
     * @since windows6.1
     */
    static WsCopyNode(writer, reader, error) {
        result := DllCall("webservices.dll\WsCopyNode", "ptr", writer, "ptr", reader, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Helper function for implementing an asynchronous operation.
     * @param {Pointer<WS_ASYNC_STATE>} asyncState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_state">WS_ASYNC_STATE</a> structure used during the asynchronous operation.  This is a state maintenance parameter not intended
     *                 for direct use.  The application must allocate  the <b>WS_ASYNC_STATE</b> structure and ensure that it 
     *                 is kept alive during the entire asynchronous operation.  The <b>WS_ASYNC_STATE</b> structure can be reused after an 
     *                 asynchronous operation has completed.
     * @param {Pointer<WS_ASYNC_FUNCTION>} operation Represents the initial asynchronous operation to be performed.
     * @param {Integer} callbackModel Indicates whether the callback is being invoked long or short.
     *                 For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_callback_model">WS_CALLBACK_MODEL</a>
     * @param {Pointer<Void>} callbackState A void pointer to a user-defined value that is passed to each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_async_function">WS_ASYNC_FUNCTION</a>.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsasyncexecute
     * @since windows6.1
     */
    static WsAsyncExecute(asyncState, operation, callbackModel, callbackState, asyncContext, error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsAsyncExecute", "ptr", asyncState, "ptr", operation, "int", callbackModel, callbackStateMarshal, callbackState, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a channel for message exchange with an endpoint.
     * @param {Integer} channelType The type of the channel. For channel types, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE</a> enumeration. This represents the message exchange pattern for the channel being created.
     * @param {Integer} channelBinding The channel <a href="https://docs.microsoft.com/windows/desktop/wsw/binding">binding</a>, indicating the protocol stack to use for the new channel.
     *                 For available channel bindings, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> enumeration.
     * @param {Pointer<WS_CHANNEL_PROPERTY>} properties An array of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_channel_property">WS_CHANNEL_PROPERTY</a>  structures  containing optional values for channel initialization.  The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     *                 
     * 
     * For information on which channel properties can be specified when you create a channel, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ID</a> enumeration.
     * 
     * For information on creating a custom channel, see the Remarks section.
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<WS_SECURITY_DESCRIPTION>} securityDescription Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_description">WS_SECURITY_DESCRIPTION</a>  structure specifying the security for the channel.
     * 
     * If you are creating a custom channel (using the WS_CUSTOM_CHANNEL_BINDING value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> enumeration), the security description must be <b>NULL</b>. See the Remarks section.
     * @param {Pointer<Pointer<WS_CHANNEL>>} channel Pointer that receives the address of the created channel.   
     *                     When the channel  is no longer needed, you must free  it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreechannel">WsFreeChannel</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatechannel
     * @since windows6.1
     */
    static WsCreateChannel(channelType, channelBinding, properties, propertyCount, securityDescription, channel, error) {
        channelMarshal := channel is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateChannel", "int", channelType, "int", channelBinding, "ptr", properties, "uint", propertyCount, "ptr", securityDescription, channelMarshal, channel, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Open a channel to an endpoint.
     * @param {Pointer<WS_CHANNEL>} channel The channel to open.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} endpointAddress The address of the endpoint.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsopenchannel
     * @since windows6.1
     */
    static WsOpenChannel(channel, endpointAddress, asyncContext, error) {
        result := DllCall("webservices.dll\WsOpenChannel", "ptr", channel, "ptr", endpointAddress, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Send a message on a channel using serialization to write the body element.
     * @param {Pointer<WS_CHANNEL>} channel The channel to send the message on.
     * @param {Pointer<WS_MESSAGE>} message The message object to use for sending.
     *                 
     * 
     * The message object must be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a> or
     *                   <b>WS_MESSAGE_STATE_INITIALIZED</b>.
     * @param {Pointer<WS_MESSAGE_DESCRIPTION>} messageDescription The action field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used as the
     *                     action header for the message.  This field may be <b>NULL</b> if no action
     *                     is required.
     *                 
     * 
     * The bodyElementDescription field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a>is used to serialize the body of the message.  This field may be 
     *                     <b>NULL</b> if no body element is desired.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a> for
     *                     information about how the bodyElementDescription is used to serialize
     *                     the value.
     * @param {Integer} writeOption Whether the body element is required, and how the value is allocated. This is used
     *                     only when a body element is desired. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> and 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a>.
     * @param {Pointer} bodyValue The value to serialize in the body of the message.
     * @param {Integer} bodyValueSize The size of the value being serialized, in bytes.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_TOKEN_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security token was rejected by the server because it has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_CN_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificates CN name does not match the passed value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_UNTRUSTEDROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_WRONG_USAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid for the requested usage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_REVOCATION_OFFLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revocation function was unable to check revocation because the revocation server was offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssendmessage
     * @since windows6.1
     */
    static WsSendMessage(channel, message, messageDescription, writeOption, bodyValue, bodyValueSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsSendMessage", "ptr", channel, "ptr", message, "ptr", messageDescription, "int", writeOption, "ptr", bodyValue, "uint", bodyValueSize, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Receive a message and deserialize the body of the message as a value.
     * @param {Pointer<WS_CHANNEL>} channel The channel to receive from.
     * @param {Pointer<WS_MESSAGE>} message The message object used to receive.
     *                 
     * 
     * The message should be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a> state.
     * @param {Pointer<Pointer<WS_MESSAGE_DESCRIPTION>>} messageDescriptions An array of pointers to message descriptions that specifies the metadata for
     *                     the expected types of messages.
     * @param {Integer} messageDescriptionCount The number of items in the messageDescriptions array.
     * @param {Integer} receiveOption Whether the message is required.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_receive_option">WS_RECEIVE_OPTION</a> for more information.
     * @param {Integer} readBodyOption Whether the body element is required, and how to allocate the value.  
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<WS_HEAP>} heap The heap to store the deserialized values in.  If the heap is 
     *                     not required for the given type, then this parameter can be <b>NULL</b>.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     *                 
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_receive_option">WS_RECEIVE_OPTIONAL_MESSAGE</a> is specified for the receiveOption
     *                     parameter, and no more messages are available on the channel, 
     *                     this parameter is not touched.  In this case, the function returns <b>WS_S_END</b>.
     *                 (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * 
     * If the bodyElementDescription of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> that
     *                     matched is <b>NULL</b>, then this parameter is not touched.  In this case, the
     *                     parameter does not need to be specified.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<Integer>} index If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_receive_option">WS_RECEIVE_OPTIONAL_MESSAGE</a> is specified for the receiveOption
     *                     parameter, and no more messages are available on the channel, 
     *                     this parameter is untouched.  In this case, the function will
     *                     return <b>WS_S_END</b>.
     *                 
     * 
     * Otherwise, if the function succeeds this will contain the zero-based 
     *                     index into the array of message descriptions indicating which one matched.
     *                 
     * 
     * This parameter may be <b>NULL</b> if the caller is not interested in the value
     *                     (for example, if there is only one message description).
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The receive option <a href="/windows/desktop/api/webservices/ne-webservices-ws_receive_option">WS_RECEIVE_OPTIONAL_MESSAGE</a> was specified and
     *                     there are no more messages available for the channel.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAULT_RECEIVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The received message contained a fault.  The fault can be extracted from the 
     *                     <a href="/windows/desktop/wsw/ws-error">WS_ERROR</a> using <a href="/windows/desktop/api/webservices/nf-webservices-wsgeterrorproperty">WsGetErrorProperty</a>.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_TOKEN_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security token was rejected by the server because it has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_CN_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificates CN name does not match the passed value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_UNTRUSTEDROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_WRONG_USAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid for the requested usage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_REVOCATION_OFFLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revocation function was unable to check revocation because the revocation server was offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreceivemessage
     * @since windows6.1
     */
    static WsReceiveMessage(channel, message, messageDescriptions, messageDescriptionCount, receiveOption, readBodyOption, heap, value, valueSize, index, asyncContext, error) {
        messageDescriptionsMarshal := messageDescriptions is VarRef ? "ptr*" : "ptr"
        indexMarshal := index is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsReceiveMessage", "ptr", channel, "ptr", message, messageDescriptionsMarshal, messageDescriptions, "uint", messageDescriptionCount, "int", receiveOption, "int", readBodyOption, "ptr", heap, "ptr", value, "uint", valueSize, indexMarshal, index, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used to send a request message and receive a correlated reply message.
     * @param {Pointer<WS_CHANNEL>} channel The channel to do the request-reply operation on.
     * @param {Pointer<WS_MESSAGE>} requestMessage The message object to use to send the request.
     *                 
     * 
     * The message object should be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a> or
     *                     <b>WS_MESSAGE_STATE_INITIALIZED</b>.
     * @param {Pointer<WS_MESSAGE_DESCRIPTION>} requestMessageDescription The action field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used as the
     *                     action header for the request message.  This field may be <b>NULL</b> if no action
     *                     is required.
     *                 
     * 
     * The bodyElementDescription field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a>is used to serialize the body of the request message.  This field may be 
     *                     <b>NULL</b> if no body element is desired.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a> for
     *                     information about how the body is serialized according to the bodyElementDescription.
     * @param {Integer} writeOption Whether the body element is required, and how the value is allocated.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} requestBodyValue A pointer to the value to serialize in the body of the request object.
     * @param {Integer} requestBodyValueSize The size of the request value being serialized, in bytes.
     * @param {Pointer<WS_MESSAGE>} replyMessage The message object to use to receive the reply.
     *                 
     * 
     * The message object should be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<WS_MESSAGE_DESCRIPTION>} replyMessageDescription The action field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used to verify
     *                     the action header of the received reply message.  This field may be <b>NULL</b> if no action
     *                     is required.  If <b>NULL</b>, the action header of the received message is ignored
     *                     if present.
     *                 
     * 
     * The bodyElementDescription field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a>is used to deserialize the body of the reply message.  This field may be 
     *                     <b>NULL</b> if no body element is desired.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbody">WsReadBody</a> for 
     *                     information about how the body is deserialized according to the bodyElementDescription.
     * @param {Integer} readOption Whether the reply body element is required, and how to allocate the value.                    For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbody">WsReadBody</a>.
     * @param {Pointer<WS_HEAP>} heap The heap used to allocate deserialized reply body values.
     *                     If the heap is not necessary for the given type, then this
     *                     parameter can be <b>NULL</b>.
     * @param {Pointer} value Where to store the deserialized values of the body.
     *                 
     * 
     * The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     *                 
     * 
     * If the bodyElementDescription of the reply <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> 
     *                     is <b>NULL</b>, then this parameter is not touched.  In this case, the
     *                     parameter does not need to be specified.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAULT_RECEIVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reply message contained a fault.  The fault can be extracted from the
     *                     <a href="/windows/desktop/wsw/ws-error">WS_ERROR</a> using <a href="/windows/desktop/api/webservices/nf-webservices-wsgeterrorproperty">WsGetErrorProperty</a>.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_TOKEN_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security token was rejected by the server because it has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_CN_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificates CN name does not match the passed value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_UNTRUSTEDROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_WRONG_USAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid for the requested usage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_REVOCATION_OFFLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revocation function was unable to check revocation because the revocation server was offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsrequestreply
     * @since windows6.1
     */
    static WsRequestReply(channel, requestMessage, requestMessageDescription, writeOption, requestBodyValue, requestBodyValueSize, replyMessage, replyMessageDescription, readOption, heap, value, valueSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsRequestReply", "ptr", channel, "ptr", requestMessage, "ptr", requestMessageDescription, "int", writeOption, "ptr", requestBodyValue, "uint", requestBodyValueSize, "ptr", replyMessage, "ptr", replyMessageDescription, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends a message which is a reply to a received message.
     * @param {Pointer<WS_CHANNEL>} channel A pointer to the <b>Channel</b> object on which to send the reply Message.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> object.
     * @param {Pointer<WS_MESSAGE>} replyMessage A pointer to the <b>Message</b> object for sending the reply.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     *                 
     * Message object state must be set to <b>WS_MESSAGE_STATE_EMPTY</b>  or <b>WS_MESSAGE_STATE_INITIALIZED</b>.
     * 
     * <div class="alert"><b>Note</b>  If an initialized message is provided it must be initialized using <b>WS_REPLY_MESSAGE</b> or <b>WS_FAULT_MESSAGE</b>.
     * </div>
     * <div> </div>
     * @param {Pointer<WS_MESSAGE_DESCRIPTION>} replyMessageDescription A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> object.  The <b>action</b> field of <b>WS_MESSAGE_DESCRIPTION</b> is used as the <b>action</b> header for the reply message.  This field can be <b>NULL</b> if no action is required.
     *                 
     * 
     * The <b>bodyElementDescription</b>  field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a>is used to serialize the body of the reply message.  This field may be <b>NULL</b> if no body element is desired.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a> for information about how the <b>bodyElementDescription</b> is used to serialize a value.
     * @param {Integer} writeOption Determines whether the body element is required, and how the value is allocated.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} replyBodyValue A void pointer to the value to serialize in the reply message.
     * @param {Integer} replyBodyValueSize The size  in bytes of the reply value being serialized.
     * @param {Pointer<WS_MESSAGE>} requestMessage A pointer to a WS_MESSAGE object encapsulating the request message text.  This is used to obtain correlation information used in formulating the reply message.
     * 
     * <div class="alert"><b>Note</b>  The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b>.
     * </div>
     * <div> </div>
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure with information about invoking the function asynchronously.  A <b>NULL</b> value indicates a request for synchronous operation.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_TOKEN_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security token was rejected by the server because it has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssendreplymessage
     * @since windows6.1
     */
    static WsSendReplyMessage(channel, replyMessage, replyMessageDescription, writeOption, replyBodyValue, replyBodyValueSize, requestMessage, asyncContext, error) {
        result := DllCall("webservices.dll\WsSendReplyMessage", "ptr", channel, "ptr", replyMessage, "ptr", replyMessageDescription, "int", writeOption, "ptr", replyBodyValue, "uint", replyBodyValueSize, "ptr", requestMessage, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends a fault message given a WS_ERROR object.
     * @param {Pointer<WS_CHANNEL>} channel The channel to send the message on.
     * @param {Pointer<WS_MESSAGE>} replyMessage A message object to use to send the reply message.
     *                 
     * 
     * The message object should be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a> or
     *                     <b>WS_MESSAGE_STATE_INITIALIZED</b>.  If an initialized message is provided,
     *                     it should have been initialized using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_initialization">WS_FAULT_MESSAGE</a>.
     * @param {Pointer<WS_ERROR>} faultError The error object to use to construct the fault.
     * @param {HRESULT} faultErrorCode The error code associated with the fault.  This cannot
     *                     be a success code.
     *                 
     * 
     * This error code is never included in the fault message directly, but 
     *                     instead is used as a fallback mechanism for creating an fault string in the case that
     *                     the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object does not contain any error strings.
     * @param {Integer} faultDisclosure Controls how much of the error information is included in the fault message.
     * @param {Pointer<WS_MESSAGE>} requestMessage The request message.  This is used to obtain correlation information used
     *                     in formulating the reply message.
     *                 
     * 
     * The message can be in any state but <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssendfaultmessageforerror
     * @since windows6.1
     */
    static WsSendFaultMessageForError(channel, replyMessage, faultError, faultErrorCode, faultDisclosure, requestMessage, asyncContext, error) {
        result := DllCall("webservices.dll\WsSendFaultMessageForError", "ptr", channel, "ptr", replyMessage, "ptr", faultError, "int", faultErrorCode, "int", faultDisclosure, "ptr", requestMessage, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a property of the Channel referenced by the channel parameter.
     * @param {Pointer<WS_CHANNEL>} channel A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> object with the property to retrieve.
     * @param {Integer} id Represents an identifier of the property to retrieve.
     * @param {Pointer} value A void pointer referencing the location to store the retrieved property.
     *                     <div class="alert"><b>Note</b>  The pointer must have an alignment compatible with the type
     *                     of the property.
     *                 </div>
     * <div> </div>
     * @param {Integer} valueSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property Id was not supported for this object or the specified buffer was not large enough.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetchannelproperty
     * @since windows6.1
     */
    static WsGetChannelProperty(channel, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetChannelProperty", "ptr", channel, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a property of the channel.
     * @param {Pointer<WS_CHANNEL>} channel A pointer to the <b>Channel</b> on which to set the property and may not be <b>NULL</b>.
     * @param {Integer} id Identifier of the property to set.
     * @param {Pointer} value A void pointer to the property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes of of the property value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object.
     * 
     * The specified size was not appropriate for the property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough space to set the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetchannelproperty
     * @since windows6.1
     */
    static WsSetChannelProperty(channel, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsSetChannelProperty", "ptr", channel, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Write out all the headers of the message to the channel, and prepare to write the body elements.
     * @param {Pointer<WS_CHANNEL>} channel The channel to use to write the message.
     * @param {Pointer<WS_MESSAGE>} message The message to write.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_TOKEN_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security token was rejected by the server because it has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_CN_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificates CN name does not match the passed value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_UNTRUSTEDROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_WRONG_USAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid for the requested usage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_REVOCATION_OFFLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revocation function was unable to check revocation because the revocation server was offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritemessagestart
     * @since windows6.1
     */
    static WsWriteMessageStart(channel, message, asyncContext, error) {
        result := DllCall("webservices.dll\WsWriteMessageStart", "ptr", channel, "ptr", message, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Write the closing elements of the message to the channel.
     * @param {Pointer<WS_CHANNEL>} channel The channel to write to.
     * @param {Pointer<WS_MESSAGE>} message The message to write.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_TOKEN_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security token was rejected by the server because it has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_CN_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificates CN name does not match the passed value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_UNTRUSTEDROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_WRONG_USAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid for the requested usage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_REVOCATION_OFFLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revocation function was unable to check revocation because the revocation server was offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritemessageend
     * @since windows6.1
     */
    static WsWriteMessageEnd(channel, message, asyncContext, error) {
        result := DllCall("webservices.dll\WsWriteMessageEnd", "ptr", channel, "ptr", message, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Read the headers of the next message from the channel, and prepare to read the body elements.
     * @param {Pointer<WS_CHANNEL>} channel The channel to receive from.
     * @param {Pointer<WS_MESSAGE>} message The message to receive into.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Start of message was received successfully.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_END</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more messages available on the channel.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_TOKEN_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security token was rejected by the server because it has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_CN_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificates CN name does not match the passed value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_UNTRUSTEDROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_WRONG_USAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid for the requested usage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_REVOCATION_OFFLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revocation function was unable to check revocation because the revocation server was offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadmessagestart
     * @since windows6.1
     */
    static WsReadMessageStart(channel, message, asyncContext, error) {
        result := DllCall("webservices.dll\WsReadMessageStart", "ptr", channel, "ptr", message, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Read the closing elements of a message from a channel.
     * @param {Pointer<WS_CHANNEL>} channel The channel to receive for.
     * @param {Pointer<WS_MESSAGE>} message The message to read the end of.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_TOKEN_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security token was rejected by the server because it has expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_EXPIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_CN_NO_MATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificates CN name does not match the passed value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_UNTRUSTEDROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate chain processed, but terminated in a root certificate which is not trusted by the trust provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERT_E_WRONG_USAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid for the requested usage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CRYPT_E_REVOCATION_OFFLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The revocation function was unable to check revocation because the revocation server was offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadmessageend
     * @since windows6.1
     */
    static WsReadMessageEnd(channel, message, asyncContext, error) {
        result := DllCall("webservices.dll\WsReadMessageEnd", "ptr", channel, "ptr", message, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes a specified channel.
     * @param {Pointer<WS_CHANNEL>} channel Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> structure representing the channel to close.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure containing information for invoking the function asynchronously.  Pass a <b>NULL</b> 
     *                  value to call the function synchronously.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  where additional error information is stored if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The channel closure was aborted by a call to <a href="/windows/desktop/api/webservices/nf-webservices-wsabortchannel">WsAbortChannel</a> while the channel was closing.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The channel was in an inappropriate state (see the Remarks section).
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insuffiient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsclosechannel
     * @since windows6.1
     */
    static WsCloseChannel(channel, asyncContext, error) {
        result := DllCall("webservices.dll\WsCloseChannel", "ptr", channel, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels all pending I/O for a specified channel.
     * @param {Pointer<WS_CHANNEL>} channel A   pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a>  structure representing the channel for which 
     *                     to cancel I/O.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See the Remarks section for platform limitations.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsabortchannel
     * @since windows6.1
     */
    static WsAbortChannel(channel, error) {
        result := DllCall("webservices.dll\WsAbortChannel", "ptr", channel, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory resource associated with a Channel object.
     * @remarks
     * 
     * A channel that is in the process of being accepted/opened cannot be released until the accept/open completes.  Use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortchannel">WsAbortChannel</a> to cancel the accept/open process.
     * 
     * @param {Pointer<WS_CHANNEL>} channel A pointer to the <b>Channel</b> object to release. The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> object returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">WsCreateChannel</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a>. The referenced value may not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreechannel
     * @since windows6.1
     */
    static WsFreeChannel(channel) {
        DllCall("webservices.dll\WsFreeChannel", "ptr", channel)
    }

    /**
     * Reset a channel so it can be reused.
     * @param {Pointer<WS_CHANNEL>} channel The channel to reset.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The channel was in an inappropriate state.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsresetchannel
     * @since windows6.1
     */
    static WsResetChannel(channel, error) {
        result := DllCall("webservices.dll\WsResetChannel", "ptr", channel, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Skips the remainder of a specified message on a specified channel.
     * @param {Pointer<WS_CHANNEL>} channel Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> structure representing the channel on which the message is being read or written.
     * @param {Pointer<WS_MESSAGE>} message Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure representing the message to abandon.  This should be
     *                     the same message that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessagestart">WsWriteMessageStart</a> 
     *                     or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessagestart">WsReadMessageStart</a> function.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The channel is not in the WS_CHANNEL_STATE_OPEN or  WS_CHANNEL_STATE_FAULTED state.
     *                 (For channel states, see the <a href="/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE</a> enumeration.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified message is not currently being read or written on the specified channel.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsabandonmessage
     * @since windows6.1
     */
    static WsAbandonMessage(channel, message, error) {
        result := DllCall("webservices.dll\WsAbandonMessage", "ptr", channel, "ptr", message, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used to signal the end of messages for a session channel.
     * @param {Pointer<WS_CHANNEL>} channel The session channel to shut down.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is returned if the channel is not in the <a href="/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE_OPEN</a>state.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsshutdownsessionchannel
     * @since windows6.1
     */
    static WsShutdownSessionChannel(channel, asyncContext, error) {
        result := DllCall("webservices.dll\WsShutdownSessionChannel", "ptr", channel, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns a property of the specified operation context. It should be noted that the validity of these property is limited to the lifetime of the operation context itself.
     * @param {Pointer<WS_OPERATION_CONTEXT>} context The context that the property value is being obtained for.
     * @param {Integer} id The id of the property.
     * @param {Pointer} value The address to place the retrieved value. The contents are not modified in case of a failure.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size of the buffer that the caller has allocated for the retrieved value.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetoperationcontextproperty
     * @since windows6.1
     */
    static WsGetOperationContextProperty(context, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetOperationContextProperty", "ptr", context, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves an XML Dictionary object. The retrieved Dictionary is returned by the dictionary reference parameter.
     * @param {Integer} encoding Indicates an enumeration of the Dictionary encoding.
     * @param {Pointer<Pointer<WS_XML_DICTIONARY>>} dictionary A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_dictionary">WS_XML_DICTIONARY</a> structure for the retrieved <b>Dictionary</b>.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetdictionary
     * @since windows6.1
     */
    static WsGetDictionary(encoding, dictionary, error) {
        dictionaryMarshal := dictionary is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsGetDictionary", "int", encoding, dictionaryMarshal, dictionary, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads an extension of the WS_ENDPOINT_ADDRESS.
     * @param {Pointer<WS_XML_READER>} reader The XML reader to use to read the extension.
     *                 
     * 
     * The function will automatically set the input of
     *                     the reader as necessary to read the extensions.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} endpointAddress The endpoint address containing the extensions.
     * @param {Integer} extensionType The type of extension to read.
     * @param {Integer} readOption Whether the value is required, and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<WS_HEAP>} heap The heap to use to store the value that is read.
     * @param {Pointer} value The address of a buffer to place the value read.
     *                 
     * 
     * If using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_REQUIRED_VALUE</a> for the readOption
     *                     parameter, the buffer must be the size of the type of extension
     *                     being read (which varies by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_endpoint_address_extension_type">WS_ENDPOINT_ADDRESS_EXTENSION_TYPE</a>).
     *                 
     * 
     * If using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_REQUIRED_POINTER</a> or <b>WS_READ_OPTIONAL_POINTER</b>,
     *                     the buffer should be the size of a pointer.
     * @param {Integer} valueSize The size of the buffer that the caller has allocated for the value read.
     *                 
     * 
     * This size should correspond to the size of the buffer passed
     *                     using the value parameter.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extension type was not valid.
     * 
     * The size of the supplied buffer was not correct.
     * 
     * A required parameter was <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadendpointaddressextension
     * @since windows6.1
     */
    static WsReadEndpointAddressExtension(reader, endpointAddress, extensionType, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadEndpointAddressExtension", "ptr", reader, "ptr", endpointAddress, "int", extensionType, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an error object that can passed to functions to record rich error information.
     * @param {Pointer<WS_ERROR_PROPERTY>} properties An array of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_error_property">WS_ERROR_PROPERTY</a> structures containing optional error properties.
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<Pointer<WS_ERROR>>} error On success, a pointer that receives the address of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure representing the created error object.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreateerror
     * @since windows6.1
     */
    static WsCreateError(properties, propertyCount, error) {
        errorMarshal := error is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateError", "ptr", properties, "uint", propertyCount, errorMarshal, error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a specified error string to the error object.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure representing the error object to which to add the string.
     * @param {Pointer<WS_STRING>} string The string to add.  The error object will
     *                     make a copy of the string.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsadderrorstring
     * @since windows6.1
     */
    static WsAddErrorString(error, string) {
        result := DllCall("webservices.dll\WsAddErrorString", "ptr", error, "ptr", string, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves an error string from an error object.
     * @param {Pointer<WS_ERROR>} error The error object containing the string.
     * @param {Integer} index The zero-based index identifying the string to retrieve.  The first
     *                     error string (index 0) will be the string most recently added to the
     *                     error object (using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsadderrorstring">WsAddErrorString</a>). When 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_ORIGINAL_ERROR_CODE</a> is presented in the 
     *                     error object, the corresponding error text will be available in the last index.
     *                 
     * 
     * The number of errors can be retrieved using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_STRING_COUNT</a>.
     * @param {Pointer<WS_STRING>} string The returned string.  The string is valid until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreseterror">WsResetError</a>or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeerror">WsFreeError</a> is called.
     *                 
     * 
     * The string is not zero terminated.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgeterrorstring
     * @since windows6.1
     */
    static WsGetErrorString(error, index, string) {
        result := DllCall("webservices.dll\WsGetErrorString", "ptr", error, "uint", index, "ptr", string, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Copies an error object from a specified source to a specifed destination.
     * @param {Pointer<WS_ERROR>} source Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure representing the error object to copy.
     * @param {Pointer<WS_ERROR>} destination Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives the copied error object.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the error objects is <b>NULL</b>.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscopyerror
     * @since windows6.1
     */
    static WsCopyError(source, destination) {
        result := DllCall("webservices.dll\WsCopyError", "ptr", source, "ptr", destination, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a property of an WS_ERROR object referenced by the error parameter.
     * @param {Pointer<WS_ERROR>} error A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object with the property to retrieve.
     * @param {Integer} id An identifier of the property to retrieve.
     * @param {Pointer} buffer A pointer referencing the location to store the retrieved property.
     * @param {Integer} bufferSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgeterrorproperty
     * @since windows6.1
     */
    static WsGetErrorProperty(error, id, buffer, bufferSize) {
        result := DllCall("webservices.dll\WsGetErrorProperty", "ptr", error, "int", id, "ptr", buffer, "uint", bufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets an WS_ERROR object property.
     * @param {Pointer<WS_ERROR>} error A pointer to the <b>Error</b> object in which to set the property.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object.
     * @param {Integer} id Identifier of the property to set.
     * @param {Pointer} value A pointer to the property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes of the property value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object.
     * 
     * The specified size was not appropriate for the property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough space to set the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsseterrorproperty
     * @since windows6.1
     */
    static WsSetErrorProperty(error, id, value, valueSize) {
        result := DllCall("webservices.dll\WsSetErrorProperty", "ptr", error, "int", id, "ptr", value, "uint", valueSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the content of the error object parameter but does not release the resource allocated to the error object parameter.
     * @param {Pointer<WS_ERROR>} error This parameter is a   pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object to reset.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreseterror
     * @since windows6.1
     */
    static WsResetError(error) {
        result := DllCall("webservices.dll\WsResetError", "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory resource associated with an Error object created using WsCreateError. This releases the object and its constituent information.
     * @param {Pointer<WS_ERROR>} error A pointer to the <b>Error</b> object to release.  The pointer must reference a valid <b>WS_ERROR</b> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateerror">WsCreateError</a>.  The referenced value may 
     *                     not be NULL.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreeerror
     * @since windows6.1
     */
    static WsFreeError(error) {
        DllCall("webservices.dll\WsFreeError", "ptr", error)
    }

    /**
     * Retrieves a Fault error property of an WS_ERROR object referenced by the error parameter.
     * @param {Pointer<WS_ERROR>} error A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object with the property to retrieve.
     * @param {Integer} id Represents an identifier of the fault error property to retrieve.
     * @param {Pointer} buffer A pointer referencing the location to store the retrieved fault error property.
     *                     
     * 
     * <div class="alert"><b>Note</b>  The pointer must have an alignment compatible with the type
     *                     of the property.</div>
     * <div> </div>
     * @param {Integer} bufferSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetfaulterrorproperty
     * @since windows6.1
     */
    static WsGetFaultErrorProperty(error, id, buffer, bufferSize) {
        result := DllCall("webservices.dll\WsGetFaultErrorProperty", "ptr", error, "int", id, "ptr", buffer, "uint", bufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Set a Fault property of a WS_ERROR object.
     * @param {Pointer<WS_ERROR>} error A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object in which to set the property.  The pointer must reference a valid WS_ERROR object.
     * @param {Integer} id Identifier of the property to set.
     * @param {Pointer} value The property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes of the property value.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object.
     * 
     * The specified size was not appropriate for the property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough space to set the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetfaulterrorproperty
     * @since windows6.1
     */
    static WsSetFaultErrorProperty(error, id, value, valueSize) {
        result := DllCall("webservices.dll\WsSetFaultErrorProperty", "ptr", error, "int", id, "ptr", value, "uint", valueSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Constructs a WS_FAULT from a specified error object.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure representing the error object from which to construct the fault.
     * @param {HRESULT} faultErrorCode The HRESULT error code returned from the function that failed.
     *                     The HRESULT value cannot be a success code.
     *                 
     * 
     * This error code is never included in the fault directly, but is used as a fallback mechanism for creating a fault string if the error object does not contain any error strings.
     * @param {Integer} faultDisclosure <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_fault_disclosure">WS_FAULT_DISCLOSURE</a> enumeration that controls
     *                     what information is copied from
     *                     the error object to the fault object.
     * @param {Pointer<WS_HEAP>} heap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a> from which to allocate memory for the returned fault object.
     * @param {Pointer<WS_FAULT>} fault Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault">WS_FAULT</a> structure representing the returned fault object.  The fields of the fault object are good until
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeheap">WsFreeHeap</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetheap">WsResetHeap</a>is called to release the specified heap resources.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatefaultfromerror
     * @since windows6.1
     */
    static WsCreateFaultFromError(error, faultErrorCode, faultDisclosure, heap, fault) {
        result := DllCall("webservices.dll\WsCreateFaultFromError", "ptr", error, "int", faultErrorCode, "int", faultDisclosure, "ptr", heap, "ptr", fault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Write the fault detail stored in a WS_ERROR object.
     * @param {Pointer<WS_ERROR>} error The error object that will contain the fault information.
     * @param {Pointer<WS_FAULT_DETAIL_DESCRIPTION>} faultDetailDescription A pointer to a description of the fault detail.
     *                 
     * 
     * If the action field of the fault detail description is non-<b>NULL</b>,
     *                     then it is set as the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_fault_error_property_id">WS_FAULT_ERROR_PROPERTY_ACTION</a>of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a>.
     *                 
     * 
     * The element description of the fault detail description 
     *                     describes the format of the element in the fault detail.
     * @param {Integer} writeOption Information about how the value is allocated.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} value A pointer to the value to serialize.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     *                 
     * 
     * If the value is <b>NULL</b>, then the size should be 0.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetfaulterrordetail
     * @since windows6.1
     */
    static WsSetFaultErrorDetail(error, faultDetailDescription, writeOption, value, valueSize) {
        result := DllCall("webservices.dll\WsSetFaultErrorDetail", "ptr", error, "ptr", faultDetailDescription, "int", writeOption, "ptr", value, "uint", valueSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Read the fault detail stored in a WS_ERROR object.
     * @param {Pointer<WS_ERROR>} error The error object that contains the fault information.
     * @param {Pointer<WS_FAULT_DETAIL_DESCRIPTION>} faultDetailDescription A pointer to a description of the fault detail element.
     *                 
     * 
     * The action value of the fault detail description is used as a filter
     *                     value to match against the action of the fault.  If both action
     *                     strings are specified (the action value of the fault detail description 
     *                     is not <b>NULL</b> and the action value <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_fault_error_property_id">WS_FAULT_ERROR_PROPERTY_ACTION</a> in the 
     *                     <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> has a length greater than zero), then the action 
     *                     strings are compared to determine a match.  If there is a match, then the 
     *                     function will then try to deserialize the detail element.
     *                 
     * 
     * The element description of the fault detail description is used to
     *                     describe the format of the element in the fault detail.
     * @param {Integer} readOption Whether the element is required, and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<WS_HEAP>} heap The heap to store the deserialized values in.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size quota of the heap was exceeded.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetfaulterrordetail
     * @since windows6.1
     */
    static WsGetFaultErrorDetail(error, faultDetailDescription, readOption, heap, value, valueSize) {
        result := DllCall("webservices.dll\WsGetFaultErrorDetail", "ptr", error, "ptr", faultDetailDescription, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a heap object.
     * @param {Pointer} maxSize The total number of bytes that can be allocated from the heap.  The total
     *                   number of bytes is defined as sum of the sizes passed in all the calls to
     *                                     the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsalloc">WsAlloc</a> function since the heap was created or reset.
     * @param {Pointer} trimSize The maximum number of bytes of memory that the heap
     *                 retains after the heap has been reset by a call to the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetheap">WsResetHeap</a> function.  This is an approximation value due to heap overhead.  <div class="alert"><b>Note</b>  If the
     *                 value of <i>trimSize</i> is larger than the value of  <i>maxSize</i>,  the size of the
     *                 heap will not be adjusted to the desired size.</div>
     * <div> </div>
     * @param {Pointer<WS_HEAP_PROPERTY>} properties Reserved for future use; set to <b>NULL</b>.
     * @param {Integer} propertyCount Reserved for future use; set to 0 (zero).
     * @param {Pointer<Pointer<WS_HEAP>>} heap On   success, pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the new heap object.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreateheap
     * @since windows6.1
     */
    static WsCreateHeap(maxSize, trimSize, properties, propertyCount, heap, error) {
        heapMarshal := heap is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateHeap", "ptr", maxSize, "ptr", trimSize, "ptr", properties, "uint", propertyCount, heapMarshal, heap, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allocates a segment of memory from the specified heap.
     * @param {Pointer<WS_HEAP>} heap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the heap from which to allocate the memory.
     * @param {Pointer} size The number of bytes to allocate.  This value can be zero.
     * @param {Pointer<Pointer<Void>>} ptr On success, a pointer that receives the address of the allocated memory. This pointer is valid until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeheap">WsFreeHeap</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetheap">WsResetHeap</a> is called on the <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a>. 
     * 
     * 
     * 
     * The returned pointer is aligned on an 8-byte boundary. 
     * 
     * 
     * 
     * Zero byte allocations will return a non-NULL pointer.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested bytes, in addition to already allocated bytes, exceed the size of the <a href="/windows/desktop/wsw/heap">heap</a>, as specified by the <a href="/windows/desktop/api/webservices/ne-webservices-ws_heap_property_id">WS_HEAP_PROPERTY_MAX_SIZE</a> property.  
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficent memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsalloc
     * @since windows6.1
     */
    static WsAlloc(heap, size, ptr, error) {
        ptrMarshal := ptr is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsAlloc", "ptr", heap, "ptr", size, ptrMarshal, ptr, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a particular property of a specified Heap.
     * @param {Pointer<WS_HEAP>} heap A pointer to the <b>Heap</b> object to that contains the desired property data.
     * @param {Integer} id This is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_heap_property">WS_HEAP_PROPERTY_ID</a> enumerator that identifies the desired property.
     * @param {Pointer} value A reference to the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The buffer size allocated by the caller for the retrieved property value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetheapproperty
     * @since windows6.1
     */
    static WsGetHeapProperty(heap, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetHeapProperty", "ptr", heap, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases all Heap allocations. Allocations made on the Heap using WsAlloc are no longer valid. Allocation for the Heap object itself is not released.
     * @param {Pointer<WS_HEAP>} heap A pointer to a Heap instance to reset.
     *                     If the heap is not required for the given type this
     *                     parameter can be <b>NULL</b>.
     *                 
     * 
     * The heap object.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsresetheap
     * @since windows6.1
     */
    static WsResetHeap(heap, error) {
        result := DllCall("webservices.dll\WsResetHeap", "ptr", heap, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This frees the heap object, and the memory associated with any allocations made on it using WsAlloc.
     * @param {Pointer<WS_HEAP>} heap The heap to free.  This must be a valid heap object that was returned
     *                     from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateheap">WsCreateHeap</a>.  This parameter may not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreeheap
     * @since windows6.1
     */
    static WsFreeHeap(heap) {
        DllCall("webservices.dll\WsFreeHeap", "ptr", heap)
    }

    /**
     * Creates a listener with the specified properties.
     * @param {Integer} channelType The type of channel the listener listens for. For channel types, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE</a> enumeration.
     * @param {Integer} channelBinding The channel protocol for the listener.
     *                 For possible bindings, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> enumeration.
     * @param {Pointer<WS_LISTENER_PROPERTY>} properties Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_listener_property">WS_LISTENER_PROPERTY</a> structure containing optional properties for the  listener.
     *                 
     * 
     * For information on which properties you can specify when creating a listener, see the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_ID</a> enumeration. 
     * 
     * For information on creating a custom listener, see the Remarks section.
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<WS_SECURITY_DESCRIPTION>} securityDescription Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_description">WS_SECURITY_DESCRIPTION</a>  structure specifying the security for the listener.
     * 
     * If you are creating a custom channel (using the WS_CUSTOM_CHANNEL_BINDING value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> enumeration), the security description must be <b>NULL</b>. See the Remarks section.
     * @param {Pointer<Pointer<WS_LISTENER>>} listener On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the new listener.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatelistener
     * @since windows6.1
     */
    static WsCreateListener(channelType, channelBinding, properties, propertyCount, securityDescription, listener, error) {
        listenerMarshal := listener is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateListener", "int", channelType, "int", channelBinding, "ptr", properties, "uint", propertyCount, "ptr", securityDescription, listenerMarshal, listener, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initiates &quot;listening&quot; on a specified address. Once a listener is opened channels can be accepted from it. If the open is successful the Listener must be closed using the WsCloseListener function before Listener resources can be released.
     * @param {Pointer<WS_LISTENER>} listener A pointer to the <b>Listener</b> object to open.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> object and the referenced value may not be <b>NULL</b>.
     * @param {Pointer<WS_STRING>} url A pointer to a object containing the URL address string for the Listener.  
     *                 
     * 
     * <div class="alert"><b>Note</b>  The URL is always in escaped form..
     *                 The URL may not contain a query string or fragment.
     *                 This URL can include the '+' or '*' wildcards
     *                     in the host name portion, or a host name, or a literal IP address.
     *                 See Remarks for more information on the URL.</div>
     * <div> </div>
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer  to A WS_ASYNC_CONTEXT object that has information about how to invoke the function asynchronously.  The value is set to <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The listener was aborted during the open, or before the open.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The listener is in the incorrect state.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ADDRESS_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is already being used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ADDRESS_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is not valid for this context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsopenlistener
     * @since windows6.1
     */
    static WsOpenListener(listener, url, asyncContext, error) {
        result := DllCall("webservices.dll\WsOpenListener", "ptr", listener, "ptr", url, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Accepts the next incoming message from the specified listener.
     * @param {Pointer<WS_LISTENER>} listener Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the listener.
     *                 This is the listener passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a>when the channel was created.
     * @param {Pointer<WS_CHANNEL>} channel Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> structure representing the channel to accept.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure with information for invoking the function asynchronously.  Pass a <b>NULL</b> 
     *                  value for a synchronous operation.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     *                 
     *             
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The listener or channel was aborted.
     *                 
     *             
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OBJECT_FAULTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The listener has faulted. See the Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The listener or the channel or both were in an inappropriate state.
     *                 
     *             See the Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are  not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsacceptchannel
     * @since windows6.1
     */
    static WsAcceptChannel(listener, channel, asyncContext, error) {
        result := DllCall("webservices.dll\WsAcceptChannel", "ptr", listener, "ptr", channel, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Causes the specified listener to stop listening.
     * @param {Pointer<WS_LISTENER>} listener Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the listener  to close.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure containing information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The close was aborted by a call to <a href="/windows/desktop/api/webservices/nf-webservices-wsabortlistener">WsAbortListener</a> as the listener was closing.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The listener was in an inappropriate state.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscloselistener
     * @since windows6.1
     */
    static WsCloseListener(listener, asyncContext, error) {
        result := DllCall("webservices.dll\WsCloseListener", "ptr", listener, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels any pending I/O for the specified listener.
     * @param {Pointer<WS_LISTENER>} listener Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the listener for which to cancel I/O.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsabortlistener
     * @since windows6.1
     */
    static WsAbortListener(listener, error) {
        result := DllCall("webservices.dll\WsAbortListener", "ptr", listener, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Resets a Listener object so it can be reused. Use of this function requires that the Listener state be set to WS_LISTENER_STATE_CREATED or WS_LISTENER_STATE_CLOSED.
     * @param {Pointer<WS_LISTENER>} listener A pointer to the <b>Listener</b> object to reset.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a>.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The listener was in an inappropriate state.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsresetlistener
     * @since windows6.1
     */
    static WsResetListener(listener, error) {
        result := DllCall("webservices.dll\WsResetListener", "ptr", listener, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory resource associated with a Listener object.
     * @param {Pointer<WS_LISTENER>} listener A pointer to the <b>Listener</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> returned
     *                     by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a>.  The referenced value may not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreelistener
     * @since windows6.1
     */
    static WsFreeListener(listener) {
        DllCall("webservices.dll\WsFreeListener", "ptr", listener)
    }

    /**
     * Retrieves a specified Listener object property. The property to retrieve is identified by a WS_LISTENER_PROPERTY_ID input parameter.
     * @param {Pointer<WS_LISTENER>} listener A pointer to the Listener object containing the desired property.  This must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> that was returned
     *                     from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a>.
     * @param {Integer} id This is a <b>WS_LISTENER_PROPERTY_ID</b> enumerator value that identifies the desired property.
     * @param {Pointer} value A reference to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize Represents the byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetlistenerproperty
     * @since windows6.1
     */
    static WsGetListenerProperty(listener, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetListenerProperty", "ptr", listener, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a Listenerobject property.
     * @param {Pointer<WS_LISTENER>} listener A pointer to the <b>Listener</b> object with the property to set.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> and may not be <b>NULL</b>.
     * @param {Integer} id Identifier of the property to set.
     * @param {Pointer} value A void pointer to the property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes  of the property value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object.
     * 
     * The specified size was not appropriate for the property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough space to set the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetlistenerproperty
     * @since windows6.1
     */
    static WsSetListenerProperty(listener, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsSetListenerProperty", "ptr", listener, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a channel associated with a specified listener.
     * @param {Pointer<WS_LISTENER>} listener Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the listener for which to create a channel.  The listener 
     *                     can be in any state. (For listener states, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_state">WS_LISTENER_STATE</a>  enumeration.)
     * @param {Pointer<WS_CHANNEL_PROPERTY>} properties An array of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_channel_property">WS_CHANNEL_PROPERTY</a> structures containing optional values for channel initialization.  This can be a <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     *                 
     * 
     * For information on creating a custom channel, see the Remarks section.
     * @param {Integer} propertyCount The number of  properties in the <i>properties</i> array.
     * @param {Pointer<Pointer<WS_CHANNEL>>} channel On success, a pointer that receives the address of the created channel.   
     *                     When the channel  is no longer needed, you must free  it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreechannel">WsFreeChannel</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatechannelforlistener
     * @since windows6.1
     */
    static WsCreateChannelForListener(listener, properties, propertyCount, channel, error) {
        channelMarshal := channel is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateChannelForListener", "ptr", listener, "ptr", properties, "uint", propertyCount, channelMarshal, channel, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a message object with the specified properties.
     * @param {Integer} envelopeVersion A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION</a> enumeration value that specifies the version of the envelope for the message.
     * @param {Integer} addressingVersion A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION</a> that specifies the version of the addressing for the message.
     * @param {Pointer<WS_MESSAGE_PROPERTY>} properties An array of optional properties for the message. See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_property">WS_MESSAGE_PROPERTY</a>.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<Pointer<WS_MESSAGE>>} message On   success, a pointer that receives the address of a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure representing the new message.
     *                 
     * 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatemessage
     * @since windows6.1
     */
    static WsCreateMessage(envelopeVersion, addressingVersion, properties, propertyCount, message, error) {
        messageMarshal := message is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateMessage", "int", envelopeVersion, "int", addressingVersion, "ptr", properties, "uint", propertyCount, messageMarshal, message, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a message for use with a specified channel.
     * @param {Pointer<WS_CHANNEL>} channel Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> structure representing the channel for the message.
     * @param {Pointer<WS_MESSAGE_PROPERTY>} properties An array of optional properties for the message. See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_property">WS_MESSAGE_PROPERTY</a>.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<Pointer<WS_MESSAGE>>} message On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure representing the new message.
     *                 
     * 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatemessageforchannel
     * @since windows6.1
     */
    static WsCreateMessageForChannel(channel, properties, propertyCount, message, error) {
        messageMarshal := message is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateMessageForChannel", "ptr", channel, "ptr", properties, "uint", propertyCount, messageMarshal, message, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function initializes the headers for the message in preparation for processing.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the Message object to initialize.  The Message must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object instance returned
     *                     by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessage">WsCreateMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessageforchannel">WsCreateMessageForChannel</a> and may not be NULL.
     * @param {Integer} initialization Defines the Message initialization. 
     *                 
     * 
     * <div class="alert"><b>Note</b>  If the  <i>initialization</i> value is set to <b>WS_REPLY_MESSAGE</b> or
     *                 <b>WS_FAULT_MESSAGE</b> the message is automatically addressed.
     *             </div>
     * <div> </div>
     * @param {Pointer<WS_MESSAGE>} sourceMessage A pointer to a message object that is used to initialize the <i>message</i> parameter.
     *                     This value should be NULL unless the initialization parameter
     *                     has the value of <b>WS_DUPLICATE_MESSAGE</b>,
     *                     <b>WS_REPLY_MESSAGE</b>, or <b>WS_FAULT_MESSAGE</b>.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsinitializemessage
     * @since windows6.1
     */
    static WsInitializeMessage(message, initialization, sourceMessage, error) {
        result := DllCall("webservices.dll\WsInitializeMessage", "ptr", message, "int", initialization, "ptr", sourceMessage, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets the Message state back to WS_MESSAGE_STATE_EMPTY. In this state the Message object can be reused.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the Message  object to reset.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsresetmessage
     * @since windows6.1
     */
    static WsResetMessage(message, error) {
        result := DllCall("webservices.dll\WsResetMessage", "ptr", message, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory resource associated with a Message object.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object returned
     *                     by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessage">WsCreateMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessageforchannel">WsCreateMessageForChannel</a> and the referenced value may not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreemessage
     * @since windows6.1
     */
    static WsFreeMessage(message) {
        DllCall("webservices.dll\WsFreeMessage", "ptr", message)
    }

    /**
     * This function populates a ULONG parameter with the WS_HEADER_ATTRIBUTES from the header element on which the reader is positioned. The envelope version of the message is used to determine which attributes to return.
     * @param {Pointer<WS_MESSAGE>} message A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure containing the message to query.  This envelope version of the message is used to determine which attributes match.
     *                 The message can be in any state except <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the reader to query.  This must be valid WS_XML_READER object returned from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatereader">WsCreateReader</a>   and cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} headerAttributes On success the value referenced by this pointer is set to the header attributes.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetheaderattributes
     * @since windows6.1
     */
    static WsGetHeaderAttributes(message, reader, headerAttributes, error) {
        headerAttributesMarshal := headerAttributes is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsGetHeaderAttributes", "ptr", message, "ptr", reader, headerAttributesMarshal, headerAttributes, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Finds a particular standard header in the message and deserializes it.
     * @param {Pointer<WS_MESSAGE>} message The message containing the header.
     *                 
     * 
     * The message can be in any state but <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Integer} headerType The type of header to deserialize.
     * @param {Integer} valueType The type of value to deserialize.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a> for
     *                     the set of types which correspond to each type of header.
     * @param {Integer} readOption Whether the value is required, and how to allocate the value. 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_NILLABLE_VALUE</a> and <b>WS_READ_NILLABLE_POINTER</b> 
     *                     read options cannot be specified since the header types in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a> 
     *                     are not allowed to be nillable in the respective standards specifications.
     *                     See <b>WS_READ_OPTION</b> for more information.
     * @param {Pointer<WS_HEAP>} heap The heap to store the deserialized header data in.
     *                     If this is <b>NULL</b>, then the message heap will be used.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header does not exist, and is required.
     *                 
     * 
     * There are multiple instances of the type of header present in the message.
     *                 
     * 
     * The input data was not in the expected format.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There size quota of the heap was exceeded.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory available to deserialize the header.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are incorrect.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetheader
     * @since windows6.1
     */
    static WsGetHeader(message, headerType, valueType, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetHeader", "ptr", message, "int", headerType, "int", valueType, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Finds an application-defined header of the message and deserializes it.
     * @param {Pointer<WS_MESSAGE>} message The message containing the header.
     *                 
     * 
     * The message can be in any state but <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} customHeaderDescription A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_element_description">WS_ELEMENT_DESCRIPTION</a> which describes the header element.
     * @param {Integer} repeatingOption Whether the header may appear more than once in
     *                     the message.
     *                 
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_repeating_header_option">WS_REPEATING_HEADER</a> is used, then
     *                     the header index indicates which of the headers
     *                     with the specified headerName to return.
     *                 
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_repeating_header_option">WS_SINGLETON_HEADER</a> is used, then
     *                     the headerIndex must be zero.
     * @param {Integer} headerIndex The zero-based index of the header within
     *                     the set of headers with the specified headerName.
     * @param {Integer} readOption Whether the value is required, and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<WS_HEAP>} heap The heap to store the deserialized header data in.
     *                     If this is <b>NULL</b>, then the message heap will be used
     *                     as required by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<Integer>} headerAttributes Returns the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_text_type">WS_HEADER_ATTRIBUTES</a> for this header.
     *                     The pointer may be <b>NULL</b>, in which case no attributes are returned.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header does not exist, and is required.
     *                 
     * 
     * 
     * <a href="/windows/desktop/api/webservices/ne-webservices-ws_repeating_header_option">WS_SINGLETON_HEADER</a> was specified, and there are 
     *                     multiple instances of the type of header present in the message.
     *                 
     * 
     * The input data was not in the expected format.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There size quota of the heap was exceeded.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory available to deserialize the header.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are incorrect.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetcustomheader
     * @since windows6.1
     */
    static WsGetCustomHeader(message, customHeaderDescription, repeatingOption, headerIndex, readOption, heap, value, valueSize, headerAttributes, error) {
        headerAttributesMarshal := headerAttributes is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsGetCustomHeader", "ptr", message, "ptr", customHeaderDescription, "int", repeatingOption, "uint", headerIndex, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, headerAttributesMarshal, headerAttributes, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes the standard WS_HEADER_TYPE object from a message.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object with the header  to be removed. The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b>.
     * @param {Integer} headerType Indicates the type of header to be removed.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are multiple instances of the type of header present in the message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsremoveheader
     * @since windows6.1
     */
    static WsRemoveHeader(message, headerType, error) {
        result := DllCall("webservices.dll\WsRemoveHeader", "ptr", message, "int", headerType, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds or replaces the specified standard header in the message.
     * @param {Pointer<WS_MESSAGE>} message The message to set the header in.
     *                 
     * 
     * The message can be in any state but <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Integer} headerType The type of header to serialize.
     * @param {Integer} valueType The type of the value to serialize.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a> for
     *                     the set of types supported for each type of header.
     * @param {Integer} writeOption Whether the header element is required, and how the value is allocated.
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_NILLABLE_VALUE</a> and <b>WS_WRITE_NILLABLE_POINTER</b> 
     *                     write options cannot be specified since the header types in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a> 
     *                     are not allowed to be nillable in the respective standards specifications.
     *                     See <b>WS_WRITE_OPTION</b> for more information.
     * @param {Pointer} value The header value to serialize.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for
     *                     more information.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are multiple instances of the type of header present in the message.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory available to serialize the header.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are incorrect.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetheader
     * @since windows6.1
     */
    static WsSetHeader(message, headerType, valueType, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsSetHeader", "ptr", message, "int", headerType, "int", valueType, "int", writeOption, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes a custom header from the message. This function is designed to handle types of headers that appear once in the message and are targeted at the ultimate receiver. Headers targeted with a role other than ultimate receiver are ignored.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object with the header  to be removed.  
     * 
     * The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b>.
     * @param {Pointer<WS_XML_STRING>} headerName A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> object that references the "local name" of the header element to be  removed.
     * @param {Pointer<WS_XML_STRING>} headerNs A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> object that references the namespace of the header element to be removed.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are multiple instances of the type of header present in the message.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory available to serialize the header.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsremovecustomheader
     * @since windows6.1
     */
    static WsRemoveCustomHeader(message, headerName, headerNs, error) {
        result := DllCall("webservices.dll\WsRemoveCustomHeader", "ptr", message, "ptr", headerName, "ptr", headerNs, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds the specified application-defined header to the message.
     * @param {Pointer<WS_MESSAGE>} message The message to which to add the header.
     *                 
     * 
     * The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b> (see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE</a> enumeration..
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} headerDescription The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_element_description">WS_ELEMENT_DESCRIPTION</a> structure that describes the header.
     * @param {Integer} writeOption Whether the header element is required, and how the value is allocated.
     *                     For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> enumeration.
     * @param {Pointer} value The header value to serialize.  For more information, see  the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> enumeration.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     * @param {Integer} headerAttributes The values of the SOAP attributes for the header.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are multiple instances of the same type of header present in the message.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are incorrect.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsaddcustomheader
     * @since windows6.1
     */
    static WsAddCustomHeader(message, headerDescription, writeOption, value, valueSize, headerAttributes, error) {
        result := DllCall("webservices.dll\WsAddCustomHeader", "ptr", message, "ptr", headerDescription, "int", writeOption, "ptr", value, "uint", valueSize, "uint", headerAttributes, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds a specified mapped header to the message.
     * @param {Pointer<WS_MESSAGE>} message Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure representing the  <a href="https://docs.microsoft.com/windows/desktop/wsw/message">message</a> to to which to add the mapped header.
     *                 
     * 
     * The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b> (see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE</a> enumeration.
     * @param {Pointer<WS_XML_STRING>} headerName Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> containing the name of the header.
     * @param {Integer} valueType The type of header value to deserialize.  For possible types and the corresponding headers, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a>
     * @param {Integer} writeOption Whether the header is required, and how the value is allocated.
     *                     For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> enumeration.
     * @param {Pointer} value The header value to serialize.  For more information, see  the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> enumeration.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are incorrect.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsaddmappedheader
     * @since windows6.1
     */
    static WsAddMappedHeader(message, headerName, valueType, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsAddMappedHeader", "ptr", message, "ptr", headerName, "int", valueType, "int", writeOption, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes all instances of a mapped header from the message.
     * @param {Pointer<WS_MESSAGE>} message The message to set the header in.
     *                 
     * 
     * The message can be in any state but <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<WS_XML_STRING>} headerName The name of the mapped header to remove.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are incorrect.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsremovemappedheader
     * @since windows6.1
     */
    static WsRemoveMappedHeader(message, headerName, error) {
        result := DllCall("webservices.dll\WsRemoveMappedHeader", "ptr", message, "ptr", headerName, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Finds a mapped header in the message and deserializes it.
     * @param {Pointer<WS_MESSAGE>} message The message containing the header.
     *                 
     * 
     * The message can be in any state but <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<WS_XML_STRING>} headerName The name of the mapped header.
     * @param {Integer} repeatingOption Whether the header may appear more than once in
     *                     the message.
     *                 
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_repeating_header_option">WS_REPEATING_HEADER</a> is used, then
     *                     the header index indicates which of the headers
     *                     with the specified headerName to return.
     *                 
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_repeating_header_option">WS_SINGLETON_HEADER</a> is used, then
     *                     the headerIndex must be zero.
     * @param {Integer} headerIndex The zero-based index of the header within
     *                     the set of headers with the specified headerName.
     * @param {Integer} valueType The type of value to deserialize.
     * @param {Integer} readOption Whether the value is required, and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     *                 
     * 
     * If the header is optional (may appear zero or one times), then
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTIONAL_POINTER</a> can be used.
     * @param {Pointer<WS_HEAP>} heap The heap to store the deserialized header data in.
     *                     If this is <b>NULL</b>, then the message heap will be used.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header does not exist, and is required.
     *                 
     * 
     * The input data was not in the expected format.
     *                 
     * 
     * 
     * <a href="/windows/desktop/api/webservices/ne-webservices-ws_repeating_header_option">WS_SINGLETON_HEADER</a> was specified, and there are
     *                     multiple instances of the header with the specified name in the message.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There size quota of the heap was exceeded.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough memory available to deserialize the header.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters are incorrect.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetmappedheader
     * @since windows6.1
     */
    static WsGetMappedHeader(message, headerName, repeatingOption, headerIndex, valueType, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetMappedHeader", "ptr", message, "ptr", headerName, "int", repeatingOption, "uint", headerIndex, "int", valueType, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes a value in the body of a message. This is a helper function that serializes a value to the XML Writer of the message. The message state must be set to WS_MESSAGE_STATE_WRITING. This function does not cause any state transitions.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object for writing to.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} bodyDescription A pointer to information describing how to write the value.
     * @param {Integer} writeOption Determines whether the value is required and how the value is allocated.
     *                     <div class="alert"><b>Note</b>  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.</div>
     * <div> </div>
     * @param {Pointer} value A void pointer to the value to write.
     * @param {Integer} valueSize The size in bytes of the value to write.
     *                 If the value is <b>NULL</b> the size should be 0.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritebody
     * @since windows6.1
     */
    static WsWriteBody(message, bodyDescription, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsWriteBody", "ptr", message, "ptr", bodyDescription, "int", writeOption, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This is a helper function that deserializes a value from the XML Readerof the message. The WS_MESSAGE_STATE must be set to WS_MESSAGE_STATE_READING. This function does not cause any state transitions.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object to read the body from.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} bodyDescription A pointer to the object encapsulating the metadata that describes the mapping of the value to an element.
     * @param {Integer} readOption Determines whether the value is required and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<WS_HEAP>} heap A pointer to the <b>Heap</b> object to read the element into.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> object.
     * @param {Pointer} value The interpretation of the data referenced by this parameter depends on the <b>WS_READ_OPTION</b>.
     * @param {Integer} valueSize The interpretation of the value of this parameter depends on the <b>WS_READ_OPTION</b>.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadbody
     * @since windows6.1
     */
    static WsReadBody(message, bodyDescription, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadBody", "ptr", message, "ptr", bodyDescription, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes the start of the message including the current set of headers of the message and prepares to write the body elementss.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object to write.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<WS_XML_WRITER>} writer A pointer to the <b>XML Writer</b> object to write the Message.  The Message object uses the Writer in subsequent calls to write the message.  The caller must keep the writer valid until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetmessage">WsResetMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a> is called.
     *                 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_message_done_callback">WS_MESSAGE_DONE_CALLBACK</a> parameter can be used to determine that the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> is no longer in use.
     * @param {Pointer<WS_MESSAGE_DONE_CALLBACK>} doneCallback The callback function invoked when the Message is released or reset. This callback can be used to indicate that the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object is no longer
     *  in use by this message. If this function fails the callback is not called. If the function succeeds the callback is invoked one time only.
     * @param {Pointer<Void>} doneCallbackState A void pointer to a user-defined state that will be passed to the specified callback. This parameter may be <b>NULL</b>.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswriteenvelopestart
     * @since windows6.1
     */
    static WsWriteEnvelopeStart(message, writer, doneCallback, doneCallbackState, error) {
        doneCallbackStateMarshal := doneCallbackState is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsWriteEnvelopeStart", "ptr", message, "ptr", writer, "ptr", doneCallback, doneCallbackStateMarshal, doneCallbackState, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Writes the closing elements of a message.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object to write.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswriteenvelopeend
     * @since windows6.1
     */
    static WsWriteEnvelopeEnd(message, error) {
        result := DllCall("webservices.dll\WsWriteEnvelopeEnd", "ptr", message, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the headers of the message and prepare to read the body elements.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object to read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the Reader with the message to read.  The Message object uses the Reader in the current and subsequent
     *                     calls.  <div class="alert"><b>Note</b>  The function caller must keep the Reader valid until
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetmessage">WsResetMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a> is called.  
     *                     The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_message_done_callback">WS_MESSAGE_DONE_CALLBACK</a> parameter can be used a way to know
     *                     that the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> is no longer in use.
     *                 </div>
     * <div> </div>
     * @param {Pointer<WS_MESSAGE_DONE_CALLBACK>} doneCallback Identifies the callback function to initiate on success of the current operation once the message has
     *                     been released. <div class="alert"><b>Note</b>  Messages are released using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetmessage">WsResetMessage</a>
     * </div>
     * <div> </div>  The callback
     *                     can be used to discover whether the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> instance  is in use by this message.  If the current operation  fails the callback is not called.
     * @param {Pointer<Void>} doneCallbackState A pointer to user-defined state that can be passed
     *                     to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_message_done_callback">WS_MESSAGE_DONE_CALLBACK</a>.
     *                     This parameter may be <b>NULL</b> if the callback is not used.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadenvelopestart
     * @since windows6.1
     */
    static WsReadEnvelopeStart(message, reader, doneCallback, doneCallbackState, error) {
        doneCallbackStateMarshal := doneCallbackState is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsReadEnvelopeStart", "ptr", message, "ptr", reader, "ptr", doneCallback, doneCallbackStateMarshal, doneCallbackState, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the closing elements of a message. The operation allows for reading of messages from sources other than Channels. If the source is a Channel use WsReadMessageEnd.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadenvelopeend
     * @since windows6.1
     */
    static WsReadEnvelopeEnd(message, error) {
        result := DllCall("webservices.dll\WsReadEnvelopeEnd", "ptr", message, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a specified Message object property. The property to retrieve is identified by a WS_MESSAGE_PROPERTY_ID input parameter.
     * @param {Pointer<WS_MESSAGE>} message A pointer to a <b>Message</b> object containing the desired property.  This parameter must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> object.
     * @param {Integer} id This is a <b>WS_MESSAGE_PROPERTY_ID</b> enumerator value that identifies the desired property.
     * @param {Pointer} value A reference to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application has run out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetmessageproperty
     * @since windows6.1
     */
    static WsGetMessageProperty(message, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetMessageProperty", "ptr", message, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This operation sets a Messageproperty.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <b>Message</b> object with the property to set.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object and the referenced value may not be <b>NULL</b>.
     * @param {Integer} id The identifier of the property to set.
     * @param {Pointer} value A pointer to the property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes  of the property value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object.
     * 
     * The specified size was not appropriate for the property.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not enough space to set the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wssetmessageproperty
     * @since windows6.1
     */
    static WsSetMessageProperty(message, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsSetMessageProperty", "ptr", message, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Addresses a message to a specified endpoint address.
     * @param {Pointer<WS_MESSAGE>} message Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure respresenting the  message to be addressed.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} address Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a> structure containing the endpoint  to which to address the message.
     * 
     * <div class="alert"><b>Note</b>  Passing <b>NULL</b> to this parameter indicates that no headers are added to the message.  This provides
     *                     a way to set the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_property_id">WS_MESSAGE_PROPERTY_ID</a> to <b>WS_MESSAGE_PROPERTY_IS_ADDRESSED</b> 
     *                     without modifying the set of headers in the message.
     *                 </div>
     * <div> </div>
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message has already been addressed.
     *                     (The <b>WS_MESSAGE_PROPERTY_IS_ADDRESSED</b> property
     *                     indicates whether a message has already been addressed.)
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function can return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsaddressmessage
     * @since windows6.1
     */
    static WsAddressMessage(message, address, error) {
        result := DllCall("webservices.dll\WsAddressMessage", "ptr", message, "ptr", address, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Verifies that the specified headers were understood by the receiver. Note  This function should be called after all headers have been read for a received message.  .
     * @param {Pointer<WS_MESSAGE>} message Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure containing the headers to be understood.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  where additional error information is stored if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message is not in the correct state.
     *              For more information, see the Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  validation failed, or the message was not correctly formed.
     *             
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscheckmustunderstandheaders
     * @since windows6.1
     */
    static WsCheckMustUnderstandHeaders(message, error) {
        result := DllCall("webservices.dll\WsCheckMustUnderstandHeaders", "ptr", message, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function marks a header as &quot;understood&quot; by the application.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the Message object with the header to mark.
     * @param {Pointer<WS_XML_NODE_POSITION>} headerPosition A pointer to the position of the header element within the XML header segment.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message is not in the correct state.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsmarkheaderasunderstood
     * @since windows6.1
     */
    static WsMarkHeaderAsUnderstood(message, headerPosition, error) {
        result := DllCall("webservices.dll\WsMarkHeaderAsUnderstood", "ptr", message, "ptr", headerPosition, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Ensures that there are a sufficient number of bytes available in a message for reading.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure intended for "filling".
     * @param {Integer} minSize The minimum number of bytes that the message should have buffered. If the current byte count buffered is equal to or greater than the value of <i>minSize</i> the function does nothing.
     *                 
     * 
     * <div class="alert"><b>Note</b>  The value of  <i>minSize</i> represents the size of the encoded form of the XML that is expected.  This can vary by encoding and also how the actual XML is structured. Typical use of this function is to select an expected upper bound byte count for  encoding or XML structure to ensure that the expected data is read.
     * </div>
     * <div> </div>
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure with information about invoking the function asynchronously.  A <b>NULL</b> value indicates a request for synchronous operation.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Start of message was received successfully.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfillbody
     * @since windows6.1
     */
    static WsFillBody(message, minSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsFillBody", "ptr", message, "uint", minSize, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Flushes all accumulated message body data that has been written.
     * @param {Pointer<WS_MESSAGE>} message A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure containing the accumulated message body data.
     * @param {Integer} minSize Specifies the minimum number of bytes that must be present in the
     *                     message for the function to perform the data flush.  
     *                 
     * 
     * <div class="alert"><b>Note</b>  If the message contains less
     *                     than <i>minSize</i> WSFlushBody terminates without doing the I/O flush. A larger value will ensure that no I/O will be done until
     *                     the larger value has been accumulated.  This is useful for ensuring
     *                     that larger chunks are used when doing I/O.
     *                 And presuming that 
     *                     there is at least one byte of accumulated data a value of 0 in  <i>minSize</i> guarantees that it will be flushed.
     *                 </div>
     * <div> </div>
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure with information about invoking the function asynchronously.  A <b>NULL</b> 
     *                  value indicates a request for synchronous operation.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsflushbody
     * @since windows6.1
     */
    static WsFlushBody(message, minSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsFlushBody", "ptr", message, "uint", minSize, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Get a security token from a security token service (STS) that acts as the token issuer in a federation scenario.
     * @param {Pointer<WS_CHANNEL>} channel The channel on which the negotiation to obtain the security token
     * should take place.
     *                 
     * 
     * The supplied channel should have been <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">created</a> with the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_description">WS_SECURITY_DESCRIPTION</a> to meet the security requirements of
     * the issuer, and then <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenchannel">opened</a> to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a> of the issuer.  The caller is also
     * responsible for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsclosechannel">closing</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreechannel">freeing</a> the channel after the completion of
     * this function.
     *                 
     * 
     * Thus, the channel must be in state <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE_OPEN</a>when this function is called.  After a successful completion of this
     * function, the channel will be in state <b>WS_CHANNEL_STATE_OPEN</b>.  After a failed completion, it will
     * either be in state <b>WS_CHANNEL_STATE_OPEN</b> or state <b>WS_CHANNEL_STATE_FAULTED</b>.
     * @param {Pointer<WS_REQUEST_SECURITY_TOKEN_PROPERTY>} properties An optional group of settings to be used in the negotiation process
     * with the issuer.
     * @param {Integer} propertyCount The number of items in the properties array.
     * @param {Pointer<Pointer<WS_SECURITY_TOKEN>>} token The XML security token obtained.  This is set upon successful
     * completion of the function call, and is unmodified if any failure
     * occurs during the execution of the function.
     *                 
     * 
     * The returned security token may be used with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_token_message_security_binding">WS_XML_TOKEN_MESSAGE_SECURITY_BINDING</a> if it is to be
     * presented to a service.  The token must be freed using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreesecuritytoken">WsFreeSecurityToken</a> when it is no longer needed.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsrequestsecuritytoken
     * @since windows6.1
     */
    static WsRequestSecurityToken(channel, properties, propertyCount, token, asyncContext, error) {
        tokenMarshal := token is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsRequestSecurityToken", "ptr", channel, "ptr", properties, "uint", propertyCount, tokenMarshal, token, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a field or a property from a security token.
     * @param {Pointer<WS_SECURITY_TOKEN>} securityToken The security token from which the property should be extracted.
     * @param {Integer} id The id of the property to retrieve.
     * @param {Pointer} value The location to store the retrieved property.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @param {Pointer<WS_HEAP>} heap Heap to store additional property data. This parameter must be non-<b>NULL</b> when the queried property is
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_token_property_id">WS_SECURITY_TOKEN_PROPERTY_SYMMETRIC_KEY</a> and must be <b>NULL</b> otherwise.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetsecuritytokenproperty
     * @since windows6.1
     */
    static WsGetSecurityTokenProperty(securityToken, id, value, valueSize, heap, error) {
        result := DllCall("webservices.dll\WsGetSecurityTokenProperty", "ptr", securityToken, "int", id, "ptr", value, "uint", valueSize, "ptr", heap, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a security token from its specified XML form.
     * @param {Pointer<WS_XML_BUFFER>} tokenXml Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> structure containing  the security token in its XML form.    The referenced buffer must have exactly
     * one top level XML element.
     * @param {Pointer<WS_SECURITY_KEY_HANDLE>} tokenKey Pointer to a <b>SECURITY_KEY_HANDLE</b> structure that may or may not contain a cryptographic proof-of-possession key. If present the key can be used to bind
     * this security token to a message.  If the value of the <i>tokenKey</i> parameter is not <b>NULL</b>, the token is
     * assumed to have a proof-of-possession key.  If the value  is <b>NULL</b>, the structure is
     * assumed to be a "bearer token" as defined below.
     * 
     * <ul>
     * <li> A bearer token also called a basic or keyless token is serialized in a message to demonstrate
     * the message's possession of the token, and to indicate the intention to apply the claims from the token to that message.
     * 
     * 
     * 
     * </li>
     * <li> A proof-of-possession token also called a PoP or
     * cryptographic token has an associated
     * cryptographic key which must be used to "sign" a message in order to
     * demonstrate possession of the token and to indicate the intention to
     * apply the claims from the token to that message.  An example is an
     * X.509 certificate: the message must be signed with the private key of
     * the certificate in order for a receiving principal to accept the
     * message as carrying the claims present in the certificate.
     * 
     * </li>
     * </ul>
     * @param {Pointer<WS_XML_SECURITY_TOKEN_PROPERTY>} properties An array of  <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_security_token_property">WS_XML_SECURITY_TOKEN_PROPERTY</a> structures containing optional properties for the XML security token.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<Pointer<WS_SECURITY_TOKEN>>} token On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-security-token">WS_SECURITY_TOKEN</a> structure representing the created XML security token.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreesecuritytoken">WsFreeSecurityToken</a>.
     *                 
     * 
     * The returned security token may be used with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_token_message_security_binding">WS_XML_TOKEN_MESSAGE_SECURITY_BINDING</a> if it is to be
     * 
     * presented to a service.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatexmlsecuritytoken
     * @since windows6.1
     */
    static WsCreateXmlSecurityToken(tokenXml, tokenKey, properties, propertyCount, token, error) {
        tokenMarshal := token is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateXmlSecurityToken", "ptr", tokenXml, "ptr", tokenKey, "ptr", properties, "uint", propertyCount, tokenMarshal, token, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory resource associated with a Security Token object.
     * @param {Pointer<WS_SECURITY_TOKEN>} token A pointer to the <b>Security Token</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-security-token">WS_SECURITY_TOKEN</a>object returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatexmlsecuritytoken">WsCreateXmlSecurityToken</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreesecuritytoken
     * @since windows6.1
     */
    static WsFreeSecurityToken(token) {
        DllCall("webservices.dll\WsFreeSecurityToken", "ptr", token)
    }

    /**
     * Revokes a security context. Can only be called on the server side. Further requests using this security context will fail and a fault will be sent to the client.
     * @param {Pointer<WS_SECURITY_CONTEXT>} securityContext The security context to be revoked.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsrevokesecuritycontext
     * @since windows6.1
     */
    static WsRevokeSecurityContext(securityContext, error) {
        result := DllCall("webservices.dll\WsRevokeSecurityContext", "ptr", securityContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a property of the specified security context.
     * @param {Pointer<WS_SECURITY_CONTEXT>} securityContext The security context that is queried for its property.
     * @param {Integer} id The id of the property (one of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_context_property_id">WS_SECURITY_CONTEXT_PROPERTY_ID</a>).
     * @param {Pointer} value The address to place the retrieved value. The pointer must have an alignment compatible with the type of the property.
     * @param {Integer} valueSize The size of the buffer that the caller has allocated for the retrieved value.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetsecuritycontextproperty
     * @since windows6.1
     */
    static WsGetSecurityContextProperty(securityContext, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetSecurityContextProperty", "ptr", securityContext, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Read an element producing a value of the specified WS_TYPE.
     * @param {Pointer<WS_XML_READER>} reader The reader that is positioned on the XML to deserialize.
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} elementDescription A pointer to a description of how to deserialize the element.
     * @param {Integer} readOption Whether the element is required, and how to allocate the value.  
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<WS_HEAP>} heap The heap to store the deserialized values in.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size quota of the heap was exceeded.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadelement
     * @since windows6.1
     */
    static WsReadElement(reader, elementDescription, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadElement", "ptr", reader, "ptr", elementDescription, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Read an attribute producing a value of the specified WS_TYPE.
     * @param {Pointer<WS_XML_READER>} reader The reader that is positioned on the element containing the attribute.
     * @param {Pointer<WS_ATTRIBUTE_DESCRIPTION>} attributeDescription A pointer to a description of how to deserialize the attribute.
     * @param {Integer} readOption Whether the attribute is required, and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<WS_HEAP>} heap The heap to store the deserialized values in.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size quota of the heap was exceeded.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadattribute
     * @since windows6.1
     */
    static WsReadAttribute(reader, attributeDescription, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadAttribute", "ptr", reader, "ptr", attributeDescription, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Read a value of a given WS_TYPE from XML according to the WS_TYPE_MAPPING.
     * @param {Pointer<WS_XML_READER>} reader The reader that is positioned on the XML to deserialize.
     * @param {Integer} typeMapping Describes how the type maps to the XML that is being read.
     * @param {Integer} type The type of the value to deserialize.
     * @param {Pointer<Void>} typeDescription Additional information about the type.  Each type has a different description
     *                     structure.  This may be <b>NULL</b>, depending on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>.
     * @param {Integer} readOption Whether the value is required, and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<WS_HEAP>} heap The heap to store the deserialized values in.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size quota of the heap was exceeded.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadtype
     * @since windows6.1
     */
    static WsReadType(reader, typeMapping, type, typeDescription, readOption, heap, value, valueSize, error) {
        typeDescriptionMarshal := typeDescription is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsReadType", "ptr", reader, "int", typeMapping, "int", type, typeDescriptionMarshal, typeDescription, "int", readOption, "ptr", heap, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Write a typed value as an XML element.
     * @param {Pointer<WS_XML_WRITER>} writer The writer to write the element to.
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} elementDescription A pointer to a description of how to serialize the element.
     * @param {Integer} writeOption Information about how the value is allocated.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} value A pointer to the value to serialize.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     *                 
     * 
     * If the value is <b>NULL</b>, then the size should be 0.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswriteelement
     * @since windows6.1
     */
    static WsWriteElement(writer, elementDescription, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsWriteElement", "ptr", writer, "ptr", elementDescription, "int", writeOption, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Write a typed value as an XML attribute.
     * @param {Pointer<WS_XML_WRITER>} writer The writer to write the attribute to.
     * @param {Pointer<WS_ATTRIBUTE_DESCRIPTION>} attributeDescription A pointer to a description of how to serialize the attribute.
     * @param {Integer} writeOption Information about how the value is allocated.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} value A pointer to the value to serialize.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     *                 
     * 
     * If the value is <b>NULL</b>, then the size should be 0.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswriteattribute
     * @since windows6.1
     */
    static WsWriteAttribute(writer, attributeDescription, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsWriteAttribute", "ptr", writer, "ptr", attributeDescription, "int", writeOption, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Write a value of a given WS_TYPE to XML according to the WS_TYPE_MAPPING.
     * @param {Pointer<WS_XML_WRITER>} writer The writer to write the value to.
     * @param {Integer} typeMapping Describes how the type maps to the XML that is being written.
     * @param {Integer} type The type of the value to serialize.
     * @param {Pointer<Void>} typeDescription Additional information about the type.  Each type has a different description
     *                     structure.  This may be <b>NULL</b>, depending on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>.
     * @param {Integer} writeOption Whether the value is required, and how the value is allocated.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} value A pointer to the value to serialize.
     * @param {Integer} valueSize The size of the value being serialized.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wswritetype
     * @since windows6.1
     */
    static WsWriteType(writer, typeMapping, type, typeDescription, writeOption, value, valueSize, error) {
        typeDescriptionMarshal := typeDescription is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsWriteType", "ptr", writer, "int", typeMapping, "int", type, typeDescriptionMarshal, typeDescription, "int", writeOption, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * A service operation can use this function to register for a cancel notification. It is only valid to call this API when the service operation is executing. The behavior for calling it after the completion of Service Operation is not supported.
     * @param {Pointer<WS_OPERATION_CONTEXT>} context The context that the property value is being obtained for.
     * @param {Pointer<WS_OPERATION_CANCEL_CALLBACK>} cancelCallback Function pointer for cancel notification function.
     * @param {Pointer<WS_OPERATION_FREE_STATE_CALLBACK>} freestateCallback A optional parameter specifying the function pointer to the free state call.
     * @param {Pointer<Void>} userState A optional parameter specifying the application specific state which can be used to identify call data.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsregisteroperationforcancel
     * @since windows6.1
     */
    static WsRegisterOperationForCancel(context, cancelCallback, freestateCallback, userState, error) {
        userStateMarshal := userState is VarRef ? "ptr" : "ptr"

        result := DllCall("webservices.dll\WsRegisterOperationForCancel", "ptr", context, "ptr", cancelCallback, "ptr", freestateCallback, userStateMarshal, userState, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a specified Service Host property. The property to retrieve is identified by a WS_SERVICE_PROPERTY_ID input parameter.
     * @param {Pointer<WS_SERVICE_HOST>} serviceHost A pointer to the WS_SERVICE_HOST object containing the property to retrieve.
     * @param {Integer} id This is a <b>WS_SERVICE_PROPERTY_ID</b> enumerator value that identifies the property to retrieve.
     * @param {Pointer} value A void pointer to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetservicehostproperty
     * @since windows6.1
     */
    static WsGetServiceHostProperty(serviceHost, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetServiceHostProperty", "ptr", serviceHost, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a service host for the specified endpoints.
     * @param {Pointer<Pointer<WS_SERVICE_ENDPOINT>>} endpoints An array of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a> structures representing the service endpoints for which to create the service host.
     * @param {Integer} endpointCount The number of endpoints in the <i>endpoints</i> array.
     * @param {Pointer<WS_SERVICE_PROPERTY>} serviceProperties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_property">WS_SERVICE_PROPERTY</a> structures containing optional properties for the service host.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>servicePropertyCount</i> parameter must be 0 (zero).
     * @param {Integer} servicePropertyCount The number of properties in the <i>serviceProperties</i> array.
     * @param {Pointer<Pointer<WS_SERVICE_HOST>>} serviceHost On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a> structure representing the new service host.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeservicehost">WsFreeServiceHost</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument is specified for creating the service host.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreateservicehost
     * @since windows6.1
     */
    static WsCreateServiceHost(endpoints, endpointCount, serviceProperties, servicePropertyCount, serviceHost, error) {
        endpointsMarshal := endpoints is VarRef ? "ptr*" : "ptr"
        serviceHostMarshal := serviceHost is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateServiceHost", endpointsMarshal, endpoints, "ushort", endpointCount, "ptr", serviceProperties, "uint", servicePropertyCount, serviceHostMarshal, serviceHost, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens a Service Host for communication and starts the Listeners on all the endpoints. Client applications cannot connect to Service endpoints until WsOpenSerivceHost is called.
     * @param {Pointer<WS_SERVICE_HOST>} serviceHost A pointer to the <b>Service Host</b> object to open.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateservicehost">WsCreateServiceHost</a> and the referenced <b>Service Host</b> value may not be <b>NULL</b>.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer  to A WS_ASYNC_CONTEXT object that has information about how to invoke the function asynchronously.  The value is set to <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service host was aborted before the open, or during the open.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current state of the service proxy is not valid for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ADDRESS_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is already being used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ADDRESS_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is not valid for this context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsopenservicehost
     * @since windows6.1
     */
    static WsOpenServiceHost(serviceHost, asyncContext, error) {
        result := DllCall("webservices.dll\WsOpenServiceHost", "ptr", serviceHost, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes down communication with the specified service host.
     * @param {Pointer<WS_SERVICE_HOST>} serviceHost Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a> structure that represents the service host to be closed.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure containing information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current state of the service host is not valid for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscloseservicehost
     * @since windows6.1
     */
    static WsCloseServiceHost(serviceHost, asyncContext, error) {
        result := DllCall("webservices.dll\WsCloseServiceHost", "ptr", serviceHost, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Aborts all current operations on the specified service host.
     * @param {Pointer<WS_SERVICE_HOST>} serviceHost Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>  structure representing the service host on which to abort operations.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsabortservicehost
     * @since windows6.1
     */
    static WsAbortServiceHost(serviceHost, error) {
        result := DllCall("webservices.dll\WsAbortServiceHost", "ptr", serviceHost, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory associated with a Service Host object.
     * @param {Pointer<WS_SERVICE_HOST>} serviceHost A pointer to the <b>Service Host</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateservicehost">WsCreateServiceHost</a> and the referenced <b>Service Host</b> value may not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreeservicehost
     * @since windows6.1
     */
    static WsFreeServiceHost(serviceHost) {
        DllCall("webservices.dll\WsFreeServiceHost", "ptr", serviceHost)
    }

    /**
     * Resets service host so that it can be opened again.
     * @param {Pointer<WS_SERVICE_HOST>} serviceHost The service host to reset.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The serviceHost was in an inappropriate state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsresetservicehost
     * @since windows6.1
     */
    static WsResetServiceHost(serviceHost, error) {
        result := DllCall("webservices.dll\WsResetServiceHost", "ptr", serviceHost, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function retrieves a specified Service Proxy property. The property to retrieve is identified by a WS_PROXY_PROPERTY_ID input parameter.
     * @param {Pointer<WS_SERVICE_PROXY>} serviceProxy This parameter is a pointer to the WS_SERVICE_PROXY object containing the property to retrieve.
     * @param {Integer} id The value of this parameter is a <b>WS_PROXY_PROPERTY_ID</b> enumerator value that identifies the property to retrieve.
     * @param {Pointer} value This parameter is a reference to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The value of this ULONG parameter represents the byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<WS_ERROR>} error This parameter is a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> pointer to where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetserviceproxyproperty
     * @since windows6.1
     */
    static WsGetServiceProxyProperty(serviceProxy, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetServiceProxyProperty", "ptr", serviceProxy, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a service proxy with the specified properties.
     * @param {Integer} channelType A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE</a> enumeration value representing the channel type for the service proxy.
     * @param {Integer} channelBinding A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> enumeration value representing the channel binding.
     * @param {Pointer<WS_SECURITY_DESCRIPTION>} securityDescription A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_description">WS_SECURITY_DESCRIPTION</a> structure representing the security description.
     * @param {Pointer<WS_PROXY_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_proxy_property">WS_PROXY_PROPERTY</a> structures containing optional properties for the service proxy.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<WS_CHANNEL_PROPERTY>} channelProperties An array of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_channel_property">WS_CHANNEL_PROPERTY</a>  structures containing optional channel properties.  The value of this parameter may be <b>NULL</b>, in which case, the <i>channelPropertyCount</i> parameter must be 0 (zero).
     *                 
     * 
     * <div class="alert"><b>Note</b>  Be very careful about modifying the default values for these properties.</div>
     * <div> </div>
     * @param {Integer} channelPropertyCount The number of properties in the <i>channelProperties</i> array.
     * @param {Pointer<Pointer<WS_SERVICE_PROXY>>} serviceProxy On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing the new service proxy.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeserviceproxy">WsFreeServiceProxy</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreateserviceproxy
     * @since windows6.1
     */
    static WsCreateServiceProxy(channelType, channelBinding, securityDescription, properties, propertyCount, channelProperties, channelPropertyCount, serviceProxy, error) {
        serviceProxyMarshal := serviceProxy is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateServiceProxy", "int", channelType, "int", channelBinding, "ptr", securityDescription, "ptr", properties, "uint", propertyCount, "ptr", channelProperties, "uint", channelPropertyCount, serviceProxyMarshal, serviceProxy, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens a Service Proxy to a Service endpoint.
     * @param {Pointer<WS_SERVICE_PROXY>} serviceProxy A pointer to the <b>Service Proxy</b> to open.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> object
     *                     and the referenced value may not be <b>NULL</b>.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} address A pointer to the address of the endpoint.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer  to A WS_ASYNC_CONTEXT object that has information about how to invoke the function asynchronously.  The value is set to <b>NULL</b> if invoking synchronously.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     *             
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     *             
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint does not exist or could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the remote endpoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the remote endpoint was terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is not currently in service at this location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_TOO_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint is unable to process the request due to being overloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_UNREACHABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint was not reachable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_ENDPOINT_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoint address URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access was denied by the HTTP proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_VERIFICATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security verification was not successful for the received data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SECURITY_SYSTEM_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A security operation failed in the Windows Web Services framework.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_PROXY_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HTTP proxy server requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_BASIC_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'basic'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_DIGEST_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'digest'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NEGOTIATE_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'negotiate'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_SERVER_REQUIRES_NTLM_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint requires HTTP authentication scheme 'NTLM'.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsopenserviceproxy
     * @since windows6.1
     */
    static WsOpenServiceProxy(serviceProxy, address, asyncContext, error) {
        result := DllCall("webservices.dll\WsOpenServiceProxy", "ptr", serviceProxy, "ptr", address, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes down communication with the specified service proxy.
     * @param {Pointer<WS_SERVICE_PROXY>} serviceProxy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing he service proxy to be closed.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure containing information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current state of the service proxy is not valid for this operation. This is only  
     *                    error for which close will fail. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying <a href="/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> was disconnected during the close operation. This error occurs only in cases where the underlying channel is session based.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_ENDPOINT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote endpoint could not process the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscloseserviceproxy
     * @since windows6.1
     */
    static WsCloseServiceProxy(serviceProxy, asyncContext, error) {
        result := DllCall("webservices.dll\WsCloseServiceProxy", "ptr", serviceProxy, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Aborts the service proxy, and cancels any pending I/O on the service proxy.
     * @param {Pointer<WS_SERVICE_PROXY>} serviceProxy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing the service proxy to abort.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsabortserviceproxy
     * @since windows6.1
     */
    static WsAbortServiceProxy(serviceProxy, error) {
        result := DllCall("webservices.dll\WsAbortServiceProxy", "ptr", serviceProxy, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory associated with a Service Proxy resource.
     * @remarks
     * 
     * For details of when it is allowed to call this function, see <a href="https://docs.microsoft.com/windows/desktop/wsw/service-proxy">Service Proxy</a> .
     * 
     * @param {Pointer<WS_SERVICE_PROXY>} serviceProxy A pointer to the <b>Service Proxy</b> to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateserviceproxy">WsCreateServiceProxy</a>. The referenced value may not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreeserviceproxy
     * @since windows6.1
     */
    static WsFreeServiceProxy(serviceProxy) {
        DllCall("webservices.dll\WsFreeServiceProxy", "ptr", serviceProxy)
    }

    /**
     * Resets service proxy.
     * @param {Pointer<WS_SERVICE_PROXY>} serviceProxy The service proxy.
     * @param {Pointer<WS_ERROR>} error Specifies where additional error information should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The serviceProxy was in an inappropriate state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsresetserviceproxy
     * @since windows6.1
     */
    static WsResetServiceProxy(serviceProxy, error) {
        result := DllCall("webservices.dll\WsResetServiceProxy", "ptr", serviceProxy, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Abandons a specified call on the specified service proxy.
     * @param {Pointer<WS_SERVICE_PROXY>} serviceProxy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing the service proxy on which to abandon the call.
     * @param {Integer} callId ID of the call to abandon.
     *                 (See the Remarks section.)
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current state of the service proxy is not valid for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>NULL</b> service proxy was passed to the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsabandoncall
     * @since windows6.1
     */
    static WsAbandonCall(serviceProxy, callId, error) {
        result := DllCall("webservices.dll\WsAbandonCall", "ptr", serviceProxy, "uint", callId, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used internally by the service proxy to format the specified arguments according to the specified metadata and send them in a message. The application should never call this function directly.
     * @param {Pointer<WS_SERVICE_PROXY>} serviceProxy Pointer to a WS_SERVICE_PROXY structure representing the service proxy.
     * @param {Pointer<WS_OPERATION_DESCRIPTION>} operation Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_operation_description">WS_OPERATION_DESCRIPTION</a> structure containing the metadata for the call.
     * @param {Pointer<Pointer<Void>>} arguments An array of pointers to the individual arguments for the service operation being represented by the <i>operation</i> parameter.
     * 
     * The number of elements must correspond to the number of parameters specified as part of WS_OPERATION_DESCRIPTION in
     *                    the operation parameter.
     * @param {Pointer<WS_HEAP>} heap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a> from which memory is allocated for the call.
     * @param {Pointer<WS_CALL_PROPERTY>} callProperties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_call_property">WS_CALL_PROPERTY</a> structures containing the call properties.
     * @param {Integer} callPropertyCount The number of properties in the call properties array.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_ABANDONED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was abandoned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_OPERATION_TIMED_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not complete within the time allotted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_S_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The asynchronous operation is still pending.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscall
     * @since windows6.1
     */
    static WsCall(serviceProxy, operation, arguments, heap, callProperties, callPropertyCount, asyncContext, error) {
        argumentsMarshal := arguments is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCall", "ptr", serviceProxy, "ptr", operation, argumentsMarshal, arguments, "ptr", heap, "ptr", callProperties, "uint", callPropertyCount, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Evaluates the components of an URL to determine its &quot;scheme&quot;.
     * @param {Pointer<WS_STRING>} url A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_string">WS_STRING</a>  representation of the URL to evaluate.
     * @param {Integer} flags Determines the URL scheme evaluation method.  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_writer_encoding_type">WS_URL_FLAGS</a>.
     * @param {Pointer<WS_HEAP>} heap A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> in which to allocate the returned URL reference.
     * @param {Pointer<Pointer<WS_URL>>} outUrl Reference to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_url">WS_URL</a> structure that encapsulates the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_url_scheme_type">WS_URL_SCHEME_TYPE</a> value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input URL was not in the correct format, or the scheme was not recognized.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsdecodeurl
     * @since windows6.1
     */
    static WsDecodeUrl(url, flags, heap, outUrl, error) {
        outUrlMarshal := outUrl is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsDecodeUrl", "ptr", url, "uint", flags, "ptr", heap, outUrlMarshal, outUrl, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Encodes the specified WS_URL into a URL string given its component parts. Values are escaped as necessary, combined, and stored in the specified WS_HEAP, and the result is returned as a WS_STRING.
     * @param {Pointer<WS_URL>} url A reference to the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_url">WS_URL</a> to encode.
     * @param {Integer} flags The value of this parameter determines the URL scheme evaluation method.  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_writer_encoding_type">WS_URL_FLAGS</a>.
     * @param {Pointer<WS_HEAP>} heap A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> in which to allocate URL.
     * @param {Pointer<WS_STRING>} outUrl A pointer to the resulting URL string.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL data being encoded was not valid according to the URL syntax.                    
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsencodeurl
     * @since windows6.1
     */
    static WsEncodeUrl(url, flags, heap, outUrl, error) {
        result := DllCall("webservices.dll\WsEncodeUrl", "ptr", url, "uint", flags, "ptr", heap, "ptr", outUrl, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Produces an absolute URL from a specified URL reference (absolute or relative URL) and a specified absolute base URL.
     * @param {Pointer<WS_STRING>} baseUrl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_STRING</a> structure containing an absolute URL in encoded format.
     * @param {Pointer<WS_STRING>} referenceUrl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_STRING</a> structure  containing an absolute or relative URL in encoded format.
     * @param {Integer} flags Controls the  format of the resulting URL.  For more information, see <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_writer_encoding_type">WS_URL_FLAGS</a>.
     * @param {Pointer<WS_HEAP>} heap Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> object from which the memory for the resulting URL is allocated.
     * @param {Pointer<WS_STRING>} resultUrl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_STRING</a> structure that receives the resulting URL.
     *                 This is an absolute URL in encoded format.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The base URL or reference URL was not in the correct format, or 
     *                     had a scheme that was not recognized.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscombineurl
     * @since windows6.1
     */
    static WsCombineUrl(baseUrl, referenceUrl, flags, heap, resultUrl, error) {
        result := DllCall("webservices.dll\WsCombineUrl", "ptr", baseUrl, "ptr", referenceUrl, "uint", flags, "ptr", heap, "ptr", resultUrl, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a WS_DATETIME object into a FILETIME object. A reference to the FILETIME object is returned by output parameter.
     * @param {Pointer<WS_DATETIME>} dateTime A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_datetime">WS_DATETIME</a> structure to convert.
     * @param {Pointer<FILETIME>} fileTime A pointer to the new FILETIME object that contains the converted time.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsdatetimetofiletime
     * @since windows6.1
     */
    static WsDateTimeToFileTime(dateTime, fileTime, error) {
        result := DllCall("webservices.dll\WsDateTimeToFileTime", "ptr", dateTime, "ptr", fileTime, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Takes a reference to a FILETIME object and converts it into a WS_DATETIME object. A reference to the WS_DATETIME object is returned by output parameter.
     * @param {Pointer<FILETIME>} fileTime A pointer to the FILETIME structure to convert.
     * @param {Pointer<WS_DATETIME>} dateTime A pointer to the new WS_DATETIME object that has the newly converted time.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfiletimetodatetime
     * @since windows6.1
     */
    static WsFileTimeToDateTime(fileTime, dateTime, error) {
        result := DllCall("webservices.dll\WsFileTimeToDateTime", "ptr", fileTime, "ptr", dateTime, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a metadata object that is used to collect and process metadata documents.
     * @param {Pointer<WS_METADATA_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY</a> structures containing optional properties for the metadata.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<Pointer<WS_METADATA>>} metadata On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> structure representing the new message.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemetadata">WsFreeMetadata</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreatemetadata
     * @since windows6.1
     */
    static WsCreateMetadata(properties, propertyCount, metadata, error) {
        metadataMarshal := metadata is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateMetadata", "ptr", properties, "uint", propertyCount, metadataMarshal, metadata, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads a Metadata element and adds it to the Metadata documents of the Metadata object.
     * @param {Pointer<WS_METADATA>} metadata A pointer to the <b>Metadata</b> object for storing the metadata read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> object.
     * @param {Pointer<WS_XML_READER>} reader A pointer to the <b>XML Reader</b> object used to read the metadata.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object and the reader must be positioned on the element containing the desired metadata.
     * @param {Pointer<WS_STRING>} url A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_string">WS_STRING</a> object referencing the retrieved metadata URL.  The URL is used to track the metadata documents for resolving URL-based links between documents.
     * 
     * <div class="alert"><b>Note</b>  The URL MUST be fully qualified.  The URL can have a fragment identifier.
     * </div>
     * <div> </div>
     * 
     * 
     * The following URL schemes are supported:
     *                 
     * 
     * <ul>
     * <li><b>WS_URL_HTTP_SCHEME_TYPE</b></li>
     * <li><b>WS_URL_HTTPS_SCHEME_TYPE</b></li>
     * <li><b>WS_URL_NETTCP_SCHEME_TYPE</b></li>
     * </ul>
     * Each URL specified using this function must have a  unique base URL. The base URL is computed by removing any fragment identifier from the URL specified.
     * 
     * For example if the following URLs were specified:   
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * http://example.com/document1#fragment
     * http://example.com/document2
     * </code></pre>
     * The two base URLs would be:
     *                 
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * http://example.com/document1
     * http://example.com/document2
     * </code></pre>
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input data was not in the expected format or did not have the expected value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is not allowed due to the current state of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_QUOTA_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A quota was exceeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The element was not consumed.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsreadmetadata
     * @since windows6.1
     */
    static WsReadMetadata(metadata, reader, url, error) {
        result := DllCall("webservices.dll\WsReadMetadata", "ptr", metadata, "ptr", reader, "ptr", url, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases the memory resource associated with a metadata object.
     * @remarks
     * 
     * Any <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> objects that
     *                 were retrieved using the metadata object will also be freed.
     * 
     * @param {Pointer<WS_METADATA>} metadata A pointer to the metadata object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> object returned
     *                     by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a> and the referenced value may not be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsfreemetadata
     * @since windows6.1
     */
    static WsFreeMetadata(metadata) {
        DllCall("webservices.dll\WsFreeMetadata", "ptr", metadata)
    }

    /**
     * Resets a metadata object state to WS_METADATA_STATE_CREATED. In this state the Metadata object can be reused. WS_POLICY objects that were retrieved using the Metadata object will be released.
     * @param {Pointer<WS_METADATA>} metadata A pointer to the <b>Metadata</b> object to reset.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a>.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The metadata was in an inappropriate state.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsresetmetadata
     * @since windows6.1
     */
    static WsResetMetadata(metadata, error) {
        result := DllCall("webservices.dll\WsResetMetadata", "ptr", metadata, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a specified WS_METADATA object property. The property to retrieve is identified by a WS_METADATA_PROPERTY_ID input parameter.
     * @param {Pointer<WS_METADATA>} metadata A pointer to a <b>Metadata</b> object containing the desired property.  This parameter must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> object.
     * @param {Integer} id Identifier value of the property to retrieve.
     * @param {Pointer} value A reference to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property Id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetmetadataproperty
     * @since windows6.1
     */
    static WsGetMetadataProperty(metadata, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetMetadataProperty", "ptr", metadata, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function returns the address of a missing document that is referenced by the metadata object.
     * @param {Pointer<WS_METADATA>} metadata This parameter is a pointer to a <b>Metadata</b> object that should have the document.
     * @param {Pointer<Pointer<WS_ENDPOINT_ADDRESS>>} address On success this parameter is populated with either a pointer to the address of a missing metadata document, or <b>NULL</b> if there are no missing metadata documents.
     *                 
     * The returned address URL is fully qualified.
     *                 
     * 
     * <div class="alert"><b>Note</b>  The data returned by this function is valid until the metadata object is freed or reset.  The data should not be modified.</div>
     * <div> </div>
     * @param {Pointer<WS_ERROR>} error This parameter is a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> pointer to where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetmissingmetadatadocumentaddress
     * @since windows6.1
     */
    static WsGetMissingMetadataDocumentAddress(metadata, address, error) {
        addressMarshal := address is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsGetMissingMetadataDocumentAddress", "ptr", metadata, addressMarshal, address, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the &quot;Endpoints&quot; defined within the metadata object documents.
     * @param {Pointer<WS_METADATA>} metadata A pointer to a <b>Metadata</b> object containing the desired Endpoints.  This parameter must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> object.
     * @param {Pointer<WS_METADATA_ENDPOINTS>} endpoints On success this pointer parameter 
     *                     is populated with information about the endpoints that were 
     *                     defined in the metadata object.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetmetadataendpoints
     * @since windows6.1
     */
    static WsGetMetadataEndpoints(metadata, endpoints, error) {
        result := DllCall("webservices.dll\WsGetMetadataEndpoints", "ptr", metadata, "ptr", endpoints, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Verifies that a Policy Alternative is compatible with the specified Policy Constraint.
     * @param {Pointer<WS_POLICY>} policy A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> object  containing the alternative.
     *                 
     * <div class="alert"><b>Note</b>  Each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_endpoint">WS_METADATA_ENDPOINT</a> that is returned from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetmetadataendpoints">WsGetMetadataEndpoints</a> contains a policy object.
     * </div>
     * <div> </div>
     * @param {Integer} alternativeIndex Specifies the zero-based index that identifies the alternative to use within the policy object. The number of alternatives present in the policy object can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetpolicyalternativecount">WsGetPolicyAlternativeCount</a>.
     * @param {Pointer<WS_POLICY_CONSTRAINTS>} policyConstraints A pointer to the constraints that specify policies to match along with the fields to populate if the function returns NOERROR.
     *                 
     * 
     * <div class="alert"><b>Note</b>  If a property constraint is not specified the default constraint value for that particular property is used.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_policy_constraints">WS_POLICY_CONSTRAINTS</a> for more information.</div>
     * <div> </div>
     * @param {BOOL} matchRequired Indicates whether a match is required or not.  
     * 
     * <div class="alert"><b>Note</b>  If the value is <b>FALSE</b> a match is not required, and in conjunction with a non-matching policy alternative, the function returns S_FALSE.
     * 
     * If the value of this parameter is <b>TRUE</b> a match is required,  and if the policy does not match, the function returns an error.
     * </div>
     * <div> </div>
     * @param {Pointer<WS_HEAP>} heap A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">Heap</a> object used to store any data requiring allocation beyond the specified constraint. 
     * <div class="alert"><b>Note</b>  For example pointer types within the constraint "out" fields is allocated using this Heap.
     * </div>
     * <div> </div>
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WS_E_INVALID_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The policy alternative does not meet the specified constraints and matchRequired was set to <b>TRUE</b>.
     *                 
     * 
     * The policy or other metadata was in an invalid format.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The policy alternative does not meet the specified constraints and matchRequired was set to <b>FALSE</b>.
     *                 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The policy alternative meets the specific constraints.  The <b>out</b> fields of the constraints structures have been filled with values from the policy.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsmatchpolicyalternative
     * @since windows6.1
     */
    static WsMatchPolicyAlternative(policy, alternativeIndex, policyConstraints, matchRequired, heap, error) {
        result := DllCall("webservices.dll\WsMatchPolicyAlternative", "ptr", policy, "uint", alternativeIndex, "ptr", policyConstraints, "int", matchRequired, "ptr", heap, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a property of a policy object.
     * @param {Pointer<WS_POLICY>} policy A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> object from which to obtain the property.
     * @param {Integer} id An identifier of the policy property to retrieve.
     * @param {Pointer} value A pointer to the address to store the retrieved property value. The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetpolicyproperty
     * @since windows6.1
     */
    static WsGetPolicyProperty(policy, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetPolicyProperty", "ptr", policy, "int", id, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the number of alternatives available in the policy object. The alternative count can be used to loop through each alternative using WsMatchPolicyAlternative.
     * @param {Pointer<WS_POLICY>} policy A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> object from which to count alternatives.
     * @param {Pointer<Integer>} count A pointer to the number value of alternatives.  This may be 0.
     * @param {Pointer<WS_ERROR>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property id was not supported for this object or the specified buffer was not large enough for the value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ran out of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> Other Errors </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function may return other errors not listed above.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wsgetpolicyalternativecount
     * @since windows6.1
     */
    static WsGetPolicyAlternativeCount(policy, count, error) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("webservices.dll\WsGetPolicyAlternativeCount", "ptr", policy, countMarshal, count, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Helper routine for creating a service proxy from policy templates.
     * @param {Integer} channelType A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE</a> enumeration value representing the channel type for the service proxy.
     * @param {Pointer<WS_PROXY_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_proxy_property">WS_PROXY_PROPERTY</a> structures containing optional properties for the service proxy.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Integer} templateType A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_binding_template_type">WS_BINDING_TEMPLATE_TYPE</a> enumeration value representing the type of templates  used to create the service proxy.
     * 
     * Please see the <b>Remarks</b> for more information.
     * @param {Pointer} templateValue The optional template structure to be created and filled in by an application. This template structure must be consistent with the input template type (in the <i>templateType</i>). When <i>templateValue</i> parameter is <b>NULL</b>, it is equivalent to the corresponding template structure initialized to zero.
     * 
     * Please see the <b>Remarks</b> for more information.
     * @param {Integer} templateSize The size, in bytes, of the template structure (in the  <i>templateValue</i> parameter).
     * @param {Pointer<Void>} templateDescription The description of <i>templateValue</i>. This must match <i>templateType</i>.
     * 
     * Please see the <b>Remarks</b> for more information.
     * @param {Integer} templateDescriptionSize The size of the template description.
     * @param {Pointer<Pointer<WS_SERVICE_PROXY>>} serviceProxy On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing the new service proxy.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeserviceproxy">WsFreeServiceProxy</a>.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreateserviceproxyfromtemplate
     * @since windows6.1
     */
    static WsCreateServiceProxyFromTemplate(channelType, properties, propertyCount, templateType, templateValue, templateSize, templateDescription, templateDescriptionSize, serviceProxy, error) {
        templateDescriptionMarshal := templateDescription is VarRef ? "ptr" : "ptr"
        serviceProxyMarshal := serviceProxy is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateServiceProxyFromTemplate", "int", channelType, "ptr", properties, "uint", propertyCount, "int", templateType, "ptr", templateValue, "uint", templateSize, templateDescriptionMarshal, templateDescription, "uint", templateDescriptionSize, serviceProxyMarshal, serviceProxy, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Helper routine for creating a service endpoint (WS_SERVICE_ENDPOINT) from policy templates.
     * @param {Integer} channelType A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE</a> enumeration value representing the type of channel hosted by the endpoint.
     * @param {Pointer<WS_SERVICE_ENDPOINT_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint_property">WS_SERVICE_ENDPOINT_PROPERTY</a>  structures containing  properties for the service endpoint. (Application should fill in channel properties in the template structure.)
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<WS_STRING>} addressUrl The URL address on which the endpoint is  to listen.
     * @param {Pointer<WS_SERVICE_CONTRACT>} contract A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_contract">WS_SERVICE_CONTRACT</a> structure representing the contract of the endpoint.
     * @param {Pointer<WS_SERVICE_SECURITY_CALLBACK>} authorizationCallback A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_security_callback">WS_SERVICE_SECURITY_CALLBACK</a> authorization callback for the service endpoint.
     * @param {Pointer<WS_HEAP>} heap The <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a> from which memory for the  service endpoint is allocated on successful return.
     * @param {Integer} templateType A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_binding_template_type">WS_BINDING_TEMPLATE_TYPE</a> enumeration value representing the type of templates being used to create the service endpoint.
     * @param {Pointer} templateValue Optional template structure to be created and filled in by application.
     *           The template must be consistent with the input template type (passed in the <i>templateType</i>  parameter). When the <i>templateValue</i> parameter is <b>NULL</b>,
     *           it is equivalent to the corresponding template structure initialized to zero.
     * @param {Integer} templateSize The size, in bytes, of the input templateValue structure.
     * @param {Pointer<Void>} templateDescription The description of template structure (passed in the <i>templateValue</i> parameter). Needs to match templateType.
     * @param {Integer} templateDescriptionSize The size of the template description.
     * @param {Pointer<Pointer<WS_SERVICE_ENDPOINT>>} serviceEndpoint On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a> structure representing the new service endpoint.
     * @param {Pointer<WS_ERROR>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {HRESULT} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//webservices/nf-webservices-wscreateserviceendpointfromtemplate
     * @since windows6.1
     */
    static WsCreateServiceEndpointFromTemplate(channelType, properties, propertyCount, addressUrl, contract, authorizationCallback, heap, templateType, templateValue, templateSize, templateDescription, templateDescriptionSize, serviceEndpoint, error) {
        templateDescriptionMarshal := templateDescription is VarRef ? "ptr" : "ptr"
        serviceEndpointMarshal := serviceEndpoint is VarRef ? "ptr*" : "ptr"

        result := DllCall("webservices.dll\WsCreateServiceEndpointFromTemplate", "int", channelType, "ptr", properties, "uint", propertyCount, "ptr", addressUrl, "ptr", contract, "ptr", authorizationCallback, "ptr", heap, "int", templateType, "ptr", templateValue, "uint", templateSize, templateDescriptionMarshal, templateDescription, "uint", templateDescriptionSize, serviceEndpointMarshal, serviceEndpoint, "ptr", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetapiversionnumber
     */
    static WebAuthNGetApiVersionNumber() {
        result := DllCall("webauthn.dll\WebAuthNGetApiVersionNumber", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbIsUserVerifyingPlatformAuthenticatorAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnisuserverifyingplatformauthenticatoravailable
     */
    static WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable(pbIsUserVerifyingPlatformAuthenticatorAvailable) {
        result := DllCall("webauthn.dll\WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable", "ptr", pbIsUserVerifyingPlatformAuthenticatorAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Pointer<WEBAUTHN_RP_ENTITY_INFORMATION>} pRpInformation 
     * @param {Pointer<WEBAUTHN_USER_ENTITY_INFORMATION>} pUserInformation 
     * @param {Pointer<WEBAUTHN_COSE_CREDENTIAL_PARAMETERS>} pPubKeyCredParams 
     * @param {Pointer<WEBAUTHN_CLIENT_DATA>} pWebAuthNClientData 
     * @param {Pointer<WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS>} pWebAuthNMakeCredentialOptions 
     * @param {Pointer<Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>>} ppWebAuthNCredentialAttestation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnauthenticatormakecredential
     */
    static WebAuthNAuthenticatorMakeCredential(hWnd, pRpInformation, pUserInformation, pPubKeyCredParams, pWebAuthNClientData, pWebAuthNMakeCredentialOptions, ppWebAuthNCredentialAttestation) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        ppWebAuthNCredentialAttestationMarshal := ppWebAuthNCredentialAttestation is VarRef ? "ptr*" : "ptr"

        result := DllCall("webauthn.dll\WebAuthNAuthenticatorMakeCredential", "ptr", hWnd, "ptr", pRpInformation, "ptr", pUserInformation, "ptr", pPubKeyCredParams, "ptr", pWebAuthNClientData, "ptr", pWebAuthNMakeCredentialOptions, ppWebAuthNCredentialAttestationMarshal, ppWebAuthNCredentialAttestation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {PWSTR} pwszRpId 
     * @param {Pointer<WEBAUTHN_CLIENT_DATA>} pWebAuthNClientData 
     * @param {Pointer<WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS>} pWebAuthNGetAssertionOptions 
     * @param {Pointer<Pointer<WEBAUTHN_ASSERTION>>} ppWebAuthNAssertion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnauthenticatorgetassertion
     */
    static WebAuthNAuthenticatorGetAssertion(hWnd, pwszRpId, pWebAuthNClientData, pWebAuthNGetAssertionOptions, ppWebAuthNAssertion) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        pwszRpId := pwszRpId is String ? StrPtr(pwszRpId) : pwszRpId

        ppWebAuthNAssertionMarshal := ppWebAuthNAssertion is VarRef ? "ptr*" : "ptr"

        result := DllCall("webauthn.dll\WebAuthNAuthenticatorGetAssertion", "ptr", hWnd, "ptr", pwszRpId, "ptr", pWebAuthNClientData, "ptr", pWebAuthNGetAssertionOptions, ppWebAuthNAssertionMarshal, ppWebAuthNAssertion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>} pWebAuthNCredentialAttestation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreecredentialattestation
     */
    static WebAuthNFreeCredentialAttestation(pWebAuthNCredentialAttestation) {
        DllCall("webauthn.dll\WebAuthNFreeCredentialAttestation", "ptr", pWebAuthNCredentialAttestation)
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_ASSERTION>} pWebAuthNAssertion 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreeassertion
     */
    static WebAuthNFreeAssertion(pWebAuthNAssertion) {
        DllCall("webauthn.dll\WebAuthNFreeAssertion", "ptr", pWebAuthNAssertion)
    }

    /**
     * 
     * @param {Pointer<Guid>} pCancellationId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetcancellationid
     */
    static WebAuthNGetCancellationId(pCancellationId) {
        result := DllCall("webauthn.dll\WebAuthNGetCancellationId", "ptr", pCancellationId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCancellationId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthncancelcurrentoperation
     */
    static WebAuthNCancelCurrentOperation(pCancellationId) {
        result := DllCall("webauthn.dll\WebAuthNCancelCurrentOperation", "ptr", pCancellationId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_GET_CREDENTIALS_OPTIONS>} pGetCredentialsOptions 
     * @param {Pointer<Pointer<WEBAUTHN_CREDENTIAL_DETAILS_LIST>>} ppCredentialDetailsList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetplatformcredentiallist
     */
    static WebAuthNGetPlatformCredentialList(pGetCredentialsOptions, ppCredentialDetailsList) {
        ppCredentialDetailsListMarshal := ppCredentialDetailsList is VarRef ? "ptr*" : "ptr"

        result := DllCall("webauthn.dll\WebAuthNGetPlatformCredentialList", "ptr", pGetCredentialsOptions, ppCredentialDetailsListMarshal, ppCredentialDetailsList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WEBAUTHN_CREDENTIAL_DETAILS_LIST>} pCredentialDetailsList 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreeplatformcredentiallist
     */
    static WebAuthNFreePlatformCredentialList(pCredentialDetailsList) {
        DllCall("webauthn.dll\WebAuthNFreePlatformCredentialList", "ptr", pCredentialDetailsList)
    }

    /**
     * 
     * @param {Integer} cbCredentialId 
     * @param {Pointer} pbCredentialId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthndeleteplatformcredential
     */
    static WebAuthNDeletePlatformCredential(cbCredentialId, pbCredentialId) {
        result := DllCall("webauthn.dll\WebAuthNDeletePlatformCredential", "uint", cbCredentialId, "ptr", pbCredentialId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngeterrorname
     */
    static WebAuthNGetErrorName(hr) {
        result := DllCall("webauthn.dll\WebAuthNGetErrorName", "int", hr, "char*")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetw3cexceptiondomerror
     */
    static WebAuthNGetW3CExceptionDOMError(hr) {
        result := DllCall("webauthn.dll\WebAuthNGetW3CExceptionDOMError", "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
