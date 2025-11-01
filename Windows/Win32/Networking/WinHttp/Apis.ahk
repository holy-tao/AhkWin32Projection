#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WinHttp {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static HTTPREQUEST_PROXYSETTING_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HTTPREQUEST_PROXYSETTING_PRECONFIG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HTTPREQUEST_PROXYSETTING_DIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTPREQUEST_PROXYSETTING_PROXY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTPREQUEST_SETCREDENTIALS_FOR_SERVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HTTPREQUEST_SETCREDENTIALS_FOR_PROXY => 1

    /**
     * @type {Integer (UInt16)}
     */
    static INTERNET_DEFAULT_PORT => 0

    /**
     * @type {Integer (UInt16)}
     */
    static INTERNET_DEFAULT_HTTP_PORT => 80

    /**
     * @type {Integer (UInt16)}
     */
    static INTERNET_DEFAULT_HTTPS_PORT => 443

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_ASYNC => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_SECURE_DEFAULTS => 805306368

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_AUTOMATIC_CHUNKING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IGNORE_UNKNOWN_CA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IGNORE_CERT_CN_INVALID => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IGNORE_CERT_DATE_INVALID => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_AUTO_DETECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_CONFIG_URL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_HOST_KEEPCASE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_HOST_LOWERCASE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_ALLOW_AUTOCONFIG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_ALLOW_STATIC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_ALLOW_CM => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_USE_INTERFACE_CONFIG => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_RUN_INPROCESS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_RUN_OUTPROCESS_ONLY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_NO_DIRECTACCESS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_NO_CACHE_CLIENT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_NO_CACHE_SVC => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOPROXY_SORT_RESULTS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTO_DETECT_TYPE_DHCP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTO_DETECT_TYPE_DNS_A => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORKING_KEY_BUFSIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_TYPE_DIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_TYPE_PROXY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_TYPE_AUTO_PROXY_URL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_TYPE_AUTO_DETECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_REQUEST_STAT_FLAG_TCP_FAST_OPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_REQUEST_STAT_FLAG_TLS_SESSION_RESUMPTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_REQUEST_STAT_FLAG_TLS_FALSE_START => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_REQUEST_STAT_FLAG_PROXY_TLS_SESSION_RESUMPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_REQUEST_STAT_FLAG_PROXY_TLS_FALSE_START => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_REQUEST_STAT_FLAG_FIRST_REQUEST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_MATCH_CONNECTION_GUID_FLAG_REQUIRE_MARKED_CONNECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_MATCH_CONNECTION_GUID_FLAGS_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_SOFT_LIMIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_BYPASS_CACHE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_USE_DNS_TTL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESOLVER_CACHE_CONFIG_FLAG_CONN_USE_TTL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_TIME_FORMAT_BUFSIZE => 62

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CALLBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_RESOLVE_TIMEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONNECT_TIMEOUT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONNECT_RETRIES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SEND_TIMEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_RECEIVE_TIMEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_RECEIVE_RESPONSE_TIMEOUT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HANDLE_TYPE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_READ_BUFFER_SIZE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_WRITE_BUFFER_SIZE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PARENT_HANDLE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_EXTENDED_ERROR => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SECURITY_FLAGS => 31

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SECURITY_CERTIFICATE_STRUCT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_URL => 34

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SECURITY_KEY_BITNESS => 36

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PROXY => 38

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PROXY_RESULT_ENTRY => 39

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_USER_AGENT => 41

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONTEXT_VALUE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CLIENT_CERT_CONTEXT => 47

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REQUEST_PRIORITY => 58

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP_VERSION => 59

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_DISABLE_FEATURE => 63

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CODEPAGE => 68

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_MAX_CONNS_PER_SERVER => 73

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_MAX_CONNS_PER_1_0_SERVER => 74

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_AUTOLOGON_POLICY => 77

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SERVER_CERT_CONTEXT => 78

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_ENABLE_FEATURE => 79

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_WORKER_THREAD_COUNT => 80

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PASSPORT_COBRANDING_TEXT => 81

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PASSPORT_COBRANDING_URL => 82

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONFIGURE_PASSPORT_AUTH => 83

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SECURE_PROTOCOLS => 84

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_ENABLETRACING => 85

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PASSPORT_SIGN_OUT => 86

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PASSPORT_RETURN_URL => 87

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REDIRECT_POLICY => 88

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_MAX_HTTP_AUTOMATIC_REDIRECTS => 89

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_MAX_HTTP_STATUS_CONTINUE => 90

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_MAX_RESPONSE_HEADER_SIZE => 91

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_MAX_RESPONSE_DRAIN_SIZE => 92

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONNECTION_INFO => 93

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CLIENT_CERT_ISSUER_LIST => 94

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SPN => 96

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_GLOBAL_PROXY_CREDS => 97

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_GLOBAL_SERVER_CREDS => 98

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_UNLOAD_NOTIFY_EVENT => 99

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REJECT_USERPWD_IN_URL => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_USE_GLOBAL_SERVER_CREDENTIALS => 101

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_RECEIVE_PROXY_CONNECT_RESPONSE => 103

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_IS_PROXY_CONNECT_RESPONSE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_NETWORK_INTERFACE_AFFINITY => 105

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SERVER_SPN_USED => 106

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PROXY_SPN_USED => 107

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SERVER_CBT => 108

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_UNSAFE_HEADER_PARSING => 110

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_ASSURED_NON_BLOCKING_CALLBACKS => 111

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_UPGRADE_TO_WEB_SOCKET => 114

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_WEB_SOCKET_CLOSE_TIMEOUT => 115

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL => 116

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_DECOMPRESSION => 118

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_WEB_SOCKET_RECEIVE_BUFFER_SIZE => 122

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_WEB_SOCKET_SEND_BUFFER_SIZE => 123

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_TCP_PRIORITY_HINT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONNECTION_FILTER => 131

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_ENABLE_HTTP_PROTOCOL => 133

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP_PROTOCOL_USED => 134

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_KDC_PROXY_SETTINGS => 136

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PROXY_DISABLE_SERVICE_CALLS => 137

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_ENCODE_EXTRA => 138

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_DISABLE_STREAM_QUEUE => 139

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_IPV6_FAST_FALLBACK => 140

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONNECTION_STATS_V0 => 141

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REQUEST_TIMES => 142

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_EXPIRE_CONNECTION => 143

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_DISABLE_SECURE_PROTOCOL_FALLBACK => 144

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP_PROTOCOL_REQUIRED => 145

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REQUEST_STATS => 146

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SERVER_CERT_CHAIN_CONTEXT => 147

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONNECTION_STATS_V1 => 150

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SECURITY_INFO => 151

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_TCP_KEEPALIVE => 152

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_TCP_FAST_OPEN => 153

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_TLS_FALSE_START => 154

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_IGNORE_CERT_REVOCATION_OFFLINE => 155

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_TLS_PROTOCOL_INSECURE_FALLBACK => 158

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_STREAM_ERROR_CODE => 159

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REQUIRE_STREAM_END => 160

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_ENABLE_HTTP2_PLUS_CLIENT_CERT => 161

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_FAILED_CONNECTION_RETRIES => 162

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP2_KEEPALIVE => 164

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_RESOLUTION_HOSTNAME => 165

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SET_TOKEN_BINDING => 166

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_TOKEN_BINDING_PUBLIC_KEY => 167

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REFERER_TOKEN_BINDING_HOSTNAME => 168

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP2_PLUS_TRANSFER_ENCODING => 169

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_RESOLVER_CACHE_CONFIG => 170

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_DISABLE_CERT_CHAIN_BUILDING => 171

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_BACKGROUND_CONNECTIONS => 172

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_FIRST_AVAILABLE_CONNECTION => 173

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_TCP_PRIORITY_STATUS => 177

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONNECTION_GUID => 178

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_MATCH_CONNECTION_GUID => 179

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP2_RECEIVE_WINDOW => 183

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_FEATURE_SUPPORTED => 184

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_QUIC_STATS => 185

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP3_KEEPALIVE => 188

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP3_HANDSHAKE_TIMEOUT => 189

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP3_INITIAL_RTT => 190

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_HTTP3_STREAM_ERROR_CODE => 191

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REQUEST_ANNOTATION => 192

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_DISABLE_PROXY_AUTH_SCHEMES => 193

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REVERT_IMPERSONATION_SERVER_CERT => 194

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_DISABLE_GLOBAL_POOLING => 195

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_USE_SESSION_SCH_CRED => 196

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_QUIC_STATS_V2 => 200

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_QUIC_STREAM_STATS => 202

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_USE_LOOKASIDE => 203

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_ERROR_LOG_GUID => 204

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_ENABLE_FAST_FORWARDING => 205

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_FAST_FORWARDING_RESPONSE_DATA => 206

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_UPGRADE_TO_PROTOCOL => 207

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_CONNECTION_STATS_V2 => 208

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_FAST_FORWARDING_RESPONSE_STATUS => 209

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_LAST_OPTION => 209

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_USERNAME => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PASSWORD => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PROXY_USERNAME => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_PROXY_PASSWORD => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CONNS_PER_SERVER_UNLIMITED => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CONNECTION_RETRY_CONDITION_408 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CONNECTION_RETRY_CONDITION_SSL_HANDSHAKE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CONNECTION_RETRY_CONDITION_STALE_CONNECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_DECOMPRESSION_FLAG_GZIP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_DECOMPRESSION_FLAG_DEFLATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROTOCOL_FLAG_HTTP2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROTOCOL_FLAG_HTTP3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REQUEST_ANNOTATION_MAX_LENGTH => 64000

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOLOGON_SECURITY_LEVEL_MEDIUM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOLOGON_SECURITY_LEVEL_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOLOGON_SECURITY_LEVEL_HIGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOLOGON_SECURITY_LEVEL_PROXY_ONLY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOLOGON_SECURITY_LEVEL_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTOLOGON_SECURITY_LEVEL_MAX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REDIRECT_POLICY_NEVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REDIRECT_POLICY_DISALLOW_HTTPS_TO_HTTP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REDIRECT_POLICY_ALWAYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REDIRECT_POLICY_LAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_REDIRECT_POLICY_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_DISABLE_PASSPORT_AUTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ENABLE_PASSPORT_AUTH => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_DISABLE_PASSPORT_KEYRING => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ENABLE_PASSPORT_KEYRING => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_DISABLE_SCHEME_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_DISABLE_SCHEME_DIGEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_DISABLE_SCHEME_NTLM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_DISABLE_SCHEME_KERBEROS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_DISABLE_SCHEME_NEGOTIATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_DISABLE_AUTH_LOCAL_SERVICE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_DISABLE_COOKIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_DISABLE_REDIRECTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_DISABLE_AUTHENTICATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_DISABLE_KEEP_ALIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ENABLE_SSL_REVOCATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ENABLE_SSL_REVERT_IMPERSONATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_DISABLE_SPN_SERVER_PORT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ENABLE_SPN_SERVER_PORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_OPTION_SPN_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_HANDLE_TYPE_SESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_HANDLE_TYPE_CONNECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_HANDLE_TYPE_REQUEST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_HANDLE_TYPE_PROXY_RESOLVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_HANDLE_TYPE_WEBSOCKET => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_HANDLE_TYPE_PROTOCOL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_SCHEME_PASSPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_SCHEME_DIGEST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_TARGET_SERVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_AUTH_TARGET_PROXY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_SECURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_STRENGTH_WEAK => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_STRENGTH_MEDIUM => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_STRENGTH_STRONG => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_FLAG_CERT_REV_FAILED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_FLAG_INVALID_CERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_FLAG_CERT_REVOKED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_FLAG_INVALID_CA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_FLAG_CERT_CN_INVALID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_FLAG_CERT_DATE_INVALID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_FLAG_CERT_WRONG_USAGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_FLAG_SECURITY_CHANNEL_ERROR => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_SECURE_PROTOCOL_SSL2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_SECURE_PROTOCOL_SSL3 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_SECURE_PROTOCOL_TLS1 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_1 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_2 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_3 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_RESOLVING_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_NAME_RESOLVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_CONNECTING_TO_SERVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_CONNECTED_TO_SERVER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_SENDING_REQUEST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_REQUEST_SENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_RECEIVING_RESPONSE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_RESPONSE_RECEIVED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_CLOSING_CONNECTION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_CONNECTION_CLOSED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_HANDLE_CREATED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_HANDLE_CLOSING => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_DETECTING_PROXY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_REDIRECT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_INTERMEDIATE_RESPONSE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_SECURE_FAILURE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_HEADERS_AVAILABLE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_DATA_AVAILABLE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_READ_COMPLETE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_WRITE_COMPLETE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_REQUEST_ERROR => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_SENDREQUEST_COMPLETE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_GETPROXYFORURL_COMPLETE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_CLOSE_COMPLETE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_SHUTDOWN_COMPLETE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_GETPROXYSETTINGS_COMPLETE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_SETTINGS_WRITE_COMPLETE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_STATUS_SETTINGS_READ_COMPLETE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static API_RECEIVE_RESPONSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static API_QUERY_DATA_AVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static API_READ_DATA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static API_WRITE_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static API_SEND_REQUEST => 5

    /**
     * @type {Integer (UInt32)}
     */
    static API_GET_PROXY_FOR_URL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static API_GET_PROXY_SETTINGS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_DETECTING_PROXY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_REDIRECT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_INTERMEDIATE_RESPONSE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_SECURE_FAILURE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_SENDREQUEST_COMPLETE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_HEADERS_AVAILABLE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_DATA_AVAILABLE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_READ_COMPLETE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_WRITE_COMPLETE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_REQUEST_ERROR => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_GETPROXYFORURL_COMPLETE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_GETPROXYSETTINGS_COMPLETE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_CALLBACK_FLAG_ALL_NOTIFICATIONS => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_MIME_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_TRANSFER_ENCODING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_ID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_DESCRIPTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_LENGTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_LANGUAGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_ALLOW => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_PUBLIC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_DATE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_EXPIRES => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_LAST_MODIFIED => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_MESSAGE_ID => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_URI => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_DERIVED_FROM => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_COST => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_LINK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_PRAGMA => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_VERSION => 18

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_STATUS_CODE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_STATUS_TEXT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_RAW_HEADERS => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_RAW_HEADERS_CRLF => 22

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONNECTION => 23

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_ACCEPT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_ACCEPT_CHARSET => 25

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_ACCEPT_ENCODING => 26

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_ACCEPT_LANGUAGE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_AUTHORIZATION => 28

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_ENCODING => 29

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_FORWARDED => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_FROM => 31

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_IF_MODIFIED_SINCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_LOCATION => 33

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_ORIG_URI => 34

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_REFERER => 35

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_RETRY_AFTER => 36

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_SERVER => 37

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_TITLE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_USER_AGENT => 39

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_WWW_AUTHENTICATE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_PROXY_AUTHENTICATE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_ACCEPT_RANGES => 42

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_SET_COOKIE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_COOKIE => 44

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_REQUEST_METHOD => 45

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_REFRESH => 46

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_DISPOSITION => 47

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_AGE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CACHE_CONTROL => 49

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_BASE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_LOCATION => 51

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_MD5 => 52

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CONTENT_RANGE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_ETAG => 54

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_HOST => 55

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_IF_MATCH => 56

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_IF_NONE_MATCH => 57

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_IF_RANGE => 58

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_IF_UNMODIFIED_SINCE => 59

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_MAX_FORWARDS => 60

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_PROXY_AUTHORIZATION => 61

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_RANGE => 62

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_TRANSFER_ENCODING => 63

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_UPGRADE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_VARY => 65

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_VIA => 66

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_WARNING => 67

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_EXPECT => 68

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_PROXY_CONNECTION => 69

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_UNLESS_MODIFIED_SINCE => 70

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_PROXY_SUPPORT => 75

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_AUTHENTICATION_INFO => 76

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_PASSPORT_URLS => 77

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_PASSPORT_CONFIG => 78

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_MAX => 78

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_EX_ALL_HEADERS => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_CUSTOM => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_FLAG_REQUEST_HEADERS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_FLAG_SYSTEMTIME => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_FLAG_NUMBER => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_FLAG_NUMBER64 => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_FLAG_TRAILERS => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_QUERY_FLAG_WIRE_ENCODING => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_CONTINUE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_SWITCH_PROTOCOLS => 101

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_OK => 200

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_CREATED => 201

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_ACCEPTED => 202

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_PARTIAL => 203

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_NO_CONTENT => 204

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_RESET_CONTENT => 205

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_PARTIAL_CONTENT => 206

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_WEBDAV_MULTI_STATUS => 207

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_AMBIGUOUS => 300

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_MOVED => 301

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_REDIRECT => 302

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_REDIRECT_METHOD => 303

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_NOT_MODIFIED => 304

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_USE_PROXY => 305

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_REDIRECT_KEEP_VERB => 307

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_PERMANENT_REDIRECT => 308

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_BAD_REQUEST => 400

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_DENIED => 401

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_PAYMENT_REQ => 402

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_FORBIDDEN => 403

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_NOT_FOUND => 404

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_BAD_METHOD => 405

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_NONE_ACCEPTABLE => 406

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_PROXY_AUTH_REQ => 407

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_REQUEST_TIMEOUT => 408

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_CONFLICT => 409

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_GONE => 410

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_LENGTH_REQUIRED => 411

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_PRECOND_FAILED => 412

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_REQUEST_TOO_LARGE => 413

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_URI_TOO_LONG => 414

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_UNSUPPORTED_MEDIA => 415

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_RETRY_WITH => 449

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_SERVER_ERROR => 500

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_NOT_SUPPORTED => 501

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_BAD_GATEWAY => 502

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_SERVICE_UNAVAIL => 503

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_GATEWAY_TIMEOUT => 504

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_VERSION_NOT_SUP => 505

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_FIRST => 100

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_LAST => 505

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_NO_ENCODE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_NO_META => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_ENCODE_SPACES_ONLY => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_BROWSER_MODE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_ENCODE_PERCENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_INCLUDE_DEFAULT_PORT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_ESCAPE_AUTHORITY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ADDREQ_INDEX_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ADDREQ_FLAGS_MASK => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ADDREQ_FLAG_ADD_IF_NEW => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ADDREQ_FLAG_ADD => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ADDREQ_FLAG_COALESCE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ADDREQ_FLAG_REPLACE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_EXTENDED_HEADER_FLAG_UNICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_IGNORE_REQUEST_TOTAL_LENGTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ERROR_BASE => 12000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_OUT_OF_HANDLES => 12001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_TIMEOUT => 12002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_INTERNAL_ERROR => 12004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_INVALID_URL => 12005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_UNRECOGNIZED_SCHEME => 12006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_NAME_NOT_RESOLVED => 12007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_INVALID_OPTION => 12009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_OPTION_NOT_SETTABLE => 12011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SHUTDOWN => 12012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_LOGIN_FAILURE => 12015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_OPERATION_CANCELLED => 12017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_INCORRECT_HANDLE_TYPE => 12018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_INCORRECT_HANDLE_STATE => 12019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CANNOT_CONNECT => 12029

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CONNECTION_ERROR => 12030

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_RESEND_REQUEST => 12032

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED => 12044

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CANNOT_CALL_BEFORE_OPEN => 12100

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CANNOT_CALL_BEFORE_SEND => 12101

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CANNOT_CALL_AFTER_SEND => 12102

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CANNOT_CALL_AFTER_OPEN => 12103

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_HEADER_NOT_FOUND => 12150

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_INVALID_SERVER_RESPONSE => 12152

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_INVALID_HEADER => 12153

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_INVALID_QUERY_REQUEST => 12154

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_HEADER_ALREADY_EXISTS => 12155

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_REDIRECT_FAILED => 12156

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_AUTO_PROXY_SERVICE_ERROR => 12178

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_BAD_AUTO_PROXY_SCRIPT => 12166

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_UNABLE_TO_DOWNLOAD_SCRIPT => 12167

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_UNHANDLED_SCRIPT_TYPE => 12176

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SCRIPT_EXECUTION_ERROR => 12177

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_NOT_INITIALIZED => 12172

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_FAILURE => 12175

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_CERT_DATE_INVALID => 12037

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_CERT_CN_INVALID => 12038

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_INVALID_CA => 12045

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_CERT_REV_FAILED => 12057

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_CHANNEL_ERROR => 12157

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_INVALID_CERT => 12169

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_CERT_REVOKED => 12170

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_CERT_WRONG_USAGE => 12179

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_AUTODETECTION_FAILED => 12180

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_HEADER_COUNT_EXCEEDED => 12181

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_HEADER_SIZE_OVERFLOW => 12182

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CHUNKED_ENCODING_HEADER_SIZE_OVERFLOW => 12183

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW => 12184

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CLIENT_CERT_NO_PRIVATE_KEY => 12185

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CLIENT_CERT_NO_ACCESS_PRIVATE_KEY => 12186

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED_PROXY => 12187

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_SECURE_FAILURE_PROXY => 12188

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_RESERVED_189 => 12189

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_HTTP_PROTOCOL_MISMATCH => 12190

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_GLOBAL_CALLBACK_FAILED => 12191

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_FEATURE_DISABLED => 12192

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINHTTP_FAST_FORWARDING_NOT_SUPPORTED => 12193

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_ERROR_LAST => 12193

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESET_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESET_SWPAD_CURRENT_NETWORK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESET_SWPAD_ALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESET_SCRIPT_CACHE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESET_ALL => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESET_NOTIFY_NETWORK_CHANGED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESET_OUT_OF_PROC => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_RESET_DISCARD_RESOLVERS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_WEB_SOCKET_MAX_CLOSE_REASON_LENGTH => 123

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_WEB_SOCKET_MIN_KEEPALIVE_VALUE => 15000

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_PROXY_NOTIFY_CHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_DISABLE_STREAM_QUEUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_IPV6_FAST_FALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_CONNECTION_STATS_V0 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_REQUEST_TIMES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_EXPIRE_CONNECTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_DISABLE_SECURE_PROTOCOL_FALLBACK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_HTTP_PROTOCOL_REQUIRED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_REQUEST_STATS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_SERVER_CERT_CHAIN_CONTEXT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_CONNECTION_STATS_V1 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_SECURITY_INFO => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_TCP_KEEPALIVE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_TCP_FAST_OPEN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_TLS_FALSE_START => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_IGNORE_CERT_REVOCATION_OFFLINE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_TLS_PROTOCOL_INSECURE_FALLBACK => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_STREAM_ERROR_CODE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_REQUIRE_STREAM_END => 22

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_ENABLE_HTTP2_PLUS_CLIENT_CERT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_FAILED_CONNECTION_RETRIES => 24

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_HTTP2_KEEPALIVE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_RESOLUTION_HOSTNAME => 27

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_SET_TOKEN_BINDING => 28

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_TOKEN_BINDING_PUBLIC_KEY => 29

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_REFERER_TOKEN_BINDING_HOSTNAME => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_HTTP2_PLUS_TRANSFER_ENCODING => 31

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_DISABLE_CERT_CHAIN_BUILDING => 33

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_BACKGROUND_CONNECTIONS => 34

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_FIRST_AVAILABLE_CONNECTION => 35

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_TCP_PRIORITY_STATUS => 37

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_CONNECTION_GUID => 38

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_MATCH_CONNECTION_GUID => 39

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_HTTP2_RECEIVE_WINDOW => 43

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_IS_FEATURE_SUPPORTED => 44

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_ADD_REQUEST_HEADERS_EX => 46

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_SET_PROXY_SETINGS_PER_USER => 47

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_READ_DATA_EX => 48

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_QUERY_HEADERS_EX => 49

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_QUERY_CONNECTION_GROUP => 50

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_FREE_QUERY_CONNECTION_GROUP_RESULT => 51

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_SECURITY_FLAG_IGNORE_ALL_CERT_ERRORS => 52

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_FLAG_SECURE_DEFAULTS => 53

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_EXTENDED_HEADER_FLAG_UNICODE => 54

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_QUERY_FLAG_TRAILERS => 55

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_QUERY_FLAG_WIRE_ENCODING => 56

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_SOFT_LIMIT => 57

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_BYPASS_CACHE => 58

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_FLAG_AUTOMATIC_CHUNKING => 59

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_QUERY_CONNECTION_GROUP_FLAG_INSECURE => 60

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_MATCH_CONNECTION_GUID_FLAG_REQUIRE_MARKED_CONNECTION => 61

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_QUERY_EX_ALL_HEADERS => 62

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_READ_DATA_EX_FLAG_FILL_BUFFER => 63

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_USE_DNS_TTL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_RESOLVER_CACHE_CONFIG_FLAG_CONN_USE_TTL => 65

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_QUIC_STATS => 66

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_HTTP3_KEEPALIVE => 69

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_HTTP3_HANDSHAKE_TIMEOUT => 70

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_HTTP3_INITIAL_RTT => 71

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_HTTP3_STREAM_ERROR_CODE => 72

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_REQUEST_ANNOTATION => 73

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_DISABLE_PROXY_AUTH_SCHEMES => 74

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_REVERT_IMPERSONATION_SERVER_CERT => 75

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_DISABLE_GLOBAL_POOLING => 76

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_GET_PROXY_SETTINGS_EX => 77

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_SESSION_SCH_CRED => 78

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_QUIC_STATS_V2 => 79

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_URL_INCLUDE_DEFAULT_PORT => 80

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_QUIC_STREAM_STATS => 81

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_USE_LOOKASIDE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_ERROR_LOG_GUID => 83

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_UPGRADE_TO_PROTOCOL => 88

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_CONNECTION_STATS_V2 => 89

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FEATURE_FAST_FORWARD_RESPONSE => 90
;@endregion Constants

;@region Methods
    /**
     * The WinHttpSetStatusCallback function sets up a callback function that WinHTTP can call as progress is made during an operation.
     * @param {Pointer<Void>} hInternet <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle for which the callback is to be set.
     * @param {Pointer<WINHTTP_STATUS_CALLBACK>} lpfnInternetCallback Pointer to the callback function to call when progress is made.  Set this to <b>NULL</b> to remove the existing callback function. For more information about the callback function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a>.
     * @param {Integer} dwNotificationFlags Unsigned long integer value that specifies flags to indicate which
     *                 events  activate the callback function.
     * 
     * The possible values are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_ALL_COMPLETIONS"></a><a id="winhttp_callback_flag_all_completions"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_ALL_COMPLETIONS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates upon any completion notification.  This flag specifies that all notifications required for read or write operations are used. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a> for a list of completions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_ALL_NOTIFICATIONS"></a><a id="winhttp_callback_flag_all_notifications"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_ALL_NOTIFICATIONS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates upon any status change notification including completions.  See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a> for a list of notifications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_RESOLVE_NAME"></a><a id="winhttp_callback_flag_resolve_name"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_RESOLVE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates upon beginning and completing name resolution.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_CONNECT_TO_SERVER"></a><a id="winhttp_callback_flag_connect_to_server"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_CONNECT_TO_SERVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates upon beginning and completing connection to the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_DETECTING_PROXY"></a><a id="winhttp_callback_flag_detecting_proxy"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_DETECTING_PROXY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates when detecting the proxy server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_DATA_AVAILABLE"></a><a id="winhttp_callback_flag_data_available"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_DATA_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates when completing a query for data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_HEADERS_AVAILABLE"></a><a id="winhttp_callback_flag_headers_available"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_HEADERS_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates when the response headers are available for retrieval.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_READ_COMPLETE"></a><a id="winhttp_callback_flag_read_complete"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_READ_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates upon completion of a data-read operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_REQUEST_ERROR"></a><a id="winhttp_callback_flag_request_error"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_REQUEST_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates when an asynchronous error occurs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_SEND_REQUEST"></a><a id="winhttp_callback_flag_send_request"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_SEND_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates upon beginning and completing the sending of a request
     *                     header with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_SENDREQUEST_COMPLETE"></a><a id="winhttp_callback_flag_sendrequest_complete"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_SENDREQUEST_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates when a request header has been sent with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_WRITE_COMPLETE"></a><a id="winhttp_callback_flag_write_complete"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_WRITE_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates upon completion of a data-post operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_RECEIVE_RESPONSE"></a><a id="winhttp_callback_flag_receive_response"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_RECEIVE_RESPONSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates upon beginning and completing the receipt of a
     *                     resource from the HTTP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_CLOSE_CONNECTION"></a><a id="winhttp_callback_flag_close_connection"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_CLOSE_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates when beginning and completing the closing of an
     *                     HTTP connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_HANDLES"></a><a id="winhttp_callback_flag_handles"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_HANDLES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates when an 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle is 
     *                     created or closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_REDIRECT"></a><a id="winhttp_callback_flag_redirect"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_REDIRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates when the request is redirected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_INTERMEDIATE_RESPONSE"></a><a id="winhttp_callback_flag_intermediate_response"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_INTERMEDIATE_RESPONSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates when receiving an intermediate (100 level) status 
     *                     code message from the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_CALLBACK_FLAG_SECURE_FAILURE"></a><a id="winhttp_callback_flag_secure_failure"></a><dl>
     * <dt><b>WINHTTP_CALLBACK_FLAG_SECURE_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activates upon a secure connection failure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} dwReserved This parameter is reserved and must be <b>NULL</b>.
     * @returns {Pointer<WINHTTP_STATUS_CALLBACK>} If successful, returns a pointer to the previously defined status callback function or  <b>NULL</b> if there was no previously defined status callback function. Returns <b>WINHTTP_INVALID_STATUS_CALLBACK</b> if the callback function could not be installed. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpsetstatuscallback
     * @since windows5.1.2600
     */
    static WinHttpSetStatusCallback(hInternet, lpfnInternetCallback, dwNotificationFlags, dwReserved) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpSetStatusCallback", "ptr", hInternet, "ptr", lpfnInternetCallback, "uint", dwNotificationFlags, "ptr", dwReserved, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Formats a date and time according to the HTTP version 1.0 specification.
     * @param {Pointer<SYSTEMTIME>} pst A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to format.
     * @param {PWSTR} pwszTime A pointer to a string buffer that receives the formatted date and time. The buffer should equal to the size, in bytes, of WINHTTP_TIME_FORMAT_BUFSIZE.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get  extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Error codes include the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttptimefromsystemtime
     * @since windows5.1.2600
     */
    static WinHttpTimeFromSystemTime(pst, pwszTime) {
        pwszTime := pwszTime is String ? StrPtr(pwszTime) : pwszTime

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpTimeFromSystemTime", "ptr", pst, "ptr", pwszTime, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpTimeToSystemTime function takes an HTTP time/date string and converts it to a SYSTEMTIME structure.
     * @param {PWSTR} pwszTime Pointer to a null-terminated date/time string to convert. This value must use the format defined in section 3.3 of the <a href="http://www.ietf.org/rfc/rfc2616.txt">RFC2616</a>.
     * @param {Pointer<SYSTEMTIME>} pst Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the converted time.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned is:
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttptimetosystemtime
     * @since windows5.1.2600
     */
    static WinHttpTimeToSystemTime(pwszTime, pst) {
        pwszTime := pwszTime is String ? StrPtr(pwszTime) : pwszTime

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpTimeToSystemTime", "ptr", pwszTime, "ptr", pst, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpCrackUrl function separates a URL into its component parts such as host name and path.
     * @param {PWSTR} pwszUrl Pointer to a string that contains the canonical URL to separate. <b>WinHttpCrackUrl</b> does not check this URL for validity or correct format before attempting to crack it.
     * @param {Integer} dwUrlLength The length of the 
     * <i>pwszUrl</i> string, in characters. If 
     * <i>dwUrlLength</i> is set to zero, 
     * <b>WinHttpCrackUrl</b> assumes that the 
     * <i>pwszUrl</i> string is <b>null</b> terminated and  determines the length of the 
     * <i>pwszUrl</i> string based on that assumption.
     * @param {Integer} dwFlags The flags that control the operation. This parameter can be a combination of one or more of the following flags (values can be bitwise OR'd together). Or, the parameter can be 0, which performs no special operations.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICU_DECODE"></a><a id="icu_decode"></a><dl>
     * <dt><b>ICU_DECODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Converts characters that are "escape encoded" (%xx) to their non-escaped form.  This does not decode other encodings, such as UTF-8. This feature can be used only if the user provides buffers in the <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure to copy the components into.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICU_ESCAPE"></a><a id="icu_escape"></a><dl>
     * <dt><b>ICU_ESCAPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Escapes certain characters to their escape sequences (%xx). Characters to be escaped are non-ASCII characters or those ASCII characters that must be escaped to be represented in an HTTP request.  This feature can be used only if the user provides buffers in the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure to copy the components into. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICU_REJECT_USERPWD"></a><a id="icu_reject_userpwd"></a><dl>
     * <dt><b>ICU_REJECT_USERPWD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Rejects URLs as input that contain embedded credentials (either a username, a password, or both). If the function fails because of an invalid URL, then subsequent calls to GetLastError return <b>ERROR_WINHTTP_INVALID_URL</b>.
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<URL_COMPONENTS>} lpUrlComponents Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure that receives the URL components.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Codes</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL scheme could not be recognized, or is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpcrackurl
     * @since windows5.1.2600
     */
    static WinHttpCrackUrl(pwszUrl, dwUrlLength, dwFlags, lpUrlComponents) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpCrackUrl", "ptr", pwszUrl, "uint", dwUrlLength, "uint", dwFlags, "ptr", lpUrlComponents, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a URL from component parts such as the host name and path.
     * @param {Pointer<URL_COMPONENTS>} lpUrlComponents Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-url_components">URL_COMPONENTS</a> structure that contains the components from which to create the URL.
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwszUrl Pointer to a character buffer that receives the URL as a wide character (Unicode) string.
     * @param {Pointer<Integer>} pdwUrlLength Pointer to a variable of type unsigned long integer that receives the length of the 
     * <i>pwszUrl</i> buffer in wide (Unicode) characters. When the function returns, this parameter receives the length of the URL string wide in characters, minus 1 for the terminating character. If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of wide characters required to hold the created URL.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error data, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpcreateurl
     * @since windows5.1.2600
     */
    static WinHttpCreateUrl(lpUrlComponents, dwFlags, pwszUrl, pdwUrlLength) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpCreateUrl", "ptr", lpUrlComponents, "uint", dwFlags, "ptr", pwszUrl, "uint*", pdwUrlLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpCheckPlatform function determines whether the current platform is supported by this version of Microsoft Windows HTTP Services (WinHTTP).
     * @returns {BOOL} The return value is <b>TRUE</b> if the platform is supported by Microsoft Windows HTTP Services (WinHTTP), or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpcheckplatform
     * @since windows5.1.2600
     */
    static WinHttpCheckPlatform() {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpCheckPlatform", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the default WinHTTP proxy configuration from the registry.
     * @param {Pointer<WINHTTP_PROXY_INFO>} pProxyInfo A pointer to a variable of type 
     * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_info">WINHTTP_PROXY_INFO</a> that receives the default proxy configuration.
     * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise. To retrieve a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Error codes returned include the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpgetdefaultproxyconfiguration
     * @since windows5.1.2600
     */
    static WinHttpGetDefaultProxyConfiguration(pProxyInfo) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpGetDefaultProxyConfiguration", "ptr", pProxyInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the default WinHTTP proxy configuration in the registry.
     * @param {Pointer<WINHTTP_PROXY_INFO>} pProxyInfo A pointer to a variable of type 
     * <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_info">WINHTTP_PROXY_INFO</a> that specifies the default proxy configuration.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpsetdefaultproxyconfiguration
     * @since windows5.1.2600
     */
    static WinHttpSetDefaultProxyConfiguration(pProxyInfo) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpSetDefaultProxyConfiguration", "ptr", pProxyInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes, for an application, the use of WinHTTP functions and returns a WinHTTP-session handle.
     * @param {PWSTR} pszAgentW A pointer to a string variable that contains the name of the application or entity calling the WinHTTP functions. This name is used as the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/glossary">user agent</a> in the HTTP protocol.
     * @param {Integer} dwAccessType 
     * @param {PWSTR} pszProxyW A pointer to a string variable that contains the name of the proxy server to use when proxy access is specified by setting 
     * <i>dwAccessType</i> to 
     * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b>. The WinHTTP functions recognize only CERN type proxies for HTTP. If 
     * <i>dwAccessType</i> is not set to 
     * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b>, this parameter must be set to <b>WINHTTP_NO_PROXY_NAME</b>.
     * @param {PWSTR} pszProxyBypassW A pointer to a string variable that contains an optional semicolon delimited list of host names or IP addresses, or both, that should not be routed through the proxy when 
     * <i>dwAccessType</i> is set to 
     * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b>. The list can contain wildcard characters. Do not use an empty string, because the 
     * <b>WinHttpOpen</b> function uses it as the proxy bypass list. If this parameter specifies the "&lt;local&gt;" macro in the list as the only entry, this function bypasses any host name that does not contain a period. If 
     * <i>dwAccessType</i> is not set to 
     * <b>WINHTTP_ACCESS_TYPE_NAMED_PROXY</b>, this parameter must be set to <b>WINHTTP_NO_PROXY_BYPASS</b>.
     * @param {Integer} dwFlags Unsigned long integer value that contains the flags that indicate various options affecting the behavior of this function. This parameter can have the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_FLAG_ASYNC"></a><a id="winhttp_flag_async"></a><dl>
     * <dt><b>WINHTTP_FLAG_ASYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the WinHTTP functions asynchronously. By default, all WinHTTP functions that use the returned 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle are performed synchronously. When this flag is set, the caller needs to specify a callback function through <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetstatuscallback">WinHttpSetStatusCallback</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Pointer<Void>} Returns a valid session handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpopen
     * @since windows5.1.2600
     */
    static WinHttpOpen(pszAgentW, dwAccessType, pszProxyW, pszProxyBypassW, dwFlags) {
        pszAgentW := pszAgentW is String ? StrPtr(pszAgentW) : pszAgentW
        pszProxyW := pszProxyW is String ? StrPtr(pszProxyW) : pszProxyW
        pszProxyBypassW := pszProxyBypassW is String ? StrPtr(pszProxyBypassW) : pszProxyBypassW

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpOpen", "ptr", pszAgentW, "uint", dwAccessType, "ptr", pszProxyW, "ptr", pszProxyBypassW, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpCloseHandle function closes a single **HINTERNET** handle.
     * @param {Pointer<Void>} hInternet A valid **HINTERNET** handle (see [HINTERNET Handles in WinHTTP](/windows/win32/winhttp/hinternet-handles-in-winhttp)) to be closed.
     * @returns {BOOL} **TRUE** if the handle is successfully closed, otherwise **FALSE**. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Codes</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WinHTTP function support is being shut down or unloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpclosehandle
     * @since windows5.1.2600
     */
    static WinHttpCloseHandle(hInternet) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpCloseHandle", "ptr", hInternet, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpConnect function specifies the initial target server of an HTTP request and returns an HINTERNET connection handle to an HTTP session for that initial target.
     * @param {Pointer<Void>} hSession Valid 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> WinHTTP session handle returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>.
     * @param {PWSTR} pswzServerName Pointer to a <b>null</b>-terminated string that contains the host name of an HTTP server. Alternately, the string can contain the IP address of the site in ASCII, for example, 10.0.1.45.
     * Note that WinHttp does not accept international host names without converting them first to <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/">Punycode</a>. For more information, see <a href="https://docs.microsoft.com/windows/win32/intl/handling-internationalized-domain-names--idns">Handling Internationalized Domain Names (IDNs)</a>.
     * @param {Integer} nServerPort 
     * @param {Integer} dwReserved This parameter is reserved and must be 0.
     * @returns {Pointer<Void>} Returns a valid connection handle to the HTTP session if the connection is successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Codes</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL scheme could not be recognized, or is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WinHTTP function support is being shut down or unloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpconnect
     * @since windows5.1.2600
     */
    static WinHttpConnect(hSession, pswzServerName, nServerPort, dwReserved) {
        pswzServerName := pswzServerName is String ? StrPtr(pswzServerName) : pswzServerName

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpConnect", "ptr", hSession, "ptr", pswzServerName, "ushort", nServerPort, "uint", dwReserved, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpReadData function reads data from a handle opened by the WinHttpOpenRequest function.
     * @param {Pointer<Void>} hRequest Valid 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>. <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpquerydataavailable">WinHttpQueryDataAvailable</a> must have been called for this handle and must have completed before <b>WinHttpReadData</b> is called. Although calling <b>WinHttpReadData</b> immediately after completion of <b>WinHttpReceiveResponse</b> avoids the expense of a buffer copy, doing so requires that the application use a fixed-length buffer for reading.
     * @param {Pointer} lpBuffer Pointer to a buffer that receives the data read. Make sure that this buffer remains valid until <b>WinHttpReadData</b> has completed.
     * @param {Integer} dwNumberOfBytesToRead Unsigned long integer value that contains the number of bytes to read.
     * @param {Pointer<Integer>} lpdwNumberOfBytesRead Pointer to an unsigned long integer variable that receives the number of bytes read. 
     * <b>WinHttpReadData</b> sets this value to zero before doing any work or error checking.  When using WinHTTP asynchronously, always set this parameter to <b>NULL</b> and retrieve the information in the callback function; not doing so can cause a memory fault.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following table identifies the error codes that are returned.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP 5.1 does not support SSL2 unless the client specifically enables it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be carried out because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned when an incoming response exceeds an internal WinHTTP size limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request has timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpreaddata
     * @since windows5.1.2600
     */
    static WinHttpReadData(hRequest, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpReadData", "ptr", hRequest, "ptr", lpBuffer, "uint", dwNumberOfBytesToRead, "uint*", lpdwNumberOfBytesRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hRequest 
     * @param {Pointer} lpBuffer 
     * @param {Integer} dwNumberOfBytesToRead 
     * @param {Pointer<Integer>} lpdwNumberOfBytesRead 
     * @param {Integer} ullFlags 
     * @param {Integer} cbProperty 
     * @param {Pointer} pvProperty 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpreaddataex
     */
    static WinHttpReadDataEx(hRequest, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead, ullFlags, cbProperty, pvProperty) {
        result := DllCall("WINHTTP.dll\WinHttpReadDataEx", "ptr", hRequest, "ptr", lpBuffer, "uint", dwNumberOfBytesToRead, "uint*", lpdwNumberOfBytesRead, "uint", ullFlags, "uint", cbProperty, "ptr", pvProperty, "uint")
        return result
    }

    /**
     * The WinHttpWriteData function writes request data to an HTTP server.
     * @param {Pointer<Void>} hRequest Valid 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>. Wait until <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a> has completed before calling  this function.
     * @param {Pointer} lpBuffer Pointer to a buffer that contains the data to be sent to the server. Be sure that this buffer remains valid until after <b>WinHttpWriteData</b> completes.
     * @param {Integer} dwNumberOfBytesToWrite Unsigned long integer value that contains the number of bytes to be written to the file.
     * @param {Pointer<Integer>} lpdwNumberOfBytesWritten Pointer to an unsigned long integer variable that receives the number of bytes written to the buffer. The 
     * <b>WinHttpWriteData</b> function sets this value to zero before doing any work or error checking.  When using WinHTTP asynchronously, this parameter must be set to <b>NULL</b> and retrieve the information in the callback function. Not doing so can cause a memory fault.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are:
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP version 5.1 does not support SSL2 unless the client specifically enables it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be carried out because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request has timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpwritedata
     * @since windows5.1.2600
     */
    static WinHttpWriteData(hRequest, lpBuffer, dwNumberOfBytesToWrite, lpdwNumberOfBytesWritten) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpWriteData", "ptr", hRequest, "ptr", lpBuffer, "uint", dwNumberOfBytesToWrite, "uint*", lpdwNumberOfBytesWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the amount of data, in bytes, available to be read with WinHttpReadData.
     * @param {Pointer<Void>} hRequest A valid 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>. <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> must have been called for this handle and have completed before <b>WinHttpQueryDataAvailable</b> is called.
     * @param {Pointer<Integer>} lpdwNumberOfBytesAvailable A pointer to an unsigned long integer variable that receives the number of available bytes. When WinHTTP is used in asynchronous mode, always set this parameter to <b>NULL</b> and retrieve data in the callback function; not doing so can cause a memory fault.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error data, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP version 5.1 does not support SSL2 unless the client specifically enables it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot complete because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request has timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpquerydataavailable
     * @since windows5.1.2600
     */
    static WinHttpQueryDataAvailable(hRequest, lpdwNumberOfBytesAvailable) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpQueryDataAvailable", "ptr", hRequest, "uint*", lpdwNumberOfBytesAvailable, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpQueryOption function queries an Internet option on the specified handle.
     * @param {Pointer<Void>} hInternet An <b>HINTERNET</b> handle on which to query information. Note that this can be either a Session handle or a Request handle, depending on what option is being queried; see the  <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a> topic to determine which handle is appropriate to use in querying a particular option.
     * @param {Integer} dwOption An unsigned long integer value that contains the Internet option to query. This can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a> values.
     * @param {Pointer} lpBuffer A pointer to a buffer that receives the option setting. Strings returned by the 
     * <b>WinHttpQueryOption</b> function are globally allocated, so the calling application must globally free the string when it finishes using it. Setting this parameter to <b>NULL</b> causes this function to return <b>FALSE</b>.  Calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> then returns ERROR_INSUFFICIENT_BUFFER and 
     * <i>lpdwBufferLength</i>          contains the number of bytes required to hold the requested information.
     * @param {Pointer<Integer>} lpdwBufferLength A pointer to an unsigned long integer variable that contains the length of 
     * <i>lpBuffer</i>, in bytes. When the function returns, the variable receives the length of the data placed into 
     * <i>lpBuffer</i>. If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of bytes required to hold the requested information.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following:
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be carried out because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid option value was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpqueryoption
     * @since windows5.1.2600
     */
    static WinHttpQueryOption(hInternet, dwOption, lpBuffer, lpdwBufferLength) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpQueryOption", "ptr", hInternet, "uint", dwOption, "ptr", lpBuffer, "uint*", lpdwBufferLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpSetOption function sets an Internet option.
     * @param {Pointer<Void>} hInternet The <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle on which to set data. Be aware  that this can be either a Session handle or a Request handle, depending on what option is being set. For more information about how to determine which handle is appropriate to use in setting a particular option, see the  <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a>.
     * @param {Integer} dwOption An unsigned long integer value that contains the Internet option to set. This can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">Option Flags</a> values.
     * @param {Pointer<Void>} lpBuffer A pointer to a buffer that contains the option setting.
     * @param {Integer} dwBufferLength Unsigned long integer value that contains the length of the 
     * <i>lpBuffer</i> buffer. The length of the buffer is specified in characters for the following options; for all other options, the length is specified in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following:
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be carried out because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A request to 
     * <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> or 
     * <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> specified an invalid option value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * This value will be returned if <b>WINHTTP_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL</b> is set to a value lower than 15000.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPTION_NOT_SETTABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested option cannot be set, only queried.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * This value will be returned if <b>WINHTTP_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL</b> is set to a value lower than 15000.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpsetoption
     * @since windows5.1.2600
     */
    static WinHttpSetOption(hInternet, dwOption, lpBuffer, dwBufferLength) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpSetOption", "ptr", hInternet, "uint", dwOption, "ptr", lpBuffer, "uint", dwBufferLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets time-outs involved with HTTP transactions.
     * @param {Pointer<Void>} hInternet The <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>.
     * @param {Integer} nResolveTimeout A value of type integer that specifies the time-out value, in milliseconds, to use for name resolution. If resolution takes longer than this time-out value, the action is canceled. The initial value is zero, meaning no time-out (infinite). 
     * 
     * <b>Windows Vista and Windows XP:  </b>If DNS timeout is specified using NAME_RESOLUTION_TIMEOUT, there is an overhead of one thread per request.
     * @param {Integer} nConnectTimeout A value of type integer that specifies the time-out value, in milliseconds, to use for server connection requests. If a connection request takes longer than this time-out value, the request is canceled. The initial value is 60,000 (60 seconds).
     * 
     * TCP/IP can time out while setting up the socket during the three leg SYN/ACK exchange, regardless of the value of this parameter.
     * @param {Integer} nSendTimeout A value of type integer that specifies the time-out value, in milliseconds, to use for sending requests. If sending a request takes longer than this time-out value, the send is canceled. The initial value is 30,000 (30 seconds).
     * @param {Integer} nReceiveTimeout A value of type integer that specifies the time-out value, in milliseconds, to receive a response to a request. If a response takes longer than this time-out value, the request is canceled. The initial value is 30,000 (30 seconds).
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be carried out because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the timeout parameters has a negative value other than -1.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpsettimeouts
     * @since windows5.1.2600
     */
    static WinHttpSetTimeouts(hInternet, nResolveTimeout, nConnectTimeout, nSendTimeout, nReceiveTimeout) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpSetTimeouts", "ptr", hInternet, "int", nResolveTimeout, "int", nConnectTimeout, "int", nSendTimeout, "int", nReceiveTimeout, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpOpenRequest function creates an HTTP request handle.
     * @param {Pointer<Void>} hConnect <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> connection handle to an HTTP session returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpconnect">WinHttpConnect</a>.
     * @param {PWSTR} pwszVerb Pointer to a string that contains the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/glossary">HTTP verb</a> to use in the request. If this parameter is <b>NULL</b>, the function uses GET as the <i>HTTP verb</i>. <b>Note</b>  This string should be all uppercase. Many servers treat HTTP verbs as case-sensitive, and the Internet Engineering Task Force (IETF)  Requests for Comments (RFCs) spell these verbs using uppercase characters only.
     * @param {PWSTR} pwszObjectName Pointer to a string that contains the name of the target resource of the specified HTTP verb. This is generally a file name, an executable module, or a search specifier.
     * @param {PWSTR} pwszVersion Pointer to a string that contains the HTTP version. If this parameter is <b>NULL</b>, the function uses HTTP/1.1.
     * @param {PWSTR} pwszReferrer Pointer to a string that specifies the URL of the document from which the URL in the request 
     * <i>pwszObjectName</i> was obtained. If this parameter is set to <b>WINHTTP_NO_REFERER</b>, no referring document is specified.
     * @param {Pointer<PWSTR>} ppwszAcceptTypes Pointer to a <b>null</b>-terminated array of string pointers that specifies media types accepted by the client. If this parameter is set to <b>WINHTTP_DEFAULT_ACCEPT_TYPES</b>, no types are accepted by the client. Typically, servers handle a lack of accepted types as indication that the client accepts only documents of type "text//"; that is, only text documents—no pictures or other binary files. For a list of valid media types, see Media Types defined by IANA at http://www.iana.org/assignments/media-types/.
     * @param {Integer} dwFlags 
     * @returns {Pointer<Void>} Returns a valid HTTP request handle if successful, or <b>NULL</b> if not. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL specified a scheme other than "http:" or "https:".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpopenrequest
     * @since windows5.1.2600
     */
    static WinHttpOpenRequest(hConnect, pwszVerb, pwszObjectName, pwszVersion, pwszReferrer, ppwszAcceptTypes, dwFlags) {
        pwszVerb := pwszVerb is String ? StrPtr(pwszVerb) : pwszVerb
        pwszObjectName := pwszObjectName is String ? StrPtr(pwszObjectName) : pwszObjectName
        pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion
        pwszReferrer := pwszReferrer is String ? StrPtr(pwszReferrer) : pwszReferrer

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpOpenRequest", "ptr", hConnect, "ptr", pwszVerb, "ptr", pwszObjectName, "ptr", pwszVersion, "ptr", pwszReferrer, "ptr", ppwszAcceptTypes, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds one or more HTTP request headers to the HTTP request handle.
     * @param {Pointer<Void>} hRequest A <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a> function.
     * @param {PWSTR} lpszHeaders A pointer to a string variable that contains the headers to append to the request. Each header except the last must be terminated by a carriage return/line feed (CR/LF).
     * @param {Integer} dwHeadersLength An unsigned long integer value that contains the length, in characters, of 
     * <i>pwszHeaders</i>. If this parameter is -1L, the function assumes that 
     * <i>pwszHeaders</i> is zero-terminated (ASCIIZ), and the length is computed.
     * @param {Integer} dwModifiers An unsigned long integer value that contains the flags used to modify the semantics of this function. Can be one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_ADD"></a><a id="winhttp_addreq_flag_add"></a><dl>
     * <dt><b>WINHTTP_ADDREQ_FLAG_ADD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Adds the header if it does not exist. Used with 
     * <b>WINHTTP_ADDREQ_FLAG_REPLACE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_ADD_IF_NEW"></a><a id="winhttp_addreq_flag_add_if_new"></a><dl>
     * <dt><b>WINHTTP_ADDREQ_FLAG_ADD_IF_NEW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Adds the header only if it does not already exist; otherwise, an error is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_COALESCE"></a><a id="winhttp_addreq_flag_coalesce"></a><dl>
     * <dt><b>WINHTTP_ADDREQ_FLAG_COALESCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merges headers of the same name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA"></a><a id="winhttp_addreq_flag_coalesce_with_comma"></a><dl>
     * <dt><b>WINHTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merges headers of the same name using a comma. For example, adding "Accept: text//" followed by "Accept: audio//" with this flag results in a single header "Accept: text//, audio//". This causes the first header found to be merged. The calling application must  to ensure a cohesive scheme with respect to merged and separate headers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON"></a><a id="winhttp_addreq_flag_coalesce_with_semicolon"></a><dl>
     * <dt><b>WINHTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Merges headers of the same name using a semicolon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_ADDREQ_FLAG_REPLACE"></a><a id="winhttp_addreq_flag_replace"></a><dl>
     * <dt><b>WINHTTP_ADDREQ_FLAG_REPLACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Replaces or removes a header. If the header value is empty and the header is found, it is removed. If the value is not empty, it is replaced.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be performed because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpaddrequestheaders
     * @since windows5.1.2600
     */
    static WinHttpAddRequestHeaders(hRequest, lpszHeaders, dwHeadersLength, dwModifiers) {
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpAddRequestHeaders", "ptr", hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "uint", dwModifiers, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hRequest 
     * @param {Integer} dwModifiers 
     * @param {Integer} ullFlags 
     * @param {Integer} ullExtra 
     * @param {Integer} cHeaders 
     * @param {Pointer<WINHTTP_EXTENDED_HEADER>} pHeaders 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpaddrequestheadersex
     */
    static WinHttpAddRequestHeadersEx(hRequest, dwModifiers, ullFlags, ullExtra, cHeaders, pHeaders) {
        result := DllCall("WINHTTP.dll\WinHttpAddRequestHeadersEx", "ptr", hRequest, "uint", dwModifiers, "uint", ullFlags, "uint", ullExtra, "uint", cHeaders, "ptr", pHeaders, "uint")
        return result
    }

    /**
     * Sends the specified request to the HTTP server.
     * @param {Pointer<Void>} hRequest An <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>.
     * @param {PWSTR} lpszHeaders A pointer to a string  that contains the additional headers to append to the request. This parameter can be <b>WINHTTP_NO_ADDITIONAL_HEADERS</b> if there are no additional headers to append.
     * @param {Integer} dwHeadersLength An unsigned long integer value that contains the length, in characters, of the additional headers. If this parameter is <b>-1L</b> and 
     * <i>pwszHeaders</i> is not <b>NULL</b>, this function assumes that 
     * <i>pwszHeaders</i> is <b>null</b>-terminated, and the length is calculated.
     * @param {Pointer} lpOptional A pointer to a buffer that contains any optional data to send immediately after the request headers. This parameter is generally used for POST and PUT operations. The optional data can be the resource or data posted to the server. This parameter can be <b>WINHTTP_NO_REQUEST_DATA</b> if there is no optional data to send.
     * 
     * If the <i>dwOptionalLength</i> parameter is 0, this parameter is ignored and set to <b>NULL</b>.
     * 
     * This buffer must remain available until the request handle is closed or the call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> has completed.
     * @param {Integer} dwOptionalLength An unsigned long integer value that contains the length, in bytes, of the optional data. This parameter can be zero if there is no optional data to send.
     * 
     * This parameter must contain a valid length when the <i>lpOptional</i> parameter is not <b>NULL</b>. Otherwise, <i>lpOptional</i> is ignored and set to <b>NULL</b>.
     * @param {Integer} dwTotalLength An unsigned long integer value that contains the length, in bytes, of the total data sent.  This parameter specifies the Content-Length header of the request.  If the value of this parameter is greater than the length specified by 
     * <i>dwOptionalLength</i>, then 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwritedata">WinHttpWriteData</a> can be used to send additional data.
     * 
     * <i>dwTotalLength</i> must not change between calls to <b>WinHttpSendRequest</b> for the same request.  If <i>dwTotalLength</i> needs to be changed, the caller should create a new request.
     * @param {Pointer} dwContext A pointer to a pointer-sized variable that contains an application-defined value that is passed, with the request handle, to any callback functions.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Error codes are listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CANNOT_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if  connection to the server failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The secure HTTP server requires a client certificate. The application retrieves the list of certificate issuers by calling <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> with the <b>WINHTTP_OPTION_CLIENT_CERT_ISSUER_LIST</b> option.
     * 
     * If the server requests the client certificate, but does not require it, the application can alternately call <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> with the <b>WINHTTP_OPTION_CLIENT_CERT_CONTEXT</b> option. In this case, the application specifies the WINHTTP_NO_CLIENT_CERT_CONTEXT macro in the <i>lpBuffer</i> parameter of <b>WinHttpSetOption</b>. For more information, see the <b>WINHTTP_OPTION_CLIENT_CERT_CONTEXT</b> option.<b>Windows Server 2003 with SP1, Windows XP with SP2 and Windows 2000:  </b>This error is not supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP version 5.1 does not support SSL2 unless the client specifically enables it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be carried out because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_LOGIN_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The login attempt failed.  When this error is encountered, the request handle should be closed with 
     * <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a>.  A new request handle must be created before retrying the function that originally produced this error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_NAME_NOT_RESOLVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server name cannot be resolved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned when an incoming response exceeds an internal WinHTTP size limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_SECURE_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more errors were found in the Secure Sockets Layer (SSL) certificate sent by the server.  To determine what type of error was encountered, verify through a 
     * <a href="/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_CALLBACK_STATUS_SECURE_FAILURE</a> notification in a status callback function.  For more information, see 
     * <a href="/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WinHTTP function support is shut down or unloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL specified a scheme other than "http:" or "https:".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * <b>Windows Server 2003, Windows XP and Windows 2000:  </b>The TCP reservation range set with the <b>WINHTTP_OPTION_PORT_RESERVATION</b> option is not large enough to send this request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The content length specified in the <i>dwTotalLength</i> parameter does not match the length specified in the Content-Length header.
     * 
     * The <i>lpOptional</i> parameter must be <b>NULL</b> and the <i>dwOptionalLength</i> parameter must be zero when the Transfer-Encoding header is present.
     * 
     * The Content-Length header cannot be present when the Transfer-Encoding header is present. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> ERROR_WINHTTP_RESEND_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The application must call <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a> again due to a redirect or authentication challenge.
     * 
     * <b>Windows Server 2003 with SP1, Windows XP with SP2 and Windows 2000:  </b>This error is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpsendrequest
     * @since windows5.1.2600
     */
    static WinHttpSendRequest(hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength, dwTotalLength, dwContext) {
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpSendRequest", "ptr", hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "ptr", lpOptional, "uint", dwOptionalLength, "uint", dwTotalLength, "ptr", dwContext, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpSetCredentials function passes the required authorization credentials to the server.
     * @param {Pointer<Void>} hRequest Valid 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>.
     * @param {Integer} AuthTargets An unsigned integer that specifies a flag that contains the authentication target.  Can be one of the  values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_TARGET_SERVER"></a><a id="winhttp_auth_target_server"></a><dl>
     * <dt><b>WINHTTP_AUTH_TARGET_SERVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Credentials are passed to a server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_TARGET_PROXY"></a><a id="winhttp_auth_target_proxy"></a><dl>
     * <dt><b>WINHTTP_AUTH_TARGET_PROXY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Credentials are passed to a proxy.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} AuthScheme An unsigned integer that specifies a flag that contains the authentication scheme.  Must be one of the supported authentication schemes returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryauthschemes">WinHttpQueryAuthSchemes</a>. The following table identifies the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_BASIC"></a><a id="winhttp_auth_scheme_basic"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_BASIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use basic authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NTLM"></a><a id="winhttp_auth_scheme_ntlm"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_NTLM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use NTLM authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_PASSPORT"></a><a id="winhttp_auth_scheme_passport"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_PASSPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use passport authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_DIGEST"></a><a id="winhttp_auth_scheme_digest"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_DIGEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use digest authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NEGOTIATE"></a><a id="winhttp_auth_scheme_negotiate"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_NEGOTIATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Selects between NTLM and Kerberos authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszUserName Pointer to a string that contains a valid user name.
     * @param {PWSTR} pwszPassword Pointer to a string that contains a valid password.  The password can be blank.
     * @param {Pointer<Void>} pAuthParams This parameter is reserved and must be <b>NULL</b>.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following table identifies the error codes returned.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be carried out because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation (Windows error code).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpsetcredentials
     * @since windows5.1.2600
     */
    static WinHttpSetCredentials(hRequest, AuthTargets, AuthScheme, pwszUserName, pwszPassword, pAuthParams) {
        pwszUserName := pwszUserName is String ? StrPtr(pwszUserName) : pwszUserName
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpSetCredentials", "ptr", hRequest, "uint", AuthTargets, "uint", AuthScheme, "ptr", pwszUserName, "ptr", pwszPassword, "ptr", pAuthParams, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpQueryAuthSchemes function returns the authorization schemes that are supported by the server.
     * @param {Pointer<Void>} hRequest Valid 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>
     * @param {Pointer<Integer>} lpdwSupportedSchemes An unsigned integer that specifies a flag that contains the supported authentication schemes.  This parameter can return one or more flags that are identified in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_BASIC"></a><a id="winhttp_auth_scheme_basic"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_BASIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates basic authentication is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NTLM"></a><a id="winhttp_auth_scheme_ntlm"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_NTLM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates NTLM authentication is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_PASSPORT"></a><a id="winhttp_auth_scheme_passport"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_PASSPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates passport authentication is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_DIGEST"></a><a id="winhttp_auth_scheme_digest"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_DIGEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates digest authentication is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NEGOTIATE"></a><a id="winhttp_auth_scheme_negotiate"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_NEGOTIATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Selects between NTLM and Kerberos authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpdwFirstScheme An unsigned integer that specifies a flag that contains the  first authentication scheme listed by the server.  This parameter can return one or more flags that are identified in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_BASIC"></a><a id="winhttp_auth_scheme_basic"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_BASIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates basic authentication is first.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NTLM"></a><a id="winhttp_auth_scheme_ntlm"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_NTLM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates NTLM authentication is first.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_PASSPORT"></a><a id="winhttp_auth_scheme_passport"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_PASSPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates passport authentication is first.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_DIGEST"></a><a id="winhttp_auth_scheme_digest"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_DIGEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates digest authentication is first.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_SCHEME_NEGOTIATE"></a><a id="winhttp_auth_scheme_negotiate"></a><dl>
     * <dt><b>WINHTTP_AUTH_SCHEME_NEGOTIATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Selects between NTLM and Kerberos authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwAuthTarget An unsigned integer that specifies a flag that contains the authentication target.  This parameter can return one or more flags that are identified in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_TARGET_SERVER"></a><a id="winhttp_auth_target_server"></a><dl>
     * <dt><b>WINHTTP_AUTH_TARGET_SERVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authentication target is a server. Indicates that a 401 status code has been received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTH_TARGET_PROXY"></a><a id="winhttp_auth_target_proxy"></a><dl>
     * <dt><b>WINHTTP_AUTH_TARGET_PROXY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Authentication target is a proxy. Indicates that a 407 status code has been received.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> if unsuccessful. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following table identifies the error codes that are returned.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpqueryauthschemes
     * @since windows5.1.2600
     */
    static WinHttpQueryAuthSchemes(hRequest, lpdwSupportedSchemes, lpdwFirstScheme, pdwAuthTarget) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpQueryAuthSchemes", "ptr", hRequest, "uint*", lpdwSupportedSchemes, "uint*", lpdwFirstScheme, "uint*", pdwAuthTarget, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpReceiveResponse function waits to receive the response to an HTTP request initiated by WinHttpSendRequest.
     * @param {Pointer<Void>} hRequest <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a> and sent by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsendrequest">WinHttpSendRequest</a>.  Wait until <b>WinHttpSendRequest</b> has completed for this handle before calling  <b>WinHttpReceiveResponse</b>.
     * @param {Pointer<Void>} lpReserved This parameter is reserved and must be <b>NULL</b>.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CANNOT_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if  connection to the server failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CHUNKED_ENCODING_HEADER_SIZE_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned when an overflow condition is encountered in the course of parsing chunked encoding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CLIENT_AUTH_CERT_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned when the server requests client authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_CONNECTION_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection with the server has been reset or terminated, or an incompatible SSL protocol was encountered. For example, WinHTTP version 5.1 does not support SSL2 unless the client specifically enables it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_HEADER_COUNT_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned when a larger number of headers were present in a response than WinHTTP could receive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_HEADER_SIZE_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned by <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpreceiveresponse">WinHttpReceiveResponse</a> when the size of headers received  exceeds the limit for the request handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be carried out because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_SERVER_RESPONSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server response could not be parsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_LOGIN_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The login attempt failed.  When this error is encountered, the request handle should be closed with 
     * <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a>.  A new request handle must be created before retrying the function that originally produced this error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_NAME_NOT_RESOLVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server name could not be resolved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_REDIRECT_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The redirection failed because either the scheme changed or all attempts made to redirect failed (default is five attempts).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_RESEND_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WinHTTP function failed.  The desired function can be retried on the same request handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_RESPONSE_DRAIN_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned when an incoming response exceeds an internal WinHTTP size limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_SECURE_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more errors were found in the Secure Sockets Layer (SSL) certificate sent by the server.  To determine what type of error was encountered, check for a 
     * <a href="/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_CALLBACK_STATUS_SECURE_FAILURE</a> notification in a status callback function.  For more information, see 
     * <a href="/windows/desktop/api/winhttp/nc-winhttp-winhttp_status_callback">WINHTTP_STATUS_CALLBACK</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request has timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL specified a scheme other than "http:" or "https:".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpreceiveresponse
     * @since windows5.1.2600
     */
    static WinHttpReceiveResponse(hRequest, lpReserved) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpReceiveResponse", "ptr", hRequest, "ptr", lpReserved, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WinHttpQueryHeaders function retrieves header information associated with an HTTP request.
     * @param {Pointer<Void>} hRequest <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> request handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopenrequest">WinHttpOpenRequest</a>. 
     * WinHttpReceiveResponse must have been called for this handle and have completed before <b>WinHttpQueryHeaders</b> is called.
     * @param {Integer} dwInfoLevel Value of type <b>DWORD</b> that specifies a combination of attribute and modifier flags listed on the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/query-info-flags">Query Info Flags</a> page. These attribute and modifier flags indicate that the information is being requested and how it is to be formatted.
     * @param {PWSTR} pwszName Pointer to a string that contains the header name. If the flag in 
     * <i>dwInfoLevel</i> is not 
     * <b>WINHTTP_QUERY_CUSTOM</b>, set this parameter to WINHTTP_HEADER_NAME_BY_INDEX.
     * @param {Pointer} lpBuffer Pointer to the buffer that receives the information. Setting this parameter to WINHTTP_NO_OUTPUT_BUFFER causes this function to return <b>FALSE</b>.  Calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> then returns 
     * <b>ERROR_INSUFFICIENT_BUFFER</b> and 
     * <i>lpdwBufferLength</i> contains the number of bytes required to hold the requested information.
     * @param {Pointer<Integer>} lpdwBufferLength Pointer to a value of type <b>DWORD</b> that specifies the length of the data buffer, in bytes. When the function returns, this parameter contains the pointer to a value that specifies the length of the information written to the buffer. When the function returns strings, the following rules apply. 
     * 					
     * 
     * <ul>
     * <li>If the function succeeds, 
     * <i>lpdwBufferLength</i> specifies the length of the string, in bytes, minus 2 for the terminating null. </li>
     * <li>If the function fails and 
     * <b>ERROR_INSUFFICIENT_BUFFER</b> is returned, 
     * <i>lpdwBufferLength</i> specifies the number of bytes that the application must allocate to receive the string. </li>
     * </ul>
     * @param {Pointer<Integer>} lpdwIndex Pointer to a zero-based header index used to enumerate multiple headers with the same name. When calling the function, this parameter is the index of the specified header to return. When the function returns, this parameter is the index of the next header. If the next index cannot be found, 
     * <b>ERROR_WINHTTP_HEADER_NOT_FOUND</b> is returned. Set this parameter to WINHTTP_NO_HEADER_INDEX to specify that only the first occurrence of a header should be returned.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_HEADER_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested header could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested operation cannot be carried out because the handle supplied is not in the correct state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpqueryheaders
     * @since windows5.1.2600
     */
    static WinHttpQueryHeaders(hRequest, dwInfoLevel, pwszName, lpBuffer, lpdwBufferLength, lpdwIndex) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpQueryHeaders", "ptr", hRequest, "uint", dwInfoLevel, "ptr", pwszName, "ptr", lpBuffer, "uint*", lpdwBufferLength, "uint*", lpdwIndex, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hRequest 
     * @param {Integer} dwInfoLevel 
     * @param {Integer} ullFlags 
     * @param {Integer} uiCodePage 
     * @param {Pointer<Integer>} pdwIndex 
     * @param {Pointer<WINHTTP_HEADER_NAME>} pHeaderName 
     * @param {Pointer} pBuffer 
     * @param {Pointer<Integer>} pdwBufferLength 
     * @param {Pointer<Pointer<WINHTTP_EXTENDED_HEADER>>} ppHeaders 
     * @param {Pointer<Integer>} pdwHeadersCount 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpqueryheadersex
     */
    static WinHttpQueryHeadersEx(hRequest, dwInfoLevel, ullFlags, uiCodePage, pdwIndex, pHeaderName, pBuffer, pdwBufferLength, ppHeaders, pdwHeadersCount) {
        result := DllCall("WINHTTP.dll\WinHttpQueryHeadersEx", "ptr", hRequest, "uint", dwInfoLevel, "uint", ullFlags, "uint", uiCodePage, "uint*", pdwIndex, "ptr", pHeaderName, "ptr", pBuffer, "uint*", pdwBufferLength, "ptr*", ppHeaders, "uint*", pdwHeadersCount, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hInternet 
     * @param {Pointer<Guid>} pGuidConnection 
     * @param {Integer} ullFlags 
     * @param {Pointer<Pointer<WINHTTP_QUERY_CONNECTION_GROUP_RESULT>>} ppResult 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpqueryconnectiongroup
     */
    static WinHttpQueryConnectionGroup(hInternet, pGuidConnection, ullFlags, ppResult) {
        result := DllCall("WINHTTP.dll\WinHttpQueryConnectionGroup", "ptr", hInternet, "ptr", pGuidConnection, "uint", ullFlags, "ptr*", ppResult, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<WINHTTP_QUERY_CONNECTION_GROUP_RESULT>} pResult 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpfreequeryconnectiongroupresult
     */
    static WinHttpFreeQueryConnectionGroupResult(pResult) {
        DllCall("WINHTTP.dll\WinHttpFreeQueryConnectionGroupResult", "ptr", pResult)
    }

    /**
     * Finds the URL for the Proxy Auto-Configuration (PAC) file.
     * @param {Integer} dwAutoDetectFlags A data type that specifies what protocols to use to locate the PAC file. If both the DHCP and DNS auto detect flags are set, DHCP is used first; if no PAC URL is discovered using DHCP, then DNS is used.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTO_DETECT_TYPE_DHCP"></a><a id="winhttp_auto_detect_type_dhcp"></a><dl>
     * <dt><b>WINHTTP_AUTO_DETECT_TYPE_DHCP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use DHCP to locate the proxy auto-configuration file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTO_DETECT_TYPE_DNS_A"></a><a id="winhttp_auto_detect_type_dns_a"></a><dl>
     * <dt><b>WINHTTP_AUTO_DETECT_TYPE_DNS_A</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use DNS to attempt to locate the proxy auto-configuration file at a well-known location on the domain of the local computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PWSTR>} ppwstrAutoConfigUrl A data type that returns a pointer to a null-terminated Unicode string that contains the configuration URL that receives the proxy data. You must free the string pointed to by <i>ppwszAutoConfigUrl</i> using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_AUTODETECTION_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if WinHTTP was unable to discover the URL of the Proxy Auto-Configuration (PAC) file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpdetectautoproxyconfigurl
     * @since windows5.1.2600
     */
    static WinHttpDetectAutoProxyConfigUrl(dwAutoDetectFlags, ppwstrAutoConfigUrl) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpDetectAutoProxyConfigUrl", "uint", dwAutoDetectFlags, "ptr", ppwstrAutoConfigUrl, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the proxy data for the specified URL.
     * @param {Pointer<Void>} hSession The WinHTTP session handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a> function.
     * @param {PWSTR} lpcwszUrl A pointer to a null-terminated Unicode string that contains the URL of the HTTP request that the application is preparing to send.
     * @param {Pointer<WINHTTP_AUTOPROXY_OPTIONS>} pAutoProxyOptions A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_autoproxy_options">WINHTTP_AUTOPROXY_OPTIONS</a> structure that specifies the auto-proxy options to use.
     * @param {Pointer<WINHTTP_PROXY_INFO>} pProxyInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_info">WINHTTP_PROXY_INFO</a> structure that receives the proxy setting. This structure is then applied to the request handle using the WINHTTP_OPTION_PROXY option. Free the <b>lpszProxy</b> and <b>lpszProxyBypass</b> strings contained in this structure (if they are non-NULL) using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalfree">GlobalFree</a> function.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error data, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     *   Possible error codes include the folllowing.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_AUTO_PROXY_SERVICE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned by <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurl">WinHttpGetProxyForUrl</a> when a proxy for the specified URL cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_BAD_AUTO_PROXY_SCRIPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred executing the script code in the Proxy Auto-Configuration (PAC) file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_LOGIN_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The login attempt failed.  When this error is encountered, close the request handle with 
     * <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a>.  A new request handle must be created before retrying the function that originally produced this error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_UNABLE_TO_DOWNLOAD_SCRIPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PAC file could not be downloaded. For example, the server referenced by the PAC URL may not have been reachable, or  the server returned a 404 NOT FOUND response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL of the PAC file specified a scheme other than "http:" or "https:".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpgetproxyforurl
     * @since windows5.1.2600
     */
    static WinHttpGetProxyForUrl(hSession, lpcwszUrl, pAutoProxyOptions, pProxyInfo) {
        lpcwszUrl := lpcwszUrl is String ? StrPtr(lpcwszUrl) : lpcwszUrl

        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpGetProxyForUrl", "ptr", hSession, "ptr", lpcwszUrl, "ptr", pAutoProxyOptions, "ptr", pProxyInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a handle for use by WinHttpGetProxyForUrlEx.
     * @param {Pointer<Void>} hSession Valid <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> WinHTTP session handle returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>. The session handle must be opened using <b>WINHTTP_FLAG_ASYNC</b>.
     * @param {Pointer<Pointer<Void>>} phResolver A pointer to a new handle for use by <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.  When finished or cancelling an outstanding operation, close this handle with <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a>.
     * @returns {Integer} A status code indicating the result of the operation.
     * 
     * <table>
     * <tr>
     * <th>The following codes may be returned.</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hSession</i> is NULL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hSession</i> is not the result of a call to <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a> or <i>hSession</i> is not marked as asynchronous using <b>WINHTTP_FLAG_ASYNC</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpcreateproxyresolver
     * @since windows8.0
     */
    static WinHttpCreateProxyResolver(hSession, phResolver) {
        result := DllCall("WINHTTP.dll\WinHttpCreateProxyResolver", "ptr", hSession, "ptr*", phResolver, "uint")
        return result
    }

    /**
     * Retrieves the proxy data for the specified URL.
     * @param {Pointer<Void>} hResolver The WinHTTP resolver handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpcreateproxyresolver">WinHttpCreateProxyResolver</a> function.
     * @param {PWSTR} pcwszUrl A pointer to a null-terminated Unicode string that contains a URL for which proxy information will be determined.
     * @param {Pointer<WINHTTP_AUTOPROXY_OPTIONS>} pAutoProxyOptions A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_autoproxy_options">WINHTTP_AUTOPROXY_OPTIONS</a> structure that specifies the auto-proxy options to use.
     * @param {Pointer} pContext Context data that will be passed to the completion callback function.
     * @returns {Integer} A status code indicating the result of the operation.
     * 
     * <table>
     * <tr>
     * <th>The following codes may be returned.</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is continuing asynchronously.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_AUTO_PROXY_SERVICE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned by <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a> when a proxy for the specified URL cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_BAD_AUTO_PROXY_SCRIPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred executing the script code in the Proxy Auto-Configuration (PAC) file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled, usually because the handle on which the request was operating was closed before the operation completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_UNABLE_TO_DOWNLOAD_SCRIPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PAC file could not be downloaded. For example, the server referenced by the PAC URL may not have been reachable, or  the server returned a 404 NOT FOUND response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_UNRECOGNIZED_SCHEME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL of the PAC file specified a scheme other than "http:" or "https:".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpgetproxyforurlex
     * @since windows8.0
     */
    static WinHttpGetProxyForUrlEx(hResolver, pcwszUrl, pAutoProxyOptions, pContext) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

        result := DllCall("WINHTTP.dll\WinHttpGetProxyForUrlEx", "ptr", hResolver, "ptr", pcwszUrl, "ptr", pAutoProxyOptions, "ptr", pContext, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hResolver 
     * @param {PWSTR} pcwszUrl 
     * @param {Pointer<WINHTTP_AUTOPROXY_OPTIONS>} pAutoProxyOptions 
     * @param {Integer} cbInterfaceSelectionContext 
     * @param {Pointer} pInterfaceSelectionContext 
     * @param {Pointer} pContext 
     * @returns {Integer} 
     */
    static WinHttpGetProxyForUrlEx2(hResolver, pcwszUrl, pAutoProxyOptions, cbInterfaceSelectionContext, pInterfaceSelectionContext, pContext) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

        result := DllCall("WINHTTP.dll\WinHttpGetProxyForUrlEx2", "ptr", hResolver, "ptr", pcwszUrl, "ptr", pAutoProxyOptions, "uint", cbInterfaceSelectionContext, "ptr", pInterfaceSelectionContext, "ptr", pContext, "uint")
        return result
    }

    /**
     * The WinHttpGetProxyResult function retrieves the results of a call to WinHttpGetProxyForUrlEx.
     * @param {Pointer<Void>} hResolver The resolver handle used to issue a previously completed call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.
     * @param {Pointer<WINHTTP_PROXY_RESULT>} pProxyResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_proxy_result">WINHTTP_PROXY_RESULT</a> structure that contains the results of a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.  The results must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpfreeproxyresult">WinHttpFreeProxyResult</a>.
     * @returns {Integer} A status code indicating the result of the operation.
     * 
     * <table>
     * <tr>
     * <th>The following codes may be returned.</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of handle supplied is incorrect for this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resolver handle has not successfully completed a call to <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpgetproxyresult
     * @since windows8.0
     */
    static WinHttpGetProxyResult(hResolver, pProxyResult) {
        result := DllCall("WINHTTP.dll\WinHttpGetProxyResult", "ptr", hResolver, "ptr", pProxyResult, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hResolver 
     * @param {Pointer<WINHTTP_PROXY_RESULT_EX>} pProxyResultEx 
     * @returns {Integer} 
     */
    static WinHttpGetProxyResultEx(hResolver, pProxyResultEx) {
        result := DllCall("WINHTTP.dll\WinHttpGetProxyResultEx", "ptr", hResolver, "ptr", pProxyResultEx, "uint")
        return result
    }

    /**
     * The WinHttpFreeProxyResult function frees the data retrieved from a previous call to WinHttpGetProxyResult.
     * @param {Pointer<WINHTTP_PROXY_RESULT>} pProxyResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_proxy_result">WINHTTP_PROXY_RESULT</a> structure retrieved from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyresult">WinHttpGetProxyResult</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpfreeproxyresult
     * @since windows8.0
     */
    static WinHttpFreeProxyResult(pProxyResult) {
        DllCall("WINHTTP.dll\WinHttpFreeProxyResult", "ptr", pProxyResult)
    }

    /**
     * 
     * @param {Pointer<WINHTTP_PROXY_RESULT_EX>} pProxyResultEx 
     * @returns {String} Nothing - always returns an empty string
     */
    static WinHttpFreeProxyResultEx(pProxyResultEx) {
        DllCall("WINHTTP.dll\WinHttpFreeProxyResultEx", "ptr", pProxyResultEx)
    }

    /**
     * Resets the auto-proxy.
     * @param {Pointer<Void>} hSession A valid 
     * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/hinternet-handles-in-winhttp">HINTERNET</a> WinHTTP session handle returned by a previous call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a> function.
     * @param {Integer} dwFlags A set of flags that affects the reset operation.
     * 
     * 
     * The following flags are supported as defined in the <i>Winhttp.h</i> header file.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_RESET_STATE"></a><a id="winhttp_reset_state"></a><dl>
     * <dt><b>WINHTTP_RESET_STATE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a flush and retry of non-persistent proxy information on the current network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_RESET_SWPAD_CURRENT_NETWORK"></a><a id="winhttp_reset_swpad_current_network"></a><dl>
     * <dt><b>WINHTTP_RESET_SWPAD_CURRENT_NETWORK</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Flush the PAD information for the current network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_RESET_SWPAD_ALL"></a><a id="winhttp_reset_swpad_all"></a><dl>
     * <dt><b>WINHTTP_RESET_SWPAD_ALL</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Flush the PAD information for all networks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_RESET_SCRIPT_CACHE"></a><a id="winhttp_reset_script_cache"></a><dl>
     * <dt><b>WINHTTP_RESET_SCRIPT_CACHE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Flush the persistent HTTP cache of proxy scripts.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_RESET_ALL"></a><a id="winhttp_reset_all"></a><dl>
     * <dt><b>WINHTTP_RESET_ALL</b></dt>
     * <dt>0x0000FFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a flush and retry of all proxy information on the current network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_RESET_NOTIFY_NETWORK_CHANGED"></a><a id="winhttp_reset_notify_network_changed"></a><dl>
     * <dt><b>WINHTTP_RESET_NOTIFY_NETWORK_CHANGED</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Flush the current proxy information and notify that the network changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_RESET_OUT_OF_PROC"></a><a id="winhttp_reset_out_of_proc"></a><dl>
     * <dt><b>WINHTTP_RESET_OUT_OF_PROC</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Act on the autoproxy service instead of the current process.  <div class="alert"><b>Note</b>  This flag is required.</div>
     * <div> </div>
     * 
     * 
     * Applications that use the  <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurl">WinHttpGetProxyForUrl</a> function to purge in-process caching should close the <i>hInternet</i> handle and open a new handle for future calls.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} A code indicating the success or failure of the operation.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hSession</i> parameter is not a valid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INCORRECT_HANDLE TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hSession</i> parameter is not the product of a call to <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpopen">WinHttpOpen</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpresetautoproxy
     * @since windows8.0
     */
    static WinHttpResetAutoProxy(hSession, dwFlags) {
        result := DllCall("WINHTTP.dll\WinHttpResetAutoProxy", "ptr", hSession, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Retrieves the Internet Explorer proxy configuration for the current user.
     * @param {Pointer<WINHTTP_CURRENT_USER_IE_PROXY_CONFIG>} pProxyConfig A pointer, on input, to a <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_current_user_ie_proxy_config">WINHTTP_CURRENT_USER_IE_PROXY_CONFIG</a> structure. On output, the structure contains the Internet Explorer proxy settings for the current active network connection (for example, LAN, dial-up, or VPN connection).
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. For extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Among the error codes returned are the following.
     * 
     * <table>
     * <tr>
     * <th>Error Code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Internet Explorer proxy settings can be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_INTERNAL_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory was available to complete the requested operation. (Windows error code)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpgetieproxyconfigforcurrentuser
     * @since windows5.1.2600
     */
    static WinHttpGetIEProxyConfigForCurrentUser(pProxyConfig) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpGetIEProxyConfigForCurrentUser", "ptr", pProxyConfig, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hSession 
     * @param {BOOL} fForceUpdate 
     * @param {Pointer<WINHTTP_PROXY_SETTINGS>} pWinHttpProxySettings 
     * @returns {Integer} 
     */
    static WinHttpWriteProxySettings(hSession, fForceUpdate, pWinHttpProxySettings) {
        result := DllCall("WINHTTP.dll\WinHttpWriteProxySettings", "ptr", hSession, "int", fForceUpdate, "ptr", pWinHttpProxySettings, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hSession 
     * @param {PWSTR} pcwszConnectionName 
     * @param {BOOL} fFallBackToDefaultSettings 
     * @param {BOOL} fSetAutoDiscoverForDefaultSettings 
     * @param {Pointer<Integer>} pdwSettingsVersion 
     * @param {Pointer<BOOL>} pfDefaultSettingsAreReturned 
     * @param {Pointer<WINHTTP_PROXY_SETTINGS>} pWinHttpProxySettings 
     * @returns {Integer} 
     */
    static WinHttpReadProxySettings(hSession, pcwszConnectionName, fFallBackToDefaultSettings, fSetAutoDiscoverForDefaultSettings, pdwSettingsVersion, pfDefaultSettingsAreReturned, pWinHttpProxySettings) {
        pcwszConnectionName := pcwszConnectionName is String ? StrPtr(pcwszConnectionName) : pcwszConnectionName

        result := DllCall("WINHTTP.dll\WinHttpReadProxySettings", "ptr", hSession, "ptr", pcwszConnectionName, "int", fFallBackToDefaultSettings, "int", fSetAutoDiscoverForDefaultSettings, "uint*", pdwSettingsVersion, "ptr", pfDefaultSettingsAreReturned, "ptr", pWinHttpProxySettings, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<WINHTTP_PROXY_SETTINGS>} pWinHttpProxySettings 
     * @returns {String} Nothing - always returns an empty string
     */
    static WinHttpFreeProxySettings(pWinHttpProxySettings) {
        DllCall("WINHTTP.dll\WinHttpFreeProxySettings", "ptr", pWinHttpProxySettings)
    }

    /**
     * 
     * @param {Pointer<Void>} hSession 
     * @param {Pointer<Integer>} pdwProxySettingsVersion 
     * @returns {Integer} 
     */
    static WinHttpGetProxySettingsVersion(hSession, pdwProxySettingsVersion) {
        result := DllCall("WINHTTP.dll\WinHttpGetProxySettingsVersion", "ptr", hSession, "uint*", pdwProxySettingsVersion, "uint")
        return result
    }

    /**
     * 
     * @param {BOOL} fProxySettingsPerUser 
     * @returns {Integer} 
     */
    static WinHttpSetProxySettingsPerUser(fProxySettingsPerUser) {
        result := DllCall("WINHTTP.dll\WinHttpSetProxySettingsPerUser", "int", fProxySettingsPerUser, "uint")
        return result
    }

    /**
     * Completes a WebSocket handshake started by WinHttpSendRequest.
     * @param {Pointer<Void>} hRequest Type: <b>HINTERNET</b>
     * 
     * HTTP request handle used to send a WebSocket handshake.
     * @param {Pointer} pContext Type: <b>DWORD_PTR</b>
     * 
     * Context to be associated with the new handle.
     * @returns {Pointer<Void>} Type: <b>HINTERNET</b>
     * 
     * A new WebSocket handle. If NULL, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to determine the cause of failure.
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpwebsocketcompleteupgrade
     * @since windows8.0
     */
    static WinHttpWebSocketCompleteUpgrade(hRequest, pContext) {
        A_LastError := 0

        result := DllCall("WINHTTP.dll\WinHttpWebSocketCompleteUpgrade", "ptr", hRequest, "ptr", pContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends data over a WebSocket connection.
     * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
     * 
     * Handle to a websocket.
     * @param {Integer} eBufferType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_buffer_type">WINHTTP_WEB_SOCKET_BUFFER_TYPE</a></b>
     * 
     * Type of buffer.<div class="alert"><b>Note</b>  Do not specify <b>WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE</b>. Use <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketshutdown">WinHttpWebSocketShutdown</a> to close the connection.</div>
     * <div> </div>
     * @param {Pointer<Void>} pvBuffer Type: <b>PVOID</b>
     * 
     * Pointer to a buffer containing the data to send. Can be <b>NULL</b> only if <i>dwBufferLength</i> is 0.
     * @param {Integer} dwBufferLength Type: <b>DWORD</b>
     * 
     * Length of <i>pvBuffer</i>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <b>NO_ERROR</b> on success. Otherwise an error code.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A close or send is pending, or the send channel has already been closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpwebsocketsend
     * @since windows8.0
     */
    static WinHttpWebSocketSend(hWebSocket, eBufferType, pvBuffer, dwBufferLength) {
        result := DllCall("WINHTTP.dll\WinHttpWebSocketSend", "ptr", hWebSocket, "int", eBufferType, "ptr", pvBuffer, "uint", dwBufferLength, "uint")
        return result
    }

    /**
     * Receives data from a WebSocket connection.
     * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
     * 
     * Handle to a WebSocket.
     * @param {Pointer} pvBuffer Type: <b>PVOID</b>
     * 
     * Pointer to a buffer to receive the data.
     * @param {Integer} dwBufferLength Type: <b>DWORD</b>
     * 
     * Length of <i>pvBuffer</i>, in bytes.
     * @param {Pointer<Integer>} pdwBytesRead Type: <b>DWORD*</b>
     * 
     * Pointer to a <b>DWORD</b> that receives the number of bytes read from the connection at the end of the operation. This is set only if <b>WinHttpWebSocketReceive</b> returns <b>NO_ERROR</b> and the handle was opened in synchronous mode.
     * @param {Pointer<Integer>} peBufferType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_buffer_type">WINHTTP_WEB_SOCKET_BUFFER_TYPE</a>*</b>
     * 
     * The type of a returned buffer. This is only set if <b>WinHttpWebSocketReceive</b> returns <b>NO_ERROR</b> and the handle was opened in synchronous mode.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <b>NO_ERROR</b> on success. Otherwise an error code.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A close or send is pending, or the receive channel has already been closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVER_RESPONSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid data was received from the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WINHTTP_OPERATION_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was cancelled because <a href="/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> was called to close the connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpwebsocketreceive
     * @since windows8.0
     */
    static WinHttpWebSocketReceive(hWebSocket, pvBuffer, dwBufferLength, pdwBytesRead, peBufferType) {
        result := DllCall("WINHTTP.dll\WinHttpWebSocketReceive", "ptr", hWebSocket, "ptr", pvBuffer, "uint", dwBufferLength, "uint*", pdwBytesRead, "int*", peBufferType, "uint")
        return result
    }

    /**
     * Sends a close frame to a WebSocket server to close the send channel, but leaves the receive channel open.
     * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
     * 
     * Handle to a WebSocket.<div class="alert"><b>Note</b>  <b>WinHttpWebSocketShutdown</b> does not close this handle. To close the handle, call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a> on <i>hWebSocket</i> once it is no longer needed.</div>
     * <div> </div>
     * @param {Integer} usStatus Type: <b>USHORT</b>
     * 
     * A close status code. See <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_close_status">WINHTTP_WEB_SOCKET_CLOSE_STATUS</a> for possible values.
     * @param {Pointer} pvReason Type: <b>PVOID</b>
     * 
     * A detailed reason for the close.
     * @param {Integer} dwReasonLength Type: <b>DWORD</b>
     * 
     * The length of <i>pvReason</i>, in bytes.
     * 
     * If <i>pvReason</i> is NULL, this must be 0. This value must be within the range of 0 to 123.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * With the following exception, all error codes indicate that the underlying TCP connection has been aborted.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation will complete asynchronously.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpwebsocketshutdown
     * @since windows8.0
     */
    static WinHttpWebSocketShutdown(hWebSocket, usStatus, pvReason, dwReasonLength) {
        result := DllCall("WINHTTP.dll\WinHttpWebSocketShutdown", "ptr", hWebSocket, "ushort", usStatus, "ptr", pvReason, "uint", dwReasonLength, "uint")
        return result
    }

    /**
     * Closes a WebSocket connection.
     * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
     * 
     * Handle to a WebSocket.<div class="alert"><b>Note</b>  <b>WinHttpWebSocketClose</b> does not close this handle. To close the handle, call <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpclosehandle">WinHttpCloseHandle</a> on <i>hWebSocket</i> once it is no longer needed.</div>
     * <div> </div>
     * @param {Integer} usStatus Type: <b>USHORT</b>
     * 
     * A close status code. See <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_close_status">WINHTTP_WEB_SOCKET_CLOSE_STATUS</a> for possible values.
     * @param {Pointer} pvReason Type: <b>PVOID</b>
     * 
     * A detailed reason for the close.
     * @param {Integer} dwReasonLength Type: <b>DWORD</b>
     * 
     * The length of <i>pvReason</i>, in bytes.
     * 
     * If <i>pvReason</i> is NULL, this must be 0. This value must be within the range of 0 to 123.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * With the following exception, all error codes indicate that the underlying TCP connection has been aborted.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A close or send is pending.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVER_RESPONSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid data was received from the server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpwebsocketclose
     * @since windows8.0
     */
    static WinHttpWebSocketClose(hWebSocket, usStatus, pvReason, dwReasonLength) {
        result := DllCall("WINHTTP.dll\WinHttpWebSocketClose", "ptr", hWebSocket, "ushort", usStatus, "ptr", pvReason, "uint", dwReasonLength, "uint")
        return result
    }

    /**
     * Retrieves the close status sent by a server.
     * @param {Pointer<Void>} hWebSocket Type: <b>HINTERNET</b>
     * 
     * Handle to a WebSocket
     * @param {Pointer<Integer>} pusStatus Type: <b>USHORT*</b>
     * 
     * A pointer to a close status code that will be filled upon return. See <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_close_status">WINHTTP_WEB_SOCKET_CLOSE_STATUS</a> for possible values.
     * @param {Pointer} pvReason Type: <b>PVOID</b>
     * 
     * A pointer to a buffer that will receive a close reason on return.
     * @param {Integer} dwReasonLength Type: <b>DWORD</b>
     * 
     * The length of the <i>pvReason</i> buffer, in bytes.
     * @param {Pointer<Integer>} pdwReasonLengthConsumed Type: <b>DWORD*</b>
     * 
     * The number of bytes consumed. If <i>pvReason</i> is <b>NULL</b> and <i>dwReasonLength</i> is 0, <i>pdwReasonLengthConsumed</i> will contain the size of the buffer that needs to be allocated by the calling application.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * <b>NO_ERROR</b> on success. Otherwise an error code.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough space in <i>pvReason</i> to write the whole close reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No close frame has been received yet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winhttp/nf-winhttp-winhttpwebsocketqueryclosestatus
     * @since windows8.0
     */
    static WinHttpWebSocketQueryCloseStatus(hWebSocket, pusStatus, pvReason, dwReasonLength, pdwReasonLengthConsumed) {
        result := DllCall("WINHTTP.dll\WinHttpWebSocketQueryCloseStatus", "ptr", hWebSocket, "ushort*", pusStatus, "ptr", pvReason, "uint", dwReasonLength, "uint*", pdwReasonLengthConsumed, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hRequest 
     * @param {Pointer} dwContext 
     * @returns {Pointer<Void>} 
     */
    static WinHttpProtocolCompleteUpgrade(hRequest, dwContext) {
        result := DllCall("WINHTTP.dll\WinHttpProtocolCompleteUpgrade", "ptr", hRequest, "ptr", dwContext, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ProtocolHandle 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} pvBuffer 
     * @param {Integer} dwBufferLength 
     * @returns {Integer} 
     */
    static WinHttpProtocolSend(ProtocolHandle, Flags, pvBuffer, dwBufferLength) {
        result := DllCall("WINHTTP.dll\WinHttpProtocolSend", "ptr", ProtocolHandle, "uint", Flags, "ptr", pvBuffer, "uint", dwBufferLength, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ProtocolHandle 
     * @param {Integer} Flags 
     * @param {Pointer} pvBuffer 
     * @param {Integer} dwBufferLength 
     * @param {Pointer<Integer>} pdwBytesRead 
     * @returns {Integer} 
     */
    static WinHttpProtocolReceive(ProtocolHandle, Flags, pvBuffer, dwBufferLength, pdwBytesRead) {
        result := DllCall("WINHTTP.dll\WinHttpProtocolReceive", "ptr", ProtocolHandle, "uint", Flags, "ptr", pvBuffer, "uint", dwBufferLength, "uint*", pdwBytesRead, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ullFlags 
     * @param {Pointer<WINHTTP_PROXY_CHANGE_CALLBACK>} pfnCallback 
     * @param {Pointer<Void>} pvContext 
     * @param {Pointer<Pointer<Void>>} hRegistration 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpregisterproxychangenotification
     */
    static WinHttpRegisterProxyChangeNotification(ullFlags, pfnCallback, pvContext, hRegistration) {
        result := DllCall("WINHTTP.dll\WinHttpRegisterProxyChangeNotification", "uint", ullFlags, "ptr", pfnCallback, "ptr", pvContext, "ptr*", hRegistration, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hRegistration 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpunregisterproxychangenotification
     */
    static WinHttpUnregisterProxyChangeNotification(hRegistration) {
        result := DllCall("WINHTTP.dll\WinHttpUnregisterProxyChangeNotification", "ptr", hRegistration, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hResolver 
     * @param {Integer} ProxySettingsType 
     * @param {Pointer<WINHTTP_PROXY_SETTINGS_PARAM>} pProxySettingsParam 
     * @param {Pointer} pContext 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpgetproxysettingsex
     */
    static WinHttpGetProxySettingsEx(hResolver, ProxySettingsType, pProxySettingsParam, pContext) {
        result := DllCall("WINHTTP.dll\WinHttpGetProxySettingsEx", "ptr", hResolver, "int", ProxySettingsType, "ptr", pProxySettingsParam, "ptr", pContext, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hResolver 
     * @param {Pointer<Void>} pProxySettingsEx 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpgetproxysettingsresultex
     */
    static WinHttpGetProxySettingsResultEx(hResolver, pProxySettingsEx) {
        result := DllCall("WINHTTP.dll\WinHttpGetProxySettingsResultEx", "ptr", hResolver, "ptr", pProxySettingsEx, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ProxySettingsType 
     * @param {Pointer<Void>} pProxySettingsEx 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winhttp/nf-winhttp-winhttpfreeproxysettingsex
     */
    static WinHttpFreeProxySettingsEx(ProxySettingsType, pProxySettingsEx) {
        result := DllCall("WINHTTP.dll\WinHttpFreeProxySettingsEx", "int", ProxySettingsType, "ptr", pProxySettingsEx, "uint")
        return result
    }

;@endregion Methods
}
