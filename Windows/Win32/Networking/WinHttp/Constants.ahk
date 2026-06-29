#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global HTTPREQUEST_PROXYSETTING_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global HTTPREQUEST_PROXYSETTING_PRECONFIG := 0

/**
 * @type {Integer (UInt32)}
 */
export global HTTPREQUEST_PROXYSETTING_DIRECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTPREQUEST_PROXYSETTING_PROXY := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTPREQUEST_SETCREDENTIALS_FOR_SERVER := 0

/**
 * @type {Integer (UInt32)}
 */
export global HTTPREQUEST_SETCREDENTIALS_FOR_PROXY := 1

/**
 * @type {Integer (UInt16)}
 */
export global INTERNET_DEFAULT_PORT := 0

/**
 * @type {Integer (UInt16)}
 */
export global INTERNET_DEFAULT_HTTP_PORT := 80

/**
 * @type {Integer (UInt16)}
 */
export global INTERNET_DEFAULT_HTTPS_PORT := 443

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FLAG_ASYNC := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FLAG_SECURE_DEFAULTS := 805306368

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FLAG_AUTOMATIC_CHUNKING := 512

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IGNORE_UNKNOWN_CA := 256

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE := 512

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IGNORE_CERT_CN_INVALID := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IGNORE_CERT_DATE_INVALID := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_AUTO_DETECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_CONFIG_URL := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_HOST_KEEPCASE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_HOST_LOWERCASE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_ALLOW_AUTOCONFIG := 256

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_ALLOW_STATIC := 512

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_ALLOW_CM := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_USE_INTERFACE_CONFIG := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_RUN_INPROCESS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_RUN_OUTPROCESS_ONLY := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_NO_DIRECTACCESS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_NO_CACHE_CLIENT := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_NO_CACHE_SVC := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOPROXY_SORT_RESULTS := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTO_DETECT_TYPE_DHCP := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTO_DETECT_TYPE_DNS_A := 2

/**
 * @type {Integer (UInt32)}
 */
export global NETWORKING_KEY_BUFSIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_TYPE_DIRECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_TYPE_PROXY := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_TYPE_AUTO_PROXY_URL := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_TYPE_AUTO_DETECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_REQUEST_STAT_FLAG_TCP_FAST_OPEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_REQUEST_STAT_FLAG_TLS_SESSION_RESUMPTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_REQUEST_STAT_FLAG_TLS_FALSE_START := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_REQUEST_STAT_FLAG_PROXY_TLS_SESSION_RESUMPTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_REQUEST_STAT_FLAG_PROXY_TLS_FALSE_START := 16

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_REQUEST_STAT_FLAG_FIRST_REQUEST := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_MATCH_CONNECTION_GUID_FLAG_REQUIRE_MARKED_CONNECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_MATCH_CONNECTION_GUID_FLAGS_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_SOFT_LIMIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_BYPASS_CACHE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_USE_DNS_TTL := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_CONN_USE_TTL := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_TIME_FORMAT_BUFSIZE := 62

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CALLBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_RESOLVE_TIMEOUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONNECT_TIMEOUT := 3

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONNECT_RETRIES := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SEND_TIMEOUT := 5

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_RECEIVE_TIMEOUT := 6

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_RECEIVE_RESPONSE_TIMEOUT := 7

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HANDLE_TYPE := 9

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_READ_BUFFER_SIZE := 12

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_WRITE_BUFFER_SIZE := 13

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PARENT_HANDLE := 21

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_EXTENDED_ERROR := 24

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SECURITY_FLAGS := 31

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SECURITY_CERTIFICATE_STRUCT := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_URL := 34

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SECURITY_KEY_BITNESS := 36

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PROXY := 38

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PROXY_RESULT_ENTRY := 39

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_USER_AGENT := 41

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONTEXT_VALUE := 45

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CLIENT_CERT_CONTEXT := 47

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REQUEST_PRIORITY := 58

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP_VERSION := 59

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_DISABLE_FEATURE := 63

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CODEPAGE := 68

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_MAX_CONNS_PER_SERVER := 73

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_MAX_CONNS_PER_1_0_SERVER := 74

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_AUTOLOGON_POLICY := 77

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SERVER_CERT_CONTEXT := 78

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_ENABLE_FEATURE := 79

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_WORKER_THREAD_COUNT := 80

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PASSPORT_COBRANDING_TEXT := 81

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PASSPORT_COBRANDING_URL := 82

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONFIGURE_PASSPORT_AUTH := 83

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SECURE_PROTOCOLS := 84

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_ENABLETRACING := 85

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PASSPORT_SIGN_OUT := 86

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PASSPORT_RETURN_URL := 87

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REDIRECT_POLICY := 88

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_MAX_HTTP_AUTOMATIC_REDIRECTS := 89

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_MAX_HTTP_STATUS_CONTINUE := 90

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_MAX_RESPONSE_HEADER_SIZE := 91

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_MAX_RESPONSE_DRAIN_SIZE := 92

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONNECTION_INFO := 93

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CLIENT_CERT_ISSUER_LIST := 94

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SPN := 96

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_GLOBAL_PROXY_CREDS := 97

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_GLOBAL_SERVER_CREDS := 98

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_UNLOAD_NOTIFY_EVENT := 99

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REJECT_USERPWD_IN_URL := 100

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_USE_GLOBAL_SERVER_CREDENTIALS := 101

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_RECEIVE_PROXY_CONNECT_RESPONSE := 103

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_IS_PROXY_CONNECT_RESPONSE := 104

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_NETWORK_INTERFACE_AFFINITY := 105

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SERVER_SPN_USED := 106

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PROXY_SPN_USED := 107

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SERVER_CBT := 108

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_UNSAFE_HEADER_PARSING := 110

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_ASSURED_NON_BLOCKING_CALLBACKS := 111

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_UPGRADE_TO_WEB_SOCKET := 114

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_WEB_SOCKET_CLOSE_TIMEOUT := 115

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL := 116

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_DECOMPRESSION := 118

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_WEB_SOCKET_RECEIVE_BUFFER_SIZE := 122

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_WEB_SOCKET_SEND_BUFFER_SIZE := 123

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_TCP_PRIORITY_HINT := 128

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONNECTION_FILTER := 131

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_ENABLE_HTTP_PROTOCOL := 133

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP_PROTOCOL_USED := 134

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_KDC_PROXY_SETTINGS := 136

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PROXY_DISABLE_SERVICE_CALLS := 137

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_ENCODE_EXTRA := 138

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_DISABLE_STREAM_QUEUE := 139

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_IPV6_FAST_FALLBACK := 140

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONNECTION_STATS_V0 := 141

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REQUEST_TIMES := 142

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_EXPIRE_CONNECTION := 143

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_DISABLE_SECURE_PROTOCOL_FALLBACK := 144

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP_PROTOCOL_REQUIRED := 145

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REQUEST_STATS := 146

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SERVER_CERT_CHAIN_CONTEXT := 147

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SERVER_CERT_CHAIN_BUILD_FLAGS := 148

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONNECTION_STATS_V1 := 150

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SECURITY_INFO := 151

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_TCP_KEEPALIVE := 152

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_TCP_FAST_OPEN := 153

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_TLS_FALSE_START := 154

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_IGNORE_CERT_REVOCATION_OFFLINE := 155

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_TLS_PROTOCOL_INSECURE_FALLBACK := 158

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_STREAM_ERROR_CODE := 159

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REQUIRE_STREAM_END := 160

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_ENABLE_HTTP2_PLUS_CLIENT_CERT := 161

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_FAILED_CONNECTION_RETRIES := 162

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP2_KEEPALIVE := 164

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_RESOLUTION_HOSTNAME := 165

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SET_TOKEN_BINDING := 166

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_TOKEN_BINDING_PUBLIC_KEY := 167

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REFERER_TOKEN_BINDING_HOSTNAME := 168

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP2_PLUS_TRANSFER_ENCODING := 169

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_RESOLVER_CACHE_CONFIG := 170

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_DISABLE_CERT_CHAIN_BUILDING := 171

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_BACKGROUND_CONNECTIONS := 172

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_FIRST_AVAILABLE_CONNECTION := 173

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_TCP_PRIORITY_STATUS := 177

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONNECTION_GUID := 178

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_MATCH_CONNECTION_GUID := 179

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP2_RECEIVE_WINDOW := 183

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_FEATURE_SUPPORTED := 184

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_QUIC_STATS := 185

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP3_KEEPALIVE := 188

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP3_HANDSHAKE_TIMEOUT := 189

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP3_INITIAL_RTT := 190

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP3_STREAM_ERROR_CODE := 191

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REQUEST_ANNOTATION := 192

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_DISABLE_PROXY_AUTH_SCHEMES := 193

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REVERT_IMPERSONATION_SERVER_CERT := 194

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_DISABLE_GLOBAL_POOLING := 195

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_USE_SESSION_SCH_CRED := 196

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SERVER_CERT_CHAIN_BUILD_CACHE_ONLY := 199

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_QUIC_STATS_V2 := 200

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_QUIC_STREAM_STATS := 202

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_USE_LOOKASIDE := 203

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_ERROR_LOG_GUID := 204

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_ENABLE_FAST_FORWARDING := 205

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_FAST_FORWARDING_RESPONSE_DATA := 206

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_UPGRADE_TO_PROTOCOL := 207

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_CONNECTION_STATS_V2 := 208

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_FAST_FORWARDING_RESPONSE_STATUS := 209

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_DSCP_TAG := 210

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_HTTP11_DOWNGRADE_TTL := 211

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SESSION_ERROR_LOG_GUID := 212

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_LAST_OPTION := 212

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_USERNAME := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PASSWORD := 4097

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PROXY_USERNAME := 4098

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_PROXY_PASSWORD := 4099

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CONNS_PER_SERVER_UNLIMITED := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CONNECTION_RETRY_CONDITION_408 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CONNECTION_RETRY_CONDITION_SSL_HANDSHAKE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CONNECTION_RETRY_CONDITION_STALE_CONNECTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_DECOMPRESSION_FLAG_GZIP := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_DECOMPRESSION_FLAG_DEFLATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROTOCOL_FLAG_HTTP2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROTOCOL_FLAG_HTTP3 := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REQUEST_ANNOTATION_MAX_LENGTH := 64000

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOLOGON_SECURITY_LEVEL_MEDIUM := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOLOGON_SECURITY_LEVEL_LOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOLOGON_SECURITY_LEVEL_HIGH := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOLOGON_SECURITY_LEVEL_PROXY_ONLY := 3

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOLOGON_SECURITY_LEVEL_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTOLOGON_SECURITY_LEVEL_MAX := 3

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REDIRECT_POLICY_NEVER := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REDIRECT_POLICY_DISALLOW_HTTPS_TO_HTTP := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REDIRECT_POLICY_ALWAYS := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REDIRECT_POLICY_LAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_REDIRECT_POLICY_DEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_DISABLE_PASSPORT_AUTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ENABLE_PASSPORT_AUTH := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_DISABLE_PASSPORT_KEYRING := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ENABLE_PASSPORT_KEYRING := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_DISABLE_SCHEME_BASIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_DISABLE_SCHEME_DIGEST := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_DISABLE_SCHEME_NTLM := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_DISABLE_SCHEME_KERBEROS := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_DISABLE_SCHEME_NEGOTIATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_DISABLE_AUTH_LOCAL_SERVICE := 256

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_SERVER_CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_SERVER_CERT_CHAIN_DISABLE_AIA := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_SERVER_CERT_CHAIN_REVOCATION_CHECK_CACHE_ONLY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_DISABLE_COOKIES := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_DISABLE_REDIRECTS := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_DISABLE_AUTHENTICATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_DISABLE_KEEP_ALIVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ENABLE_SSL_REVOCATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ENABLE_SSL_REVERT_IMPERSONATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_DISABLE_SPN_SERVER_PORT := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ENABLE_SPN_SERVER_PORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_OPTION_SPN_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_HANDLE_TYPE_SESSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_HANDLE_TYPE_CONNECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_HANDLE_TYPE_REQUEST := 3

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_HANDLE_TYPE_PROXY_RESOLVER := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_HANDLE_TYPE_WEBSOCKET := 5

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_HANDLE_TYPE_PROTOCOL := 6

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTH_SCHEME_PASSPORT := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTH_SCHEME_DIGEST := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTH_TARGET_SERVER := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_AUTH_TARGET_PROXY := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_SECURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_STRENGTH_WEAK := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_STRENGTH_MEDIUM := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_STRENGTH_STRONG := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_FLAG_CERT_REV_FAILED := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_FLAG_INVALID_CERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_FLAG_CERT_REVOKED := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_FLAG_INVALID_CA := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_FLAG_CERT_CN_INVALID := 16

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_FLAG_CERT_DATE_INVALID := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_FLAG_CERT_WRONG_USAGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_FLAG_SECURITY_CHANNEL_ERROR := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FLAG_SECURE_PROTOCOL_SSL2 := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FLAG_SECURE_PROTOCOL_SSL3 := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FLAG_SECURE_PROTOCOL_TLS1 := 128

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_1 := 512

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_2 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_3 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_RESOLVING_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_NAME_RESOLVED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_CONNECTING_TO_SERVER := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_CONNECTED_TO_SERVER := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_SENDING_REQUEST := 16

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_REQUEST_SENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE := 64

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED := 128

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_CLOSING_CONNECTION := 256

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_CONNECTION_CLOSED := 512

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_HANDLE_CREATED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_DETECTING_PROXY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_REDIRECT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_INTERMEDIATE_RESPONSE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_SECURE_FAILURE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_READ_COMPLETE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_REQUEST_ERROR := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_GETPROXYFORURL_COMPLETE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_CLOSE_COMPLETE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_SHUTDOWN_COMPLETE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_GETPROXYSETTINGS_COMPLETE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_SETTINGS_WRITE_COMPLETE := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_STATUS_SETTINGS_READ_COMPLETE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global API_RECEIVE_RESPONSE := 1

/**
 * @type {Integer (UInt32)}
 */
export global API_QUERY_DATA_AVAILABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global API_READ_DATA := 3

/**
 * @type {Integer (UInt32)}
 */
export global API_WRITE_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global API_SEND_REQUEST := 5

/**
 * @type {Integer (UInt32)}
 */
export global API_GET_PROXY_FOR_URL := 6

/**
 * @type {Integer (UInt32)}
 */
export global API_GET_PROXY_SETTINGS := 7

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_DETECTING_PROXY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_REDIRECT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_INTERMEDIATE_RESPONSE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_SECURE_FAILURE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_SENDREQUEST_COMPLETE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_HEADERS_AVAILABLE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_DATA_AVAILABLE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_READ_COMPLETE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_WRITE_COMPLETE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_REQUEST_ERROR := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_GETPROXYFORURL_COMPLETE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_GETPROXYSETTINGS_COMPLETE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_CALLBACK_FLAG_ALL_NOTIFICATIONS := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_MIME_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_TRANSFER_ENCODING := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_DESCRIPTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_LENGTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_LANGUAGE := 6

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_ALLOW := 7

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_PUBLIC := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_DATE := 9

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_EXPIRES := 10

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_LAST_MODIFIED := 11

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_MESSAGE_ID := 12

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_URI := 13

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_DERIVED_FROM := 14

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_COST := 15

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_LINK := 16

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_PRAGMA := 17

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_VERSION := 18

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_STATUS_CODE := 19

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_STATUS_TEXT := 20

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_RAW_HEADERS := 21

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_RAW_HEADERS_CRLF := 22

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONNECTION := 23

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_ACCEPT := 24

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_ACCEPT_CHARSET := 25

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_ACCEPT_ENCODING := 26

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_ACCEPT_LANGUAGE := 27

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_AUTHORIZATION := 28

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_ENCODING := 29

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_FORWARDED := 30

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_FROM := 31

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_IF_MODIFIED_SINCE := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_LOCATION := 33

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_ORIG_URI := 34

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_REFERER := 35

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_RETRY_AFTER := 36

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_SERVER := 37

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_TITLE := 38

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_USER_AGENT := 39

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_WWW_AUTHENTICATE := 40

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_PROXY_AUTHENTICATE := 41

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_ACCEPT_RANGES := 42

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_SET_COOKIE := 43

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_COOKIE := 44

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_REQUEST_METHOD := 45

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_REFRESH := 46

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_DISPOSITION := 47

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_AGE := 48

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CACHE_CONTROL := 49

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_BASE := 50

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_LOCATION := 51

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_MD5 := 52

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CONTENT_RANGE := 53

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_ETAG := 54

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_HOST := 55

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_IF_MATCH := 56

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_IF_NONE_MATCH := 57

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_IF_RANGE := 58

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_IF_UNMODIFIED_SINCE := 59

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_MAX_FORWARDS := 60

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_PROXY_AUTHORIZATION := 61

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_RANGE := 62

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_TRANSFER_ENCODING := 63

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_UPGRADE := 64

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_VARY := 65

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_VIA := 66

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_WARNING := 67

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_EXPECT := 68

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_PROXY_CONNECTION := 69

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_UNLESS_MODIFIED_SINCE := 70

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_PROXY_SUPPORT := 75

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_AUTHENTICATION_INFO := 76

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_PASSPORT_URLS := 77

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_PASSPORT_CONFIG := 78

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_MAX := 78

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_EX_ALL_HEADERS := 21

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_CUSTOM := 65535

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_FLAG_REQUEST_HEADERS := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_FLAG_SYSTEMTIME := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_FLAG_NUMBER := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_FLAG_NUMBER64 := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_FLAG_TRAILERS := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_QUERY_FLAG_WIRE_ENCODING := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_CONTINUE := 100

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_SWITCH_PROTOCOLS := 101

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_OK := 200

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_CREATED := 201

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_ACCEPTED := 202

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_PARTIAL := 203

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_NO_CONTENT := 204

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_RESET_CONTENT := 205

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_PARTIAL_CONTENT := 206

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_WEBDAV_MULTI_STATUS := 207

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_AMBIGUOUS := 300

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_MOVED := 301

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_REDIRECT := 302

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_REDIRECT_METHOD := 303

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_NOT_MODIFIED := 304

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_USE_PROXY := 305

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_REDIRECT_KEEP_VERB := 307

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_PERMANENT_REDIRECT := 308

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_BAD_REQUEST := 400

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_DENIED := 401

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_PAYMENT_REQ := 402

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_FORBIDDEN := 403

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_NOT_FOUND := 404

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_BAD_METHOD := 405

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_NONE_ACCEPTABLE := 406

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_PROXY_AUTH_REQ := 407

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_REQUEST_TIMEOUT := 408

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_CONFLICT := 409

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_GONE := 410

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_LENGTH_REQUIRED := 411

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_PRECOND_FAILED := 412

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_REQUEST_TOO_LARGE := 413

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_URI_TOO_LONG := 414

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_UNSUPPORTED_MEDIA := 415

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_RETRY_WITH := 449

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_SERVER_ERROR := 500

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_NOT_SUPPORTED := 501

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_BAD_GATEWAY := 502

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_SERVICE_UNAVAIL := 503

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_GATEWAY_TIMEOUT := 504

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_VERSION_NOT_SUP := 505

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_FIRST := 100

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_LAST := 505

/**
 * @type {Integer (UInt32)}
 */
export global ICU_NO_ENCODE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global ICU_NO_META := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global ICU_ENCODE_SPACES_ONLY := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global ICU_BROWSER_MODE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global ICU_ENCODE_PERCENT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global ICU_INCLUDE_DEFAULT_PORT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global ICU_ESCAPE_AUTHORITY := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ADDREQ_INDEX_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ADDREQ_FLAGS_MASK := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ADDREQ_FLAG_ADD_IF_NEW := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ADDREQ_FLAG_ADD := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ADDREQ_FLAG_COALESCE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ADDREQ_FLAG_REPLACE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_EXTENDED_HEADER_FLAG_UNICODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_IGNORE_REQUEST_TOTAL_LENGTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ERROR_BASE := 12000

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_OUT_OF_HANDLES := 12001

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_TIMEOUT := 12002

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_INTERNAL_ERROR := 12004

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_INVALID_URL := 12005

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_UNRECOGNIZED_SCHEME := 12006

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_NAME_NOT_RESOLVED := 12007

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_INVALID_OPTION := 12009

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_OPTION_NOT_SETTABLE := 12011

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SHUTDOWN := 12012

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_LOGIN_FAILURE := 12015

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_OPERATION_CANCELLED := 12017

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_INCORRECT_HANDLE_TYPE := 12018

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_INCORRECT_HANDLE_STATE := 12019

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CANNOT_CONNECT := 12029

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CONNECTION_ERROR := 12030

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_RESEND_REQUEST := 12032

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED := 12044

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CANNOT_CALL_BEFORE_OPEN := 12100

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CANNOT_CALL_BEFORE_SEND := 12101

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CANNOT_CALL_AFTER_SEND := 12102

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CANNOT_CALL_AFTER_OPEN := 12103

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_HEADER_NOT_FOUND := 12150

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_INVALID_SERVER_RESPONSE := 12152

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_INVALID_HEADER := 12153

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_INVALID_QUERY_REQUEST := 12154

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_HEADER_ALREADY_EXISTS := 12155

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_REDIRECT_FAILED := 12156

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_AUTO_PROXY_SERVICE_ERROR := 12178

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_BAD_AUTO_PROXY_SCRIPT := 12166

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_UNABLE_TO_DOWNLOAD_SCRIPT := 12167

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_UNHANDLED_SCRIPT_TYPE := 12176

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SCRIPT_EXECUTION_ERROR := 12177

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_NOT_INITIALIZED := 12172

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_FAILURE := 12175

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_CERT_DATE_INVALID := 12037

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_CERT_CN_INVALID := 12038

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_INVALID_CA := 12045

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_CERT_REV_FAILED := 12057

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_CHANNEL_ERROR := 12157

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_INVALID_CERT := 12169

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_CERT_REVOKED := 12170

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_CERT_WRONG_USAGE := 12179

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_AUTODETECTION_FAILED := 12180

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_HEADER_COUNT_EXCEEDED := 12181

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_HEADER_SIZE_OVERFLOW := 12182

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CHUNKED_ENCODING_HEADER_SIZE_OVERFLOW := 12183

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW := 12184

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CLIENT_CERT_NO_PRIVATE_KEY := 12185

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CLIENT_CERT_NO_ACCESS_PRIVATE_KEY := 12186

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED_PROXY := 12187

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_SECURE_FAILURE_PROXY := 12188

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_RESERVED_189 := 12189

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_HTTP_PROTOCOL_MISMATCH := 12190

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_GLOBAL_CALLBACK_FAILED := 12191

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_FEATURE_DISABLED := 12192

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_WINHTTP_FAST_FORWARDING_NOT_SUPPORTED := 12193

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_ERROR_LAST := 12193

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESET_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESET_SWPAD_CURRENT_NETWORK := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESET_SWPAD_ALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESET_SCRIPT_CACHE := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESET_ALL := 65535

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESET_NOTIFY_NETWORK_CHANGED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESET_OUT_OF_PROC := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_RESET_DISCARD_RESOLVERS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_WEB_SOCKET_MAX_CLOSE_REASON_LENGTH := 123

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_WEB_SOCKET_MIN_KEEPALIVE_VALUE := 15000

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_PROXY_NOTIFY_CHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_DISABLE_STREAM_QUEUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_IPV6_FAST_FALLBACK := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_CONNECTION_STATS_V0 := 3

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_REQUEST_TIMES := 4

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_EXPIRE_CONNECTION := 5

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_DISABLE_SECURE_PROTOCOL_FALLBACK := 6

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_HTTP_PROTOCOL_REQUIRED := 7

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_REQUEST_STATS := 8

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_SERVER_CERT_CHAIN_CONTEXT := 9

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_CONNECTION_STATS_V1 := 12

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_SECURITY_INFO := 13

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_TCP_KEEPALIVE := 14

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_TCP_FAST_OPEN := 15

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_TLS_FALSE_START := 16

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_IGNORE_CERT_REVOCATION_OFFLINE := 17

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_TLS_PROTOCOL_INSECURE_FALLBACK := 20

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_STREAM_ERROR_CODE := 21

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_REQUIRE_STREAM_END := 22

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_ENABLE_HTTP2_PLUS_CLIENT_CERT := 23

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_FAILED_CONNECTION_RETRIES := 24

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_HTTP2_KEEPALIVE := 26

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_RESOLUTION_HOSTNAME := 27

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_SET_TOKEN_BINDING := 28

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_TOKEN_BINDING_PUBLIC_KEY := 29

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_REFERER_TOKEN_BINDING_HOSTNAME := 30

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_HTTP2_PLUS_TRANSFER_ENCODING := 31

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG := 32

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_DISABLE_CERT_CHAIN_BUILDING := 33

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_BACKGROUND_CONNECTIONS := 34

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_FIRST_AVAILABLE_CONNECTION := 35

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_TCP_PRIORITY_STATUS := 37

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_CONNECTION_GUID := 38

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_MATCH_CONNECTION_GUID := 39

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_HTTP2_RECEIVE_WINDOW := 43

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_IS_FEATURE_SUPPORTED := 44

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_ADD_REQUEST_HEADERS_EX := 46

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_SET_PROXY_SETINGS_PER_USER := 47

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_READ_DATA_EX := 48

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_QUERY_HEADERS_EX := 49

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_QUERY_CONNECTION_GROUP := 50

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_FREE_QUERY_CONNECTION_GROUP_RESULT := 51

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_SECURITY_FLAG_IGNORE_ALL_CERT_ERRORS := 52

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_FLAG_SECURE_DEFAULTS := 53

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_EXTENDED_HEADER_FLAG_UNICODE := 54

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_QUERY_FLAG_TRAILERS := 55

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_QUERY_FLAG_WIRE_ENCODING := 56

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_SOFT_LIMIT := 57

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_BYPASS_CACHE := 58

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_FLAG_AUTOMATIC_CHUNKING := 59

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_QUERY_CONNECTION_GROUP_FLAG_INSECURE := 60

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_MATCH_CONNECTION_GUID_FLAG_REQUIRE_MARKED_CONNECTION := 61

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_QUERY_EX_ALL_HEADERS := 62

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_READ_DATA_EX_FLAG_FILL_BUFFER := 63

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_USE_DNS_TTL := 64

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_CONN_USE_TTL := 65

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_QUIC_STATS := 66

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_HTTP3_KEEPALIVE := 69

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_HTTP3_HANDSHAKE_TIMEOUT := 70

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_HTTP3_INITIAL_RTT := 71

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_HTTP3_STREAM_ERROR_CODE := 72

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_REQUEST_ANNOTATION := 73

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_DISABLE_PROXY_AUTH_SCHEMES := 74

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_REVERT_IMPERSONATION_SERVER_CERT := 75

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_DISABLE_GLOBAL_POOLING := 76

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_GET_PROXY_SETTINGS_EX := 77

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_SESSION_SCH_CRED := 78

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_QUIC_STATS_V2 := 79

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_URL_INCLUDE_DEFAULT_PORT := 80

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_QUIC_STREAM_STATS := 81

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_USE_LOOKASIDE := 82

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_ERROR_LOG_GUID := 83

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_UPGRADE_TO_PROTOCOL := 88

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_CONNECTION_STATS_V2 := 89

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_FAST_FORWARD_RESPONSE := 90

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_DISABLE_AIA_FLAG := 91

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_DSCP_TAG := 92

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_HTTP11_DOWNGRADE_TTL := 93

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_SESSION_ERROR_LOG_GUID := 94

/**
 * @type {Integer (UInt32)}
 */
export global WINHTTP_FEATURE_GET_PROXY_SETTINGS_EX_XBOX := 95
;@endregion Constants
