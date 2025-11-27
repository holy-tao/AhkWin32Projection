#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class WinInet {

;@region Constants

    /**
     * @type {String}
     */
    static DIALPROP_USERNAME => "UserName"

    /**
     * @type {String}
     */
    static DIALPROP_PASSWORD => "Password"

    /**
     * @type {String}
     */
    static DIALPROP_DOMAIN => "Domain"

    /**
     * @type {String}
     */
    static DIALPROP_SAVEPASSWORD => "SavePassword"

    /**
     * @type {String}
     */
    static DIALPROP_REDIALCOUNT => "RedialCount"

    /**
     * @type {String}
     */
    static DIALPROP_REDIALINTERVAL => "RedialInterval"

    /**
     * @type {String}
     */
    static DIALPROP_PHONENUMBER => "PhoneNumber"

    /**
     * @type {String}
     */
    static DIALPROP_LASTERROR => "LastError"

    /**
     * @type {String}
     */
    static DIALPROP_RESOLVEDPHONE => "ResolvedPhone"

    /**
     * @type {Integer (UInt32)}
     */
    static DIALENG_OperationComplete => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DIALENG_RedialAttempt => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static DIALENG_RedialWait => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_INVALID_PORT_NUMBER => 0

    /**
     * @type {Integer (UInt16)}
     */
    static INTERNET_DEFAULT_FTP_PORT => 21

    /**
     * @type {Integer (UInt16)}
     */
    static INTERNET_DEFAULT_GOPHER_PORT => 70

    /**
     * @type {Integer (UInt16)}
     */
    static INTERNET_DEFAULT_SOCKS_PORT => 1080

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_MAX_HOST_NAME_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_MAX_USER_NAME_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_MAX_PASSWORD_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_MAX_PORT_NUMBER_LENGTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_MAX_PORT_NUMBER_VALUE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_KEEP_ALIVE_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_KEEP_ALIVE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_KEEP_ALIVE_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_REQFLAG_FROM_CACHE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_REQFLAG_ASYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_REQFLAG_VIA_PROXY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_REQFLAG_NO_HEADERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_REQFLAG_PASSIVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_REQFLAG_CACHE_WRITE_DISABLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_REQFLAG_NET_TIMEOUT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_IDN_DIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_IDN_PROXY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_RELOAD => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_RAW_DATA => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_EXISTING_CONNECT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_ASYNC => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_PASSIVE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_NO_CACHE_WRITE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_DONT_CACHE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_MAKE_PERSISTENT => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_FROM_CACHE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_OFFLINE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_SECURE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_KEEP_CONNECTION => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_NO_AUTO_REDIRECT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_READ_PREFETCH => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_NO_COOKIES => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_NO_AUTH => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_CACHE_IF_NET_FAIL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_IGNORE_CERT_DATE_INVALID => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_IGNORE_CERT_CN_INVALID => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_RESYNCHRONIZE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_HYPERLINK => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_NO_UI => 512

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_PRAGMA_NOCACHE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_CACHE_ASYNC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_FORMS_SUBMIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_FWD_BACK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_NEED_FILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_MUST_CACHE_REQUEST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_ERROR_MASK_INSERT_CDROM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_ERROR_MASK_COMBINED_SEC_CERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_ERROR_MASK_NEED_MSN_SSPI_PKG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_ERROR_MASK_LOGIN_FAILURE_DISPLAY_ENTITY_BODY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WININET_API_FLAG_ASYNC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WININET_API_FLAG_SYNC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WININET_API_FLAG_USE_CONTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_NO_CALLBACK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IDSI_FLAG_KEEP_ALIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IDSI_FLAG_SECURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IDSI_FLAG_PROXY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IDSI_FLAG_TUNNEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_FLAGS_UI => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PROXY_TYPE_DIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROXY_TYPE_PROXY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROXY_TYPE_AUTO_PROXY_URL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROXY_TYPE_AUTO_DETECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_PROXY_FLAG_USER_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_PROXY_FLAG_ALWAYS_DETECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_PROXY_FLAG_DETECTION_RUN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_PROXY_FLAG_MIGRATED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_PROXY_FLAG_DONT_CACHE_PROXY_RESULT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_PROXY_FLAG_CACHE_INIT_RUN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static AUTO_PROXY_FLAG_DETECTION_SUSPECT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ISO_FORCE_DISCONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_RFC1123_FORMAT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_RFC1123_BUFSIZE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static ICU_USERNAME => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_SERVICE_FTP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_SERVICE_GOPHER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_SERVICE_HTTP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IRF_ASYNC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRF_SYNC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IRF_USE_CONTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IRF_NO_WAIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ISO_GLOBAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ISO_REGISTRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CALLBACK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONNECT_TIMEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONNECT_RETRIES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONNECT_BACKOFF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SEND_TIMEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONTROL_SEND_TIMEOUT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_RECEIVE_TIMEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONTROL_RECEIVE_TIMEOUT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DATA_SEND_TIMEOUT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DATA_RECEIVE_TIMEOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_HANDLE_TYPE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_LISTEN_TIMEOUT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_READ_BUFFER_SIZE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_WRITE_BUFFER_SIZE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ASYNC_ID => 15

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ASYNC_PRIORITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PARENT_HANDLE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_KEEP_CONNECTION => 22

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_REQUEST_FLAGS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_EXTENDED_ERROR => 24

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_OFFLINE_MODE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CACHE_STREAM_HANDLE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_USERNAME => 28

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PASSWORD => 29

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ASYNC => 30

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SECURITY_FLAGS => 31

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SECURITY_CERTIFICATE_STRUCT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DATAFILE_NAME => 33

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_URL => 34

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SECURITY_CERTIFICATE => 35

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SECURITY_KEY_BITNESS => 36

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_REFRESH => 37

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PROXY => 38

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SETTINGS_CHANGED => 39

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_VERSION => 40

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_USER_AGENT => 41

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_END_BROWSER_SESSION => 42

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PROXY_USERNAME => 43

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PROXY_PASSWORD => 44

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONTEXT_VALUE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONNECT_LIMIT => 46

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SECURITY_SELECT_CLIENT_CERT => 47

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_POLICY => 48

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DISCONNECTED_TIMEOUT => 49

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONNECTED_STATE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_IDLE_STATE => 51

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_OFFLINE_SEMANTICS => 52

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SECONDARY_CACHE_KEY => 53

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CALLBACK_FILTER => 54

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONNECT_TIME => 55

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SEND_THROUGHPUT => 56

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_RECEIVE_THROUGHPUT => 57

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_REQUEST_PRIORITY => 58

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_HTTP_VERSION => 59

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_RESET_URLCACHE_SESSION => 60

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ERROR_MASK => 62

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_FROM_CACHE_TIMEOUT => 63

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_BYPASS_EDITED_ENTRY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_HTTP_DECODING => 65

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DIAGNOSTIC_SOCKET_INFO => 67

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CODEPAGE => 68

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CACHE_TIMESTAMPS => 69

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DISABLE_AUTODIAL => 70

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_MAX_CONNS_PER_SERVER => 73

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_MAX_CONNS_PER_1_0_SERVER => 74

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PER_CONNECTION_OPTION => 75

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DIGEST_AUTH_UNLOAD => 76

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_IGNORE_OFFLINE => 77

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_IDENTITY => 78

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_REMOVE_IDENTITY => 79

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ALTER_IDENTITY => 80

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SUPPRESS_BEHAVIOR => 81

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_AUTODIAL_MODE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_AUTODIAL_CONNECTION => 83

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CLIENT_CERT_CONTEXT => 84

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_AUTH_FLAGS => 85

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_COOKIES_3RD_PARTY => 86

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DISABLE_PASSPORT_AUTH => 87

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SEND_UTF8_SERVERNAME_TO_PROXY => 88

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_EXEMPT_CONNECTION_LIMIT => 89

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENABLE_PASSPORT_AUTH => 90

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_HIBERNATE_INACTIVE_WORKER_THREADS => 91

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ACTIVATE_WORKER_THREADS => 92

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_RESTORE_WORKER_THREAD_DEFAULTS => 93

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SOCKET_SEND_BUFFER_LENGTH => 94

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PROXY_SETTINGS_CHANGED => 95

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DATAFILE_EXT => 96

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CODEPAGE_PATH => 100

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CODEPAGE_EXTRA => 101

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_IDN => 102

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_MAX_CONNS_PER_PROXY => 103

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SUPPRESS_SERVER_AUTH => 104

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SERVER_CERT_CHAIN_CONTEXT => 105

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENABLE_REDIRECT_CACHE_READ => 122

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_COMPRESSED_CONTENT_LENGTH => 147

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENABLE_HTTP_PROTOCOL => 148

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_HTTP_PROTOCOL_USED => 149

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENCODE_EXTRA => 155

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_HSTS => 157

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENTERPRISE_CONTEXT => 159

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONNECTION_FILTER => 162

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_REFERER_TOKEN_BINDING_HOSTNAME => 163

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_TOKEN_BINDING_PUBLIC_KEY => 181

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_COOKIES_SAME_SITE_LEVEL => 187

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_REQUEST_ANNOTATION => 193

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FIRST_OPTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_LAST_OPTION => 193

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PRIORITY_FOREGROUND => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_COOKIES_SAME_SITE_LEVEL_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_COOKIES_SAME_SITE_LEVEL_SAME_SITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_COOKIES_SAME_SITE_LEVEL_CROSS_SITE_LAX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_COOKIES_SAME_SITE_LEVEL_CROSS_SITE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_COOKIES_SAME_SITE_LEVEL_MAX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_PROTOCOL_FLAG_HTTP2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_PROTOCOL_MASK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_REQUEST_ANNOTATION_MAX_LENGTH => 64000

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_INTERNET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_CONNECT_FTP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_CONNECT_GOPHER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_CONNECT_HTTP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_FTP_FIND => 5

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_FTP_FIND_HTML => 6

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_FTP_FILE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_FTP_FILE_HTML => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_GOPHER_FIND => 9

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_GOPHER_FIND_HTML => 10

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_GOPHER_FILE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_GOPHER_FILE_HTML => 12

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_HTTP_REQUEST => 13

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_HANDLE_TYPE_FILE_REQUEST => 14

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_FLAG_DISABLE_NEGOTIATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_FLAG_ENABLE_NEGOTIATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_FLAG_DISABLE_BASIC_CLEARCHANNEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_FLAG_DISABLE_SERVER_AUTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_UNKNOWNBIT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_FORTEZZA => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_NORMALBITNESS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_SSL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_SSL3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_PCT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_PCT4 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IETFSSL4 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_40BIT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_128BIT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_56BIT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IGNORE_REVOCATION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IGNORE_WRONG_USAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTPS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTP => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_IGNORE_WEAK_SIGNATURE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_FLAG_OPT_IN_WEAK_SIGNATURE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static AUTODIAL_MODE_NEVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTODIAL_MODE_ALWAYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTODIAL_MODE_NO_NETWORK_PRESENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_RESOLVING_NAME => 10

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_NAME_RESOLVED => 11

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_CONNECTING_TO_SERVER => 20

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_CONNECTED_TO_SERVER => 21

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_SENDING_REQUEST => 30

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_REQUEST_SENT => 31

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_RECEIVING_RESPONSE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_RESPONSE_RECEIVED => 41

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_CTL_RESPONSE_RECEIVED => 42

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_PREFETCH => 43

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_CLOSING_CONNECTION => 50

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_CONNECTION_CLOSED => 51

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_HANDLE_CREATED => 60

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_HANDLE_CLOSING => 70

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_DETECTING_PROXY => 80

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_REQUEST_COMPLETE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_REDIRECT => 110

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_INTERMEDIATE_RESPONSE => 120

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_USER_INPUT_REQUIRED => 140

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_STATE_CHANGE => 200

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_COOKIE_SENT => 320

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_COOKIE_RECEIVED => 321

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_PRIVACY_IMPACTED => 324

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_P3P_HEADER => 325

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_P3P_POLICYREF => 326

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_COOKIE_HISTORY => 327

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_GOPHER_DISPLAY_TEXT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_GOPHER_SELECTOR_TEXT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_GOPHER_HOST_NAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_GOPHER_CATEGORY_NAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_GOPHER_ATTRIBUTE_NAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_GOPHER_ATTRIBUTE_LENGTH => 256

    /**
     * @type {String}
     */
    static GOPHER_INFO_CATEGORY => "+INFO"

    /**
     * @type {String}
     */
    static GOPHER_ADMIN_CATEGORY => "+ADMIN"

    /**
     * @type {String}
     */
    static GOPHER_VIEWS_CATEGORY => "+VIEWS"

    /**
     * @type {String}
     */
    static GOPHER_ABSTRACT_CATEGORY => "+ABSTRACT"

    /**
     * @type {String}
     */
    static GOPHER_VERONICA_CATEGORY => "+VERONICA"

    /**
     * @type {String}
     */
    static GOPHER_ADMIN_ATTRIBUTE => "Admin"

    /**
     * @type {String}
     */
    static GOPHER_MOD_DATE_ATTRIBUTE => "Mod-Date"

    /**
     * @type {String}
     */
    static GOPHER_TTL_ATTRIBUTE => "TTL"

    /**
     * @type {String}
     */
    static GOPHER_SCORE_ATTRIBUTE => "Score"

    /**
     * @type {String}
     */
    static GOPHER_RANGE_ATTRIBUTE => "Score-range"

    /**
     * @type {String}
     */
    static GOPHER_SITE_ATTRIBUTE => "Site"

    /**
     * @type {String}
     */
    static GOPHER_ORG_ATTRIBUTE => "Org"

    /**
     * @type {String}
     */
    static GOPHER_LOCATION_ATTRIBUTE => "Loc"

    /**
     * @type {String}
     */
    static GOPHER_GEOG_ATTRIBUTE => "Geog"

    /**
     * @type {String}
     */
    static GOPHER_TIMEZONE_ATTRIBUTE => "TZ"

    /**
     * @type {String}
     */
    static GOPHER_PROVIDER_ATTRIBUTE => "Provider"

    /**
     * @type {String}
     */
    static GOPHER_VERSION_ATTRIBUTE => "Version"

    /**
     * @type {String}
     */
    static GOPHER_ABSTRACT_ATTRIBUTE => "Abstract"

    /**
     * @type {String}
     */
    static GOPHER_VIEW_ATTRIBUTE => "View"

    /**
     * @type {String}
     */
    static GOPHER_TREEWALK_ATTRIBUTE => "treewalk"

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_BASE => 2882325504

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_CATEGORY_ID_ALL => 2882325505

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_CATEGORY_ID_INFO => 2882325506

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_CATEGORY_ID_ADMIN => 2882325507

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_CATEGORY_ID_VIEWS => 2882325508

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_CATEGORY_ID_ABSTRACT => 2882325509

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_CATEGORY_ID_VERONICA => 2882325510

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_CATEGORY_ID_ASK => 2882325511

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_CATEGORY_ID_UNKNOWN => 2882325512

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_ALL => 2882325513

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_ADMIN => 2882325514

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_MOD_DATE => 2882325515

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_TTL => 2882325516

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_SCORE => 2882325517

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_RANGE => 2882325518

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_SITE => 2882325519

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_ORG => 2882325520

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_LOCATION => 2882325521

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_GEOG => 2882325522

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_TIMEZONE => 2882325523

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_PROVIDER => 2882325524

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_VERSION => 2882325525

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_ABSTRACT => 2882325526

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_VIEW => 2882325527

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_TREEWALK => 2882325528

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_ATTRIBUTE_ID_UNKNOWN => 2882325529

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_MAJOR_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_MINOR_VERSION => 0

    /**
     * @type {String}
     */
    static HTTP_VERSIONA => "HTTP/1.0"

    /**
     * @type {String}
     */
    static HTTP_VERSIONW => "HTTP/1.0"

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_MIME_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_TRANSFER_ENCODING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_ID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_DESCRIPTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_LENGTH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_LANGUAGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ALLOW => 7

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PUBLIC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_DATE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_EXPIRES => 10

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_LAST_MODIFIED => 11

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_MESSAGE_ID => 12

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_URI => 13

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_DERIVED_FROM => 14

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_COST => 15

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_LINK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PRAGMA => 17

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_VERSION => 18

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_STATUS_CODE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_STATUS_TEXT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_RAW_HEADERS => 21

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_RAW_HEADERS_CRLF => 22

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONNECTION => 23

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ACCEPT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ACCEPT_CHARSET => 25

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ACCEPT_ENCODING => 26

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ACCEPT_LANGUAGE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_AUTHORIZATION => 28

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_ENCODING => 29

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_FORWARDED => 30

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_FROM => 31

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_IF_MODIFIED_SINCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_LOCATION => 33

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ORIG_URI => 34

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_REFERER => 35

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_RETRY_AFTER => 36

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_SERVER => 37

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_TITLE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_USER_AGENT => 39

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_WWW_AUTHENTICATE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PROXY_AUTHENTICATE => 41

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ACCEPT_RANGES => 42

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_SET_COOKIE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_COOKIE => 44

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_REQUEST_METHOD => 45

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_REFRESH => 46

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_DISPOSITION => 47

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_AGE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CACHE_CONTROL => 49

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_BASE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_LOCATION => 51

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_MD5 => 52

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CONTENT_RANGE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ETAG => 54

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_HOST => 55

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_IF_MATCH => 56

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_IF_NONE_MATCH => 57

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_IF_RANGE => 58

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_IF_UNMODIFIED_SINCE => 59

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_MAX_FORWARDS => 60

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PROXY_AUTHORIZATION => 61

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_RANGE => 62

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_TRANSFER_ENCODING => 63

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_UPGRADE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_VARY => 65

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_VIA => 66

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_WARNING => 67

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_EXPECT => 68

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PROXY_CONNECTION => 69

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_UNLESS_MODIFIED_SINCE => 70

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ECHO_REQUEST => 71

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ECHO_REPLY => 72

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ECHO_HEADERS => 73

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_ECHO_HEADERS_CRLF => 74

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PROXY_SUPPORT => 75

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_AUTHENTICATION_INFO => 76

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PASSPORT_URLS => 77

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PASSPORT_CONFIG => 78

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_X_CONTENT_TYPE_OPTIONS => 79

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_P3P => 80

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_X_P2P_PEERDIST => 81

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_TRANSLATE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_X_UA_COMPATIBLE => 83

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_DEFAULT_STYLE => 84

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_X_FRAME_OPTIONS => 85

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_X_XSS_PROTECTION => 86

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_SET_COOKIE2 => 87

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_DO_NOT_TRACK => 88

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_KEEP_ALIVE => 89

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_HTTP2_SETTINGS => 90

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_STRICT_TRANSPORT_SECURITY => 91

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_TOKEN_BINDING => 92

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_INCLUDE_REFERRED_TOKEN_BINDING_ID => 93

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_INCLUDE_REFERER_TOKEN_BINDING_ID => 93

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PUBLIC_KEY_PINS => 94

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_PUBLIC_KEY_PINS_REPORT_ONLY => 95

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_MAX => 95

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_CUSTOM => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_FLAG_REQUEST_HEADERS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_FLAG_SYSTEMTIME => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_FLAG_NUMBER => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_FLAG_COALESCE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_FLAG_NUMBER64 => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_QUERY_FLAG_COALESCE_WITH_COMMA => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_STATUS_MISDIRECTED_REQUEST => 421

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_ADDREQ_INDEX_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_ADDREQ_FLAGS_MASK => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static HSR_ASYNC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HSR_SYNC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HSR_USE_CONTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HSR_INITIATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HSR_DOWNLOAD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HSR_CHUNKED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_IS_SECURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_IS_SESSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_PROMPT_REQUIRED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_EVALUATE_P3P => 64

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_APPLY_P3P => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_P3P_ENABLED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_IS_RESTRICTED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_IE6 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_IS_LEGACY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_NON_SCRIPT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_HOST_ONLY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_APPLY_HOST_ONLY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_HOST_ONLY_APPLIED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_SAME_SITE_STRICT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_SAME_SITE_LAX => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_SAME_SITE_LEVEL_CROSS_SITE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_ICC_FORCE_CONNECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_ERROR_UI_FILTER_FOR_ERRORS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_ERROR_UI_FLAGS_GENERATE_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_ERROR_UI_FLAGS_NO_UI => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_ERROR_UI_SERIALIZE_DIALOGS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_ERROR_BASE => 12000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_OUT_OF_HANDLES => 12001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_TIMEOUT => 12002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_EXTENDED_ERROR => 12003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INTERNAL_ERROR => 12004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INVALID_URL => 12005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_UNRECOGNIZED_SCHEME => 12006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NAME_NOT_RESOLVED => 12007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_PROTOCOL_NOT_FOUND => 12008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INVALID_OPTION => 12009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_BAD_OPTION_LENGTH => 12010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_OPTION_NOT_SETTABLE => 12011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SHUTDOWN => 12012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INCORRECT_USER_NAME => 12013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INCORRECT_PASSWORD => 12014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_LOGIN_FAILURE => 12015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INVALID_OPERATION => 12016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_OPERATION_CANCELLED => 12017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INCORRECT_HANDLE_TYPE => 12018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INCORRECT_HANDLE_STATE => 12019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NOT_PROXY_REQUEST => 12020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_REGISTRY_VALUE_NOT_FOUND => 12021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_BAD_REGISTRY_PARAMETER => 12022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NO_DIRECT_ACCESS => 12023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NO_CONTEXT => 12024

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NO_CALLBACK => 12025

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_REQUEST_PENDING => 12026

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INCORRECT_FORMAT => 12027

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_ITEM_NOT_FOUND => 12028

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_CANNOT_CONNECT => 12029

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_CONNECTION_ABORTED => 12030

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_CONNECTION_RESET => 12031

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_FORCE_RETRY => 12032

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INVALID_PROXY_REQUEST => 12033

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NEED_UI => 12034

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_HANDLE_EXISTS => 12036

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SEC_CERT_DATE_INVALID => 12037

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SEC_CERT_CN_INVALID => 12038

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_HTTP_TO_HTTPS_ON_REDIR => 12039

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_HTTPS_TO_HTTP_ON_REDIR => 12040

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_MIXED_SECURITY => 12041

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_CHG_POST_IS_NON_SECURE => 12042

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_POST_IS_NON_SECURE => 12043

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED => 12044

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INVALID_CA => 12045

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_CLIENT_AUTH_NOT_SETUP => 12046

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_ASYNC_THREAD_FAILED => 12047

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_REDIRECT_SCHEME_CHANGE => 12048

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_DIALOG_PENDING => 12049

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_RETRY_DIALOG => 12050

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_HTTPS_HTTP_SUBMIT_REDIR => 12052

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INSERT_CDROM => 12053

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_FORTEZZA_LOGIN_NEEDED => 12054

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SEC_CERT_ERRORS => 12055

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SEC_CERT_NO_REV => 12056

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SEC_CERT_REV_FAILED => 12057

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_HSTS_REDIRECT_REQUIRED => 12060

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SEC_CERT_WEAK_SIGNATURE => 12062

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FTP_TRANSFER_IN_PROGRESS => 12110

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FTP_DROPPED => 12111

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FTP_NO_PASSIVE_MODE => 12112

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GOPHER_PROTOCOL_ERROR => 12130

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GOPHER_NOT_FILE => 12131

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GOPHER_DATA_ERROR => 12132

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GOPHER_END_OF_DATA => 12133

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GOPHER_INVALID_LOCATOR => 12134

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GOPHER_INCORRECT_LOCATOR_TYPE => 12135

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GOPHER_NOT_GOPHER_PLUS => 12136

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GOPHER_ATTRIBUTE_NOT_FOUND => 12137

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GOPHER_UNKNOWN_LOCATOR => 12138

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_HEADER_NOT_FOUND => 12150

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_DOWNLEVEL_SERVER => 12151

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_INVALID_SERVER_RESPONSE => 12152

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_INVALID_HEADER => 12153

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_INVALID_QUERY_REQUEST => 12154

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_HEADER_ALREADY_EXISTS => 12155

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_REDIRECT_FAILED => 12156

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_NOT_REDIRECTED => 12160

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION => 12161

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_COOKIE_DECLINED => 12162

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_REDIRECT_NEEDS_CONFIRMATION => 12168

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SECURITY_CHANNEL_ERROR => 12157

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_UNABLE_TO_CACHE_FILE => 12158

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_TCPIP_NOT_INSTALLED => 12159

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_DISCONNECTED => 12163

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SERVER_UNREACHABLE => 12164

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_PROXY_SERVER_UNREACHABLE => 12165

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_BAD_AUTO_PROXY_SCRIPT => 12166

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_UNABLE_TO_DOWNLOAD_SCRIPT => 12167

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SEC_INVALID_CERT => 12169

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SEC_CERT_REVOKED => 12170

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_FAILED_DUETOSECURITYCHECK => 12171

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NOT_INITIALIZED => 12172

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NEED_MSN_SSPI_PKG => 12173

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_LOGIN_FAILURE_DISPLAY_ENTITY_BODY => 12174

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_DECODING_FAILED => 12175

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED_PROXY => 12187

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SECURE_FAILURE_PROXY => 12188

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_HTTP_PROTOCOL_MISMATCH => 12190

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_GLOBAL_CALLBACK_FAILED => 12191

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_FEATURE_DISABLED => 12192

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_ERROR_LAST => 12192

    /**
     * @type {Integer (UInt32)}
     */
    static NORMAL_CACHE_ENTRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STICKY_CACHE_ENTRY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EDITED_CACHE_ENTRY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TRACK_OFFLINE_CACHE_ENTRY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TRACK_ONLINE_CACHE_ENTRY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SPARSE_CACHE_ENTRY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_CACHE_ENTRY => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static URLHISTORY_CACHE_ENTRY => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_ATTRIBUTE_GET_ALL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_ATTRIBUTE_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_ATTRIBUTE_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_ATTRIBUTE_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_ATTRIBUTE_QUOTA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_ATTRIBUTE_GROUPNAME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_ATTRIBUTE_STORAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_FLAG_NONPURGEABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_FLAG_GIDONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_FLAG_FLUSHURL_ONDELETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_SEARCH_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_SEARCH_BYURL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_TYPE_INVALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GROUPNAME_MAX_LENGTH => 120

    /**
     * @type {Integer (UInt32)}
     */
    static GROUP_OWNER_STORAGE_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_ATTRIBUTE_FC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_HITRATE_FC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_MODTIME_FC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_EXPTIME_FC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_ACCTIME_FC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_SYNCTIME_FC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_HEADERINFO_FC => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_EXEMPT_DELTA_FC => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_GROUP_ADD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_GROUP_REMOVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_DIAL_FORCE_PROMPT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_DIAL_SHOW_OFFLINE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_DIAL_UNATTENDED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static INTERENT_GOONLINE_REFRESH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERENT_GOONLINE_NOPROMPT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERENT_GOONLINE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CUSTOMDIAL_CONNECT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CUSTOMDIAL_UNATTENDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CUSTOMDIAL_DISCONNECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CUSTOMDIAL_SHOWOFFLINE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CUSTOMDIAL_SAFE_FOR_UNATTENDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CUSTOMDIAL_WILL_SUPPLY_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CUSTOMDIAL_CAN_HANGUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_DIALSTATE_DISCONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_IDENTITY_FLAG_PRIVATE_CACHE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_IDENTITY_FLAG_SHARED_CACHE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_IDENTITY_FLAG_CLEAR_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_IDENTITY_FLAG_CLEAR_COOKIES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_IDENTITY_FLAG_CLEAR_HISTORY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_IDENTITY_FLAG_CLEAR_CONTENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_SUPPRESS_RESET_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_SUPPRESS_COOKIE_POLICY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_SUPPRESS_COOKIE_POLICY_RESET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TEMPLATE_NO_COOKIES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TEMPLATE_HIGH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TEMPLATE_MEDIUM_HIGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TEMPLATE_MEDIUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TEMPLATE_MEDIUM_LOW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TEMPLATE_LOW => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TEMPLATE_CUSTOM => 100

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TEMPLATE_ADVANCED => 101

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TEMPLATE_MAX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TYPE_FIRST_PARTY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_TYPE_THIRD_PARTY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CACHE_ENTRY_INFO_SIZE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_REQFLAG_FROM_APP_CACHE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_BGUPDATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_FTP_FOLDER_VIEW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PREFETCH_PROGRESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PREFETCH_COMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PREFETCH_ABORTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ISO_FORCE_OFFLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DLG_FLAGS_INVALID_CA => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DLG_FLAGS_SEC_CERT_CN_INVALID => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DLG_FLAGS_SEC_CERT_DATE_INVALID => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DLG_FLAGS_WEAK_SIGNATURE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DLG_FLAGS_INSECURE_FALLBACK => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DLG_FLAGS_SEC_CERT_REV_FAILED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_SERVICE_URL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONTEXT_VALUE_OLD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_NET_SPEED => 61

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SECURITY_CONNECTION_INFO => 66

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DETECT_POST_SEND => 71

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DISABLE_NTLM_PREAUTH => 72

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ORIGINAL_CONNECT_FLAGS => 97

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CERT_ERROR_FLAGS => 98

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_IGNORE_CERT_ERROR_FLAGS => 99

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SESSION_START_TIME => 106

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PROXY_CREDENTIALS => 107

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_EXTENDED_CALLBACKS => 108

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PROXY_FROM_REQUEST => 109

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ALLOW_FAILED_CONNECT_CONTENT => 110

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CACHE_PARTITION => 111

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_AUTODIAL_HWND => 112

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SERVER_CREDENTIALS => 113

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_WPAD_SLEEP => 114

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_FAIL_ON_CACHE_WRITE_ERROR => 115

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DOWNLOAD_MODE => 116

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_RESPONSE_RESUMABLE => 117

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CM_HANDLE_COPY_REF => 118

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CONNECTION_INFO => 120

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_BACKGROUND_CONNECTIONS => 121

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DO_NOT_TRACK => 123

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_USE_MODIFIED_HEADER_FILTER => 124

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_WWA_MODE => 125

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_UPGRADE_TO_WEB_SOCKET => 126

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL => 127

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_UNLOAD_NOTIFY_EVENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SOCKET_NODELAY => 129

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_APP_CACHE => 130

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DEPENDENCY_HANDLE => 131

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_USE_FIRST_AVAILABLE_CONNECTION => 132

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_TIMED_CONNECTION_LIMIT_BYPASS => 133

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_WEB_SOCKET_CLOSE_TIMEOUT => 134

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_FLUSH_STATE => 135

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DISALLOW_PREMATURE_EOF => 137

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SOCKET_NOTIFICATION_IOCTL => 138

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CACHE_ENTRY_EXTRA_DATA => 139

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_MAX_QUERY_BUFFER_SIZE => 140

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_FALSE_START => 141

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_USER_PASS_SERVER_ONLY => 142

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SERVER_AUTH_SCHEME => 143

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PROXY_AUTH_SCHEME => 144

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_TUNNEL_ONLY => 145

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SOURCE_PORT => 146

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENABLE_DUO => 148

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DUO_USED => 149

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CHUNK_ENCODE_REQUEST => 150

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SECURE_FAILURE => 151

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_NOTIFY_SENDING_COOKIE => 152

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CLIENT_CERT_ISSUER_LIST => 153

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_RESET => 154

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SERVER_ADDRESS_INFO => 156

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENABLE_WBOEXT => 158

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DISABLE_INSECURE_FALLBACK => 160

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ALLOW_INSECURE_FALLBACK => 161

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SET_IN_PRIVATE => 164

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DOWNLOAD_MODE_HANDLE => 165

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_EDGE_COOKIES => 166

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_NO_HTTP_SERVER_AUTH => 167

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENABLE_HEADER_CALLBACKS => 168

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PRESERVE_REQUEST_SERVER_CREDENTIALS_ON_REDIRECT => 169

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PRESERVE_REFERER_ON_HTTPS_TO_HTTP_REDIRECT => 170

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_TCP_FAST_OPEN => 171

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_SYNC_MODE_AUTOMATIC_SESSION_DISABLED => 172

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENABLE_ZLIB_DEFLATE => 173

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENCODE_FALLBACK_FOR_REDIRECT_URI => 174

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_EDGE_COOKIES_TEMP => 175

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_OPT_IN_WEAK_SIGNATURE => 176

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_PARSE_LINE_FOLDING => 177

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_FORCE_DECODE => 178

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_COOKIES_APPLY_HOST_ONLY => 179

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_EDGE_MODE => 180

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CANCEL_CACHE_WRITE => 182

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_AUTH_SCHEME_SELECTED => 183

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_NOCACHE_WRITE_IN_PRIVATE => 184

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ACTIVITY_ID => 185

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_REQUEST_TIMES => 186

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_GLOBAL_CALLBACK => 188

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_ENABLE_TEST_SIGNING => 189

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_DISABLE_PROXY_LINK_LOCAL_NAME_RESOLUTION => 190

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_HTTP_09 => 191

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_CALLER_MODULE => 192

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_LAST_OPTION_INTERNAL => 193

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_OFFLINE_TIMEOUT => 49

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPTION_LINE_STATE => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DUO_PROTOCOL_FLAG_SPDY3 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DUO_PROTOCOL_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTH_FLAG_RESET => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTH_SCHEME_BASIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTH_SCHEME_DIGEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTH_SCHEME_NTLM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTH_SCHEME_KERBEROS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTH_SCHEME_NEGOTIATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTH_SCHEME_PASSPORT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTH_SCHEME_UNKNOWN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_SENDING_COOKIE => 328

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_REQUEST_HEADERS_SET => 329

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_RESPONSE_HEADERS_SET => 330

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_PROXY_CREDENTIALS => 400

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_SERVER_CREDENTIALS => 401

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_SERVER_CONNECTION_STATE => 410

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_END_BROWSER_SESSION => 420

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_COOKIE => 430

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_STATE_LB => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_STATE_UB => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MaxPrivacySettings => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_RESOLVING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_RESOLVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_CONNECTING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_CONNECTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_SENDING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_SENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_RECEIVING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_RECEIVED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_CLOSING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_CLOSED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_HANDLE_CREATED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_HANDLE_CLOSING => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_PREFETCH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_REDIRECT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATUS_FILTER_STATE_CHANGE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_ADDREQ_FLAG_RESPONSE_HEADERS => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_ADDREQ_FLAG_ALLOW_EMPTY_VALUES => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_DONT_ALLOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_ALLOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_ALLOW_ALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_DONT_ALLOW_ALL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_OP_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_OP_MODIFY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_OP_GET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_OP_SESSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_OP_PERSISTENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_OP_3RD_PARTY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_PERSISTENT_HOST_ONLY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_RESTRICTED_ZONE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_EDGE_COOKIES => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_ALL_COOKIES => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_NO_CALLBACK => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_COOKIE_ECTX_3RDPARTY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static FLAGS_ERROR_UI_SHOW_IDN_HOSTNAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NO_NEW_CONTAINERS => 12051

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_SOURCE_PORT_IN_USE => 12058

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INSECURE_FALLBACK_REQUIRED => 12059

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_PROXY_ALERT => 12061

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NO_CM_CONNECTION => 12080

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_PUSH_STATUS_CODE_NOT_SUPPORTED => 12147

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_PUSH_RETRY_NOT_SUPPORTED => 12148

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_PUSH_ENABLE_FAILED => 12149

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_DISALLOW_INPRIVATE => 12189

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_OFFLINE => 12163

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_INTERNAL_ERROR_BASE => 12900

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_INTERNAL_SOCKET_ERROR => 12901

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_CONNECTION_AVAILABLE => 12902

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NO_KNOWN_SERVERS => 12903

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_PING_FAILED => 12904

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_NO_PING_SUPPORT => 12905

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNET_CACHE_SUCCESS => 12906

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION_EX => 12907

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_1_1_CACHE_ENTRY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static STATIC_CACHE_ENTRY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MUST_REVALIDATE_CACHE_ENTRY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SHORTPATH_CACHE_ENTRY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DOWNLOAD_CACHE_ENTRY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static REDIRECT_CACHE_ENTRY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_ACCEPTED_CACHE_ENTRY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_LEASHED_CACHE_ENTRY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_DOWNGRADED_CACHE_ENTRY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static COOKIE_REJECTED_CACHE_ENTRY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_MODE_CACHE_ENTRY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static XDR_CACHE_ENTRY => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IMMUTABLE_CACHE_ENTRY => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PENDING_DELETE_CACHE_ENTRY => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static OTHER_USER_CACHE_ENTRY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVACY_IMPACTED_CACHE_ENTRY => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static POST_RESPONSE_CACHE_ENTRY => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALLED_CACHE_ENTRY => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static POST_CHECK_CACHE_ENTRY => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static IDENTITY_CACHE_ENTRY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ANY_CACHE_ENTRY => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static CACHEGROUP_FLAG_VALID => 7

    /**
     * @type {Integer (UInt64)}
     */
    static CACHEGROUP_ID_BUILTIN_STICKY => 1152921504606846983

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_FLAG_ALLOW_COLLISIONS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_FLAG_INSTALLED_ENTRY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_FLAG_ENTRY_OR_MAPPING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_FLAG_ADD_FILENAME_ONLY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_FLAG_GET_STRUCT_ONLY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_TYPE_FC => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_ENTRY_MODIFY_DATA_FC => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_CONTAINER_NOSUBDIRS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_CONTAINER_AUTODELETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_CONTAINER_RESERVED1 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_CONTAINER_NODESKTOPINIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_CONTAINER_MAP_ENABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_CONTAINER_BLOOM_FILTER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_CONTAINER_SHARE_READ => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CACHE_CONTAINER_SHARE_READ_WRITE => 768

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_FIND_CONTAINER_RETURN_NOCHANGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CURRENT_SETTINGS_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CONLIST_CHANGE_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_COOKIE_CHANGE_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_NOTIFICATION_HWND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_NOTIFICATION_MESG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_ROOTGROUP_OFFSET => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_GID_LOW => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_GID_HIGH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_LAST_SCAVENGE_TIMESTAMP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_READ_COUNT_SINCE_LAST_SCAVENGE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_WRITE_COUNT_SINCE_LAST_SCAVENGE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_HSTS_CHANGE_COUNT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_12 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_13 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_SSL_STATE_COUNT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_DOWNLOAD_PARTIAL => 14

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_15 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_16 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_17 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_18 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_19 => 19

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_20 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_NOTIFICATION_FILTER => 21

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_ROOT_LEAK_OFFSET => 22

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_23 => 23

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_24 => 24

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_25 => 25

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_26 => 26

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_ROOT_GROUPLIST_OFFSET => 27

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_28 => 28

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_29 => 29

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_30 => 30

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_CACHE_RESERVED_31 => 31

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_HEADER_DATA_LAST => 31

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_NOTIFY_ADD_URL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_NOTIFY_DELETE_URL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_NOTIFY_UPDATE_URL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_NOTIFY_DELETE_ALL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_NOTIFY_URL_SET_STICKY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_NOTIFY_URL_UNSET_STICKY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_NOTIFY_SET_ONLINE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_NOTIFY_SET_OFFLINE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_NOTIFY_FILTER_CHANGED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static APP_CACHE_LOOKUP_NO_MASTER_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APP_CACHE_ENTRY_TYPE_MASTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APP_CACHE_ENTRY_TYPE_EXPLICIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static APP_CACHE_ENTRY_TYPE_FALLBACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static APP_CACHE_ENTRY_TYPE_FOREIGN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static APP_CACHE_ENTRY_TYPE_MANIFEST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_CONTENT_QUOTA_FC => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_TOTAL_CONTENT_QUOTA_FC => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_APPCONTAINER_CONTENT_QUOTA_FC => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_APPCONTAINER_TOTAL_CONTENT_QUOTA_FC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTOPROXY_INIT_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTOPROXY_INIT_DOWNLOADSYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTOPROXY_INIT_QUERYSTATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_AUTOPROXY_INIT_ONLYQUERY => 8

    /**
     * @type {String}
     */
    static REGSTR_DIAL_AUTOCONNECT => "AutoConnect"

    /**
     * @type {String}
     */
    static REGSTR_LEASH_LEGACY_COOKIES => "LeashLegacyCookies"

    /**
     * @type {String}
     */
    static LOCAL_NAMESPACE_PREFIX => "Local\"

    /**
     * @type {String}
     */
    static LOCAL_NAMESPACE_PREFIX_W => "Local\"

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_SUPPRESS_COOKIE_PERSIST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_SUPPRESS_COOKIE_PERSIST_RESET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_WEB_SOCKET_MAX_CLOSE_REASON_LENGTH => 123

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_WEB_SOCKET_MIN_KEEPALIVE_VALUE => 10000

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_GLOBAL_CALLBACK_SENDING_HTTP_HEADERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_GLOBAL_CALLBACK_DETECTING_PROXY => 2
;@endregion Constants

;@region Methods
    /**
     * Formats a date and time according to the HTTP version 1.0 specification.
     * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to format.
     * @param {Integer} dwRFC RFC format used. Currently, the only valid format is INTERNET_RFC1123_FORMAT.
     * @param {Pointer} lpszTime Pointer to a string buffer that receives the formatted date and time. The buffer should be of size INTERNET_RFC1123_BUFSIZE.
     * @param {Integer} cbTime Size of the 
     * <i>lpszTime</i> buffer, in bytes.
     * @returns {BOOL} Returns TRUE if the function succeeds, or FALSE otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internettimefromsystemtimea
     * @since windows5.0
     */
    static InternetTimeFromSystemTimeA(pst, dwRFC, lpszTime, cbTime) {
        A_LastError := 0

        result := DllCall("WININET.dll\InternetTimeFromSystemTimeA", "ptr", pst, "uint", dwRFC, "ptr", lpszTime, "uint", cbTime, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Formats a date and time according to the HTTP version 1.0 specification.
     * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to format.
     * @param {Integer} dwRFC RFC format used. Currently, the only valid format is INTERNET_RFC1123_FORMAT.
     * @param {Pointer} lpszTime Pointer to a string buffer that receives the formatted date and time. The buffer should be of size INTERNET_RFC1123_BUFSIZE.
     * @param {Integer} cbTime Size of the 
     * <i>lpszTime</i> buffer, in bytes.
     * @returns {BOOL} Returns TRUE if the function succeeds, or FALSE otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internettimefromsystemtimew
     * @since windows5.0
     */
    static InternetTimeFromSystemTimeW(pst, dwRFC, lpszTime, cbTime) {
        A_LastError := 0

        result := DllCall("WININET.dll\InternetTimeFromSystemTimeW", "ptr", pst, "uint", dwRFC, "ptr", lpszTime, "uint", cbTime, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Formats a date and time according to the HTTP version 1.0 specification.
     * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to format.
     * @param {Integer} dwRFC RFC format used. Currently, the only valid format is INTERNET_RFC1123_FORMAT.
     * @param {Pointer} lpszTime Pointer to a string buffer that receives the formatted date and time. The buffer should be of size INTERNET_RFC1123_BUFSIZE.
     * @param {Integer} cbTime Size of the 
     * <i>lpszTime</i> buffer, in bytes.
     * @returns {BOOL} Returns TRUE if the function succeeds, or FALSE otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internettimefromsystemtime
     * @since windows5.0
     */
    static InternetTimeFromSystemTime(pst, dwRFC, lpszTime, cbTime) {
        A_LastError := 0

        result := DllCall("WININET.dll\InternetTimeFromSystemTime", "ptr", pst, "uint", dwRFC, "ptr", lpszTime, "uint", cbTime, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts an HTTP time/date string to a SYSTEMTIME structure.
     * @param {PSTR} lpszTime Pointer to a null-terminated string that specifies the date/time to  be converted.
     * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the converted time.
     * @returns {BOOL} Returns <b>TRUE</b> if the string was converted, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internettimetosystemtimea
     * @since windows5.0
     */
    static InternetTimeToSystemTimeA(lpszTime, pst) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszTime := lpszTime is String ? StrPtr(lpszTime) : lpszTime

        A_LastError := 0

        result := DllCall("WININET.dll\InternetTimeToSystemTimeA", "ptr", lpszTime, "ptr", pst, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts an HTTP time/date string to a SYSTEMTIME structure.
     * @param {PWSTR} lpszTime Pointer to a null-terminated string that specifies the date/time to  be converted.
     * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the converted time.
     * @returns {BOOL} Returns <b>TRUE</b> if the string was converted, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internettimetosystemtimew
     * @since windows5.0
     */
    static InternetTimeToSystemTimeW(lpszTime, pst) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszTime := lpszTime is String ? StrPtr(lpszTime) : lpszTime

        A_LastError := 0

        result := DllCall("WININET.dll\InternetTimeToSystemTimeW", "ptr", lpszTime, "ptr", pst, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts an HTTP time/date string to a SYSTEMTIME structure.
     * @param {PSTR} lpszTime Pointer to a null-terminated string that specifies the date/time to  be converted.
     * @param {Pointer<SYSTEMTIME>} pst Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the converted time.
     * @returns {BOOL} Returns <b>TRUE</b> if the string was converted, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internettimetosystemtime
     * @since windows5.0
     */
    static InternetTimeToSystemTime(lpszTime, pst) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszTime := lpszTime is String ? StrPtr(lpszTime) : lpszTime

        A_LastError := 0

        result := DllCall("WININET.dll\InternetTimeToSystemTime", "ptr", lpszTime, "ptr", pst, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Cracks a URL into its component parts.
     * @param {PSTR} lpszUrl Pointer to a string that contains the canonical URL to be cracked.
     * @param {Integer} dwUrlLength Size of the 
     * <i>lpszUrl</i> string, in <b>TCHARs</b>, or zero if 
     * <i>lpszUrl</i> is an ASCIIZ string.
     * @param {Integer} dwFlags 
     * @param {Pointer<URL_COMPONENTSA>} lpUrlComponents Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure that receives the URL components.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcrackurla
     * @since windows5.0
     */
    static InternetCrackUrlA(lpszUrl, dwUrlLength, dwFlags, lpUrlComponents) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCrackUrlA", "ptr", lpszUrl, "uint", dwUrlLength, "uint", dwFlags, "ptr", lpUrlComponents, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Cracks a URL into its component parts.
     * @param {PWSTR} lpszUrl Pointer to a string that contains the canonical URL to be cracked.
     * @param {Integer} dwUrlLength Size of the 
     * <i>lpszUrl</i> string, in <b>TCHARs</b>, or zero if 
     * <i>lpszUrl</i> is an ASCIIZ string.
     * @param {Integer} dwFlags 
     * @param {Pointer<URL_COMPONENTSW>} lpUrlComponents Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure that receives the URL components.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcrackurlw
     * @since windows5.0
     */
    static InternetCrackUrlW(lpszUrl, dwUrlLength, dwFlags, lpUrlComponents) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCrackUrlW", "ptr", lpszUrl, "uint", dwUrlLength, "uint", dwFlags, "ptr", lpUrlComponents, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a URL from its component parts.
     * @param {Pointer<URL_COMPONENTSA>} lpUrlComponents Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure that contains the components from which to create the URL.
     * @param {Integer} dwFlags 
     * @param {PSTR} lpszUrl Pointer to a buffer that receives the URL.
     * @param {Pointer<Integer>} lpdwUrlLength Pointer to a variable that specifies the size of the 
     * URL<i>lpszUrl</i> buffer, in <b>TCHARs</b>. When the function returns, this parameter receives the size of the URL string, excluding the NULL terminator. If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of bytes required to hold the created URL.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcreateurla
     * @since windows5.0
     */
    static InternetCreateUrlA(lpUrlComponents, dwFlags, lpszUrl, lpdwUrlLength) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        lpdwUrlLengthMarshal := lpdwUrlLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCreateUrlA", "ptr", lpUrlComponents, "uint", dwFlags, "ptr", lpszUrl, lpdwUrlLengthMarshal, lpdwUrlLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a URL from its component parts.
     * @param {Pointer<URL_COMPONENTSW>} lpUrlComponents Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-url_componentsa">URL_COMPONENTS</a> structure that contains the components from which to create the URL.
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpszUrl Pointer to a buffer that receives the URL.
     * @param {Pointer<Integer>} lpdwUrlLength Pointer to a variable that specifies the size of the 
     * URL<i>lpszUrl</i> buffer, in <b>TCHARs</b>. When the function returns, this parameter receives the size of the URL string, excluding the NULL terminator. If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter receives the number of bytes required to hold the created URL.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcreateurlw
     * @since windows5.0
     */
    static InternetCreateUrlW(lpUrlComponents, dwFlags, lpszUrl, lpdwUrlLength) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        lpdwUrlLengthMarshal := lpdwUrlLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCreateUrlW", "ptr", lpUrlComponents, "uint", dwFlags, "ptr", lpszUrl, lpdwUrlLengthMarshal, lpdwUrlLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Canonicalizes a URL, which includes converting unsafe characters and spaces into escape sequences.
     * @param {PSTR} lpszUrl A pointer to the string that contains the URL to canonicalize.
     * @param {PSTR} lpszBuffer A pointer to the buffer that receives the resulting canonicalized URL.
     * @param {Pointer<Integer>} lpdwBufferLength A pointer to a variable that contains the size, in characters,  of the 
     * <i>lpszBuffer</i> buffer. If the function succeeds, this parameter receives the number of characters actually copied to the 
     * <i>lpszBuffer</i> buffer, which does not include the terminating null character. If the function fails, this parameter receives the required size of the 
     * buffer, in characters, which includes the terminating null character.
     * @param {Integer} dwFlags Controls canonicalization. If no flags are specified, the function converts all unsafe characters and meta sequences (such as \.,\ .., and \...) to escape sequences.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. Possible errors include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL could not be canonicalized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The canonicalized URL is too large to fit in the buffer provided. The 
     * <i>lpdwBufferLength</i> parameter is set to the size, in bytes, of the buffer required to hold the canonicalized URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERNET_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the URL is invalid.
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
     * There is an invalid string, buffer, buffer size, or flags parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcanonicalizeurla
     * @since windows5.0
     */
    static InternetCanonicalizeUrlA(lpszUrl, lpszBuffer, lpdwBufferLength, dwFlags) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCanonicalizeUrlA", "ptr", lpszUrl, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "uint", dwFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Canonicalizes a URL, which includes converting unsafe characters and spaces into escape sequences.
     * @param {PWSTR} lpszUrl A pointer to the string that contains the URL to canonicalize.
     * @param {PWSTR} lpszBuffer A pointer to the buffer that receives the resulting canonicalized URL.
     * @param {Pointer<Integer>} lpdwBufferLength A pointer to a variable that contains the size, in characters,  of the 
     * <i>lpszBuffer</i> buffer. If the function succeeds, this parameter receives the number of characters actually copied to the 
     * <i>lpszBuffer</i> buffer, which does not include the terminating null character. If the function fails, this parameter receives the required size of the 
     * buffer, in characters, which includes the terminating null character.
     * @param {Integer} dwFlags Controls canonicalization. If no flags are specified, the function converts all unsafe characters and meta sequences (such as \.,\ .., and \...) to escape sequences.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. Possible errors include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL could not be canonicalized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The canonicalized URL is too large to fit in the buffer provided. The 
     * <i>lpdwBufferLength</i> parameter is set to the size, in bytes, of the buffer required to hold the canonicalized URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERNET_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the URL is invalid.
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
     * There is an invalid string, buffer, buffer size, or flags parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcanonicalizeurlw
     * @since windows5.0
     */
    static InternetCanonicalizeUrlW(lpszUrl, lpszBuffer, lpdwBufferLength, dwFlags) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCanonicalizeUrlW", "ptr", lpszUrl, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "uint", dwFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Combines a base and relative URL into a single URL. The resultant URL is canonicalized (see InternetCanonicalizeUrl).
     * @param {PSTR} lpszBaseUrl Pointer to a null-terminated string  that contains the base URL.
     * @param {PSTR} lpszRelativeUrl Pointer to a null-terminated string  that contains the relative URL.
     * @param {PSTR} lpszBuffer Pointer to a buffer that receives the combined URL.
     * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of the 
     * <i>lpszBuffer</i> buffer, in characters. If the function succeeds, this parameter receives the size of the combined URL, in characters, not including the null-terminating character. If the function fails, this parameter receives the size of the required buffer, in characters (including the null-terminating character).
     * @param {Integer} dwFlags 
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible errors include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URLs could not be combined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer supplied to the function was insufficient or <b>NULL</b>. The value indicated by the 
     * <i>lpdwBufferLength</i> parameter will contain the number of bytes required to hold the combined URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERNET_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the URL is invalid.
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
     * There is an invalid string, buffer, buffer size, or flags parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcombineurla
     * @since windows5.0
     */
    static InternetCombineUrlA(lpszBaseUrl, lpszRelativeUrl, lpszBuffer, lpdwBufferLength, dwFlags) {
        lpszBaseUrl := lpszBaseUrl is String ? StrPtr(lpszBaseUrl) : lpszBaseUrl
        lpszRelativeUrl := lpszRelativeUrl is String ? StrPtr(lpszRelativeUrl) : lpszRelativeUrl
        lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCombineUrlA", "ptr", lpszBaseUrl, "ptr", lpszRelativeUrl, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "uint", dwFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Combines a base and relative URL into a single URL. The resultant URL is canonicalized (see InternetCanonicalizeUrl).
     * @param {PWSTR} lpszBaseUrl Pointer to a null-terminated string  that contains the base URL.
     * @param {PWSTR} lpszRelativeUrl Pointer to a null-terminated string  that contains the relative URL.
     * @param {PWSTR} lpszBuffer Pointer to a buffer that receives the combined URL.
     * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of the 
     * <i>lpszBuffer</i> buffer, in characters. If the function succeeds, this parameter receives the size of the combined URL, in characters, not including the null-terminating character. If the function fails, this parameter receives the size of the required buffer, in characters (including the null-terminating character).
     * @param {Integer} dwFlags 
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible errors include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URLs could not be combined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer supplied to the function was insufficient or <b>NULL</b>. The value indicated by the 
     * <i>lpdwBufferLength</i> parameter will contain the number of bytes required to hold the combined URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERNET_INVALID_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format of the URL is invalid.
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
     * There is an invalid string, buffer, buffer size, or flags parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcombineurlw
     * @since windows5.0
     */
    static InternetCombineUrlW(lpszBaseUrl, lpszRelativeUrl, lpszBuffer, lpdwBufferLength, dwFlags) {
        lpszBaseUrl := lpszBaseUrl is String ? StrPtr(lpszBaseUrl) : lpszBaseUrl
        lpszRelativeUrl := lpszRelativeUrl is String ? StrPtr(lpszRelativeUrl) : lpszRelativeUrl
        lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCombineUrlW", "ptr", lpszBaseUrl, "ptr", lpszRelativeUrl, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "uint", dwFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes an application's use of the WinINet functions.
     * @param {PSTR} lpszAgent Pointer to a <b>null</b>-terminated string  that specifies the name of the application or entity calling the WinINet functions. This name is used as the user agent in the HTTP protocol.
     * @param {Integer} dwAccessType 
     * @param {PSTR} lpszProxy Pointer to a <b>null</b>-terminated string  that specifies the name of the proxy server(s) to use when proxy access is specified by setting 
     * <i>dwAccessType</i> to 
     * <b>INTERNET_OPEN_TYPE_PROXY</b>. Do not use an empty string, because 
     * <b>InternetOpen</b> will use it as the proxy name. The WinINet functions recognize only CERN type proxies (HTTP only) and the TIS FTP gateway (FTP only). If Microsoft Internet Explorer is installed, these functions also support SOCKS proxies. FTP requests can be made through a CERN type proxy either by changing them to an HTTP request or by using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a>. If 
     * <i>dwAccessType</i> is not set to 
     * <b>INTERNET_OPEN_TYPE_PROXY</b>, this parameter is ignored and should be <b>NULL</b>. For more information about listing proxy servers, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Listing Proxy Servers</a> section of 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Enabling Internet Functionality</a>.
     * @param {PSTR} lpszProxyBypass Pointer to a <b>null</b>-terminated string  that specifies an optional list of host names or IP addresses, or both, that should not be routed through the proxy when 
     * <i>dwAccessType</i> is set to 
     * <b>INTERNET_OPEN_TYPE_PROXY</b>. The list can contain wildcards. Do not use an empty string, because 
     * <b>InternetOpen</b> will use it as the proxy bypass list. If this parameter specifies the "&lt;local&gt;" macro, the function bypasses the proxy for any host name that does not contain a period. 
     * 
     * By default, WinINet will bypass the proxy for requests that use the host names "localhost", "loopback", "127.0.0.1", or "[::1]". This behavior exists because a remote proxy server typically will not resolve these addresses properly.<b>Internet Explorer 9:  </b>You can remove the local computer from the proxy bypass list using the "&lt;-loopback&gt;" macro.
     * 
     * 
     * 
     * If 
     * <i>dwAccessType</i> is not set to 
     * <b>INTERNET_OPEN_TYPE_PROXY</b>, this parameter is ignored and should be <b>NULL</b>.
     * @param {Integer} dwFlags 
     * @returns {Pointer<Void>} Returns a valid handle that the application passes to subsequent WinINet functions. If 
     * <b>InternetOpen</b> fails, it returns <b>NULL</b>. To retrieve a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetopena
     * @since windows5.0
     */
    static InternetOpenA(lpszAgent, dwAccessType, lpszProxy, lpszProxyBypass, dwFlags) {
        lpszAgent := lpszAgent is String ? StrPtr(lpszAgent) : lpszAgent
        lpszProxy := lpszProxy is String ? StrPtr(lpszProxy) : lpszProxy
        lpszProxyBypass := lpszProxyBypass is String ? StrPtr(lpszProxyBypass) : lpszProxyBypass

        A_LastError := 0

        result := DllCall("WININET.dll\InternetOpenA", "ptr", lpszAgent, "uint", dwAccessType, "ptr", lpszProxy, "ptr", lpszProxyBypass, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes an application's use of the WinINet functions.
     * @param {PWSTR} lpszAgent Pointer to a <b>null</b>-terminated string  that specifies the name of the application or entity calling the WinINet functions. This name is used as the user agent in the HTTP protocol.
     * @param {Integer} dwAccessType 
     * @param {PWSTR} lpszProxy Pointer to a <b>null</b>-terminated string  that specifies the name of the proxy server(s) to use when proxy access is specified by setting 
     * <i>dwAccessType</i> to 
     * <b>INTERNET_OPEN_TYPE_PROXY</b>. Do not use an empty string, because 
     * <b>InternetOpen</b> will use it as the proxy name. The WinINet functions recognize only CERN type proxies (HTTP only) and the TIS FTP gateway (FTP only). If Microsoft Internet Explorer is installed, these functions also support SOCKS proxies. FTP requests can be made through a CERN type proxy either by changing them to an HTTP request or by using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a>. If 
     * <i>dwAccessType</i> is not set to 
     * <b>INTERNET_OPEN_TYPE_PROXY</b>, this parameter is ignored and should be <b>NULL</b>. For more information about listing proxy servers, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Listing Proxy Servers</a> section of 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Enabling Internet Functionality</a>.
     * @param {PWSTR} lpszProxyBypass Pointer to a <b>null</b>-terminated string  that specifies an optional list of host names or IP addresses, or both, that should not be routed through the proxy when 
     * <i>dwAccessType</i> is set to 
     * <b>INTERNET_OPEN_TYPE_PROXY</b>. The list can contain wildcards. Do not use an empty string, because 
     * <b>InternetOpen</b> will use it as the proxy bypass list. If this parameter specifies the "&lt;local&gt;" macro, the function bypasses the proxy for any host name that does not contain a period. 
     * 
     * By default, WinINet will bypass the proxy for requests that use the host names "localhost", "loopback", "127.0.0.1", or "[::1]". This behavior exists because a remote proxy server typically will not resolve these addresses properly.<b>Internet Explorer 9:  </b>You can remove the local computer from the proxy bypass list using the "&lt;-loopback&gt;" macro.
     * 
     * 
     * 
     * If 
     * <i>dwAccessType</i> is not set to 
     * <b>INTERNET_OPEN_TYPE_PROXY</b>, this parameter is ignored and should be <b>NULL</b>.
     * @param {Integer} dwFlags 
     * @returns {Pointer<Void>} Returns a valid handle that the application passes to subsequent WinINet functions. If 
     * <b>InternetOpen</b> fails, it returns <b>NULL</b>. To retrieve a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetopenw
     * @since windows5.0
     */
    static InternetOpenW(lpszAgent, dwAccessType, lpszProxy, lpszProxyBypass, dwFlags) {
        lpszAgent := lpszAgent is String ? StrPtr(lpszAgent) : lpszAgent
        lpszProxy := lpszProxy is String ? StrPtr(lpszProxy) : lpszProxy
        lpszProxyBypass := lpszProxyBypass is String ? StrPtr(lpszProxyBypass) : lpszProxyBypass

        A_LastError := 0

        result := DllCall("WININET.dll\InternetOpenW", "ptr", lpszAgent, "uint", dwAccessType, "ptr", lpszProxy, "ptr", lpszProxyBypass, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes a single Internet handle.
     * @param {Pointer<Void>} hInternet Handle to be closed.
     * @returns {BOOL} Returns <b>TRUE</b> if the handle is successfully closed, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetclosehandle
     * @since windows5.0
     */
    static InternetCloseHandle(hInternet) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCloseHandle", hInternetMarshal, hInternet, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens an File Transfer Protocol (FTP) or HTTP session for a given site.
     * @param {Pointer<Void>} hInternet Handle returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>.
     * @param {PSTR} lpszServerName Pointer to a <b>null</b>-terminated string that specifies the host name of an Internet server. Alternately, the string can contain the IP number of the site, in ASCII dotted-decimal format (for example, 11.0.1.45).
     * @param {Integer} nServerPort Transmission Control Protocol/Internet Protocol (TCP/IP) port on the server. These flags set only the port that is used. The service is set by the value of
     * @param {PSTR} lpszUserName Pointer to a <b>null</b>-terminated string that specifies the name of the user to log on. If this parameter is <b>NULL</b>, the function uses an appropriate default. For the FTP protocol, the default is "anonymous".
     * @param {PSTR} lpszPassword Pointer to a <b>null</b>-terminated string that contains the password to use to log on. If both 
     * <i>lpszPassword</i> and 
     * <i>lpszUsername</i> are <b>NULL</b>, the function uses the default "anonymous" password. In the case of FTP, the default password is the user's email name. If 
     * <i>lpszPassword</i> is <b>NULL</b>, but 
     * <i>lpszUsername</i> is not <b>NULL</b>, the function uses a blank password.
     * @param {Integer} dwService 
     * @param {Integer} dwFlags Options specific to the service used. If  
     * <i>dwService</i> is INTERNET_SERVICE_FTP, 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_PASSIVE</a> causes the application to use passive FTP semantics.
     * @param {Pointer} dwContext Pointer to a variable that contains an application-defined value that is used to identify the application context for the returned handle in callbacks.
     * @returns {Pointer<Void>} Returns a valid handle to the session if the connection is successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why access to the service was denied.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetconnecta
     * @since windows5.0
     */
    static InternetConnectA(hInternet, lpszServerName, nServerPort, lpszUserName, lpszPassword, dwService, dwFlags, dwContext) {
        lpszServerName := lpszServerName is String ? StrPtr(lpszServerName) : lpszServerName
        lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName
        lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetConnectA", hInternetMarshal, hInternet, "ptr", lpszServerName, "ushort", nServerPort, "ptr", lpszUserName, "ptr", lpszPassword, "uint", dwService, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens an File Transfer Protocol (FTP) or HTTP session for a given site.
     * @param {Pointer<Void>} hInternet Handle returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>.
     * @param {PWSTR} lpszServerName Pointer to a <b>null</b>-terminated string that specifies the host name of an Internet server. Alternately, the string can contain the IP number of the site, in ASCII dotted-decimal format (for example, 11.0.1.45).
     * @param {Integer} nServerPort Transmission Control Protocol/Internet Protocol (TCP/IP) port on the server. These flags set only the port that is used. The service is set by the value of
     * @param {PWSTR} lpszUserName Pointer to a <b>null</b>-terminated string that specifies the name of the user to log on. If this parameter is <b>NULL</b>, the function uses an appropriate default. For the FTP protocol, the default is "anonymous".
     * @param {PWSTR} lpszPassword Pointer to a <b>null</b>-terminated string that contains the password to use to log on. If both 
     * <i>lpszPassword</i> and 
     * <i>lpszUsername</i> are <b>NULL</b>, the function uses the default "anonymous" password. In the case of FTP, the default password is the user's email name. If 
     * <i>lpszPassword</i> is <b>NULL</b>, but 
     * <i>lpszUsername</i> is not <b>NULL</b>, the function uses a blank password.
     * @param {Integer} dwService 
     * @param {Integer} dwFlags Options specific to the service used. If  
     * <i>dwService</i> is INTERNET_SERVICE_FTP, 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_PASSIVE</a> causes the application to use passive FTP semantics.
     * @param {Pointer} dwContext Pointer to a variable that contains an application-defined value that is used to identify the application context for the returned handle in callbacks.
     * @returns {Pointer<Void>} Returns a valid handle to the session if the connection is successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why access to the service was denied.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetconnectw
     * @since windows5.0
     */
    static InternetConnectW(hInternet, lpszServerName, nServerPort, lpszUserName, lpszPassword, dwService, dwFlags, dwContext) {
        lpszServerName := lpszServerName is String ? StrPtr(lpszServerName) : lpszServerName
        lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName
        lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetConnectW", hInternetMarshal, hInternet, "ptr", lpszServerName, "ushort", nServerPort, "ptr", lpszUserName, "ptr", lpszPassword, "uint", dwService, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a resource specified by a complete FTP or HTTP URL.
     * @param {Pointer<Void>} hInternet The handle to the current Internet session. The handle must have been returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>.
     * @param {PSTR} lpszUrl A pointer to a <b>null</b>-terminated string variable that specifies the URL to begin reading. Only URLs beginning with ftp:, http:, or https: are supported.
     * @param {PSTR} lpszHeaders A pointer to a <b>null</b>-terminated string  that specifies the headers to be sent to the HTTP server. For more information, see the description of the 
     * <i>lpszHeaders</i> parameter in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a> function.
     * @param {Integer} dwHeadersLength The size of the additional headers, in <b>TCHARs</b>. If this parameter is -1L and 
     * <i>lpszHeaders</i> is not <b>NULL</b>, 
     * <i>lpszHeaders</i> is assumed to be zero-terminated (ASCIIZ) and the length is calculated.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext A pointer to a variable that specifies the application-defined value that is passed, along with the returned handle, to any callback functions.
     * @returns {Pointer<Void>} Returns a valid handle to the URL if the connection is successfully established, or <b>NULL</b> if the connection fails. To retrieve a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. To determine why access to the service was denied, call 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetopenurla
     * @since windows5.0
     */
    static InternetOpenUrlA(hInternet, lpszUrl, lpszHeaders, dwHeadersLength, dwFlags, dwContext) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetOpenUrlA", hInternetMarshal, hInternet, "ptr", lpszUrl, "ptr", lpszHeaders, "uint", dwHeadersLength, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a resource specified by a complete FTP or HTTP URL.
     * @param {Pointer<Void>} hInternet The handle to the current Internet session. The handle must have been returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopena">InternetOpen</a>.
     * @param {PWSTR} lpszUrl A pointer to a <b>null</b>-terminated string variable that specifies the URL to begin reading. Only URLs beginning with ftp:, http:, or https: are supported.
     * @param {PWSTR} lpszHeaders A pointer to a <b>null</b>-terminated string  that specifies the headers to be sent to the HTTP server. For more information, see the description of the 
     * <i>lpszHeaders</i> parameter in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a> function.
     * @param {Integer} dwHeadersLength The size of the additional headers, in <b>TCHARs</b>. If this parameter is -1L and 
     * <i>lpszHeaders</i> is not <b>NULL</b>, 
     * <i>lpszHeaders</i> is assumed to be zero-terminated (ASCIIZ) and the length is calculated.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext A pointer to a variable that specifies the application-defined value that is passed, along with the returned handle, to any callback functions.
     * @returns {Pointer<Void>} Returns a valid handle to the URL if the connection is successfully established, or <b>NULL</b> if the connection fails. To retrieve a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. To determine why access to the service was denied, call 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetopenurlw
     * @since windows5.0
     */
    static InternetOpenUrlW(hInternet, lpszUrl, lpszHeaders, dwHeadersLength, dwFlags, dwContext) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetOpenUrlW", hInternetMarshal, hInternet, "ptr", lpszUrl, "ptr", lpszHeaders, "uint", dwHeadersLength, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads data from a handle opened by the InternetOpenUrl, FtpOpenFile, or HttpOpenRequest function.
     * @param {Pointer<Void>} hFile Handle returned from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a>, 
     * or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a>.
     * @param {Pointer} lpBuffer Pointer to a buffer that receives the data.
     * @param {Integer} dwNumberOfBytesToRead Number of bytes to be read.
     * @param {Pointer<Integer>} lpdwNumberOfBytesRead Pointer to a variable that receives the number of bytes read. 
     * <b>InternetReadFile</b> sets this value to zero before doing any work or error checking.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> when necessary.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetreadfile
     * @since windows5.0
     */
    static InternetReadFile(hFile, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead) {
        hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
        lpdwNumberOfBytesReadMarshal := lpdwNumberOfBytesRead is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetReadFile", hFileMarshal, hFile, "ptr", lpBuffer, "uint", dwNumberOfBytesToRead, lpdwNumberOfBytesReadMarshal, lpdwNumberOfBytesRead, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads data from a handle opened by the InternetOpenUrl or HttpOpenRequest function.
     * @param {Pointer<Void>} hFile Handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
     * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersOut Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_buffersa">INTERNET_BUFFERS</a> structure that receives the data downloaded.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext A caller supplied context value used for asynchronous operations.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> when necessary.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetreadfileexa
     * @since windows5.0
     */
    static InternetReadFileExA(hFile, lpBuffersOut, dwFlags, dwContext) {
        hFileMarshal := hFile is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetReadFileExA", hFileMarshal, hFile, "ptr", lpBuffersOut, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads data from a handle opened by the InternetOpenUrl or HttpOpenRequest function.
     * @param {Pointer<Void>} hFile Handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
     * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersOut Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_buffersa">INTERNET_BUFFERS</a> structure that receives the data downloaded.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext A caller supplied context value used for asynchronous operations.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> when necessary.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetreadfileexw
     * @since windows5.0
     */
    static InternetReadFileExW(hFile, lpBuffersOut, dwFlags, dwContext) {
        hFileMarshal := hFile is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetReadFileExW", hFileMarshal, hFile, "ptr", lpBuffersOut, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets a file position for InternetReadFile. This is a synchronous call; however, subsequent calls to InternetReadFile might block or return pending if the data is not available from the cache and the server does not support random access.
     * @param {Pointer<Void>} hFile Handle returned from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> (on an HTTP or HTTPS
     * 						URL) or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> (using the GET or HEAD HTTP verb and passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>). This handle must not have been created with the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_DONT_CACHE</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/api-flags">INTERNET_FLAG_NO_CACHE_WRITE</a> value set.
     * @param {Integer} lDistanceToMove The low order 32-bits of a signed 64-bit number of bytes to move the file pointer. <b>Internet Explorer 7 and earlier:  </b><b>InternetSetFilePointer</b> used to move the pointer only within the bounds of  a LONG. When calling this older version of the function, <i>lpDistanceToMoveHigh</i> is reserved and should be set to <b>0</b>. A positive value moves the pointer forward in the file; a negative value moves it backward.
     * @param {Pointer<Integer>} lpDistanceToMoveHigh A pointer to the high order 32-bits of the signed 64-bit distance to move. If you do not need the high order 32-bits, this pointer must  be set to <b>NULL</b>.  When not <b>NULL</b>, this parameter also receives the high order DWORD of the new value of the file pointer. A positive value moves the pointer forward in the file; a negative value moves it backward.<b>Internet Explorer 7 and earlier:  </b><b>InternetSetFilePointer</b> used to move the pointer only within the bounds of  a LONG. When calling this older version of the function, <i>lpDistanceToMoveHigh</i> is reserved and should be set to <b>0</b>.
     * @param {Integer} dwMoveMethod 
     * @returns {Integer} I the function succeeds, it returns the current file position.     A return value of <b>INVALID_SET_FILE_POINTER</b> indicates a potential failure and needs to be followed by be a call to <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.  
     * 
     * Since <b>INVALID_SET_FILE_POINTER</b> is a valid value for the  low-order DWORD of the new file pointer, the caller must check both the
     * return value of the function and the error code returned by <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to determine whether or not an error has occurred.   If an error has occurred, the return value of InternetSetFilePointer        is <b>INVALID_SET_FILE_POINTER</b> and <b>GetLastError</b> returns a value other than <b>NO_ERROR</b>.
     * 
     * If the function succeeds and <i>lpDistanceToMoveHigh</i> is <b>NULL</b>, the return value is the low-order <b>DWORD</b> of the new file pointer.
     * 
     * Note that if the function returns a value other than <b>INVALID_SET_FILE_POINTER</b>, the call to <b>InternetSetFilePointer</b>has succeeded and there is no need to call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the function succeeds and <i>lpDistanceToMoveHigh</i> is not <b>NULL</b>, the return value is the lower-order <b>DWORD</b> of the new file pointer and <i>lpDistanceToMoveHigh</i> contains the high order <b>DWORD</b> of the new file pointer.
     * 
     * If a new file pointer is a negative value, the function fails, the file pointer is not moved, and the code returned by <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> is <b>ERROR_NEGATIVE_SEEK</b>.
     * 
     * If <i>lpDistanceToMoveHigh</i> is <b>NULL</b> and the new file position does not fit in a 32-bit value the function fails and returns <b>INVALID_SET_FILE_POINTER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetfilepointer
     * @since windows5.0
     */
    static InternetSetFilePointer(hFile, lDistanceToMove, lpDistanceToMoveHigh, dwMoveMethod) {
        static dwContext := 0 ;Reserved parameters must always be NULL

        hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
        lpDistanceToMoveHighMarshal := lpDistanceToMoveHigh is VarRef ? "int*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetSetFilePointer", hFileMarshal, hFile, "int", lDistanceToMove, lpDistanceToMoveHighMarshal, lpDistanceToMoveHigh, "uint", dwMoveMethod, "ptr", dwContext, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes data to an open Internet file.
     * @param {Pointer<Void>} hFile Handle returned from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a> or an 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/appendix-a-hinternet-handles">HINTERNET</a> handle sent by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>.
     * @param {Pointer} lpBuffer Pointer to a buffer that contains the data to be written to the file.
     * @param {Integer} dwNumberOfBytesToWrite Number of bytes to be written to the file.
     * @param {Pointer<Integer>} lpdwNumberOfBytesWritten Pointer to a variable that receives the number of bytes written to the file. 
     * <b>InternetWriteFile</b> sets this value to zero before doing any work or error checking.
     * @returns {BOOL} Returns TRUE if the function succeeds, or FALSE otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. An application can also use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> when necessary.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetwritefile
     * @since windows5.0
     */
    static InternetWriteFile(hFile, lpBuffer, dwNumberOfBytesToWrite, lpdwNumberOfBytesWritten) {
        hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
        lpdwNumberOfBytesWrittenMarshal := lpdwNumberOfBytesWritten is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetWriteFile", hFileMarshal, hFile, "ptr", lpBuffer, "uint", dwNumberOfBytesToWrite, lpdwNumberOfBytesWrittenMarshal, lpdwNumberOfBytesWritten, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Queries the server to determine the amount of data available.
     * @param {Pointer<Void>} hFile Handle returned by 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopheropenfilea">GopherOpenFile</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
     * @param {Pointer<Integer>} lpdwNumberOfBytesAvailable Pointer to a variable that receives the number of available bytes. May be <b>NULL</b>.
     * @param {Integer} dwFlags This parameter is reserved and must be 0.
     * @param {Pointer} dwContext This parameter is reserved and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
     * <b>GetLastError</b> returns ERROR_NO_MORE_FILES.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetquerydataavailable
     * @since windows5.0
     */
    static InternetQueryDataAvailable(hFile, lpdwNumberOfBytesAvailable, dwFlags, dwContext) {
        hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
        lpdwNumberOfBytesAvailableMarshal := lpdwNumberOfBytesAvailable is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetQueryDataAvailable", hFileMarshal, hFile, lpdwNumberOfBytesAvailableMarshal, lpdwNumberOfBytesAvailable, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Continues a file search started as a result of a previous call to FtpFindFirstFile.Windows XP and Windows Server 2003 R2 and earlier:  Or continues a file search as a result of a previous call to GopherFindFirstFile.
     * @param {Pointer<Void>} hFind Handle returned from either 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpfindfirstfilea">FtpFindFirstFile</a> or  
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> (directories only).
     * 
     * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>Also a handle returned from <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a>.
     * @param {Pointer<Void>} lpvFindData Pointer to the buffer that receives information about the  file or directory. The format of the information placed in the buffer depends on the protocol in use. The FTP protocol returns a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure.
     * 
     * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>The Gopher protocol returns a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_find_dataa">GOPHER_FIND_DATA</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
     * <b>GetLastError</b> returns <b>ERROR_NO_MORE_FILES</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetfindnextfilea
     * @since windows5.0
     */
    static InternetFindNextFileA(hFind, lpvFindData) {
        hFindMarshal := hFind is VarRef ? "ptr" : "ptr"
        lpvFindDataMarshal := lpvFindData is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetFindNextFileA", hFindMarshal, hFind, lpvFindDataMarshal, lpvFindData, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Continues a file search started as a result of a previous call to FtpFindFirstFile.Windows XP and Windows Server 2003 R2 and earlier:  Or continues a file search as a result of a previous call to GopherFindFirstFile.
     * @param {Pointer<Void>} hFind Handle returned from either 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpfindfirstfilea">FtpFindFirstFile</a> or  
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> (directories only).
     * 
     * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>Also a handle returned from <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a>.
     * @param {Pointer<Void>} lpvFindData Pointer to the buffer that receives information about the  file or directory. The format of the information placed in the buffer depends on the protocol in use. The FTP protocol returns a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure.
     * 
     * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>The Gopher protocol returns a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_find_dataa">GOPHER_FIND_DATA</a> structure.
     * @returns {BOOL} Returns <b>TRUE</b> if the function succeeds, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
     * <b>GetLastError</b> returns <b>ERROR_NO_MORE_FILES</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetfindnextfilew
     * @since windows5.0
     */
    static InternetFindNextFileW(hFind, lpvFindData) {
        hFindMarshal := hFind is VarRef ? "ptr" : "ptr"
        lpvFindDataMarshal := lpvFindData is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetFindNextFileW", hFindMarshal, hFind, lpvFindDataMarshal, lpvFindData, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Queries an Internet option on the specified handle.
     * @param {Pointer<Void>} hInternet Handle on which to query information.
     * @param {Integer} dwOption Internet option to be queried. This can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/option-flags">Option Flags</a> values.
     * @param {Pointer} lpBuffer Pointer to a buffer that receives the option setting. Strings returned by 
     * <b>InternetQueryOption</b> are globally allocated, so the calling application must  free them when it  is finished using them.
     * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of 
     * <i>lpBuffer</i>, in bytes.  When 
     * <b>InternetQueryOption</b> returns, 
     * <i>lpdwBufferLength</i> specifies the size of the data placed into 
     * <i>lpBuffer</i>. If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter points to the number of bytes required to hold the requested information.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetqueryoptiona
     * @since windows5.0
     */
    static InternetQueryOptionA(hInternet, dwOption, lpBuffer, lpdwBufferLength) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetQueryOptionA", hInternetMarshal, hInternet, "uint", dwOption, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Queries an Internet option on the specified handle.
     * @param {Pointer<Void>} hInternet Handle on which to query information.
     * @param {Integer} dwOption Internet option to be queried. This can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/option-flags">Option Flags</a> values.
     * @param {Pointer} lpBuffer Pointer to a buffer that receives the option setting. Strings returned by 
     * <b>InternetQueryOption</b> are globally allocated, so the calling application must  free them when it  is finished using them.
     * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of 
     * <i>lpBuffer</i>, in bytes.  When 
     * <b>InternetQueryOption</b> returns, 
     * <i>lpdwBufferLength</i> specifies the size of the data placed into 
     * <i>lpBuffer</i>. If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_INSUFFICIENT_BUFFER, this parameter points to the number of bytes required to hold the requested information.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetqueryoptionw
     * @since windows5.0
     */
    static InternetQueryOptionW(hInternet, dwOption, lpBuffer, lpdwBufferLength) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetQueryOptionW", hInternetMarshal, hInternet, "uint", dwOption, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets an Internet option.
     * @param {Pointer<Void>} hInternet Handle on which to set information.
     * @param {Integer} dwOption Internet option to be set. This can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/option-flags">Option Flags</a> values.
     * @param {Pointer<Void>} lpBuffer Pointer to a buffer that contains the option setting.
     * @param {Integer} dwBufferLength Size of the 
     * <i>lpBuffer</i> buffer.  If 
     * <i>lpBuffer</i> contains a string, 
     * the size is in <b>TCHARs</b>.  If 
     * <i>lpBuffer</i> contains anything other than a string, 
     * the size is in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetoptiona
     * @since windows5.0
     */
    static InternetSetOptionA(hInternet, dwOption, lpBuffer, dwBufferLength) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetSetOptionA", hInternetMarshal, hInternet, "uint", dwOption, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets an Internet option.
     * @param {Pointer<Void>} hInternet Handle on which to set information.
     * @param {Integer} dwOption Internet option to be set. This can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/option-flags">Option Flags</a> values.
     * @param {Pointer<Void>} lpBuffer Pointer to a buffer that contains the option setting.
     * @param {Integer} dwBufferLength Size of the 
     * <i>lpBuffer</i> buffer.  If 
     * <i>lpBuffer</i> contains a string, 
     * the size is in <b>TCHARs</b>.  If 
     * <i>lpBuffer</i> contains anything other than a string, 
     * the size is in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetoptionw
     * @since windows5.0
     */
    static InternetSetOptionW(hInternet, dwOption, lpBuffer, dwBufferLength) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetSetOptionW", hInternetMarshal, hInternet, "uint", dwOption, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Not supported.Implemented only as a stub that calls the InternetSetOption function; InternetSetOptionEx has no functionality of its own. Do not use this function at this time.
     * @param {Pointer<Void>} hInternet Unused.
     * @param {Integer} dwOption Unused.
     * @param {Pointer<Void>} lpBuffer Unused.
     * @param {Integer} dwBufferLength Unused.
     * @param {Integer} dwFlags Unused.
     * @returns {BOOL} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetoptionexa
     * @since windows5.0
     */
    static InternetSetOptionExA(hInternet, dwOption, lpBuffer, dwBufferLength, dwFlags) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\InternetSetOptionExA", hInternetMarshal, hInternet, "uint", dwOption, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, "uint", dwFlags, "int")
        return result
    }

    /**
     * Not supported.Implemented only as a stub that calls the InternetSetOption function; InternetSetOptionEx has no functionality of its own. Do not use this function at this time.
     * @param {Pointer<Void>} hInternet Unused.
     * @param {Integer} dwOption Unused.
     * @param {Pointer<Void>} lpBuffer Unused.
     * @param {Integer} dwBufferLength Unused.
     * @param {Integer} dwFlags Unused.
     * @returns {BOOL} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetoptionexw
     * @since windows5.0
     */
    static InternetSetOptionExW(hInternet, dwOption, lpBuffer, dwBufferLength, dwFlags) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\InternetSetOptionExW", hInternetMarshal, hInternet, "uint", dwOption, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, "uint", dwFlags, "int")
        return result
    }

    /**
     * Places a lock on the file that is being used.
     * @param {Pointer<Void>} hInternet Handle returned by 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopheropenfilea">GopherOpenFile</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> function.
     * @param {Pointer<HANDLE>} lphLockRequestInfo Pointer to a handle that receives the lock request handle.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetlockrequestfile
     * @since windows5.0
     */
    static InternetLockRequestFile(hInternet, lphLockRequestInfo) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetLockRequestFile", hInternetMarshal, hInternet, "ptr", lphLockRequestInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unlocks a file that was locked using InternetLockRequestFile.
     * @param {HANDLE} hLockRequestInfo Handle to a lock request that was returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetlockrequestfile">InternetLockRequestFile</a>.
     * @returns {BOOL} Returns TRUE if successful, or FALSE otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetunlockrequestfile
     * @since windows5.0
     */
    static InternetUnlockRequestFile(hLockRequestInfo) {
        hLockRequestInfo := hLockRequestInfo is Win32Handle ? NumGet(hLockRequestInfo, "ptr") : hLockRequestInfo

        A_LastError := 0

        result := DllCall("WININET.dll\InternetUnlockRequestFile", "ptr", hLockRequestInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the last error description or server response on the thread calling this function.
     * @param {Pointer<Integer>} lpdwError Pointer to a variable that receives an error message pertaining to the operation that failed.
     * @param {PSTR} lpszBuffer Pointer to a buffer that receives the error text.
     * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of the 
     * <i>lpszBuffer</i> buffer, in <b>TCHARs</b>. When the function returns, this parameter contains the size of the string written to the buffer, not including the terminating zero.
     * @returns {BOOL} Returns <b>TRUE</b> if error text was successfully written to the buffer, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the buffer is too small to hold all the error text, 
     * <b>GetLastError</b> returns <b>ERROR_INSUFFICIENT_BUFFER</b>, and the 
     * <i>lpdwBufferLength</i> parameter contains the minimum buffer size required to return all the error text.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetlastresponseinfoa
     * @since windows5.0
     */
    static InternetGetLastResponseInfoA(lpdwError, lpszBuffer, lpdwBufferLength) {
        lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

        lpdwErrorMarshal := lpdwError is VarRef ? "uint*" : "ptr"
        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetLastResponseInfoA", lpdwErrorMarshal, lpdwError, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the last error description or server response on the thread calling this function.
     * @param {Pointer<Integer>} lpdwError Pointer to a variable that receives an error message pertaining to the operation that failed.
     * @param {PWSTR} lpszBuffer Pointer to a buffer that receives the error text.
     * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the size of the 
     * <i>lpszBuffer</i> buffer, in <b>TCHARs</b>. When the function returns, this parameter contains the size of the string written to the buffer, not including the terminating zero.
     * @returns {BOOL} Returns <b>TRUE</b> if error text was successfully written to the buffer, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the buffer is too small to hold all the error text, 
     * <b>GetLastError</b> returns <b>ERROR_INSUFFICIENT_BUFFER</b>, and the 
     * <i>lpdwBufferLength</i> parameter contains the minimum buffer size required to return all the error text.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetlastresponseinfow
     * @since windows5.0
     */
    static InternetGetLastResponseInfoW(lpdwError, lpszBuffer, lpdwBufferLength) {
        lpszBuffer := lpszBuffer is String ? StrPtr(lpszBuffer) : lpszBuffer

        lpdwErrorMarshal := lpdwError is VarRef ? "uint*" : "ptr"
        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetLastResponseInfoW", lpdwErrorMarshal, lpdwError, "ptr", lpszBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hInternet The handle for which the callback is set.
     * @param {Pointer<LPINTERNET_STATUS_CALLBACK>} lpfnInternetCallback A pointer to the callback function to call when progress is made, or  <b>NULL</b> to remove the existing callback function. For more information about the callback function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-internet_status_callback">InternetStatusCallback</a>.
     * @returns {Pointer<LPINTERNET_STATUS_CALLBACK>} Returns the previously defined status callback function if successful, <b>NULL</b> if there was no previously defined status callback function, or INTERNET_INVALID_STATUS_CALLBACK if the callback function is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetstatuscallbacka
     */
    static InternetSetStatusCallbackA(hInternet, lpfnInternetCallback) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\InternetSetStatusCallbackA", hInternetMarshal, hInternet, "ptr", lpfnInternetCallback, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hInternet The handle for which the callback is set.
     * @param {Pointer<LPINTERNET_STATUS_CALLBACK>} lpfnInternetCallback A pointer to the callback function to call when progress is made, or  <b>NULL</b> to remove the existing callback function. For more information about the callback function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-internet_status_callback">InternetStatusCallback</a>.
     * @returns {Pointer<LPINTERNET_STATUS_CALLBACK>} Returns the previously defined status callback function if successful, <b>NULL</b> if there was no previously defined status callback function, or INTERNET_INVALID_STATUS_CALLBACK if the callback function is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetstatuscallbackw
     */
    static InternetSetStatusCallbackW(hInternet, lpfnInternetCallback) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\InternetSetStatusCallbackW", hInternetMarshal, hInternet, "ptr", lpfnInternetCallback, "ptr")
        return result
    }

    /**
     * Sets up a callback function that WinINet functions can call as progress is made during an operation.
     * @param {Pointer<Void>} hInternet The handle for which the callback is set.
     * @param {Pointer<LPINTERNET_STATUS_CALLBACK>} lpfnInternetCallback A pointer to the callback function to call when progress is made, or  <b>NULL</b> to remove the existing callback function. For more information about the callback function, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-internet_status_callback">InternetStatusCallback</a>.
     * @returns {Pointer<LPINTERNET_STATUS_CALLBACK>} Returns the previously defined status callback function if successful, <b>NULL</b> if there was no previously defined status callback function, or INTERNET_INVALID_STATUS_CALLBACK if the callback function is not valid.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetstatuscallback
     * @since windows5.0
     */
    static InternetSetStatusCallback(hInternet, lpfnInternetCallback) {
        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\InternetSetStatusCallback", hInternetMarshal, hInternet, "ptr", lpfnInternetCallback, "ptr")
        return result
    }

    /**
     * Searches the specified directory of the given FTP session. File and directory entries are returned to the application in the WIN32_FIND_DATA structure.
     * @param {Pointer<Void>} hConnect Handle to an FTP session returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PSTR} lpszSearchFile Pointer to a <b>null</b>-terminated string that specifies a valid directory path or file name for the FTP server's file system. The string can contain wildcards, but no blank spaces are allowed. If the value of 
     * <i>lpszSearchFile</i> is <b>NULL</b> or if it is an empty string, the function  finds the first file in the current directory on the server.
     * @param {Pointer<WIN32_FIND_DATAA>} lpFindFileData Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure that receives information about the found file or directory.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext Pointer to a variable that specifies the application-defined value that associates this search with any application data. This parameter is used only if the application has already called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
     * @returns {Pointer<Void>} Returns a valid handle for the request if the directory enumeration was started successfully, or returns <b>NULL</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If <b>GetLastError</b> returns ERROR_INTERNET_EXTENDED_ERROR, as in the case where the function finds no matching files, call the 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> function to retrieve the extended error text, as documented in <a href="/windows/desktop/WinInet/appendix-c-handling-errors">Handling Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpfindfirstfilea
     * @since windows5.0
     */
    static FtpFindFirstFileA(hConnect, lpszSearchFile, lpFindFileData, dwFlags, dwContext) {
        lpszSearchFile := lpszSearchFile is String ? StrPtr(lpszSearchFile) : lpszSearchFile

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpFindFirstFileA", hConnectMarshal, hConnect, "ptr", lpszSearchFile, "ptr", lpFindFileData, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the specified directory of the given FTP session. File and directory entries are returned to the application in the WIN32_FIND_DATA structure.
     * @param {Pointer<Void>} hConnect Handle to an FTP session returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PWSTR} lpszSearchFile Pointer to a <b>null</b>-terminated string that specifies a valid directory path or file name for the FTP server's file system. The string can contain wildcards, but no blank spaces are allowed. If the value of 
     * <i>lpszSearchFile</i> is <b>NULL</b> or if it is an empty string, the function  finds the first file in the current directory on the server.
     * @param {Pointer<WIN32_FIND_DATAW>} lpFindFileData Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure that receives information about the found file or directory.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext Pointer to a variable that specifies the application-defined value that associates this search with any application data. This parameter is used only if the application has already called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
     * @returns {Pointer<Void>} Returns a valid handle for the request if the directory enumeration was started successfully, or returns <b>NULL</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If <b>GetLastError</b> returns ERROR_INTERNET_EXTENDED_ERROR, as in the case where the function finds no matching files, call the 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> function to retrieve the extended error text, as documented in <a href="/windows/desktop/WinInet/appendix-c-handling-errors">Handling Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpfindfirstfilew
     * @since windows5.0
     */
    static FtpFindFirstFileW(hConnect, lpszSearchFile, lpFindFileData, dwFlags, dwContext) {
        lpszSearchFile := lpszSearchFile is String ? StrPtr(lpszSearchFile) : lpszSearchFile

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpFindFirstFileW", hConnectMarshal, hConnect, "ptr", lpszSearchFile, "ptr", lpFindFileData, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a file from the FTP server and stores it under the specified file name, creating a new local file in the process.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PSTR} lpszRemoteFile Pointer to a null-terminated string that contains the name of the file to be retrieved.
     * @param {PSTR} lpszNewFile Pointer to a null-terminated string that contains the name of the file to be created on the local system.
     * @param {BOOL} fFailIfExists Indicates whether the function should proceed if a local file of the specified name already exists. If 
     * <i>fFailIfExists</i> is <b>TRUE</b> and the local file exists, 
     * <b>FtpGetFile</b> fails.
     * @param {Integer} dwFlagsAndAttributes File attributes for the new file. This parameter can be any combination of the FILE_ATTRIBUTE_* flags used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * @param {Integer} dwFlags Controls how the function will handle the file download. The first set of flag values indicates the conditions under which the transfer occurs. These transfer type flags can be used in combination with the second set of flags that control caching.
     * 
     * 
     * The application can select one of these transfer type values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FTP_TRANSFER_TYPE_ASCII"></a><a id="ftp_transfer_type_ascii"></a><dl>
     * <dt><b>FTP_TRANSFER_TYPE_ASCII</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transfers the file using FTP's ASCII (Type A) transfer method. Control and formatting information is converted to local equivalents.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FTP_TRANSFER_TYPE_BINARY"></a><a id="ftp_transfer_type_binary"></a><dl>
     * <dt><b>FTP_TRANSFER_TYPE_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transfers the file using FTP's Image (Type I) transfer method. The file is transferred exactly as it exists with no changes. This is the default transfer method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FTP_TRANSFER_TYPE_UNKNOWN"></a><a id="ftp_transfer_type_unknown"></a><dl>
     * <dt><b>FTP_TRANSFER_TYPE_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Defaults to FTP_TRANSFER_TYPE_BINARY.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_TRANSFER_ASCII"></a><a id="internet_flag_transfer_ascii"></a><dl>
     * <dt><b>INTERNET_FLAG_TRANSFER_ASCII</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transfers the file as ASCII.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_TRANSFER_BINARY"></a><a id="internet_flag_transfer_binary"></a><dl>
     * <dt><b>INTERNET_FLAG_TRANSFER_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transfers the file as binary.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following flags determine how the caching of this file will be done. Any combination of the following flags can be used with the transfer type flag.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_HYPERLINK"></a><a id="internet_flag_hyperlink"></a><dl>
     * <dt><b>INTERNET_FLAG_HYPERLINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a reload if there was no Expires time and no LastModified time returned from the server when determining whether to reload the item from the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_NEED_FILE"></a><a id="internet_flag_need_file"></a><dl>
     * <dt><b>INTERNET_FLAG_NEED_FILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes a temporary file to be created if the file cannot be cached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_RELOAD"></a><a id="internet_flag_reload"></a><dl>
     * <dt><b>INTERNET_FLAG_RELOAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a download of the requested file, object, or directory listing from the origin server, not from the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_RESYNCHRONIZE"></a><a id="internet_flag_resynchronize"></a><dl>
     * <dt><b>INTERNET_FLAG_RESYNCHRONIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reloads HTTP resources if the resource has been modified since the last time it was downloaded. All FTP resources are reloaded.
     * 
     * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>Gopher resources are also reloaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This is used only if the application has already called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpgetfilea
     * @since windows5.0
     */
    static FtpGetFileA(hConnect, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext) {
        lpszRemoteFile := lpszRemoteFile is String ? StrPtr(lpszRemoteFile) : lpszRemoteFile
        lpszNewFile := lpszNewFile is String ? StrPtr(lpszNewFile) : lpszNewFile

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpGetFileA", hConnectMarshal, hConnect, "ptr", lpszRemoteFile, "ptr", lpszNewFile, "int", fFailIfExists, "uint", dwFlagsAndAttributes, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a file from the FTP server and stores it under the specified file name, creating a new local file in the process.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PWSTR} lpszRemoteFile Pointer to a null-terminated string that contains the name of the file to be retrieved.
     * @param {PWSTR} lpszNewFile Pointer to a null-terminated string that contains the name of the file to be created on the local system.
     * @param {BOOL} fFailIfExists Indicates whether the function should proceed if a local file of the specified name already exists. If 
     * <i>fFailIfExists</i> is <b>TRUE</b> and the local file exists, 
     * <b>FtpGetFile</b> fails.
     * @param {Integer} dwFlagsAndAttributes File attributes for the new file. This parameter can be any combination of the FILE_ATTRIBUTE_* flags used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * @param {Integer} dwFlags Controls how the function will handle the file download. The first set of flag values indicates the conditions under which the transfer occurs. These transfer type flags can be used in combination with the second set of flags that control caching.
     * 
     * 
     * The application can select one of these transfer type values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FTP_TRANSFER_TYPE_ASCII"></a><a id="ftp_transfer_type_ascii"></a><dl>
     * <dt><b>FTP_TRANSFER_TYPE_ASCII</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transfers the file using FTP's ASCII (Type A) transfer method. Control and formatting information is converted to local equivalents.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FTP_TRANSFER_TYPE_BINARY"></a><a id="ftp_transfer_type_binary"></a><dl>
     * <dt><b>FTP_TRANSFER_TYPE_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transfers the file using FTP's Image (Type I) transfer method. The file is transferred exactly as it exists with no changes. This is the default transfer method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FTP_TRANSFER_TYPE_UNKNOWN"></a><a id="ftp_transfer_type_unknown"></a><dl>
     * <dt><b>FTP_TRANSFER_TYPE_UNKNOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Defaults to FTP_TRANSFER_TYPE_BINARY.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_TRANSFER_ASCII"></a><a id="internet_flag_transfer_ascii"></a><dl>
     * <dt><b>INTERNET_FLAG_TRANSFER_ASCII</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transfers the file as ASCII.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_TRANSFER_BINARY"></a><a id="internet_flag_transfer_binary"></a><dl>
     * <dt><b>INTERNET_FLAG_TRANSFER_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transfers the file as binary.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following flags determine how the caching of this file will be done. Any combination of the following flags can be used with the transfer type flag.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_HYPERLINK"></a><a id="internet_flag_hyperlink"></a><dl>
     * <dt><b>INTERNET_FLAG_HYPERLINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a reload if there was no Expires time and no LastModified time returned from the server when determining whether to reload the item from the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_NEED_FILE"></a><a id="internet_flag_need_file"></a><dl>
     * <dt><b>INTERNET_FLAG_NEED_FILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes a temporary file to be created if the file cannot be cached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_RELOAD"></a><a id="internet_flag_reload"></a><dl>
     * <dt><b>INTERNET_FLAG_RELOAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces a download of the requested file, object, or directory listing from the origin server, not from the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_RESYNCHRONIZE"></a><a id="internet_flag_resynchronize"></a><dl>
     * <dt><b>INTERNET_FLAG_RESYNCHRONIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reloads HTTP resources if the resource has been modified since the last time it was downloaded. All FTP resources are reloaded.
     * 
     * <b>Windows XP and Windows Server 2003 R2 and earlier:  </b>Gopher resources are also reloaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This is used only if the application has already called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpgetfilew
     * @since windows5.0
     */
    static FtpGetFileW(hConnect, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext) {
        lpszRemoteFile := lpszRemoteFile is String ? StrPtr(lpszRemoteFile) : lpszRemoteFile
        lpszNewFile := lpszNewFile is String ? StrPtr(lpszNewFile) : lpszNewFile

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpGetFileW", hConnectMarshal, hConnect, "ptr", lpszRemoteFile, "ptr", lpszNewFile, "int", fFailIfExists, "uint", dwFlagsAndAttributes, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Stores a file on the FTP server.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PSTR} lpszLocalFile Pointer to a null-terminated string that contains the name of the file to be sent from the local system.
     * @param {PSTR} lpszNewRemoteFile Pointer to a null-terminated string that contains the name of the file to be created on the remote system.
     * @param {Integer} dwFlags Conditions under which the transfers occur. The application should select one transfer type and any of the flags that control how the caching of the file will be controlled.
     * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This parameter is used only if the application has already called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpputfilea
     * @since windows5.0
     */
    static FtpPutFileA(hConnect, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext) {
        lpszLocalFile := lpszLocalFile is String ? StrPtr(lpszLocalFile) : lpszLocalFile
        lpszNewRemoteFile := lpszNewRemoteFile is String ? StrPtr(lpszNewRemoteFile) : lpszNewRemoteFile

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpPutFileA", hConnectMarshal, hConnect, "ptr", lpszLocalFile, "ptr", lpszNewRemoteFile, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Stores a file on the FTP server.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PWSTR} lpszLocalFile Pointer to a null-terminated string that contains the name of the file to be sent from the local system.
     * @param {PWSTR} lpszNewRemoteFile Pointer to a null-terminated string that contains the name of the file to be created on the remote system.
     * @param {Integer} dwFlags Conditions under which the transfers occur. The application should select one transfer type and any of the flags that control how the caching of the file will be controlled.
     * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This parameter is used only if the application has already called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpputfilew
     * @since windows5.0
     */
    static FtpPutFileW(hConnect, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext) {
        lpszLocalFile := lpszLocalFile is String ? StrPtr(lpszLocalFile) : lpszLocalFile
        lpszNewRemoteFile := lpszNewRemoteFile is String ? StrPtr(lpszNewRemoteFile) : lpszNewRemoteFile

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpPutFileW", hConnectMarshal, hConnect, "ptr", lpszLocalFile, "ptr", lpszNewRemoteFile, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hFtpSession 
     * @param {PSTR} lpszRemoteFile 
     * @param {PWSTR} lpszNewFile 
     * @param {BOOL} fFailIfExists 
     * @param {Integer} dwFlagsAndAttributes 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext 
     * @returns {BOOL} 
     */
    static FtpGetFileEx(hFtpSession, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext) {
        lpszRemoteFile := lpszRemoteFile is String ? StrPtr(lpszRemoteFile) : lpszRemoteFile
        lpszNewFile := lpszNewFile is String ? StrPtr(lpszNewFile) : lpszNewFile

        hFtpSessionMarshal := hFtpSession is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\FtpGetFileEx", hFtpSessionMarshal, hFtpSession, "ptr", lpszRemoteFile, "ptr", lpszNewFile, "int", fFailIfExists, "uint", dwFlagsAndAttributes, "uint", dwFlags, "ptr", dwContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hFtpSession 
     * @param {PWSTR} lpszLocalFile 
     * @param {PSTR} lpszNewRemoteFile 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext 
     * @returns {BOOL} 
     */
    static FtpPutFileEx(hFtpSession, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext) {
        lpszLocalFile := lpszLocalFile is String ? StrPtr(lpszLocalFile) : lpszLocalFile
        lpszNewRemoteFile := lpszNewRemoteFile is String ? StrPtr(lpszNewRemoteFile) : lpszNewRemoteFile

        hFtpSessionMarshal := hFtpSession is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\FtpPutFileEx", hFtpSessionMarshal, hFtpSession, "ptr", lpszLocalFile, "ptr", lpszNewRemoteFile, "uint", dwFlags, "ptr", dwContext, "int")
        return result
    }

    /**
     * Deletes a file stored on the FTP server.
     * @param {Pointer<Void>} hConnect Handle returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> using <b>INTERNET_SERVICE_FTP</b>.
     * @param {PSTR} lpszFileName Pointer to a null-terminated string that contains the name of the file to be deleted.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpdeletefilea
     * @since windows5.0
     */
    static FtpDeleteFileA(hConnect, lpszFileName) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpDeleteFileA", hConnectMarshal, hConnect, "ptr", lpszFileName, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a file stored on the FTP server.
     * @param {Pointer<Void>} hConnect Handle returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> using <b>INTERNET_SERVICE_FTP</b>.
     * @param {PWSTR} lpszFileName Pointer to a null-terminated string that contains the name of the file to be deleted.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpdeletefilew
     * @since windows5.0
     */
    static FtpDeleteFileW(hConnect, lpszFileName) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpDeleteFileW", hConnectMarshal, hConnect, "ptr", lpszFileName, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Renames a file stored on the FTP server.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PSTR} lpszExisting Pointer to a null-terminated string that contains the name of the file to be renamed.
     * @param {PSTR} lpszNew Pointer to a null-terminated string that contains the new name for the remote file.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftprenamefilea
     * @since windows5.0
     */
    static FtpRenameFileA(hConnect, lpszExisting, lpszNew) {
        lpszExisting := lpszExisting is String ? StrPtr(lpszExisting) : lpszExisting
        lpszNew := lpszNew is String ? StrPtr(lpszNew) : lpszNew

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpRenameFileA", hConnectMarshal, hConnect, "ptr", lpszExisting, "ptr", lpszNew, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Renames a file stored on the FTP server.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PWSTR} lpszExisting Pointer to a null-terminated string that contains the name of the file to be renamed.
     * @param {PWSTR} lpszNew Pointer to a null-terminated string that contains the new name for the remote file.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftprenamefilew
     * @since windows5.0
     */
    static FtpRenameFileW(hConnect, lpszExisting, lpszNew) {
        lpszExisting := lpszExisting is String ? StrPtr(lpszExisting) : lpszExisting
        lpszNew := lpszNew is String ? StrPtr(lpszNew) : lpszNew

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpRenameFileW", hConnectMarshal, hConnect, "ptr", lpszExisting, "ptr", lpszNew, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initiates access to a remote file on an FTP server for reading or writing.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PSTR} lpszFileName Pointer to a null-terminated string that contains the name of the file to be accessed.
     * @param {Integer} dwAccess File  access. This parameter can be <b>GENERIC_READ</b> or <b>GENERIC_WRITE</b>, but not both.
     * @param {Integer} dwFlags Conditions under which the transfers occur. The application should select one transfer type and any of the flags that indicate how the caching of the file will be controlled.
     * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This is only used if the application has already called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
     * @returns {Pointer<Void>} Returns a handle if successful, or <b>NULL</b> otherwise. To retrieve a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpopenfilea
     * @since windows5.0
     */
    static FtpOpenFileA(hConnect, lpszFileName, dwAccess, dwFlags, dwContext) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpOpenFileA", hConnectMarshal, hConnect, "ptr", lpszFileName, "uint", dwAccess, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initiates access to a remote file on an FTP server for reading or writing.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PWSTR} lpszFileName Pointer to a null-terminated string that contains the name of the file to be accessed.
     * @param {Integer} dwAccess File  access. This parameter can be <b>GENERIC_READ</b> or <b>GENERIC_WRITE</b>, but not both.
     * @param {Integer} dwFlags Conditions under which the transfers occur. The application should select one transfer type and any of the flags that indicate how the caching of the file will be controlled.
     * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data. This is only used if the application has already called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetsetstatuscallback">InternetSetStatusCallback</a> to set up a status callback function.
     * @returns {Pointer<Void>} Returns a handle if successful, or <b>NULL</b> otherwise. To retrieve a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpopenfilew
     * @since windows5.0
     */
    static FtpOpenFileW(hConnect, lpszFileName, dwAccess, dwFlags, dwContext) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpOpenFileW", hConnectMarshal, hConnect, "ptr", lpszFileName, "uint", dwAccess, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new directory on the FTP server.
     * @param {Pointer<Void>} hConnect Handle returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> using <b>INTERNET_SERVICE_FTP</b>.
     * @param {PSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to be created. This can be either a fully qualified path or a name relative to the current directory.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to create a directory, use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpcreatedirectorya
     * @since windows5.0
     */
    static FtpCreateDirectoryA(hConnect, lpszDirectory) {
        lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpCreateDirectoryA", hConnectMarshal, hConnect, "ptr", lpszDirectory, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new directory on the FTP server.
     * @param {Pointer<Void>} hConnect Handle returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a> using <b>INTERNET_SERVICE_FTP</b>.
     * @param {PWSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to be created. This can be either a fully qualified path or a name relative to the current directory.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to create a directory, use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpcreatedirectoryw
     * @since windows5.0
     */
    static FtpCreateDirectoryW(hConnect, lpszDirectory) {
        lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpCreateDirectoryW", hConnectMarshal, hConnect, "ptr", lpszDirectory, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes the specified directory on the FTP server.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to be removed. This can be either a fully qualified path or a name relative to the current directory.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to remove a directory, use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpremovedirectorya
     * @since windows5.0
     */
    static FtpRemoveDirectoryA(hConnect, lpszDirectory) {
        lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpRemoveDirectoryA", hConnectMarshal, hConnect, "ptr", lpszDirectory, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes the specified directory on the FTP server.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PWSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to be removed. This can be either a fully qualified path or a name relative to the current directory.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to remove a directory, use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpremovedirectoryw
     * @since windows5.0
     */
    static FtpRemoveDirectoryW(hConnect, lpszDirectory) {
        lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpRemoveDirectoryW", hConnectMarshal, hConnect, "ptr", lpszDirectory, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes to a different working directory on the FTP server.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to become the current working directory. This can be either a fully qualified path or a name relative to the current directory.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to change a directory, use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpsetcurrentdirectorya
     * @since windows5.0
     */
    static FtpSetCurrentDirectoryA(hConnect, lpszDirectory) {
        lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpSetCurrentDirectoryA", hConnectMarshal, hConnect, "ptr", lpszDirectory, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes to a different working directory on the FTP server.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PWSTR} lpszDirectory Pointer to a null-terminated string that contains the name of the directory to become the current working directory. This can be either a fully qualified path or a name relative to the current directory.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the error message indicates that the FTP server denied the request to change a directory, use 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a> to determine why.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpsetcurrentdirectoryw
     * @since windows5.0
     */
    static FtpSetCurrentDirectoryW(hConnect, lpszDirectory) {
        lpszDirectory := lpszDirectory is String ? StrPtr(lpszDirectory) : lpszDirectory

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpSetCurrentDirectoryW", hConnectMarshal, hConnect, "ptr", lpszDirectory, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current directory for the specified FTP session.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PSTR} lpszCurrentDirectory Pointer to a null-terminated string that receives the absolute path of the current directory.
     * @param {Pointer<Integer>} lpdwCurrentDirectory Pointer to a variable that specifies the length of the buffer, in <b>TCHARs</b>. The buffer length must include room for a terminating null character. Using a length of <b>MAX_PATH</b> is sufficient for all paths. When the function returns, the variable receives the number of characters copied into the buffer.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpgetcurrentdirectorya
     * @since windows5.0
     */
    static FtpGetCurrentDirectoryA(hConnect, lpszCurrentDirectory, lpdwCurrentDirectory) {
        lpszCurrentDirectory := lpszCurrentDirectory is String ? StrPtr(lpszCurrentDirectory) : lpszCurrentDirectory

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
        lpdwCurrentDirectoryMarshal := lpdwCurrentDirectory is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpGetCurrentDirectoryA", hConnectMarshal, hConnect, "ptr", lpszCurrentDirectory, lpdwCurrentDirectoryMarshal, lpdwCurrentDirectory, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current directory for the specified FTP session.
     * @param {Pointer<Void>} hConnect Handle to an FTP session.
     * @param {PWSTR} lpszCurrentDirectory Pointer to a null-terminated string that receives the absolute path of the current directory.
     * @param {Pointer<Integer>} lpdwCurrentDirectory Pointer to a variable that specifies the length of the buffer, in <b>TCHARs</b>. The buffer length must include room for a terminating null character. Using a length of <b>MAX_PATH</b> is sufficient for all paths. When the function returns, the variable receives the number of characters copied into the buffer.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpgetcurrentdirectoryw
     * @since windows5.0
     */
    static FtpGetCurrentDirectoryW(hConnect, lpszCurrentDirectory, lpdwCurrentDirectory) {
        lpszCurrentDirectory := lpszCurrentDirectory is String ? StrPtr(lpszCurrentDirectory) : lpszCurrentDirectory

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
        lpdwCurrentDirectoryMarshal := lpdwCurrentDirectory is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpGetCurrentDirectoryW", hConnectMarshal, hConnect, "ptr", lpszCurrentDirectory, lpdwCurrentDirectoryMarshal, lpdwCurrentDirectory, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends commands directly to an FTP server.
     * @param {Pointer<Void>} hConnect A handle returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {BOOL} fExpectResponse A Boolean value that indicates whether the application expects a data connection to be established by the FTP server. This must be set to <b>TRUE</b> if a data connection is expected, or <b>FALSE</b> otherwise.
     * @param {Integer} dwFlags 
     * @param {PSTR} lpszCommand A pointer to a string that contains the command to send to the FTP server.
     * @param {Pointer} dwContext A pointer to a variable that contains an application-defined value used to identify the application context in callback operations.
     * @param {Pointer<Pointer<Void>>} phFtpCommand A pointer to a handle that is created if a valid data socket is opened. The 
     * <i>fExpectResponse</i> parameter must be set to <b>TRUE</b> for 
     * <i>phFtpCommand</i> to be filled.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpcommanda
     * @since windows5.0
     */
    static FtpCommandA(hConnect, fExpectResponse, dwFlags, lpszCommand, dwContext, phFtpCommand) {
        lpszCommand := lpszCommand is String ? StrPtr(lpszCommand) : lpszCommand

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
        phFtpCommandMarshal := phFtpCommand is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpCommandA", hConnectMarshal, hConnect, "int", fExpectResponse, "uint", dwFlags, "ptr", lpszCommand, "ptr", dwContext, phFtpCommandMarshal, phFtpCommand, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends commands directly to an FTP server.
     * @param {Pointer<Void>} hConnect A handle returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {BOOL} fExpectResponse A Boolean value that indicates whether the application expects a data connection to be established by the FTP server. This must be set to <b>TRUE</b> if a data connection is expected, or <b>FALSE</b> otherwise.
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpszCommand A pointer to a string that contains the command to send to the FTP server.
     * @param {Pointer} dwContext A pointer to a variable that contains an application-defined value used to identify the application context in callback operations.
     * @param {Pointer<Pointer<Void>>} phFtpCommand A pointer to a handle that is created if a valid data socket is opened. The 
     * <i>fExpectResponse</i> parameter must be set to <b>TRUE</b> for 
     * <i>phFtpCommand</i> to be filled.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpcommandw
     * @since windows5.0
     */
    static FtpCommandW(hConnect, fExpectResponse, dwFlags, lpszCommand, dwContext, phFtpCommand) {
        lpszCommand := lpszCommand is String ? StrPtr(lpszCommand) : lpszCommand

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
        phFtpCommandMarshal := phFtpCommand is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FtpCommandW", hConnectMarshal, hConnect, "int", fExpectResponse, "uint", dwFlags, "ptr", lpszCommand, "ptr", dwContext, phFtpCommandMarshal, phFtpCommand, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the file size of the requested FTP resource.
     * @param {Pointer<Void>} hFile Handle returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-ftpopenfilea">FtpOpenFile</a>.
     * @param {Pointer<Integer>} lpdwFileSizeHigh Pointer to the high-order unsigned long integer of the file size of the requested FTP resource.
     * @returns {Integer} Returns the low-order unsigned long integer of the file size of the requested FTP resource.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-ftpgetfilesize
     * @since windows5.0
     */
    static FtpGetFileSize(hFile, lpdwFileSizeHigh) {
        hFileMarshal := hFile is VarRef ? "ptr" : "ptr"
        lpdwFileSizeHighMarshal := lpdwFileSizeHigh is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\FtpGetFileSize", hFileMarshal, hFile, lpdwFileSizeHighMarshal, lpdwFileSizeHigh, "uint")
        return result
    }

    /**
     * Creates a Gopher or Gopher+ locator string from the selector string's component parts.
     * @param {PSTR} lpszHost Pointer to a <b>null</b>-terminated string that contains the name of the host, or a dotted-decimal IP address (such as 198.105.232.1).
     * @param {Integer} nServerPort Port number on which the Gopher server at 
     * <i>lpszHost</i> lives, in host byte order. If 
     * <i>nServerPort</i> is <b>INTERNET_INVALID_PORT_NUMBER</b>, the default Gopher port is used.
     * @param {PSTR} lpszDisplayString Pointer to a <b>null</b>-terminated string that contains the Gopher document or directory to be displayed. If this parameter is <b>NULL</b>, the function returns the default directory for the Gopher server.
     * @param {PSTR} lpszSelectorString Pointer to the selector string to send to the Gopher server in order to retrieve information. This parameter can be <b>NULL</b>.
     * @param {Integer} dwGopherType Determines whether 
     * <i>lpszSelectorString</i> refers to a directory or document, and whether the request is Gopher+ or Gopher. The default value, GOPHER_TYPE_DIRECTORY, is used if the value of 
     * <i>dwGopherType</i> is zero. This can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/gopher-type-values">gopher type values</a>.
     * @param {PSTR} lpszLocator Pointer to a buffer  that receives the locator string. If 
     * <i>lpszLocator</i> is <b>NULL</b>, 
     * <i>lpdwBufferLength</i> receives the necessary buffer length, but the function performs no other processing.
     * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the length of the 
     * <i>lpszLocator</i> buffer, in characters. When the function returns, this parameter receives the number of characters written to the 
     * buffer. If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter receives the number of characters required.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gophercreatelocatora
     * @since windows5.0
     */
    static GopherCreateLocatorA(lpszHost, nServerPort, lpszDisplayString, lpszSelectorString, dwGopherType, lpszLocator, lpdwBufferLength) {
        lpszHost := lpszHost is String ? StrPtr(lpszHost) : lpszHost
        lpszDisplayString := lpszDisplayString is String ? StrPtr(lpszDisplayString) : lpszDisplayString
        lpszSelectorString := lpszSelectorString is String ? StrPtr(lpszSelectorString) : lpszSelectorString
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator

        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherCreateLocatorA", "ptr", lpszHost, "ushort", nServerPort, "ptr", lpszDisplayString, "ptr", lpszSelectorString, "uint", dwGopherType, "ptr", lpszLocator, lpdwBufferLengthMarshal, lpdwBufferLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a Gopher or Gopher+ locator string from the selector string's component parts.
     * @param {PWSTR} lpszHost Pointer to a <b>null</b>-terminated string that contains the name of the host, or a dotted-decimal IP address (such as 198.105.232.1).
     * @param {Integer} nServerPort Port number on which the Gopher server at 
     * <i>lpszHost</i> lives, in host byte order. If 
     * <i>nServerPort</i> is <b>INTERNET_INVALID_PORT_NUMBER</b>, the default Gopher port is used.
     * @param {PWSTR} lpszDisplayString Pointer to a <b>null</b>-terminated string that contains the Gopher document or directory to be displayed. If this parameter is <b>NULL</b>, the function returns the default directory for the Gopher server.
     * @param {PWSTR} lpszSelectorString Pointer to the selector string to send to the Gopher server in order to retrieve information. This parameter can be <b>NULL</b>.
     * @param {Integer} dwGopherType Determines whether 
     * <i>lpszSelectorString</i> refers to a directory or document, and whether the request is Gopher+ or Gopher. The default value, GOPHER_TYPE_DIRECTORY, is used if the value of 
     * <i>dwGopherType</i> is zero. This can be one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/gopher-type-values">gopher type values</a>.
     * @param {PWSTR} lpszLocator Pointer to a buffer  that receives the locator string. If 
     * <i>lpszLocator</i> is <b>NULL</b>, 
     * <i>lpdwBufferLength</i> receives the necessary buffer length, but the function performs no other processing.
     * @param {Pointer<Integer>} lpdwBufferLength Pointer to a variable that contains the length of the 
     * <i>lpszLocator</i> buffer, in characters. When the function returns, this parameter receives the number of characters written to the 
     * buffer. If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter receives the number of characters required.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gophercreatelocatorw
     * @since windows5.0
     */
    static GopherCreateLocatorW(lpszHost, nServerPort, lpszDisplayString, lpszSelectorString, dwGopherType, lpszLocator, lpdwBufferLength) {
        lpszHost := lpszHost is String ? StrPtr(lpszHost) : lpszHost
        lpszDisplayString := lpszDisplayString is String ? StrPtr(lpszDisplayString) : lpszDisplayString
        lpszSelectorString := lpszSelectorString is String ? StrPtr(lpszSelectorString) : lpszSelectorString
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator

        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherCreateLocatorW", "ptr", lpszHost, "ushort", nServerPort, "ptr", lpszDisplayString, "ptr", lpszSelectorString, "uint", dwGopherType, "ptr", lpszLocator, lpdwBufferLengthMarshal, lpdwBufferLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Parses a Gopher locator and determines its attributes.
     * @param {PSTR} lpszLocator Pointer to a null-terminated string that specifies the Gopher locator to be parsed.
     * @param {Pointer<Integer>} lpdwGopherType Pointer to a variable that receives the type of the locator. The type is a bitmask that consists of a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/gopher-type-values">gopher type values</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gophergetlocatortypea
     * @since windows5.0
     */
    static GopherGetLocatorTypeA(lpszLocator, lpdwGopherType) {
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator

        lpdwGopherTypeMarshal := lpdwGopherType is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherGetLocatorTypeA", "ptr", lpszLocator, lpdwGopherTypeMarshal, lpdwGopherType, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Parses a Gopher locator and determines its attributes.
     * @param {PWSTR} lpszLocator Pointer to a null-terminated string that specifies the Gopher locator to be parsed.
     * @param {Pointer<Integer>} lpdwGopherType Pointer to a variable that receives the type of the locator. The type is a bitmask that consists of a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/gopher-type-values">gopher type values</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gophergetlocatortypew
     * @since windows5.0
     */
    static GopherGetLocatorTypeW(lpszLocator, lpdwGopherType) {
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator

        lpdwGopherTypeMarshal := lpdwGopherType is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherGetLocatorTypeW", "ptr", lpszLocator, lpdwGopherTypeMarshal, lpdwGopherType, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Uses a Gopher locator and search criteria to create a session with the server and locate the requested documents, binary files, index servers, or directory trees.
     * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PSTR} lpszLocator Pointer to a <b>null</b>-terminated string that contains the name of the item to locate. This can be one of the following: 
     * 					
     * 
     * <ul>
     * <li>Gopher locator returned by a previous call to this function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> function.</li>
     * <li><b>NULL</b> pointer or empty string indicating that the topmost information from a Gopher server is being returned.</li>
     * <li>Locator created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gophercreatelocatora">GopherCreateLocator</a> function.</li>
     * </ul>
     * @param {PSTR} lpszSearchString Pointer to a buffer that contains the strings to search, if this request is to an index server. Otherwise, this parameter should be <b>NULL</b>.
     * @param {Pointer<GOPHER_FIND_DATAA>} lpFindData Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_find_dataa">GOPHER_FIND_DATA</a> structure that receives the information retrieved by this function.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data.
     * @returns {Pointer<Void>} Returns a valid search handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gopherfindfirstfilea
     * @since windows5.0
     */
    static GopherFindFirstFileA(hConnect, lpszLocator, lpszSearchString, lpFindData, dwFlags, dwContext) {
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
        lpszSearchString := lpszSearchString is String ? StrPtr(lpszSearchString) : lpszSearchString

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherFindFirstFileA", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszSearchString, "ptr", lpFindData, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Uses a Gopher locator and search criteria to create a session with the server and locate the requested documents, binary files, index servers, or directory trees.
     * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PWSTR} lpszLocator Pointer to a <b>null</b>-terminated string that contains the name of the item to locate. This can be one of the following: 
     * 					
     * 
     * <ul>
     * <li>Gopher locator returned by a previous call to this function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a> function.</li>
     * <li><b>NULL</b> pointer or empty string indicating that the topmost information from a Gopher server is being returned.</li>
     * <li>Locator created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gophercreatelocatora">GopherCreateLocator</a> function.</li>
     * </ul>
     * @param {PWSTR} lpszSearchString Pointer to a buffer that contains the strings to search, if this request is to an index server. Otherwise, this parameter should be <b>NULL</b>.
     * @param {Pointer<GOPHER_FIND_DATAW>} lpFindData Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_find_dataa">GOPHER_FIND_DATA</a> structure that receives the information retrieved by this function.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext Pointer to a variable that contains the application-defined value that associates this search with any application data.
     * @returns {Pointer<Void>} Returns a valid search handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gopherfindfirstfilew
     * @since windows5.0
     */
    static GopherFindFirstFileW(hConnect, lpszLocator, lpszSearchString, lpFindData, dwFlags, dwContext) {
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
        lpszSearchString := lpszSearchString is String ? StrPtr(lpszSearchString) : lpszSearchString

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherFindFirstFileW", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszSearchString, "ptr", lpFindData, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Begins reading a Gopher data file from a Gopher server.
     * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PSTR} lpszLocator Pointer to a <b>null</b>-terminated string that specifies the file to be opened. Generally, this locator is returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a>. Because the Gopher protocol has no concept of a current directory, the locator is always fully qualified.
     * @param {PSTR} lpszView Pointer to a <b>null</b>-terminated string that describes the view to open if several views of the file exist on the server. If 
     * <i>lpszView</i> is <b>NULL</b>, the function uses the default file view.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext Pointer to a variable that contains an application-defined value that associates this operation with any application data.
     * @returns {Pointer<Void>} Returns a handle if successful, or <b>NULL</b> if the file cannot be opened. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gopheropenfilea
     * @since windows5.0
     */
    static GopherOpenFileA(hConnect, lpszLocator, lpszView, dwFlags, dwContext) {
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
        lpszView := lpszView is String ? StrPtr(lpszView) : lpszView

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherOpenFileA", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszView, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Begins reading a Gopher data file from a Gopher server.
     * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PWSTR} lpszLocator Pointer to a <b>null</b>-terminated string that specifies the file to be opened. Generally, this locator is returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-gopherfindfirstfilea">GopherFindFirstFile</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetfindnextfilea">InternetFindNextFile</a>. Because the Gopher protocol has no concept of a current directory, the locator is always fully qualified.
     * @param {PWSTR} lpszView Pointer to a <b>null</b>-terminated string that describes the view to open if several views of the file exist on the server. If 
     * <i>lpszView</i> is <b>NULL</b>, the function uses the default file view.
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext Pointer to a variable that contains an application-defined value that associates this operation with any application data.
     * @returns {Pointer<Void>} Returns a handle if successful, or <b>NULL</b> if the file cannot be opened. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gopheropenfilew
     * @since windows5.0
     */
    static GopherOpenFileW(hConnect, lpszLocator, lpszView, dwFlags, dwContext) {
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
        lpszView := lpszView is String ? StrPtr(lpszView) : lpszView

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherOpenFileW", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszView, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the specific attribute information from the server.
     * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PSTR} lpszLocator Pointer to a <b>null</b>-terminated string that identifies the item at the Gopher server on which to return attribute information.
     * @param {PSTR} lpszAttributeName Pointer to a space-delimited string specifying the names of attributes to return. If 
     * <i>lpszAttributeName</i> is <b>NULL</b>, 
     * <b>GopherGetAttribute</b> returns information about all attributes.
     * @param {Pointer<Integer>} lpBuffer Pointer to an application-defined buffer from which attribute information is retrieved.
     * @param {Integer} dwBufferLength Size of the 
     * <i>lpBuffer</i> buffer, in <b>TCHARs</b>.
     * @param {Pointer<Integer>} lpdwCharactersReturned Pointer to a variable that contains the number of characters read into the 
     * <i>lpBuffer</i> buffer.
     * @param {Pointer<GOPHER_ATTRIBUTE_ENUMERATOR>} lpfnEnumerator Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-gopher_attribute_enumerator">GopherAttributeEnumerator</a> callback function that enumerates each attribute of the locator. This parameter is optional. If it is <b>NULL</b>, all  Gopher attribute information is placed into 
     * <i>lpBuffer</i>. If 
     * <i>lpfnEnumerator</i> is specified, the callback function is called once for each attribute of the object.
     * 				
     * 
     * 
     * The callback function receives the address of a single 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_attribute_type">GOPHER_ATTRIBUTE_TYPE</a> structure with each call. The enumeration callback function allows the application to avoid having to parse the Gopher attribute information.
     * @param {Pointer} dwContext Application-defined value that associates this operation with any application data.
     * @returns {BOOL} Returns <b>TRUE</b> if the request is satisfied, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gophergetattributea
     * @since windows5.0
     */
    static GopherGetAttributeA(hConnect, lpszLocator, lpszAttributeName, lpBuffer, dwBufferLength, lpdwCharactersReturned, lpfnEnumerator, dwContext) {
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
        lpszAttributeName := lpszAttributeName is String ? StrPtr(lpszAttributeName) : lpszAttributeName

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "char*" : "ptr"
        lpdwCharactersReturnedMarshal := lpdwCharactersReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherGetAttributeA", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszAttributeName, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, lpdwCharactersReturnedMarshal, lpdwCharactersReturned, "ptr", lpfnEnumerator, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the specific attribute information from the server.
     * @param {Pointer<Void>} hConnect Handle to a Gopher session returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PWSTR} lpszLocator Pointer to a <b>null</b>-terminated string that identifies the item at the Gopher server on which to return attribute information.
     * @param {PWSTR} lpszAttributeName Pointer to a space-delimited string specifying the names of attributes to return. If 
     * <i>lpszAttributeName</i> is <b>NULL</b>, 
     * <b>GopherGetAttribute</b> returns information about all attributes.
     * @param {Pointer<Integer>} lpBuffer Pointer to an application-defined buffer from which attribute information is retrieved.
     * @param {Integer} dwBufferLength Size of the 
     * <i>lpBuffer</i> buffer, in <b>TCHARs</b>.
     * @param {Pointer<Integer>} lpdwCharactersReturned Pointer to a variable that contains the number of characters read into the 
     * <i>lpBuffer</i> buffer.
     * @param {Pointer<GOPHER_ATTRIBUTE_ENUMERATOR>} lpfnEnumerator Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nc-wininet-gopher_attribute_enumerator">GopherAttributeEnumerator</a> callback function that enumerates each attribute of the locator. This parameter is optional. If it is <b>NULL</b>, all  Gopher attribute information is placed into 
     * <i>lpBuffer</i>. If 
     * <i>lpfnEnumerator</i> is specified, the callback function is called once for each attribute of the object.
     * 				
     * 
     * 
     * The callback function receives the address of a single 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-gopher_attribute_type">GOPHER_ATTRIBUTE_TYPE</a> structure with each call. The enumeration callback function allows the application to avoid having to parse the Gopher attribute information.
     * @param {Pointer} dwContext Application-defined value that associates this operation with any application data.
     * @returns {BOOL} Returns <b>TRUE</b> if the request is satisfied, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> or 
     * <a href="/windows/desktop/api/wininet/nf-wininet-internetgetlastresponseinfoa">InternetGetLastResponseInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-gophergetattributew
     * @since windows5.0
     */
    static GopherGetAttributeW(hConnect, lpszLocator, lpszAttributeName, lpBuffer, dwBufferLength, lpdwCharactersReturned, lpfnEnumerator, dwContext) {
        lpszLocator := lpszLocator is String ? StrPtr(lpszLocator) : lpszLocator
        lpszAttributeName := lpszAttributeName is String ? StrPtr(lpszAttributeName) : lpszAttributeName

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
        lpBufferMarshal := lpBuffer is VarRef ? "char*" : "ptr"
        lpdwCharactersReturnedMarshal := lpdwCharactersReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GopherGetAttributeW", hConnectMarshal, hConnect, "ptr", lpszLocator, "ptr", lpszAttributeName, lpBufferMarshal, lpBuffer, "uint", dwBufferLength, lpdwCharactersReturnedMarshal, lpdwCharactersReturned, "ptr", lpfnEnumerator, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates an HTTP request handle.
     * @param {Pointer<Void>} hConnect A  handle to an HTTP session returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PSTR} lpszVerb A pointer to a <b>null</b>-terminated string that contains the HTTP verb to use in the request. If this parameter is <b>NULL</b>, the function uses GET as the HTTP verb.
     * @param {PSTR} lpszObjectName A pointer to a <b>null</b>-terminated string that contains the name of the target object of the specified HTTP verb. This is generally a file name, an executable module, or a search specifier.
     * @param {PSTR} lpszVersion A pointer to a <b>null</b>-terminated string that contains the HTTP version to use in the request. Settings in Internet Explorer will override the value specified in this parameter. 
     * 
     * If this parameter is <b>NULL</b>, the function uses an HTTP version of 1.1 or 1.0, depending on the value of the Internet Explorer settings. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_1.0"></a><a id="http_1.0"></a><dl>
     * <dt><b>HTTP/1.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * HTTP version 1.0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_1.1"></a><a id="http_1.1"></a><dl>
     * <dt><b>HTTP/1.1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * HTTP version 1.1
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PSTR} lpszReferrer A pointer to a <b>null</b>-terminated string that specifies the URL of the document from which the URL in the request (<i>lpszObjectName</i>) was obtained. If this parameter is <b>NULL</b>, no referrer is specified.
     * @param {Pointer<PSTR>} lplpszAcceptTypes A pointer to a <b>null</b>-terminated array of strings that indicates media types accepted by the client. Here is an example.
     * 
     * <c>PCTSTR rgpszAcceptTypes[] = {_T("text//"), NULL};</c>
     * 
     *  Failing to properly terminate the array with a NULL pointer will cause a crash.
     * 
     * If this parameter is <b>NULL</b>, no types are accepted by the client. Servers generally interpret a lack of accept types to indicate that the client accepts only documents of type "text//" (that is, only text documents—no pictures or other binary files).<!--  For more information and  a list of valid media types, see <a href="http://ftp.isi.edu/in-notes/iana/assignments/media-types/">ftp://ftp.isi.edu/in-notes/iana/assignments/media-types/media-types</a>. -->
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext A pointer to a variable that contains the application-defined value that associates this operation with any application data.
     * @returns {Pointer<Void>} Returns an HTTP request handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpopenrequesta
     * @since windows5.0
     */
    static HttpOpenRequestA(hConnect, lpszVerb, lpszObjectName, lpszVersion, lpszReferrer, lplpszAcceptTypes, dwFlags, dwContext) {
        lpszVerb := lpszVerb is String ? StrPtr(lpszVerb) : lpszVerb
        lpszObjectName := lpszObjectName is String ? StrPtr(lpszObjectName) : lpszObjectName
        lpszVersion := lpszVersion is String ? StrPtr(lpszVersion) : lpszVersion
        lpszReferrer := lpszReferrer is String ? StrPtr(lpszReferrer) : lpszReferrer

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
        lplpszAcceptTypesMarshal := lplpszAcceptTypes is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpOpenRequestA", hConnectMarshal, hConnect, "ptr", lpszVerb, "ptr", lpszObjectName, "ptr", lpszVersion, "ptr", lpszReferrer, lplpszAcceptTypesMarshal, lplpszAcceptTypes, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates an HTTP request handle.
     * @param {Pointer<Void>} hConnect A handle to an HTTP session returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetconnecta">InternetConnect</a>.
     * @param {PWSTR} lpszVerb A pointer to a <b>null</b>-terminated string that contains the HTTP verb to use in the request. If this parameter is <b>NULL</b>, the function uses GET as the HTTP verb.
     * @param {PWSTR} lpszObjectName A pointer to a <b>null</b>-terminated string that contains the name of the target object of the specified HTTP verb. This is generally a file name, an executable module, or a search specifier.
     * @param {PWSTR} lpszVersion A pointer to a <b>null</b>-terminated string that contains the HTTP version to use in the request. Settings in Internet Explorer will override the value specified in this parameter. 
     * 
     * If this parameter is <b>NULL</b>, the function uses an HTTP version of 1.1 or 1.0, depending on the value of the Internet Explorer settings. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_1.0"></a><a id="http_1.0"></a><dl>
     * <dt><b>HTTP/1.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * HTTP version 1.0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_1.1"></a><a id="http_1.1"></a><dl>
     * <dt><b>HTTP/1.1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * HTTP version 1.1
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} lpszReferrer A pointer to a <b>null</b>-terminated string that specifies the URL of the document from which the URL in the request (<i>lpszObjectName</i>) was obtained. If this parameter is <b>NULL</b>, no referrer is specified.
     * @param {Pointer<PWSTR>} lplpszAcceptTypes A pointer to a <b>null</b>-terminated array of strings that indicates media types accepted by the client. Here is an example.
     * 
     * <c>PCTSTR rgpszAcceptTypes[] = {_T("text//"), NULL};</c>
     * 
     *  Failing to properly terminate the array with a NULL pointer will cause a crash.
     * 
     * If this parameter is <b>NULL</b>, no types are accepted by the client. Servers generally interpret a lack of accept types to indicate that the client accepts only documents of type "text//" (that is, only text documents—no pictures or other binary files). <!--For more information and  a list of valid media types, see  ftp://ftp.isi.edu/in-notes/iana/assignments/media-types/media-types. -->
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext A pointer to a variable that contains the application-defined value that associates this operation with any application data.
     * @returns {Pointer<Void>} Returns an HTTP request handle if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpopenrequestw
     * @since windows5.0
     */
    static HttpOpenRequestW(hConnect, lpszVerb, lpszObjectName, lpszVersion, lpszReferrer, lplpszAcceptTypes, dwFlags, dwContext) {
        lpszVerb := lpszVerb is String ? StrPtr(lpszVerb) : lpszVerb
        lpszObjectName := lpszObjectName is String ? StrPtr(lpszObjectName) : lpszObjectName
        lpszVersion := lpszVersion is String ? StrPtr(lpszVersion) : lpszVersion
        lpszReferrer := lpszReferrer is String ? StrPtr(lpszReferrer) : lpszReferrer

        hConnectMarshal := hConnect is VarRef ? "ptr" : "ptr"
        lplpszAcceptTypesMarshal := lplpszAcceptTypes is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpOpenRequestW", hConnectMarshal, hConnect, "ptr", lpszVerb, "ptr", lpszObjectName, "ptr", lpszVersion, "ptr", lpszReferrer, lplpszAcceptTypesMarshal, lplpszAcceptTypes, "uint", dwFlags, "ptr", dwContext, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds one or more HTTP request headers to the HTTP request handle.
     * @param {Pointer<Void>} hRequest A handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
     * @param {PSTR} lpszHeaders A pointer to a string variable containing the headers to append to the request. Each header must be terminated by a CR/LF (carriage return/line feed) pair.
     * @param {Integer} dwHeadersLength The size of 
     * <i>lpszHeaders</i>, in <b>TCHARs</b>. If this parameter is -1L, the function assumes that 
     * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is computed.
     * @param {Integer} dwModifiers 
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpaddrequestheadersa
     * @since windows5.0
     */
    static HttpAddRequestHeadersA(hRequest, lpszHeaders, dwHeadersLength, dwModifiers) {
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpAddRequestHeadersA", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "uint", dwModifiers, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds one or more HTTP request headers to the HTTP request handle.
     * @param {Pointer<Void>} hRequest A handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
     * @param {PWSTR} lpszHeaders A pointer to a string variable containing the headers to append to the request. Each header must be terminated by a CR/LF (carriage return/line feed) pair.
     * @param {Integer} dwHeadersLength The size of 
     * <i>lpszHeaders</i>, in <b>TCHARs</b>. If this parameter is -1L, the function assumes that 
     * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is computed.
     * @param {Integer} dwModifiers 
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpaddrequestheadersw
     * @since windows5.0
     */
    static HttpAddRequestHeadersW(hRequest, lpszHeaders, dwHeadersLength, dwModifiers) {
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpAddRequestHeadersW", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "uint", dwModifiers, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends the specified request to the HTTP server, allowing callers to send extra data beyond what is normally passed to HttpSendRequestEx.
     * @param {Pointer<Void>} hRequest A handle returned by 
     * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
     * @param {PSTR} lpszHeaders A pointer to a <b>null</b>-terminated string  that contains the additional headers to be appended to the request. This parameter can be <b>NULL</b> if there are no additional headers to be appended.
     * @param {Integer} dwHeadersLength The size of the additional headers, in <b>TCHARs</b>. If this parameter is -1L and 
     * <i>lpszHeaders</i> is not <b>NULL</b>, the function assumes that 
     * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is calculated. See Remarks for specifics.
     * @param {Pointer} lpOptional A pointer to a buffer containing any optional data to be sent immediately after the request headers. This parameter is generally used for POST and PUT operations. The optional data can be the resource or information being posted to the server. This parameter can be <b>NULL</b> if there is no optional data to send.
     * @param {Integer} dwOptionalLength The size of the optional data, in bytes. This parameter can be zero if there is no optional data to send.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpsendrequesta
     * @since windows5.0
     */
    static HttpSendRequestA(hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength) {
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpSendRequestA", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "ptr", lpOptional, "uint", dwOptionalLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends the specified request to the HTTP server, allowing callers to send extra data beyond what is normally passed to HttpSendRequestEx.
     * @param {Pointer<Void>} hRequest A handle returned by 
     * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
     * @param {PWSTR} lpszHeaders A pointer to a <b>null</b>-terminated string  that contains the additional headers to be appended to the request. This parameter can be <b>NULL</b> if there are no additional headers to be appended.
     * @param {Integer} dwHeadersLength The size of the additional headers, in <b>TCHARs</b>. If this parameter is -1L and 
     * <i>lpszHeaders</i> is not <b>NULL</b>, the function assumes that 
     * <i>lpszHeaders</i> is zero-terminated (ASCIIZ), and the length is calculated. See Remarks for specifics.
     * @param {Pointer} lpOptional A pointer to a buffer containing any optional data to be sent immediately after the request headers. This parameter is generally used for POST and PUT operations. The optional data can be the resource or information being posted to the server. This parameter can be <b>NULL</b> if there is no optional data to send.
     * @param {Integer} dwOptionalLength The size of the optional data, in bytes. This parameter can be zero if there is no optional data to send.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpsendrequestw
     * @since windows5.0
     */
    static HttpSendRequestW(hRequest, lpszHeaders, dwHeadersLength, lpOptional, dwOptionalLength) {
        lpszHeaders := lpszHeaders is String ? StrPtr(lpszHeaders) : lpszHeaders

        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpSendRequestW", hRequestMarshal, hRequest, "ptr", lpszHeaders, "uint", dwHeadersLength, "ptr", lpOptional, "uint", dwOptionalLength, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends the specified request to the HTTP server.
     * @param {Pointer<Void>} hRequest A 
     * 						handle returned by 
     * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
     * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersIn Optional. A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_buffersa">INTERNET_BUFFERS</a> structure.
     * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersOut Reserved. Must be <b>NULL</b>.
     * @param {Integer} dwFlags Reserved. Must be zero.
     * @param {Pointer} dwContext Application-defined context value, if a status callback function has been registered.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpsendrequestexa
     * @since windows5.0
     */
    static HttpSendRequestExA(hRequest, lpBuffersIn, lpBuffersOut, dwFlags, dwContext) {
        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpSendRequestExA", hRequestMarshal, hRequest, "ptr", lpBuffersIn, "ptr", lpBuffersOut, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends the specified request to the HTTP server.
     * @param {Pointer<Void>} hRequest A 
     * 						handle returned by 
     * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> function.
     * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersIn Optional. A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_buffersa">INTERNET_BUFFERS</a> structure.
     * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersOut Reserved. Must be <b>NULL</b>.
     * @param {Integer} dwFlags Reserved. Must be zero.
     * @param {Pointer} dwContext Application-defined context value, if a status callback function has been registered.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpsendrequestexw
     * @since windows5.0
     */
    static HttpSendRequestExW(hRequest, lpBuffersIn, lpBuffersOut, dwFlags, dwContext) {
        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpSendRequestExW", hRequestMarshal, hRequest, "ptr", lpBuffersIn, "ptr", lpBuffersOut, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Ends an HTTP request that was initiated by HttpSendRequestEx.
     * @param {Pointer<Void>} hRequest Handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> and sent by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>.
     * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersOut This parameter is reserved and must be <b>NULL</b>.
     * @param {Integer} dwFlags This parameter is reserved and must be set to 0.
     * @param {Pointer} dwContext This parameter is reserved and must be set to 0.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpendrequesta
     * @since windows5.0
     */
    static HttpEndRequestA(hRequest, lpBuffersOut, dwFlags, dwContext) {
        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpEndRequestA", hRequestMarshal, hRequest, "ptr", lpBuffersOut, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Ends an HTTP request that was initiated by HttpSendRequestEx.
     * @param {Pointer<Void>} hRequest Handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> and sent by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequestexa">HttpSendRequestEx</a>.
     * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersOut This parameter is reserved and must be <b>NULL</b>.
     * @param {Integer} dwFlags This parameter is reserved and must be set to 0.
     * @param {Pointer} dwContext This parameter is reserved and must be set to 0.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpendrequestw
     * @since windows5.0
     */
    static HttpEndRequestW(hRequest, lpBuffersOut, dwFlags, dwContext) {
        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpEndRequestW", hRequestMarshal, hRequest, "ptr", lpBuffersOut, "uint", dwFlags, "ptr", dwContext, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves header information associated with an HTTP request.
     * @param {Pointer<Void>} hRequest A handle returned by 
     * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> function.
     * @param {Integer} dwInfoLevel A combination of an attribute to be retrieved and flags that modify the request. For a list of possible attribute and modifier values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/query-info-flags">Query Info Flags</a>.
     * @param {Pointer} lpBuffer A pointer to a buffer to receive the requested information. This parameter must not be <b>NULL</b>.
     * @param {Pointer<Integer>} lpdwBufferLength A pointer to a variable that contains, on entry, the size in bytes of the buffer pointed to by <i>lpvBuffer</i>. 
     * 
     * When the function returns successfully, this variable contains the number of bytes of information written to the buffer. In the case of a string, the byte count does not include the string's terminating <b>null</b> character.
     * 
     * When the function  
     * 					fails with an extended error code of <b>ERROR_INSUFFICIENT_BUFFER</b>, the variable pointed to by <i>lpdwBufferLength</i> contains on exit the size, in bytes, of a buffer large enough to receive the requested information. The calling application can then allocate a buffer of this size or larger, and call the function again.
     * @param {Pointer<Integer>} lpdwIndex A pointer to a zero-based header index used to enumerate multiple headers with the same name. When calling the function, this parameter is the index of the specified header to return. When the function returns, this parameter is the index of the next header. If the next index cannot be found, <b>ERROR_HTTP_HEADER_NOT_FOUND</b> is returned.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpqueryinfoa
     * @since windows5.0
     */
    static HttpQueryInfoA(hRequest, dwInfoLevel, lpBuffer, lpdwBufferLength, lpdwIndex) {
        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"
        lpdwIndexMarshal := lpdwIndex is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpQueryInfoA", hRequestMarshal, hRequest, "uint", dwInfoLevel, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, lpdwIndexMarshal, lpdwIndex, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves header information associated with an HTTP request.
     * @param {Pointer<Void>} hRequest A handle returned by 
     * a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpopenrequesta">HttpOpenRequest</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internetopenurla">InternetOpenUrl</a> function.
     * @param {Integer} dwInfoLevel A combination of an attribute to be retrieved and flags that modify the request. For a list of possible attribute and modifier values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/query-info-flags">Query Info Flags</a>.
     * @param {Pointer} lpBuffer A pointer to a buffer to receive the requested information. This parameter must not be <b>NULL</b>.
     * @param {Pointer<Integer>} lpdwBufferLength A pointer to a variable that contains, on entry, the size in bytes of the buffer pointed to by <i>lpvBuffer</i>. 
     * 
     * When the function returns successfully, this variable contains the number of bytes of information written to the buffer. In the case of a string, the byte count does not include the string's terminating <b>null</b> character.
     * 
     * When the function  
     * 					fails with an extended error code of <b>ERROR_INSUFFICIENT_BUFFER</b>, the variable pointed to by <i>lpdwBufferLength</i> contains on exit the size, in bytes, of a buffer large enough to receive the requested information. The calling application can then allocate a buffer of this size or larger, and call the function again.
     * @param {Pointer<Integer>} lpdwIndex A pointer to a zero-based header index used to enumerate multiple headers with the same name. When calling the function, this parameter is the index of the specified header to return. When the function returns, this parameter is the index of the next header. If the next index cannot be found, <b>ERROR_HTTP_HEADER_NOT_FOUND</b> is returned.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-httpqueryinfow
     * @since windows5.0
     */
    static HttpQueryInfoW(hRequest, dwInfoLevel, lpBuffer, lpdwBufferLength, lpdwIndex) {
        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
        lpdwBufferLengthMarshal := lpdwBufferLength is VarRef ? "uint*" : "ptr"
        lpdwIndexMarshal := lpdwIndex is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\HttpQueryInfoW", hRequestMarshal, hRequest, "uint", dwInfoLevel, "ptr", lpBuffer, lpdwBufferLengthMarshal, lpdwBufferLength, lpdwIndexMarshal, lpdwIndex, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a cookie associated with the specified URL.
     * @param {PSTR} lpszUrl Pointer to a <b>null</b>-terminated string that specifies the URL for which the cookie should be set.
     * @param {PSTR} lpszCookieName Pointer to a <b>null</b>-terminated string that specifies the name to be associated with the cookie data. If this parameter is <b>NULL</b>, no name is associated with the cookie.
     * @param {PSTR} lpszCookieData Pointer to the actual data to be associated with the URL.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetcookiea
     * @since windows5.0
     */
    static InternetSetCookieA(lpszUrl, lpszCookieName, lpszCookieData) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
        lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

        A_LastError := 0

        result := DllCall("WININET.dll\InternetSetCookieA", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a cookie associated with the specified URL.
     * @param {PWSTR} lpszUrl Pointer to a <b>null</b>-terminated string that specifies the URL for which the cookie should be set.
     * @param {PWSTR} lpszCookieName Pointer to a <b>null</b>-terminated string that specifies the name to be associated with the cookie data. If this parameter is <b>NULL</b>, no name is associated with the cookie.
     * @param {PWSTR} lpszCookieData Pointer to the actual data to be associated with the URL.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get a specific error message, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetcookiew
     * @since windows5.0
     */
    static InternetSetCookieW(lpszUrl, lpszCookieName, lpszCookieData) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
        lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

        A_LastError := 0

        result := DllCall("WININET.dll\InternetSetCookieW", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the cookie for the specified URL.
     * @param {PSTR} lpszUrl A pointer to a <b>null</b>-terminated string that specifies the URL for which cookies are to be retrieved.
     * @param {PSTR} lpszCookieName Not implemented.
     * @param {PSTR} lpszCookieData A pointer to a buffer that receives the cookie data. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} lpdwSize A pointer to a variable that specifies the size of the 
     * <i>lpszCookieData</i> parameter buffer, in TCHARs. If the function succeeds, the buffer receives the amount of data copied to the 
     * <i>lpszCookieData</i> buffer. If 
     * <i>lpszCookieData</i> is <b>NULL</b>, this parameter receives a value that specifies the size of the buffer necessary to copy all the cookie data, expressed as a byte count.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error data, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error values apply to 
     * <b>InternetGetCookie</b>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no cookie for the specified URL and all its parents.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed in 
     * <i>lpdwSize</i> is insufficient to copy all the cookie data. The value returned in 
     * <i>lpdwSize</i> is the size of the buffer necessary to get all the data.
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
     * One or more of the parameters is invalid.
     * 
     * The <i>lpszUrl</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetcookiea
     * @since windows5.0
     */
    static InternetGetCookieA(lpszUrl, lpszCookieName, lpszCookieData, lpdwSize) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
        lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

        lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetCookieA", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, lpdwSizeMarshal, lpdwSize, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the cookie for the specified URL.
     * @param {PWSTR} lpszUrl A pointer to a <b>null</b>-terminated string that specifies the URL for which cookies are to be retrieved.
     * @param {PWSTR} lpszCookieName Not implemented.
     * @param {PWSTR} lpszCookieData A pointer to a buffer that receives the cookie data. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} lpdwSize A pointer to a variable that specifies the size of the 
     * <i>lpszCookieData</i> parameter buffer, in TCHARs. If the function succeeds, the buffer receives the amount of data copied to the 
     * <i>lpszCookieData</i> buffer. If 
     * <i>lpszCookieData</i> is <b>NULL</b>, this parameter receives a value that specifies the size of the buffer necessary to copy all the cookie data, expressed as a byte count.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error data, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error values apply to 
     * <b>InternetGetCookie</b>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no cookie for the specified URL and all its parents.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed in 
     * <i>lpdwSize</i> is insufficient to copy all the cookie data. The value returned in 
     * <i>lpdwSize</i> is the size of the buffer necessary to get all the data.
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
     * One or more of the parameters is invalid.
     * 
     * The <i>lpszUrl</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetcookiew
     * @since windows5.0
     */
    static InternetGetCookieW(lpszUrl, lpszCookieName, lpszCookieData, lpdwSize) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
        lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

        lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetCookieW", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, lpdwSizeMarshal, lpdwSize, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * The InternetSetCookieEx function creates a cookie with a specified name that is associated with a specified URL. This function differs from the InternetSetCookie function by being able to create third-party cookies.
     * @param {PSTR} lpszUrl Pointer to a <b>null</b>-terminated string that contains the URL for which the cookie should be set. 
     * 
     * If this pointer is <b>NULL</b>, <b>InternetSetCookieEx</b> fails with an <b>ERROR_INVALID_PARAMETER</b> error.
     * @param {PSTR} lpszCookieName Pointer to a <b>null</b>-terminated string that  contains the name to associate with this cookie.
     *       If this pointer is <b>NULL</b>, then no name is associated with the cookie.
     * @param {PSTR} lpszCookieData Pointer to a <b>null</b>-terminated string that contains the data to be associated with the new cookie.
     * 
     * If this pointer is <b>NULL</b>, <b>InternetSetCookieEx</b> fails with an <b>ERROR_INVALID_PARAMETER</b> error.
     * @param {Integer} dwFlags Flags that control how the function retrieves cookie data:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_COOKIE_EVALUATE_P3P"></a><a id="internet_cookie_evaluate_p3p"></a><dl>
     * <dt><b>INTERNET_COOKIE_EVALUATE_P3P</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set and the <i>dwReserved</i> parameter is not <b>NULL</b>, then the <i>dwReserved</i> parameter is cast to an <b>LPCTSTR</b> that points to a Platform-for-Privacy-Protection (P3P) header for the cookie in question.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_COOKIE_HTTPONLY"></a><a id="internet_cookie_httponly"></a><dl>
     * <dt><b>INTERNET_COOKIE_HTTPONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the retrieval of cookies that are marked as "HTTPOnly".  
     * 
     * 
     * 
     * Do  not use this flag if you expose a scriptable interface, because this has security implications. If you expose a scriptable interface, you can become an attack vector for cross-site scripting attacks.  It is utterly imperative that you use this flag only if they can guarantee that you will never permit third-party code to set a cookie using this flag by way of an extensibility mechanism you provide.
     * 
     *  
     * 
     * <b>Version:  </b>Requires Internet Explorer 8.0 or later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_COOKIE_THIRD_PARTY"></a><a id="internet_cookie_third_party"></a><dl>
     * <dt><b>INTERNET_COOKIE_THIRD_PARTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the cookie being set is a third-party cookie.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_RESTRICTED_ZONE"></a><a id="internet_flag_restricted_zone"></a><dl>
     * <dt><b>INTERNET_FLAG_RESTRICTED_ZONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the cookie being set is associated with an untrusted site.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} dwReserved <b>NULL</b>, or contains a pointer to a Platform-for-Privacy-Protection (P3P) header to be associated with the cookie.
     * @returns {Integer} Returns a member of the <a href="/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration if successful,  or  <b>FALSE</b> if the function fails. On failure, if a call to 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_NOT_ENOUGH_MEMORY,  insufficient system memory was available.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetcookieexa
     * @since windows5.1.2600
     */
    static InternetSetCookieExA(lpszUrl, lpszCookieName, lpszCookieData, dwFlags, dwReserved) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
        lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

        A_LastError := 0

        result := DllCall("WININET.dll\InternetSetCookieExA", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, "uint", dwFlags, "ptr", dwReserved, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The InternetSetCookieEx function creates a cookie with a specified name that is associated with a specified URL. This function differs from the InternetSetCookie function by being able to create third-party cookies.
     * @param {PWSTR} lpszUrl Pointer to a <b>null</b>-terminated string that contains the URL for which the cookie should be set. 
     * 
     * If this pointer is <b>NULL</b>, <b>InternetSetCookieEx</b> fails with an <b>ERROR_INVALID_PARAMETER</b> error.
     * @param {PWSTR} lpszCookieName Pointer to a <b>null</b>-terminated string that  contains the name to associate with this cookie.
     *       If this pointer is <b>NULL</b>, then no name is associated with the cookie.
     * @param {PWSTR} lpszCookieData Pointer to a <b>null</b>-terminated string that contains the data to be associated with the new cookie.
     * 
     * If this pointer is <b>NULL</b>, <b>InternetSetCookieEx</b> fails with an <b>ERROR_INVALID_PARAMETER</b> error.
     * @param {Integer} dwFlags Flags that control how the function retrieves cookie data:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_COOKIE_EVALUATE_P3P"></a><a id="internet_cookie_evaluate_p3p"></a><dl>
     * <dt><b>INTERNET_COOKIE_EVALUATE_P3P</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set and the <i>dwReserved</i> parameter is not <b>NULL</b>, then the <i>dwReserved</i> parameter is cast to an <b>LPCTSTR</b> that points to a Platform-for-Privacy-Protection (P3P) header for the cookie in question.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_COOKIE_HTTPONLY"></a><a id="internet_cookie_httponly"></a><dl>
     * <dt><b>INTERNET_COOKIE_HTTPONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the retrieval of cookies that are marked as "HTTPOnly".  
     * 
     * 
     * 
     * Do  not use this flag if you expose a scriptable interface, because this has security implications. If you expose a scriptable interface, you can become an attack vector for cross-site scripting attacks.  It is utterly imperative that you use this flag only if they can guarantee that you will never permit third-party code to set a cookie using this flag by way of an extensibility mechanism you provide.
     * 
     *  
     * 
     * <b>Version:  </b>Requires Internet Explorer 8.0 or later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_COOKIE_THIRD_PARTY"></a><a id="internet_cookie_third_party"></a><dl>
     * <dt><b>INTERNET_COOKIE_THIRD_PARTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the cookie being set is a third-party cookie.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_FLAG_RESTRICTED_ZONE"></a><a id="internet_flag_restricted_zone"></a><dl>
     * <dt><b>INTERNET_FLAG_RESTRICTED_ZONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the cookie being set is associated with an untrusted site.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} dwReserved <b>NULL</b>, or contains a pointer to a Platform-for-Privacy-Protection (P3P) header to be associated with the cookie.
     * @returns {Integer} Returns a member of the <a href="/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration if successful,  or  <b>FALSE</b> if the function fails. On failure, if a call to 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_NOT_ENOUGH_MEMORY,  insufficient system memory was available.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetcookieexw
     * @since windows5.1.2600
     */
    static InternetSetCookieExW(lpszUrl, lpszCookieName, lpszCookieData, dwFlags, dwReserved) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
        lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

        A_LastError := 0

        result := DllCall("WININET.dll\InternetSetCookieExW", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, "uint", dwFlags, "ptr", dwReserved, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves data stored in cookies associated with a specified URL.
     * @param {PSTR} lpszUrl A pointer to a <b>null</b>-terminated string that contains the URL with which the cookie to retrieve is associated. This parameter cannot be <b>NULL</b> or <b>InternetGetCookieEx</b> fails and returns an  <b>ERROR_INVALID_PARAMETER</b> error.
     * @param {PSTR} lpszCookieName A pointer to a <b>null</b>-terminated string that contains the name of the cookie to retrieve. This name is case-sensitive.
     * @param {PSTR} lpszCookieData A pointer to a buffer to receive the cookie data.
     * @param {Pointer<Integer>} lpdwSize A pointer to a DWORD variable. 
     * 
     * On entry, the variable must contain the size, in TCHARs, of the buffer pointed to by the <i>pchCookieData</i> parameter.
     * 
     * On exit, if the function is successful, this variable contains the number of TCHARs of cookie data copied into the buffer. If <b>NULL</b> was passed as the <i>lpszCookieData</i> parameter, or if the function fails with an error of <b>ERROR_INSUFFICIENT_BUFFER</b>, the variable contains the size, in BYTEs, of buffer required to receive the cookie data.
     * 
     * This parameter cannot be <b>NULL</b> or <b>InternetGetCookieEx</b> fails and returns an  <b>ERROR_INVALID_PARAMETER</b> error.
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get a specific error value, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If <b>NULL</b> is passed to <i>lpszCookieData</i>, the call will succeed and the function will not set <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * 
     * The following error codes may be set by this function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if cookie data retrieved is larger than the buffer size pointed to by the <i>pcchCookieData</i> parameter or if that parameter is <b>NULL</b>.
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
     * Returned if either the  <i>pchURL</i> or the <i>pcchCookieData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if no cookied data as specified could be retrieved.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetcookieexa
     * @since windows5.1.2600
     */
    static InternetGetCookieExA(lpszUrl, lpszCookieName, lpszCookieData, lpdwSize, dwFlags) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
        lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

        lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetCookieExA", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, lpdwSizeMarshal, lpdwSize, "uint", dwFlags, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves data stored in cookies associated with a specified URL.
     * @param {PWSTR} lpszUrl A pointer to a <b>null</b>-terminated string that contains the URL with which the cookie to retrieve is associated. This parameter cannot be <b>NULL</b> or <b>InternetGetCookieEx</b> fails and returns an  <b>ERROR_INVALID_PARAMETER</b> error.
     * @param {PWSTR} lpszCookieName A pointer to a <b>null</b>-terminated string that contains the name of the cookie to retrieve. This name is case-sensitive.
     * @param {PWSTR} lpszCookieData A pointer to a buffer to receive the cookie data.
     * @param {Pointer<Integer>} lpdwSize A pointer to a DWORD variable. 
     * 
     * On entry, the variable must contain the size, in TCHARs, of the buffer pointed to by the <i>pchCookieData</i> parameter.
     * 
     * On exit, if the function is successful, this variable contains the number of TCHARs of cookie data copied into the buffer. If <b>NULL</b> was passed as the <i>lpszCookieData</i> parameter, or if the function fails with an error of <b>ERROR_INSUFFICIENT_BUFFER</b>, the variable contains the size, in BYTEs, of buffer required to receive the cookie data.
     * 
     * This parameter cannot be <b>NULL</b> or <b>InternetGetCookieEx</b> fails and returns an  <b>ERROR_INVALID_PARAMETER</b> error.
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get a specific error value, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If <b>NULL</b> is passed to <i>lpszCookieData</i>, the call will succeed and the function will not set <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * 
     * The following error codes may be set by this function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if cookie data retrieved is larger than the buffer size pointed to by the <i>pcchCookieData</i> parameter or if that parameter is <b>NULL</b>.
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
     * Returned if either the  <i>pchURL</i> or the <i>pcchCookieData</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if no cookied data as specified could be retrieved.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetcookieexw
     * @since windows5.1.2600
     */
    static InternetGetCookieExW(lpszUrl, lpszCookieName, lpszCookieData, lpdwSize, dwFlags) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszCookieName := lpszCookieName is String ? StrPtr(lpszCookieName) : lpszCookieName
        lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

        lpdwSizeMarshal := lpdwSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetCookieExW", "ptr", lpszUrl, "ptr", lpszCookieName, "ptr", lpszCookieData, lpdwSizeMarshal, lpdwSize, "uint", dwFlags, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees an array of INTERNET_COOKIE2 structures.
     * @remarks
     * 
     * > [!NOTE]
     * > WinINet does not support server implementations. In addition, it should not be used from a service. For server implementations or services use [Microsoft Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).
     * 
     * 
     * @param {Pointer<INTERNET_COOKIE2>} pCookies Pointer to an array of [**INTERNET\_COOKIE2**](ns-wininet-internet_cookie2.md) structures.
     * @param {Integer} dwCookieCount The number of structures in the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetfreecookies
     */
    static InternetFreeCookies(pCookies, dwCookieCount) {
        DllCall("WININET.dll\InternetFreeCookies", "ptr", pCookies, "uint", dwCookieCount)
    }

    /**
     * Retrieves one or more cookies associated with the specified URL.
     * @param {PWSTR} pcwszUrl The URL for which to retrieve cookies.
     * @param {PWSTR} pcwszCookieName The name of the cookie to retrieve. May be NULL.
     * @param {Integer} dwFlags Flags of the cookie to retrieve. The following flags are available.
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | INTERNET_COOKIE_THIRD_PARTY | Retrieve cookies as a third party, causing first-party-only cookies to be excluded. |
     * | INTERNET_COOKIE_NON_SCRIPT | Indicate that this query was not triggered via JavaScript, allowing retrieval of HTTP-only cookies. |
     * | INTERNET_COOKIE_SAME_SITE_LEVEL_CROSS_SITE | Retrieve cookies as if in a cross site context, excluding cookies with the SameSite property set. |
     * | INTERNET_FLAG_RESTRICTED_ZONE | Retrieve only cookies that would be allowed if the specified URL were untrusted; that is, if it belonged to the URLZONE_UNTRUSTED zone. |
     * @param {Pointer<Pointer<INTERNET_COOKIE2>>} ppCookies Pointer that receives an array of [INTERNET\_COOKIE2](ns-wininet-internet_cookie2.md) structures. The returned array must be freed by [InternetFreeCookies](nf-wininet-internetfreecookies.md).
     * @param {Pointer<Integer>} pdwCookieCount Pointer to a DWORD that receives the number of structures in the array.
     * @returns {Integer} Returns ERROR_SUCCESS if successful, or a [system error code](/windows/desktop/debug/system-error-codes) on failure.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetcookieex2
     */
    static InternetGetCookieEx2(pcwszUrl, pcwszCookieName, dwFlags, ppCookies, pdwCookieCount) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl
        pcwszCookieName := pcwszCookieName is String ? StrPtr(pcwszCookieName) : pcwszCookieName

        ppCookiesMarshal := ppCookies is VarRef ? "ptr*" : "ptr"
        pdwCookieCountMarshal := pdwCookieCount is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetGetCookieEx2", "ptr", pcwszUrl, "ptr", pcwszCookieName, "uint", dwFlags, ppCookiesMarshal, ppCookies, pdwCookieCountMarshal, pdwCookieCount, "uint")
        return result
    }

    /**
     * Creates a cookie associated with the specified URL.
     * @param {PWSTR} pcwszUrl The URL for which to set the cookie.
     * @param {Pointer<INTERNET_COOKIE2>} pCookie Pointer to an [INTERNET\_COOKIE2](ns-wininet-internet_cookie2.md) structure containing the cookie data.
     * @param {PWSTR} pcwszP3PPolicy String containing the Platform-for-Privacy-Protection (P3P) policy for the cookie. May be NULL.
     * @param {Integer} dwFlags Flags for the cookie to be set. The following flags are available.
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | INTERNET_COOKIE_THIRD_PARTY | Set this cookie in a third-party context. |
     * | INTERNET_COOKIE_PROMPT_REQUIRED | Show a UI prompt for the user to accept or reject this cookie. |
     * | INTERNET_COOKIE_EVALUATE_P3P | Evaluate the provided P3P policy for this cookie. This will evaluate default policy when *pcwszP3PPolicy* is NULL. |
     * | INTERNET_COOKIE_NON_SCRIPT | Indicate that this cookie is not being set via JavaScript, allowing HTTP-only cookies to be set. |
     * | INTERNET_COOKIE_APPLY_HOST_ONLY | Apply host-only policy to this cookie. If the domain attribute is not set, then this cookie will be marked host-only. |
     * @param {Pointer<Integer>} pdwCookieState Pointer to a DWORD that receives the result of setting the cookie. For a list of possible values, see [InternetCookieState](/windows/desktop/wininet/ne-wininet.internetcookiestate).
     * @returns {Integer} Returns ERROR_SUCCESS if successful, or a [system error code](/windows/desktop/debug/system-error-codes) on failure.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetcookieex2
     */
    static InternetSetCookieEx2(pcwszUrl, pCookie, pcwszP3PPolicy, dwFlags, pdwCookieState) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl
        pcwszP3PPolicy := pcwszP3PPolicy is String ? StrPtr(pcwszP3PPolicy) : pcwszP3PPolicy

        pdwCookieStateMarshal := pdwCookieState is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetSetCookieEx2", "ptr", pcwszUrl, "ptr", pCookie, "ptr", pcwszP3PPolicy, "uint", dwFlags, pdwCookieStateMarshal, pdwCookieState, "uint")
        return result
    }

    /**
     * Attempts to make a connection to the Internet.
     * @param {Integer} dwReserved This parameter is reserved and must be 0.
     * @returns {Integer} Returns ERROR_SUCCESS if successful, or a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetattemptconnect
     * @since windows5.0
     */
    static InternetAttemptConnect(dwReserved) {
        result := DllCall("WININET.dll\InternetAttemptConnect", "uint", dwReserved, "uint")
        return result
    }

    /**
     * Allows an application to check if a connection to the Internet can be established.
     * @param {PSTR} lpszUrl Pointer to a <b>null</b>-terminated string that specifies the URL to use to check the connection. This value can be <b>NULL</b>.
     * @param {Integer} dwFlags Options. FLAG_ICC_FORCE_CONNECTION is the only flag that is currently available. If this flag is set, it forces a connection. A sockets connection is attempted in the following order:
     * 
     * <ul>
     * <li>If 
     * <i>lpszUrl</i> is non-<b>NULL</b>, the host value is extracted from it and used to ping that specific host.</li>
     * <li>If 
     * <i>lpszUrl</i> is <b>NULL</b> and there is an entry in the internal server database for the nearest server, the host value is extracted from the entry and used to ping that server.</li>
     * </ul>
     * @param {Integer} dwReserved This parameter is reserved and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if a connection is made successfully, or <b>FALSE</b> otherwise. Use 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code. ERROR_NOT_CONNECTED is returned by 
     * <b>GetLastError</b> if a connection cannot be made or if the sockets database is unconditionally offline.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcheckconnectiona
     * @since windows5.0
     */
    static InternetCheckConnectionA(lpszUrl, dwFlags, dwReserved) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCheckConnectionA", "ptr", lpszUrl, "uint", dwFlags, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Allows an application to check if a connection to the Internet can be established.
     * @param {PWSTR} lpszUrl Pointer to a <b>null</b>-terminated string that specifies the URL to use to check the connection. This value can be <b>NULL</b>.
     * @param {Integer} dwFlags Options. FLAG_ICC_FORCE_CONNECTION is the only flag that is currently available. If this flag is set, it forces a connection. A sockets connection is attempted in the following order:
     * 
     * <ul>
     * <li>If 
     * <i>lpszUrl</i> is non-<b>NULL</b>, the host value is extracted from it and used to ping that specific host.</li>
     * <li>If 
     * <i>lpszUrl</i> is <b>NULL</b> and there is an entry in the internal server database for the nearest server, the host value is extracted from the entry and used to ping that server.</li>
     * </ul>
     * @param {Integer} dwReserved This parameter is reserved and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if a connection is made successfully, or <b>FALSE</b> otherwise. Use 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code. ERROR_NOT_CONNECTED is returned by 
     * <b>GetLastError</b> if a connection cannot be made or if the sockets database is unconditionally offline.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetcheckconnectionw
     * @since windows5.0
     */
    static InternetCheckConnectionW(lpszUrl, dwFlags, dwReserved) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        A_LastError := 0

        result := DllCall("WININET.dll\InternetCheckConnectionW", "ptr", lpszUrl, "uint", dwFlags, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * The ResumeSuspendedDownload function resumes a request that is suspended by a user interface dialog box.
     * @param {Pointer<Void>} hRequest Handle of the request that is suspended by a user interface dialog box.
     * @param {Integer} dwResultCode The error result returned from <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-interneterrordlg">InternetErrorDlg</a>, or zero if a different dialog  is  invoked.
     * @returns {BOOL} Returns <b>TRUE</b> if successful; otherwise  <b>FALSE</b>. Call
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for extended error information.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-resumesuspendeddownload
     * @since windows5.0
     */
    static ResumeSuspendedDownload(hRequest, dwResultCode) {
        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\ResumeSuspendedDownload", hRequestMarshal, hRequest, "uint", dwResultCode, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Displays a dialog box for the error that is passed to InternetErrorDlg, if an appropriate dialog box exists.
     * @param {HWND} hWnd Handle to the parent window for any needed dialog box. If no dialog box is needed and <b>FLAGS_ERROR_UI_FLAGS_NO_UI</b> is passed to <i>dwFlags</i>, then this parameter can be <b>NULL</b>.
     * @param {Pointer<Void>} hRequest Handle to the Internet connection used in the call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-httpsendrequesta">HttpSendRequest</a>.
     * @param {Integer} dwError 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Void>>} lppvData Pointer  to the address of a data structure. The structure can be different for each error that needs to be handled.
     * @returns {Integer} Returns one of the following values, or an error value otherwise.
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
     * The function completed successfully.
     * 
     * For more information, see <b>ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED</b> in the <i>dwError</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was canceled by the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INTERNET_FORCE_RETRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This indicates that the function needs to redo its request.  In the case of authentication this indicates that the user clicked the <b>OK</b> button.
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
     * The handle to the parent window is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-interneterrordlg
     * @since windows5.0
     */
    static InternetErrorDlg(hWnd, hRequest, dwError, dwFlags, lppvData) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"
        lppvDataMarshal := lppvData is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\InternetErrorDlg", "ptr", hWnd, hRequestMarshal, hRequest, "uint", dwError, "uint", dwFlags, lppvDataMarshal, lppvData, "uint")
        return result
    }

    /**
     * Checks for changes between secure and nonsecure URLs. Always inform the user when a change occurs in security between two URLs. Typically, an application should allow the user to acknowledge the change through interaction with a dialog box.
     * @param {HWND} hWnd Handle to the parent window for any required dialog box.
     * @param {PSTR} szUrlPrev Pointer to a null-terminated string that specifies the URL that was viewed before the current request was made.
     * @param {PSTR} szUrlNew Pointer to a null-terminated string that specifies the new URL that the user has requested to view.
     * @param {BOOL} bPost Not implemented.
     * @returns {Integer} Returns one of the following values.
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
     * The user confirmed that it was okay to continue, or there was no user input required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the request.
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
     * There is not enough memory to carry out the request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetconfirmzonecrossinga
     * @since windows5.0
     */
    static InternetConfirmZoneCrossingA(hWnd, szUrlPrev, szUrlNew, bPost) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        szUrlPrev := szUrlPrev is String ? StrPtr(szUrlPrev) : szUrlPrev
        szUrlNew := szUrlNew is String ? StrPtr(szUrlNew) : szUrlNew

        result := DllCall("WININET.dll\InternetConfirmZoneCrossingA", "ptr", hWnd, "ptr", szUrlPrev, "ptr", szUrlNew, "int", bPost, "uint")
        return result
    }

    /**
     * Checks for changes between secure and nonsecure URLs. Always inform the user when a change occurs in security between two URLs. Typically, an application should allow the user to acknowledge the change through interaction with a dialog box.
     * @param {HWND} hWnd Handle to the parent window for any required dialog box.
     * @param {PWSTR} szUrlPrev Pointer to a null-terminated string that specifies the URL that was viewed before the current request was made.
     * @param {PWSTR} szUrlNew Pointer to a null-terminated string that specifies the new URL that the user has requested to view.
     * @param {BOOL} bPost Not implemented.
     * @returns {Integer} Returns one of the following values.
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
     * The user confirmed that it was okay to continue, or there was no user input required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the request.
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
     * There is not enough memory to carry out the request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetconfirmzonecrossingw
     * @since windows5.0
     */
    static InternetConfirmZoneCrossingW(hWnd, szUrlPrev, szUrlNew, bPost) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        szUrlPrev := szUrlPrev is String ? StrPtr(szUrlPrev) : szUrlPrev
        szUrlNew := szUrlNew is String ? StrPtr(szUrlNew) : szUrlNew

        result := DllCall("WININET.dll\InternetConfirmZoneCrossingW", "ptr", hWnd, "ptr", szUrlPrev, "ptr", szUrlNew, "int", bPost, "uint")
        return result
    }

    /**
     * Checks for changes between secure and nonsecure URLs. Always inform the user when a change occurs in security between two URLs. Typically, an application should allow the user to acknowledge the change through interaction with a dialog box.
     * @param {HWND} hWnd Handle to the parent window for any required dialog box.
     * @param {PSTR} szUrlPrev Pointer to a null-terminated string that specifies the URL that was viewed before the current request was made.
     * @param {PSTR} szUrlNew Pointer to a null-terminated string that specifies the new URL that the user has requested to view.
     * @param {BOOL} bPost Not implemented.
     * @returns {Integer} Returns one of the following values.
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
     * The user confirmed that it was okay to continue, or there was no user input required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the request.
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
     * There is not enough memory to carry out the request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetconfirmzonecrossing
     * @since windows5.0
     */
    static InternetConfirmZoneCrossing(hWnd, szUrlPrev, szUrlNew, bPost) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        szUrlPrev := szUrlPrev is String ? StrPtr(szUrlPrev) : szUrlPrev
        szUrlNew := szUrlNew is String ? StrPtr(szUrlNew) : szUrlNew

        result := DllCall("WININET.dll\InternetConfirmZoneCrossing", "ptr", hWnd, "ptr", szUrlPrev, "ptr", szUrlNew, "int", bPost, "uint")
        return result
    }

    /**
     * Creates a local file name for saving the cache entry based on the specified URL and the file name extension.
     * @param {PSTR} lpszUrlName Pointer to a string value that contains the name of the URL. The string must contain a value; an empty string will cause <b>CreateUrlCacheEntry</b> to fail. In addition, the string must not contain any escape characters.
     * @param {Integer} dwExpectedFileSize Expected size of the file needed to store the data that corresponds to the source entity, in <b>TCHARs</b>. If the expected size is unknown, set this value to zero.
     * @param {PSTR} lpszFileExtension Pointer to a string value that contains an extension name of the file in the local storage.
     * @param {PSTR} lpszFileName Pointer to a buffer that receives the file name. The buffer should be large enough  to store the path of the created file (at least MAX_PATH  characters in length).
     * @param {Integer} dwReserved This parameter is reserved and must be 0.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-createurlcacheentrya
     * @since windows5.0
     */
    static CreateUrlCacheEntryA(lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
        lpszFileExtension := lpszFileExtension is String ? StrPtr(lpszFileExtension) : lpszFileExtension
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        A_LastError := 0

        result := DllCall("WININET.dll\CreateUrlCacheEntryA", "ptr", lpszUrlName, "uint", dwExpectedFileSize, "ptr", lpszFileExtension, "ptr", lpszFileName, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a local file name for saving the cache entry based on the specified URL and the file name extension.
     * @param {PWSTR} lpszUrlName Pointer to a string value that contains the name of the URL. The string must contain a value; an empty string will cause <b>CreateUrlCacheEntry</b> to fail. In addition, the string must not contain any escape characters.
     * @param {Integer} dwExpectedFileSize Expected size of the file needed to store the data that corresponds to the source entity, in <b>TCHARs</b>. If the expected size is unknown, set this value to zero.
     * @param {PWSTR} lpszFileExtension Pointer to a string value that contains an extension name of the file in the local storage.
     * @param {PWSTR} lpszFileName Pointer to a buffer that receives the file name. The buffer should be large enough  to store the path of the created file (at least MAX_PATH  characters in length).
     * @param {Integer} dwReserved This parameter is reserved and must be 0.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-createurlcacheentryw
     * @since windows5.0
     */
    static CreateUrlCacheEntryW(lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
        lpszFileExtension := lpszFileExtension is String ? StrPtr(lpszFileExtension) : lpszFileExtension
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        A_LastError := 0

        result := DllCall("WININET.dll\CreateUrlCacheEntryW", "ptr", lpszUrlName, "uint", dwExpectedFileSize, "ptr", lpszFileExtension, "ptr", lpszFileName, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Stores data in the specified file in the Internet cache and associates it with the specified URL.
     * @param {PSTR} lpszUrlName Pointer to a string variable that contains the source name of the cache entry. The name string must be unique and should not contain any escape characters.
     * @param {PSTR} lpszLocalFileName Pointer to a string variable that contains the name of the local file that is being cached. This should be the same name as that returned by 
     * <b>CreateUrlCacheEntryA</b>.
     * @param {FILETIME} ExpireTime <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the expire date and time (in Greenwich mean time) of the file that is being cached. If the expire date and time is unknown, set this parameter to zero.
     * @param {FILETIME} LastModifiedTime <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last modified date and time (in Greenwich mean time) of the URL that is being cached. If the last modified date and time is unknown, set this parameter to zero.
     * @param {Integer} CacheEntryType A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY).
     * 
     * This parameter can be zero or more of the following property flags, and  cache type flags listed below.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>COOKIE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cookie cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>EDITED_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cache entry file that has been edited externally. This cache entry type is exempt from scavenging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>NORMAL_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Normal cache entry; can be deleted to recover space for new entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SPARSE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial response cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>STICKY_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sticky cache entry; exempt from scavenging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRACK_OFFLINE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRACK_ONLINE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>URLHISTORY_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Visited link cache entry.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} lpHeaderInfo Pointer to the buffer that contains the header information. If this parameter is not <b>NULL</b>, the header information is treated as extended attributes of the URL that are returned in the <b>lpHeaderInfo</b> 
     * member of the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure.
     * @param {Integer} cchHeaderInfo Size of the header information, in <b>TCHARs</b>. If 
     * <i>lpHeaderInfo</i> is not <b>NULL</b>, this value is assumed to indicate the size of the buffer that  stores the header information. An application can maintain headers as part of the data and provide 
     * <i>cchHeaderInfo</i> together with a <b>NULL</b> value for 
     * <i>lpHeaderInfo</i>.
     * @param {PSTR} lpszOriginalUrl Pointer to a string  that contains the original URL, if redirection has occurred.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DISK_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache storage is full.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified local file is not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-commiturlcacheentrya
     * @since windows5.0
     */
    static CommitUrlCacheEntryA(lpszUrlName, lpszLocalFileName, ExpireTime, LastModifiedTime, CacheEntryType, lpHeaderInfo, cchHeaderInfo, lpszOriginalUrl) {
        static lpszFileExtension := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
        lpszLocalFileName := lpszLocalFileName is String ? StrPtr(lpszLocalFileName) : lpszLocalFileName
        lpszOriginalUrl := lpszOriginalUrl is String ? StrPtr(lpszOriginalUrl) : lpszOriginalUrl

        lpHeaderInfoMarshal := lpHeaderInfo is VarRef ? "char*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\CommitUrlCacheEntryA", "ptr", lpszUrlName, "ptr", lpszLocalFileName, "ptr", ExpireTime, "ptr", LastModifiedTime, "uint", CacheEntryType, lpHeaderInfoMarshal, lpHeaderInfo, "uint", cchHeaderInfo, "ptr", lpszFileExtension, "ptr", lpszOriginalUrl, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Stores data in the specified file in the Internet cache and associates it with the specified URL.
     * @param {PWSTR} lpszUrlName Pointer to a string variable that contains the source name of the cache entry. The name string must be unique and should not contain any escape characters.
     * @param {PWSTR} lpszLocalFileName Pointer to a string variable that contains the name of the local file that is being cached. This should be the same name as that returned by 
     * <b>CreateUrlCacheEntryW</b>.
     * @param {FILETIME} ExpireTime <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the expire date and time (in Greenwich mean time) of the file that is being cached. If the expire date and time is unknown, set this parameter to zero.
     * @param {FILETIME} LastModifiedTime <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the last modified date and time (in Greenwich mean time) of the URL that is being cached. If the last modified date and time is unknown, set this parameter to zero.
     * @param {Integer} CacheEntryType A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY).
     * 
     * This parameter can be zero or more of the following property flags, and  cache type flags listed below.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>COOKIE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cookie cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>EDITED_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cache entry file that has been edited externally. This cache entry type is exempt from scavenging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>NORMAL_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Normal cache entry; can be deleted to recover space for new entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SPARSE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial response cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>STICKY_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sticky cache entry; exempt from scavenging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRACK_OFFLINE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRACK_ONLINE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>URLHISTORY_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Visited link cache entry.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} lpszHeaderInfo Pointer to the buffer that contains the header information. If this parameter is not <b>NULL</b>, the header information is treated as extended attributes of the URL that are returned in the 
     * <b>lpHeaderInfo</b> 
     * member of the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure.
     * @param {Integer} cchHeaderInfo Size of the header information, in <b>TCHARs</b>. If 
     * <i>lpHeaderInfo</i> is not <b>NULL</b>, this value is assumed to indicate the size of the buffer that  stores the header information. An application can maintain headers as part of the data and provide 
     * <i>cchHeaderInfo</i> together with a <b>NULL</b> value for 
     * <i>lpHeaderInfo</i>.
     * @param {PWSTR} lpszOriginalUrl Pointer to a string  that contains the original URL, if redirection has occurred.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DISK_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache storage is full.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified local file is not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-commiturlcacheentryw
     * @since windows5.0
     */
    static CommitUrlCacheEntryW(lpszUrlName, lpszLocalFileName, ExpireTime, LastModifiedTime, CacheEntryType, lpszHeaderInfo, cchHeaderInfo, lpszOriginalUrl) {
        static lpszFileExtension := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
        lpszLocalFileName := lpszLocalFileName is String ? StrPtr(lpszLocalFileName) : lpszLocalFileName
        lpszHeaderInfo := lpszHeaderInfo is String ? StrPtr(lpszHeaderInfo) : lpszHeaderInfo
        lpszOriginalUrl := lpszOriginalUrl is String ? StrPtr(lpszOriginalUrl) : lpszOriginalUrl

        A_LastError := 0

        result := DllCall("WININET.dll\CommitUrlCacheEntryW", "ptr", lpszUrlName, "ptr", lpszLocalFileName, "ptr", ExpireTime, "ptr", LastModifiedTime, "uint", CacheEntryType, "ptr", lpszHeaderInfo, "uint", cchHeaderInfo, "ptr", lpszFileExtension, "ptr", lpszOriginalUrl, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locks the cache entry file associated with the specified URL.
     * @param {PSTR} lpszUrlName Pointer to a string that contains the URL of the resource associated with the cache entry. This must be a unique name. The name string should not contain any escape characters.
     * @param {Pointer} lpCacheEntryInfo Pointer to a cache entry information buffer. If the buffer is not sufficient, this function returns ERROR_INSUFFICIENT_BUFFER and sets 
     * <i>lpdwCacheEntryInfoBufferSize</i> to the number of bytes required.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to an unsigned long integer variable that specifies the size of the 
     * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the size, in bytes, of the actual buffer used or the number of bytes required to retrieve the cache entry file. The caller should check the return value in this parameter. If the return size is less than or equal to the size passed in, all the relevant data has been returned.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache entry specified by the source name is not found in the cache storage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the 
     * <i>lpCacheEntryInfo</i> buffer as specified by 
     * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to get all the information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-retrieveurlcacheentryfilea
     * @since windows5.0
     */
    static RetrieveUrlCacheEntryFileA(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\RetrieveUrlCacheEntryFileA", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Locks the cache entry file associated with the specified URL.
     * @param {PWSTR} lpszUrlName Pointer to a string that contains the URL of the resource associated with the cache entry. This must be a unique name. The name string should not contain any escape characters.
     * @param {Pointer} lpCacheEntryInfo Pointer to a cache entry information buffer. If the buffer is not sufficient, this function returns ERROR_INSUFFICIENT_BUFFER and sets 
     * <i>lpdwCacheEntryInfoBufferSize</i> to the number of bytes required.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to an unsigned long integer variable that specifies the size of the 
     * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the size, in bytes, of the actual buffer used or the number of bytes required to retrieve the cache entry file. The caller should check the return value in this parameter. If the return size is less than or equal to the size passed in, all the relevant data has been returned.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache entry specified by the source name is not found in the cache storage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the 
     * <i>lpCacheEntryInfo</i> buffer as specified by 
     * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to get all the information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-retrieveurlcacheentryfilew
     * @since windows5.0
     */
    static RetrieveUrlCacheEntryFileW(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\RetrieveUrlCacheEntryFileW", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unlocks the cache entry that was locked while the file was retrieved for use from the cache.
     * @param {PSTR} lpszUrlName Pointer to a <b>null</b>-terminated string that specifies the source name of the cache entry that is being unlocked. The name string should not contain any escape characters.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. ERROR_FILE_NOT_FOUND indicates that the cache entry specified by the source name is not found in the cache storage.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-unlockurlcacheentryfilea
     * @since windows5.0
     */
    static UnlockUrlCacheEntryFileA(lpszUrlName) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        A_LastError := 0

        result := DllCall("WININET.dll\UnlockUrlCacheEntryFileA", "ptr", lpszUrlName, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unlocks the cache entry that was locked while the file was retrieved for use from the cache.
     * @param {PWSTR} lpszUrlName Pointer to a <b>null</b>-terminated string that specifies the source name of the cache entry that is being unlocked. The name string should not contain any escape characters.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. ERROR_FILE_NOT_FOUND indicates that the cache entry specified by the source name is not found in the cache storage.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-unlockurlcacheentryfilew
     * @since windows5.0
     */
    static UnlockUrlCacheEntryFileW(lpszUrlName) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        A_LastError := 0

        result := DllCall("WININET.dll\UnlockUrlCacheEntryFileW", "ptr", lpszUrlName, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unlocks the cache entry that was locked while the file was retrieved for use from the cache.
     * @param {PSTR} lpszUrlName Pointer to a <b>null</b>-terminated string that specifies the source name of the cache entry that is being unlocked. The name string should not contain any escape characters.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. ERROR_FILE_NOT_FOUND indicates that the cache entry specified by the source name is not found in the cache storage.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-unlockurlcacheentryfile
     * @since windows5.0
     */
    static UnlockUrlCacheEntryFile(lpszUrlName) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        A_LastError := 0

        result := DllCall("WININET.dll\UnlockUrlCacheEntryFile", "ptr", lpszUrlName, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Provides the most efficient and implementation-independent way to access the cache data.
     * @param {PSTR} lpszUrlName Pointer to a null-terminated string that contains the source name of the cache entry. This must be a unique name. The name string should not contain any escape characters.
     * @param {Pointer} lpCacheEntryInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size, in bytes, of the 
     * <i>lpCacheEntryInfo</i> buffer. When the function returns, the variable receives the number of bytes copied to the buffer or the required size, in bytes, of the buffer. Note that this buffer size must accommodate both the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure and the associated strings that are stored immediately following it.
     * @param {BOOL} fRandomRead Whether the stream is open for random access. Set the flag to <b>TRUE</b> to open the stream for random access.
     * @returns {HANDLE} If the function succeeds, the function returns a valid handle for use in the 
     * <a href="/windows/desktop/api/wininet/nf-wininet-readurlcacheentrystream">ReadUrlCacheEntryStream</a> and 
     * <a href="/windows/desktop/api/wininet/nf-wininet-unlockurlcacheentrystream">UnlockUrlCacheEntryStream</a> functions.
     * 
     * If the function fails, it returns <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache entry specified by the source name is not found in the cache storage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of 
     * <i>lpCacheEntryInfo</i> as specified by 
     * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-retrieveurlcacheentrystreama
     * @since windows5.0
     */
    static RetrieveUrlCacheEntryStreamA(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo, fRandomRead) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\RetrieveUrlCacheEntryStreamA", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "int", fRandomRead, "uint", dwReserved, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Provides the most efficient and implementation-independent way to access the cache data.
     * @param {PWSTR} lpszUrlName Pointer to a null-terminated string that contains the source name of the cache entry. This must be a unique name. The name string should not contain any escape characters.
     * @param {Pointer} lpCacheEntryInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size, in bytes, of the 
     * <i>lpCacheEntryInfo</i> buffer. When the function returns, the variable receives the number of bytes copied to the buffer or the required size, in bytes, of the buffer. Note that this buffer size must accommodate both the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure and the associated strings that are stored immediately following it.
     * @param {BOOL} fRandomRead Whether the stream is open for random access. Set the flag to <b>TRUE</b> to open the stream for random access.
     * @returns {HANDLE} If the function succeeds, the function returns a valid handle for use in the 
     * <a href="/windows/desktop/api/wininet/nf-wininet-readurlcacheentrystream">ReadUrlCacheEntryStream</a> and 
     * <a href="/windows/desktop/api/wininet/nf-wininet-unlockurlcacheentrystream">UnlockUrlCacheEntryStream</a> functions.
     * 
     * If the function fails, it returns <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache entry specified by the source name is not found in the cache storage.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of 
     * <i>lpCacheEntryInfo</i> as specified by 
     * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-retrieveurlcacheentrystreamw
     * @since windows5.0
     */
    static RetrieveUrlCacheEntryStreamW(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo, fRandomRead) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\RetrieveUrlCacheEntryStreamW", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "int", fRandomRead, "uint", dwReserved, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Reads the cached data from a stream that has been opened using the RetrieveUrlCacheEntryStream function.
     * @param {HANDLE} hUrlCacheStream Handle that was returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentrystreama">RetrieveUrlCacheEntryStream</a> function.
     * @param {Integer} dwLocation Offset to be read from.
     * @param {Pointer} lpBuffer Pointer to a buffer that receives the data.
     * @param {Pointer<Integer>} lpdwLen Pointer to a  variable that specifies the size of the 
     * <i>lpBuffer</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-readurlcacheentrystream
     * @since windows5.0
     */
    static ReadUrlCacheEntryStream(hUrlCacheStream, dwLocation, lpBuffer, lpdwLen) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        hUrlCacheStream := hUrlCacheStream is Win32Handle ? NumGet(hUrlCacheStream, "ptr") : hUrlCacheStream

        lpdwLenMarshal := lpdwLen is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\ReadUrlCacheEntryStream", "ptr", hUrlCacheStream, "uint", dwLocation, "ptr", lpBuffer, lpdwLenMarshal, lpdwLen, "uint", Reserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} hUrlCacheStream 
     * @param {Integer} qwLocation 
     * @param {Pointer} lpBuffer 
     * @param {Pointer<Integer>} lpdwLen 
     * @returns {BOOL} 
     */
    static ReadUrlCacheEntryStreamEx(hUrlCacheStream, qwLocation, lpBuffer, lpdwLen) {
        hUrlCacheStream := hUrlCacheStream is Win32Handle ? NumGet(hUrlCacheStream, "ptr") : hUrlCacheStream

        lpdwLenMarshal := lpdwLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\ReadUrlCacheEntryStreamEx", "ptr", hUrlCacheStream, "uint", qwLocation, "ptr", lpBuffer, lpdwLenMarshal, lpdwLen, "int")
        return result
    }

    /**
     * Closes the stream that has been retrieved using the RetrieveUrlCacheEntryStream function.
     * @param {HANDLE} hUrlCacheStream Handle that was returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-retrieveurlcacheentrystreama">RetrieveUrlCacheEntryStream</a> function.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-unlockurlcacheentrystream
     * @since windows5.0
     */
    static UnlockUrlCacheEntryStream(hUrlCacheStream) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        hUrlCacheStream := hUrlCacheStream is Win32Handle ? NumGet(hUrlCacheStream, "ptr") : hUrlCacheStream

        A_LastError := 0

        result := DllCall("WININET.dll\UnlockUrlCacheEntryStream", "ptr", hUrlCacheStream, "uint", Reserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a cache entry.
     * @param {PSTR} lpszUrlName A pointer to a null-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
     * @param {Pointer} lpCacheEntryInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry. A buffer should be allocated for this parameter. 
     * 
     * Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo A pointer to a variable that specifies the size of the 
     * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified cache entry is not found in the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of 
     * <i>lpCacheEntryInfo</i> as specified by 
     * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-geturlcacheentryinfoa
     * @since windows5.0
     */
    static GetUrlCacheEntryInfoA(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GetUrlCacheEntryInfoA", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a cache entry.
     * @param {PWSTR} lpszUrlName A pointer to a null-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
     * @param {Pointer} lpCacheEntryInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry. A buffer should be allocated for this parameter. 
     * 
     * Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo A pointer to a variable that specifies the size of the 
     * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified cache entry is not found in the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of 
     * <i>lpCacheEntryInfo</i> as specified by 
     * <i>lpdwCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-geturlcacheentryinfow
     * @since windows5.0
     */
    static GetUrlCacheEntryInfoW(lpszUrlName, lpCacheEntryInfo, lpcbCacheEntryInfo) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GetUrlCacheEntryInfoW", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initiates the enumeration of the cache groups in the Internet cache.
     * @param {Integer} dwFlags This parameter is reserved and must be 0.
     * @param {Integer} dwFilter 
     * @param {Pointer<Integer>} lpGroupId Pointer to the ID of the first cache group that matches the search criteria.
     * @returns {HANDLE} Returns a valid handle to the first item in the enumeration if successful, or <b>NULL</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
     * <b>GetLastError</b> returns ERROR_NO_MORE_FILES.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findfirsturlcachegroup
     * @since windows5.0
     */
    static FindFirstUrlCacheGroup(dwFlags, dwFilter, lpGroupId) {
        static lpSearchCondition := 0, dwSearchCondition := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpGroupIdMarshal := lpGroupId is VarRef ? "int64*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindFirstUrlCacheGroup", "uint", dwFlags, "uint", dwFilter, "ptr", lpSearchCondition, "uint", dwSearchCondition, lpGroupIdMarshal, lpGroupId, "ptr", lpReserved, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves the next cache group in a cache group enumeration started by FindFirstUrlCacheGroup.
     * @param {HANDLE} hFind The cache group enumeration handle, which is returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcachegroup">FindFirstUrlCacheGroup</a>.
     * @param {Pointer<Integer>} lpGroupId Pointer to a variable that receives the cache group identifier.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findnexturlcachegroup
     * @since windows5.0
     */
    static FindNextUrlCacheGroup(hFind, lpGroupId) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        hFind := hFind is Win32Handle ? NumGet(hFind, "ptr") : hFind

        lpGroupIdMarshal := lpGroupId is VarRef ? "int64*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindNextUrlCacheGroup", "ptr", hFind, lpGroupIdMarshal, lpGroupId, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the attribute information of the specified cache group.
     * @param {Integer} gid Identifier of the cache group.
     * @param {Integer} dwAttributes 
     * @param {Pointer} lpGroupInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_group_infoa">INTERNET_CACHE_GROUP_INFO</a> structure that receives the requested information.
     * @param {Pointer<Integer>} lpcbGroupInfo Pointer to a variable that contains the size of the 
     * <i>lpGroupInfo</i> buffer. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-geturlcachegroupattributea
     * @since windows5.0
     */
    static GetUrlCacheGroupAttributeA(gid, dwAttributes, lpGroupInfo, lpcbGroupInfo) {
        static dwFlags := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpcbGroupInfoMarshal := lpcbGroupInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GetUrlCacheGroupAttributeA", "int64", gid, "uint", dwFlags, "uint", dwAttributes, "ptr", lpGroupInfo, lpcbGroupInfoMarshal, lpcbGroupInfo, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the attribute information of the specified cache group.
     * @param {Integer} gid Identifier of the cache group.
     * @param {Integer} dwAttributes 
     * @param {Pointer} lpGroupInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_group_infoa">INTERNET_CACHE_GROUP_INFO</a> structure that receives the requested information.
     * @param {Pointer<Integer>} lpcbGroupInfo Pointer to a variable that contains the size of the 
     * <i>lpGroupInfo</i> buffer. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-geturlcachegroupattributew
     * @since windows5.0
     */
    static GetUrlCacheGroupAttributeW(gid, dwAttributes, lpGroupInfo, lpcbGroupInfo) {
        static dwFlags := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpcbGroupInfoMarshal := lpcbGroupInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GetUrlCacheGroupAttributeW", "int64", gid, "uint", dwFlags, "uint", dwAttributes, "ptr", lpGroupInfo, lpcbGroupInfoMarshal, lpcbGroupInfo, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the attribute information of the specified cache group.
     * @param {Integer} gid Identifier of the cache group.
     * @param {Integer} dwAttributes 
     * @param {Pointer<INTERNET_CACHE_GROUP_INFOA>} lpGroupInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_group_infoa">INTERNET_CACHE_GROUP_INFO</a> structure that specifies the attribute information to be stored.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-seturlcachegroupattributea
     * @since windows5.0
     */
    static SetUrlCacheGroupAttributeA(gid, dwAttributes, lpGroupInfo) {
        static dwFlags := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WININET.dll\SetUrlCacheGroupAttributeA", "int64", gid, "uint", dwFlags, "uint", dwAttributes, "ptr", lpGroupInfo, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the attribute information of the specified cache group.
     * @param {Integer} gid Identifier of the cache group.
     * @param {Integer} dwAttributes 
     * @param {Pointer<INTERNET_CACHE_GROUP_INFOW>} lpGroupInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_group_infoa">INTERNET_CACHE_GROUP_INFO</a> structure that specifies the attribute information to be stored.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-seturlcachegroupattributew
     * @since windows5.0
     */
    static SetUrlCacheGroupAttributeW(gid, dwAttributes, lpGroupInfo) {
        static dwFlags := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WININET.dll\SetUrlCacheGroupAttributeW", "int64", gid, "uint", dwFlags, "uint", dwAttributes, "ptr", lpGroupInfo, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information on the cache entry associated with the specified URL, taking into account any redirections that are applied in offline mode by the HttpSendRequest function.
     * @param {PSTR} lpszUrl A pointer to a <b>null</b>-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
     * @param {Pointer} lpCacheEntryInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry. A buffer should be allocated for this parameter. 
     * 
     * Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
     * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer in bytes.
     * @param {Integer} dwFlags This parameter is reserved and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if the URL was located, or <b>FALSE</b> otherwise. Call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for specific error information. Possible errors include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL was not found in the cache index, even after taking any cached redirections into account.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer referenced by 
     * <i>lpCacheEntryInfo</i> was not large enough to hold the requested information. The size of the buffer needed will be returned to 
     * <i>lpdwCacheEntryInfoBufSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-geturlcacheentryinfoexa
     * @since windows5.0
     */
    static GetUrlCacheEntryInfoExA(lpszUrl, lpCacheEntryInfo, lpcbCacheEntryInfo, dwFlags) {
        static lpszRedirectUrl := 0, lpcbRedirectUrl := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GetUrlCacheEntryInfoExA", "ptr", lpszUrl, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpszRedirectUrl, "uint*", lpcbRedirectUrl, "ptr", lpReserved, "uint", dwFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information on the cache entry associated with the specified URL, taking into account any redirections that are applied in offline mode by the HttpSendRequest function.
     * @param {PWSTR} lpszUrl A pointer to a <b>null</b>-terminated string that contains the name of the cache entry. The name string should not contain any escape characters.
     * @param {Pointer} lpCacheEntryInfo A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry. A buffer should be allocated for this parameter. 
     * 
     * Since the required size of the buffer is not known in advance,  it is best to allocate a buffer adequate to handle the size of most <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> entries. There is no cache entry size limit, so applications that need to enumerate the cache must be prepared to allocate variable-sized buffers.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
     * <i>lpCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size of the buffer in bytes.
     * @param {Integer} dwFlags This parameter is reserved and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if the URL was located, or <b>FALSE</b> otherwise. Call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for specific error information. Possible errors include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL was not found in the cache index, even after taking any cached redirections into account.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer referenced by 
     * <i>lpCacheEntryInfo</i> was not large enough to hold the requested information. The size of the buffer needed will be returned to 
     * <i>lpdwCacheEntryInfoBufSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-geturlcacheentryinfoexw
     * @since windows5.0
     */
    static GetUrlCacheEntryInfoExW(lpszUrl, lpCacheEntryInfo, lpcbCacheEntryInfo, dwFlags) {
        static lpszRedirectUrl := 0, lpcbRedirectUrl := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\GetUrlCacheEntryInfoExW", "ptr", lpszUrl, "ptr", lpCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpszRedirectUrl, "uint*", lpcbRedirectUrl, "ptr", lpReserved, "uint", dwFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the specified members of the INTERNET_CACHE_ENTRY_INFO structure.
     * @param {PSTR} lpszUrlName Pointer to a null-terminated string that specifies the name of the cache entry. The name string should not contain any escape characters.
     * @param {Pointer<INTERNET_CACHE_ENTRY_INFOA>} lpCacheEntryInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure containing the values to be assigned to the cache entry designated by 
     * <i>lpszUrlName</i>.
     * @param {Integer} dwFieldControl 
     * @returns {BOOL} Returns TRUE if successful, or FALSE otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified cache entry is not found in the cache.
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
     * The value(s) to be set is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-seturlcacheentryinfoa
     * @since windows5.0
     */
    static SetUrlCacheEntryInfoA(lpszUrlName, lpCacheEntryInfo, dwFieldControl) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        A_LastError := 0

        result := DllCall("WININET.dll\SetUrlCacheEntryInfoA", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, "uint", dwFieldControl, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the specified members of the INTERNET_CACHE_ENTRY_INFO structure.
     * @param {PWSTR} lpszUrlName Pointer to a null-terminated string that specifies the name of the cache entry. The name string should not contain any escape characters.
     * @param {Pointer<INTERNET_CACHE_ENTRY_INFOW>} lpCacheEntryInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure containing the values to be assigned to the cache entry designated by 
     * <i>lpszUrlName</i>.
     * @param {Integer} dwFieldControl 
     * @returns {BOOL} Returns TRUE if successful, or FALSE otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified cache entry is not found in the cache.
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
     * The value(s) to be set is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-seturlcacheentryinfow
     * @since windows5.0
     */
    static SetUrlCacheEntryInfoW(lpszUrlName, lpCacheEntryInfo, dwFieldControl) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        A_LastError := 0

        result := DllCall("WININET.dll\SetUrlCacheEntryInfoW", "ptr", lpszUrlName, "ptr", lpCacheEntryInfo, "uint", dwFieldControl, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Generates cache group identifications.
     * @param {Integer} dwFlags Controls the creation of the cache group. This parameter can be set to 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/cache-group-constants">CACHEGROUP_FLAG_GIDONLY</a>, which causes 
     * <b>CreateUrlCacheGroup</b> to generate a unique GROUPID, but does not create a physical group.
     * @returns {Integer} Returns a valid <b>GROUPID</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-createurlcachegroup
     * @since windows5.0
     */
    static CreateUrlCacheGroup(dwFlags) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WININET.dll\CreateUrlCacheGroup", "uint", dwFlags, "ptr", lpReserved, "int64")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Releases the specified GROUPID and any associated state in the cache index file.
     * @param {Integer} GroupId ID of the cache group to be released.
     * @param {Integer} dwFlags Controls the cache group deletion. This can be set to 
     * any member of the <a href="https://docs.microsoft.com/windows/desktop/WinInet/cache-group-constants">cache group constants</a>. When this parameter is set to <a href="https://docs.microsoft.com/windows/desktop/WinInet/cache-group-constants">CACHEGROUP_FLAG_FLUSHURL_ONDELETE</a>, it causes 
     * <b>DeleteUrlCacheGroup</b> to delete all of the cache entries associated with this group, unless the entry belongs to another group.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-deleteurlcachegroup
     * @since windows5.0
     */
    static DeleteUrlCacheGroup(GroupId, dwFlags) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WININET.dll\DeleteUrlCacheGroup", "int64", GroupId, "uint", dwFlags, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds entries to or removes entries from a cache group.
     * @param {PSTR} lpszUrlName Pointer to a <b>null</b>-terminated string value that specifies the URL of the cached resource.
     * @param {Integer} dwFlags 
     * @param {Integer} GroupId Identifier of the cache group that the entry will be added to or removed from.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-seturlcacheentrygroupa
     * @since windows5.0
     */
    static SetUrlCacheEntryGroupA(lpszUrlName, dwFlags, GroupId) {
        static pbGroupAttributes := 0, cbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        result := DllCall("WININET.dll\SetUrlCacheEntryGroupA", "ptr", lpszUrlName, "uint", dwFlags, "int64", GroupId, "char*", pbGroupAttributes, "uint", cbGroupAttributes, "ptr", lpReserved, "int")
        return result
    }

    /**
     * Adds entries to or removes entries from a cache group.
     * @param {PWSTR} lpszUrlName Pointer to a <b>null</b>-terminated string value that specifies the URL of the cached resource.
     * @param {Integer} dwFlags 
     * @param {Integer} GroupId Identifier of the cache group that the entry will be added to or removed from.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-seturlcacheentrygroupw
     * @since windows5.0
     */
    static SetUrlCacheEntryGroupW(lpszUrlName, dwFlags, GroupId) {
        static pbGroupAttributes := 0, cbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        result := DllCall("WININET.dll\SetUrlCacheEntryGroupW", "ptr", lpszUrlName, "uint", dwFlags, "int64", GroupId, "char*", pbGroupAttributes, "uint", cbGroupAttributes, "ptr", lpReserved, "int")
        return result
    }

    /**
     * Adds entries to or removes entries from a cache group.
     * @param {PSTR} lpszUrlName Pointer to a <b>null</b>-terminated string value that specifies the URL of the cached resource.
     * @param {Integer} dwFlags 
     * @param {Integer} GroupId Identifier of the cache group that the entry will be added to or removed from.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-seturlcacheentrygroup
     * @since windows5.0
     */
    static SetUrlCacheEntryGroup(lpszUrlName, dwFlags, GroupId) {
        static pbGroupAttributes := 0, cbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        result := DllCall("WININET.dll\SetUrlCacheEntryGroup", "ptr", lpszUrlName, "uint", dwFlags, "int64", GroupId, "char*", pbGroupAttributes, "uint", cbGroupAttributes, "ptr", lpReserved, "int")
        return result
    }

    /**
     * Starts a filtered enumeration of the Internet cache.
     * @param {PSTR} lpszUrlSearchPattern A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or NULL. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is NULL, <b>FindFirstUrlCacheEntryEx</b> returns all content entries in the cache.
     * @param {Integer} dwFlags Controls the enumeration. No flags are currently implemented; this parameter must be set to zero.
     * @param {Integer} dwFilter A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY).
     * 
     * This parameter can be zero or more of the following property flags, and  cache type flags listed below.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>COOKIE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cookie cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>EDITED_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cache entry file that has been edited externally. This cache entry type is exempt from scavenging. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>NORMAL_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Normal cache entry; can be deleted to recover space for new entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SPARSE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial response cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>STICKY_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sticky cache entry; exempt from scavenging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRACK_OFFLINE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRACK_ONLINE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>URLHISTORY_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Visited link cache entry.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} GroupId ID of the cache group to be enumerated. Set this parameter to zero to enumerate all entries that are not grouped.
     * @param {Pointer} lpFirstCacheEntryInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure to receive the cache entry information.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to variable that indicates the size of 
     * the structure referenced by the <i>lpFirstCacheEntryInfo</i> parameter, in bytes.
     * @returns {HANDLE} Returns a valid handle if successful, or NULL otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
     * <b>GetLastError</b> returns ERROR_NO_MORE_FILES.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findfirsturlcacheentryexa
     * @since windows5.0
     */
    static FindFirstUrlCacheEntryExA(lpszUrlSearchPattern, dwFlags, dwFilter, GroupId, lpFirstCacheEntryInfo, lpcbCacheEntryInfo) {
        static lpGroupAttributes := 0, lpcbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlSearchPattern := lpszUrlSearchPattern is String ? StrPtr(lpszUrlSearchPattern) : lpszUrlSearchPattern

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindFirstUrlCacheEntryExA", "ptr", lpszUrlSearchPattern, "uint", dwFlags, "uint", dwFilter, "int64", GroupId, "ptr", lpFirstCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpGroupAttributes, "uint*", lpcbGroupAttributes, "ptr", lpReserved, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Starts a filtered enumeration of the Internet cache.
     * @param {PWSTR} lpszUrlSearchPattern A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or NULL. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is NULL, <b>FindFirstUrlCacheEntryEx</b> returns all content entries in the cache.
     * @param {Integer} dwFlags Controls the enumeration. No flags are currently implemented; this parameter must be set to zero.
     * @param {Integer} dwFilter A bitmask indicating the type of cache entry and its properties. The cache entry types include: history entries (URLHISTORY_CACHE_ENTRY),  cookie entries  (COOKIE_CACHE_ENTRY), and normal cached content (NORMAL_CACHE_ENTRY).
     * 
     * This parameter can be zero or more of the following property flags, and  cache type flags listed below.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>COOKIE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cookie cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>EDITED_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cache entry file that has been edited externally. This cache entry type is exempt from scavenging. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>NORMAL_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Normal cache entry; can be deleted to recover space for new entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>SPARSE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial response cache entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>STICKY_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sticky cache entry; exempt from scavenging.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRACK_OFFLINE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRACK_ONLINE_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>URLHISTORY_CACHE_ENTRY</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Visited link cache entry.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} GroupId ID of the cache group to be enumerated. Set this parameter to zero to enumerate all entries that are not grouped.
     * @param {Pointer} lpFirstCacheEntryInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure to receive the cache entry information.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to variable that indicates the size of 
     * the structure referenced by the <i>lpFirstCacheEntryInfo</i> parameter, in bytes.
     * @returns {HANDLE} Returns a valid handle if successful, or NULL otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the function finds no matching files, 
     * <b>GetLastError</b> returns ERROR_NO_MORE_FILES.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findfirsturlcacheentryexw
     * @since windows5.0
     */
    static FindFirstUrlCacheEntryExW(lpszUrlSearchPattern, dwFlags, dwFilter, GroupId, lpFirstCacheEntryInfo, lpcbCacheEntryInfo) {
        static lpGroupAttributes := 0, lpcbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        lpszUrlSearchPattern := lpszUrlSearchPattern is String ? StrPtr(lpszUrlSearchPattern) : lpszUrlSearchPattern

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindFirstUrlCacheEntryExW", "ptr", lpszUrlSearchPattern, "uint", dwFlags, "uint", dwFilter, "int64", GroupId, "ptr", lpFirstCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpGroupAttributes, "uint*", lpcbGroupAttributes, "ptr", lpReserved, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Finds the next cache entry in a cache enumeration started by the FindFirstUrlCacheEntryEx function.
     * @param {HANDLE} hEnumHandle Handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentryexa">FindFirstUrlCacheEntryEx</a>, which started a cache enumeration.
     * @param {Pointer} lpNextCacheEntryInfo Pointer to the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives the cache entry information.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that indicates the size of the buffer, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findnexturlcacheentryexa
     * @since windows5.0
     */
    static FindNextUrlCacheEntryExA(hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo) {
        static lpGroupAttributes := 0, lpcbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        hEnumHandle := hEnumHandle is Win32Handle ? NumGet(hEnumHandle, "ptr") : hEnumHandle

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindNextUrlCacheEntryExA", "ptr", hEnumHandle, "ptr", lpNextCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpGroupAttributes, "uint*", lpcbGroupAttributes, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Finds the next cache entry in a cache enumeration started by the FindFirstUrlCacheEntryEx function.
     * @param {HANDLE} hEnumHandle Handle returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentryexa">FindFirstUrlCacheEntryEx</a>, which started a cache enumeration.
     * @param {Pointer} lpNextCacheEntryInfo Pointer to the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives the cache entry information.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that indicates the size of the buffer, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get specific error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findnexturlcacheentryexw
     * @since windows5.0
     */
    static FindNextUrlCacheEntryExW(hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo) {
        static lpGroupAttributes := 0, lpcbGroupAttributes := 0, lpReserved := 0 ;Reserved parameters must always be NULL

        hEnumHandle := hEnumHandle is Win32Handle ? NumGet(hEnumHandle, "ptr") : hEnumHandle

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindNextUrlCacheEntryExW", "ptr", hEnumHandle, "ptr", lpNextCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr", lpGroupAttributes, "uint*", lpcbGroupAttributes, "ptr", lpReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Begins the enumeration of the Internet cache.
     * @param {PSTR} lpszUrlSearchPattern A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or <b>NULL</b>. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is <b>NULL</b>, <b>FindFirstUrlCacheEntry</b> returns all content entries in the cache.
     * @param {Pointer} lpFirstCacheEntryInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
     * <i>lpFirstCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size needed to retrieve the cache entry, in bytes.
     * @returns {HANDLE} Returns a handle that the application can use in the 
     * <a href="/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentrya">FindNextUrlCacheEntry</a> function to retrieve subsequent entries in the cache. If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * ERROR_INSUFFICIENT_BUFFER indicates that the size of 
     * <i>lpFirstCacheEntryInfo</i> as specified by 
     * <i>lpdwFirstCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwFirstCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findfirsturlcacheentrya
     * @since windows5.0
     */
    static FindFirstUrlCacheEntryA(lpszUrlSearchPattern, lpFirstCacheEntryInfo, lpcbCacheEntryInfo) {
        lpszUrlSearchPattern := lpszUrlSearchPattern is String ? StrPtr(lpszUrlSearchPattern) : lpszUrlSearchPattern

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindFirstUrlCacheEntryA", "ptr", lpszUrlSearchPattern, "ptr", lpFirstCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Begins the enumeration of the Internet cache.
     * @param {PWSTR} lpszUrlSearchPattern A pointer to a string that contains the source name pattern to search for. This parameter can only be set to "cookie:", "visited:", or <b>NULL</b>. Set this parameter to "cookie:" to enumerate the cookies or "visited:" to enumerate the URL History entries in the cache. If this parameter is <b>NULL</b>, <b>FindFirstUrlCacheEntry</b> returns all content entries in the cache.
     * @param {Pointer} lpFirstCacheEntryInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
     * <i>lpFirstCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the required size needed to retrieve the cache entry, in bytes.
     * @returns {HANDLE} Returns a handle that the application can use in the 
     * <a href="/windows/desktop/api/wininet/nf-wininet-findnexturlcacheentrya">FindNextUrlCacheEntry</a> function to retrieve subsequent entries in the cache. If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * ERROR_INSUFFICIENT_BUFFER indicates that the size of 
     * <i>lpFirstCacheEntryInfo</i> as specified by 
     * <i>lpdwFirstCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwFirstCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findfirsturlcacheentryw
     * @since windows5.0
     */
    static FindFirstUrlCacheEntryW(lpszUrlSearchPattern, lpFirstCacheEntryInfo, lpcbCacheEntryInfo) {
        lpszUrlSearchPattern := lpszUrlSearchPattern is String ? StrPtr(lpszUrlSearchPattern) : lpszUrlSearchPattern

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindFirstUrlCacheEntryW", "ptr", lpszUrlSearchPattern, "ptr", lpFirstCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves the next entry in the Internet cache.
     * @param {HANDLE} hEnumHandle Handle to the enumeration obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentrya">FindFirstUrlCacheEntry</a>.
     * @param {Pointer} lpNextCacheEntryInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
     * <i>lpNextCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the size of the buffer required to retrieve the cache entry, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of 
     * <i>lpNextCacheEntryInfo</i> as specified by 
     * <i>lpdwNextCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwNextCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration completed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findnexturlcacheentrya
     * @since windows5.0
     */
    static FindNextUrlCacheEntryA(hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo) {
        hEnumHandle := hEnumHandle is Win32Handle ? NumGet(hEnumHandle, "ptr") : hEnumHandle

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindNextUrlCacheEntryA", "ptr", hEnumHandle, "ptr", lpNextCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the next entry in the Internet cache.
     * @param {HANDLE} hEnumHandle Handle to the enumeration obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentrya">FindFirstUrlCacheEntry</a>.
     * @param {Pointer} lpNextCacheEntryInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-internet_cache_entry_infoa">INTERNET_CACHE_ENTRY_INFO</a> structure that receives information about the cache entry.
     * @param {Pointer<Integer>} lpcbCacheEntryInfo Pointer to a variable that specifies the size of the 
     * <i>lpNextCacheEntryInfo</i> buffer, in bytes. When the function returns, the variable contains the number of bytes copied to the buffer, or the size of the buffer required to retrieve the cache entry, in bytes.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of 
     * <i>lpNextCacheEntryInfo</i> as specified by 
     * <i>lpdwNextCacheEntryInfoBufferSize</i> is not sufficient to contain all the information. The value returned in 
     * <i>lpdwNextCacheEntryInfoBufferSize</i> indicates the buffer size necessary to contain all the information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The enumeration completed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findnexturlcacheentryw
     * @since windows5.0
     */
    static FindNextUrlCacheEntryW(hEnumHandle, lpNextCacheEntryInfo, lpcbCacheEntryInfo) {
        hEnumHandle := hEnumHandle is Win32Handle ? NumGet(hEnumHandle, "ptr") : hEnumHandle

        lpcbCacheEntryInfoMarshal := lpcbCacheEntryInfo is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\FindNextUrlCacheEntryW", "ptr", hEnumHandle, "ptr", lpNextCacheEntryInfo, lpcbCacheEntryInfoMarshal, lpcbCacheEntryInfo, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes the specified cache enumeration handle.
     * @param {HANDLE} hEnumHandle Handle returned by a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-findfirsturlcacheentrya">FindFirstUrlCacheEntry</a> function.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-findcloseurlcache
     * @since windows5.0
     */
    static FindCloseUrlCache(hEnumHandle) {
        hEnumHandle := hEnumHandle is Win32Handle ? NumGet(hEnumHandle, "ptr") : hEnumHandle

        A_LastError := 0

        result := DllCall("WININET.dll\FindCloseUrlCache", "ptr", hEnumHandle, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes the file associated with the source name from the cache, if the file exists.
     * @param {PSTR} lpszUrlName Pointer to a string that contains the name of the source that corresponds to the cache entry.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is locked or in use. The entry is marked and  deleted when the file is unlocked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is not in the cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-deleteurlcacheentrya
     * @since windows5.0
     */
    static DeleteUrlCacheEntryA(lpszUrlName) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        A_LastError := 0

        result := DllCall("WININET.dll\DeleteUrlCacheEntryA", "ptr", lpszUrlName, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes the file associated with the source name from the cache, if the file exists.
     * @param {PWSTR} lpszUrlName Pointer to a string that contains the name of the source that corresponds to the cache entry.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is locked or in use. The entry is marked and  deleted when the file is unlocked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is not in the cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-deleteurlcacheentryw
     * @since windows5.0
     */
    static DeleteUrlCacheEntryW(lpszUrlName) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        A_LastError := 0

        result := DllCall("WININET.dll\DeleteUrlCacheEntryW", "ptr", lpszUrlName, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes the file associated with the source name from the cache, if the file exists.
     * @param {PSTR} lpszUrlName Pointer to a string that contains the name of the source that corresponds to the cache entry.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. Possible error values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is locked or in use. The entry is marked and  deleted when the file is unlocked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file is not in the cache.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-deleteurlcacheentry
     * @since windows5.0
     */
    static DeleteUrlCacheEntry(lpszUrlName) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        A_LastError := 0

        result := DllCall("WININET.dll\DeleteUrlCacheEntry", "ptr", lpszUrlName, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initiates a connection to the Internet using a modem.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {PSTR} lpszConnectoid Pointer to a <b>null</b>-terminated string that specifies the name of the dial-up connection to be used. If this parameter contains the empty string (""), the user chooses the connection. If this parameter is <b>NULL</b>, the function connects to the autodial connection.
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer>} lpdwConnection Pointer to a variable that specifies the connection number. This number is a unique indentifier for the connection that can be used in other functions, such as <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internethangup">InternetHangUp</a>.
     * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise. The error code can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
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
     * <dt><b>ERROR_NO_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a problem with the dial-up connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_USER_DISCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked either the <b>Work Offline</b> or <b>Cancel</b> button on the Internet connection dialog box.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetdiala
     * @since windows5.0
     */
    static InternetDialA(hwndParent, lpszConnectoid, dwFlags, lpdwConnection) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

        lpdwConnectionMarshal := lpdwConnection is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\InternetDialA", "ptr", hwndParent, "ptr", lpszConnectoid, "uint", dwFlags, lpdwConnectionMarshal, lpdwConnection, "uint", dwReserved, "uint")
        return result
    }

    /**
     * Initiates a connection to the Internet using a modem.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {PWSTR} lpszConnectoid Pointer to a <b>null</b>-terminated string that specifies the name of the dial-up connection to be used. If this parameter contains the empty string (""), the user chooses the connection. If this parameter is <b>NULL</b>, the function connects to the autodial connection.
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer>} lpdwConnection Pointer to a variable that specifies the connection number. This number is a unique indentifier for the connection that can be used in other functions, such as <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internethangup">InternetHangUp</a>.
     * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise. The error code can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
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
     * <dt><b>ERROR_NO_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a problem with the dial-up connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_USER_DISCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked either the <b>Work Offline</b> or <b>Cancel</b> button on the Internet connection dialog box.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetdialw
     * @since windows5.0
     */
    static InternetDialW(hwndParent, lpszConnectoid, dwFlags, lpdwConnection) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

        lpdwConnectionMarshal := lpdwConnection is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\InternetDialW", "ptr", hwndParent, "ptr", lpszConnectoid, "uint", dwFlags, lpdwConnectionMarshal, lpdwConnection, "uint", dwReserved, "uint")
        return result
    }

    /**
     * Initiates a connection to the Internet using a modem.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {PSTR} lpszConnectoid Pointer to a <b>null</b>-terminated string that specifies the name of the dial-up connection to be used. If this parameter contains the empty string (""), the user chooses the connection. If this parameter is <b>NULL</b>, the function connects to the autodial connection.
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} lpdwConnection Pointer to a variable that specifies the connection number. This number is a unique indentifier for the connection that can be used in other functions, such as <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-internethangup">InternetHangUp</a>.
     * @param {Integer} dwReserved This parameter is reserved and must be <b>NULL</b>.
     * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise. The error code can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
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
     * <dt><b>ERROR_NO_CONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a problem with the dial-up connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_USER_DISCONNECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user clicked either the <b>Work Offline</b> or <b>Cancel</b> button on the Internet connection dialog box.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetdial
     * @since windows5.0
     */
    static InternetDial(hwndParent, lpszConnectoid, dwFlags, lpdwConnection, dwReserved) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

        lpdwConnectionMarshal := lpdwConnection is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetDial", "ptr", hwndParent, "ptr", lpszConnectoid, "uint", dwFlags, lpdwConnectionMarshal, lpdwConnection, "uint", dwReserved, "uint")
        return result
    }

    /**
     * Instructs the modem to disconnect from the Internet.
     * @param {Pointer} dwConnection Connection number of  the connection to be disconnected.
     * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internethangup
     * @since windows5.0
     */
    static InternetHangUp(dwConnection) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("WININET.dll\InternetHangUp", "ptr", dwConnection, "uint", dwReserved, "uint")
        return result
    }

    /**
     * Prompts the user for permission to initiate connection to a URL.
     * @param {PSTR} lpszURL Pointer to a null-terminated string that specifies the URL of the website for the connection.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {Integer} dwFlags This parameter can be zero or the following flag.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_GOONLINE_REFRESH"></a><a id="internet_goonline_refresh"></a><dl>
     * <dt><b>INTERNET_GOONLINE_REFRESH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is not used.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * 
     * If the functions fails, it can  return the following error code:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is incorrect.
     * 
     * The <i>dwFlags</i> parameter contains a value other than zero or <b>INTERNET_GOONLINE_REFRESH</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgoonlinea
     * @since windows5.0
     */
    static InternetGoOnlineA(lpszURL, hwndParent, dwFlags) {
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGoOnlineA", "ptr", lpszURL, "ptr", hwndParent, "uint", dwFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Prompts the user for permission to initiate connection to a URL.
     * @param {PWSTR} lpszURL Pointer to a null-terminated string that specifies the URL of the website for the connection.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {Integer} dwFlags This parameter can be zero or the following flag.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_GOONLINE_REFRESH"></a><a id="internet_goonline_refresh"></a><dl>
     * <dt><b>INTERNET_GOONLINE_REFRESH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is not used.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * 
     * If the functions fails, it can  return the following error code:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is incorrect.
     * 
     * The <i>dwFlags</i> parameter contains a value other than zero or <b>INTERNET_GOONLINE_REFRESH</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgoonlinew
     * @since windows5.0
     */
    static InternetGoOnlineW(lpszURL, hwndParent, dwFlags) {
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGoOnlineW", "ptr", lpszURL, "ptr", hwndParent, "uint", dwFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Prompts the user for permission to initiate connection to a URL.
     * @param {PSTR} lpszURL Pointer to a null-terminated string that specifies the URL of the website for the connection.
     * @param {HWND} hwndParent Handle to the parent window.
     * @param {Integer} dwFlags This parameter can be zero or the following flag.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INTERNET_GOONLINE_REFRESH"></a><a id="internet_goonline_refresh"></a><dl>
     * <dt><b>INTERNET_GOONLINE_REFRESH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is not used.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * 
     * If the functions fails, it can  return the following error code:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is incorrect.
     * 
     * The <i>dwFlags</i> parameter contains a value other than zero or <b>INTERNET_GOONLINE_REFRESH</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgoonline
     * @since windows5.0
     */
    static InternetGoOnline(lpszURL, hwndParent, dwFlags) {
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGoOnline", "ptr", lpszURL, "ptr", hwndParent, "uint", dwFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Causes the modem to automatically dial the default Internet connection.
     * @param {Integer} dwFlags 
     * @param {HWND} hwndParent Handle to the parent window.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetautodial
     * @since windows5.0
     */
    static InternetAutodial(dwFlags, hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        A_LastError := 0

        result := DllCall("WININET.dll\InternetAutodial", "uint", dwFlags, "ptr", hwndParent, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Disconnects an automatic dial-up connection.
     * @returns {BOOL} If the function succeeds, it returns <b>TRUE</b>.
     * 
     * 
     * If the function fails, it returns <b>FALSE</b>. Applications can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetautodialhangup
     * @since windows5.0
     */
    static InternetAutodialHangup() {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WININET.dll\InternetAutodialHangup", "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Note  Using this API is not recommended, use the INetworkListManager::GetConnectivity method instead. Retrieves the connected state of the local system.
     * @param {Pointer<Integer>} lpdwFlags 
     * @returns {BOOL} Returns <b>TRUE</b> if there is an active modem or a LAN Internet connection, or <b>FALSE</b> if there is no Internet connection, or if all possible Internet connections are not currently active. For more information, see the Remarks section.
     * 
     * When <b>InternetGetConnectedState</b> returns <b>FALSE</b>, the application can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>  to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetconnectedstate
     * @since windows5.0
     */
    static InternetGetConnectedState(lpdwFlags) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetConnectedState", lpdwFlagsMarshal, lpdwFlags, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Note  Using this API is not recommended, use the INetworkListManager::GetConnectivity method instead. Retrieves the connected state of the specified Internet connection.
     * @param {Pointer<Integer>} lpdwFlags 
     * @param {PSTR} lpszConnectionName Pointer to a string value that receives the connection name.
     * @param {Integer} cchNameLen TBD
     * @returns {BOOL} Returns <b>TRUE</b> if there is an Internet connection, or <b>FALSE</b> if there is no Internet connection, or if all possible Internet connections are not currently active. For more information, see the Remarks section.
     * 
     * When <a href="/windows/desktop/api/wininet/nf-wininet-internetgetconnectedstate">InternetGetConnectedState</a> returns <b>FALSE</b>, the application can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetconnectedstateexa
     * @since windows5.0
     */
    static InternetGetConnectedStateExA(lpdwFlags, lpszConnectionName, cchNameLen) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszConnectionName := lpszConnectionName is String ? StrPtr(lpszConnectionName) : lpszConnectionName

        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetConnectedStateExA", lpdwFlagsMarshal, lpdwFlags, "ptr", lpszConnectionName, "uint", cchNameLen, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Note  Using this API is not recommended, use the INetworkListManager::GetConnectivity method instead. Retrieves the connected state of the specified Internet connection.
     * @param {Pointer<Integer>} lpdwFlags 
     * @param {PWSTR} lpszConnectionName Pointer to a string value that receives the connection name.
     * @param {Integer} cchNameLen TBD
     * @returns {BOOL} Returns <b>TRUE</b> if there is an Internet connection, or <b>FALSE</b> if there is no Internet connection, or if all possible Internet connections are not currently active. For more information, see the Remarks section.
     * 
     * When <a href="/windows/desktop/api/wininet/nf-wininet-internetgetconnectedstate">InternetGetConnectedState</a> returns <b>FALSE</b>, the application can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetconnectedstateexw
     * @since windows5.0
     */
    static InternetGetConnectedStateExW(lpdwFlags, lpszConnectionName, cchNameLen) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszConnectionName := lpszConnectionName is String ? StrPtr(lpszConnectionName) : lpszConnectionName

        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetConnectedStateExW", lpdwFlagsMarshal, lpdwFlags, "ptr", lpszConnectionName, "uint", cchNameLen, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {BOOL} 
     */
    static DeleteWpadCacheForNetworks(param0) {
        result := DllCall("WININET.dll\DeleteWpadCacheForNetworks", "int", param0, "int")
        return result
    }

    /**
     * There are two WinINet functions named InternetInitializeAutoProxyDll.
     * @param {Integer} dwReserved This parameter is reserved and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetinitializeautoproxydll
     * @since windows5.0
     */
    static InternetInitializeAutoProxyDll(dwReserved) {
        A_LastError := 0

        result := DllCall("WININET.dll\InternetInitializeAutoProxyDll", "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Attempts to determine the location of a WPAD autoproxy script.
     * @param {PSTR} pszAutoProxyUrl Pointer to a buffer to receive the URL from which a WPAD autoproxy script can be downloaded.
     * @param {Integer} cchAutoProxyUrl Size of 
     * the buffer pointed to by <i>lpszAutoProxyUrl</i>, in bytes.
     * @param {Integer} dwDetectFlags 
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-detectautoproxyurl
     * @since windows5.0
     */
    static DetectAutoProxyUrl(pszAutoProxyUrl, cchAutoProxyUrl, dwDetectFlags) {
        pszAutoProxyUrl := pszAutoProxyUrl is String ? StrPtr(pszAutoProxyUrl) : pszAutoProxyUrl

        A_LastError := 0

        result := DllCall("WININET.dll\DetectAutoProxyUrl", "ptr", pszAutoProxyUrl, "uint", cchAutoProxyUrl, "uint", dwDetectFlags, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * The CreateMD5SSOHash function obtains the default Microsoft Passport password for a specified account or realm, creates an MD5 hash from it using a specified wide-character challenge string, and returns the result as a string of hexadecimal digit bytes.
     * @param {PWSTR} pszChallengeInfo Pointer to the wide-character challenge string to use for the MD5 hash.
     * @param {PWSTR} pwszRealm Pointer to a string that names a realm for which to obtain the password. This parameter is ignored unless <i>pwszTarget</i> is <b>NULL</b>. If both <i>pwszTarget</i> and <i>pwszRealm</i> are <b>NULL</b>, the default realm is used.
     * @param {PWSTR} pwszTarget Pointer to a string that names an account for which to obtain the password. If <i>pwszTarget</i> is <b>NULL</b>, the realm indicated by <i>pwszRealm</i> is used.
     * @param {Pointer<Integer>} pbHexHash Pointer to an output buffer into which the MD5 hash is returned in hex string format. This buffer must be at least 33 bytes long.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-createmd5ssohash
     * @since windows5.0
     */
    static CreateMD5SSOHash(pszChallengeInfo, pwszRealm, pwszTarget, pbHexHash) {
        pszChallengeInfo := pszChallengeInfo is String ? StrPtr(pszChallengeInfo) : pszChallengeInfo
        pwszRealm := pwszRealm is String ? StrPtr(pwszRealm) : pwszRealm
        pwszTarget := pwszTarget is String ? StrPtr(pwszTarget) : pwszTarget

        pbHexHashMarshal := pbHexHash is VarRef ? "char*" : "ptr"

        result := DllCall("WININET.dll\CreateMD5SSOHash", "ptr", pszChallengeInfo, "ptr", pwszRealm, "ptr", pwszTarget, pbHexHashMarshal, pbHexHash, "int")
        return result
    }

    /**
     * Note  Using this API is not recommended, use the INetworkListManager::GetConnectivity method instead. Retrieves the connected state of the specified Internet connection.
     * @param {Pointer<Integer>} lpdwFlags 
     * @param {PSTR} lpszConnectionName Pointer to a string value that receives the connection name.
     * @param {Integer} dwNameLen Size of the 
     * <i>lpszConnectionName</i> string, in <b>TCHARs</b>.
     * @param {Integer} dwReserved This parameter is reserved and must be <b>NULL</b>.
     * @returns {BOOL} Returns <b>TRUE</b> if there is an Internet connection, or <b>FALSE</b> if there is no Internet connection, or if all possible Internet connections are not currently active. For more information, see the Remarks section.
     * 
     * When <a href="/windows/desktop/api/wininet/nf-wininet-internetgetconnectedstate">InternetGetConnectedState</a> returns <b>FALSE</b>, the application can call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetconnectedstateex
     * @since windows5.0
     */
    static InternetGetConnectedStateEx(lpdwFlags, lpszConnectionName, dwNameLen, dwReserved) {
        lpszConnectionName := lpszConnectionName is String ? StrPtr(lpszConnectionName) : lpszConnectionName

        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WININET.dll\InternetGetConnectedStateEx", lpdwFlagsMarshal, lpdwFlags, "ptr", lpszConnectionName, "uint", dwNameLen, "uint", dwReserved, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Not supported.This function is obsolete. Do not use.
     * @param {PSTR} lpszConnectoid Unused.
     * @param {Integer} dwState Unused.
     * @returns {BOOL} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetdialstatea
     */
    static InternetSetDialStateA(lpszConnectoid, dwState) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

        result := DllCall("WININET.dll\InternetSetDialStateA", "ptr", lpszConnectoid, "uint", dwState, "uint", dwReserved, "int")
        return result
    }

    /**
     * Not supported.This function is obsolete. Do not use.
     * @param {PWSTR} lpszConnectoid Unused.
     * @param {Integer} dwState Unused.
     * @returns {BOOL} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetdialstatew
     */
    static InternetSetDialStateW(lpszConnectoid, dwState) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

        result := DllCall("WININET.dll\InternetSetDialStateW", "ptr", lpszConnectoid, "uint", dwState, "uint", dwReserved, "int")
        return result
    }

    /**
     * Not supported.This function is obsolete. Do not use.
     * @param {PSTR} lpszConnectoid Unused.
     * @param {Integer} dwState Unused.
     * @param {Integer} dwReserved Unused.
     * @returns {BOOL} This function does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetdialstate
     */
    static InternetSetDialState(lpszConnectoid, dwState, dwReserved) {
        lpszConnectoid := lpszConnectoid is String ? StrPtr(lpszConnectoid) : lpszConnectoid

        result := DllCall("WININET.dll\InternetSetDialState", "ptr", lpszConnectoid, "uint", dwState, "uint", dwReserved, "int")
        return result
    }

    /**
     * Sets a decision on cookies for a given domain.
     * @param {PSTR} pchHostName An <b>LPCTSTR</b> that points to a string containing a domain.
     * @param {Integer} dwDecision A value of type <b>DWORD</b> that contains one of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration values.
     * @returns {BOOL} Returns <b>TRUE</b> if the decision is set and <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetpersitecookiedecisiona
     * @since windows5.0
     */
    static InternetSetPerSiteCookieDecisionA(pchHostName, dwDecision) {
        pchHostName := pchHostName is String ? StrPtr(pchHostName) : pchHostName

        result := DllCall("WININET.dll\InternetSetPerSiteCookieDecisionA", "ptr", pchHostName, "uint", dwDecision, "int")
        return result
    }

    /**
     * Sets a decision on cookies for a given domain.
     * @param {PWSTR} pchHostName An <b>LPCTSTR</b> that points to a string containing a domain.
     * @param {Integer} dwDecision A value of type <b>DWORD</b> that contains one of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration values.
     * @returns {BOOL} Returns <b>TRUE</b> if the decision is set and <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetsetpersitecookiedecisionw
     * @since windows5.0
     */
    static InternetSetPerSiteCookieDecisionW(pchHostName, dwDecision) {
        pchHostName := pchHostName is String ? StrPtr(pchHostName) : pchHostName

        result := DllCall("WININET.dll\InternetSetPerSiteCookieDecisionW", "ptr", pchHostName, "uint", dwDecision, "int")
        return result
    }

    /**
     * Retrieves a decision on cookies for a given domain.
     * @param {PSTR} pchHostName An <b>LPCTSTR</b> that points to a string containing a domain.
     * @param {Pointer<Integer>} pResult A pointer to an <b>unsigned long</b> that contains one of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration values.
     * @returns {BOOL} Returns <b>TRUE</b> if the decision was retrieved and <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetpersitecookiedecisiona
     * @since windows5.0
     */
    static InternetGetPerSiteCookieDecisionA(pchHostName, pResult) {
        pchHostName := pchHostName is String ? StrPtr(pchHostName) : pchHostName

        pResultMarshal := pResult is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetGetPerSiteCookieDecisionA", "ptr", pchHostName, pResultMarshal, pResult, "int")
        return result
    }

    /**
     * Retrieves a decision on cookies for a given domain.
     * @param {PWSTR} pchHostName An <b>LPCTSTR</b> that points to a string containing a domain.
     * @param {Pointer<Integer>} pResult A pointer to an <b>unsigned long</b> that contains one of the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration values.
     * @returns {BOOL} Returns <b>TRUE</b> if the decision was retrieved and <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetgetpersitecookiedecisionw
     * @since windows5.0
     */
    static InternetGetPerSiteCookieDecisionW(pchHostName, pResult) {
        pchHostName := pchHostName is String ? StrPtr(pchHostName) : pchHostName

        pResultMarshal := pResult is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetGetPerSiteCookieDecisionW", "ptr", pchHostName, pResultMarshal, pResult, "int")
        return result
    }

    /**
     * Clears all decisions that were made about cookies on a site by site basis.
     * @returns {BOOL} Returns <b>TRUE</b> if all decisions were cleared and <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetclearallpersitecookiedecisions
     * @since windows5.0
     */
    static InternetClearAllPerSiteCookieDecisions() {
        result := DllCall("WININET.dll\InternetClearAllPerSiteCookieDecisions", "int")
        return result
    }

    /**
     * Retrieves the domains and cookie settings of websites for which site-specific cookie regulations are set.
     * @param {PSTR} pszSiteName An <b>LPSTR</b> that receives a string specifying a website domain.
     * @param {Pointer<Integer>} pcSiteNameSize A pointer to an unsigned long that specifies the size of the <i>pcSiteNameSize</i> parameter provided to the InternetEnumPerSiteCookieDecision function when it is called. When <b>InternetEnumPerSiteCookieDecision</b> returns, <i>pcSiteNameSize</i> receives the actual length of the domain string returned in <i>pszSiteName</i>.
     * @param {Pointer<Integer>} pdwDecision Pointer to an unsigned long that receives the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration value corresponding to <i>pszSiteName</i>.
     * @param {Integer} dwIndex An unsigned long that specifies the index of the website and corresponding cookie setting to retrieve.
     * @returns {BOOL} <b>TRUE</b> if the function retrieved the cookie setting for the given domain; otherwise, false. <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetenumpersitecookiedecisiona
     * @since windows5.0
     */
    static InternetEnumPerSiteCookieDecisionA(pszSiteName, pcSiteNameSize, pdwDecision, dwIndex) {
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName

        pcSiteNameSizeMarshal := pcSiteNameSize is VarRef ? "uint*" : "ptr"
        pdwDecisionMarshal := pdwDecision is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetEnumPerSiteCookieDecisionA", "ptr", pszSiteName, pcSiteNameSizeMarshal, pcSiteNameSize, pdwDecisionMarshal, pdwDecision, "uint", dwIndex, "int")
        return result
    }

    /**
     * Retrieves the domains and cookie settings of websites for which site-specific cookie regulations are set.
     * @param {PWSTR} pszSiteName An <b>LPSTR</b> that receives a string specifying a website domain.
     * @param {Pointer<Integer>} pcSiteNameSize A pointer to an unsigned long that specifies the size of the <i>pcSiteNameSize</i> parameter provided to the InternetEnumPerSiteCookieDecision function when it is called. When <b>InternetEnumPerSiteCookieDecision</b> returns, <i>pcSiteNameSize</i> receives the actual length of the domain string returned in <i>pszSiteName</i>.
     * @param {Pointer<Integer>} pdwDecision Pointer to an unsigned long that receives the <a href="https://docs.microsoft.com/windows/win32/api/wininet/ne-wininet-internet_scheme">InternetCookieState</a> enumeration value corresponding to <i>pszSiteName</i>.
     * @param {Integer} dwIndex An unsigned long that specifies the index of the website and corresponding cookie setting to retrieve.
     * @returns {BOOL} <b>TRUE</b> if the function retrieved the cookie setting for the given domain; otherwise, false. <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-internetenumpersitecookiedecisionw
     * @since windows5.0
     */
    static InternetEnumPerSiteCookieDecisionW(pszSiteName, pcSiteNameSize, pdwDecision, dwIndex) {
        pszSiteName := pszSiteName is String ? StrPtr(pszSiteName) : pszSiteName

        pcSiteNameSizeMarshal := pcSiteNameSize is VarRef ? "uint*" : "ptr"
        pdwDecisionMarshal := pdwDecision is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetEnumPerSiteCookieDecisionW", "ptr", pszSiteName, pcSiteNameSizeMarshal, pcSiteNameSize, pdwDecisionMarshal, pdwDecision, "uint", dwIndex, "int")
        return result
    }

    /**
     * Sets the privacy settings for a given URLZONE and PrivacyType.
     * @param {Integer} dwZone Value of type <b>DWORD</b> that specifies the <a href="https://docs.microsoft.com/dotnet/api/microsoft.visualstudio.ole.interop.urlzone?view=visualstudiosdk-2017">URLZONE</a>for which privacy settings are being set.
     * @param {Integer} dwType Value of type <b>DWORD</b> that specifies the <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-type">PrivacyType</a> for which privacy settings are being set.
     * @param {Integer} dwTemplate Value of type <b>DWORD</b> that specifies which of the <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-templates">privacy templates</a> is to be used to set the privacy settings.
     * @param {PWSTR} pszPreference If <i>dwTemplate</i> is set to <b>PRIVACY_TEMPLATE_CUSTOM</b>, this parameter is the string representation of the custom preferences. Otherwise, it should be set to <b>NULL</b>. A description of this string representation is included in the Remarks section.
     * @returns {Integer} Returns zero if successful. Otherwise, one of the errors defined in winerr.h is returned.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-privacysetzonepreferencew
     * @since windows5.0
     */
    static PrivacySetZonePreferenceW(dwZone, dwType, dwTemplate, pszPreference) {
        pszPreference := pszPreference is String ? StrPtr(pszPreference) : pszPreference

        result := DllCall("WININET.dll\PrivacySetZonePreferenceW", "uint", dwZone, "uint", dwType, "uint", dwTemplate, "ptr", pszPreference, "uint")
        return result
    }

    /**
     * Retrieves the privacy settings for a given URLZONE and PrivacyType.
     * @param {Integer} dwZone A value of type <i>DWORD</i> that specifies the <a href="https://docs.microsoft.com/dotnet/api/microsoft.visualstudio.ole.interop.urlzone?view=visualstudiosdk-2017">URLZONE</a> for which privacy settings are being retrieved.
     * @param {Integer} dwType A value of type <i>DWORD</i> that specifies the <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-type">PrivacyType</a> for which privacy settings are being retrieved.
     * @param {Pointer<Integer>} pdwTemplate An <b>LPDWORD</b> that returns a pointer to a <b>DWORD</b> containing which of the <a href="https://docs.microsoft.com/windows/desktop/WinInet/privacy-templates">PrivacyTemplates</a> is in use for this <i>dwZone</i> and <i>dwType</i>.
     * @param {PWSTR} pszBuffer An  <b>LPWSTR</b> that points to a buffer containing a <b>LPCWSTR</b> representing a string version of the <i>pdwTemplate</i> or a customized string if the <i>pdwTemplate</i> is set to <b>PRIVACY_TEMPLATE_CUSTOM</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/wininet/nf-wininet-privacysetzonepreferencew">PrivacySetZonePreferenceW</a> for a description of a customized privacy preferences string.
     * @param {Pointer<Integer>} pdwBufferLength An <b>LPDWORD</b> that contains the buffer length in characters. If the buffer length is not sufficient, <b>PrivacyGetZonePreferenceW</b> returns with this parameter set to the number of characters required and with a return value of <b>ERROR_MORE_DATA</b>.
     * @returns {Integer} Returns zero if successful. Otherwise, one of the Error Messages defined in winerr.h is returned.
     * @see https://docs.microsoft.com/windows/win32/api//wininet/nf-wininet-privacygetzonepreferencew
     * @since windows5.0
     */
    static PrivacyGetZonePreferenceW(dwZone, dwType, pdwTemplate, pszBuffer, pdwBufferLength) {
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        pdwTemplateMarshal := pdwTemplate is VarRef ? "uint*" : "ptr"
        pdwBufferLengthMarshal := pdwBufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\PrivacyGetZonePreferenceW", "uint", dwZone, "uint", dwType, pdwTemplateMarshal, pdwTemplate, "ptr", pszBuffer, pdwBufferLengthMarshal, pdwBufferLength, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pcwszUrl 
     * @param {Pointer<BOOL>} pfIsHsts 
     * @returns {Integer} 
     */
    static HttpIsHostHstsEnabled(pcwszUrl, pfIsHsts) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

        pfIsHstsMarshal := pfIsHsts is VarRef ? "int*" : "ptr"

        result := DllCall("WININET.dll\HttpIsHostHstsEnabled", "ptr", pcwszUrl, pfIsHstsMarshal, pfIsHsts, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ai 
     * @param {PSTR} lpstr 
     * @param {Pointer<Integer>} lpdwstrLength 
     * @returns {BOOL} 
     */
    static InternetAlgIdToStringA(ai, lpstr, lpdwstrLength) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        lpdwstrLengthMarshal := lpdwstrLength is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetAlgIdToStringA", "uint", ai, "ptr", lpstr, lpdwstrLengthMarshal, lpdwstrLength, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ai 
     * @param {PWSTR} lpstr 
     * @param {Pointer<Integer>} lpdwstrLength 
     * @returns {BOOL} 
     */
    static InternetAlgIdToStringW(ai, lpstr, lpdwstrLength) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        lpdwstrLengthMarshal := lpdwstrLength is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetAlgIdToStringW", "uint", ai, "ptr", lpstr, lpdwstrLengthMarshal, lpdwstrLength, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwProtocol 
     * @param {PSTR} lpstr 
     * @param {Pointer<Integer>} lpdwstrLength 
     * @returns {BOOL} 
     */
    static InternetSecurityProtocolToStringA(dwProtocol, lpstr, lpdwstrLength) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        lpdwstrLengthMarshal := lpdwstrLength is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetSecurityProtocolToStringA", "uint", dwProtocol, "ptr", lpstr, lpdwstrLengthMarshal, lpdwstrLength, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwProtocol 
     * @param {PWSTR} lpstr 
     * @param {Pointer<Integer>} lpdwstrLength 
     * @returns {BOOL} 
     */
    static InternetSecurityProtocolToStringW(dwProtocol, lpstr, lpdwstrLength) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        lpdwstrLengthMarshal := lpdwstrLength is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetSecurityProtocolToStringW", "uint", dwProtocol, "ptr", lpstr, lpdwstrLengthMarshal, lpdwstrLength, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} lpszURL 
     * @param {Pointer<Pointer<CERT_CHAIN_CONTEXT>>} ppCertChain 
     * @param {Pointer<Integer>} pdwSecureFlags 
     * @returns {BOOL} 
     */
    static InternetGetSecurityInfoByURLA(lpszURL, ppCertChain, pdwSecureFlags) {
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

        ppCertChainMarshal := ppCertChain is VarRef ? "ptr*" : "ptr"
        pdwSecureFlagsMarshal := pdwSecureFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetGetSecurityInfoByURLA", "ptr", lpszURL, ppCertChainMarshal, ppCertChain, pdwSecureFlagsMarshal, pdwSecureFlags, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszURL 
     * @param {Pointer<Pointer<CERT_CHAIN_CONTEXT>>} ppCertChain 
     * @param {Pointer<Integer>} pdwSecureFlags 
     * @returns {BOOL} 
     */
    static InternetGetSecurityInfoByURLW(lpszURL, ppCertChain, pdwSecureFlags) {
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

        ppCertChainMarshal := ppCertChain is VarRef ? "ptr*" : "ptr"
        pdwSecureFlagsMarshal := pdwSecureFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetGetSecurityInfoByURLW", "ptr", lpszURL, ppCertChainMarshal, ppCertChain, pdwSecureFlagsMarshal, pdwSecureFlags, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} lpszURL 
     * @param {Pointer<Pointer<CERT_CHAIN_CONTEXT>>} ppCertChain 
     * @param {Pointer<Integer>} pdwSecureFlags 
     * @returns {BOOL} 
     */
    static InternetGetSecurityInfoByURL(lpszURL, ppCertChain, pdwSecureFlags) {
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

        ppCertChainMarshal := ppCertChain is VarRef ? "ptr*" : "ptr"
        pdwSecureFlagsMarshal := pdwSecureFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetGetSecurityInfoByURL", "ptr", lpszURL, ppCertChainMarshal, ppCertChain, pdwSecureFlagsMarshal, pdwSecureFlags, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Pointer<INTERNET_SECURITY_INFO>} pSecurityInfo 
     * @returns {Integer} 
     */
    static ShowSecurityInfo(hWndParent, pSecurityInfo) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := DllCall("WININET.dll\ShowSecurityInfo", "ptr", hWndParent, "ptr", pSecurityInfo, "uint")
        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Pointer} lpCert 
     * @param {Integer} cbCert 
     * @returns {Integer} 
     */
    static ShowX509EncodedCertificate(hWndParent, lpCert, cbCert) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := DllCall("WININET.dll\ShowX509EncodedCertificate", "ptr", hWndParent, "ptr", lpCert, "uint", cbCert, "uint")
        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @returns {Integer} 
     */
    static ShowClientAuthCerts(hWndParent) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := DllCall("WININET.dll\ShowClientAuthCerts", "ptr", hWndParent, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} lpCert 
     * @param {Integer} cbCert 
     * @param {PSTR} lpszListBoxEntry 
     * @param {Pointer<Integer>} lpdwListBoxEntry 
     * @returns {Integer} 
     */
    static ParseX509EncodedCertificateForListBoxEntry(lpCert, cbCert, lpszListBoxEntry, lpdwListBoxEntry) {
        lpszListBoxEntry := lpszListBoxEntry is String ? StrPtr(lpszListBoxEntry) : lpszListBoxEntry

        lpdwListBoxEntryMarshal := lpdwListBoxEntry is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\ParseX509EncodedCertificateForListBoxEntry", "ptr", lpCert, "uint", cbCert, "ptr", lpszListBoxEntry, lpdwListBoxEntryMarshal, lpdwListBoxEntry, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} lpszURL 
     * @param {HWND} hwndParent 
     * @returns {BOOL} 
     */
    static InternetShowSecurityInfoByURLA(lpszURL, hwndParent) {
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("WININET.dll\InternetShowSecurityInfoByURLA", "ptr", lpszURL, "ptr", hwndParent, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszURL 
     * @param {HWND} hwndParent 
     * @returns {BOOL} 
     */
    static InternetShowSecurityInfoByURLW(lpszURL, hwndParent) {
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("WININET.dll\InternetShowSecurityInfoByURLW", "ptr", lpszURL, "ptr", hwndParent, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} lpszURL 
     * @param {HWND} hwndParent 
     * @returns {BOOL} 
     */
    static InternetShowSecurityInfoByURL(lpszURL, hwndParent) {
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("WININET.dll\InternetShowSecurityInfoByURL", "ptr", lpszURL, "ptr", hwndParent, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwCommand 
     * @param {HWND} hwnd 
     * @returns {BOOL} 
     */
    static InternetFortezzaCommand(dwCommand, hwnd) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("WININET.dll\InternetFortezzaCommand", "uint", dwCommand, "ptr", hwnd, "ptr", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {BOOL} 
     */
    static InternetQueryFortezzaStatus(pdwStatus) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternetQueryFortezzaStatus", pdwStatusMarshal, pdwStatus, "ptr", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hFile 
     * @param {Pointer<INTERNET_BUFFERSA>} lpBuffersIn 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext 
     * @returns {BOOL} 
     */
    static InternetWriteFileExA(hFile, lpBuffersIn, dwFlags, dwContext) {
        hFileMarshal := hFile is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\InternetWriteFileExA", hFileMarshal, hFile, "ptr", lpBuffersIn, "uint", dwFlags, "ptr", dwContext, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hFile 
     * @param {Pointer<INTERNET_BUFFERSW>} lpBuffersIn 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwContext 
     * @returns {BOOL} 
     */
    static InternetWriteFileExW(hFile, lpBuffersIn, dwFlags, dwContext) {
        hFileMarshal := hFile is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\InternetWriteFileExW", hFileMarshal, hFile, "ptr", lpBuffersIn, "uint", dwFlags, "ptr", dwContext, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pszSymbol 
     * @returns {Integer} 
     */
    static FindP3PPolicySymbol(pszSymbol) {
        pszSymbol := pszSymbol is String ? StrPtr(pszSymbol) : pszSymbol

        result := DllCall("WININET.dll\FindP3PPolicySymbol", "ptr", pszSymbol, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<PWSTR>} ppwszUserName 
     * @param {Pointer<PWSTR>} ppwszPassword 
     * @returns {Integer} 
     */
    static HttpGetServerCredentials(pwszUrl, ppwszUserName, ppwszPassword) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        ppwszUserNameMarshal := ppwszUserName is VarRef ? "ptr*" : "ptr"
        ppwszPasswordMarshal := ppwszPassword is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\HttpGetServerCredentials", "ptr", pwszUrl, ppwszUserNameMarshal, ppwszUserName, ppwszPasswordMarshal, ppwszPassword, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hRequest 
     * @param {Pointer<HTTP_PUSH_TRANSPORT_SETTING>} pTransportSetting 
     * @param {Pointer<HTTP_PUSH_WAIT_HANDLE>} phWait 
     * @returns {Integer} 
     */
    static HttpPushEnable(hRequest, pTransportSetting, phWait) {
        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\HttpPushEnable", hRequestMarshal, hRequest, "ptr", pTransportSetting, "ptr", phWait, "uint")
        return result
    }

    /**
     * 
     * @param {HTTP_PUSH_WAIT_HANDLE} hWait 
     * @param {Integer} eType 
     * @param {Pointer<HTTP_PUSH_NOTIFICATION_STATUS>} pNotificationStatus 
     * @returns {Integer} 
     */
    static HttpPushWait(hWait, eType, pNotificationStatus) {
        hWait := hWait is Win32Handle ? NumGet(hWait, "ptr") : hWait

        result := DllCall("WININET.dll\HttpPushWait", "ptr", hWait, "int", eType, "ptr", pNotificationStatus, "uint")
        return result
    }

    /**
     * 
     * @param {HTTP_PUSH_WAIT_HANDLE} hWait 
     * @returns {String} Nothing - always returns an empty string
     */
    static HttpPushClose(hWait) {
        hWait := hWait is Win32Handle ? NumGet(hWait, "ptr") : hWait

        DllCall("WININET.dll\HttpPushClose", "ptr", hWait)
    }

    /**
     * 
     * @param {PSTR} lpszUrl 
     * @param {PSTR} lpszComplianceToken 
     * @param {Pointer<BOOL>} lpfFound 
     * @param {HWND} hWnd 
     * @param {Pointer<Void>} lpvReserved 
     * @returns {BOOL} 
     */
    static HttpCheckDavComplianceA(lpszUrl, lpszComplianceToken, lpfFound, hWnd, lpvReserved) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszComplianceToken := lpszComplianceToken is String ? StrPtr(lpszComplianceToken) : lpszComplianceToken
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        lpfFoundMarshal := lpfFound is VarRef ? "int*" : "ptr"
        lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\HttpCheckDavComplianceA", "ptr", lpszUrl, "ptr", lpszComplianceToken, lpfFoundMarshal, lpfFound, "ptr", hWnd, lpvReservedMarshal, lpvReserved, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUrl 
     * @param {PWSTR} lpszComplianceToken 
     * @param {Pointer<BOOL>} lpfFound 
     * @param {HWND} hWnd 
     * @param {Pointer<Void>} lpvReserved 
     * @returns {BOOL} 
     */
    static HttpCheckDavComplianceW(lpszUrl, lpszComplianceToken, lpfFound, hWnd, lpvReserved) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszComplianceToken := lpszComplianceToken is String ? StrPtr(lpszComplianceToken) : lpszComplianceToken
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        lpfFoundMarshal := lpfFound is VarRef ? "int*" : "ptr"
        lpvReservedMarshal := lpvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\HttpCheckDavComplianceW", "ptr", lpszUrl, "ptr", lpszComplianceToken, lpfFoundMarshal, lpfFound, "ptr", hWnd, lpvReservedMarshal, lpvReserved, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} lpszUrlName 
     * @param {Integer} dwFlags 
     * @param {Pointer<FILETIME>} pftLastModified 
     * @returns {BOOL} 
     */
    static IsUrlCacheEntryExpiredA(lpszUrlName, dwFlags, pftLastModified) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        result := DllCall("WININET.dll\IsUrlCacheEntryExpiredA", "ptr", lpszUrlName, "uint", dwFlags, "ptr", pftLastModified, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUrlName 
     * @param {Integer} dwFlags 
     * @param {Pointer<FILETIME>} pftLastModified 
     * @returns {BOOL} 
     */
    static IsUrlCacheEntryExpiredW(lpszUrlName, dwFlags, pftLastModified) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName

        result := DllCall("WININET.dll\IsUrlCacheEntryExpiredW", "ptr", lpszUrlName, "uint", dwFlags, "ptr", pftLastModified, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUrlName 
     * @param {Integer} dwExpectedFileSize 
     * @param {PWSTR} lpszFileExtension 
     * @param {PWSTR} lpszFileName 
     * @param {Integer} dwReserved 
     * @param {BOOL} fPreserveIncomingFileName 
     * @returns {BOOL} 
     */
    static CreateUrlCacheEntryExW(lpszUrlName, dwExpectedFileSize, lpszFileExtension, lpszFileName, dwReserved, fPreserveIncomingFileName) {
        lpszUrlName := lpszUrlName is String ? StrPtr(lpszUrlName) : lpszUrlName
        lpszFileExtension := lpszFileExtension is String ? StrPtr(lpszFileExtension) : lpszFileExtension
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("WININET.dll\CreateUrlCacheEntryExW", "ptr", lpszUrlName, "uint", dwExpectedFileSize, "ptr", lpszFileExtension, "ptr", lpszFileName, "uint", dwReserved, "int", fPreserveIncomingFileName, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrlName 
     * @param {Pointer<Integer>} dwType 
     * @param {Pointer<FILETIME>} pftExpireTime 
     * @param {Pointer<FILETIME>} pftAccessTime 
     * @param {Pointer<FILETIME>} pftModifiedTime 
     * @param {Pointer<Pointer<Integer>>} ppbBlob 
     * @param {Pointer<Integer>} pcbBlob 
     * @returns {Integer} 
     */
    static GetUrlCacheEntryBinaryBlob(pwszUrlName, dwType, pftExpireTime, pftAccessTime, pftModifiedTime, ppbBlob, pcbBlob) {
        pwszUrlName := pwszUrlName is String ? StrPtr(pwszUrlName) : pwszUrlName

        dwTypeMarshal := dwType is VarRef ? "uint*" : "ptr"
        ppbBlobMarshal := ppbBlob is VarRef ? "ptr*" : "ptr"
        pcbBlobMarshal := pcbBlob is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\GetUrlCacheEntryBinaryBlob", "ptr", pwszUrlName, dwTypeMarshal, dwType, "ptr", pftExpireTime, "ptr", pftAccessTime, "ptr", pftModifiedTime, ppbBlobMarshal, ppbBlob, pcbBlobMarshal, pcbBlob, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrlName 
     * @param {Integer} dwType 
     * @param {FILETIME} ftExpireTime 
     * @param {FILETIME} ftModifiedTime 
     * @param {Pointer<Integer>} pbBlob 
     * @param {Integer} cbBlob 
     * @returns {Integer} 
     */
    static CommitUrlCacheEntryBinaryBlob(pwszUrlName, dwType, ftExpireTime, ftModifiedTime, pbBlob, cbBlob) {
        pwszUrlName := pwszUrlName is String ? StrPtr(pwszUrlName) : pwszUrlName

        pbBlobMarshal := pbBlob is VarRef ? "char*" : "ptr"

        result := DllCall("WININET.dll\CommitUrlCacheEntryBinaryBlob", "ptr", pwszUrlName, "uint", dwType, "ptr", ftExpireTime, "ptr", ftModifiedTime, pbBlobMarshal, pbBlob, "uint", cbBlob, "uint")
        return result
    }

    /**
     * Creates a cache container in the specified cache path to hold cache entries based on the specified name, cache prefix, and container type.
     * @param {PSTR} Name The name to give to the cache.
     * @param {PSTR} lpCachePrefix The cache prefix to base the cache on.
     * @param {PSTR} lpszCachePath The cache prefix to create the cache in.
     * @param {Integer} KBCacheLimit The size limit of the cache in whole kilobytes, or 0 for the default size.
     * @param {Integer} dwContainerType The container type to base the cache on.
     * @param {Integer} dwOptions This parameter is reserved and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winineti/nf-winineti-createurlcachecontainera
     * @since windows5.0
     */
    static CreateUrlCacheContainerA(Name, lpCachePrefix, lpszCachePath, KBCacheLimit, dwContainerType, dwOptions) {
        static pvBuffer := 0, cbBuffer := 0 ;Reserved parameters must always be NULL

        Name := Name is String ? StrPtr(Name) : Name
        lpCachePrefix := lpCachePrefix is String ? StrPtr(lpCachePrefix) : lpCachePrefix
        lpszCachePath := lpszCachePath is String ? StrPtr(lpszCachePath) : lpszCachePath

        A_LastError := 0

        result := DllCall("WININET.dll\CreateUrlCacheContainerA", "ptr", Name, "ptr", lpCachePrefix, "ptr", lpszCachePath, "uint", KBCacheLimit, "uint", dwContainerType, "uint", dwOptions, "ptr", pvBuffer, "uint*", cbBuffer, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a cache container in the specified cache path to hold cache entries based on the specified name, cache prefix, and container type.
     * @param {PWSTR} Name The name to give to the cache.
     * @param {PWSTR} lpCachePrefix The cache prefix to base the cache on.
     * @param {PWSTR} lpszCachePath The cache prefix to create the cache in.
     * @param {Integer} KBCacheLimit The size limit of the cache in whole kilobytes, or 0 for the default size.
     * @param {Integer} dwContainerType The container type to base the cache on.
     * @param {Integer} dwOptions This parameter is reserved and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winineti/nf-winineti-createurlcachecontainerw
     * @since windows5.0
     */
    static CreateUrlCacheContainerW(Name, lpCachePrefix, lpszCachePath, KBCacheLimit, dwContainerType, dwOptions) {
        static pvBuffer := 0, cbBuffer := 0 ;Reserved parameters must always be NULL

        Name := Name is String ? StrPtr(Name) : Name
        lpCachePrefix := lpCachePrefix is String ? StrPtr(lpCachePrefix) : lpCachePrefix
        lpszCachePath := lpszCachePath is String ? StrPtr(lpszCachePath) : lpszCachePath

        A_LastError := 0

        result := DllCall("WININET.dll\CreateUrlCacheContainerW", "ptr", Name, "ptr", lpCachePrefix, "ptr", lpszCachePath, "uint", KBCacheLimit, "uint", dwContainerType, "uint", dwOptions, "ptr", pvBuffer, "uint*", cbBuffer, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a cache container (which contains cache entries) based on the specified name.
     * @param {PSTR} Name The name of the cache container to be deleted.
     * @param {Integer} dwOptions This parameter is reserved, and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winineti/nf-winineti-deleteurlcachecontainera
     * @since windows5.0
     */
    static DeleteUrlCacheContainerA(Name, dwOptions) {
        Name := Name is String ? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("WININET.dll\DeleteUrlCacheContainerA", "ptr", Name, "uint", dwOptions, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes a cache container (which contains cache entries) based on the specified name.
     * @param {PWSTR} Name The name of the cache container to be deleted.
     * @param {Integer} dwOptions This parameter is reserved, and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winineti/nf-winineti-deleteurlcachecontainerw
     * @since windows5.0
     */
    static DeleteUrlCacheContainerW(Name, dwOptions) {
        Name := Name is String ? StrPtr(Name) : Name

        A_LastError := 0

        result := DllCall("WININET.dll\DeleteUrlCacheContainerW", "ptr", Name, "uint", dwOptions, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwModified 
     * @param {Pointer} lpContainerInfo 
     * @param {Pointer<Integer>} lpcbContainerInfo 
     * @param {Integer} dwOptions 
     * @returns {HANDLE} 
     */
    static FindFirstUrlCacheContainerA(pdwModified, lpContainerInfo, lpcbContainerInfo, dwOptions) {
        pdwModifiedMarshal := pdwModified is VarRef ? "uint*" : "ptr"
        lpcbContainerInfoMarshal := lpcbContainerInfo is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\FindFirstUrlCacheContainerA", pdwModifiedMarshal, pdwModified, "ptr", lpContainerInfo, lpcbContainerInfoMarshal, lpcbContainerInfo, "uint", dwOptions, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwModified 
     * @param {Pointer} lpContainerInfo 
     * @param {Pointer<Integer>} lpcbContainerInfo 
     * @param {Integer} dwOptions 
     * @returns {HANDLE} 
     */
    static FindFirstUrlCacheContainerW(pdwModified, lpContainerInfo, lpcbContainerInfo, dwOptions) {
        pdwModifiedMarshal := pdwModified is VarRef ? "uint*" : "ptr"
        lpcbContainerInfoMarshal := lpcbContainerInfo is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\FindFirstUrlCacheContainerW", pdwModifiedMarshal, pdwModified, "ptr", lpContainerInfo, lpcbContainerInfoMarshal, lpcbContainerInfo, "uint", dwOptions, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {HANDLE} hEnumHandle 
     * @param {Pointer} lpContainerInfo 
     * @param {Pointer<Integer>} lpcbContainerInfo 
     * @returns {BOOL} 
     */
    static FindNextUrlCacheContainerA(hEnumHandle, lpContainerInfo, lpcbContainerInfo) {
        hEnumHandle := hEnumHandle is Win32Handle ? NumGet(hEnumHandle, "ptr") : hEnumHandle

        lpcbContainerInfoMarshal := lpcbContainerInfo is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\FindNextUrlCacheContainerA", "ptr", hEnumHandle, "ptr", lpContainerInfo, lpcbContainerInfoMarshal, lpcbContainerInfo, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEnumHandle 
     * @param {Pointer} lpContainerInfo 
     * @param {Pointer<Integer>} lpcbContainerInfo 
     * @returns {BOOL} 
     */
    static FindNextUrlCacheContainerW(hEnumHandle, lpContainerInfo, lpcbContainerInfo) {
        hEnumHandle := hEnumHandle is Win32Handle ? NumGet(hEnumHandle, "ptr") : hEnumHandle

        lpcbContainerInfoMarshal := lpcbContainerInfo is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\FindNextUrlCacheContainerW", "ptr", hEnumHandle, "ptr", lpContainerInfo, lpcbContainerInfoMarshal, lpcbContainerInfo, "int")
        return result
    }

    /**
     * Frees space in the cache.
     * @param {PSTR} lpszCachePath The path for the cache.
     * @param {Integer} dwSize The percentage of the cache to free (in the range 1 to 100, inclusive).
     * @param {Integer} dwFilter This parameter is reserved, and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winineti/nf-winineti-freeurlcachespacea
     * @since windows5.0
     */
    static FreeUrlCacheSpaceA(lpszCachePath, dwSize, dwFilter) {
        lpszCachePath := lpszCachePath is String ? StrPtr(lpszCachePath) : lpszCachePath

        A_LastError := 0

        result := DllCall("WININET.dll\FreeUrlCacheSpaceA", "ptr", lpszCachePath, "uint", dwSize, "uint", dwFilter, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees space in the cache.
     * @param {PWSTR} lpszCachePath The path for the cache.
     * @param {Integer} dwSize The percentage of the cache to free (in the range 1 to 100, inclusive).
     * @param {Integer} dwFilter This parameter is reserved, and must be 0.
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winineti/nf-winineti-freeurlcachespacew
     * @since windows5.0
     */
    static FreeUrlCacheSpaceW(lpszCachePath, dwSize, dwFilter) {
        lpszCachePath := lpszCachePath is String ? StrPtr(lpszCachePath) : lpszCachePath

        A_LastError := 0

        result := DllCall("WININET.dll\FreeUrlCacheSpaceW", "ptr", lpszCachePath, "uint", dwSize, "uint", dwFilter, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Integer} ullTargetSize 
     * @param {Integer} dwFilter 
     * @returns {Integer} 
     */
    static UrlCacheFreeGlobalSpace(ullTargetSize, dwFilter) {
        result := DllCall("WININET.dll\UrlCacheFreeGlobalSpace", "uint", ullTargetSize, "uint", dwFilter, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilter 
     * @param {Pointer<Integer>} pullSize 
     * @param {Pointer<Integer>} pullLimit 
     * @returns {Integer} 
     */
    static UrlCacheGetGlobalCacheSize(dwFilter, pullSize, pullLimit) {
        pullSizeMarshal := pullSize is VarRef ? "uint*" : "ptr"
        pullLimitMarshal := pullLimit is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\UrlCacheGetGlobalCacheSize", "uint", dwFilter, pullSizeMarshal, pullSize, pullLimitMarshal, pullLimit, "uint")
        return result
    }

    /**
     * Retrieves information about cache configuration.
     * @param {Pointer<INTERNET_CACHE_CONFIG_INFOA>} lpCacheConfigInfo A pointer to an 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winineti/ns-winineti-internet_cache_config_infoa">INTERNET_CACHE_CONFIG_INFO</a> structure 
     *        that receives information about the cache configuration. The <b>dwStructSize</b> field of 
     *        the structure should be initialized to the size of 
     *        <b>INTERNET_CACHE_CONFIG_INFO</b>.
     * @param {Integer} dwFieldControl 
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get 
     *        extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winineti/nf-winineti-geturlcacheconfiginfoa
     * @since windows5.1.2600
     */
    static GetUrlCacheConfigInfoA(lpCacheConfigInfo, dwFieldControl) {
        static lpcbCacheConfigInfo := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WININET.dll\GetUrlCacheConfigInfoA", "ptr", lpCacheConfigInfo, "uint*", lpcbCacheConfigInfo, "uint", dwFieldControl, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about cache configuration.
     * @param {Pointer<INTERNET_CACHE_CONFIG_INFOW>} lpCacheConfigInfo A pointer to an 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winineti/ns-winineti-internet_cache_config_infoa">INTERNET_CACHE_CONFIG_INFO</a> structure 
     *        that receives information about the cache configuration. The <b>dwStructSize</b> field of 
     *        the structure should be initialized to the size of 
     *        <b>INTERNET_CACHE_CONFIG_INFO</b>.
     * @param {Integer} dwFieldControl 
     * @returns {BOOL} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise. To get 
     *        extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winineti/nf-winineti-geturlcacheconfiginfow
     * @since windows5.1.2600
     */
    static GetUrlCacheConfigInfoW(lpCacheConfigInfo, dwFieldControl) {
        static lpcbCacheConfigInfo := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WININET.dll\GetUrlCacheConfigInfoW", "ptr", lpCacheConfigInfo, "uint*", lpcbCacheConfigInfo, "uint", dwFieldControl, "int")
        if(!result && A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {Pointer<INTERNET_CACHE_CONFIG_INFOA>} lpCacheConfigInfo 
     * @param {Integer} dwFieldControl 
     * @returns {BOOL} 
     */
    static SetUrlCacheConfigInfoA(lpCacheConfigInfo, dwFieldControl) {
        result := DllCall("WININET.dll\SetUrlCacheConfigInfoA", "ptr", lpCacheConfigInfo, "uint", dwFieldControl, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<INTERNET_CACHE_CONFIG_INFOW>} lpCacheConfigInfo 
     * @param {Integer} dwFieldControl 
     * @returns {BOOL} 
     */
    static SetUrlCacheConfigInfoW(lpCacheConfigInfo, dwFieldControl) {
        result := DllCall("WININET.dll\SetUrlCacheConfigInfoW", "ptr", lpCacheConfigInfo, "uint", dwFieldControl, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HINSTANCE} hinst 
     * @param {PSTR} lpszCmd 
     * @param {Integer} nCmdShow 
     * @returns {Integer} 
     */
    static RunOnceUrlCache(hwnd, hinst, lpszCmd, nCmdShow) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst
        lpszCmd := lpszCmd is String ? StrPtr(lpszCmd) : lpszCmd

        result := DllCall("WININET.dll\RunOnceUrlCache", "ptr", hwnd, "ptr", hinst, "ptr", lpszCmd, "int", nCmdShow, "uint")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {HINSTANCE} hinst 
     * @param {PSTR} lpszCmd 
     * @param {Integer} nCmdShow 
     * @returns {Integer} 
     */
    static DeleteIE3Cache(hwnd, hinst, lpszCmd, nCmdShow) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst
        lpszCmd := lpszCmd is String ? StrPtr(lpszCmd) : lpszCmd

        result := DllCall("WININET.dll\DeleteIE3Cache", "ptr", hwnd, "ptr", hinst, "ptr", lpszCmd, "int", nCmdShow, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} szNewPath 
     * @returns {BOOL} 
     */
    static UpdateUrlCacheContentPath(szNewPath) {
        szNewPath := szNewPath is String ? StrPtr(szNewPath) : szNewPath

        result := DllCall("WININET.dll\UpdateUrlCacheContentPath", "ptr", szNewPath, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} uMsg 
     * @param {Integer} gid 
     * @param {Integer} dwOpsFilter 
     * @param {Integer} dwReserved 
     * @returns {BOOL} 
     */
    static RegisterUrlCacheNotification(hWnd, uMsg, gid, dwOpsFilter, dwReserved) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("WININET.dll\RegisterUrlCacheNotification", "ptr", hWnd, "uint", uMsg, "int64", gid, "uint", dwOpsFilter, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Integer} nIdx 
     * @param {Pointer<Integer>} lpdwData 
     * @returns {BOOL} 
     */
    static GetUrlCacheHeaderData(nIdx, lpdwData) {
        lpdwDataMarshal := lpdwData is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\GetUrlCacheHeaderData", "uint", nIdx, lpdwDataMarshal, lpdwData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} nIdx 
     * @param {Integer} dwData 
     * @returns {BOOL} 
     */
    static SetUrlCacheHeaderData(nIdx, dwData) {
        result := DllCall("WININET.dll\SetUrlCacheHeaderData", "uint", nIdx, "uint", dwData, "int")
        return result
    }

    /**
     * 
     * @param {Integer} nIdx 
     * @param {Pointer<Integer>} lpdwData 
     * @returns {BOOL} 
     */
    static IncrementUrlCacheHeaderData(nIdx, lpdwData) {
        lpdwDataMarshal := lpdwData is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\IncrementUrlCacheHeaderData", "uint", nIdx, lpdwDataMarshal, lpdwData, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    static LoadUrlCacheContent() {
        result := DllCall("WININET.dll\LoadUrlCacheContent", "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Void>>} phAppCache 
     * @returns {Integer} 
     */
    static AppCacheLookup(pwszUrl, dwFlags, phAppCache) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        phAppCacheMarshal := phAppCache is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\AppCacheLookup", "ptr", pwszUrl, "uint", dwFlags, phAppCacheMarshal, phAppCache, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszMasterUrl 
     * @param {PWSTR} pwszManifestUrl 
     * @param {Pointer} pbManifestData 
     * @param {Integer} dwManifestDataSize 
     * @param {Pointer} pbManifestResponseHeaders 
     * @param {Integer} dwManifestResponseHeadersSize 
     * @param {Pointer<Integer>} peState 
     * @param {Pointer<Pointer<Void>>} phNewAppCache 
     * @returns {Integer} 
     */
    static AppCacheCheckManifest(pwszMasterUrl, pwszManifestUrl, pbManifestData, dwManifestDataSize, pbManifestResponseHeaders, dwManifestResponseHeadersSize, peState, phNewAppCache) {
        pwszMasterUrl := pwszMasterUrl is String ? StrPtr(pwszMasterUrl) : pwszMasterUrl
        pwszManifestUrl := pwszManifestUrl is String ? StrPtr(pwszManifestUrl) : pwszManifestUrl

        peStateMarshal := peState is VarRef ? "int*" : "ptr"
        phNewAppCacheMarshal := phNewAppCache is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\AppCacheCheckManifest", "ptr", pwszMasterUrl, "ptr", pwszManifestUrl, "ptr", pbManifestData, "uint", dwManifestDataSize, "ptr", pbManifestResponseHeaders, "uint", dwManifestResponseHeadersSize, peStateMarshal, peState, phNewAppCacheMarshal, phNewAppCache, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {Pointer<APP_CACHE_DOWNLOAD_LIST>} pDownloadList 
     * @returns {Integer} 
     */
    static AppCacheGetDownloadList(hAppCache, pDownloadList) {
        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\AppCacheGetDownloadList", hAppCacheMarshal, hAppCache, "ptr", pDownloadList, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<APP_CACHE_DOWNLOAD_LIST>} pDownloadList 
     * @returns {String} Nothing - always returns an empty string
     */
    static AppCacheFreeDownloadList(pDownloadList) {
        DllCall("WININET.dll\AppCacheFreeDownloadList", "ptr", pDownloadList)
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {Pointer} pbManifestData 
     * @param {Integer} dwManifestDataSize 
     * @param {Pointer<Integer>} peState 
     * @returns {Integer} 
     */
    static AppCacheFinalize(hAppCache, pbManifestData, dwManifestDataSize, peState) {
        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
        peStateMarshal := peState is VarRef ? "int*" : "ptr"

        result := DllCall("WININET.dll\AppCacheFinalize", hAppCacheMarshal, hAppCache, "ptr", pbManifestData, "uint", dwManifestDataSize, peStateMarshal, peState, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<PWSTR>} ppwszFallbackUrl 
     * @returns {Integer} 
     */
    static AppCacheGetFallbackUrl(hAppCache, pwszUrl, ppwszFallbackUrl) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
        ppwszFallbackUrlMarshal := ppwszFallbackUrl is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\AppCacheGetFallbackUrl", hAppCacheMarshal, hAppCache, "ptr", pwszUrl, ppwszFallbackUrlMarshal, ppwszFallbackUrl, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {Pointer<PWSTR>} ppwszManifestUrl 
     * @returns {Integer} 
     */
    static AppCacheGetManifestUrl(hAppCache, ppwszManifestUrl) {
        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
        ppwszManifestUrlMarshal := ppwszManifestUrl is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\AppCacheGetManifestUrl", hAppCacheMarshal, hAppCache, ppwszManifestUrlMarshal, ppwszManifestUrl, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {Pointer<Pointer<Void>>} phDuplicatedAppCache 
     * @returns {Integer} 
     */
    static AppCacheDuplicateHandle(hAppCache, phDuplicatedAppCache) {
        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
        phDuplicatedAppCacheMarshal := phDuplicatedAppCache is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\AppCacheDuplicateHandle", hAppCacheMarshal, hAppCache, phDuplicatedAppCacheMarshal, phDuplicatedAppCache, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @returns {String} Nothing - always returns an empty string
     */
    static AppCacheCloseHandle(hAppCache) {
        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

        DllCall("WININET.dll\AppCacheCloseHandle", hAppCacheMarshal, hAppCache)
    }

    /**
     * 
     * @param {Pointer<APP_CACHE_GROUP_LIST>} pAppCacheGroupList 
     * @returns {String} Nothing - always returns an empty string
     */
    static AppCacheFreeGroupList(pAppCacheGroupList) {
        DllCall("WININET.dll\AppCacheFreeGroupList", "ptr", pAppCacheGroupList)
    }

    /**
     * 
     * @param {Pointer<APP_CACHE_GROUP_LIST>} pAppCacheGroupList 
     * @returns {Integer} 
     */
    static AppCacheGetGroupList(pAppCacheGroupList) {
        result := DllCall("WININET.dll\AppCacheGetGroupList", "ptr", pAppCacheGroupList, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {Pointer<APP_CACHE_GROUP_INFO>} pAppCacheInfo 
     * @returns {Integer} 
     */
    static AppCacheGetInfo(hAppCache, pAppCacheInfo) {
        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\AppCacheGetInfo", hAppCacheMarshal, hAppCache, "ptr", pAppCacheInfo, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszManifestUrl 
     * @returns {Integer} 
     */
    static AppCacheDeleteGroup(pwszManifestUrl) {
        pwszManifestUrl := pwszManifestUrl is String ? StrPtr(pwszManifestUrl) : pwszManifestUrl

        result := DllCall("WININET.dll\AppCacheDeleteGroup", "ptr", pwszManifestUrl, "uint")
        return result
    }

    /**
     * 
     * @param {FILETIME} ftCutOff 
     * @returns {Integer} 
     */
    static AppCacheFreeSpace(ftCutOff) {
        result := DllCall("WININET.dll\AppCacheFreeSpace", "ptr", ftCutOff, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<APP_CACHE_GROUP_LIST>} pAppCacheGroupList 
     * @returns {Integer} 
     */
    static AppCacheGetIEGroupList(pAppCacheGroupList) {
        result := DllCall("WININET.dll\AppCacheGetIEGroupList", "ptr", pAppCacheGroupList, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszManifestUrl 
     * @returns {Integer} 
     */
    static AppCacheDeleteIEGroup(pwszManifestUrl) {
        pwszManifestUrl := pwszManifestUrl is String ? StrPtr(pwszManifestUrl) : pwszManifestUrl

        result := DllCall("WININET.dll\AppCacheDeleteIEGroup", "ptr", pwszManifestUrl, "uint")
        return result
    }

    /**
     * 
     * @param {FILETIME} ftCutOff 
     * @returns {Integer} 
     */
    static AppCacheFreeIESpace(ftCutOff) {
        result := DllCall("WININET.dll\AppCacheFreeIESpace", "ptr", ftCutOff, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {PWSTR} pwszSourceFilePath 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer} pbResponseHeaders 
     * @param {Integer} dwResponseHeadersSize 
     * @returns {Integer} 
     */
    static AppCacheCreateAndCommitFile(hAppCache, pwszSourceFilePath, pwszUrl, pbResponseHeaders, dwResponseHeadersSize) {
        pwszSourceFilePath := pwszSourceFilePath is String ? StrPtr(pwszSourceFilePath) : pwszSourceFilePath
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\AppCacheCreateAndCommitFile", hAppCacheMarshal, hAppCache, "ptr", pwszSourceFilePath, "ptr", pwszUrl, "ptr", pbResponseHeaders, "uint", dwResponseHeadersSize, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hRequestHandle 
     * @param {BOOL} fBackground 
     * @param {Pointer<Pointer<Void>>} phDependencyHandle 
     * @returns {Integer} 
     */
    static HttpOpenDependencyHandle(hRequestHandle, fBackground, phDependencyHandle) {
        hRequestHandleMarshal := hRequestHandle is VarRef ? "ptr" : "ptr"
        phDependencyHandleMarshal := phDependencyHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\HttpOpenDependencyHandle", hRequestHandleMarshal, hRequestHandle, "int", fBackground, phDependencyHandleMarshal, phDependencyHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hDependencyHandle 
     * @returns {String} Nothing - always returns an empty string
     */
    static HttpCloseDependencyHandle(hDependencyHandle) {
        hDependencyHandleMarshal := hDependencyHandle is VarRef ? "ptr" : "ptr"

        DllCall("WININET.dll\HttpCloseDependencyHandle", hDependencyHandleMarshal, hDependencyHandle)
    }

    /**
     * 
     * @param {Pointer<Void>} hDependencyHandle 
     * @param {Pointer<Pointer<Void>>} phDuplicatedDependencyHandle 
     * @returns {Integer} 
     */
    static HttpDuplicateDependencyHandle(hDependencyHandle, phDuplicatedDependencyHandle) {
        hDependencyHandleMarshal := hDependencyHandle is VarRef ? "ptr" : "ptr"
        phDuplicatedDependencyHandleMarshal := phDuplicatedDependencyHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\HttpDuplicateDependencyHandle", hDependencyHandleMarshal, hDependencyHandle, phDuplicatedDependencyHandleMarshal, phDuplicatedDependencyHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hDependencyHandle 
     * @returns {Integer} 
     */
    static HttpIndicatePageLoadComplete(hDependencyHandle) {
        hDependencyHandleMarshal := hDependencyHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\HttpIndicatePageLoadComplete", hDependencyHandleMarshal, hDependencyHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    static UrlCacheFreeEntryInfo(pCacheEntryInfo) {
        DllCall("WININET.dll\UrlCacheFreeEntryInfo", "ptr", pCacheEntryInfo)
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {PWSTR} pcwszUrl 
     * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
     * @returns {Integer} 
     */
    static UrlCacheGetEntryInfo(hAppCache, pcwszUrl, pCacheEntryInfo) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\UrlCacheGetEntryInfo", hAppCacheMarshal, hAppCache, "ptr", pcwszUrl, "ptr", pCacheEntryInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEntryFile 
     * @returns {String} Nothing - always returns an empty string
     */
    static UrlCacheCloseEntryHandle(hEntryFile) {
        hEntryFileMarshal := hEntryFile is VarRef ? "ptr" : "ptr"

        DllCall("WININET.dll\UrlCacheCloseEntryHandle", hEntryFileMarshal, hEntryFile)
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {PWSTR} pcwszUrl 
     * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
     * @param {Pointer<Pointer<Void>>} phEntryFile 
     * @returns {Integer} 
     */
    static UrlCacheRetrieveEntryFile(hAppCache, pcwszUrl, pCacheEntryInfo, phEntryFile) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
        phEntryFileMarshal := phEntryFile is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\UrlCacheRetrieveEntryFile", hAppCacheMarshal, hAppCache, "ptr", pcwszUrl, "ptr", pCacheEntryInfo, phEntryFileMarshal, phEntryFile, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hUrlCacheStream 
     * @param {Integer} ullLocation 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} dwBufferLen 
     * @param {Pointer<Integer>} pdwBufferLen 
     * @returns {Integer} 
     */
    static UrlCacheReadEntryStream(hUrlCacheStream, ullLocation, pBuffer, dwBufferLen, pdwBufferLen) {
        hUrlCacheStreamMarshal := hUrlCacheStream is VarRef ? "ptr" : "ptr"
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pdwBufferLenMarshal := pdwBufferLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\UrlCacheReadEntryStream", hUrlCacheStreamMarshal, hUrlCacheStream, "uint", ullLocation, pBufferMarshal, pBuffer, "uint", dwBufferLen, pdwBufferLenMarshal, pdwBufferLen, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {PWSTR} pcwszUrl 
     * @param {BOOL} fRandomRead 
     * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
     * @param {Pointer<Pointer<Void>>} phEntryStream 
     * @returns {Integer} 
     */
    static UrlCacheRetrieveEntryStream(hAppCache, pcwszUrl, fRandomRead, pCacheEntryInfo, phEntryStream) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"
        phEntryStreamMarshal := phEntryStream is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\UrlCacheRetrieveEntryStream", hAppCacheMarshal, hAppCache, "ptr", pcwszUrl, "int", fRandomRead, "ptr", pCacheEntryInfo, phEntryStreamMarshal, phEntryStream, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hAppCache 
     * @param {PWSTR} pcwszUrl 
     * @param {Pointer} pbExtraData 
     * @param {Integer} cbExtraData 
     * @returns {Integer} 
     */
    static UrlCacheUpdateEntryExtraData(hAppCache, pcwszUrl, pbExtraData, cbExtraData) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

        hAppCacheMarshal := hAppCache is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\UrlCacheUpdateEntryExtraData", hAppCacheMarshal, hAppCache, "ptr", pcwszUrl, "ptr", pbExtraData, "uint", cbExtraData, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {PWSTR} pwszPrefix 
     * @param {PWSTR} pwszDirectory 
     * @param {Integer} ullLimit 
     * @param {Integer} dwOptions 
     * @returns {Integer} 
     */
    static UrlCacheCreateContainer(pwszName, pwszPrefix, pwszDirectory, ullLimit, dwOptions) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszPrefix := pwszPrefix is String ? StrPtr(pwszPrefix) : pwszPrefix
        pwszDirectory := pwszDirectory is String ? StrPtr(pwszDirectory) : pwszDirectory

        result := DllCall("WININET.dll\UrlCacheCreateContainer", "ptr", pwszName, "ptr", pwszPrefix, "ptr", pwszDirectory, "uint", ullLimit, "uint", dwOptions, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} rgpwszUrls 
     * @param {Integer} cEntries 
     * @param {Pointer<BOOL>} rgfExist 
     * @returns {Integer} 
     */
    static UrlCacheCheckEntriesExist(rgpwszUrls, cEntries, rgfExist) {
        rgpwszUrlsMarshal := rgpwszUrls is VarRef ? "ptr*" : "ptr"
        rgfExistMarshal := rgfExist is VarRef ? "int*" : "ptr"

        result := DllCall("WININET.dll\UrlCacheCheckEntriesExist", rgpwszUrlsMarshal, rgpwszUrls, "uint", cEntries, rgfExistMarshal, rgfExist, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<PWSTR>>} pppwszDirectories 
     * @param {Pointer<Integer>} pcDirectories 
     * @returns {Integer} 
     */
    static UrlCacheGetContentPaths(pppwszDirectories, pcDirectories) {
        pppwszDirectoriesMarshal := pppwszDirectories is VarRef ? "ptr*" : "ptr"
        pcDirectoriesMarshal := pcDirectories is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\UrlCacheGetContentPaths", pppwszDirectoriesMarshal, pppwszDirectories, pcDirectoriesMarshal, pcDirectories, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} limitType 
     * @param {Pointer<Integer>} pullLimit 
     * @returns {Integer} 
     */
    static UrlCacheGetGlobalLimit(limitType, pullLimit) {
        pullLimitMarshal := pullLimit is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\UrlCacheGetGlobalLimit", "int", limitType, pullLimitMarshal, pullLimit, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} limitType 
     * @param {Integer} ullLimit 
     * @returns {Integer} 
     */
    static UrlCacheSetGlobalLimit(limitType, ullLimit) {
        result := DllCall("WININET.dll\UrlCacheSetGlobalLimit", "int", limitType, "uint", ullLimit, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static UrlCacheReloadSettings() {
        result := DllCall("WININET.dll\UrlCacheReloadSettings", "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPrefix 
     * @param {Integer} dwEntryMaxAge 
     * @returns {Integer} 
     */
    static UrlCacheContainerSetEntryMaximumAge(pwszPrefix, dwEntryMaxAge) {
        pwszPrefix := pwszPrefix is String ? StrPtr(pwszPrefix) : pwszPrefix

        result := DllCall("WININET.dll\UrlCacheContainerSetEntryMaximumAge", "ptr", pwszPrefix, "uint", dwEntryMaxAge, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPrefix 
     * @param {Integer} dwFlags 
     * @param {Integer} dwFilter 
     * @param {Integer} GroupId 
     * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
     * @param {Pointer<HANDLE>} phFind 
     * @returns {Integer} 
     */
    static UrlCacheFindFirstEntry(pwszPrefix, dwFlags, dwFilter, GroupId, pCacheEntryInfo, phFind) {
        pwszPrefix := pwszPrefix is String ? StrPtr(pwszPrefix) : pwszPrefix

        result := DllCall("WININET.dll\UrlCacheFindFirstEntry", "ptr", pwszPrefix, "uint", dwFlags, "uint", dwFilter, "int64", GroupId, "ptr", pCacheEntryInfo, "ptr", phFind, "uint")
        return result
    }

    /**
     * 
     * @param {HANDLE} hFind 
     * @param {Pointer<URLCACHE_ENTRY_INFO>} pCacheEntryInfo 
     * @returns {Integer} 
     */
    static UrlCacheFindNextEntry(hFind, pCacheEntryInfo) {
        hFind := hFind is Win32Handle ? NumGet(hFind, "ptr") : hFind

        result := DllCall("WININET.dll\UrlCacheFindNextEntry", "ptr", hFind, "ptr", pCacheEntryInfo, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static UrlCacheServer() {
        result := DllCall("WININET.dll\UrlCacheServer", "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcNetworks 
     * @param {Pointer<Pointer<PWSTR>>} pppwszNetworkGuids 
     * @param {Pointer<Pointer<BSTR>>} pppbstrNetworkNames 
     * @param {Pointer<Pointer<PWSTR>>} pppwszGWMacs 
     * @param {Pointer<Integer>} pcGatewayMacs 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {BOOL} 
     */
    static ReadGuidsForConnectedNetworks(pcNetworks, pppwszNetworkGuids, pppbstrNetworkNames, pppwszGWMacs, pcGatewayMacs, pdwFlags) {
        pcNetworksMarshal := pcNetworks is VarRef ? "uint*" : "ptr"
        pppwszNetworkGuidsMarshal := pppwszNetworkGuids is VarRef ? "ptr*" : "ptr"
        pppbstrNetworkNamesMarshal := pppbstrNetworkNames is VarRef ? "ptr*" : "ptr"
        pppwszGWMacsMarshal := pppwszGWMacs is VarRef ? "ptr*" : "ptr"
        pcGatewayMacsMarshal := pcGatewayMacs is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\ReadGuidsForConnectedNetworks", pcNetworksMarshal, pcNetworks, pppwszNetworkGuidsMarshal, pppwszNetworkGuids, pppbstrNetworkNamesMarshal, pppbstrNetworkNames, pppwszGWMacsMarshal, pppwszGWMacs, pcGatewayMacsMarshal, pcGatewayMacs, pdwFlagsMarshal, pdwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} tScheme 
     * @param {PSTR} lpszHost 
     * @param {Integer} cchHost 
     * @returns {BOOL} 
     */
    static IsHostInProxyBypassList(tScheme, lpszHost, cchHost) {
        lpszHost := lpszHost is String ? StrPtr(lpszHost) : lpszHost

        result := DllCall("WININET.dll\IsHostInProxyBypassList", "int", tScheme, "ptr", lpszHost, "uint", cchHost, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<WININET_PROXY_INFO_LIST>} pProxyInfoList 
     * @returns {String} Nothing - always returns an empty string
     */
    static InternetFreeProxyInfoList(pProxyInfoList) {
        DllCall("WININET.dll\InternetFreeProxyInfoList", "ptr", pProxyInfoList)
    }

    /**
     * 
     * @param {Pointer<Void>} hInternet 
     * @param {PWSTR} pcwszUrl 
     * @param {Pointer<WININET_PROXY_INFO_LIST>} pProxyInfoList 
     * @returns {Integer} 
     */
    static InternetGetProxyForUrl(hInternet, pcwszUrl, pProxyInfoList) {
        pcwszUrl := pcwszUrl is String ? StrPtr(pcwszUrl) : pcwszUrl

        hInternetMarshal := hInternet is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\InternetGetProxyForUrl", hInternetMarshal, hInternet, "ptr", pcwszUrl, "ptr", pProxyInfoList, "uint")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    static DoConnectoidsExist() {
        result := DllCall("WININET.dll\DoConnectoidsExist", "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pszPath 
     * @param {Pointer<Integer>} pdwClusterSize 
     * @param {Pointer<Integer>} pdlAvail 
     * @param {Pointer<Integer>} pdlTotal 
     * @returns {BOOL} 
     */
    static GetDiskInfoA(pszPath, pdwClusterSize, pdlAvail, pdlTotal) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        pdwClusterSizeMarshal := pdwClusterSize is VarRef ? "uint*" : "ptr"
        pdlAvailMarshal := pdlAvail is VarRef ? "uint*" : "ptr"
        pdlTotalMarshal := pdlTotal is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\GetDiskInfoA", "ptr", pszPath, pdwClusterSizeMarshal, pdwClusterSize, pdlAvailMarshal, pdlAvail, pdlTotalMarshal, pdlTotal, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pszUrlSearchPattern 
     * @param {Integer} dwFlags 
     * @param {Integer} dwFilter 
     * @param {Integer} GroupId 
     * @param {Pointer<CACHE_OPERATOR>} op 
     * @param {Pointer<Void>} pOperatorData 
     * @returns {BOOL} 
     */
    static PerformOperationOverUrlCacheA(pszUrlSearchPattern, dwFlags, dwFilter, GroupId, op, pOperatorData) {
        static pReserved1 := 0, pdwReserved2 := 0, pReserved3 := 0 ;Reserved parameters must always be NULL

        pszUrlSearchPattern := pszUrlSearchPattern is String ? StrPtr(pszUrlSearchPattern) : pszUrlSearchPattern

        pOperatorDataMarshal := pOperatorData is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\PerformOperationOverUrlCacheA", "ptr", pszUrlSearchPattern, "uint", dwFlags, "uint", dwFilter, "int64", GroupId, "ptr", pReserved1, "uint*", pdwReserved2, "ptr", pReserved3, "ptr", op, pOperatorDataMarshal, pOperatorData, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    static IsProfilesEnabled() {
        result := DllCall("WININET.dll\IsProfilesEnabled", "int")
        return result
    }

    /**
     * 
     * @param {PSTR} lpszUrl 
     * @param {PSTR} lpszCookieData 
     * @param {Pointer<Integer>} lpdwDataSize 
     * @returns {Integer} 
     */
    static InternalInternetGetCookie(lpszUrl, lpszCookieData, lpdwDataSize) {
        lpszUrl := lpszUrl is String ? StrPtr(lpszUrl) : lpszUrl
        lpszCookieData := lpszCookieData is String ? StrPtr(lpszCookieData) : lpszCookieData

        lpdwDataSizeMarshal := lpdwDataSize is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\InternalInternetGetCookie", "ptr", lpszUrl, "ptr", lpszCookieData, lpdwDataSizeMarshal, lpdwDataSize, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} szFilename 
     * @returns {BOOL} 
     */
    static ImportCookieFileA(szFilename) {
        szFilename := szFilename is String ? StrPtr(szFilename) : szFilename

        result := DllCall("WININET.dll\ImportCookieFileA", "ptr", szFilename, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} szFilename 
     * @returns {BOOL} 
     */
    static ImportCookieFileW(szFilename) {
        szFilename := szFilename is String ? StrPtr(szFilename) : szFilename

        result := DllCall("WININET.dll\ImportCookieFileW", "ptr", szFilename, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} szFilename 
     * @param {BOOL} fAppend 
     * @returns {BOOL} 
     */
    static ExportCookieFileA(szFilename, fAppend) {
        szFilename := szFilename is String ? StrPtr(szFilename) : szFilename

        result := DllCall("WININET.dll\ExportCookieFileA", "ptr", szFilename, "int", fAppend, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} szFilename 
     * @param {BOOL} fAppend 
     * @returns {BOOL} 
     */
    static ExportCookieFileW(szFilename, fAppend) {
        szFilename := szFilename is String ? StrPtr(szFilename) : szFilename

        result := DllCall("WININET.dll\ExportCookieFileW", "ptr", szFilename, "int", fAppend, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pchDomain 
     * @param {PSTR} pchFullDomain 
     * @returns {BOOL} 
     */
    static IsDomainLegalCookieDomainA(pchDomain, pchFullDomain) {
        pchDomain := pchDomain is String ? StrPtr(pchDomain) : pchDomain
        pchFullDomain := pchFullDomain is String ? StrPtr(pchFullDomain) : pchFullDomain

        result := DllCall("WININET.dll\IsDomainLegalCookieDomainA", "ptr", pchDomain, "ptr", pchFullDomain, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchDomain 
     * @param {PWSTR} pchFullDomain 
     * @returns {BOOL} 
     */
    static IsDomainLegalCookieDomainW(pchDomain, pchFullDomain) {
        pchDomain := pchDomain is String ? StrPtr(pchDomain) : pchDomain
        pchFullDomain := pchFullDomain is String ? StrPtr(pchFullDomain) : pchFullDomain

        result := DllCall("WININET.dll\IsDomainLegalCookieDomainW", "ptr", pchDomain, "ptr", pchFullDomain, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hRequest 
     * @param {Pointer} dwContext 
     * @returns {Pointer<Void>} 
     */
    static HttpWebSocketCompleteUpgrade(hRequest, dwContext) {
        hRequestMarshal := hRequest is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\HttpWebSocketCompleteUpgrade", hRequestMarshal, hRequest, "ptr", dwContext, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWebSocket 
     * @param {Integer} BufferType 
     * @param {Pointer} pvBuffer 
     * @param {Integer} dwBufferLength 
     * @returns {BOOL} 
     */
    static HttpWebSocketSend(hWebSocket, BufferType, pvBuffer, dwBufferLength) {
        hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\HttpWebSocketSend", hWebSocketMarshal, hWebSocket, "int", BufferType, "ptr", pvBuffer, "uint", dwBufferLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWebSocket 
     * @param {Pointer} pvBuffer 
     * @param {Integer} dwBufferLength 
     * @param {Pointer<Integer>} pdwBytesRead 
     * @param {Pointer<Integer>} pBufferType 
     * @returns {BOOL} 
     */
    static HttpWebSocketReceive(hWebSocket, pvBuffer, dwBufferLength, pdwBytesRead, pBufferType) {
        hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"
        pdwBytesReadMarshal := pdwBytesRead is VarRef ? "uint*" : "ptr"
        pBufferTypeMarshal := pBufferType is VarRef ? "int*" : "ptr"

        result := DllCall("WININET.dll\HttpWebSocketReceive", hWebSocketMarshal, hWebSocket, "ptr", pvBuffer, "uint", dwBufferLength, pdwBytesReadMarshal, pdwBytesRead, pBufferTypeMarshal, pBufferType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWebSocket 
     * @param {Integer} usStatus 
     * @param {Pointer} pvReason 
     * @param {Integer} dwReasonLength 
     * @returns {BOOL} 
     */
    static HttpWebSocketClose(hWebSocket, usStatus, pvReason, dwReasonLength) {
        hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\HttpWebSocketClose", hWebSocketMarshal, hWebSocket, "ushort", usStatus, "ptr", pvReason, "uint", dwReasonLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWebSocket 
     * @param {Integer} usStatus 
     * @param {Pointer} pvReason 
     * @param {Integer} dwReasonLength 
     * @returns {BOOL} 
     */
    static HttpWebSocketShutdown(hWebSocket, usStatus, pvReason, dwReasonLength) {
        hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"

        result := DllCall("WININET.dll\HttpWebSocketShutdown", hWebSocketMarshal, hWebSocket, "ushort", usStatus, "ptr", pvReason, "uint", dwReasonLength, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hWebSocket 
     * @param {Pointer<Integer>} pusStatus 
     * @param {Pointer} pvReason 
     * @param {Integer} dwReasonLength 
     * @param {Pointer<Integer>} pdwReasonLengthConsumed 
     * @returns {BOOL} 
     */
    static HttpWebSocketQueryCloseStatus(hWebSocket, pusStatus, pvReason, dwReasonLength, pdwReasonLengthConsumed) {
        hWebSocketMarshal := hWebSocket is VarRef ? "ptr" : "ptr"
        pusStatusMarshal := pusStatus is VarRef ? "ushort*" : "ptr"
        pdwReasonLengthConsumedMarshal := pdwReasonLengthConsumed is VarRef ? "uint*" : "ptr"

        result := DllCall("WININET.dll\HttpWebSocketQueryCloseStatus", hWebSocketMarshal, hWebSocket, pusStatusMarshal, pusStatus, "ptr", pvReason, "uint", dwReasonLength, pdwReasonLengthConsumedMarshal, pdwReasonLengthConsumed, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pcszUrl 
     * @param {Integer} cchUrl 
     * @param {PWSTR} pcwszBaseUrl 
     * @param {Integer} dwCodePageHost 
     * @param {Integer} dwCodePagePath 
     * @param {BOOL} fEncodePathExtra 
     * @param {Integer} dwCodePageExtra 
     * @param {Pointer<PWSTR>} ppwszConvertedUrl 
     * @returns {Integer} 
     */
    static InternetConvertUrlFromWireToWideChar(pcszUrl, cchUrl, pcwszBaseUrl, dwCodePageHost, dwCodePagePath, fEncodePathExtra, dwCodePageExtra, ppwszConvertedUrl) {
        pcszUrl := pcszUrl is String ? StrPtr(pcszUrl) : pcszUrl
        pcwszBaseUrl := pcwszBaseUrl is String ? StrPtr(pcwszBaseUrl) : pcwszBaseUrl

        ppwszConvertedUrlMarshal := ppwszConvertedUrl is VarRef ? "ptr*" : "ptr"

        result := DllCall("WININET.dll\InternetConvertUrlFromWireToWideChar", "ptr", pcszUrl, "uint", cchUrl, "ptr", pcwszBaseUrl, "uint", dwCodePageHost, "uint", dwCodePagePath, "int", fEncodePathExtra, "uint", dwCodePageExtra, ppwszConvertedUrlMarshal, ppwszConvertedUrl, "uint")
        return result
    }

;@endregion Methods
}
