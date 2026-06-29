#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_DEMAND_CBT := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_MAX_SERVER_QUEUE_LENGTH := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_MIN_SERVER_QUEUE_LENGTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_AUTH_ENABLE_BASIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_AUTH_ENABLE_DIGEST := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_AUTH_ENABLE_NTLM := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_AUTH_ENABLE_NEGOTIATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_AUTH_ENABLE_KERBEROS := 16

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_AUTH_EX_FLAG_ENABLE_KERBEROS_CREDENTIAL_CACHING := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_AUTH_EX_FLAG_CAPTURE_CREDENTIAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CHANNEL_BIND_PROXY := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CHANNEL_BIND_PROXY_COHOSTING := 32

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CHANNEL_BIND_NO_SERVICE_NAME_CHECK := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CHANNEL_BIND_DOTLESS_SERVICE := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CHANNEL_BIND_SECURE_CHANNEL_TOKEN := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CHANNEL_BIND_CLIENT_SERVICE := 16

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_DATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_TIME := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_CLIENT_IP := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_USER_NAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_SITE_NAME := 16

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_COMPUTER_NAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_SERVER_IP := 64

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_METHOD := 128

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_URI_STEM := 256

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_URI_QUERY := 512

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_STATUS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_WIN32_STATUS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_BYTES_SENT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_BYTES_RECV := 8192

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_TIME_TAKEN := 16384

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_SERVER_PORT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_USER_AGENT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_COOKIE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_REFERER := 262144

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_VERSION := 524288

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_HOST := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_SUB_STATUS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_STREAM_ID := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_STREAM_ID_EX := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_TRANSPORT_TYPE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_CLIENT_PORT := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_URI := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_SITE_ID := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_REASON := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_QUEUE_NAME := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_CORRELATION_ID := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOG_FIELD_FAULT_CODE := 2147483648

/**
 * @type {Integer (UInt64)}
 */
export global HTTP_LOG_FIELD_EXT_FAULT_CODE_EXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOGGING_FLAG_LOCAL_TIME_ROLLOVER := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOGGING_FLAG_USE_UTF8_CONVERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOGGING_FLAG_LOG_ERRORS_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_LOGGING_FLAG_LOG_SUCCESS_ONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CREATE_REQUEST_QUEUE_FLAG_DELEGATION := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_RECEIVE_REQUEST_ENTITY_BODY_FLAG_FILL_BUFFER := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SEND_RESPONSE_FLAG_DISCONNECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SEND_RESPONSE_FLAG_MORE_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SEND_RESPONSE_FLAG_ENABLE_NAGLING := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SEND_RESPONSE_FLAG_PROCESS_RANGES := 32

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SEND_RESPONSE_FLAG_OPAQUE := 64

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SEND_RESPONSE_FLAG_GOAWAY := 256

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SEND_RESPONSE_FLAG_AUTOMATIC_CHUNKING := 512

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_FLUSH_RESPONSE_FLAG_RECURSIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_URL_FLAG_REMOVE_ALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_RECEIVE_SECURE_CHANNEL_TOKEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_RECEIVE_FULL_CHAIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_SIZING_INFO_FLAG_TCP_FAST_OPEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_SIZING_INFO_FLAG_TLS_SESSION_RESUMPTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_SIZING_INFO_FLAG_TLS_FALSE_START := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_SIZING_INFO_FLAG_FIRST_REQUEST := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_AUTH_FLAG_TOKEN_FOR_CACHED_CRED := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_FLAG_MORE_ENTITY_BODY_EXISTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_FLAG_IP_ROUTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_FLAG_HTTP2 := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_FLAG_HTTP3 := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_FLAG_FAST_FORWARDING_ALLOWED := 16

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_FLAG_FAST_FORWARDING_RESPONSE_ALLOWED := 16

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_RESPONSE_FLAG_MULTIPLE_ENCODINGS_AVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_RESPONSE_FLAG_MORE_ENTITY_BODY_EXISTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_RESPONSE_INFO_FLAGS_PRESERVE_ORDER := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CERT_CHECK_MODE_NO_REVOCATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CERT_CHECK_MODE_CACHED_REVOCATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CERT_CHECK_MODE_USE_REVOCATION_FRESHNESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CERT_CHECK_MODE_CACHED_URLS := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CERT_CHECK_MODE_NO_AIA := 16

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_CERT_CHECK_MODE_NO_USAGE_CHECK := 65536

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SSL_CERT_SHA_HASH_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SSL_CERT_STORE_NAME_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_USE_DS_MAPPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_NEGOTIATE_CLIENT_CERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_NO_RAW_FILTER := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_REJECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_HTTP2 := 16

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_QUIC := 32

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS13 := 64

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_OCSP_STAPLING := 128

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_TOKEN_BINDING := 256

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_LOG_EXTENDED_EVENTS := 512

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_LEGACY_TLS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_SESSION_TICKET := 2048

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS12 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_CLIENT_CORRELATION := 8192

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_SESSION_ID := 16384

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_CACHE_CLIENT_HELLO := 32768

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_PROPERTY_SNI_HOST_MAX_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_PROPERTY_SNI_FLAG_SNI_USED := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_REQUEST_PROPERTY_SNI_FLAG_NO_SNI := 2

/**
 * @type {String}
 */
export global HTTP_VERSION := "HTTP/1.0"
;@endregion Constants
