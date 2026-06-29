#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_HEADER_MAPPING_COMMA_SEPARATOR := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_HEADER_MAPPING_SEMICOLON_SEPARATOR := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_HEADER_MAPPING_QUOTED_VALUE := 4

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_RESPONSE_MAPPING_STATUS_CODE := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_RESPONSE_MAPPING_STATUS_TEXT := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_REQUEST_MAPPING_VERB := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_DNS_HOST := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_DNS_FULLY_QUALIFIED_HOST := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_NETBIOS_HOST := 4

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_LOCAL_HOST := 8

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_HOST_ADDRESSES := 16

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_THIS_HOST := 31

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_PORT := 32

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_EXACT_PATH := 64

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_PREFIX_PATH := 128

/**
 * @type {Integer (Int32)}
 */
export global WS_MATCH_URL_NO_QUERY := 256

/**
 * @type {Integer (Int32)}
 */
export global WS_MUST_UNDERSTAND_HEADER_ATTRIBUTE := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_RELAY_HEADER_ATTRIBUTE := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_HEADER_AUTH_SCHEME_NONE := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_HEADER_AUTH_SCHEME_BASIC := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_HEADER_AUTH_SCHEME_DIGEST := 4

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_HEADER_AUTH_SCHEME_NTLM := 8

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_HEADER_AUTH_SCHEME_NEGOTIATE := 16

/**
 * @type {Integer (Int32)}
 */
export global WS_HTTP_HEADER_AUTH_SCHEME_PASSPORT := 32

/**
 * @type {Integer (Int32)}
 */
export global WS_CERT_FAILURE_CN_MISMATCH := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_CERT_FAILURE_INVALID_DATE := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_CERT_FAILURE_UNTRUSTED_ROOT := 4

/**
 * @type {Integer (Int32)}
 */
export global WS_CERT_FAILURE_WRONG_USAGE := 8

/**
 * @type {Integer (Int32)}
 */
export global WS_CERT_FAILURE_REVOCATION_OFFLINE := 16

/**
 * @type {Integer (Int32)}
 */
export global WS_STRUCT_ABSTRACT := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_STRUCT_IGNORE_TRAILING_ELEMENT_CONTENT := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_STRUCT_IGNORE_UNHANDLED_ATTRIBUTES := 4

/**
 * @type {Integer (Int32)}
 */
export global WS_FIELD_POINTER := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_FIELD_OPTIONAL := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_FIELD_NILLABLE := 4

/**
 * @type {Integer (Int32)}
 */
export global WS_FIELD_NILLABLE_ITEM := 8

/**
 * @type {Integer (Int32)}
 */
export global WS_FIELD_OTHER_NAMESPACE := 16

/**
 * @type {Integer (Int32)}
 */
export global WS_SERVICE_OPERATION_MESSAGE_NILLABLE_ELEMENT := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_URL_FLAGS_ALLOW_HOST_WILDCARDS := 1

/**
 * @type {Integer (Int32)}
 */
export global WS_URL_FLAGS_NO_PATH_COLLAPSE := 2

/**
 * @type {Integer (Int32)}
 */
export global WS_URL_FLAGS_ZERO_TERMINATE := 4
;@endregion Constants
