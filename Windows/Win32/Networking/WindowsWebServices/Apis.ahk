#Requires AutoHotkey v2.0.0 64-bit

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
     * @remarks
     * Calls to this function cannot be nested.  Consequently a call to <b>WsStartReaderCanonicalization</b> must be followed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsendreadercanonicalization">WsEndReaderCanonicalization</a> before the next <b>WsStartReaderCanonicalization</b> call can be made.
     *       
     * 
     * If a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_canonicalization_algorithm">WS_XML_CANONICALIZATION_ALGORITHM</a> is not specified <b>WS_EXCLUSIVE_XML_CANONICALIZATION_ALGORITHM</b> is used.
     *       
     * 
     * The <b>WS_INCLUSIVE_XML_CANONICALIZATION_ALGORITHM</b> and 
     *         <b>WS_INCLUSIVE_WITH_COMMENTS_XML_CANONICALIZATION_ALGORITHM</b> algorithms can only be used with
     *         entire XML documents.  The Reader must be positioned at <b>WS_XML_NODE_TYPE_BOF</b> when
     *         <b>WsStartReaderCanonicalization</b> is called with these algorithms.
     * @param {Pointer<IntPtr>} reader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object on which canonicalization is started.  The pointer must reference a valid <b>XML Reader</b> object.
     * @param {Pointer<WS_WRITE_CALLBACK>} writeCallback A  callback function invoked to write the canonical bytes as they are generated.
     *           <div class="alert"><b>Note</b>  This callback is invoked synchronously.</div>
     * <div> </div>
     * @param {Pointer<Void>} writeCallbackState A pointer to a caller-defined state that is passed when invoking the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">WS_WRITE_CALLBACK</a>.
     * @param {Pointer<WS_XML_CANONICALIZATION_PROPERTY>} properties An "array" reference of optional properties controlling how canonicalization is performed.  <div class="alert"><b>Note</b>  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_canonicalization_property">WS_XML_CANONICALIZATION_PROPERTY</a> for details.</div>
     * <div> </div>
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsstartreadercanonicalization
     * @since windows6.1
     */
    static WsStartReaderCanonicalization(reader, writeCallback, writeCallbackState, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsStartReaderCanonicalization", "ptr*", reader, "ptr", writeCallback, "ptr", writeCallbackState, "ptr", properties, "uint", propertyCount, "ptr*", error, "int")
        return result
    }

    /**
     * This function stops XML canonicalization started by a preceding WsStartReaderCanonicalization function call. Any remaining canonical bytes buffered by the reader will be written to the callback function.
     * @remarks
     * <b>WsEndReaderCanonicalization</b> must be called at the same depth at which <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsstartreadercanonicalization">WsStartReaderCanonicalization</a> was called.
     *       
     * 
     * It is not necessary to call <b>WsEndReaderCanonicalization</b> in order to call <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreereader">WsFreeReader</a>.
     * @param {Pointer<IntPtr>} reader A pointer to the XML reader on which canonicalization should be stopped.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsendreadercanonicalization
     * @since windows6.1
     */
    static WsEndReaderCanonicalization(reader, error) {
        result := DllCall("webservices.dll\WsEndReaderCanonicalization", "ptr*", reader, "ptr*", error, "int")
        return result
    }

    /**
     * Starts canonicalization on the specified XML writer.
     * @remarks
     * The usage pattern for canonicalization is to:
     * 
     * <ul>
     * <li> call <b>WsStartWriterCanonicalization</b>,
     * </li>
     * <li> write the xml to be canonicalized,
     * </li>
     * <li> call <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsendwritercanonicalization">WsEndWriterCanonicalization</a>.
     * </li>
     * </ul>During this process, the canonical bytes will be written to the specified writeCallback.  Every node written by the writer will be canonicalized. Thus, canonicalization and generation can be done in one pass over regardless of what APIs are used to write the XML.
     *       
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsendwritercanonicalization">WsEndWriterCanonicalization</a> must be called in order to ensure that all canonicalized bytes are written to the specified callback.
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsendwritercanonicalization">WsEndWriterCanonicalization</a> must be called at the same depth at which <b>WsStartWriterCanonicalization</b> was called.  Other writer APIs will return an error if it would move to a depth lower than where <b>WsStartWriterCanonicalization</b> was called.
     *       
     * It is an invalid operation to call <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmovewriter">WsMoveWriter</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetwriterposition">WsSetWriterPosition</a> on a writer between a pair of matching <b>WsStartWriterCanonicalization</b> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsendwritercanonicalization">WsEndWriterCanonicalization</a> calls.
     *       
     * 
     * Calls to this API cannot be nested.  So, a call to <b>WsStartWriterCanonicalization</b> must be followed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsendwritercanonicalization">WsEndWriterCanonicalization</a> before the next <b>WsStartWriterCanonicalization</b> call.
     *       
     * 
     * If a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_canonicalization_algorithm">WS_XML_CANONICALIZATION_ALGORITHM</a> is not specified, then <b>WS_EXCLUSIVE_XML_CANONICALIZATION_ALGORITHM</b> is used.
     *       
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_canonicalization_algorithm">WS_INCLUSIVE_XML_CANONICALIZATION_ALGORITHM</a> and <b>WS_INCLUSIVE_WITH_COMMENTS_XML_CANONICALIZATION_ALGORITHM</b> algorithms can only be used with entire xml documents.  The writer must positioned at <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_node_type">WS_XML_NODE_TYPE_BOF</a> when <b>WsStartWriterCanonicalization</b> is called with these algorithms.
     * @param {Pointer<IntPtr>} writer The XML writer on which canonicalization should be started.
     * @param {Pointer<WS_WRITE_CALLBACK>} writeCallback The callback that to be invoked to write the canonical bytes as they are generated. This callback will always be invoked synchronously.
     * @param {Pointer<Void>} writeCallbackState Caller-defined state that should be passed when invoking the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">WS_WRITE_CALLBACK</a>.
     * @param {Pointer<WS_XML_CANONICALIZATION_PROPERTY>} properties An array of optional properties controlling how canonicalization is to be performed.  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_canonicalization_property">WS_XML_CANONICALIZATION_PROPERTY</a>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsstartwritercanonicalization
     * @since windows6.1
     */
    static WsStartWriterCanonicalization(writer, writeCallback, writeCallbackState, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsStartWriterCanonicalization", "ptr*", writer, "ptr", writeCallback, "ptr", writeCallbackState, "ptr", properties, "uint", propertyCount, "ptr*", error, "int")
        return result
    }

    /**
     * This function stops XML canonicalization started by the preceding WsStartWriterCanonicalization call. Remaining canonical bytes buffered by the writer are written to the callback function.
     * @remarks
     * <b>WsEndWriterCanonicalization</b> must be called at the same depth at
     *         which <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsstartwritercanonicalization">WsStartWriterCanonicalization</a> was called.
     *       
     * 
     * It is not necessary to call <b>WsEndWriterCanonicalization</b> in order to call <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreewriter">WsFreeWriter</a>.
     * @param {Pointer<IntPtr>} writer A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object on which canonicalization should be stopped.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsendwritercanonicalization
     * @since windows6.1
     */
    static WsEndWriterCanonicalization(writer, error) {
        result := DllCall("webservices.dll\WsEndWriterCanonicalization", "ptr*", writer, "ptr*", error, "int")
        return result
    }

    /**
     * Creates an XML Buffer which can be used to process XML data .
     * @param {Pointer<IntPtr>} heap Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a> from which to allocate memory for the returned XML buffer.
     * @param {Pointer<WS_XML_BUFFER_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_buffer_property">WS_XML_BUFFER_PROPERTY</a> structures containing optional properties for the XML buffer.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<IntPtr>} buffer On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> structure representing the created XML buffer. The memory for this buffer is released when its heap is reset or released.
     *         
     * 
     * The XML buffer is initially  empty.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatexmlbuffer
     * @since windows6.1
     */
    static WsCreateXmlBuffer(heap, properties, propertyCount, buffer, error) {
        result := DllCall("webservices.dll\WsCreateXmlBuffer", "ptr*", heap, "ptr", properties, "uint", propertyCount, "ptr", buffer, "ptr*", error, "int")
        return result
    }

    /**
     * Removes the node at the specified position from the xml buffer. If positioned on an element it will remove the element including all of its children and its corresponding end element, otherwise it will remove a single node.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition The position of the node that should be removed.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsremovenode
     * @since windows6.1
     */
    static WsRemoveNode(nodePosition, error) {
        result := DllCall("webservices.dll\WsRemoveNode", "ptr", nodePosition, "ptr*", error, "int")
        return result
    }

    /**
     * Creates an XML reader with the specified properties.
     * @remarks
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinput">WsSetInput</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinputtobuffer">WsSetInputToBuffer</a> functions to choose the encoding for the XML reader and to indicate the source of the input.
     *       
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_read_callback">WS_READ_CALLBACK</a> is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_input">WS_XML_READER_INPUT</a> structure passed to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinput">WsSetInput</a> function, the XML reader reads
     *         additional data only when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfillreader">WsFillReader</a> is called.  This allows the caller to determine
     *         at what granularity to read data and whether to read that data asynchronously.
     *       
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> structure can be reused by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinput">WsSetInput</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinputtobuffer">WsSetInputToBuffer</a> again.
     *       
     * 
     * If any API operation that operates on an <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> fails the XML reader is left in a faulted state
     *         and further function calls return <b>WS_E_OBJECT_FAULTED</b>.  (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.) The only possible function calls for the XML reader
     *         if this occurs are <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinput">WsSetInput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinputtobuffer">WsSetInputToBuffer</a> for returning the XML reader to a usable state,
     *         or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreereader">WsFreeReader</a> for releasing the XML reader object.
     * @param {Pointer<WS_XML_READER_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_property">WS_XML_READER_PROPERTY</a> structures containing optional properties for the XML reader.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     *                 
     * 
     * For the properties that tiy can use to configure the XML reader, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_reader_property_id">WS_XML_READER_PROPERTY_ID</a> enumeration.
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<IntPtr>} reader On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> structure representing the new XML reader.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreereader">WsFreeReader</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatereader
     * @since windows6.1
     */
    static WsCreateReader(properties, propertyCount, reader, error) {
        result := DllCall("webservices.dll\WsCreateReader", "ptr", properties, "uint", propertyCount, "ptr", reader, "ptr*", error, "int")
        return result
    }

    /**
     * Sets the encoding and input sources for an XML Reader.
     * @remarks
     * When <b>WsSetInput</b> is used on the XML Reader, the reader will function in a forward only manner and
     *         the functions <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetreaderposition">WsGetReaderPosition</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetreaderposition">WsSetReaderPosition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmovereader">WsMoveReader</a> cannot be used.
     * @param {Pointer<IntPtr>} reader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object for which the input will be set.
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
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetinput
     * @since windows6.1
     */
    static WsSetInput(reader, encoding, input, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsSetInput", "ptr*", reader, "ptr", encoding, "ptr", input, "ptr", properties, "uint", propertyCount, "ptr*", error, "int")
        return result
    }

    /**
     * Sets Reader input to a specified XML buffer. Reader properties specified to WsSetInputToBuffer override properties set by WsCreateReader.
     * @remarks
     * When an XML Reader has an XML Buffer as an input source, the Reader can be used in a random access fashion, and
     *         the functions <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetreaderposition">WsGetReaderPosition</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetreaderposition">WsSetReaderPosition</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmovereader">WsMoveReader</a> are available for use.
     * @param {Pointer<IntPtr>} reader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object for which the input will be set.
     * @param {Pointer<IntPtr>} buffer A pointer to the XML buffer to read.
     * @param {Pointer<WS_XML_READER_PROPERTY>} properties A pointer that references an array of optional Reader properties.  <div class="alert"><b>Note</b>  For more information see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_property">WS_XML_READER_PROPERTY</a>.</div>
     * <div> </div>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetinputtobuffer
     * @since windows6.1
     */
    static WsSetInputToBuffer(reader, buffer, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsSetInputToBuffer", "ptr*", reader, "ptr*", buffer, "ptr", properties, "uint", propertyCount, "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory resource associated with an XML_Reader object.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatereader">WsCreateReader</a>    and the referenced <b>XML Reader</b> value may not be <b>NULL</b>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreereader
     * @since windows6.1
     */
    static WsFreeReader(reader) {
        result := DllCall("webservices.dll\WsFreeReader", "ptr*", reader)
        return result
    }

    /**
     * This function returns a property of the specified XML Reader.
     * @param {Pointer<IntPtr>} reader A pointer to a WS_XML_READER object containing the desired property value.
     * @param {Integer} id An enumerator value identifier of the Reader property.
     * @param {Pointer} value A pointer to the address for returning the retrieved value.
     *             The pointer must have an alignment compatible with the type
     *             of the property.
     * @param {Integer} valueSize A byte count of the buffer that the caller has allocated for the retrieved value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetreaderproperty
     * @since windows6.1
     */
    static WsGetReaderProperty(reader, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetReaderProperty", "ptr*", reader, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * The function returns the XML node at the current position of the XML reader.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_node_type">nodeType</a> field of the node <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node">node</a> should be inspected
     *         to determine the kind of node returned.  The <b>node</b> may then be cast to the appropriate
     *         data structure to get the data.
     *       
     * 
     * 
     * ``` syntax
     * WS_XML_NODE* node;
     * if (SUCCEEDED(WsGetReaderNode(reader, &amp;node, error)))
     * {
     *     if (node-&gt;nodeType == WS_XML_NODE_TYPE_ELEMENT)
     *     {
     *         WS_XML_ELEMENT_NODE* elementNode = (WS_XML_ELEMENT_NODE*) node;
     *         // Refer to elementNode-&gt;localName, elementNode-&gt;ns
     *     }
     * }
     * ```
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_node_type">nodeTypes</a> with extended structures include:
     *         <ul>
     * <li><b>WS_XML_NODE_TYPE_ELEMENT</b> =&gt; <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_element_node">WS_XML_ELEMENT_NODE</a>
     * </li>
     * <li><b>WS_XML_NODE_TYPE_TEXT</b>    =&gt; <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text_node">WS_XML_TEXT_NODE</a>
     * </li>
     * <li><b>WS_XML_NODE_TYPE_COMMENT</b> =&gt; <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_comment_node">WS_XML_COMMENT_NODE</a>
     * </li>
     * </ul>
     * 
     * 
     * The node returned should not be modified and is only valid until the reader advances.
     *       For the attributes in a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_element_node">WS_XML_ELEMENT_NODE</a> callers should not expect the
     *         attributes to appear in any particular order.
     * @param {Pointer<IntPtr>} xmlReader A pointer to the reader for which the current node will be obtained.  This must be valid WS_XML_READER object.
     * @param {Pointer<WS_XML_NODE>} node A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node">WS_XML_NODE</a> structure where the current node is returned.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetreadernode
     * @since windows6.1
     */
    static WsGetReaderNode(xmlReader, node, error) {
        result := DllCall("webservices.dll\WsGetReaderNode", "ptr*", xmlReader, "ptr", node, "ptr*", error, "int")
        return result
    }

    /**
     * Ensures that the reader has buffered the minimum byte count of XML data for use by subsequent reader functions.
     * @remarks
     * The number of bytes required to read a particular segment of XML data depends upon the encoding
     *         and its formatting.
     *       
     * 
     * This function is a "no-op" when used with a reader using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_buffer_input">WS_XML_READER_BUFFER_INPUT</a>.
     *       
     * 
     * By specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> the data is read asynchronously.
     * @param {Pointer<IntPtr>} reader A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> structure used for obtaining the data.
     * @param {Integer} minSize Specifies the minimum number of bytes that the reader should have obtained.  If the current byte count buffered is equal to or greater than the value of <i>minSize</i> the function will do nothing and will return immediately.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure with information about invoking the function asynchronously.  A <b>NULL</b> 
     *                  value indicates a request for synchronous operation.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfillreader
     * @since windows6.1
     */
    static WsFillReader(reader, minSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsFillReader", "ptr*", reader, "uint", minSize, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Calling this function advances the reader past a start element skipping any whitespace.
     * @remarks
     * This function can fail for any of the reasons listed in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a>.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> object used to read the Start element.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadstartelement
     * @since windows6.1
     */
    static WsReadStartElement(reader, error) {
        result := DllCall("webservices.dll\WsReadStartElement", "ptr*", reader, "ptr*", error, "int")
        return result
    }

    /**
     * Advances the reader to the next start element skipping whitespace and comments if necessary. Optionally, it may also verify the localName and namespace of the element.
     * @remarks
     * Consider the following XML:
     *       
     * 
     * 
     * ``` syntax
     * &lt;!-- A purchase order --&gt;
     *         &lt;PurchaseOrder xmlns='http://tempuri.org'&gt;
     *             &lt;Item&gt;
     *                 Pencil
     *             &lt;/Item&gt;
     *         &lt;/PurchaseOrder&gt;
     * 
     * ```
     * 
     * The following examples illustrates the behaviors of <b>WsReadToStartElement</b> when the reader is
     *         positioned in various places in the document.
     *       
     * 
     * 
     * ``` syntax
     * WS_XML_STRING purchaseOrder = WS_XML_STRING_VALUE("PurchaseOrder");
     * WS_XML_STRING item = WS_XML_STRING_VALUE("Item");
     * WS_XML_STRING ns = WS_XML_STRING("http://tempuri.org");
     * WS_ERROR* error = NULL;
     * 
     * // Example 1: Reader on comment, element has specified name and namespace, found argument is not provided
     * HRESULT hr = WsReadToStartElement(reader, &amp;purchaseOrder, &amp;ns, NULL, error);
     * // hr = NOERROR, the reader is positioned on &lt;PurchaseOrder&gt;
     * 
     * // Example 2: Reader on comment, element has specified name and namespace, found argument is provided
     * BOOL found;
     * HRESULT hr = WsReadToStartElement(reader, &amp;purchaseOrder, &amp;ns, found, error);
     * // hr = NOERROR, found = TRUE, the reader is positioned on &lt;PurchaseOrder&gt;
     * 
     * // Example 3: Reader on comment, element does not have specified name and namespace, found argument is not provided
     * HRESULT hr = WsReadToStartElement(reader, &amp;item, &amp;ns, NULL, error);
     * // hr = WS_E_INVALID_FORMAT, the reader is faulted
     * 
     * // Example 4: Reader on comment, element does not have specified name and namespace, found argument is provided
     * BOOL found;
     * HRESULT hr = WsReadToStartElement(reader, &amp;item, &amp;ns, &amp;found, error);
     * // hr = NOERROR, found = FALSE, the reader is positioned on &lt;PurchaseOrder&gt;
     * 
     * // Example 5: Reader on comment, name and namespace not specified, found argument is provided
     * BOOL found;
     * HRESULT hr = WsReadToStartElement(reader, NULL, NULL, &amp;found, error);
     * // hr = NOERROR, found = TRUE, the reader is positioned on &lt;PurchaseOrder&gt;
     * 
     * // Example 6: Reader on &lt;/Item&gt;, name and namespace not specified, found argument is not provided
     * HRESULT hr = WsReadToStartElement(reader, NULL, NULL, NULL, error);
     * // hr = WS_E_INVALID_FORMAT, the reader is faulted
     * 
     * // Example 7: Reader on &lt;/Item&gt;, name and namespace not specified, found argument is provided
     * BOOL found;
     * HRESULT hr = WsReadToStartElement(reader, NULL, NULL, &amp;found, error);
     * // hr = NOERROR, found = FALSE, the reader is positioned on &lt;/Item&gt;
     * 
     * ```
     * 
     * If <b>WsReadToStartElement</b> indicates an element has been found, then <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadstartelement">WsReadStartElement</a> 
     *         or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a> may be used to move the reader past the start element into the content of the element.
     *       
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsskipnode">WsSkipNode</a> may be used to skip the element and all its children leaving the reader positioned on
     *         the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node">WS_XML_NODE</a> following the corresponding end element.
     *       
     * 
     * This function can fail for any of the reasons listed in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a>.
     * @param {Pointer<IntPtr>} reader The reader which is to read to the start element.
     * @param {Pointer<WS_XML_STRING>} localName The localName name that the element should be.  If <b>NULL</b>, any localName is permitted.
     * @param {Pointer<WS_XML_STRING>} ns The namespace that the element should be.  If <b>NULL</b>, any namespace is permitted.
     * @param {Pointer<Int32>} found If specified then this will indicate whether an element is found and the localName and namespace, if also specified, match.
     *           If not specified, and an element is not found or the localName and namespace don't match, then it will return 
     *           <b>WS_E_INVALID_FORMAT</b>. (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadtostartelement
     * @since windows6.1
     */
    static WsReadToStartElement(reader, localName, ns, found, error) {
        result := DllCall("webservices.dll\WsReadToStartElement", "ptr*", reader, "ptr", localName, "ptr", ns, "int*", found, "ptr*", error, "int")
        return result
    }

    /**
     * Moves the Reader to the specified attribute so that the content may be read using WsReadValue, WsReadChars, or WsReadBytes.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a> function returns EOF when advanced within an attribute.  The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadendattribute">WsReadEndAttribute</a> function can be used
     *         to return the reader to the containing element.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> object used to read the Start attribute.
     * @param {Integer} attributeIndex The index of the attribute to read.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadstartattribute
     * @since windows6.1
     */
    static WsReadStartAttribute(reader, attributeIndex, error) {
        result := DllCall("webservices.dll\WsReadStartAttribute", "ptr*", reader, "uint", attributeIndex, "ptr*", error, "int")
        return result
    }

    /**
     * Moves the reader back to the element node containing the attribute that was read.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadstartattribute">WsReadStartAttribute</a> must have been called in order to use this API.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> that reads the <b>End attribute</b>.
     *                   The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadendattribute
     * @since windows6.1
     */
    static WsReadEndAttribute(reader, error) {
        result := DllCall("webservices.dll\WsReadEndAttribute", "ptr*", reader, "ptr*", error, "int")
        return result
    }

    /**
     * This operation advances the Reader to the next node in the input stream.
     * @remarks
     * Other exception conditions include: <ul>
     * <li>If an XML declaration is found and <b>WS_XML_READER_PROPERTY_READ_DECLARATION</b> is <b>FALSE</b>,
     *         <b>WS_E_INVALID_FORMAT</b> is returned.
     *       </li>
     * <li>If the Reader is using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_stream_input">WS_XML_READER_STREAM_INPUT</a> and there was insufficient data buffered the reader will return
     *         <b>WS_E_QUOTA_EXCEEDED</b>.
     *       </li>
     * </ul>
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> object to advance.
     *           The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> and it may not be <b>NULL</b>.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadnode
     * @since windows6.1
     */
    static WsReadNode(reader, error) {
        result := DllCall("webservices.dll\WsReadNode", "ptr*", reader, "ptr*", error, "int")
        return result
    }

    /**
     * Advances the reader in the input stream.
     * @remarks
     * If there is an error parsing the input, the function will return <b>WS_E_INVALID_FORMAT</b>.
     *       (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * 
     * This function can fail for any of the reasons listed in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a>.
     * @param {Pointer<IntPtr>} reader The reader which is to skip to the next node.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsskipnode
     * @since windows6.1
     */
    static WsSkipNode(reader, error) {
        result := DllCall("webservices.dll\WsSkipNode", "ptr*", reader, "ptr*", error, "int")
        return result
    }

    /**
     * This function ensures that the current Reader node is an End element and advances the reader to the next node.
     * @remarks
     * This function can fail for any of the reasons listed in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a>.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> that is reads the <b>End element</b>. The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadendelement
     * @since windows6.1
     */
    static WsReadEndElement(reader, error) {
        result := DllCall("webservices.dll\WsReadEndElement", "ptr*", reader, "ptr*", error, "int")
        return result
    }

    /**
     * Searches the attributes of the current element for an attribute with the specified name and namespace and returns its index which may be passed to WsReadStartAttribute.
     * @remarks
     * If the reader is not positioned on a start element then it will return <b>WS_E_INVALID_OPERATION</b>.
     *       (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.) 
     * 
     * The index returned does not necessarily correspond to the position of the attribute as it appeared
     *         in the document.  It identifies the index of the matching attribute in the array of attributes of
     *         the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_element_node">WS_XML_ELEMENT_NODE</a>.  The order of the attributes in this array may differ from the order
     *         in which the attributes appeared in the document.
     * @param {Pointer<IntPtr>} reader The reader on which to find the attribute.
     * @param {Pointer<WS_XML_STRING>} localName The local name of the attribute to search for.
     * @param {Pointer<WS_XML_STRING>} ns The namespace of the attribute to search for.
     * @param {Integer} required If required is <b>TRUE</b> and the attribute is not found,  the function will return <b>WS_E_INVALID_FORMAT</b>.
     *           (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.) if required is <b>FALSE</b> and the attribute is not found, the function will return S_FALSE.
     * @param {Pointer<UInt32>} attributeIndex If the attribute is found, then the index of the attribute, is returned here.
     *           This index can then be passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadstartattribute">WsReadStartAttribute</a>.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfindattribute
     * @since windows6.1
     */
    static WsFindAttribute(reader, localName, ns, required, attributeIndex, error) {
        result := DllCall("webservices.dll\WsFindAttribute", "ptr*", reader, "ptr", localName, "ptr", ns, "int", required, "uint*", attributeIndex, "ptr*", error, "int")
        return result
    }

    /**
     * Reads text from a Reader and parses it according to the specified value type.
     * @remarks
     * An example that reads an element containing an integer value.
     * 
     * 
     * ``` syntax
     * // Advance the reader to the element
     * HRESULT hr = WsReadToStartElement(reader, localName, ns, NULL, error);
     * if (FAILED(hr))
     * {
     *     return hr;
     * }
     * // Advance past the element to the content
     * hr = WsReadStartElement(reader, error);
     * if (FAILED(hr))
     * {
     *     return hr;
     * }
     * // Read the content as an integer
     * __int32 i;
     * hr = WsReadValue(reader, WS_INT32_VALUE_TYPE, &amp;i, sizeof(i), error);
     * if (FAILED(hr))
     * {
     *     return hr;
     * }
     * // Read the end element
     * hr = WsReadEndElement(reader, error);
     * if (FAILED(hr))
     * {
     *     return hr;
     * }
     * ```
     * 
     * The grammar for the values types.
     * 
     * 
     * ``` syntax
     * 
     * WS_BOOL_VALUE_TYPE     = "true"
     *                        | "false"
     *                        | "1"
     *                        | "0"
     * WS_INTxxx_VALUE_TYPE   = sign? digits
     * WS_UINTxxx_VALUE_TYPE  = digits
     * WS_FLOAT_VALUE_TYPE    = WS_DOUBLE_VALUE_TYPE
     * WS_DOUBLE_VALUE_TYPE   = sign? digits ("." digits)? exponent?
     *                        | "NaN"
     *                        | "INF"
     *                        | "-INF"
     * WS_DECIMAL_VALUE_TYPE  = sign? digits ("." digits)?
     * WS_GUID_VALUE_TYPE     = xxxxxxxx "-" xxxx "-" xxxx "-" xxxx "-" xxxxxxxxxxxx
     * WS_TIMESPAN_VALUE_TYPE = sign? (digits ".")? hh ":" mm ":" ss ("." d7)?
     * WS_DATETIME_VALUE_TYPE = yyyy "-" MM "-" dd "T" hh ":" mm ":" ss  ("." d7)? tz?
     * WS_DURATION_VALUE_TYPE = sign? "P" (digits "Y")  (digits "M")? (digits "D")?
     *                        | sign? "P" (digits "Y")? (digits "M")? (digits "D")?
     *                        | sign? "P" (digits "Y")? (digits "M")? (digits "D") 
     *                        | sign? "P" (digits "Y")? (digits "M")? (digits "D")? "T" (digits "H")  (digits "M")? (digits ("." digits)? "S")?
     *                        | sign? "P" (digits "Y")? (digits "M")? (digits "D")? "T" (digits "H")? (digits "M")  (digits ("." digits)? "S")?
     *                        | sign? "P" (digits "Y")? (digits "M")? (digits "D")? "T" (digits "H")? (digits "M")? (digits ("." digits)? "S")
     * sign                   = "-"
     *                        | "+"
     * exponent               = E sign? digits
     *                        | e sign? digits
     * digits                 = [0-9]+
     * x                      = [0-9]
     *                        | [A-F]
     *                        | [a-f]
     * yyyy                   = 1-9999
     * hh                     = 0-23
     * mm                     = 0-59
     * ss                     = 0-59
     * MM                     = 1-31
     * tz                     = "Z"
     *                        | sign hh ":" mm
     * d7                     = digit digit? digit? digit? digit? digit? digit?
     * 
     * ```
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> from which the value is read.
     * @param {Integer} valueType The text interpretation type.
     * @param {Pointer} value A pointer to the parsed data if parsing was successful according to the specified value type.  The size required is determined by value type.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_value_type">WS_VALUE_TYPE</a> for more information.
     * @param {Integer} valueSize The byte size of the retrieved value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadvalue
     * @since windows6.1
     */
    static WsReadValue(reader, valueType, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadValue", "ptr*", reader, "int", valueType, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Reads a specified number of text characters from the Reader.
     * @remarks
     * Text is read up to either a start element or end element.  Comments are skipped, and CDATA content is treated
     *         identically to element content.  Character entities are converted to their unescaped form.
     *       
     * 
     * This function can fail for any of the reasons listed in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a>.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> from which the character data should be read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {Pointer<Char>} chars A pointer to a location for  the characters that have been read.
     * @param {Integer} maxCharCount The maximum number of characters that should be read.
     * @param {Pointer<UInt32>} actualCharCount A pointer to a ULONG value of 
     *           the actual number of characters that were read.  This may be less than maxCharCount even when there
     *           are more characters remaining.  There are no more characters when this returns zero.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadchars
     * @since windows6.1
     */
    static WsReadChars(reader, chars, maxCharCount, actualCharCount, error) {
        chars := chars is String? StrPtr(chars) : chars

        result := DllCall("webservices.dll\WsReadChars", "ptr*", reader, "ptr", chars, "uint", maxCharCount, "uint*", actualCharCount, "ptr*", error, "int")
        return result
    }

    /**
     * Reads a specified number of text characters from the reader and returns them encoded in UTF-8.
     * @remarks
     * XML text is read up to either a start element or end element.  Comments are skipped, and CDATA content is treated
     *         identically to element content.    Character entities are converted to their unescaped form.
     *       
     * 
     * This function can fail for any of the reasons listed in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a>.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> from which the character data should be read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {Pointer<Byte>} bytes A pointer to the buffer to place the encoded bytes that have been read.
     * @param {Integer} maxByteCount The maximum number of bytes that should be read.
     * @param {Pointer<UInt32>} actualByteCount A pointer to a ULONG value of 
     *           the actual number of bytes that were read.  This may be less than maxByteCount even when there
     *           are more bytes remaining.  There are no more bytes when this returns zero.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadcharsutf8
     * @since windows6.1
     */
    static WsReadCharsUtf8(reader, bytes, maxByteCount, actualByteCount, error) {
        result := DllCall("webservices.dll\WsReadCharsUtf8", "ptr*", reader, "char*", bytes, "uint", maxByteCount, "uint*", actualByteCount, "ptr*", error, "int")
        return result
    }

    /**
     * Reads text from the Reader and decodes the characters as bytes according to the base64 specification.
     * @remarks
     * Text is read up to either a start element or end element.  Comments are skipped, and CDATA content is treated
     *         identically to element content.
     *       
     * 
     * This function can fail for any of the reasons listed in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a>.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> from which the bytes should be read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object.
     * @param {Pointer} bytes A pointer to a location to place the decoded bytes.
     * @param {Integer} maxByteCount The maximum number of bytes that should be read.
     * @param {Pointer<UInt32>} actualByteCount A pointer to a ULONG value of 
     *           the actual number of bytes that were read.  This may be less than maxByteCount even when there
     *           are more bytes remaining.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadbytes
     * @since windows6.1
     */
    static WsReadBytes(reader, bytes, maxByteCount, actualByteCount, error) {
        result := DllCall("webservices.dll\WsReadBytes", "ptr*", reader, "ptr", bytes, "uint", maxByteCount, "uint*", actualByteCount, "ptr*", error, "int")
        return result
    }

    /**
     * Reads a series of elements from the reader and interprets their content according to the specified value type.
     * @remarks
     * This function is semantically equivalent to using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadstartelement">WsReadStartElement</a>,
     *         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadvalue">WsReadValue</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadendelement">WsReadEndElement</a> in a loop, but is more efficient.
     *       
     * 
     * This function can fail for any of the reasons listed in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadnode">WsReadNode</a>.
     * @param {Pointer<IntPtr>} reader The reader from which the array should be read.
     * @param {Pointer<WS_XML_STRING>} localName The localName of the repeating element.
     * @param {Pointer<WS_XML_STRING>} ns The namespace of the repeating element.
     * @param {Integer} valueType The value type to use to parse the content of each element.
     * @param {Pointer} array The array to populate with parsed values.  The size of the array items is determined by the value type.
     *           See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_value_type">WS_VALUE_TYPE</a> for more information.
     * @param {Integer} arraySize The size in bytes (not items) of the array.
     * @param {Integer} itemOffset The item (not byte) offset within the array at which to read.
     * @param {Integer} itemCount The number of items (not bytes) to read into the array.
     * @param {Pointer<UInt32>} actualItemCount The actual number of items that were read.  This may be less than itemCount even when there
     *           are more items remaining.  There are no more elements when this returns zero.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadarray
     * @since windows6.1
     */
    static WsReadArray(reader, localName, ns, valueType, array, arraySize, itemOffset, itemCount, actualItemCount, error) {
        result := DllCall("webservices.dll\WsReadArray", "ptr*", reader, "ptr", localName, "ptr", ns, "int", valueType, "ptr", array, "uint", arraySize, "uint", itemOffset, "uint", itemCount, "uint*", actualItemCount, "ptr*", error, "int")
        return result
    }

    /**
     * Returns the current position of the reader. This can only be used on a reader that is set to an XmlBuffer.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node_position">WS_XML_NODE_POSITION</a> for more information on using positions.
     * @param {Pointer<IntPtr>} reader The reader for which the current position will be obtained.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition The current position of the reader.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetreaderposition
     * @since windows6.1
     */
    static WsGetReaderPosition(reader, nodePosition, error) {
        result := DllCall("webservices.dll\WsGetReaderPosition", "ptr*", reader, "ptr", nodePosition, "ptr*", error, "int")
        return result
    }

    /**
     * Sets the current position of the Reader. The position must have been obtained by a call to WsGetReaderPosition or WsGetWriterPosition. This function can only be used on a reader that is set to a WS_XML_BUFFER.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node_position">WS_XML_NODE_POSITION</a> for more information on using positions.
     *       
     * 
     * This function cannot be used while canonicalizing.  If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsstartreadercanonicalization">WsStartReaderCanonicalization</a> has
     *         been called, then it will return <b>WS_E_INVALID_OPERATION</b>.
     *       (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @param {Pointer<IntPtr>} reader A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object for which the current position is set.  The pointer must reference a valid <b>XML Reader</b> object.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition A pointer to the position to set the Reader.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetreaderposition
     * @since windows6.1
     */
    static WsSetReaderPosition(reader, nodePosition, error) {
        result := DllCall("webservices.dll\WsSetReaderPosition", "ptr*", reader, "ptr", nodePosition, "ptr*", error, "int")
        return result
    }

    /**
     * Moves the current position of the reader as specified by the moveTo parameter. This function can only be used on a reader that is set to an XmlBuffer.
     * @remarks
     * If the found parameter is not <b>NULL</b>, then it will indicate there whether or not it could
     *         move to the requested node and return NOERROR.
     *       
     * 
     * If the found parameter is <b>NULL</b>, and the requested node is not found, it will return <b>WS_E_INVALID_FORMAT</b>.
     *       (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.) 
     * 
     * This function cannot be used while canonicalizing.  If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsstartreadercanonicalization">WsStartReaderCanonicalization</a> has
     *         been called, then it will return <b>WS_E_INVALID_OPERATION</b>.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> object with the position to move.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object and the referenced <b>Reader</b> value may not be <b>NULL</b>.
     * @param {Integer} moveTo This enumerator specifies direction or next position of the Reader relative to the current position.
     * @param {Pointer<Int32>} found Indicates success or failure of the specified move.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsmovereader
     * @since windows6.1
     */
    static WsMoveReader(reader, moveTo, found, error) {
        result := DllCall("webservices.dll\WsMoveReader", "ptr*", reader, "int", moveTo, "int*", found, "ptr*", error, "int")
        return result
    }

    /**
     * creates an XML Writer with the specified properties.
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutput">WsSetOutput</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutputtobuffer">WsSetOutputToBuffer</a> functions to choose the encoding of the XML writer and to indicate where to direct the output.
     *       
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> can be reused by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutput">WsSetOutput</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutputtobuffer">WsSetOutputToBuffer</a> again.
     *       
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_writer_property_id">WS_XML_WRITER_PROPERTY_ID</a> for the properties that can be used to configure the writer.
     *       
     * 
     * The XML writer buffers all data until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsflushwriter">WsFlushWriter</a> is called.  This allows the caller to determine at what granularity to write data and to whether to write that data asynchronously.  Data is not written until <b>WsFlushWriter</b> is called.
     *       
     * 
     * If an operation on a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> fails the writer is left in a faulted state and further calls to the Writer return <b>WS_E_OBJECT_FAULTED</b>.  (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)The only possible function calls for the XML writer if this occurs are <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutput">WsSetOutput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutputtobuffer">WsSetOutputToBuffer</a> to return the XML writer to a usable state, or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreewriter">WsFreeWriter</a> to free the XML writer.
     * @param {Pointer<WS_XML_WRITER_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_property">WS_XML_WRITER_PROPERTY</a> structures containing optional properties for the XML writer.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<IntPtr>} writer On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> structure representing the created XML writer.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreewriter">WsFreeWriter</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatewriter
     * @since windows6.1
     */
    static WsCreateWriter(properties, propertyCount, writer, error) {
        result := DllCall("webservices.dll\WsCreateWriter", "ptr", properties, "uint", propertyCount, "ptr", writer, "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory resource associated with an XML Writer object.
     * @remarks
     * If necessary, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsflushwriter">WsFlushWriter</a> should be called before calling <b>WsFreeWriter</b> to guarantee
     *         all data is emitted.
     * @param {Pointer<IntPtr>} writer A pointer to the <b>XML Writer</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatewriter">WsCreateWriter</a> and   the referenced value may not be <b>NULL</b>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreewriter
     * @since windows6.1
     */
    static WsFreeWriter(writer) {
        result := DllCall("webservices.dll\WsFreeWriter", "ptr*", writer)
        return result
    }

    /**
     * Sets the encoding and output callbacks for the writer. The callbacks are used to provides buffers to the writer and to perform asynchronous i/o.
     * @remarks
     * When <b>WsSetOutput</b> is used on the writer, the writer will function in a forward only manner and
     *         the functions <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetwriterposition">WsGetWriterPosition</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetwriterposition">WsSetWriterPosition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmovewriter">WsMoveWriter</a> cannot be used.
     *       
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_encoding">encoding</a> is <b>NULL</b>, then <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_output">WS_XML_WRITER_OUTPUT</a> is ignored and the writer is set up so that any attempt to write to it will fail.
     *       
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_encoding">encoding</a> is not <b>NULL</b>, then <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_output">WS_XML_WRITER_OUTPUT</a> must be non-<b>NULL</b> as well.
     *       
     * 
     * If <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_buffer_output">WS_XML_WRITER_OUTPUT</a> is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_buffer_output">WS_XML_WRITER_BUFFER_OUTPUT</a> then the writer will buffer the generated
     *         bytes of the document.  Use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetwriterproperty">WsGetWriterProperty</a> with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_writer_property_id">WS_XML_WRITER_PROPERTY_BUFFERS</a> or
     *         <b>WS_XML_WRITER_PROPERTY_BYTES</b> to obtain these bytes.  In this mode <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsflushwriter">WsFlushWriter</a> has no effect.
     *       
     * 
     * If <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_stream_output">WS_XML_WRITER_OUTPUT</a> is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_stream_output">WS_XML_WRITER_STREAM_OUTPUT</a> then the writer will pass the generated
     *         bytes of the document to the specified <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">WS_WRITE_CALLBACK</a> during calls to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsflushwriter">WsFlushWriter</a>.
     *       
     * 
     * The writer will be initialized to use the properties specified in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatewriter">WsCreateWriter</a>.  Any properties
     *         specified to <b>WsSetOutput</b> will override those properties.
     *       
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatewriter">WsCreateWriter</a> for the default values of the properties of the writer.
     * @param {Pointer<IntPtr>} writer The writer for which the output will be set.
     * @param {Pointer<WS_XML_WRITER_ENCODING>} encoding The encoding describes the format of the input bytes.  This should be one of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_text_encoding">WS_XML_WRITER_TEXT_ENCODING</a>,
     *           <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_binary_encoding">WS_XML_WRITER_BINARY_ENCODING</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_mtom_encoding">WS_XML_WRITER_MTOM_ENCODING</a>.
     * @param {Pointer<WS_XML_WRITER_OUTPUT>} output Specifies where the writer should place its data.
     * @param {Pointer<WS_XML_WRITER_PROPERTY>} properties An array of optional properties of the writer.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_property">WS_XML_WRITER_PROPERTY</a>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetoutput
     * @since windows6.1
     */
    static WsSetOutput(writer, encoding, output, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsSetOutput", "ptr*", writer, "ptr", encoding, "ptr", output, "ptr", properties, "uint", propertyCount, "ptr*", error, "int")
        return result
    }

    /**
     * This operation positions the Writer at the end of the specified buffer.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatewriter">WsCreateWriter</a> for the default values of the properties of the writer.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object for which the output is set.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<IntPtr>} buffer A pointer to the buffer where the Writer sends the data.
     * @param {Pointer<WS_XML_WRITER_PROPERTY>} properties A WS_XML_WRITER_PROPERTY pointer that  references an "array" of optional Writer properties.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetoutputtobuffer
     * @since windows6.1
     */
    static WsSetOutputToBuffer(writer, buffer, properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsSetOutputToBuffer", "ptr*", writer, "ptr*", buffer, "ptr", properties, "uint", propertyCount, "ptr*", error, "int")
        return result
    }

    /**
     * Retrieves a specified XML Writer property. The property to retrieve is identified by a WS_XML WRITER_PROPERTY_ID input parameter.
     * @param {Pointer<IntPtr>} writer A pointer  to a WS_XML_WRITER structure that contains the property value to retrieve.
     * @param {Integer} id This is a <b>WS_XML_WRITER_PROPERTY_ID</b> enumerator that identifies the property to retrieve.
     * @param {Pointer} value A void pointer to a location for storing the retrieved property value.
     * @param {Integer} valueSize The byte-length buffer size allocated by the caller to store the retrieved property value.
     *                 The pointer must have an alignment compatible with the type
     *             of the property.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetwriterproperty
     * @since windows6.1
     */
    static WsGetWriterProperty(writer, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetWriterProperty", "ptr*", writer, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Instructs the writer to invoke the callbackspecified in WS_XML_WRITER_STREAM_OUTPUT if sufficient data has been buffered.
     * @remarks
     * The writer buffers all data until <b>WsFlushWriter</b> is called.
     *       
     * 
     * If necessary, the <b>WsFlushWriter</b> should be called before <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreewriter">WsFreeWriter</a> to guarantee all data is emitted.
     *       
     * 
     * By specifying a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> the buffered data will be written asynchronously.
     *       
     * 
     * This function is a no-op if the writer is using <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_buffer_output">WS_XML_WRITER_BUFFER_OUTPUT</a>.
     *       
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritestartelement">WsWriteStartElement</a> has been called, but the element has not been committed (see <b>WsWriteStartElement</b>)
     *         then this element will not be flushed.
     *       
     * 
     * If this function is called when using <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_mtom_encoding">WS_XML_WRITER_MTOM_ENCODING</a> and there are
     *         no open elements on the writer, then the supporting MIME parts will be generated and emitted.  Once this
     *         occurs, any API that attempts to write further to the XML document will return <b>WS_E_INVALID_OPERATION</b>.
     *       (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @param {Pointer<IntPtr>} writer The writer to flush.
     * @param {Integer} minSize Specifies the minimum number of bytes that must be buffered in order for the
     *           <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">callback</a> to be invoked. If fewer than this number of bytes
     *           are buffered, then the <b>callback</b> will not be invoked.  This can be
     *           used to minimize the number of i/o's that occur when writing small amounts of data.
     *         
     * 
     * Zero should be specified to guarantee that the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_callback">callback</a> is invoked.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsflushwriter
     * @since windows6.1
     */
    static WsFlushWriter(writer, minSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsFlushWriter", "ptr*", writer, "uint", minSize, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Writes a start element to the writer.
     * @remarks
     * If the underlying encoding supports empty elements and the element has no content an empty element is written.
     *       
     * 
     * If a non-empty prefix is specified with an empty namespace <b>WS_E_INVALID_FORMAT</b> is returned.
     *       
     * 
     * If writing the start element causes <b>WS_XML_WRITER_PROPERTY_MAX_DEPTH</b> to be exceeded
     *         <b>WS_E_QUOTA_EXCEEDED</b> is returned.
     *        (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * 
     * When using <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_mtom_encoding">WS_XML_WRITER_MTOM_ENCODING</a> it is an error to attempt to write an element with the
     *         localName "Include" from the namespace"http://www.w3.org/2004/08/xop/include".
     *       
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritestartattribute">WsWriteStartAttribute</a> can also be used to add an attribute to an element when the writer is
     *         positioned on an element using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmovewriter">WsMoveWriter</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetwriterposition">WsSetWriterPosition</a>.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the start element is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_STRING>} prefix A WS_XML_STRING pointer to the prefix to use for the start element.  If the value referenced by this parameter is <b>NULL</b> the Writer will choose a attribute.
     * @param {Pointer<WS_XML_STRING>} localName A WS_XML_STRING pointer to the local name used by the start element.  It must be at least one character long.
     * @param {Pointer<WS_XML_STRING>} ns A WS_XML_STRING pointer to the namespace to be used for the start element.
     *         
     * If no prefix is specified the Writer may use a prefix in scope that is bound to the specified namespace or it may generate a prefix and include an XMLNS attribute. If a prefix is specified the Writer will use that prefix and may include an XMLNS attribute if needed to override an existing prefix in scope.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritestartelement
     * @since windows6.1
     */
    static WsWriteStartElement(writer, prefix, localName, ns, error) {
        result := DllCall("webservices.dll\WsWriteStartElement", "ptr*", writer, "ptr", prefix, "ptr", localName, "ptr", ns, "ptr*", error, "int")
        return result
    }

    /**
     * Forces the writer to commit the current element and prevent further attributes from being written to the element.
     * @remarks
     * Occasionally, it is useful to explicitly force the completion of an element.  This can be used to force the writer
     *         to write a full element and pair.  It also may be useful when obtaining positions when writing to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a>.
     *       
     * 
     * Calling this API when there is no element to commit will cause it to return <b>WS_E_INVALID_OPERATION</b>.
     *       (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @param {Pointer<IntPtr>} writer The writer for which the current element should be committed.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswriteendstartelement
     * @since windows6.1
     */
    static WsWriteEndStartElement(writer, error) {
        result := DllCall("webservices.dll\WsWriteEndStartElement", "ptr*", writer, "ptr*", error, "int")
        return result
    }

    /**
     * Writes an Xmlns attribute to the current element.
     * @remarks
     * The following conditions apply:<ul>
     * <li>If an empty prefix is specified then the default namespace is assigned.
     *       </li>
     * <li>If a <b>NULL</b> prefix is specified then the Writer chooses the appropriate prefix for the namespace.
     *       </li>
     * <li>If the Xmlns attribute is redundant it cannot be written.
     *       </li>
     * <li>If a non-empty prefix is specified with an empty namespace <b>WS_E_INVALID_FORMAT</b> is returned.
     *       </li>
     * </ul>
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the Xmlns attribute is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_STRING>} prefix A WS_XML_STRING pointer to the prefix to use for the start element.  If the value referenced by this parameter is <b>NULL</b> the Writer will choose a attribute.
     *         
     * 
     * Specifies the prefix to use for the xmlns attribute.
     * @param {Pointer<WS_XML_STRING>} ns A WS_XML_STRING pointer to the namespace to bind to the prefix.
     * @param {Integer} singleQuote Determines whether to use a single or a double quote for the attribute value.
     *         <div class="alert"><b>Note</b>  If <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_binary_encoding">WS_XML_WRITER_BINARY_ENCODING</a> is set the quotation character is  not preserved and this
     *           parameter has have no effect.
     *         </div>
     * <div> </div>
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritexmlnsattribute
     * @since windows6.1
     */
    static WsWriteXmlnsAttribute(writer, prefix, ns, singleQuote, error) {
        result := DllCall("webservices.dll\WsWriteXmlnsAttribute", "ptr*", writer, "ptr", prefix, "ptr", ns, "int", singleQuote, "ptr*", error, "int")
        return result
    }

    /**
     * This operation starts writing an attribute to the current element.
     * @remarks
     * If a <b>NULL</b> prefix is specified the writer will choose a prefix for the namespace.
     *       
     * 
     * To write an "xml:lang"  or "xml:space" attribute, specify "xml" for the prefix, "lang" or "space" for the localName,
     *         and "http://www.w3.org/XML/1998/namespace" for the namespace.
     *       
     * 
     * If writing the attribute causes <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_writer_property_id">WS_XML_WRITER_PROPERTY_MAX_ATTRIBUTES</a> to be exceeded
     *         then <b>WS_E_QUOTA_EXCEEDED</b> is returned.
     *       
     * 
     * If a non-empty prefix is specified with an empty namespace <b>WS_E_INVALID_FORMAT</b> is returned.
     *       (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the attribute is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_STRING>} prefix A WS_XML_STRING pointer to the prefix to use for the attribute.  If the value referenced by this parameter is <b>NULL</b> the Writer will choose a attribute.
     * @param {Pointer<WS_XML_STRING>} localName A WS_XML_STRING pointer to the local name used by the attribute.  It must be at least one character long.
     * @param {Pointer<WS_XML_STRING>} ns A WS_XML_STRING pointer to the namespace to be used for the attribute.
     *         
     * If no prefix is specified the Writer may use a prefix in scope that is bound to the specified namespace or it may generate a prefix and include an XMLNS attribute.
     * 
     * If a prefix is specified the Writer will use that prefix and may include an XMLNS attribute if needed to override an existing prefix in scope.
     * @param {Integer} singleQuote Determines whether to use a single or a double quote for the attribute value.
     * 
     * <div class="alert"><b>Note</b>  With <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_binary_encoding">WS_XML_WRITER_BINARY_ENCODING</a> the quote character is not preserved and this parameter has no effect.
     * </div>
     * <div> </div>
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritestartattribute
     * @since windows6.1
     */
    static WsWriteStartAttribute(writer, prefix, localName, ns, singleQuote, error) {
        result := DllCall("webservices.dll\WsWriteStartAttribute", "ptr*", writer, "ptr", prefix, "ptr", localName, "ptr", ns, "int", singleQuote, "ptr*", error, "int")
        return result
    }

    /**
     * This operation finishes writing an attribute to the current element. If WsWriteStartAttribute is called the Writer does not permit another element or attribute to be written until WsWriteEndAttribute is called.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the attribute is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswriteendattribute
     * @since windows6.1
     */
    static WsWriteEndAttribute(writer, error) {
        result := DllCall("webservices.dll\WsWriteEndAttribute", "ptr*", writer, "ptr*", error, "int")
        return result
    }

    /**
     * This operation derives the best representation for a primitive value from the underlying encoding and passes the derived value to a Writer object.
     * @remarks
     * <b>WsWriteValue</b> may be called only once between <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritestartattribute">WsWriteStartAttribute</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteendattribute">WsWriteEndAttribute</a>.
     *         It may not be combined with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritechars">WsWriteChars</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebytes">WsWriteBytes</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritecharsutf8">WsWriteCharsUtf8</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritetext">WsWriteText</a> when writing an attribute.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the value is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Integer} valueType Indicates the Type of primitive value referenced by the <i>value</i> parameter.
     * 
     * I
     * @param {Pointer} value A void  pointer to the primitive value.
     * @param {Integer} valueSize The size in bytes of the value being written.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritevalue
     * @since windows6.1
     */
    static WsWriteValue(writer, valueType, value, valueSize, error) {
        result := DllCall("webservices.dll\WsWriteValue", "ptr*", writer, "int", valueType, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Writes a WS_XML_BUFFER to a writer.
     * @remarks
     * The function will copy the entire contents of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> to the writer at the current position.
     * @param {Pointer<IntPtr>} writer The writer to which the XML buffer will be written.
     * @param {Pointer<IntPtr>} xmlBuffer The XML buffer to write.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritexmlbuffer
     * @since windows6.1
     */
    static WsWriteXmlBuffer(writer, xmlBuffer, error) {
        result := DllCall("webservices.dll\WsWriteXmlBuffer", "ptr*", writer, "ptr*", xmlBuffer, "ptr*", error, "int")
        return result
    }

    /**
     * Reads the current node from a reader into a WS_XML_BUFFER.
     * @remarks
     * If the reader must be positioned at either <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_node_type">WS_XML_NODE_TYPE_BOF</a>, or <b>WS_XML_NODE_TYPE_ELEMENT</b>.
     *       
     * 
     * If the reader is positioned at <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_node_type">WS_XML_NODE_TYPE_BOF</a>, then the entire document will be copied from the
     *         reader into the XML buffer.
     *       
     * 
     * If the reader is positioned at <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_node_type">WS_XML_NODE_TYPE_ELEMENT</a>, then the element and all its children will be
     *         read into the XML buffer.
     * @param {Pointer<IntPtr>} reader The reader from which to read into the XML buffer.
     * @param {Pointer<IntPtr>} heap The heap from which to allocate the XML buffer.
     * @param {Pointer<IntPtr>} xmlBuffer The XML buffer is returned here.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadxmlbuffer
     * @since windows6.1
     */
    static WsReadXmlBuffer(reader, heap, xmlBuffer, error) {
        result := DllCall("webservices.dll\WsReadXmlBuffer", "ptr*", reader, "ptr*", heap, "ptr", xmlBuffer, "ptr*", error, "int")
        return result
    }

    /**
     * Uses a writer to convert a WS_XML_BUFFER to an encoded set of bytes.
     * @remarks
     * The function will generate the entire contents of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> as a linear set of bytes 
     *         allocated from the specified heap in the encoding specified.
     *       
     * 
     * The writer will be left in an undefined state after calling this function.  However, <b>WsWriteXmlBufferToBytes</b> 
     *         may be used again with such a writer.  Otherwise, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutput">WsSetOutput</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutputtobuffer">WsSetOutputToBuffer</a> should be
     *         used to bring the writer back to a known state, or the writer should be freed using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreewriter">WsFreeWriter</a>.
     * @param {Pointer<IntPtr>} writer The writer to use to generate the encoded bytes.
     * @param {Pointer<IntPtr>} xmlBuffer The XML buffer to write.
     * @param {Pointer<WS_XML_WRITER_ENCODING>} encoding The encoding to use when generating the bytes.  If <b>NULL</b>, the bytes will be encoded in utf8.
     * @param {Pointer<WS_XML_WRITER_PROPERTY>} properties An array of optional properties of the writer.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_writer_property">WS_XML_WRITER_PROPERTY</a>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer<IntPtr>} heap The heap from which to allocate the bytes.
     * @param {Pointer<Void>} bytes The generated bytes are returned here.
     * @param {Pointer<UInt32>} byteCount The number of generated bytes are returned here.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritexmlbuffertobytes
     * @since windows6.1
     */
    static WsWriteXmlBufferToBytes(writer, xmlBuffer, encoding, properties, propertyCount, heap, bytes, byteCount, error) {
        result := DllCall("webservices.dll\WsWriteXmlBufferToBytes", "ptr*", writer, "ptr*", xmlBuffer, "ptr", encoding, "ptr", properties, "uint", propertyCount, "ptr*", heap, "ptr", bytes, "uint*", byteCount, "ptr*", error, "int")
        return result
    }

    /**
     * Uses a reader to convert a set of encoded bytes to a WS_XML_BUFFER.
     * @remarks
     * The function will parse the entire contents according to the specified encoding and store it into a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a>.
     *       
     * 
     * The reader will be left in an undefined state after calling this function.  However, <b>WsReadXmlBufferFromBytes</b> may be used again with such a reader.  Otherwise, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinput">WsSetInput</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinputtobuffer">WsSetInputToBuffer</a> should be
     *         used to bring the reader back to a known state, or the reader should be freed using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreereader">WsFreeReader</a>.
     * @param {Pointer<IntPtr>} reader The reader to use to parse the encoded bytes.
     * @param {Pointer<WS_XML_READER_ENCODING>} encoding The encoding to use when parsing the bytes.  If <b>NULL</b>, a <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_reader_text_encoding">WS_XML_READER_TEXT_ENCODING</a> 
     *           with a charset of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_charset">WS_CHARSET_AUTO</a> will be used.
     * @param {Pointer<WS_XML_READER_PROPERTY>} properties An array of optional properties of the reader.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_property">WS_XML_READER_PROPERTY</a>.
     * @param {Integer} propertyCount The number of properties.
     * @param {Pointer} bytes The bytes to parse.
     * @param {Integer} byteCount The number of bytes to parse.
     * @param {Pointer<IntPtr>} heap The heap from which to allocate the XML buffer.
     * @param {Pointer<IntPtr>} xmlBuffer The XML buffer into which the bytes were read is returned here.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadxmlbufferfrombytes
     * @since windows6.1
     */
    static WsReadXmlBufferFromBytes(reader, encoding, properties, propertyCount, bytes, byteCount, heap, xmlBuffer, error) {
        result := DllCall("webservices.dll\WsReadXmlBufferFromBytes", "ptr*", reader, "ptr", encoding, "ptr", properties, "uint", propertyCount, "ptr", bytes, "uint", byteCount, "ptr*", heap, "ptr", xmlBuffer, "ptr*", error, "int")
        return result
    }

    /**
     * This operation sends a series of elements to an XML Writer.
     * @remarks
     * This function is semantically equivalent to using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritestartelement">WsWriteStartElement</a>,
     *         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritevalue">WsWriteValue</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteendelement">WsWriteEndElement</a> in a loop, but is more efficient.
     * @param {Pointer<IntPtr>} writer A pointer to the Writer where the elements are written.
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
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritearray
     * @since windows6.1
     */
    static WsWriteArray(writer, localName, ns, valueType, array, arraySize, itemOffset, itemCount, error) {
        result := DllCall("webservices.dll\WsWriteArray", "ptr*", writer, "ptr", localName, "ptr", ns, "int", valueType, "ptr", array, "uint", arraySize, "uint", itemOffset, "uint", itemCount, "ptr*", error, "int")
        return result
    }

    /**
     * Writes an XML qualified name to the Writer.
     * @remarks
     * <ul>
     * <li>If the prefix is <b>NULL</b>, then the namespace must not be <b>NULL</b>.  In this case the writer will try to find a prefix in scope that is bound to the specified namespace.  If an appropriate prefix is found it will be used.  If not the Writer will generate a prefix and insert an XMLNS attribute on the current element.  If the writer is not in an element, then the function will return <b>WS_E_INVALID_FORMAT</b>.
     * 
     * (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)</li>
     * <li>If the prefix is not <b>NULL</b> and the namespace is not <b>NULL</b> the Writer will verify that the prefix is currently bound to the specified namespace and will return <b>WS_E_INVALID_FORMAT</b> if not.
     * </li>
     * <li>If the prefix is not <b>NULL</b> and the namespace is <b>NULL</b> the Writer will use the prefix and local name to write the qualified name.
     * </li>
     * </ul>
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the qualified name is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_STRING>} prefix A WS_XML_STRING pointer to the prefix used by the qualified name.  If the value referenced by this parameter is <b>NULL</b> the Writer will choose a prefix.
     * @param {Pointer<WS_XML_STRING>} localName A WS_XML_STRING pointer to the local name used by the qualified name.  It must be at least one character long.
     * @param {Pointer<WS_XML_STRING>} ns A WS_XML_STRING pointer to the namespace used for the qualified name.
     *         
     * If no prefix is specified the Writer may use a prefix in scope that is bound to the specified namespace or it may generate a prefix and include an XMLNS attribute.
     * 
     * If a prefix is specified the Writer uses that prefix and may include an XMLNS attribute if needed to override an existing prefix in scope.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritequalifiedname
     * @since windows6.1
     */
    static WsWriteQualifiedName(writer, prefix, localName, ns, error) {
        result := DllCall("webservices.dll\WsWriteQualifiedName", "ptr*", writer, "ptr", prefix, "ptr", localName, "ptr", ns, "ptr*", error, "int")
        return result
    }

    /**
     * Writes a series of characters to an element or attribute.
     * @remarks
     * <b>WsWriteChars</b> can be called more than once between <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritestartattribute">WsWriteStartAttribute</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteendattribute">WsWriteEndAttribute</a>.  It cannot be combined with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritecharsutf8">WsWriteCharsUtf8</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebytes">WsWriteBytes</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritevalue">WsWriteValue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritetext">WsWriteText</a> when writing an attribute.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the characters are written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<Char>} chars A pointer to the characters to write.
     * @param {Integer} charCount The number of characters to write.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritechars
     * @since windows6.1
     */
    static WsWriteChars(writer, chars, charCount, error) {
        chars := chars is String? StrPtr(chars) : chars

        result := DllCall("webservices.dll\WsWriteChars", "ptr*", writer, "ptr", chars, "uint", charCount, "ptr*", error, "int")
        return result
    }

    /**
     * Writes a series of characters encoded as UTF-8 to an element or attribute.
     * @remarks
     * <b>WsWriteCharsUtf8</b> can be called more than once between <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritestartattribute">WsWriteStartAttribute</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteendattribute">WsWriteEndAttribute</a>.  It cannot be combined with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritechars">WsWriteChars</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebytes">WsWriteBytes</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritevalue">WsWriteValue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritetext">WsWriteText</a> when writing an attribute.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the characters are written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<Byte>} bytes A pointer to the encoded UTF-8 characters to write.
     * @param {Integer} byteCount The number of bytes to write.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritecharsutf8
     * @since windows6.1
     */
    static WsWriteCharsUtf8(writer, bytes, byteCount, error) {
        result := DllCall("webservices.dll\WsWriteCharsUtf8", "ptr*", writer, "char*", bytes, "uint", byteCount, "ptr*", error, "int")
        return result
    }

    /**
     * Writes bytes to the writer in a format optimized for the encoding. When writing in a text encoding, it will emit the bytes encoded in base64. When writing to a binary format, it will emit the bytes directly.
     * @remarks
     * <b>WsWriteBytes</b> may be called more than once between <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritestartattribute">WsWriteStartAttribute</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteendattribute">WsWriteEndAttribute</a>.  It may
     *         not be combined with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritechars">WsWriteChars</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritecharsutf8">WsWriteCharsUtf8</a>, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritevalue">WsWriteValue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritetext">WsWriteText</a> when writing an attribute.
     *       
     * 
     * For the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_mtom_encoding">WS_XML_WRITER_MTOM_ENCODING</a>, if the byteCount exceeds the maxInlineByteCount specified
     *         during <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutput">WsSetOutput</a> then the bytes will be buffered and  placed in their own MIME part.  Otherwise
     *         the bytes are encoded in base64 and placed directly in the document.
     *       
     * 
     * For the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_mtom_encoding">WS_XML_WRITER_MTOM_ENCODING</a>, if the element containing the bytes has an attribute with
     *         the name 'contentType' and the namespace 'http://www.w3.org/2004/11/xmlmime', then the value of the attribute
     *         will be reflected in the content type header for the MIME part as described in 
     *         XML-binary Optimized Packaging.
     * @param {Pointer<IntPtr>} writer The writer to which the bytes will be written.
     * @param {Pointer} bytes The bytes to write to the document.
     * @param {Integer} byteCount The number bytes to write to the document.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritebytes
     * @since windows6.1
     */
    static WsWriteBytes(writer, bytes, byteCount, error) {
        result := DllCall("webservices.dll\WsWriteBytes", "ptr*", writer, "ptr", bytes, "uint", byteCount, "ptr*", error, "int")
        return result
    }

    /**
     * Establishes a callback to be invoked to write bytes within an element. In some encodings this can be more efficient by eliminating a copy of the data.
     * @remarks
     * When writing with the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_mtom_encoding">WS_XML_WRITER_MTOM_ENCODING</a>, <b>WsPushBytes</b> provides a way
     *         to write bytes directly into its own MIME part and avoid a copy.  However, the writer at its discretion,
     *         may choose to invoke the callback immediately, so the caller should be prepared for this.
     *       
     * 
     * If the encoding cannot take advantage of this behavior, then <b>WsPushBytes</b> will invoke the
     *         callback immediately and operate as if <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebytes">WsWriteBytes</a> was called.
     * @param {Pointer<IntPtr>} writer A pointer to the XML Writer object to which the bytes are written.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> and   the referenced value may not be <b>NULL</b>.
     * @param {Pointer<WS_PUSH_BYTES_CALLBACK>} callback This parameter is the callback to invoke to write the data.
     * @param {Pointer<Void>} callbackState A pointer to a user-defined state that is  passed to the callback function.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wspushbytes
     * @since windows6.1
     */
    static WsPushBytes(writer, callback, callbackState, error) {
        result := DllCall("webservices.dll\WsPushBytes", "ptr*", writer, "ptr", callback, "ptr", callbackState, "ptr*", error, "int")
        return result
    }

    /**
     * Sets up a callback to be invoked to obtain the bytes to be written within an element. In some encodings this can be more efficient by eliminating a copy of the data.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebytes">WsWriteBytes</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wspushbytes">WsPushBytes</a> require the buffer of data to be provided to the writer.
     *         In some usage patterns, this may require an extra copy of the data.  For those scenarios, <b>WsPullBytes</b> offers a way to request the writer to provide the buffer that must be filled with data.
     *       
     * 
     * If the encoding cannot take advantage of this behavior, then <b>WsPullBytes</b> will invoke the
     *         callback immediately and operate as if <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebytes">WsWriteBytes</a> was called on the resulting data.
     * @param {Pointer<IntPtr>} writer The writer to which the bytes will be written.
     * @param {Pointer<WS_PULL_BYTES_CALLBACK>} callback The callback to invoke when its time to write the binary data.
     * @param {Pointer<Void>} callbackState User-defined state to be passed to the callback.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wspullbytes
     * @since windows6.1
     */
    static WsPullBytes(writer, callback, callbackState, error) {
        result := DllCall("webservices.dll\WsPullBytes", "ptr*", writer, "ptr", callback, "ptr", callbackState, "ptr*", error, "int")
        return result
    }

    /**
     * Writes an end element to a Writer.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the end element is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswriteendelement
     * @since windows6.1
     */
    static WsWriteEndElement(writer, error) {
        result := DllCall("webservices.dll\WsWriteEndElement", "ptr*", writer, "ptr*", error, "int")
        return result
    }

    /**
     * Writes the specified text to the XML writer.
     * @remarks
     * <b>WsWriteText</b> can be called only once between <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritestartattribute">WsWriteStartAttribute</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteendattribute">WsWriteEndAttribute</a> 
     *         unless the text type is one of the following:
     *         <ul>
     * <li><b>WS_XML_TEXT_TYPE_UTF8</b></li>
     * <li><b>WS_XML_TEXT_TYPE_UTF16</b></li>
     * <li><b>WS_XML_TEXT_TYPE_BASE64</b></li>
     * </ul>
     * <div class="alert"><b>Note</b>  If the text Type is set to either of the previous values WsWriteText can be called more than once.  However the text Type must be the same for all calls within an attribute.
     *       </div>
     * <div> </div>
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the text is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_TEXT>} text A pointer to the text to write.  <div class="alert"><b>Note</b>  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a> and its derived classes for more information on the text object.
     *         </div>
     * <div> </div>
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritetext
     * @since windows6.1
     */
    static WsWriteText(writer, text, error) {
        result := DllCall("webservices.dll\WsWriteText", "ptr*", writer, "ptr", text, "ptr*", error, "int")
        return result
    }

    /**
     * This operation starts a CDATA section in the writer.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the CDATA section is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritestartcdata
     * @since windows6.1
     */
    static WsWriteStartCData(writer, error) {
        result := DllCall("webservices.dll\WsWriteStartCData", "ptr*", writer, "ptr*", error, "int")
        return result
    }

    /**
     * Ends a CDATA section in the writer.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the end CDATA section is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswriteendcdata
     * @since windows6.1
     */
    static WsWriteEndCData(writer, error) {
        result := DllCall("webservices.dll\WsWriteEndCData", "ptr*", writer, "ptr*", error, "int")
        return result
    }

    /**
     * Writes the specified node to the XML Writer.
     * @param {Pointer<IntPtr>} writer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object to which the node is written.  The pointer must reference a valid <b>XML Writer</b> object.
     * @param {Pointer<WS_XML_NODE>} node A pointer to the Node object to write to the document.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritenode
     * @since windows6.1
     */
    static WsWriteNode(writer, node, error) {
        result := DllCall("webservices.dll\WsWriteNode", "ptr*", writer, "ptr", node, "ptr*", error, "int")
        return result
    }

    /**
     * This function returns the prefix to which a namespace is bound. There may be more than one prefix in scope and this function is free to return any one of them.
     * @remarks
     * For the namespace "http://www.w3.org/XML/1998/namespace" it will return the prefix "xml".
     *       
     * 
     * For the namespace "http://www.w3.org/2000/xmlns/" it will return the prefix "xmlns".
     *       
     * 
     * The prefix returned should not be modified, and is only valid until the writer advances.
     * @param {Pointer<IntPtr>} writer A pointer to a Writer with the namespace to search.  This must be a valid <b>WS_XML_WRITER</b> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatewriter">WsCreateWriter</a> and   may not be <b>NULL</b>.
     * @param {Pointer<WS_XML_STRING>} ns The namespace to search for.
     * @param {Integer} required Indicates whether or not an error should be returned if a matching prefix is not found.
     * @param {Pointer<WS_XML_STRING>} prefix A reference to a prefix bound to the namespace or <b>NULL</b> if the value of the <i>required</i> parameter is <b>FALSE</b> and a matching
     *           namespace is not found.
     *         <div class="alert"><b>Note</b>  The value returned is valid only until the writer advances.</div>
     * <div> </div>
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetprefixfromnamespace
     * @since windows6.1
     */
    static WsGetPrefixFromNamespace(writer, ns, required, prefix, error) {
        result := DllCall("webservices.dll\WsGetPrefixFromNamespace", "ptr*", writer, "ptr", ns, "int", required, "ptr", prefix, "ptr*", error, "int")
        return result
    }

    /**
     * Returns the current position of the writer. This can only be used on a writer that is set to an XmlBuffer. When writing to a buffer, the position represents the xml node before which new data will be placed.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node_position">WS_XML_NODE_POSITION</a> for more information on using positions.
     *       
     * 
     * It may be useful to call <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteendstartelement">WsWriteEndStartElement</a> to force an element to be committed before
     *         obtaining the position.
     * @param {Pointer<IntPtr>} writer The writer for which the current position will be obtained.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition The current position of the writer is returned here.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetwriterposition
     * @since windows6.1
     */
    static WsGetWriterPosition(writer, nodePosition, error) {
        result := DllCall("webservices.dll\WsGetWriterPosition", "ptr*", writer, "ptr", nodePosition, "ptr*", error, "int")
        return result
    }

    /**
     * Sets the current position of the writer. The position must have been obtained by a call to WsGetReaderPosition or WsGetWriterPosition.
     * @remarks
     * This can only be used on a writer that is set to an <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a>.
     *       
     * 
     * When writing to a buffer, the position represents the xml node before which new data will be placed.
     *       
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node_position">WS_XML_NODE_POSITION</a> for more information on using positions.
     * @param {Pointer<IntPtr>} writer The writer for which the current position will be set.
     * @param {Pointer<WS_XML_NODE_POSITION>} nodePosition The position to set the writer to.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetwriterposition
     * @since windows6.1
     */
    static WsSetWriterPosition(writer, nodePosition, error) {
        result := DllCall("webservices.dll\WsSetWriterPosition", "ptr*", writer, "ptr", nodePosition, "ptr*", error, "int")
        return result
    }

    /**
     * Moves the current position of the writer as specified by the moveTo parameter.
     * @remarks
     * This can only be used on a writer that is set to an <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a>.
     *       
     * 
     * If the found parameter is not <b>NULL</b>, then it will indicate there whether or not it could
     *         move to the requested node and return NOERROR.
     *       
     * 
     * If the found parameter is <b>NULL</b>, and the requested node is not found, it will return <b>WS_E_INVALID_FORMAT</b>.
     *       
     * 
     * Once positioned, the writer will then insert new data before the position specified.
     * @param {Pointer<IntPtr>} writer The writer to move.
     * @param {Integer} moveTo The relative position to move the writer.
     * @param {Pointer<Int32>} found If this is non-<b>NULL</b>, then whether or not the new position could be moved to is returned here.
     *         
     * 
     * If this is <b>NULL</b>, and the position could not be moved to, then the function will return <b>WS_E_INVALID_FORMAT</b>.
     *         (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsmovewriter
     * @since windows6.1
     */
    static WsMoveWriter(writer, moveTo, found, error) {
        result := DllCall("webservices.dll\WsMoveWriter", "ptr*", writer, "int", moveTo, "int*", found, "ptr*", error, "int")
        return result
    }

    /**
     * Removes leading and trailing whitespace from a sequence of characters.
     * @remarks
     * The function returns a pointer into the original string.  The original string passed in is not modified.
     *       
     * 
     * XML defines whitespace as characters 9 (0x9), 10 (0xA), 13 (0xD), and 32 (0x20).
     * @param {Pointer<Char>} chars The string to be trimmed.
     * @param {Integer} charCount The length of the string to be trimmed.
     * @param {Pointer<UInt16>} trimmedChars Returns a pointer into the original string starting at the first non-whitespace character.
     * @param {Pointer<UInt32>} trimmedCount Returns the length of the trimmed string.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wstrimxmlwhitespace
     * @since windows6.1
     */
    static WsTrimXmlWhitespace(chars, charCount, trimmedChars, trimmedCount, error) {
        chars := chars is String? StrPtr(chars) : chars

        result := DllCall("webservices.dll\WsTrimXmlWhitespace", "ptr", chars, "uint", charCount, "ptr", trimmedChars, "uint*", trimmedCount, "ptr*", error, "int")
        return result
    }

    /**
     * Verifies whether the input string is a valid XML NCName.
     * @param {Pointer<Char>} ncNameChars The string to be verified.
     * @param {Integer} ncNameCharCount The length of the <i>ncNameChars</i> string.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsverifyxmlncname
     * @since windows6.1
     */
    static WsVerifyXmlNCName(ncNameChars, ncNameCharCount, error) {
        ncNameChars := ncNameChars is String? StrPtr(ncNameChars) : ncNameChars

        result := DllCall("webservices.dll\WsVerifyXmlNCName", "ptr", ncNameChars, "uint", ncNameCharCount, "ptr*", error, "int")
        return result
    }

    /**
     * Compares two WS_XML_STRING objects for equality. The operation performs an ordinal comparison of the character values contained by the String objects.
     * @remarks
     * This function is typically used to compare localNames and namespaces in XML.
     * @param {Pointer<WS_XML_STRING>} string1 A pointer to the first string to compare.
     * @param {Pointer<WS_XML_STRING>} string2 A pointer to the second string to compare.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsxmlstringequals
     * @since windows6.1
     */
    static WsXmlStringEquals(string1, string2, error) {
        result := DllCall("webservices.dll\WsXmlStringEquals", "ptr", string1, "ptr", string2, "ptr*", error, "int")
        return result
    }

    /**
     * This function returns a namespace from the prefix to which it is bound.
     * @remarks
     * For the prefix "xml" it will return the namespace "http://www.w3.org/XML/1998/namespace".
     *       
     * 
     * For the prefix "xmlns" it will return the namespace "http://www.w3.org/2000/xmlns/".
     * @param {Pointer<IntPtr>} reader A pointer to the reader for which the prefix should be searched.
     * @param {Pointer<WS_XML_STRING>} prefix A pointer to the Prefix to search for.
     * @param {Integer} required The value of this Boolean parameter determines
     *           whether or not an error should be returned if a matching namespace is not found.
     * @param {Pointer<WS_XML_STRING>} ns A reference to a namespace to which the prefix is bound if successful.  The value returned is valid only until the writer advances.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetnamespacefromprefix
     * @since windows6.1
     */
    static WsGetNamespaceFromPrefix(reader, prefix, required, ns, error) {
        result := DllCall("webservices.dll\WsGetNamespaceFromPrefix", "ptr*", reader, "ptr", prefix, "int", required, "ptr", ns, "ptr*", error, "int")
        return result
    }

    /**
     * Reads a qualified name and separates it into its prefix, localName and namespace based on the current namespace scope of the XML_READER.
     * @param {Pointer<IntPtr>} reader The reader which should read the qualified name.
     * @param {Pointer<IntPtr>} heap The heap on which the resulting strings should be allocated.
     * @param {Pointer<WS_XML_STRING>} prefix The prefix of the qualified name is returned here.
     * @param {Pointer<WS_XML_STRING>} localName The localName of the qualified name is returned here.
     * @param {Pointer<WS_XML_STRING>} ns The namespace to which the qualified name is bound is returned here.
     * @param {Pointer<IntPtr>} error If the localName is missing the function will return <b>WS_E_INVALID_FORMAT</b>.  
     *           If the ns parameter is specified, but the prefix is not bound to a namespace, 
     *            <b>WS_E_INVALID_FORMAT</b> will be returned.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadqualifiedname
     * @since windows6.1
     */
    static WsReadQualifiedName(reader, heap, prefix, localName, ns, error) {
        result := DllCall("webservices.dll\WsReadQualifiedName", "ptr*", reader, "ptr*", heap, "ptr", prefix, "ptr", localName, "ptr", ns, "ptr*", error, "int")
        return result
    }

    /**
     * Finds the nearest xml attribute in scope with the specified localName and returns its value. The returned value is placed on the specified heap.
     * @remarks
     * This function may only be used to obtain the values of attributes in scope that use the prefix "xml".
     *       
     * 
     * If no matching xml attribute is found, a zero length string will be returned for the value, and the
     *         function returns S_FALSE.
     *       
     * 
     * The reader does not do anything with xml attributes other than to surface them for inspection.
     * @param {Pointer<IntPtr>} reader The reader for which the xml attribute will be searched.
     * @param {Pointer<WS_XML_STRING>} localName The localName of the xml attribute for which to search.
     * @param {Pointer<IntPtr>} heap The heap on which the resulting value should be allocated.
     * @param {Pointer<UInt16>} valueChars The value of the attribute is stored here.
     * @param {Pointer<UInt32>} valueCharCount The length of the valueChars.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetxmlattribute
     * @since windows6.1
     */
    static WsGetXmlAttribute(reader, localName, heap, valueChars, valueCharCount, error) {
        result := DllCall("webservices.dll\WsGetXmlAttribute", "ptr*", reader, "ptr", localName, "ptr*", heap, "ptr", valueChars, "uint*", valueCharCount, "ptr*", error, "int")
        return result
    }

    /**
     * Copies the current node from the specified XML reader to the specified XML writer.
     * @remarks
     * If the current node type is WS_XML_NODE_TYPE_ELEMENT,the current node,
     *         all its children, and the corresponding end element, are copied to the XML writer.
     *       
     * 
     * If the current node type is WS_XML_NODE_TYPE_BOF, nodes are copied
     *         until a node of type WS_XML_NODE_TYPE_EOF is reached.
     *       For information on node types, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_xml_node_type">WS_XML_NODE_TYPE</a> enumeration.
     * 
     * The reader will be positioned on the node following the node copied.
     * @param {Pointer<IntPtr>} writer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> to which to copy the XML node.
     * @param {Pointer<IntPtr>} reader Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a>   from which to copy the XML node.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscopynode
     * @since windows6.1
     */
    static WsCopyNode(writer, reader, error) {
        result := DllCall("webservices.dll\WsCopyNode", "ptr*", writer, "ptr*", reader, "ptr*", error, "int")
        return result
    }

    /**
     * Helper function for implementing an asynchronous operation.
     * @remarks
     * For an understanding of how WWSAPI handles asynchronous operations, see the <a href="https://docs.microsoft.com/windows/desktop/wsw/asynchronous-model">Asynchronous Model</a> topic. 
     * 
     * In many cases, an asynchronous operation is composed of other asynchronous operations. Each asynchronous operation may return WS_S_ASYNC indicating the callback will be invoked, or any other success or failure code, in which case the callback will not be invoked. The operation must be prepared to accept a <b>NULL</b> WS_ASYNC_CONTEXT indicating that the caller is requesting the operation to be performed synchronously. It must also ensure that the callback is invoked appropriately. In complex asynchronous operations,  <b>WsAsyncExecute</b> simplifies these details.
     * 
     * <b>WsAsyncExecute</b> operates by invoking a user-defined callback which can initiate an asynchrnous operation and indicate a function to be invoked when the asynchronous operation is complete. This sequence continues until the callback does not set another function to invoke. At this point, the callback specified by the WS_ASYNC_CONTEXT will be invoked if any of the operations completed asynchronously. 
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_state">WS_ASYNC_STATE</a> parameter is used by <b>WsAsyncExecute</b> to maintain its state, and is not intended to be initialized, inspected, or used by the caller. The caller however, must allocate the <b>WS_ASYNC_STATE</b> and ensure that it is kept alive during the entire asynchronous operation. The <b>WS_ASYNC_STATE</b> may be reused once the asynchronous operation is complete.
     * 
     * The examples <a href="https://docs.microsoft.com/windows/desktop/wsw/asyncadd3explicitexample">AsyncAdd3ExplicitExample</a> and <a href="https://docs.microsoft.com/windows/desktop/wsw/asyncadd3implicitexample">AsyncAdd3ImplicitExample</a> demonstrate implementing
     *                 the same asynchronous function manually using <b>WsAsyncExecute</b>.
     * @param {Pointer<WS_ASYNC_STATE>} asyncState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_state">WS_ASYNC_STATE</a> structure used during the asynchronous operation.  This is a state maintenance parameter not intended
     *                 for direct use.  The application must allocate  the <b>WS_ASYNC_STATE</b> structure and ensure that it 
     *                 is kept alive during the entire asynchronous operation.  The <b>WS_ASYNC_STATE</b> structure can be reused after an 
     *                 asynchronous operation has completed.
     * @param {Pointer<WS_ASYNC_FUNCTION>} operation Represents the initial asynchronous operation to be performed.
     * @param {Integer} callbackModel Indicates whether the callback is being invoked long or short.
     *                 For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_callback_model">WS_CALLBACK_MODEL</a>
     * @param {Pointer<Void>} callbackState A void pointer to a user-defined value that is passed to each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_async_function">WS_ASYNC_FUNCTION</a>.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsasyncexecute
     * @since windows6.1
     */
    static WsAsyncExecute(asyncState, operation, callbackModel, callbackState, asyncContext, error) {
        result := DllCall("webservices.dll\WsAsyncExecute", "ptr", asyncState, "ptr", operation, "int", callbackModel, "ptr", callbackState, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Creates a channel for message exchange with an endpoint.
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenchannel">WsOpenChannel</a> function to initiate  communication on the channel and to specify the endpoint.
     *             
     * 
     * When you create a custom channel (using the WS_CUSTOM_CHANNEL_BINDING value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> enumeration), you can specify only the following channel properties: 
     * 
     * <ul>
     * <li>WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_CALLBACKS </li>
     * <li>WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS</li>
     * </ul>(See the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ID</a> enumeration) If initial properties are required to create the custom channel, specify them by using the WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS property. 
     * 
     * 
     * 
     * To pass security information to a custom channel implementation, use the WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS value of the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ID</a> enumeration.
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
     * @param {Pointer<IntPtr>} channel Pointer that receives the address of the created channel.   
     *                     When the channel  is no longer needed, you must free  it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreechannel">WsFreeChannel</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatechannel
     * @since windows6.1
     */
    static WsCreateChannel(channelType, channelBinding, properties, propertyCount, securityDescription, channel, error) {
        result := DllCall("webservices.dll\WsCreateChannel", "int", channelType, "int", channelBinding, "ptr", properties, "uint", propertyCount, "ptr", securityDescription, "ptr", channel, "ptr*", error, "int")
        return result
    }

    /**
     * Open a channel to an endpoint.
     * @remarks
     * If the open is successful, then the channel must be closed using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsclosechannel">WsCloseChannel</a> before it can be freed.
     *             
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">WsCreateChannel</a> to create the channel.
     *             
     * 
     * Once a channel has been opened to an endpoint, then all communication
     *                 occurs with that endpoint.
     *             
     * 
     * The endpoint address and its contents are not required after the 
     *                 function returns, even if the function is invoked asynchronously 
     *                 (for example, it can safely be declared on the stack).
     *             
     * 
     * Whether any IO actually happens during this call will depend on the
     *                 type of channel and its settings.
     * @param {Pointer<IntPtr>} channel The channel to open.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} endpointAddress The address of the endpoint.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsopenchannel
     * @since windows6.1
     */
    static WsOpenChannel(channel, endpointAddress, asyncContext, error) {
        result := DllCall("webservices.dll\WsOpenChannel", "ptr*", channel, "ptr", endpointAddress, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Send a message on a channel using serialization to write the body element.
     * @remarks
     * To include custom headers with the message, initialize the message <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsinitializemessage">WsInitializeMessage</a> with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_initialization">WS_BLANK_MESSAGE</a> and then add the headers using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsaddcustomheader">WsAddCustomHeader</a> 
     *                 before calling this function.
     * @param {Pointer<IntPtr>} channel The channel to send the message on.
     * @param {Pointer<IntPtr>} message The message object to use for sending.
     *                 
     * 
     * The message object must be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a> or
     *                   <b>WS_MESSAGE_STATE_INITIALIZED</b>.
     * @param {Pointer<WS_MESSAGE_DESCRIPTION>} messageDescription The action field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used as the
     *                     action header for the message.  This field may be <b>NULL</b> if no action
     *                     is required.
     *                 
     * 
     * The bodyElementDescription field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used to serialize the body of the message.  This field may be 
     *                     <b>NULL</b> if no body element is desired.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a> for
     *                     information about how the bodyElementDescription is used to serialize
     *                     the value.
     * @param {Integer} writeOption Whether the body element is required, and how the value is allocated. This is used
     *                     only when a body element is desired. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> and 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a>.
     * @param {Pointer} bodyValue The value to serialize in the body of the message.
     * @param {Integer} bodyValueSize The size of the value being serialized, in bytes.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssendmessage
     * @since windows6.1
     */
    static WsSendMessage(channel, message, messageDescription, writeOption, bodyValue, bodyValueSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsSendMessage", "ptr*", channel, "ptr*", message, "ptr", messageDescription, "int", writeOption, "ptr", bodyValue, "uint", bodyValueSize, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Receive a message and deserialize the body of the message as a value.
     * @remarks
     * This function uses metadata about the expected message types in order to deserialize the body.  
     *                 The metadata is an array of of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a>s.
     *                 Each message description contains an action value, which is used to match against
     *                 the action of the message, and an <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_element_description">WS_ELEMENT_DESCRIPTION</a> which provides the metadata for the body element.
     *             
     * 
     * When the message headers have been received, the function will scan the array
     *                 in order to find a match against the action.  The first message description
     *                 that matches is used to deserialize the body, and the zero-based index 
     *                 of this message description in the array is returned in the index out parameter.
     *                 If the function succeeds, the index out parameter will always be set to indicate which
     *                 message description was used.
     *             
     * 
     * In order for a message description to match, the action value must match that of
     *                 the message exactly.  If the action in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> 
     *                 is <b>NULL</b>, then the action always matches.  This can be used in the case where there 
     *                 is no action header in the received message, or if the body is always the same no matter 
     *                 what the action is.
     *             
     * 
     * If the body is expected to be empty, the bodyElementDescription field of the 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> may be <b>NULL</b>.
     *             
     * 
     * If the bodyElementDescription is non-<b>NULL</b>, then this function deserializes the 
     *                 body as described in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbody">WsReadBody</a>.
     *             
     * 
     * After a message has been received, its headers can be inspected using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetheader">WsGetHeader</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetcustomheader">WsGetCustomHeader</a>.
     * @param {Pointer<IntPtr>} channel The channel to receive from.
     * @param {Pointer<IntPtr>} message The message object used to receive.
     *                 
     * 
     * The message should be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a> state.
     * @param {Pointer<WS_MESSAGE_DESCRIPTION>} messageDescriptions An array of pointers to message descriptions that specifies the metadata for
     *                     the expected types of messages.
     * @param {Integer} messageDescriptionCount The number of items in the messageDescriptions array.
     * @param {Integer} receiveOption Whether the message is required.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_receive_option">WS_RECEIVE_OPTION</a> for more information.
     * @param {Integer} readBodyOption Whether the body element is required, and how to allocate the value.  
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<IntPtr>} heap The heap to store the deserialized values in.  If the heap is 
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
     * @param {Pointer<UInt32>} index If <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_receive_option">WS_RECEIVE_OPTIONAL_MESSAGE</a> is specified for the receiveOption
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
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * The receive option <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_receive_option">WS_RECEIVE_OPTIONAL_MESSAGE</a> was specified and
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
     *                     <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgeterrorproperty">WsGetErrorProperty</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreceivemessage
     * @since windows6.1
     */
    static WsReceiveMessage(channel, message, messageDescriptions, messageDescriptionCount, receiveOption, readBodyOption, heap, value, valueSize, index, asyncContext, error) {
        result := DllCall("webservices.dll\WsReceiveMessage", "ptr*", channel, "ptr*", message, "ptr", messageDescriptions, "uint", messageDescriptionCount, "int", receiveOption, "int", readBodyOption, "ptr*", heap, "ptr", value, "uint", valueSize, "uint*", index, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Used to send a request message and receive a correlated reply message.
     * @remarks
     * The messages are correlated as appropriate to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION</a>.
     *                 See <a href="https://docs.microsoft.com/windows/desktop/wsw/channel-layer-overview">Channel Layer Overview</a> for more information about correlating
     *                 request reply messages.
     * @param {Pointer<IntPtr>} channel The channel to do the request-reply operation on.
     * @param {Pointer<IntPtr>} requestMessage The message object to use to send the request.
     *                 
     * 
     * The message object should be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a> or
     *                     <b>WS_MESSAGE_STATE_INITIALIZED</b>.
     * @param {Pointer<WS_MESSAGE_DESCRIPTION>} requestMessageDescription The action field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used as the
     *                     action header for the request message.  This field may be <b>NULL</b> if no action
     *                     is required.
     *                 
     * 
     * The bodyElementDescription field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used to serialize the body of the request message.  This field may be 
     *                     <b>NULL</b> if no body element is desired.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a> for
     *                     information about how the body is serialized according to the bodyElementDescription.
     * @param {Integer} writeOption Whether the body element is required, and how the value is allocated.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} requestBodyValue A pointer to the value to serialize in the body of the request object.
     * @param {Integer} requestBodyValueSize The size of the request value being serialized, in bytes.
     * @param {Pointer<IntPtr>} replyMessage The message object to use to receive the reply.
     *                 
     * 
     * The message object should be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<WS_MESSAGE_DESCRIPTION>} replyMessageDescription The action field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used to verify
     *                     the action header of the received reply message.  This field may be <b>NULL</b> if no action
     *                     is required.  If <b>NULL</b>, the action header of the received message is ignored
     *                     if present.
     *                 
     * 
     * The bodyElementDescription field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used to deserialize the body of the reply message.  This field may be 
     *                     <b>NULL</b> if no body element is desired.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbody">WsReadBody</a> for 
     *                     information about how the body is deserialized according to the bodyElementDescription.
     * @param {Integer} readOption Whether the reply body element is required, and how to allocate the value.                    For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbody">WsReadBody</a>.
     * @param {Pointer<IntPtr>} heap The heap used to allocate deserialized reply body values.
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
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     *                     <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgeterrorproperty">WsGetErrorProperty</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsrequestreply
     * @since windows6.1
     */
    static WsRequestReply(channel, requestMessage, requestMessageDescription, writeOption, requestBodyValue, requestBodyValueSize, replyMessage, replyMessageDescription, readOption, heap, value, valueSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsRequestReply", "ptr*", channel, "ptr*", requestMessage, "ptr", requestMessageDescription, "int", writeOption, "ptr", requestBodyValue, "uint", requestBodyValueSize, "ptr*", replyMessage, "ptr", replyMessageDescription, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Sends a message which is a reply to a received message.
     * @remarks
     * The reply message will including correlation information as appropriate 
     *                 to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION</a>.  See <a href="https://docs.microsoft.com/windows/desktop/wsw/channel-layer-overview">Channel Layer Overview</a> 
     *                 for more information about correlating request reply messages.
     * @param {Pointer<IntPtr>} channel A pointer to the <b>Channel</b> object on which to send the reply Message.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> object.
     * @param {Pointer<IntPtr>} replyMessage A pointer to the <b>Message</b> object for sending the reply.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     *                 
     * Message object state must be set to <b>WS_MESSAGE_STATE_EMPTY</b>  or <b>WS_MESSAGE_STATE_INITIALIZED</b>.
     * 
     * <div class="alert"><b>Note</b>  If an initialized message is provided it must be initialized using <b>WS_REPLY_MESSAGE</b> or <b>WS_FAULT_MESSAGE</b>.
     * </div>
     * <div> </div>
     * @param {Pointer<WS_MESSAGE_DESCRIPTION>} replyMessageDescription A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> object.  The <b>action</b> field of <b>WS_MESSAGE_DESCRIPTION</b> is used as the <b>action</b> header for the reply message.  This field can be <b>NULL</b> if no action is required.
     *                 
     * 
     * The <b>bodyElementDescription</b>  field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_description">WS_MESSAGE_DESCRIPTION</a> is used to serialize the body of the reply message.  This field may be <b>NULL</b> if no body element is desired.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a> for information about how the <b>bodyElementDescription</b> is used to serialize a value.
     * @param {Integer} writeOption Determines whether the body element is required, and how the value is allocated.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} replyBodyValue A void pointer to the value to serialize in the reply message.
     * @param {Integer} replyBodyValueSize The size  in bytes of the reply value being serialized.
     * @param {Pointer<IntPtr>} requestMessage A pointer to a WS_MESSAGE object encapsulating the request message text.  This is used to obtain correlation information used in formulating the reply message.
     * 
     * <div class="alert"><b>Note</b>  The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b>.
     * </div>
     * <div> </div>
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure with information about invoking the function asynchronously.  A <b>NULL</b> value indicates a request for synchronous operation.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssendreplymessage
     * @since windows6.1
     */
    static WsSendReplyMessage(channel, replyMessage, replyMessageDescription, writeOption, replyBodyValue, replyBodyValueSize, requestMessage, asyncContext, error) {
        result := DllCall("webservices.dll\WsSendReplyMessage", "ptr*", channel, "ptr*", replyMessage, "ptr", replyMessageDescription, "int", writeOption, "ptr", replyBodyValue, "uint", replyBodyValueSize, "ptr*", requestMessage, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Sends a fault message given a WS_ERROR object.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault">WS_FAULT</a> that is sent in the body of the message
     *                 is constructed using the same rules as defined by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatefaultfromerror">WsCreateFaultFromError</a>.
     *             
     * 
     * The value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_ACTION_HEADER</a> used for
     *                 the reply message is computed as follows:
     *             
     * 
     * <ul>
     * <li>If the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_ADDRESSING_VERSION</a> of the 
     *                 channel is <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION_TRANSPORT</a>, then no
     *                 action is included in the message because the addressing
     *                 version does not permit an action value for faults.
     *                 </li>
     * <li>If the error object contains an action string (the
     *                 length of the string returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_fault_error_property_id">WS_FAULT_ERROR_PROPERTY_ACTION</a> is greater than zero), then the action string is used.
     *                 </li>
     * <li>If the error object does not contain an action, then 
     *                 a default action value is supplied.
     *             </li>
     * </ul>
     * If the error object contains a header used to describe the
     *                 fault as specified by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_fault_error_property_id">WS_FAULT_ERROR_PROPERTY_HEADER</a>,
     *                 then the header is added to the headers of the fault message.
     *             
     * 
     * The fault message will include correlation information as appropriate
     *                 to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION</a>.  See <a href="https://docs.microsoft.com/windows/desktop/wsw/channel-layer-overview">Channel Layer Overview</a> for more information about correlating request reply messages.
     *             
     * 
     * If sending a fault without a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object, use
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssendreplymessage">WsSendReplyMessage</a>.
     *             
     * 
     * To add custom headers to the message, initialize the message <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsinitializemessage">WsInitializeMessage</a> with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_initialization">WS_FAULT_MESSAGE</a> and then add the headers using 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsaddcustomheader">WsAddCustomHeader</a> before calling this function.
     * @param {Pointer<IntPtr>} channel The channel to send the message on.
     * @param {Pointer<IntPtr>} replyMessage A message object to use to send the reply message.
     *                 
     * 
     * The message object should be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a> or
     *                     <b>WS_MESSAGE_STATE_INITIALIZED</b>.  If an initialized message is provided,
     *                     it should have been initialized using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_initialization">WS_FAULT_MESSAGE</a>.
     * @param {Pointer<IntPtr>} faultError The error object to use to construct the fault.
     * @param {Integer} faultErrorCode The error code associated with the fault.  This cannot
     *                     be a success code.
     *                 
     * 
     * This error code is never included in the fault message directly, but 
     *                     instead is used as a fallback mechanism for creating a fault string in the case that
     *                     the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object does not contain any error strings.
     * @param {Integer} faultDisclosure Controls how much of the error information is included in the fault message.
     * @param {Pointer<IntPtr>} requestMessage The request message.  This is used to obtain correlation information used
     *                     in formulating the reply message.
     *                 
     * 
     * The message can be in any state but <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssendfaultmessageforerror
     * @since windows6.1
     */
    static WsSendFaultMessageForError(channel, replyMessage, faultError, faultErrorCode, faultDisclosure, requestMessage, asyncContext, error) {
        result := DllCall("webservices.dll\WsSendFaultMessageForError", "ptr*", channel, "ptr*", replyMessage, "ptr*", faultError, "int", faultErrorCode, "int", faultDisclosure, "ptr*", requestMessage, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Retrieves a property of the Channel referenced by the channel parameter.
     * @param {Pointer<IntPtr>} channel A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> object with the property to retrieve.
     * @param {Integer} id Represents an identifier of the property to retrieve.
     * @param {Pointer} value A void pointer referencing the location to store the retrieved property.
     *                     <div class="alert"><b>Note</b>  The pointer must have an alignment compatible with the type
     *                     of the property.
     *                 </div>
     * <div> </div>
     * @param {Integer} valueSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetchannelproperty
     * @since windows6.1
     */
    static WsGetChannelProperty(channel, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetChannelProperty", "ptr*", channel, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Sets a property of the channel.
     * @param {Pointer<IntPtr>} channel A pointer to the <b>Channel</b> on which to set the property and may not be <b>NULL</b>.
     * @param {Integer} id Identifier of the property to set.
     * @param {Pointer} value A void pointer to the property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes of of the property value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetchannelproperty
     * @since windows6.1
     */
    static WsSetChannelProperty(channel, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsSetChannelProperty", "ptr*", channel, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Write out all the headers of the message to the channel, and prepare to write the body elements.
     * @remarks
     * The start of the message, including the current set of headers that exist in the message, 
     *                 are written to the channel.
     *             
     * 
     * This function is like <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteenvelopestart">WsWriteEnvelopeStart</a> but is used with channels.
     *             
     * 
     * The message must be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_INITIALIZED</a> state.  Upon success,
     *                 the message will have transitioned to <b>WS_MESSAGE_STATE_WRITING</b> state.
     *             
     * 
     * To serialize an element of the message body, use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a>.  To write
     *                 directly to the XML Writer of the message, first get the reader using
     *                 the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_property_id">WS_MESSAGE_PROPERTY_BODY_WRITER</a> property.
     *             
     * 
     * If the channel output is streamed (<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_STREAMED_OUTPUT_TRANSFER_MODE</a>), then
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsflushbody">WsFlushBody</a> must be called to actually transmit each part of the body.
     * @param {Pointer<IntPtr>} channel The channel to use to write the message.
     * @param {Pointer<IntPtr>} message The message to write.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritemessagestart
     * @since windows6.1
     */
    static WsWriteMessageStart(channel, message, asyncContext, error) {
        result := DllCall("webservices.dll\WsWriteMessageStart", "ptr*", channel, "ptr*", message, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Write the closing elements of the message to the channel.
     * @remarks
     * This function writes the end of the message, including the element that closes the body
     *                 tag and the envelope tag.
     *             
     * 
     * The message must be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_WRITING</a> state.  Upon success, it will
     *                 transition to <b>WS_MESSAGE_STATE_DONE</b> state.
     * @param {Pointer<IntPtr>} channel The channel to write to.
     * @param {Pointer<IntPtr>} message The message to write.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritemessageend
     * @since windows6.1
     */
    static WsWriteMessageEnd(channel, message, asyncContext, error) {
        result := DllCall("webservices.dll\WsWriteMessageEnd", "ptr*", channel, "ptr*", message, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Read the headers of the next message from the channel, and prepare to read the body elements.
     * @remarks
     * This reads the start of the next message from the channel, including the headers of
     *                 the message.
     *             
     * 
     * This function is like <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadenvelopestart">WsReadEnvelopeStart</a> but is used with channels.
     *             
     * 
     * Upon success, the headers will be stored in the message and can be accessed in a random-access
     *                 fashion (for example, using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetheader">WsGetHeader</a>).
     *             
     * 
     * The message must be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a> state.  Upon success,
     *                 the message will have transitioned to <b>WS_MESSAGE_STATE_READING</b> state.
     *             
     * 
     * To deserialize an element of the message body, use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbody">WsReadBody</a>.  To read
     *                 directly from the XML Reader of the message, first get the reader using
     *                 the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_property_id">WS_MESSAGE_PROPERTY_BODY_READER</a> property.
     *             
     * 
     * If the channel input is streamed (<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_STREAMED_INPUT_TRANSFER_MODE</a>), then
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfillbody">WsFillBody</a> must be called to receive the next part of the body before
     *                 it is actually read.
     * @param {Pointer<IntPtr>} channel The channel to receive from.
     * @param {Pointer<IntPtr>} message The message to receive into.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadmessagestart
     * @since windows6.1
     */
    static WsReadMessageStart(channel, message, asyncContext, error) {
        result := DllCall("webservices.dll\WsReadMessageStart", "ptr*", channel, "ptr*", message, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Read the closing elements of a message from a channel.
     * @remarks
     * The message must be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_READING</a> state.  Upon success, it will
     *                 transition to <b>WS_MESSAGE_STATE_DONE</b> state.
     *             
     * 
     * When streaming input is used (<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_STREAMED_INPUT_TRANSFER_MODE</a>), 
     *                 the channel will automatically make sure that there are bytes available before reading the 
     *                 end of the message (the closing body and envelope tags).
     * @param {Pointer<IntPtr>} channel The channel to receive for.
     * @param {Pointer<IntPtr>} message The message to read the end of.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadmessageend
     * @since windows6.1
     */
    static WsReadMessageEnd(channel, message, asyncContext, error) {
        result := DllCall("webservices.dll\WsReadMessageEnd", "ptr*", channel, "ptr*", message, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Closes a specified channel.
     * @remarks
     * If you open a channel or successfully accept a channel, you must close it when it is no longer needed. After a channel has been closed, the associated resources can safely be  freed.
     * 
     * The channel-closing process will wait for any already initiated, pending I/O to complete. 
     * 
     * 
     * 
     * If there are no messages currently being read or written for the channel, the channel attempts a graceful shutdown. Otherwise, all I/O still pending on the channel itself is aborted and the channel does a rude shutdown. 
     * 
     * If the channel attempts a graceful shutdown but encounters an error, <b>WsCloseChannel</b> will return an error, but the channel will still be closed. 
     * 
     * 
     * 
     * This operation is allowed only if the channel is in WS_CHANNEL_STATE_OPEN or WS_CHANNEL_STATE_FAULTED states.
     * 
     * Closing a channel automatically disassociates any messages that are in the
     *                 process of being read or written. Therefore, it is not necessary to call 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabandonmessage">WsAbandonMessage</a> before calling <b>WsCloseChannel</b>).
     * @param {Pointer<IntPtr>} channel Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> structure representing the channel to close.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure containing information for invoking the function asynchronously.  Pass a <b>NULL</b> 
     *                  value to call the function synchronously.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  where additional error information is stored if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * The channel closure was aborted by a call to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortchannel">WsAbortChannel</a> while the channel was closing.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsclosechannel
     * @since windows6.1
     */
    static WsCloseChannel(channel, asyncContext, error) {
        result := DllCall("webservices.dll\WsCloseChannel", "ptr*", channel, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Cancels all pending I/O for a specified channel.
     * @remarks
     * <b>Windows Server 2003 and before:  </b>On Windows platforms before Windows Vista, this function is not supported for WS_UDP_CHANNEL_BINDING or WS_HTTP_CHANNEL_BINDING  if the channel is in the WS_CHANNEL_STATE_ACCEPTING state and the listener has not already been aborted. 
     * 
     * (For information on channel bindings and channel states, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE</a> enumerations.)<p class="note"> This function is also not supported for WS_HTTP_CHANNEL_BINDING with WS_CHANNEL_TYPE_REPLY when aborting a channel  in the WS_CHANNEL_STATE_OPEN or WS_CHANNEL_STATE_FAULTED state. (For information on channel types, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE</a> enumeration.
     * 
     * 
     * 
     * 
     * 
     * <b>WsAbortChannel</b> can be called for a channel in any state, and does not wait for pending I/O to complete before aborting the channel.
     *             
     *                 
     * 
     * If the channel is in the   <b>WS_CHANNEL_STATE_OPEN</b> state, <b>WsAbortChannel</b> causes the channel to fault to the <b>WS_CHANNEL_STATE_FAULTED</b> state. <div class="alert"><b>Note</b>  See 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabandonmessage">WsAbandonMessage</a> for information on how to skip a particular
     *                 message and keep the channel open.
     *             </div>
     * <div> </div>If called with valid parameters, this function will not fail for reasons such as a lack of system resources. However, note the limitations on some operating systems versions at the beginning of Remarks.
     * @param {Pointer<IntPtr>} channel A   pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a>  structure representing the channel for which 
     *                     to cancel I/O.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsabortchannel
     * @since windows6.1
     */
    static WsAbortChannel(channel, error) {
        result := DllCall("webservices.dll\WsAbortChannel", "ptr*", channel, "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory resource associated with a Channel object.
     * @remarks
     * A channel that is in the process of being accepted/opened cannot be released until the accept/open completes.  Use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortchannel">WsAbortChannel</a> to cancel the accept/open process.
     * @param {Pointer<IntPtr>} channel A pointer to the <b>Channel</b> object to release. The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> object returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">WsCreateChannel</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a>. The referenced value may not be <b>NULL</b>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreechannel
     * @since windows6.1
     */
    static WsFreeChannel(channel) {
        result := DllCall("webservices.dll\WsFreeChannel", "ptr*", channel)
        return result
    }

    /**
     * Reset a channel so it can be reused.
     * @remarks
     * Reusing a channel instead of creating one from scratch may improve performance.
     *             
     * 
     * This function is only valid when the channel is in the either the
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE_CREATED</a> or <b>WS_CHANNEL_STATE_CLOSED</b> state.
     *             
     * 
     * If called correctly, this function will not fail (for example, due to lack of system resources).
     * @param {Pointer<IntPtr>} channel The channel to reset.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsresetchannel
     * @since windows6.1
     */
    static WsResetChannel(channel, error) {
        result := DllCall("webservices.dll\WsResetChannel", "ptr*", channel, "ptr*", error, "int")
        return result
    }

    /**
     * Skips the remainder of a specified message on a specified channel.
     * @remarks
     * <b>WsAbandonMessage</b> is used to skip reading or writing the remaining contents of a message, 
     *                 allowing the next message for the channel to be read or written.  In this respect, it is an alternative to 
     *                 the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessageend">WsReadMessageEnd</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessageend">WsWriteMessageEnd</a> functions, as shown in the following
     *                 state diagram:
     *             
     * :::image type="content" source="./images/AbandonMessage.png" border="false" alt-text="Diagram showing how the state transitions caused by the WsAbandonMessage function differ from the WSReadMessageEnd and WsWriteMessageEnd functions.":::
     * 
     * For read operations, an application typically calls <b>WsAbandonMessage</b> when it is unnecessary for the application to continue reading the 
     *                 message data, for example, if the
     *                 message does not meet the application's requirements.  This function can also be used 
     *                 if the message contains malformed XML or if the <a href="https://docs.microsoft.com/windows/desktop/wsw/xml-reader">XML reader</a> has 
     *                 generated an error while reading the message.  
     * 
     * If the channel is streamed 
     *                 (see the WS_STREAMED_INPUT_TRANSFER_MODE value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_TRANSFER_MODE</a> enumeration),  the remainder of the 
     *                 streamed message data is read and automatically discarded with the next call to 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessagestart">WsReadMessageStart</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsclosechannel">WsCloseChannel</a> for the 
     *                 channel.  If the channel is not streamed, the unread buffered message data 
     *                 is simply discarded.
     *             
     * 
     * For write operations, an application typically calls <b>WsAbandonMessage</b> when the application cannot continue writing the message because it has encountered some error, such as one returned by the <a href="https://docs.microsoft.com/windows/desktop/wsw/xml-writer">XML writer</a>, or must stop generating the message for some other reason.  
     * 
     * If the 
     *                 channel is streamed (see the WS_STREAMED_INPUT_TRANSFER_MODE value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_TRANSFER_MODE</a> enumeration), the message data will be truncated and may result in errors when read by the 
     *                 remote party.  If the channel is not streamed,  the buffered data for the 
     *                 message is simply  discarded (since it was never transmitted).
     *             
     * 
     * This function allows the user of the channel to keep the channel open and 
     *                 send or receive additional messages (such as sending a fault), even though 
     *                 an error occurred.  In contrast, <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortchannel">WsAbortChannel</a> will causes 
     *                 the channel to fault.  A typical usage is first to try to abandon the message and
     *                 send a fault.  If that fails,  the channel can be aborted.
     *             
     * 
     * This function does not perform any blocking I/O.
     *             
     * 
     * This function is only valid when the channel is in the WS_CHANNEL_STATE_OPEN 
     *                  or WS_CHANNEL_STATE_FAULTED states.
     *             (For channel states, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE</a> enumeration.)
     * 
     * The message specified must be the current message being read or the current message being written
     *                 for the specified channel.
     *             
     * 
     * If called correctly, this function will not fail (for example, due to lack of system resources).
     * @param {Pointer<IntPtr>} channel Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> structure representing the channel on which the message is being read or written.
     * @param {Pointer<IntPtr>} message Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure representing the message to abandon.  This should be
     *                     the same message that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessagestart">WsWriteMessageStart</a> 
     *                     or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadmessagestart">WsReadMessageStart</a> function.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     *                 (For channel states, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE</a> enumeration.)
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsabandonmessage
     * @since windows6.1
     */
    static WsAbandonMessage(channel, message, error) {
        result := DllCall("webservices.dll\WsAbandonMessage", "ptr*", channel, "ptr*", message, "ptr*", error, "int")
        return result
    }

    /**
     * Used to signal the end of messages for a session channel.
     * @remarks
     * This function will indicate to the remote party that all
     *                 messages have been sent for the channel.
     *             
     * 
     * The remote party can detect that no more messages are available on the channel by 
     *                 looking for the <b>WS_S_END</b> return value when receiving a message. (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.) However, 
     *                 messages can also become unavailable if the non-application messages were filtered by 
     *                 the channel as described in <a href="https://docs.microsoft.com/windows/desktop/wsw/channel-layer-overview">Channel Layer Overview</a>. Session shutdown can 
     *                 be distinguished from message filtering by keeping track of whether prior messages were 
     *                 received. If prior messages were received then the session was shut down.
     * 
     * 
     * This function only applies to channels created with a
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE</a> with a session that support
     *                 sending of messages:
     *             
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_OUTPUT_SESSION</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE_DUPLEX_SESSION</a>
     * </li>
     * </ul>
     * The channel must be in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE_OPEN</a> state.
     *             
     * 
     * If this function is successful, the value of the
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_property_id">WS_CHANNEL_PROPERTY_IS_SESSION_SHUT_DOWN</a> property
     *                 will be <b>TRUE</b>.
     *             
     * 
     * Once a session channel has been shut down, attempting
     *                 to send a message on the channel or attempting to shut down
     *                 the channel will return <b>WS_E_INVALID_OPERATION</b>.
     *             
     * 
     * Calling this function is optional.  When a session channel is closed using 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsclosechannel">WsCloseChannel</a> when in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE_OPEN</a>,
     *                 then the channel is automatically shut down as part of the close process.
     * @param {Pointer<IntPtr>} channel The session channel to shut down.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * This is returned if the channel is not in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE_OPEN</a> state.
     *                 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsshutdownsessionchannel
     * @since windows6.1
     */
    static WsShutdownSessionChannel(channel, asyncContext, error) {
        result := DllCall("webservices.dll\WsShutdownSessionChannel", "ptr*", channel, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Returns a property of the specified operation context. It should be noted that the validity of these property is limited to the lifetime of the operation context itself.
     * @param {Pointer<IntPtr>} context The context that the property value is being obtained for.
     * @param {Integer} id The id of the property.
     * @param {Pointer} value The address to place the retrieved value. The contents are not modified in case of a failure.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size of the buffer that the caller has allocated for the retrieved value.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetoperationcontextproperty
     * @since windows6.1
     */
    static WsGetOperationContextProperty(context, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetOperationContextProperty", "ptr*", context, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Retrieves an XML Dictionary object. The retrieved Dictionary is returned by the dictionary reference parameter.
     * @param {Integer} encoding Indicates an enumeration of the Dictionary encoding.
     * @param {Pointer<WS_XML_DICTIONARY>} dictionary A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_dictionary">WS_XML_DICTIONARY</a> structure for the retrieved <b>Dictionary</b>.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetdictionary
     * @since windows6.1
     */
    static WsGetDictionary(encoding, dictionary, error) {
        result := DllCall("webservices.dll\WsGetDictionary", "int", encoding, "ptr", dictionary, "ptr*", error, "int")
        return result
    }

    /**
     * Reads an extension of the WS_ENDPOINT_ADDRESS.
     * @remarks
     * The returned value is valid until the heap is freed or reset.
     *             
     * 
     * If the requested extension type appears more than once in the
     *                 extensions buffer, then the first instance is returned.
     * @param {Pointer<IntPtr>} reader The XML reader to use to read the extension.
     *                 
     * 
     * The function will automatically set the input of
     *                     the reader as necessary to read the extensions.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} endpointAddress The endpoint address containing the extensions.
     * @param {Integer} extensionType The type of extension to read.
     * @param {Integer} readOption Whether the value is required, and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<IntPtr>} heap The heap to use to store the value that is read.
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
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadendpointaddressextension
     * @since windows6.1
     */
    static WsReadEndpointAddressExtension(reader, endpointAddress, extensionType, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadEndpointAddressExtension", "ptr*", reader, "ptr", endpointAddress, "int", extensionType, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Creates an error object that can passed to functions to record rich error information.
     * @remarks
     * When you no long need the error object, free it by calling  the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeerror">WsFreeError</a> function.
     *             
     * 
     * By default, the
     *                 language of any language-dependent information in the error object is  the current 
     *                 user default UI language. However, you can change the language by setting 
     *                 the WS_ERROR_PROPERTY_LANGID property. See the the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_ID</a> enumeration.
     * @param {Pointer<WS_ERROR_PROPERTY>} properties An array of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_error_property">WS_ERROR_PROPERTY</a> structures containing optional error properties.
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<IntPtr>} error On success, a pointer that receives the address of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure representing the created error object.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreateerror
     * @since windows6.1
     */
    static WsCreateError(properties, propertyCount, error) {
        result := DllCall("webservices.dll\WsCreateError", "ptr", properties, "uint", propertyCount, "ptr", error, "int")
        return result
    }

    /**
     * Adds a specified error string to the error object.
     * @remarks
     * This function requires that the string be in the language specified by the LANGID of the 
     *                 error object.  You can retrieve this LANGID value by calling the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgeterrorproperty">WsGetErrorProperty</a> function with the WS_ERROR_PROPERTY_LANGID value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_ID</a> enumeration.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure representing the error object to which to add the string.
     * @param {Pointer<WS_STRING>} string The string to add.  The error object will
     *                     make a copy of the string.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsadderrorstring
     * @since windows6.1
     */
    static WsAddErrorString(error, string) {
        result := DllCall("webservices.dll\WsAddErrorString", "ptr*", error, "ptr", string, "int")
        return result
    }

    /**
     * Retrieves an error string from an error object.
     * @remarks
     * The string is in the language specified by the LANGID property of
     *                 the error object.  This can be retrieved using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgeterrorproperty">WsGetErrorProperty</a> with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_LANGID</a>.
     * @param {Pointer<IntPtr>} error The error object containing the string.
     * @param {Integer} index The zero-based index identifying the string to retrieve.  The first
     *                     error string (index 0) will be the string most recently added to the
     *                     error object (using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsadderrorstring">WsAddErrorString</a>). When 
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_ORIGINAL_ERROR_CODE</a> is presented in the 
     *                     error object, the corresponding error text will be available in the last index.
     *                 
     * 
     * The number of errors can be retrieved using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_STRING_COUNT</a>.
     * @param {Pointer<WS_STRING>} string The returned string.  The string is valid until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreseterror">WsResetError</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeerror">WsFreeError</a> is called.
     *                 
     * 
     * The string is not zero terminated.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgeterrorstring
     * @since windows6.1
     */
    static WsGetErrorString(error, index, string) {
        result := DllCall("webservices.dll\WsGetErrorString", "ptr*", error, "uint", index, "ptr", string, "int")
        return result
    }

    /**
     * Copies an error object from a specified source to a specified destination.
     * @param {Pointer<IntPtr>} source Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure representing the error object to copy.
     * @param {Pointer<IntPtr>} destination Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives the copied error object.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscopyerror
     * @since windows6.1
     */
    static WsCopyError(source, destination) {
        result := DllCall("webservices.dll\WsCopyError", "ptr*", source, "ptr*", destination, "int")
        return result
    }

    /**
     * Retrieves a property of a WS_ERROR object referenced by the error parameter.
     * @param {Pointer<IntPtr>} error A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object with the property to retrieve.
     * @param {Integer} id An identifier of the property to retrieve.
     * @param {Pointer} buffer A pointer referencing the location to store the retrieved property.
     * @param {Integer} bufferSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgeterrorproperty
     * @since windows6.1
     */
    static WsGetErrorProperty(error, id, buffer, bufferSize) {
        result := DllCall("webservices.dll\WsGetErrorProperty", "ptr*", error, "int", id, "ptr", buffer, "uint", bufferSize, "int")
        return result
    }

    /**
     * Sets a WS_ERROR object property.
     * @param {Pointer<IntPtr>} error A pointer to the <b>Error</b> object in which to set the property.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object.
     * @param {Integer} id Identifier of the property to set.
     * @param {Pointer} value A pointer to the property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes of the property value.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsseterrorproperty
     * @since windows6.1
     */
    static WsSetErrorProperty(error, id, value, valueSize) {
        result := DllCall("webservices.dll\WsSetErrorProperty", "ptr*", error, "int", id, "ptr", value, "uint", valueSize, "int")
        return result
    }

    /**
     * Releases the content of the error object parameter but does not release the resource allocated to the error object parameter.
     * @remarks
     * String data added to the error object using the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsadderrorstring">WsAddErrorString</a> function are released.
     *             
     * 
     * Properties that have been set using the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsseterrorproperty">WsSetErrorProperty</a> function are released.
     * @param {Pointer<IntPtr>} error This parameter is a   pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object to reset.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreseterror
     * @since windows6.1
     */
    static WsResetError(error) {
        result := DllCall("webservices.dll\WsResetError", "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory resource associated with an Error object created using WsCreateError. This releases the object and its constituent information.
     * @param {Pointer<IntPtr>} error A pointer to the <b>Error</b> object to release.  The pointer must reference a valid <b>WS_ERROR</b> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateerror">WsCreateError</a>.  The referenced value may 
     *                     not be NULL.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreeerror
     * @since windows6.1
     */
    static WsFreeError(error) {
        result := DllCall("webservices.dll\WsFreeError", "ptr*", error)
        return result
    }

    /**
     * Retrieves a Fault error property of a WS_ERROR object referenced by the error parameter.
     * @param {Pointer<IntPtr>} error A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object with the property to retrieve.
     * @param {Integer} id Represents an identifier of the fault error property to retrieve.
     * @param {Pointer} buffer A pointer referencing the location to store the retrieved fault error property.
     *                     
     * 
     * <div class="alert"><b>Note</b>  The pointer must have an alignment compatible with the type
     *                     of the property.</div>
     * <div> </div>
     * @param {Integer} bufferSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetfaulterrorproperty
     * @since windows6.1
     */
    static WsGetFaultErrorProperty(error, id, buffer, bufferSize) {
        result := DllCall("webservices.dll\WsGetFaultErrorProperty", "ptr*", error, "int", id, "ptr", buffer, "uint", bufferSize, "int")
        return result
    }

    /**
     * Set a Fault property of a WS_ERROR object.
     * @param {Pointer<IntPtr>} error A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object in which to set the property.  The pointer must reference a valid WS_ERROR object.
     * @param {Integer} id Identifier of the property to set.
     * @param {Pointer} value The property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes of the property value.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetfaulterrorproperty
     * @since windows6.1
     */
    static WsSetFaultErrorProperty(error, id, value, valueSize) {
        result := DllCall("webservices.dll\WsSetFaultErrorProperty", "ptr*", error, "int", id, "ptr", value, "uint", valueSize, "int")
        return result
    }

    /**
     * Constructs a WS_FAULT from a specified error object.
     * @remarks
     * If the error object contains a fault (that is, the WS_FAULT_ERROR_PROPERTY_FAULT value of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_fault_error_property_id">WS_FAULT_ERROR_PROPERTY_ID</a>   is non-<b>NULL</b>), then that fault is selected to construct the returned fault.
     * 
     * If the error object does not contain a fault (WS_FAULT_ERROR_PROPERTY_FAULT is <b>NULL</b>),  a generic fault with a generic fault code (and no reason text) is selected to construct the returned fault. 
     * 
     * If the selected fault does not include any reason text,  the fault reason
     *                 text is constructed according to the value of <i>disclosure</i> parameter:
     *                 <ul>
     * <li>WS_FULL_FAULT_DISCLOSURE
     *                     All the error strings present in the error object are appended together
     *                     to form the reason text.  If there are no strings, the string associated
     *                     with the <i>errorCode</i> parameter is used.
     *                     </li>
     * <li>WS_MINIMAL_FAULT_DISCLOSURE
     *                     A generic error string is used.
     *                 </li>
     * </ul>
     * 
     * 
     * By default, the
     *                 language of any language-dependent information in the error object is  the current 
     *                 user default UI language. However, you can change the language by setting 
     *                 the WS_ERROR_PROPERTY_LANGID property. See the the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_error_property_id">WS_ERROR_PROPERTY_ID</a> enumeration.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure representing the error object from which to construct the fault.
     * @param {Integer} faultErrorCode The HRESULT error code returned from the function that failed.
     *                     The HRESULT value cannot be a success code.
     *                 
     * 
     * This error code is never included in the fault directly, but is used as a fallback mechanism for creating a fault string if the error object does not contain any error strings.
     * @param {Integer} faultDisclosure <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_fault_disclosure">WS_FAULT_DISCLOSURE</a> enumeration that controls
     *                     what information is copied from
     *                     the error object to the fault object.
     * @param {Pointer<IntPtr>} heap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a> from which to allocate memory for the returned fault object.
     * @param {Pointer<WS_FAULT>} fault Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault">WS_FAULT</a> structure representing the returned fault object.  The fields of the fault object are good until
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeheap">WsFreeHeap</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetheap">WsResetHeap</a> is called to release the specified heap resources.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatefaultfromerror
     * @since windows6.1
     */
    static WsCreateFaultFromError(error, faultErrorCode, faultDisclosure, heap, fault) {
        result := DllCall("webservices.dll\WsCreateFaultFromError", "ptr*", error, "int", faultErrorCode, "int", faultDisclosure, "ptr*", heap, "ptr", fault, "int")
        return result
    }

    /**
     * Write the fault detail stored in a WS_ERROR object.
     * @remarks
     * This API will serialize the value of the detail field of
     *                 the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault">WS_FAULT</a> stored in the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object.
     *             
     * 
     * This functions supports the following scenarios, based on the contents
     *                 of the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_fault_detail_description">WS_ELEMENT_DESCRIPTION</a> in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault_detail_description">WS_FAULT_DETAIL_DESCRIPTION</a> supplied:
     *             
     * 
     * <ul>
     * <li>Writing a single element.  In this case, the elementLocalName and elementNs
     *                 fields of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_element_description">WS_ELEMENT_DESCRIPTION</a> should be set to the local name
     *                 and namespace of the element to write, and the type and type description represents
     *                 the type of the value being serialized.  
     *                 </li>
     * <li>Writing multiple elements as a single value.  In this case, the elementLocalName and elementNs
     *                 fields of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_element_description">WS_ELEMENT_DESCRIPTION</a> should be set to <b>NULL</b>, and a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_STRUCT_TYPE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_struct_description">WS_STRUCT_DESCRIPTION</a> should be specified.  Each field of the
     *                 structure value being serialized should correspond to element(s) to write within the fault detail.
     *                 The writeOption parameter must be either <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_REQUIRED_VALUE</a> or 
     *                 <b>WS_WRITE_REQUIRED_POINTER</b>.                
     *                 </li>
     * </ul>
     * @param {Pointer<IntPtr>} error The error object that will contain the fault information.
     * @param {Pointer<WS_FAULT_DETAIL_DESCRIPTION>} faultDetailDescription A pointer to a description of the fault detail.
     *                 
     * 
     * If the action field of the fault detail description is non-<b>NULL</b>,
     *                     then it is set as the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_fault_error_property_id">WS_FAULT_ERROR_PROPERTY_ACTION</a> of the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a>.
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
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetfaulterrordetail
     * @since windows6.1
     */
    static WsSetFaultErrorDetail(error, faultDetailDescription, writeOption, value, valueSize) {
        result := DllCall("webservices.dll\WsSetFaultErrorDetail", "ptr*", error, "ptr", faultDetailDescription, "int", writeOption, "ptr", value, "uint", valueSize, "int")
        return result
    }

    /**
     * Read the fault detail stored in a WS_ERROR object.
     * @remarks
     * This API deserializes the value from the detail field of
     *                 the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault">WS_FAULT</a> stored in the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object.
     *             
     * 
     * This functions supports the following scenarios, based on the contents
     *                 of the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_fault_detail_description">WS_ELEMENT_DESCRIPTION</a> in the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_fault_detail_description">WS_FAULT_DETAIL_DESCRIPTION</a> supplied:
     *             
     * 
     * <ul>
     * <li>Reading a single element.  
     *                 In this case, the elementLocalName and elementNs
     *                 fields of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_element_description">WS_ELEMENT_DESCRIPTION</a> should be set to the local name
     *                 and namespace of the element to read, and the type and type description represents
     *                 the type of the value being deserialized.  
     *                 
     * 
     * Since different faults with different detail formats may be expected
     *                 from a service, this function can be called in succession to try to
     *                 read each type of detail.  In this case, the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTIONAL_POINTER</a> value can be specified, which will return a <b>NULL</b> pointer if the element name
     *                 in the fault detail does not match the expected value.
     *             
     * 
     * </li>
     * <li>Reading multiple elements as a single value.  
     *                 In this case, the elementLocalName and elementNs
     *                 fields of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_element_description">WS_ELEMENT_DESCRIPTION</a> should be set to <b>NULL</b>, and a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_STRUCT_TYPE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_struct_description">WS_STRUCT_DESCRIPTION</a> should be specified.  Each field of the
     *                 structure value being deserialized should correspond to element(s) to read within the body.
     *                 The readOption parameter must be <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_REQUIRED_VALUE</a> or <b>WS_READ_REQUIRED_POINTER</b>. 
     *                 
     * 
     * </li>
     * </ul>
     * @param {Pointer<IntPtr>} error The error object that contains the fault information.
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
     * @param {Pointer<IntPtr>} heap The heap to store the deserialized values in.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetfaulterrordetail
     * @since windows6.1
     */
    static WsGetFaultErrorDetail(error, faultDetailDescription, readOption, heap, value, valueSize) {
        result := DllCall("webservices.dll\WsGetFaultErrorDetail", "ptr*", error, "ptr", faultDetailDescription, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "int")
        return result
    }

    /**
     * Creates a heap object.
     * @remarks
     * A heap in Windows Web Services API  is a memory allocation used for <a href="https://docs.microsoft.com/windows/desktop/wsw/message">messages</a>.  Heaps can also be used to store message data separately from the lifetime of a message. Some API functions allow for  explicit heap control over the lifetime of any data read.
     * 
     * Creating new heap does not allocate any memory (except the memory necessary for  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure itself). 
     *                 The parameters <i>maxSize</i> and <i>trimSize</i> are used  as quotas onlyduring <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsalloc">WsAlloc</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetheap">WsResetHeap</a> operations.
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
     * @param {Pointer<IntPtr>} heap On   success, pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the new heap object.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreateheap
     * @since windows6.1
     */
    static WsCreateHeap(maxSize, trimSize, properties, propertyCount, heap, error) {
        result := DllCall("webservices.dll\WsCreateHeap", "ptr", maxSize, "ptr", trimSize, "ptr", properties, "uint", propertyCount, "ptr", heap, "ptr*", error, "int")
        return result
    }

    /**
     * Allocates a segment of memory from the specified heap.
     * @remarks
     * The memory returned by this function is not zero initialized and contains undefined values.
     * @param {Pointer<IntPtr>} heap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the heap from which to allocate the memory.
     * @param {Pointer} size The number of bytes to allocate.  This value can be zero.
     * @param {Pointer<Void>} ptr On success, a pointer that receives the address of the allocated memory. This pointer is valid until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeheap">WsFreeHeap</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetheap">WsResetHeap</a> is called on the <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a>. 
     * 
     * 
     * 
     * The returned pointer is aligned on an 8-byte boundary. 
     * 
     * 
     * 
     * Zero byte allocations will return a non-NULL pointer.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * The requested bytes, in addition to already allocated bytes, exceed the size of the <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a>, as specified by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_heap_property_id">WS_HEAP_PROPERTY_MAX_SIZE</a> property.  
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsalloc
     * @since windows6.1
     */
    static WsAlloc(heap, size, ptr, error) {
        result := DllCall("webservices.dll\WsAlloc", "ptr*", heap, "ptr", size, "ptr", ptr, "ptr*", error, "int")
        return result
    }

    /**
     * Retrieves a particular property of a specified Heap.
     * @param {Pointer<IntPtr>} heap A pointer to the <b>Heap</b> object to that contains the desired property data.
     * @param {Integer} id This is a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_heap_property">WS_HEAP_PROPERTY_ID</a> enumerator that identifies the desired property.
     * @param {Pointer} value A reference to the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The buffer size allocated by the caller for the retrieved property value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetheapproperty
     * @since windows6.1
     */
    static WsGetHeapProperty(heap, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetHeapProperty", "ptr*", heap, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Releases all Heap allocations. Allocations made on the Heap using WsAlloc are no longer valid. Allocation for the Heap object itself is not released.
     * @remarks
     * The heap object can retain allocated memory even though it has been reset.  The amount of memory retained
     *                 can be specified using the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_heap_property_id">WS_HEAP_PROPERTY_TRIM_SIZE</a> 
     *                 property when creating the heap.
     * @param {Pointer<IntPtr>} heap A pointer to a Heap instance to reset.
     *                     If the heap is not required for the given type this
     *                     parameter can be <b>NULL</b>.
     *                 
     * 
     * The heap object.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsresetheap
     * @since windows6.1
     */
    static WsResetHeap(heap, error) {
        result := DllCall("webservices.dll\WsResetHeap", "ptr*", heap, "ptr*", error, "int")
        return result
    }

    /**
     * This frees the heap object, and the memory associated with any allocations made on it using WsAlloc.
     * @param {Pointer<IntPtr>} heap The heap to free.  This must be a valid heap object that was returned
     *                     from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateheap">WsCreateHeap</a>.  This parameter may not be <b>NULL</b>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreeheap
     * @since windows6.1
     */
    static WsFreeHeap(heap) {
        result := DllCall("webservices.dll\WsFreeHeap", "ptr*", heap)
        return result
    }

    /**
     * Creates a listener with the specified properties.
     * @remarks
     * When you create a custom listener (using the WS_CUSTOM_CHANNEL_BINDING value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> enumeration), you can specify only the following channel properties: 
     * 
     * <ul>
     * <li>WS_LISTENER_PROPERTY_CUSTOM_LISTENER_CALLBACKS</li>
     * <li>WS_LISTENER_PROPERTY_CUSTOM_LISTENER_PARAMETERS</li>
     * </ul>(See the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_ID</a> enumeration.) If other initial properties are required to create the custom listener, specify them by using the WS_LISTENER_PROPERTY_CUSTOM_LISTENER_PARAMETERS property. 
     * 
     * 
     * 
     * To pass security information to a custom listener implementation, use the WS_LISTENER_PROPERTY_CUSTOM_LISTENER_PARAMETERS value of the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_property_id">WS_LISTENER_PROPERTY_ID</a> enumeration.
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
     * @param {Pointer<IntPtr>} listener On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the new listener.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatelistener
     * @since windows6.1
     */
    static WsCreateListener(channelType, channelBinding, properties, propertyCount, securityDescription, listener, error) {
        result := DllCall("webservices.dll\WsCreateListener", "int", channelType, "int", channelBinding, "ptr", properties, "uint", propertyCount, "ptr", securityDescription, "ptr", listener, "ptr*", error, "int")
        return result
    }

    /**
     * Initiates &quot;listening&quot; on a specified address. Once a listener is opened channels can be accepted from it. If the open is successful the Listener must be closed using the WsCloseListener function before Listener resources can be released.
     * @remarks
     * When using IPv6 addresses, they must be enclosed in brackets in
     *                     the host name portion.
     *                 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_HTTP_CHANNEL_BINDING</a>.
     *                 
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_UDP_CHANNEL_BINDING</a>, the path portion of the URL is
     *                     ignored.  If a literal IP address is specified, then it is used to listen, otherwise
     *                     a wildcard IP address is used.
     *                 
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_TCP_CHANNEL_BINDING</a>, the path portion of the URL is
     *                     is matched as a prefix against the received URL.  
     *                     If a literal IP address is specified, then it is used to listen, 
     *                     otherwise a wildcard IP address is used.
     * @param {Pointer<IntPtr>} listener A pointer to the <b>Listener</b> object to open.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> object and the referenced value may not be <b>NULL</b>.
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
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsopenlistener
     * @since windows6.1
     */
    static WsOpenListener(listener, url, asyncContext, error) {
        result := DllCall("webservices.dll\WsOpenListener", "ptr*", listener, "ptr", url, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Accepts the next incoming message from the specified listener.
     * @remarks
     * Once you accept a channel, you must close it  when you no longer need it and free the resources by calling the  
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsclosechannel">WsCloseChannel</a> function, and then calling either the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreechannel">WsFreeChannel</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetchannel">WsResetChannel</a>.
     *             function. 
     * 
     * For <b>WsAcceptChannel</b> to succeed, the listener must be in WS_LISTENER_STATE_OPEN state, and the channel must be in WS_CHANNEL_STATE_CREATED state. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_state">WS_LISTENER_STATE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE</a> enumerations.
     * 
     * If a listener is in the <b>WS_LISTENER_STATE_FAULTED</b> state,  
     *                 <b>WsAcceptChannel</b> immediately returns the <b>WS_E_OBJECT_FAULTED</b> error code. If an
     *                 application is calling <b>WsAcceptChannel</b> in a loop, the application must check for this
     *                 error, so it can end the loop.
     * @param {Pointer<IntPtr>} listener Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the listener.
     *                 This is the listener passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannelforlistener">WsCreateChannelForListener</a> when the channel was created.
     * @param {Pointer<IntPtr>} channel Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> structure representing the channel to accept.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure with information for invoking the function asynchronously.  Pass a <b>NULL</b> 
     *                  value for a synchronous operation.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsacceptchannel
     * @since windows6.1
     */
    static WsAcceptChannel(listener, channel, asyncContext, error) {
        result := DllCall("webservices.dll\WsAcceptChannel", "ptr*", listener, "ptr*", channel, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Causes the specified listener to stop listening.
     * @remarks
     * After the listener is closed, the listener can safely be released.  
     *             
     * 
     * This operation is allowed for listener in the   <b>WS_LISTENER_STATE_OPEN</b> or
     *                 <b>WS_LISTENER_STATE_FAULTED</b> state.
     *             (For listener states, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_state">WS_LISTENER_STATE</a> enumeration.) 
     * 
     * When a listener is closed, any pending attempts to accept a channel with the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsacceptchannel">WsAcceptChannel</a> method are aborted. However, <b>WsCloseListener</b> waits for any pending I/O to complete before proceeding with the closing process.
     * @param {Pointer<IntPtr>} listener Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the listener  to close.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure containing information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * The close was aborted by a call to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsabortlistener">WsAbortListener</a> as the listener was closing.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscloselistener
     * @since windows6.1
     */
    static WsCloseListener(listener, asyncContext, error) {
        result := DllCall("webservices.dll\WsCloseListener", "ptr*", listener, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Cancels any pending I/O for the specified listener.
     * @remarks
     * <b>WsAbortListener</b> can be called when the listener is in any state. (See the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_state">WS_LISTENER_STATE</a> enumeration for possible states.) If the listener is in the WS_LISTENER_STATE_OPEN state,  this function will force the listener to fault (reset to the WS_LISTENER_STATE_FAULTED state). When a listener is faulted, all attempts to accept a message from it fail immediately with the WS_E_OBJECT_FAULTED error code. 
     * 
     * 
     * 
     * This function does not wait for pending I/O to complete.
     *             
     * 
     * If called with valid parameters, this function will not fail for reasons such as a lack of system resources.
     * @param {Pointer<IntPtr>} listener Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the listener for which to cancel I/O.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsabortlistener
     * @since windows6.1
     */
    static WsAbortListener(listener, error) {
        result := DllCall("webservices.dll\WsAbortListener", "ptr*", listener, "ptr*", error, "int")
        return result
    }

    /**
     * Resets a Listener object so it can be reused. Use of this function requires that the Listener state be set to WS_LISTENER_STATE_CREATED or WS_LISTENER_STATE_CLOSED.
     * @remarks
     * Before reusing a listener, this function should be called.
     * @param {Pointer<IntPtr>} listener A pointer to the <b>Listener</b> object to reset.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a>.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsresetlistener
     * @since windows6.1
     */
    static WsResetListener(listener, error) {
        result := DllCall("webservices.dll\WsResetListener", "ptr*", listener, "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory resource associated with a Listener object.
     * @param {Pointer<IntPtr>} listener A pointer to the <b>Listener</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> returned
     *                     by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a>.  The referenced value may not be <b>NULL</b>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreelistener
     * @since windows6.1
     */
    static WsFreeListener(listener) {
        result := DllCall("webservices.dll\WsFreeListener", "ptr*", listener)
        return result
    }

    /**
     * Retrieves a specified Listener object property. The property to retrieve is identified by a WS_LISTENER_PROPERTY_ID input parameter.
     * @param {Pointer<IntPtr>} listener A pointer to the Listener object containing the desired property.  This must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> that was returned
     *                     from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatelistener">WsCreateListener</a>.
     * @param {Integer} id This is a <b>WS_LISTENER_PROPERTY_ID</b> enumerator value that identifies the desired property.
     * @param {Pointer} value A reference to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize Represents the byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetlistenerproperty
     * @since windows6.1
     */
    static WsGetListenerProperty(listener, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetListenerProperty", "ptr*", listener, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Sets a Listenerobject property.
     * @param {Pointer<IntPtr>} listener A pointer to the <b>Listener</b> object with the property to set.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> and may not be <b>NULL</b>.
     * @param {Integer} id Identifier of the property to set.
     * @param {Pointer} value A void pointer to the property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes  of the property value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetlistenerproperty
     * @since windows6.1
     */
    static WsSetListenerProperty(listener, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsSetListenerProperty", "ptr*", listener, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Creates a channel associated with a specified listener.
     * @remarks
     * To accept an incoming message exchange, call the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsacceptchannel">WsAcceptChannel</a> function.
     *             
     * 
     * The security characteristics of the channel are the same as those 
     *                 specified for the listener.
     *             
     * 
     * When you create a custom channel (using the WS_CUSTOM_CHANNEL_BINDING value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_binding">WS_CHANNEL_BINDING</a> enumeration), you can specify only the following channel properties: 
     * 
     * <ul>
     * <li>WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_CALLBACKS </li>
     * <li>WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS</li>
     * </ul>If initial properties are required to create the custom channel, specify them by using the WS_CHANNEL_PROPERTY_CUSTOM_CHANNEL_PARAMETERS property.
     * @param {Pointer<IntPtr>} listener Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> structure representing the listener for which to create a channel.  The listener 
     *                     can be in any state. (For listener states, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_listener_state">WS_LISTENER_STATE</a>  enumeration.)
     * @param {Pointer<WS_CHANNEL_PROPERTY>} properties An array of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_channel_property">WS_CHANNEL_PROPERTY</a> structures containing optional values for channel initialization.  This can be a <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     *                 
     * 
     * For information on creating a custom channel, see the Remarks section.
     * @param {Integer} propertyCount The number of  properties in the <i>properties</i> array.
     * @param {Pointer<IntPtr>} channel On success, a pointer that receives the address of the created channel.   
     *                     When the channel  is no longer needed, you must free  it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreechannel">WsFreeChannel</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatechannelforlistener
     * @since windows6.1
     */
    static WsCreateChannelForListener(listener, properties, propertyCount, channel, error) {
        result := DllCall("webservices.dll\WsCreateChannelForListener", "ptr*", listener, "ptr", properties, "uint", propertyCount, "ptr", channel, "ptr*", error, "int")
        return result
    }

    /**
     * Creates a message object with the specified properties.
     * @remarks
     * A message object is the delivery vehicle for Windows Web Services. A single message object can be used to send or  receive sequential messages. Reusing a message object in this way can reduce memory allocations.
     *             When you no longer need the message, you must free the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a>. (For more information on reusing message objects, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetmessage">WsResetMessage</a> .)
     *             
     * 
     * If you are creating a message for use with a particular channel,  use the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessageforchannel">WsCreateMessageForChannel</a> function, which will ensure the correct message version for the channel.
     * @param {Integer} envelopeVersion A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_envelope_version">WS_ENVELOPE_VERSION</a> enumeration value that specifies the version of the envelope for the message.
     * @param {Integer} addressingVersion A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION</a> that specifies the version of the addressing for the message.
     * @param {Pointer<WS_MESSAGE_PROPERTY>} properties An array of optional properties for the message. See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_property">WS_MESSAGE_PROPERTY</a>.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<IntPtr>} message On   success, a pointer that receives the address of a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure representing the new message.
     *                 
     * 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatemessage
     * @since windows6.1
     */
    static WsCreateMessage(envelopeVersion, addressingVersion, properties, propertyCount, message, error) {
        result := DllCall("webservices.dll\WsCreateMessage", "int", envelopeVersion, "int", addressingVersion, "ptr", properties, "uint", propertyCount, "ptr", message, "ptr*", error, "int")
        return result
    }

    /**
     * Creates a message for use with a specified channel.
     * @remarks
     * In contrast to the more general  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessage">WsCreateMessage</a> function,  <b>WsCreateMessageForChannel</b> ensures that
     *                 the message version used is appropriate for the channel.
     * @param {Pointer<IntPtr>} channel Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> structure representing the channel for the message.
     * @param {Pointer<WS_MESSAGE_PROPERTY>} properties An array of optional properties for the message. See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_message_property">WS_MESSAGE_PROPERTY</a>.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<IntPtr>} message On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure representing the new message.
     *                 
     * 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatemessageforchannel
     * @since windows6.1
     */
    static WsCreateMessageForChannel(channel, properties, propertyCount, message, error) {
        result := DllCall("webservices.dll\WsCreateMessageForChannel", "ptr*", channel, "ptr", properties, "uint", propertyCount, "ptr", message, "ptr*", error, "int")
        return result
    }

    /**
     * This function initializes the headers for the message in preparation for processing.
     * @remarks
     * The initial sender of a message should add an action header
     *                 to the message using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetheader">WsSetHeader</a>.
     *             
     * 
     * This API must be called before <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswriteenvelopestart">WsWriteEnvelopeStart</a> or
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritemessagestart">WsWriteMessageStart</a> is called for the message.
     * @param {Pointer<IntPtr>} message A pointer to the Message object to initialize.  The Message must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object instance returned
     *                     by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessage">WsCreateMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessageforchannel">WsCreateMessageForChannel</a> and may not be NULL.
     * @param {Integer} initialization Defines the Message initialization. 
     *                 
     * 
     * <div class="alert"><b>Note</b>  If the  <i>initialization</i> value is set to <b>WS_REPLY_MESSAGE</b> or
     *                 <b>WS_FAULT_MESSAGE</b> the message is automatically addressed.
     *             </div>
     * <div> </div>
     * @param {Pointer<IntPtr>} sourceMessage A pointer to a message object that is used to initialize the <i>message</i> parameter.
     *                     This value should be NULL unless the initialization parameter
     *                     has the value of <b>WS_DUPLICATE_MESSAGE</b>,
     *                     <b>WS_REPLY_MESSAGE</b>, or <b>WS_FAULT_MESSAGE</b>.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsinitializemessage
     * @since windows6.1
     */
    static WsInitializeMessage(message, initialization, sourceMessage, error) {
        result := DllCall("webservices.dll\WsInitializeMessage", "ptr*", message, "int", initialization, "ptr*", sourceMessage, "ptr*", error, "int")
        return result
    }

    /**
     * Sets the Message state back to WS_MESSAGE_STATE_EMPTY. In this state the Message object can be reused.
     * @remarks
     * When a message is reset, its underlying heap is reset.
     *             
     * 
     * Reusing a message object to receive or send multiple messages is is generally
     *                 more efficient than creating and freeing the message object for each message.
     * @param {Pointer<IntPtr>} message A pointer to the Message  object to reset.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsresetmessage
     * @since windows6.1
     */
    static WsResetMessage(message, error) {
        result := DllCall("webservices.dll\WsResetMessage", "ptr*", message, "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory resource associated with a Message object.
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object returned
     *                     by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessage">WsCreateMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemessageforchannel">WsCreateMessageForChannel</a> and the referenced value may not be <b>NULL</b>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreemessage
     * @since windows6.1
     */
    static WsFreeMessage(message) {
        result := DllCall("webservices.dll\WsFreeMessage", "ptr*", message)
        return result
    }

    /**
     * This function populates a ULONG parameter with the WS_HEADER_ATTRIBUTES from the header element on which the reader is positioned. The envelope version of the message is used to determine which attributes to return.
     * @remarks
     * The reader is assumed to point to a header element.  Use the XML reader API's to position the reader appropriately.
     * @param {Pointer<IntPtr>} message A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure containing the message to query.  This envelope version of the message is used to determine which attributes match.
     *                 The message can be in any state except <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<IntPtr>} reader A pointer to the reader to query.  This must be valid WS_XML_READER object returned from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatereader">WsCreateReader</a>   and cannot be <b>NULL</b>.
     * @param {Pointer<UInt32>} headerAttributes On success the value referenced by this pointer is set to the header attributes.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetheaderattributes
     * @since windows6.1
     */
    static WsGetHeaderAttributes(message, reader, headerAttributes, error) {
        result := DllCall("webservices.dll\WsGetHeaderAttributes", "ptr*", message, "ptr*", reader, "uint*", headerAttributes, "ptr*", error, "int")
        return result
    }

    /**
     * Finds a particular standard header in the message and deserializes it.
     * @remarks
     * This API provides access to a set of standard header types (see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a>).
     *                 For application defined header types, use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetcustomheader">WsGetCustomHeader</a>.
     *             
     * 
     * This API is designed handle types of headers that appear once in the
     *                 message and are targeted at the ultimate receiver.  Headers targeted
     *                 with a role/actor other than ultimate receiver are ignored by this API.
     * @param {Pointer<IntPtr>} message The message containing the header.
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
     * @param {Pointer<IntPtr>} heap The heap to store the deserialized header data in.
     *                     If this is <b>NULL</b>, then the message heap will be used.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * The size quota of the heap was exceeded.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetheader
     * @since windows6.1
     */
    static WsGetHeader(message, headerType, valueType, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetHeader", "ptr*", message, "int", headerType, "int", valueType, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Finds an application-defined header of the message and deserializes it.
     * @remarks
     * This API operates on headers targeted at the ultimate receiver.  
     *                 Headers targeted with a role/actor other than ultimate receiver are 
     *                 ignored by this API.
     * @param {Pointer<IntPtr>} message The message containing the header.
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
     * @param {Pointer<IntPtr>} heap The heap to store the deserialized header data in.
     *                     If this is <b>NULL</b>, then the message heap will be used
     *                     as required by the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<UInt32>} headerAttributes Returns the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_text_type">WS_HEADER_ATTRIBUTES</a> for this header.
     *                     The pointer may be <b>NULL</b>, in which case no attributes are returned.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_repeating_header_option">WS_SINGLETON_HEADER</a> was specified, and there are 
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
     * The size quota of the heap was exceeded.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetcustomheader
     * @since windows6.1
     */
    static WsGetCustomHeader(message, customHeaderDescription, repeatingOption, headerIndex, readOption, heap, value, valueSize, headerAttributes, error) {
        result := DllCall("webservices.dll\WsGetCustomHeader", "ptr*", message, "ptr", customHeaderDescription, "int", repeatingOption, "uint", headerIndex, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "uint*", headerAttributes, "ptr*", error, "int")
        return result
    }

    /**
     * Removes the standard WS_HEADER_TYPE object from a message.
     * @remarks
     * If a header of the given type exists in the message it is removed.  If the header does not exist, no action is taken
     *                 and the function completes successfully.
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object with the header  to be removed. The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b>.
     * @param {Integer} headerType Indicates the type of header to be removed.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsremoveheader
     * @since windows6.1
     */
    static WsRemoveHeader(message, headerType, error) {
        result := DllCall("webservices.dll\WsRemoveHeader", "ptr*", message, "int", headerType, "ptr*", error, "int")
        return result
    }

    /**
     * Adds or replaces the specified standard header in the message.
     * @remarks
     * This API allows setting of standard header types (see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a>).
     *                 For application defined header types, use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsaddcustomheader">WsAddCustomHeader</a>.
     *             
     * 
     * This API is designed handle types of headers that appear once in the
     *                 message and are targeted at the ultimate receiver.  Headers targeted
     *                 with a role/actor other than ultimate receiver are ignored by this API.
     *             
     * 
     * If a header of the given type (targeted at the ultimate receiver) already
     *                 exists in the message, it is replaced.
     * @param {Pointer<IntPtr>} message The message to set the header in.
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
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetheader
     * @since windows6.1
     */
    static WsSetHeader(message, headerType, valueType, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsSetHeader", "ptr*", message, "int", headerType, "int", valueType, "int", writeOption, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Removes a custom header from the message. This function is designed to handle types of headers that appear once in the message and are targeted at the ultimate receiver. Headers targeted with a role other than ultimate receiver are ignored.
     * @remarks
     * If a header of the given type exists in the message it is removed.  If the header does not exist, the function takes no action and completes successfully.
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object with the header  to be removed.  
     * 
     * The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b>.
     * @param {Pointer<WS_XML_STRING>} headerName A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> object that references the "local name" of the header element to be  removed.
     * @param {Pointer<WS_XML_STRING>} headerNs A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> object that references the namespace of the header element to be removed.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsremovecustomheader
     * @since windows6.1
     */
    static WsRemoveCustomHeader(message, headerName, headerNs, error) {
        result := DllCall("webservices.dll\WsRemoveCustomHeader", "ptr*", message, "ptr", headerName, "ptr", headerNs, "ptr*", error, "int")
        return result
    }

    /**
     * Adds the specified application-defined header to the message.
     * @remarks
     * The <b>WsAddCustomHeader</b> function is designed handle types of headers that are targeted at 
     *                 the final receiver.  Headers targeted at another receiver are ignored.
     *             
     * 
     * If you are replacing a header, call the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsremovecustomheader">WsRemoveCustomHeader</a> function to remove 
     *                 the existing instances of the header before calling <b>WsAddCustomHeader</b>.
     * @param {Pointer<IntPtr>} message The message to which to add the header.
     *                 
     * 
     * The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b> (see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE</a> enumeration..
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} headerDescription The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_element_description">WS_ELEMENT_DESCRIPTION</a> structure that describes the header.
     * @param {Integer} writeOption Whether the header element is required, and how the value is allocated.
     *                     For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> enumeration.
     * @param {Pointer} value The header value to serialize.  For more information, see  the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> enumeration.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     * @param {Integer} headerAttributes The values of the SOAP attributes for the header.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsaddcustomheader
     * @since windows6.1
     */
    static WsAddCustomHeader(message, headerDescription, writeOption, value, valueSize, headerAttributes, error) {
        result := DllCall("webservices.dll\WsAddCustomHeader", "ptr*", message, "ptr", headerDescription, "int", writeOption, "ptr", value, "uint", valueSize, "uint", headerAttributes, "ptr*", error, "int")
        return result
    }

    /**
     * Adds a specified mapped header to the message.
     * @remarks
     * A message may contain additional transport-specific information that is
     *                 not part of the message envelope.  This transport-specific information
     *                 can be exposed programmatically as headers of the message.
     *                 The <b>WsAddMappedHeader</b> function is used to add such a header that will be mapped into some
     *                 transport-specific location.
     *             
     * 
     * When you use the HTTP channel, you must specify the required mappings  before before you call this function to add the headers.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_message_mapping">WS_HTTP_MESSAGE_MAPPING</a>.
     *             
     * 
     * If you are replacing a header, call the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsremovemappedheader">WsRemoveMappedHeader</a> function to remove
     *                 the existing instances of the header before you call <b>WsAddMappedHeader</b>.
     * @param {Pointer<IntPtr>} message Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure representing the  <a href="https://docs.microsoft.com/windows/desktop/wsw/message">message</a> to to which to add the mapped header.
     *                 
     * 
     * The message can be in any state except <b>WS_MESSAGE_STATE_EMPTY</b> (see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE</a> enumeration.
     * @param {Pointer<WS_XML_STRING>} headerName Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a> containing the name of the header.
     * @param {Integer} valueType The type of header value to deserialize.  For possible types and the corresponding headers, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a>
     * @param {Integer} writeOption Whether the header is required, and how the value is allocated.
     *                     For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> enumeration.
     * @param {Pointer} value The header value to serialize.  For more information, see  the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> enumeration.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsaddmappedheader
     * @since windows6.1
     */
    static WsAddMappedHeader(message, headerName, valueType, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsAddMappedHeader", "ptr*", message, "ptr", headerName, "int", valueType, "int", writeOption, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Removes all instances of a mapped header from the message.
     * @remarks
     * A message may contain additional transport-specific information that is
     *                 not part of the message envelope.  This transport-specific information
     *                 can be exposed programmatically as headers of the Message object.
     *                 This function is used to remove mapped headers from the message object.
     *                 This can be used by a custom channel implementation to remove mapped headers
     *                 prior to sending the message.
     * @param {Pointer<IntPtr>} message The message to set the header in.
     *                 
     * 
     * The message can be in any state but <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_state">WS_MESSAGE_STATE_EMPTY</a>.
     * @param {Pointer<WS_XML_STRING>} headerName The name of the mapped header to remove.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsremovemappedheader
     * @since windows6.1
     */
    static WsRemoveMappedHeader(message, headerName, error) {
        result := DllCall("webservices.dll\WsRemoveMappedHeader", "ptr*", message, "ptr", headerName, "ptr*", error, "int")
        return result
    }

    /**
     * Finds a mapped header in the message and deserializes it.
     * @remarks
     * A message may contain additional transport-specific information that is
     *                 not part of the message envelope.  This transport-specific information
     *                 can be exposed programmatically as headers of the Message object.
     *                 This function is used to read a header that has been mapped by a
     *                 transport into the message.
     *             
     * 
     * When using the HTTP channel, the required mappings must be specified before headers
     *                 can be extracted with this function.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_http_message_mapping">WS_HTTP_MESSAGE_MAPPING</a>.
     * @param {Pointer<IntPtr>} message The message containing the header.
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
     * @param {Pointer<IntPtr>} heap The heap to store the deserialized header data in.
     *                     If this is <b>NULL</b>, then the message heap will be used.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_repeating_header_option">WS_SINGLETON_HEADER</a> was specified, and there are
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
     * The size quota of the heap was exceeded.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetmappedheader
     * @since windows6.1
     */
    static WsGetMappedHeader(message, headerName, repeatingOption, headerIndex, valueType, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetMappedHeader", "ptr*", message, "ptr", headerName, "int", repeatingOption, "uint", headerIndex, "int", valueType, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Writes a value in the body of a message. This is a helper function that serializes a value to the XML Writer of the message. The message state must be set to WS_MESSAGE_STATE_WRITING. This function does not cause any state transitions.
     * @remarks
     * This functions supports the following scenarios, based on the contents
     *                 of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_element_description">WS_ELEMENT_DESCRIPTION</a> supplied:
     *             
     * 
     * <ul>
     * <li>Writing a single element.  In this case, the elementLocalName and elementNs
     *                 fields of the <b>WS_ELEMENT_DESCRIPTION</b> should be set to the local name
     *                 and namespace of the element to write, and the type and type description represents
     *                 the type of the value being serialized.  If using <b>WS_FAULT_TYPE</b> or
     *                 <b>WS_ENDPOINT_ADDRESS_TYPE</b>, it is not necessary to specify the local name,
     *                 namespace, or type description (they will default appropriately based on the
     *                 envelope/addressing version of the message).
     *                 </li>
     * <li>Writing multiple elements as a single value.  In this case, the elementLocalName and elementNs
     *                 fields of the <b>WS_ELEMENT_DESCRIPTION</b> should be set to <b>NULL</b>, and a <b>WS_STRUCT_TYPE</b> and <b>WS_STRUCT_DESCRIPTION</b> should be specified.  In this case, each field of the
     *                 structure value being serialized should correspond to element(s) to write within the body.
     *                 </li>
     * <li>Writing multiple elements as multiple values.  Writing multiple distinct values can be
     *                 accomplished by simply calling the function multiple times.
     *             </li>
     * </ul>
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object for writing to.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} bodyDescription A pointer to information describing how to write the value.
     * @param {Integer} writeOption Determines whether the value is required and how the value is allocated.
     *                     <div class="alert"><b>Note</b>  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.</div>
     * <div> </div>
     * @param {Pointer} value A void pointer to the value to write.
     * @param {Integer} valueSize The size in bytes of the value to write.
     *                 If the value is <b>NULL</b> the size should be 0.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritebody
     * @since windows6.1
     */
    static WsWriteBody(message, bodyDescription, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsWriteBody", "ptr*", message, "ptr", bodyDescription, "int", writeOption, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * This is a helper function that deserializes a value from the XML Readerof the message. The WS_MESSAGE_STATE must be set to WS_MESSAGE_STATE_READING. This function does not cause any state transitions.
     * @remarks
     * This functions supports the following scenarios, based on the contents
     *                 of the <b>WS_ELEMENT_DESCRIPTION</b> supplied:
     *             
     * 
     * <ul>
     * <li>Reading a single element.  In this case, the elementLocalName and elementNs
     *                 fields of the <b>WS_ELEMENT_DESCRIPTION</b> should be set to the local name
     *                 and namespace of the element to read, and the type and type description represents
     *                 the type of the value being deserialized.  If using <b>WS_FAULT_TYPE</b> or
     *                 <b>WS_ENDPOINT_ADDRESS_TYPE</b> it is not necessary to specify the local name,
     *                 namespace, or type description (they will default appropriately based on the
     *                 envelope/addressing version of the message).
     *                 </li>
     * <li>Reading multiple elements as a single value.  In this case, the elementLocalName and elementNs
     *                 fields of the <b>WS_ELEMENT_DESCRIPTION</b> should be set to <b>NULL</b>, and a <b>WS_STRUCT_TYPE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_struct_description">WS_STRUCT_DESCRIPTION</a> should be specified.  In this case, each field of the
     *                 structure value being deserialized should correspond to element(s) to read within the body.
     *                 </li>
     * <li>Reading multiple elements as multiple values.  Reading multiple distinct values can be
     *                 accomplished by simply calling the function multiple times.
     *             </li>
     * </ul>
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object to read the body from.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} bodyDescription A pointer to the object encapsulating the metadata that describes the mapping of the value to an element.
     * @param {Integer} readOption Determines whether the value is required and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<IntPtr>} heap A pointer to the <b>Heap</b> object to read the element into.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> object.
     * @param {Pointer} value The interpretation of the data referenced by this parameter depends on the <b>WS_READ_OPTION</b>.
     * @param {Integer} valueSize The interpretation of the value of this parameter depends on the <b>WS_READ_OPTION</b>.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadbody
     * @since windows6.1
     */
    static WsReadBody(message, bodyDescription, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadBody", "ptr*", message, "ptr", bodyDescription, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Writes the start of the message including the current set of headers of the message and prepares to write the body elements.
     * @remarks
     * The start of the message, including the current set of headers that exist in the message, 
     *                 are written to the writer.
     *             
     * 
     * The message state must be set to <b>WS_MESSAGE_STATE_INITIALIZED</b>.  On success 
     *                 the Message state transitions to  <b>WS_MESSAGE_STATE_WRITING</b>.  
     *                 On failure state transition does not occur.
     *             
     * 
     * To write an element of the message body use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wswritebody">WsWriteBody</a>.  To write
     *                 directly to the Writer of the Message obtain the Reader with the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_property_id">WS_MESSAGE_PROPERTY_ID</a> set to <b>WS_MESSAGE_PROPERTY_BODY_WRITER</b> property.
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object to write.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<IntPtr>} writer A pointer to the <b>XML Writer</b> object to write the Message.  The Message object uses the Writer in subsequent calls to write the message.  The caller must keep the writer valid until <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetmessage">WsResetMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemessage">WsFreeMessage</a> is called.
     *                 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_message_done_callback">WS_MESSAGE_DONE_CALLBACK</a> parameter can be used to determine that the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> is no longer in use.
     * @param {Pointer<WS_MESSAGE_DONE_CALLBACK>} doneCallback The callback function invoked when the Message is released or reset. This callback can be used to indicate that the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-writer">WS_XML_WRITER</a> object is no longer
     *  in use by this message. If this function fails the callback is not called. If the function succeeds the callback is invoked one time only.
     * @param {Pointer<Void>} doneCallbackState A void pointer to a user-defined state that will be passed to the specified callback. This parameter may be <b>NULL</b>.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswriteenvelopestart
     * @since windows6.1
     */
    static WsWriteEnvelopeStart(message, writer, doneCallback, doneCallbackState, error) {
        result := DllCall("webservices.dll\WsWriteEnvelopeStart", "ptr*", message, "ptr*", writer, "ptr", doneCallback, "ptr", doneCallbackState, "ptr*", error, "int")
        return result
    }

    /**
     * Writes the closing elements of a message.
     * @remarks
     * To use this function the message state must be set to <b>WS_MESSAGE_STATE_WRITING</b>.  If called in the correct
     *                 state the message will transition to <b>WS_MESSAGE_STATE_DONE</b> regardless
     *                 of whether the function fails or not.
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object to write.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswriteenvelopeend
     * @since windows6.1
     */
    static WsWriteEnvelopeEnd(message, error) {
        result := DllCall("webservices.dll\WsWriteEnvelopeEnd", "ptr*", message, "ptr*", error, "int")
        return result
    }

    /**
     * Reads the headers of the message and prepare to read the body elements.
     * @remarks
     * The message must be in <b>WS_MESSAGE_STATE_EMPTY</b> state.  On success
     *                 the message state is set to <b>WS_MESSAGE_STATE_READING</b>. 
     * 
     * To read an Element of the message body, use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadbody">WsReadBody</a>.  To read
     *                 directly from the XML Reader get the Reader with 
     *                 the <b>message property Id</b> set to  <b>WS_MESSAGE_PROPERTY_BODY_READER</b>.
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object to read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object.
     * @param {Pointer<IntPtr>} reader A pointer to the Reader with the message to read.  The Message object uses the Reader in the current and subsequent
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
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadenvelopestart
     * @since windows6.1
     */
    static WsReadEnvelopeStart(message, reader, doneCallback, doneCallbackState, error) {
        result := DllCall("webservices.dll\WsReadEnvelopeStart", "ptr*", message, "ptr*", reader, "ptr", doneCallback, "ptr", doneCallbackState, "ptr*", error, "int")
        return result
    }

    /**
     * Reads the closing elements of a message. The operation allows for reading of messages from sources other than Channels. If the source is a Channel use WsReadMessageEnd.
     * @remarks
     * The message state must be <b>WS_MESSAGE_STATE_READING</b>.  If called in the correct
     *                 state the message state is set to  <b>WS_MESSAGE_STATE_DONE</b> regardless
     *                 of function success or failure.
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadenvelopeend
     * @since windows6.1
     */
    static WsReadEnvelopeEnd(message, error) {
        result := DllCall("webservices.dll\WsReadEnvelopeEnd", "ptr*", message, "ptr*", error, "int")
        return result
    }

    /**
     * Retrieves a specified Message object property. The property to retrieve is identified by a WS_MESSAGE_PROPERTY_ID input parameter.
     * @param {Pointer<IntPtr>} message A pointer to a <b>Message</b> object containing the desired property.  This parameter must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_LISTENER</a> object.
     * @param {Integer} id This is a <b>WS_MESSAGE_PROPERTY_ID</b> enumerator value that identifies the desired property.
     * @param {Pointer} value A reference to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetmessageproperty
     * @since windows6.1
     */
    static WsGetMessageProperty(message, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetMessageProperty", "ptr*", message, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * This operation sets a Messageproperty.
     * @param {Pointer<IntPtr>} message A pointer to the <b>Message</b> object with the property to set.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> object and the referenced value may not be <b>NULL</b>.
     * @param {Integer} id The identifier of the property to set.
     * @param {Pointer} value A pointer to the property value to set.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The size in bytes  of the property value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wssetmessageproperty
     * @since windows6.1
     */
    static WsSetMessageProperty(message, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsSetMessageProperty", "ptr*", message, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Addresses a message to a specified endpoint address.
     * @remarks
     * If you do not address a message by calling  this function, the <a href="https://docs.microsoft.com/windows/desktop/wsw/channel">channel</a> automatically addresses the message with the
     *                 <a href="https://docs.microsoft.com/windows/desktop/wsw/endpoint-address">Endpoint Address</a> passed to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenchannel">WsOpenChannel</a>.
     * 
     * This function marks the message as addressed by setting
     *                 the  <b>WS_MESSAGE_PROPERTY_IS_ADDRESSED</b> property  to <b>TRUE</b>.
     *             
     * 
     * This function fails 
     *                 if the message has already been addressed and returns <b>WS_E_INVALID_OPERATION</b>.
     *             
     * 
     * If a non-<b>NULL</b><a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a> is passed
     *                 to the function,  the function performs the following
     *                 additional steps:
     *             
     * 
     * <ul>
     * <li>The header type is set to WS_TO_HEADER (see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a> enumeration) and the address is set to the value of the <b>url</b> field of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a>.  If the URL length
     *                 is zero the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_addressing_version">WS_ADDRESSING_VERSION</a>-specific 
     *                 representation for an anonymous URL is set for the message.
     *                 </li>
     * <li>Each header in the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> specified in the 
     *                 headers field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a> is added to
     *                 the message.  No headers are added if the buffer is <b>NULL</b>.
     *             </li>
     * </ul>
     * @param {Pointer<IntPtr>} message Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure representing the  message to be addressed.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} address Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a> structure containing the endpoint  to which to address the message.
     * 
     * <div class="alert"><b>Note</b>  Passing <b>NULL</b> to this parameter indicates that no headers are added to the message.  This provides
     *                     a way to set the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_message_property_id">WS_MESSAGE_PROPERTY_ID</a> to <b>WS_MESSAGE_PROPERTY_IS_ADDRESSED</b> 
     *                     without modifying the set of headers in the message.
     *                 </div>
     * <div> </div>
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsaddressmessage
     * @since windows6.1
     */
    static WsAddressMessage(message, address, error) {
        result := DllCall("webservices.dll\WsAddressMessage", "ptr*", message, "ptr", address, "ptr*", error, "int")
        return result
    }

    /**
     * Verifies that the specified headers were understood by the receiver. Note  This function should be called after all headers have been read for a received message.  .
     * @remarks
     * Because the set of headers is extensible, it is necessary to determine whether a message has  been sufficiently understood to be processed. Therefore, the sender can use this function to indicate which headers must be understood, which headers can be treated as optional or informational.
     * 
     * Standard addressing headers, such as the ones defined in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_header_type">WS_HEADER_TYPE</a>, are automatically assumed to be understood, even if they are never read by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetheader">WsGetHeader</a>.
     * 
     * Custom, application-defined headers that are read by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetcustomheader">WsGetCustomHeader</a> are also assumed to be understood. Calling <b>WsGetCustomHeader</b> will automatically mark the particular header as understood.
     * 
     * For any  other header processed by the application, the application must explicitly mark the header as understood by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsmarkheaderasunderstood">WsMarkHeaderAsUnderstood</a>. Otherwise, the header is considered to not be understood.
     * 
     * This function should be called after all headers have been read for a received message. An exception to having to call this function is the case of an intermediary that forwards the message to another node without changing its identity (message ID), since the final node will do the check. 
     * 
     * 
     * 
     * The function will fail if any of the specified headers were not understood. If an error object is supplied to the function, it will be populated with information that can be used to send a fault (see <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatefaultfromerror">WsCreateFaultFromError</a>). 
     * 
     * 
     * 
     * The message must be in the WS_MESSAGE_STATE_READING state.
     * @param {Pointer<IntPtr>} message Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure containing the headers to be understood.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  where additional error information is stored if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscheckmustunderstandheaders
     * @since windows6.1
     */
    static WsCheckMustUnderstandHeaders(message, error) {
        result := DllCall("webservices.dll\WsCheckMustUnderstandHeaders", "ptr*", message, "ptr*", error, "int")
        return result
    }

    /**
     * This function marks a header as &quot;understood&quot; by the application.
     * @remarks
     * When the application reads the header using an XML Reader,
     *                 it should obtain a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node_position">WS_XML_NODE_POSITION</a> of the header element
     *                 and pass it to this function.  See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetreaderposition">WsGetReaderPosition</a> for
     *                 how to obtain a <b>WS_XML_NODE_POSITION</b>.
     * @param {Pointer<IntPtr>} message A pointer to the Message object with the header to mark.
     * @param {Pointer<WS_XML_NODE_POSITION>} headerPosition A pointer to the position of the header element within the XML header segment.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsmarkheaderasunderstood
     * @since windows6.1
     */
    static WsMarkHeaderAsUnderstood(message, headerPosition, error) {
        result := DllCall("webservices.dll\WsMarkHeaderAsUnderstood", "ptr*", message, "ptr", headerPosition, "ptr*", error, "int")
        return result
    }

    /**
     * Ensures that there are a sufficient number of bytes available in a message for reading.
     * @remarks
     * This function is typically used when writing the message body with streamed mode set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_STREAMED_OUTPUT_TRANSFER_MODE</a>, or when using an XML Reader in streamed mode.
     *             
     * 
     * This function is a "no-op" when writing the message body and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_STREAMED_OUTPUT_TRANSFER_MODE</a> is not set, or with an XML Reader's mode set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_reader_buffer_input">WS_XML_READER_BUFFER_INPUT</a>.
     * @param {Pointer<IntPtr>} message A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure intended for "filling".
     * @param {Integer} minSize The minimum number of bytes that the message should have buffered. If the current byte count buffered is equal to or greater than the value of <i>minSize</i> the function does nothing.
     *                 
     * 
     * <div class="alert"><b>Note</b>  The value of  <i>minSize</i> represents the size of the encoded form of the XML that is expected.  This can vary by encoding and also how the actual XML is structured. Typical use of this function is to select an expected upper bound byte count for  encoding or XML structure to ensure that the expected data is read.
     * </div>
     * <div> </div>
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> data structure with information about invoking the function asynchronously.  A <b>NULL</b> value indicates a request for synchronous operation.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfillbody
     * @since windows6.1
     */
    static WsFillBody(message, minSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsFillBody", "ptr*", message, "uint", minSize, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Flushes all accumulated message body data that has been written.
     * @remarks
     * This function is a "no-op" when <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_transfer_mode">WS_STREAMED_OUTPUT_TRANSFER_MODE</a> is not set, or when using an
     *                 XML Writer with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_writer_buffer_output">WS_XML_WRITER_BUFFER_OUTPUT</a> set.
     *       
     * 
     * This function is shortcut for calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsflushwriter">WsFlushWriter</a> for 
     *                 the XML Writer being used to write the message.  Calling 
     *                 <b>WsFlushWriter</b> directly is equivalent to calling this function.
     * @param {Pointer<IntPtr>} message A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> structure containing the accumulated message body data.
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
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsflushbody
     * @since windows6.1
     */
    static WsFlushBody(message, minSize, asyncContext, error) {
        result := DllCall("webservices.dll\WsFlushBody", "ptr*", message, "uint", minSize, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Get a security token from a security token service (STS) that acts as the token issuer in a federation scenario.
     * @remarks
     * Windows 7 and Windows Server 2008 R2: WWSAPI only supports <a href="http://specs.xmlsoap.org/ws/2005/02/trust/WS-Trust.pdf">Ws-Trust</a> and <a href="http://specs.xmlsoap.org/ws/2005/02/sc/WS-SecureConversation.pdf">Ws-SecureConversation</a> as defined by <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-lwssp/376af2f8-f4fe-4577-bfd5-370ac12cac2e">Lightweight Web Services Security Profile (LWSSP)</a>. For details regarding Microsoft's implementation please see the <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-lwssp/d4f0f509-e14a-47b5-81e8-ade06a51d1ed">MESSAGE Syntax</a> section of LWSSP.
     * @param {Pointer<IntPtr>} channel The channel on which the negotiation to obtain the security token
     * should take place.
     *                 
     * 
     * The supplied channel should have been <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatechannel">created</a> with the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_description">WS_SECURITY_DESCRIPTION</a> to meet the security requirements of
     * the issuer, and then <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsopenchannel">opened</a> to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_endpoint_address">WS_ENDPOINT_ADDRESS</a> of the issuer.  The caller is also
     * responsible for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsclosechannel">closing</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreechannel">freeing</a> the channel after the completion of
     * this function.
     *                 
     * 
     * Thus, the channel must be in state <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_state">WS_CHANNEL_STATE_OPEN</a> when this function is called.  After a successful completion of this
     * function, the channel will be in state <b>WS_CHANNEL_STATE_OPEN</b>.  After a failed completion, it will
     * either be in state <b>WS_CHANNEL_STATE_OPEN</b> or state <b>WS_CHANNEL_STATE_FAULTED</b>.
     * @param {Pointer<WS_REQUEST_SECURITY_TOKEN_PROPERTY>} properties An optional group of settings to be used in the negotiation process
     * with the issuer.
     * @param {Integer} propertyCount The number of items in the properties array.
     * @param {Pointer<IntPtr>} token The XML security token obtained.  This is set upon successful
     * completion of the function call, and is unmodified if any failure
     * occurs during the execution of the function.
     *                 
     * 
     * The returned security token may be used with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_token_message_security_binding">WS_XML_TOKEN_MESSAGE_SECURITY_BINDING</a> if it is to be
     * presented to a service.  The token must be freed using <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreesecuritytoken">WsFreeSecurityToken</a> when it is no longer needed.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Information on how to invoke the function asynchronously, or <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsrequestsecuritytoken
     * @since windows6.1
     */
    static WsRequestSecurityToken(channel, properties, propertyCount, token, asyncContext, error) {
        result := DllCall("webservices.dll\WsRequestSecurityToken", "ptr*", channel, "ptr", properties, "uint", propertyCount, "ptr", token, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Extracts a field or a property from a security token.
     * @param {Pointer<IntPtr>} securityToken The security token from which the property should be extracted.
     * @param {Integer} id The id of the property to retrieve.
     * @param {Pointer} value The location to store the retrieved property.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @param {Pointer<IntPtr>} heap Heap to store additional property data. This parameter must be non-<b>NULL</b> when the queried property is
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_token_property_id">WS_SECURITY_TOKEN_PROPERTY_SYMMETRIC_KEY</a> and must be <b>NULL</b> otherwise.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetsecuritytokenproperty
     * @since windows6.1
     */
    static WsGetSecurityTokenProperty(securityToken, id, value, valueSize, heap, error) {
        result := DllCall("webservices.dll\WsGetSecurityTokenProperty", "ptr*", securityToken, "int", id, "ptr", value, "uint", valueSize, "ptr*", heap, "ptr*", error, "int")
        return result
    }

    /**
     * Creates a security token from its specified XML form.
     * @param {Pointer<IntPtr>} tokenXml Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-buffer">WS_XML_BUFFER</a> structure containing  the security token in its XML form.    The referenced buffer must have exactly
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
     * @param {Pointer<IntPtr>} token On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-security-token">WS_SECURITY_TOKEN</a> structure representing the created XML security token.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreesecuritytoken">WsFreeSecurityToken</a>.
     *                 
     * 
     * The returned security token may be used with <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_token_message_security_binding">WS_XML_TOKEN_MESSAGE_SECURITY_BINDING</a> if it is to be
     * 
     * presented to a service.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatexmlsecuritytoken
     * @since windows6.1
     */
    static WsCreateXmlSecurityToken(tokenXml, tokenKey, properties, propertyCount, token, error) {
        result := DllCall("webservices.dll\WsCreateXmlSecurityToken", "ptr*", tokenXml, "ptr", tokenKey, "ptr", properties, "uint", propertyCount, "ptr", token, "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory resource associated with a Security Token object.
     * @param {Pointer<IntPtr>} token A pointer to the <b>Security Token</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-security-token">WS_SECURITY_TOKEN</a> object returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatexmlsecuritytoken">WsCreateXmlSecurityToken</a>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreesecuritytoken
     * @since windows6.1
     */
    static WsFreeSecurityToken(token) {
        result := DllCall("webservices.dll\WsFreeSecurityToken", "ptr*", token)
        return result
    }

    /**
     * Revokes a security context. Can only be called on the server side. Further requests using this security context will fail and a fault will be sent to the client.
     * @param {Pointer<IntPtr>} securityContext The security context to be revoked.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsrevokesecuritycontext
     * @since windows6.1
     */
    static WsRevokeSecurityContext(securityContext, error) {
        result := DllCall("webservices.dll\WsRevokeSecurityContext", "ptr*", securityContext, "ptr*", error, "int")
        return result
    }

    /**
     * Gets a property of the specified security context.
     * @param {Pointer<IntPtr>} securityContext The security context that is queried for its property.
     * @param {Integer} id The id of the property (one of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_context_property_id">WS_SECURITY_CONTEXT_PROPERTY_ID</a>).
     * @param {Pointer} value The address to place the retrieved value. The pointer must have an alignment compatible with the type of the property.
     * @param {Integer} valueSize The size of the buffer that the caller has allocated for the retrieved value.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetsecuritycontextproperty
     * @since windows6.1
     */
    static WsGetSecurityContextProperty(securityContext, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetSecurityContextProperty", "ptr*", securityContext, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Read an element producing a value of the specified WS_TYPE.
     * @remarks
     * This API will move to the next element, verify its name and namespace, and then
     *                 and deserialize the content as a typed value.
     *             
     * 
     * If the API fails, the state of input reader becomes undefined. The only APIs that may be used on the reader
     *         if this occurs are <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinput">WsSetInput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinputtobuffer">WsSetInputToBuffer</a> to return the reader to a usable state,
     *         or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreereader">WsFreeReader</a> to free the reader.
     * @param {Pointer<IntPtr>} reader The reader that is positioned on the XML to deserialize.
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} elementDescription A pointer to a description of how to deserialize the element.
     * @param {Integer} readOption Whether the element is required, and how to allocate the value.  
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<IntPtr>} heap The heap to store the deserialized values in.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadelement
     * @since windows6.1
     */
    static WsReadElement(reader, elementDescription, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadElement", "ptr*", reader, "ptr", elementDescription, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Read an attribute producing a value of the specified WS_TYPE.
     * @remarks
     * This API will search for the attribute given the name and namespace, and then
     *                 and deserialize the content as a typed value.
     *             
     * 
     * If the API fails, the state of input reader becomes undefined. The only APIs that may be used on the reader
     *         if this occurs are <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinput">WsSetInput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinputtobuffer">WsSetInputToBuffer</a> to return the reader to a usable state,
     *         or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreereader">WsFreeReader</a> to free the reader.
     * @param {Pointer<IntPtr>} reader The reader that is positioned on the element containing the attribute.
     * @param {Pointer<WS_ATTRIBUTE_DESCRIPTION>} attributeDescription A pointer to a description of how to deserialize the attribute.
     * @param {Integer} readOption Whether the attribute is required, and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<IntPtr>} heap The heap to store the deserialized values in.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadattribute
     * @since windows6.1
     */
    static WsReadAttribute(reader, attributeDescription, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadAttribute", "ptr*", reader, "ptr", attributeDescription, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Read a value of a given WS_TYPE from XML according to the WS_TYPE_MAPPING.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> for how to use this function to read values from elements and attributes.
     *             
     * 
     * If the API fails, the state of input reader becomes undefined. The only APIs that may be used on the reader
     *         if this occurs are <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinput">WsSetInput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetinputtobuffer">WsSetInputToBuffer</a> to return the reader to a usable state,
     *         or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreereader">WsFreeReader</a> to free the reader.
     * @param {Pointer<IntPtr>} reader The reader that is positioned on the XML to deserialize.
     * @param {Integer} typeMapping Describes how the type maps to the XML that is being read.
     * @param {Integer} type The type of the value to deserialize.
     * @param {Pointer<Void>} typeDescription Additional information about the type.  Each type has a different description
     *                     structure.  This may be <b>NULL</b>, depending on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>.
     * @param {Integer} readOption Whether the value is required, and how to allocate the value.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a> for more information.
     * @param {Pointer<IntPtr>} heap The heap to store the deserialized values in.
     * @param {Pointer} value The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Integer} valueSize The interpretation of this parameter depends on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_read_option">WS_READ_OPTION</a>.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadtype
     * @since windows6.1
     */
    static WsReadType(reader, typeMapping, type, typeDescription, readOption, heap, value, valueSize, error) {
        result := DllCall("webservices.dll\WsReadType", "ptr*", reader, "int", typeMapping, "int", type, "ptr", typeDescription, "int", readOption, "ptr*", heap, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Write a typed value as an XML element.
     * @remarks
     * This API writes the start element, the attributes, child elements / text, and the end element
     *                 that corresponds to the specified value.
     *             
     * 
     * If the API fails, the state of input writer becomes undefined. The only APIs that may be used on the writer
     *         if this occurs are <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutput">WsSetOutput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutputtobuffer">WsSetOutputToBuffer</a> to return the writer to a usable state,
     *         or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreewriter">WsFreeWriter</a> to free the writer.
     * @param {Pointer<IntPtr>} writer The writer to write the element to.
     * @param {Pointer<WS_ELEMENT_DESCRIPTION>} elementDescription A pointer to a description of how to serialize the element.
     * @param {Integer} writeOption Information about how the value is allocated.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} value A pointer to the value to serialize.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     *                 
     * 
     * If the value is <b>NULL</b>, then the size should be 0.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswriteelement
     * @since windows6.1
     */
    static WsWriteElement(writer, elementDescription, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsWriteElement", "ptr*", writer, "ptr", elementDescription, "int", writeOption, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Write a typed value as an XML attribute.
     * @remarks
     * This API writes the start attribute, attribute value, and end attribute.
     *             
     * 
     * If the API fails, the state of input writer becomes undefined. The only APIs that may be used on the writer
     *         if this occurs are <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutput">WsSetOutput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutputtobuffer">WsSetOutputToBuffer</a> to return the writer to a usable state,
     *         or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreewriter">WsFreeWriter</a> to free the writer.
     * @param {Pointer<IntPtr>} writer The writer to write the attribute to.
     * @param {Pointer<WS_ATTRIBUTE_DESCRIPTION>} attributeDescription A pointer to a description of how to serialize the attribute.
     * @param {Integer} writeOption Information about how the value is allocated.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} value A pointer to the value to serialize.
     * @param {Integer} valueSize The size of the value being serialized, in bytes.
     *                 
     * 
     * If the value is <b>NULL</b>, then the size should be 0.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswriteattribute
     * @since windows6.1
     */
    static WsWriteAttribute(writer, attributeDescription, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsWriteAttribute", "ptr*", writer, "ptr", attributeDescription, "int", writeOption, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Write a value of a given WS_TYPE to XML according to the WS_TYPE_MAPPING.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a> for how to use this function to write values in elements and attributes.                
     *             
     * 
     * If the API fails, the state of input writer becomes undefined. The only APIs that may be used on the writer
     *         if this occurs are <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutput">WsSetOutput</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wssetoutputtobuffer">WsSetOutputToBuffer</a> to return the writer to a usable state,
     *         or <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreewriter">WsFreeWriter</a> to free the writer.
     * @param {Pointer<IntPtr>} writer The writer to write the value to.
     * @param {Integer} typeMapping Describes how the type maps to the XML that is being written.
     * @param {Integer} type The type of the value to serialize.
     * @param {Pointer<Void>} typeDescription Additional information about the type.  Each type has a different description
     *                     structure.  This may be <b>NULL</b>, depending on the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_TYPE</a>.
     * @param {Integer} writeOption Whether the value is required, and how the value is allocated.
     *                     See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_write_option">WS_WRITE_OPTION</a> for more information.
     * @param {Pointer} value A pointer to the value to serialize.
     * @param {Integer} valueSize The size of the value being serialized.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wswritetype
     * @since windows6.1
     */
    static WsWriteType(writer, typeMapping, type, typeDescription, writeOption, value, valueSize, error) {
        result := DllCall("webservices.dll\WsWriteType", "ptr*", writer, "int", typeMapping, "int", type, "ptr", typeDescription, "int", writeOption, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * A service operation can use this function to register for a cancel notification. It is only valid to call this API when the service operation is executing. The behavior for calling it after the completion of Service Operation is not supported.
     * @param {Pointer<IntPtr>} context The context that the property value is being obtained for.
     * @param {Pointer<WS_OPERATION_CANCEL_CALLBACK>} cancelCallback Function pointer for cancel notification function.
     * @param {Pointer<WS_OPERATION_FREE_STATE_CALLBACK>} freestateCallback A optional parameter specifying the function pointer to the free state call.
     * @param {Pointer<Void>} userState A optional parameter specifying the application specific state which can be used to identify call data.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsregisteroperationforcancel
     * @since windows6.1
     */
    static WsRegisterOperationForCancel(context, cancelCallback, freestateCallback, userState, error) {
        result := DllCall("webservices.dll\WsRegisterOperationForCancel", "ptr*", context, "ptr", cancelCallback, "ptr", freestateCallback, "ptr", userState, "ptr*", error, "int")
        return result
    }

    /**
     * Retrieves a specified Service Host property. The property to retrieve is identified by a WS_SERVICE_PROPERTY_ID input parameter.
     * @param {Pointer<IntPtr>} serviceHost A pointer to the WS_SERVICE_HOST object containing the property to retrieve.
     * @param {Integer} id This is a <b>WS_SERVICE_PROPERTY_ID</b> enumerator value that identifies the property to retrieve.
     * @param {Pointer} value A void pointer to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetservicehostproperty
     * @since windows6.1
     */
    static WsGetServiceHostProperty(serviceHost, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetServiceHostProperty", "ptr*", serviceHost, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Creates a service host for the specified endpoints.
     * @param {Pointer<WS_SERVICE_ENDPOINT>} endpoints An array of  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a> structures representing the service endpoints for which to create the service host.
     * @param {Integer} endpointCount The number of endpoints in the <i>endpoints</i> array.
     * @param {Pointer<WS_SERVICE_PROPERTY>} serviceProperties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_property">WS_SERVICE_PROPERTY</a> structures containing optional properties for the service host.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>servicePropertyCount</i> parameter must be 0 (zero).
     * @param {Integer} servicePropertyCount The number of properties in the <i>serviceProperties</i> array.
     * @param {Pointer<IntPtr>} serviceHost On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a> structure representing the new service host.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeservicehost">WsFreeServiceHost</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreateservicehost
     * @since windows6.1
     */
    static WsCreateServiceHost(endpoints, endpointCount, serviceProperties, servicePropertyCount, serviceHost, error) {
        result := DllCall("webservices.dll\WsCreateServiceHost", "ptr", endpoints, "ushort", endpointCount, "ptr", serviceProperties, "uint", servicePropertyCount, "ptr", serviceHost, "ptr*", error, "int")
        return result
    }

    /**
     * Opens a Service Host for communication and starts the Listeners on all the endpoints. Client applications cannot connect to Service endpoints until WsOpenSerivceHost is called.
     * @remarks
     * Note that all the endpoints listeners have to successfully open before any channel is accepted by service host for communicating 
     *                 with the client.
     * @param {Pointer<IntPtr>} serviceHost A pointer to the <b>Service Host</b> object to open.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateservicehost">WsCreateServiceHost</a> and the referenced <b>Service Host</b> value may not be <b>NULL</b>.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer  to A WS_ASYNC_CONTEXT object that has information about how to invoke the function asynchronously.  The value is set to <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsopenservicehost
     * @since windows6.1
     */
    static WsOpenServiceHost(serviceHost, asyncContext, error) {
        result := DllCall("webservices.dll\WsOpenServiceHost", "ptr*", serviceHost, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Closes down communication with the specified service host.
     * @remarks
     * <b>WsCloseServiceHost</b> closes all  listeners on the service host. As a result, no new 
     *                 channels are accepted from the client. However, pending I/O on  channels already accepted 
     *                 is allowed to complete. 
     *                 
     * 
     * This has implications for endpoints configured to run with session-based channel bindings. If a client has an open session with a service on such an endpoint, the 
     *                 closure will not complete until the client closes the session with the service.
     * @param {Pointer<IntPtr>} serviceHost Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a> structure that represents the service host to be closed.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure containing information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscloseservicehost
     * @since windows6.1
     */
    static WsCloseServiceHost(serviceHost, asyncContext, error) {
        result := DllCall("webservices.dll\WsCloseServiceHost", "ptr*", serviceHost, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Aborts all current operations on the specified service host.
     * @remarks
     * <b>WsAbortServiceHost</b> aborts all  listeners on the service host, and as a result, no new channels are accepted from the client. All channels currently being used by the service host to service messages are aborted as well. 
     * 
     * If a call is pending and it has a cancel callback registered through the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsregisteroperationforcancel">WsRegisterOperationForCancel</a> function, the callback is called. However, the runtime still waits for the call to complete. 
     * 
     * 
     *            
     * 
     * For more information on registering for cancellation notification,
     *                 see  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsregisteroperationforcancel">WsRegisterOperationForCancel</a>.
     * @param {Pointer<IntPtr>} serviceHost Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a>  structure representing the service host on which to abort operations.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsabortservicehost
     * @since windows6.1
     */
    static WsAbortServiceHost(serviceHost, error) {
        result := DllCall("webservices.dll\WsAbortServiceHost", "ptr*", serviceHost, "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory associated with a Service Host object.
     * @param {Pointer<IntPtr>} serviceHost A pointer to the <b>Service Host</b> object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-host">WS_SERVICE_HOST</a> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateservicehost">WsCreateServiceHost</a> and the referenced <b>Service Host</b> value may not be <b>NULL</b>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreeservicehost
     * @since windows6.1
     */
    static WsFreeServiceHost(serviceHost) {
        result := DllCall("webservices.dll\WsFreeServiceHost", "ptr*", serviceHost)
        return result
    }

    /**
     * Resets service host so that it can be opened again.
     * @param {Pointer<IntPtr>} serviceHost The service host to reset.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsresetservicehost
     * @since windows6.1
     */
    static WsResetServiceHost(serviceHost, error) {
        result := DllCall("webservices.dll\WsResetServiceHost", "ptr*", serviceHost, "ptr*", error, "int")
        return result
    }

    /**
     * This function retrieves a specified Service Proxy property. The property to retrieve is identified by a WS_PROXY_PROPERTY_ID input parameter.
     * @param {Pointer<IntPtr>} serviceProxy This parameter is a pointer to the WS_SERVICE_PROXY object containing the property to retrieve.
     * @param {Integer} id The value of this parameter is a <b>WS_PROXY_PROPERTY_ID</b> enumerator value that identifies the property to retrieve.
     * @param {Pointer} value This parameter is a reference to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The value of this ULONG parameter represents the byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<IntPtr>} error This parameter is a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> pointer to where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetserviceproxyproperty
     * @since windows6.1
     */
    static WsGetServiceProxyProperty(serviceProxy, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetServiceProxyProperty", "ptr*", serviceProxy, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
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
     * @param {Pointer<IntPtr>} serviceProxy On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing the new service proxy.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeserviceproxy">WsFreeServiceProxy</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreateserviceproxy
     * @since windows6.1
     */
    static WsCreateServiceProxy(channelType, channelBinding, securityDescription, properties, propertyCount, channelProperties, channelPropertyCount, serviceProxy, error) {
        result := DllCall("webservices.dll\WsCreateServiceProxy", "int", channelType, "int", channelBinding, "ptr", securityDescription, "ptr", properties, "uint", propertyCount, "ptr", channelProperties, "uint", channelPropertyCount, "ptr", serviceProxy, "ptr*", error, "int")
        return result
    }

    /**
     * Opens a Service Proxy to a Service endpoint.
     * @param {Pointer<IntPtr>} serviceProxy A pointer to the <b>Service Proxy</b> to open.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> object
     *                     and the referenced value may not be <b>NULL</b>.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} address A pointer to the address of the endpoint.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext A pointer  to A WS_ASYNC_CONTEXT object that has information about how to invoke the function asynchronously.  The value is set to <b>NULL</b> if invoking synchronously.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsopenserviceproxy
     * @since windows6.1
     */
    static WsOpenServiceProxy(serviceProxy, address, asyncContext, error) {
        result := DllCall("webservices.dll\WsOpenServiceProxy", "ptr*", serviceProxy, "ptr", address, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Closes down communication with the specified service proxy.
     * @remarks
     * If a service operation call is pending on the service proxy, <b>WsCloseServiceProxy</b> waits for each call to complete. After calling <b>WsCloseServiceProxy</b> application should not perform any more calls on the service proxy.
     *             
     * 
     * Note that WS_E_INVALID_OPERATION is the only  
     *                    error code that indicates that  closure has failed. Other error codes indicate that the operation succeeded, and the error code is for informational purposes only.
     * @param {Pointer<IntPtr>} serviceProxy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing he service proxy to be closed.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_async_context">WS_ASYNC_CONTEXT</a> structure containing information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * The underlying <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-channel">WS_CHANNEL</a> was disconnected during the close operation. This error occurs only in cases where the underlying channel is session based.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscloseserviceproxy
     * @since windows6.1
     */
    static WsCloseServiceProxy(serviceProxy, asyncContext, error) {
        result := DllCall("webservices.dll\WsCloseServiceProxy", "ptr*", serviceProxy, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Aborts the service proxy, and cancels any pending I/O on the service proxy.
     * @remarks
     * <b>WsAbortServiceProxy</b> shows the following  behavior depending on the state of service proxy (see the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_service_proxy_state">WS_SERVICE_PROXY_STATE</a> enumeration for possible states):<ul>
     * <li>If the service proxy is opening and in the WS_SERVICE_PROXY_STATE_OPENING state, you can call <b>WsAbortServiceProxy</b> to abort the opening operation. The service proxy will
     *                 cancel all pending I/O and transition back to WS_SERVICE_PROXY_STATE_CREATED state.</li>
     * <li>If the service proxy is already open and in the WS_SERVICE_PROXY_STATE_OPEN state, <b>WsAbortServiceProxy</b> will cause the service proxy to abort all underlying channels and transition to the 
     *             WS_SERVICE_PROXY_STATE_FAULTED state. Once the abort is initiated, the service proxy will not accept any new calls. The application can call <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscloseserviceproxy">WsCloseServiceProxy</a> to close it</li>
     * <li>If the service proxy is closing and in the WS_SERVICE_PROXY_STATE_CLOSING state, all underlying channels are aborted, and the service proxy transitions to the WS_SERVICE_PROXY_STATE_CLOSED state. 
     * </li>
     * </ul>
     * 
     * 
     * For an example of using this function, see <a href="https://docs.microsoft.com/windows/desktop/wsw/servicecancellationexample">ServiceCancellationExample</a>.
     * @param {Pointer<IntPtr>} serviceProxy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing the service proxy to abort.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsabortserviceproxy
     * @since windows6.1
     */
    static WsAbortServiceProxy(serviceProxy, error) {
        result := DllCall("webservices.dll\WsAbortServiceProxy", "ptr*", serviceProxy, "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory associated with a Service Proxy resource.
     * @remarks
     * For details of when it is allowed to call this function, see <a href="https://docs.microsoft.com/windows/desktop/wsw/service-proxy">Service Proxy</a> .
     * @param {Pointer<IntPtr>} serviceProxy A pointer to the <b>Service Proxy</b> to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> object
     *                     returned by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreateserviceproxy">WsCreateServiceProxy</a>. The referenced value may not be <b>NULL</b>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreeserviceproxy
     * @since windows6.1
     */
    static WsFreeServiceProxy(serviceProxy) {
        result := DllCall("webservices.dll\WsFreeServiceProxy", "ptr*", serviceProxy)
        return result
    }

    /**
     * Resets service proxy.
     * @param {Pointer<IntPtr>} serviceProxy The service proxy.
     * @param {Pointer<IntPtr>} error Specifies where additional error information should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsresetserviceproxy
     * @since windows6.1
     */
    static WsResetServiceProxy(serviceProxy, error) {
        result := DllCall("webservices.dll\WsResetServiceProxy", "ptr*", serviceProxy, "ptr*", error, "int")
        return result
    }

    /**
     * Abandons a specified call on the specified service proxy.
     * @remarks
     * Calls are identified by a call ID. This call ID is associated with the call by the WS_CALL_PROPERTY_CALL_ID  value of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_call_property_id">WS_CALL_PROPERTY_ID</a> enumeration. 
     *               
     * 
     * If the call ID is 0,  all pending calls on the service proxy are abandoned.
     *               For more information,
     *                     see the following topics:
     *                     <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wsw/client-side-service-operations">Client Side Service Operations</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wsw/callabandonexample">CallAbandonExample</a>
     * </li>
     * </ul>
     * 
     * 
     * Be aware that the actual I/O associated with the call is not canceled. The service proxy keeps the resources to complete the call even though the call was abandoned. 
     *             
     * 
     * This results in a consumption of resources that is aggravated if an application continues to abandon calls, as can happen when the server is slow to respond  to the 
     *                 client, and the client application abandons one call only to make the same call again.
     * @param {Pointer<IntPtr>} serviceProxy Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing the service proxy on which to abandon the call.
     * @param {Integer} callId ID of the call to abandon.
     *                 (See the Remarks section.)
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsabandoncall
     * @since windows6.1
     */
    static WsAbandonCall(serviceProxy, callId, error) {
        result := DllCall("webservices.dll\WsAbandonCall", "ptr*", serviceProxy, "uint", callId, "ptr*", error, "int")
        return result
    }

    /**
     * Used internally by the service proxy to format the specified arguments according to the specified metadata and send them in a message. The application should never call this function directly.
     * @param {Pointer<IntPtr>} serviceProxy Pointer to a WS_SERVICE_PROXY structure representing the service proxy.
     * @param {Pointer<WS_OPERATION_DESCRIPTION>} operation Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_operation_description">WS_OPERATION_DESCRIPTION</a> structure containing the metadata for the call.
     * @param {Pointer<Void>} arguments An array of pointers to the individual arguments for the service operation being represented by the <i>operation</i> parameter.
     * 
     * The number of elements must correspond to the number of parameters specified as part of WS_OPERATION_DESCRIPTION in
     *                    the operation parameter.
     * @param {Pointer<IntPtr>} heap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> structure representing the <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a> from which memory is allocated for the call.
     * @param {Pointer<WS_CALL_PROPERTY>} callProperties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_call_property">WS_CALL_PROPERTY</a> structures containing the call properties.
     * @param {Integer} callPropertyCount The number of properties in the call properties array.
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext Pointer to information for invoking the function asynchronously. Pass <b>NULL</b> to invoke the function synchronously.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscall
     * @since windows6.1
     */
    static WsCall(serviceProxy, operation, arguments, heap, callProperties, callPropertyCount, asyncContext, error) {
        result := DllCall("webservices.dll\WsCall", "ptr*", serviceProxy, "ptr", operation, "ptr", arguments, "ptr*", heap, "ptr", callProperties, "uint", callPropertyCount, "ptr", asyncContext, "ptr*", error, "int")
        return result
    }

    /**
     * Evaluates the components of an URL to determine its &quot;scheme&quot;.
     * @remarks
     * The grammar parsed for the schemes "http", "https", "net.tcp" and "soap.udp" can be found at http://www.ietf.org/rfc/rfc3986.txt.  For these schemes:
     *                     <ul>
     * <li>A non-empty hostname is required.
     *                       </li>
     * <li>For the IP-literal production all the characters demarcated by "[" and "]" are returned.  They are not enforced to follow the IPv6Address production.
     *                     </li>
     * <li>The userinfo part of authority (for example, userinfo@hostname:port) is not supported.
     *                     </li>
     * </ul>
     * 
     * 
     * If no port is specified the default port for that scheme is returned.
     *             
     * 
     * If no port is specified for the soap.udp scheme 0xFFFFFFFF is returned as the default.
     * @param {Pointer<WS_STRING>} url A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_string">WS_STRING</a>  representation of the URL to evaluate.
     * @param {Integer} flags Determines the URL scheme evaluation method.  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_writer_encoding_type">WS_URL_FLAGS</a>.
     * @param {Pointer<IntPtr>} heap A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> in which to allocate the returned URL reference.
     * @param {Pointer<WS_URL>} outUrl Reference to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_url">WS_URL</a> structure that encapsulates the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_url_scheme_type">WS_URL_SCHEME_TYPE</a> value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsdecodeurl
     * @since windows6.1
     */
    static WsDecodeUrl(url, flags, heap, outUrl, error) {
        result := DllCall("webservices.dll\WsDecodeUrl", "ptr", url, "uint", flags, "ptr*", heap, "ptr", outUrl, "ptr*", error, "int")
        return result
    }

    /**
     * Encodes the specified WS_URL into a URL string given its component parts. Values are escaped as necessary, combined, and stored in the specified WS_HEAP, and the result is returned as a WS_STRING.
     * @remarks
     * If a scheme is not recognized in the <i>url</i> parameter the function returns WS_E_INVALID_FORMAT.  
     *                 Only scheme types identified in  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_url_scheme_type">WS_URL_SCHEME_TYPE</a> are supported.
     * @param {Pointer<WS_URL>} url A reference to the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_url">WS_URL</a> to encode.
     * @param {Integer} flags The value of this parameter determines the URL scheme evaluation method.  See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_writer_encoding_type">WS_URL_FLAGS</a>.
     * @param {Pointer<IntPtr>} heap A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> in which to allocate URL.
     * @param {Pointer<WS_STRING>} outUrl A pointer to the resulting URL string.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsencodeurl
     * @since windows6.1
     */
    static WsEncodeUrl(url, flags, heap, outUrl, error) {
        result := DllCall("webservices.dll\WsEncodeUrl", "ptr", url, "uint", flags, "ptr*", heap, "ptr", outUrl, "ptr*", error, "int")
        return result
    }

    /**
     * Produces an absolute URL from a specified URL reference (absolute or relative URL) and a specified absolute base URL.
     * @remarks
     * If the reference URL is absolute, it is returned unchanged, if the specified flags permit.
     *             If the reference URL is relative, it is combined with the base URL before being returned.
     *             
     * 
     * Only the schemes listed in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_url_scheme_type">WS_URL_SCHEME_TYPE</a> are supported.
     * @param {Pointer<WS_STRING>} baseUrl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_STRING</a> structure containing an absolute URL in encoded format.
     * @param {Pointer<WS_STRING>} referenceUrl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_STRING</a> structure  containing an absolute or relative URL in encoded format.
     * @param {Integer} flags Controls the  format of the resulting URL.  For more information, see <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_writer_encoding_type">WS_URL_FLAGS</a>.
     * @param {Pointer<IntPtr>} heap Pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-heap">WS_HEAP</a> object from which the memory for the resulting URL is allocated.
     * @param {Pointer<WS_STRING>} resultUrl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-listener">WS_STRING</a> structure that receives the resulting URL.
     *                 This is an absolute URL in encoded format.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscombineurl
     * @since windows6.1
     */
    static WsCombineUrl(baseUrl, referenceUrl, flags, heap, resultUrl, error) {
        result := DllCall("webservices.dll\WsCombineUrl", "ptr", baseUrl, "ptr", referenceUrl, "uint", flags, "ptr*", heap, "ptr", resultUrl, "ptr*", error, "int")
        return result
    }

    /**
     * Converts a WS_DATETIME object into a FILETIME object. A reference to the FILETIME object is returned by output parameter.
     * @remarks
     * A FILETIME cannot represent dates between January 1, 0001 and January 1, 1601.  A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_datetime">WS_DATETIME</a> within this range causes the function to return <b>WS_E_INVALID_FORMAT</b>.
     *       (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * @param {Pointer<WS_DATETIME>} dateTime A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_datetime">WS_DATETIME</a> structure to convert.
     * @param {Pointer<FILETIME>} fileTime A pointer to the new FILETIME object that contains the converted time.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsdatetimetofiletime
     * @since windows6.1
     */
    static WsDateTimeToFileTime(dateTime, fileTime, error) {
        result := DllCall("webservices.dll\WsDateTimeToFileTime", "ptr", dateTime, "ptr", fileTime, "ptr*", error, "int")
        return result
    }

    /**
     * Takes a reference to a FILETIME object and converts it into a WS_DATETIME object. A reference to the WS_DATETIME object is returned by output parameter.
     * @remarks
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_datetime">WS_DATETIME</a> cannot represent dates from the year 10000 and beyond.  A FILETIME representing a date
     *         later than this will cause the function return <b>WS_E_INVALID_FORMAT</b>.
     *       (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
     * 
     * The format field of the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_datetime">WS_DATETIME</a> will be set to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_datetime_format">WS_DATETIME_FORMAT_UTC</a>.
     * @param {Pointer<FILETIME>} fileTime A pointer to the FILETIME structure to convert.
     * @param {Pointer<WS_DATETIME>} dateTime A pointer to the new WS_DATETIME object that has the newly converted time.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfiletimetodatetime
     * @since windows6.1
     */
    static WsFileTimeToDateTime(fileTime, dateTime, error) {
        result := DllCall("webservices.dll\WsFileTimeToDateTime", "ptr", fileTime, "ptr", dateTime, "ptr*", error, "int")
        return result
    }

    /**
     * Creates a metadata object that is used to collect and process metadata documents.
     * @param {Pointer<WS_METADATA_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_metadata_property">WS_METADATA_PROPERTY</a> structures containing optional properties for the metadata.
     * 
     * The value of this parameter may be <b>NULL</b>, in which case, the <i>propertyCount</i> parameter must be 0 (zero).
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<IntPtr>} metadata On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> structure representing the new message.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreemetadata">WsFreeMetadata</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreatemetadata
     * @since windows6.1
     */
    static WsCreateMetadata(properties, propertyCount, metadata, error) {
        result := DllCall("webservices.dll\WsCreateMetadata", "ptr", properties, "uint", propertyCount, "ptr", metadata, "ptr*", error, "int")
        return result
    }

    /**
     * Reads a Metadata element and adds it to the Metadata documents of the Metadata object.
     * @remarks
     * This function recognizes the following types of metadata:
     *             
     * 
     * <ul>
     * <li>WSDL 1.1 documents
     *                 </li>
     * <li>WS-Policy 1.2 documents </li>
     * </ul>
     * @param {Pointer<IntPtr>} metadata A pointer to the <b>Metadata</b> object for storing the metadata read.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> object.
     * @param {Pointer<IntPtr>} reader A pointer to the <b>XML Reader</b> object used to read the metadata.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-xml-reader">WS_XML_READER</a> object and the reader must be positioned on the element containing the desired metadata.
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
     * 
     * ``` syntax
     * 
     * http://example.com/document1#fragment
     * http://example.com/document2
     * 
     * ```
     * 
     * The two base URLs would be:
     *                 
     * 
     * 
     * ``` syntax
     * 
     * http://example.com/document1
     * http://example.com/document2
     * 
     * ```
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsreadmetadata
     * @since windows6.1
     */
    static WsReadMetadata(metadata, reader, url, error) {
        result := DllCall("webservices.dll\WsReadMetadata", "ptr*", metadata, "ptr*", reader, "ptr", url, "ptr*", error, "int")
        return result
    }

    /**
     * Releases the memory resource associated with a metadata object.
     * @remarks
     * Any <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> objects that
     *                 were retrieved using the metadata object will also be freed.
     * @param {Pointer<IntPtr>} metadata A pointer to the metadata object to release.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> object returned
     *                     by <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wscreatemetadata">WsCreateMetadata</a> and the referenced value may not be <b>NULL</b>.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsfreemetadata
     * @since windows6.1
     */
    static WsFreeMetadata(metadata) {
        result := DllCall("webservices.dll\WsFreeMetadata", "ptr*", metadata)
        return result
    }

    /**
     * Resets a metadata object state to WS_METADATA_STATE_CREATED. In this state the Metadata object can be reused. WS_POLICY objects that were retrieved using the Metadata object will be released.
     * @remarks
     * Reusing a metadata instead of creating one from scratch may improve performance.
     *             If called correctly, this function will not fail.
     * @param {Pointer<IntPtr>} metadata A pointer to the <b>Metadata</b> object to reset.  The pointer must reference a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a>.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsresetmetadata
     * @since windows6.1
     */
    static WsResetMetadata(metadata, error) {
        result := DllCall("webservices.dll\WsResetMetadata", "ptr*", metadata, "ptr*", error, "int")
        return result
    }

    /**
     * Retrieves a specified WS_METADATA object property. The property to retrieve is identified by a WS_METADATA_PROPERTY_ID input parameter.
     * @param {Pointer<IntPtr>} metadata A pointer to a <b>Metadata</b> object containing the desired property.  This parameter must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> object.
     * @param {Integer} id Identifier value of the property to retrieve.
     * @param {Pointer} value A reference to a location for storing the retrieved property value.
     *                     The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The byte-length buffer size allocated by the caller to store the retrieved property value.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetmetadataproperty
     * @since windows6.1
     */
    static WsGetMetadataProperty(metadata, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetMetadataProperty", "ptr*", metadata, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * This function returns the address of a missing document that is referenced by the metadata object.
     * @remarks
     * Whether or not this function will verify host names of URLs returned can be
     *                 controlled using the <b>WS_METADATA_PROPERTY_VERIFY_HOST_NAMES</b> enumerator value.
     *             
     * 
     * The purpose of the host name verification is to ensure that an application
     *                 does not use the address without knowing that it is from a host that it 
     *                 is willing to accept metadata from.
     * @param {Pointer<IntPtr>} metadata This parameter is a pointer to a <b>Metadata</b> object that should have the document.
     * @param {Pointer<WS_ENDPOINT_ADDRESS>} address On success this parameter is populated with either a pointer to the address of a missing metadata document, or <b>NULL</b> if there are no missing metadata documents.
     *                 
     * The returned address URL is fully qualified.
     *                 
     * 
     * <div class="alert"><b>Note</b>  The data returned by this function is valid until the metadata object is freed or reset.  The data should not be modified.</div>
     * <div> </div>
     * @param {Pointer<IntPtr>} error This parameter is a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> pointer to where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetmissingmetadatadocumentaddress
     * @since windows6.1
     */
    static WsGetMissingMetadataDocumentAddress(metadata, address, error) {
        result := DllCall("webservices.dll\WsGetMissingMetadataDocumentAddress", "ptr*", metadata, "ptr", address, "ptr*", error, "int")
        return result
    }

    /**
     * Returns the &quot;Endpoints&quot; defined within the metadata object documents.
     * @remarks
     * This property may be used in <b>WS_METADATA_STATE_CREATED</b> or <b>WS_METADATA_STATE_RESOLVED</b> state.
     *             
     * 
     * This function will fail if there are missing metadata documents.
     *                 Use <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetmissingmetadatadocumentaddress">WsGetMissingMetadataDocumentAddress</a> to determine
     *                 the address of any missing documents.
     * @param {Pointer<IntPtr>} metadata A pointer to a <b>Metadata</b> object containing the desired Endpoints.  This parameter must be a valid <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-metadata">WS_METADATA</a> object.
     * @param {Pointer<WS_METADATA_ENDPOINTS>} endpoints On success this pointer parameter 
     *                     is populated with information about the endpoints that were 
     *                     defined in the metadata object.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetmetadataendpoints
     * @since windows6.1
     */
    static WsGetMetadataEndpoints(metadata, endpoints, error) {
        result := DllCall("webservices.dll\WsGetMetadataEndpoints", "ptr*", metadata, "ptr", endpoints, "ptr*", error, "int")
        return result
    }

    /**
     * Verifies that a Policy Alternative is compatible with the specified Policy Constraint.
     * @remarks
     * Each of these data types contain a struct field called "out".         
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_channel_property_constraint">WS_CHANNEL_PROPERTY_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_property_constraint">WS_SECURITY_PROPERTY_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_property_constraint">WS_SECURITY_BINDING_PROPERTY_CONSTRAINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_ssl_transport_security_binding_constraint">WS_SSL_TRANSPORT_SECURITY_BINDING_CONSTRAINT</a>
     * </li>
     * </ul>
     * The content of the <b>out</b> field of these structures is populated by this function if the call returns NOERROR.
     *             
     * 
     * <div class="alert"><b>Note</b>  If the function call fails the content <b>out</b> may have been partially set and only some allocations may have been made from the specified heap object. The content of the <b>out</b> field must not be examined unless the function returns NOERROR.
     *             
     * <p class="note">The policy object may delay some processing until this function is called.  If the processing fails the policy object is set to  <b>WS_POLICY_STATE_FAULTED</b>.
     *             
     * 
     * </div>
     * <div> </div>
     * @param {Pointer<IntPtr>} policy A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> object  containing the alternative.
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
     * @param {Integer} matchRequired Indicates whether a match is required or not.  
     * 
     * <div class="alert"><b>Note</b>  If the value is <b>FALSE</b> a match is not required, and in conjunction with a non-matching policy alternative, the function returns S_FALSE.
     * 
     * If the value of this parameter is <b>TRUE</b> a match is required,  and if the policy does not match, the function returns an error.
     * </div>
     * <div> </div>
     * @param {Pointer<IntPtr>} heap A pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">Heap</a> object used to store any data requiring allocation beyond the specified constraint. 
     * <div class="alert"><b>Note</b>  For example pointer types within the constraint "out" fields is allocated using this Heap.
     * </div>
     * <div> </div>
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsmatchpolicyalternative
     * @since windows6.1
     */
    static WsMatchPolicyAlternative(policy, alternativeIndex, policyConstraints, matchRequired, heap, error) {
        result := DllCall("webservices.dll\WsMatchPolicyAlternative", "ptr*", policy, "uint", alternativeIndex, "ptr", policyConstraints, "int", matchRequired, "ptr*", heap, "ptr*", error, "int")
        return result
    }

    /**
     * Retrieves a property of a policy object.
     * @remarks
     * The data returned by this function is good until the 
     *                 metadata object is freed or reset.
     * @param {Pointer<IntPtr>} policy A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> object from which to obtain the property.
     * @param {Integer} id An identifier of the policy property to retrieve.
     * @param {Pointer} value A pointer to the address to store the retrieved property value. The pointer must have an alignment compatible with the type
     *                     of the property.
     * @param {Integer} valueSize The number of bytes allocated by the caller to
     *                     store the retrieved property.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetpolicyproperty
     * @since windows6.1
     */
    static WsGetPolicyProperty(policy, id, value, valueSize, error) {
        result := DllCall("webservices.dll\WsGetPolicyProperty", "ptr*", policy, "int", id, "ptr", value, "uint", valueSize, "ptr*", error, "int")
        return result
    }

    /**
     * Retrieves the number of alternatives available in the policy object. The alternative count can be used to loop through each alternative using WsMatchPolicyAlternative.
     * @remarks
     * Note that each alternative is not guaranteed to be unique within the policy
     *                 (there may be duplicates).
     * @param {Pointer<IntPtr>} policy A pointer to the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-policy">WS_POLICY</a> object from which to count alternatives.
     * @param {Pointer<UInt32>} count A pointer to the number value of alternatives.  This may be 0.
     * @param {Pointer<IntPtr>} error A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> object where additional information about the error should be stored if the function fails.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wsgetpolicyalternativecount
     * @since windows6.1
     */
    static WsGetPolicyAlternativeCount(policy, count, error) {
        result := DllCall("webservices.dll\WsGetPolicyAlternativeCount", "ptr*", policy, "uint*", count, "ptr*", error, "int")
        return result
    }

    /**
     * Helper routine for creating a service proxy from policy templates.
     * @remarks
     * <b>WsCreateServiceProxyFromTemplate</b> creates the <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure from input policy templates and additional user input.
     *       
     * 
     * The following table shows the mapping between <i>templateType</i> values and the corresponding data types to be used in <i>templateValue</i> and <i>templateDescription</i>.
     * 
     * <table>
     * <tr>
     * <th>templateType</th>
     * <th>templateValue</th>
     * <th>templateDescription</th>
     * </tr>
     * <tr>
     * <td>WS_HTTP_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_HTTP_BINDING_TEMPLATE</td>
     * <td>WS_HTTP_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_HTTP_SSL_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_HTTP_SSL_BINDING_TEMPLATE</td>
     * <td>WS_HTTP_SSL_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_HTTP_HEADER_AUTH_BINDING_TEMPLATE</td>
     * <td>WS_HTTP_HEADER_AUTH_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_HTTP_SSL_HEADER_AUTH_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_HTTP_SSL_HEADER_AUTH_BINDING_TEMPLATE</td>
     * <td>WS_HTTP_SSL_HEADER_AUTH_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_HTTP_SSL_USERNAME_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_HTTP_SSL_USERNAME_BINDING_TEMPLATE</td>
     * <td>WS_HTTP_SSL_USERNAME_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_HTTP_SSL_KERBEROS_APREQ_BINDING_TEMPLATE</td>
     * <td>WS_HTTP_SSL_KERBEROS_APREQ_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_TCP_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_TCP_BINDING_TEMPLATE</td>
     * <td>WS_TCP_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_TCP_SSPI_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_TCP_SSPI_BINDING_TEMPLATE</td>
     * <td>WS_TCP_SSPI_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_TCP_SSPI_USERNAME_BINDING_TEMPLATE</td>
     * <td>WS_TCP_SSPI_USERNAME_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_TCP_SSPI_KERBEROS_APREQ_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_TCP_SSPI_KERBEROS_APREQ_BINDING_TEMPLATE</td>
     * <td>WS_TCP_SSPI_KERBEROS_APREQ_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE</td>
     * <td>WS_HTTP_SSL_USERNAME_SECURITY_CONTEXT_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE</td>
     * <td>WS_HTTP_SSL_KERBEROS_APREQ_SECURITY_CONTEXT_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_BINDING_TEMPLATE</td>
     * <td>WS_TCP_SSPI_USERNAME_SECURITY_CONTEXT_POLICY_DESCRIPTION</td>
     * </tr>
     * <tr>
     * <td>WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE_TYPE</td>
     * <td>WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_BINDING_TEMPLATE</td>
     * <td>WS_TCP_SSPI_KERBEROS_APREQ_SECURITY_CONTEXT_POLICY_DESCRIPTION</td>
     * </tr>
     * </table>
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
     * @param {Pointer<IntPtr>} serviceProxy On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-service-proxy">WS_SERVICE_PROXY</a> structure representing the new service proxy.
     *                 
     * When you no longer need this structure, you must free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsfreeserviceproxy">WsFreeServiceProxy</a>.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreateserviceproxyfromtemplate
     * @since windows6.1
     */
    static WsCreateServiceProxyFromTemplate(channelType, properties, propertyCount, templateType, templateValue, templateSize, templateDescription, templateDescriptionSize, serviceProxy, error) {
        result := DllCall("webservices.dll\WsCreateServiceProxyFromTemplate", "int", channelType, "ptr", properties, "uint", propertyCount, "int", templateType, "ptr", templateValue, "uint", templateSize, "ptr", templateDescription, "uint", templateDescriptionSize, "ptr", serviceProxy, "ptr*", error, "int")
        return result
    }

    /**
     * Helper routine for creating a service endpoint (WS_SERVICE_ENDPOINT) from policy templates.
     * @remarks
     * <b>WsCreateServiceEndpointFromTemplate</b> creates the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a> structure from the specified input policy templates and additional user input.
     * @param {Integer} channelType A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_channel_type">WS_CHANNEL_TYPE</a> enumeration value representing the type of channel hosted by the endpoint.
     * @param {Pointer<WS_SERVICE_ENDPOINT_PROPERTY>} properties An array of <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_service_endpoint_property">WS_SERVICE_ENDPOINT_PROPERTY</a>  structures containing  properties for the service endpoint. (Application should fill in channel properties in the template structure.)
     * @param {Integer} propertyCount The number of properties in the <i>properties</i> array.
     * @param {Pointer<WS_STRING>} addressUrl The URL address on which the endpoint is  to listen.
     * @param {Pointer<WS_SERVICE_CONTRACT>} contract A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_contract">WS_SERVICE_CONTRACT</a> structure representing the contract of the endpoint.
     * @param {Pointer<WS_SERVICE_SECURITY_CALLBACK>} authorizationCallback A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_service_security_callback">WS_SERVICE_SECURITY_CALLBACK</a> authorization callback for the service endpoint.
     * @param {Pointer<IntPtr>} heap The <a href="https://docs.microsoft.com/windows/desktop/wsw/heap">heap</a> from which memory for the  service endpoint is allocated on successful return.
     * @param {Integer} templateType A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_binding_template_type">WS_BINDING_TEMPLATE_TYPE</a> enumeration value representing the type of templates being used to create the service endpoint.
     * @param {Pointer} templateValue Optional template structure to be created and filled in by application.
     *           The template must be consistent with the input template type (passed in the <i>templateType</i>  parameter). When the <i>templateValue</i> parameter is <b>NULL</b>,
     *           it is equivalent to the corresponding template structure initialized to zero.
     * @param {Integer} templateSize The size, in bytes, of the input templateValue structure.
     * @param {Pointer<Void>} templateDescription The description of template structure (passed in the <i>templateValue</i> parameter). Needs to match templateType.
     * @param {Integer} templateDescriptionSize The size of the template description.
     * @param {Pointer<WS_SERVICE_ENDPOINT>} serviceEndpoint On   success, a pointer that receives the address of the  <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_service_endpoint">WS_SERVICE_ENDPOINT</a> structure representing the new service endpoint.
     * @param {Pointer<IntPtr>} error Pointer to a <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-error">WS_ERROR</a> structure  that receives additional error information if the function fails.
     * @returns {Integer} If the function succeeds, it returns NO_ERROR; otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/webservices/nf-webservices-wscreateserviceendpointfromtemplate
     * @since windows6.1
     */
    static WsCreateServiceEndpointFromTemplate(channelType, properties, propertyCount, addressUrl, contract, authorizationCallback, heap, templateType, templateValue, templateSize, templateDescription, templateDescriptionSize, serviceEndpoint, error) {
        result := DllCall("webservices.dll\WsCreateServiceEndpointFromTemplate", "int", channelType, "ptr", properties, "uint", propertyCount, "ptr", addressUrl, "ptr", contract, "ptr", authorizationCallback, "ptr*", heap, "int", templateType, "ptr", templateValue, "uint", templateSize, "ptr", templateDescription, "uint", templateDescriptionSize, "ptr", serviceEndpoint, "ptr*", error, "int")
        return result
    }

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
     * @param {Pointer<Int32>} pbIsUserVerifyingPlatformAuthenticatorAvailable A pointer to a **BOOL** that is set to **TRUE** if the authenticator service is available, or **FALSE** otherwise.
     * @returns {Integer} AN **HRESULT** indicating success or failure of the operation.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnisuserverifyingplatformauthenticatoravailable
     */
    static WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable(pbIsUserVerifyingPlatformAuthenticatorAvailable) {
        result := DllCall("webauthn.dll\WebAuthNIsUserVerifyingPlatformAuthenticatorAvailable", "int*", pbIsUserVerifyingPlatformAuthenticatorAvailable, "int")
        return result
    }

    /**
     * Creates a public key credential source bound to a managing authenticator and returns the credential public key associated with its credential private key.
     * @param {Pointer<Void>} hWnd The handle for the window that will be used to display the UI.
     * @param {Pointer<WEBAUTHN_RP_ENTITY_INFORMATION>} pRpInformation The Relying Party's **WEBAUTHN_RP_ENTITY_INFORMATION**.
     * @param {Pointer<WEBAUTHN_USER_ENTITY_INFORMATION>} pUserInformation The user account’s **WEBAUTHN_USER_ENTITY_INFORMATION**, containing the user handle given by the Relying Party.
     * @param {Pointer<WEBAUTHN_COSE_CREDENTIAL_PARAMETERS>} pPubKeyCredParams A sequence of pairs of public key credential type and public key algorithms requested by the Relying Party. This sequence is ordered from most preferred to least preferred. The authenticator makes a best-effort to create the most preferred credential that it can.
     * @param {Pointer<WEBAUTHN_CLIENT_DATA>} pWebAuthNClientData The client data to be sent to the authenticator for the Relying Party.
     * @param {Pointer<WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS>} pWebAuthNMakeCredentialOptions Provides the options to use when creating the public key credential source.
     * @param {Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>} ppWebAuthNCredentialAttestation On successful completion of this operation, the authenticator returns the attestation object to the client.
     * @returns {Integer} Returns an **HRESULT** indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnauthenticatormakecredential
     */
    static WebAuthNAuthenticatorMakeCredential(hWnd, pRpInformation, pUserInformation, pPubKeyCredParams, pWebAuthNClientData, pWebAuthNMakeCredentialOptions, ppWebAuthNCredentialAttestation) {
        result := DllCall("webauthn.dll\WebAuthNAuthenticatorMakeCredential", "ptr", hWnd, "ptr", pRpInformation, "ptr", pUserInformation, "ptr", pPubKeyCredParams, "ptr", pWebAuthNClientData, "ptr", pWebAuthNMakeCredentialOptions, "ptr", ppWebAuthNCredentialAttestation, "int")
        return result
    }

    /**
     * Produces an assertion signature representing an assertion by the authenticator that the user has consented to a specific transaction.
     * @remarks
     * > Note:
     * > Before performing this operation, all other operations in progress in the authenticator session MUST be aborted by running the [WebAuthNCancelCurrentOperation](./nf-webauthn-webauthncancelcurrentoperation.md) operation.
     * 
     * If the authenticator cannot find any credential corresponding to the specified Relying Party that matches the specified criteria, it terminates the operation and returns an error.
     * @param {Pointer<Void>} hWnd The handle for the window that will be used to display the UI.
     * @param {Pointer<Char>} pwszRpId The ID of the Relying Party.
     * @param {Pointer<WEBAUTHN_CLIENT_DATA>} pWebAuthNClientData The client data to be sent to the authenticator for the Relying Party.
     * @param {Pointer<WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS>} pWebAuthNGetAssertionOptions The options for the **WebAuthNAuthenticatorGetAssertion** operation.
     * @param {Pointer<WEBAUTHN_ASSERTION>} ppWebAuthNAssertion A pointer to a **WEBAUTHN_ASSERTION** that receives the assertion.
     * @returns {Integer} Returns an **HRESULT** indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnauthenticatorgetassertion
     */
    static WebAuthNAuthenticatorGetAssertion(hWnd, pwszRpId, pWebAuthNClientData, pWebAuthNGetAssertionOptions, ppWebAuthNAssertion) {
        pwszRpId := pwszRpId is String? StrPtr(pwszRpId) : pwszRpId

        result := DllCall("webauthn.dll\WebAuthNAuthenticatorGetAssertion", "ptr", hWnd, "ptr", pwszRpId, "ptr", pWebAuthNClientData, "ptr", pWebAuthNGetAssertionOptions, "ptr", ppWebAuthNAssertion, "int")
        return result
    }

    /**
     * Frees a previously allocated credential attestation.
     * @param {Pointer<WEBAUTHN_CREDENTIAL_ATTESTATION>} pWebAuthNCredentialAttestation The credential attestation to be freed.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreecredentialattestation
     */
    static WebAuthNFreeCredentialAttestation(pWebAuthNCredentialAttestation) {
        result := DllCall("webauthn.dll\WebAuthNFreeCredentialAttestation", "ptr", pWebAuthNCredentialAttestation)
        return result
    }

    /**
     * Frees a previously allocated WebAuthN assertion.
     * @param {Pointer<WEBAUTHN_ASSERTION>} pWebAuthNAssertion The **WEBAUTHN_ASSERTION** to be freed.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreeassertion
     */
    static WebAuthNFreeAssertion(pWebAuthNAssertion) {
        result := DllCall("webauthn.dll\WebAuthNFreeAssertion", "ptr", pWebAuthNAssertion)
        return result
    }

    /**
     * Gets the cancellation ID for a canceled operation.
     * @param {Pointer<Guid>} pCancellationId The **GUID** returned, representing the ID of the cancelled operation.
     * @returns {Integer} An **HRESULT** indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetcancellationid
     */
    static WebAuthNGetCancellationId(pCancellationId) {
        result := DllCall("webauthn.dll\WebAuthNGetCancellationId", "ptr", pCancellationId, "int")
        return result
    }

    /**
     * Terminates operation currently in progress in the authenticator session.
     * @remarks
     * This operation is ignored if it is invoked in an authenticator session which does not have an **WebAuthNAuthenticatorMakeCredential** or **WebAuthNAuthenticatorGetAssertion** operation currently in progress.
     * @param {Pointer<Guid>} pCancellationId The **GUID** returned, representing the ID of the cancelled operation.
     * @returns {Integer} Returns an **HRESULT** indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthncancelcurrentoperation
     */
    static WebAuthNCancelCurrentOperation(pCancellationId) {
        result := DllCall("webauthn.dll\WebAuthNCancelCurrentOperation", "ptr", pCancellationId, "int")
        return result
    }

    /**
     * Gets the list of stored credentials.
     * @param {Pointer<WEBAUTHN_GET_CREDENTIALS_OPTIONS>} pGetCredentialsOptions The options for the operation.
     * @param {Pointer<WEBAUTHN_CREDENTIAL_DETAILS_LIST>} ppCredentialDetailsList The credentials list returned by the operation.
     * @returns {Integer} An **HRESULT** indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetplatformcredentiallist
     */
    static WebAuthNGetPlatformCredentialList(pGetCredentialsOptions, ppCredentialDetailsList) {
        result := DllCall("webauthn.dll\WebAuthNGetPlatformCredentialList", "ptr", pGetCredentialsOptions, "ptr", ppCredentialDetailsList, "int")
        return result
    }

    /**
     * Frees the allocation for the platform credential list.
     * @param {Pointer<WEBAUTHN_CREDENTIAL_DETAILS_LIST>} pCredentialDetailsList The platform credential list to be freed.
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthnfreeplatformcredentiallist
     */
    static WebAuthNFreePlatformCredentialList(pCredentialDetailsList) {
        result := DllCall("webauthn.dll\WebAuthNFreePlatformCredentialList", "ptr", pCredentialDetailsList)
        return result
    }

    /**
     * Removes a credential source stored on an authenticator.
     * @param {Integer} cbCredentialId The ID of the credential to be removed.
     * @param {Pointer} pbCredentialId A pointer to the credential ID to be removed.
     * @returns {Integer} Returns an **HRESULT** indicating success or failure.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthndeleteplatformcredential
     */
    static WebAuthNDeletePlatformCredential(cbCredentialId, pbCredentialId) {
        result := DllCall("webauthn.dll\WebAuthNDeletePlatformCredential", "uint", cbCredentialId, "ptr", pbCredentialId, "int")
        return result
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
     * @param {Integer} hr The **HRESULT** to get the error name for.
     * @returns {Pointer<Char>} An error name string.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngeterrorname
     */
    static WebAuthNGetErrorName(hr) {
        result := DllCall("webauthn.dll\WebAuthNGetErrorName", "int", hr, "char*")
        return result
    }

    /**
     * Gets the W3C DOM error code for the last failed operation.
     * @param {Integer} hr The **HRESULT** returned by the last failed operation in the session.
     * @returns {Integer} An **HRESULT** with the failure status.
     * @see https://learn.microsoft.com/windows/win32/api/webauthn/nf-webauthn-webauthngetw3cexceptiondomerror
     */
    static WebAuthNGetW3CExceptionDOMError(hr) {
        result := DllCall("webauthn.dll\WebAuthNGetW3CExceptionDOMError", "int", hr, "int")
        return result
    }

;@endregion Methods
}
