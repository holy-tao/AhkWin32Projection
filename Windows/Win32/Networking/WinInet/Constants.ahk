#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */

;@region Constants

/**
 * @type {String}
 */
export global DIALPROP_USERNAME := "UserName"

/**
 * @type {String}
 */
export global DIALPROP_PASSWORD := "Password"

/**
 * @type {String}
 */
export global DIALPROP_DOMAIN := "Domain"

/**
 * @type {String}
 */
export global DIALPROP_SAVEPASSWORD := "SavePassword"

/**
 * @type {String}
 */
export global DIALPROP_REDIALCOUNT := "RedialCount"

/**
 * @type {String}
 */
export global DIALPROP_REDIALINTERVAL := "RedialInterval"

/**
 * @type {String}
 */
export global DIALPROP_PHONENUMBER := "PhoneNumber"

/**
 * @type {String}
 */
export global DIALPROP_LASTERROR := "LastError"

/**
 * @type {String}
 */
export global DIALPROP_RESOLVEDPHONE := "ResolvedPhone"

/**
 * @type {Integer (UInt32)}
 */
export global DIALENG_OperationComplete := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DIALENG_RedialAttempt := 65537

/**
 * @type {Integer (UInt32)}
 */
export global DIALENG_RedialWait := 65538

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_INVALID_PORT_NUMBER := 0

/**
 * @type {Integer (UInt16)}
 */
export global INTERNET_DEFAULT_FTP_PORT := 21

/**
 * @type {Integer (UInt16)}
 */
export global INTERNET_DEFAULT_GOPHER_PORT := 70

/**
 * @type {Integer (UInt16)}
 */
export global INTERNET_DEFAULT_SOCKS_PORT := 1080

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_MAX_HOST_NAME_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_MAX_USER_NAME_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_MAX_PASSWORD_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_MAX_PORT_NUMBER_LENGTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_MAX_PORT_NUMBER_VALUE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_KEEP_ALIVE_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_KEEP_ALIVE_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_KEEP_ALIVE_DISABLED := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_REQFLAG_FROM_CACHE := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_REQFLAG_ASYNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_REQFLAG_VIA_PROXY := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_REQFLAG_NO_HEADERS := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_REQFLAG_PASSIVE := 16

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_REQFLAG_CACHE_WRITE_DISABLED := 64

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_REQFLAG_NET_TIMEOUT := 128

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_IDN_DIRECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_IDN_PROXY := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_RELOAD := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_RAW_DATA := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_EXISTING_CONNECT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_ASYNC := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_PASSIVE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_NO_CACHE_WRITE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_DONT_CACHE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_MAKE_PERSISTENT := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_FROM_CACHE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_OFFLINE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_SECURE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_KEEP_CONNECTION := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_NO_AUTO_REDIRECT := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_READ_PREFETCH := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_NO_COOKIES := 524288

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_NO_AUTH := 262144

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_CACHE_IF_NET_FAIL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP := 32768

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_IGNORE_CERT_DATE_INVALID := 8192

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_IGNORE_CERT_CN_INVALID := 4096

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_RESYNCHRONIZE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_HYPERLINK := 1024

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_NO_UI := 512

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_PRAGMA_NOCACHE := 256

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_CACHE_ASYNC := 128

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_FORMS_SUBMIT := 64

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_FWD_BACK := 32

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_NEED_FILE := 16

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_MUST_CACHE_REQUEST := 16

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_ERROR_MASK_INSERT_CDROM := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_ERROR_MASK_COMBINED_SEC_CERT := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_ERROR_MASK_NEED_MSN_SSPI_PKG := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_ERROR_MASK_LOGIN_FAILURE_DISPLAY_ENTITY_BODY := 8

/**
 * @type {Integer (UInt32)}
 */
export global WININET_API_FLAG_ASYNC := 1

/**
 * @type {Integer (UInt32)}
 */
export global WININET_API_FLAG_SYNC := 4

/**
 * @type {Integer (UInt32)}
 */
export global WININET_API_FLAG_USE_CONTEXT := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_NO_CALLBACK := 0

/**
 * @type {Integer (UInt32)}
 */
export global IDSI_FLAG_KEEP_ALIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global IDSI_FLAG_SECURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IDSI_FLAG_PROXY := 4

/**
 * @type {Integer (UInt32)}
 */
export global IDSI_FLAG_TUNNEL := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_PER_CONN_FLAGS_UI := 10

/**
 * @type {Integer (UInt32)}
 */
export global PROXY_TYPE_DIRECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global PROXY_TYPE_PROXY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROXY_TYPE_AUTO_PROXY_URL := 4

/**
 * @type {Integer (UInt32)}
 */
export global PROXY_TYPE_AUTO_DETECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global AUTO_PROXY_FLAG_USER_SET := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTO_PROXY_FLAG_ALWAYS_DETECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUTO_PROXY_FLAG_DETECTION_RUN := 4

/**
 * @type {Integer (UInt32)}
 */
export global AUTO_PROXY_FLAG_MIGRATED := 8

/**
 * @type {Integer (UInt32)}
 */
export global AUTO_PROXY_FLAG_DONT_CACHE_PROXY_RESULT := 16

/**
 * @type {Integer (UInt32)}
 */
export global AUTO_PROXY_FLAG_CACHE_INIT_RUN := 32

/**
 * @type {Integer (UInt32)}
 */
export global AUTO_PROXY_FLAG_DETECTION_SUSPECT := 64

/**
 * @type {Integer (UInt32)}
 */
export global ISO_FORCE_DISCONNECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_RFC1123_FORMAT := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_RFC1123_BUFSIZE := 30

/**
 * @type {Integer (UInt32)}
 */
export global ICU_USERNAME := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_SERVICE_FTP := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_SERVICE_GOPHER := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_SERVICE_HTTP := 3

/**
 * @type {Integer (UInt32)}
 */
export global IRF_ASYNC := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRF_SYNC := 4

/**
 * @type {Integer (UInt32)}
 */
export global IRF_USE_CONTEXT := 8

/**
 * @type {Integer (UInt32)}
 */
export global IRF_NO_WAIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global ISO_GLOBAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISO_REGISTRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CALLBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONNECT_TIMEOUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONNECT_RETRIES := 3

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONNECT_BACKOFF := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SEND_TIMEOUT := 5

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONTROL_SEND_TIMEOUT := 5

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_RECEIVE_TIMEOUT := 6

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONTROL_RECEIVE_TIMEOUT := 6

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DATA_SEND_TIMEOUT := 7

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DATA_RECEIVE_TIMEOUT := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_HANDLE_TYPE := 9

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_LISTEN_TIMEOUT := 11

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_READ_BUFFER_SIZE := 12

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_WRITE_BUFFER_SIZE := 13

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ASYNC_ID := 15

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ASYNC_PRIORITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PARENT_HANDLE := 21

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_KEEP_CONNECTION := 22

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_REQUEST_FLAGS := 23

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_EXTENDED_ERROR := 24

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_OFFLINE_MODE := 26

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CACHE_STREAM_HANDLE := 27

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_USERNAME := 28

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PASSWORD := 29

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ASYNC := 30

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SECURITY_FLAGS := 31

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SECURITY_CERTIFICATE_STRUCT := 32

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DATAFILE_NAME := 33

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_URL := 34

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SECURITY_CERTIFICATE := 35

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SECURITY_KEY_BITNESS := 36

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_REFRESH := 37

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PROXY := 38

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SETTINGS_CHANGED := 39

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_VERSION := 40

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_USER_AGENT := 41

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_END_BROWSER_SESSION := 42

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PROXY_USERNAME := 43

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PROXY_PASSWORD := 44

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONTEXT_VALUE := 45

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONNECT_LIMIT := 46

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SECURITY_SELECT_CLIENT_CERT := 47

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_POLICY := 48

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DISCONNECTED_TIMEOUT := 49

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONNECTED_STATE := 50

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_IDLE_STATE := 51

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_OFFLINE_SEMANTICS := 52

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SECONDARY_CACHE_KEY := 53

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CALLBACK_FILTER := 54

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONNECT_TIME := 55

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SEND_THROUGHPUT := 56

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_RECEIVE_THROUGHPUT := 57

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_REQUEST_PRIORITY := 58

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_HTTP_VERSION := 59

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_RESET_URLCACHE_SESSION := 60

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ERROR_MASK := 62

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_FROM_CACHE_TIMEOUT := 63

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_BYPASS_EDITED_ENTRY := 64

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_HTTP_DECODING := 65

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DIAGNOSTIC_SOCKET_INFO := 67

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CODEPAGE := 68

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CACHE_TIMESTAMPS := 69

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DISABLE_AUTODIAL := 70

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_MAX_CONNS_PER_SERVER := 73

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_MAX_CONNS_PER_1_0_SERVER := 74

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PER_CONNECTION_OPTION := 75

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DIGEST_AUTH_UNLOAD := 76

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_IGNORE_OFFLINE := 77

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_IDENTITY := 78

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_REMOVE_IDENTITY := 79

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ALTER_IDENTITY := 80

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SUPPRESS_BEHAVIOR := 81

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_AUTODIAL_MODE := 82

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_AUTODIAL_CONNECTION := 83

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CLIENT_CERT_CONTEXT := 84

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_AUTH_FLAGS := 85

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_COOKIES_3RD_PARTY := 86

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DISABLE_PASSPORT_AUTH := 87

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SEND_UTF8_SERVERNAME_TO_PROXY := 88

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_EXEMPT_CONNECTION_LIMIT := 89

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENABLE_PASSPORT_AUTH := 90

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_HIBERNATE_INACTIVE_WORKER_THREADS := 91

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ACTIVATE_WORKER_THREADS := 92

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_RESTORE_WORKER_THREAD_DEFAULTS := 93

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SOCKET_SEND_BUFFER_LENGTH := 94

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PROXY_SETTINGS_CHANGED := 95

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DATAFILE_EXT := 96

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CODEPAGE_PATH := 100

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CODEPAGE_EXTRA := 101

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_IDN := 102

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_MAX_CONNS_PER_PROXY := 103

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SUPPRESS_SERVER_AUTH := 104

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SERVER_CERT_CHAIN_CONTEXT := 105

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENABLE_REDIRECT_CACHE_READ := 122

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_COMPRESSED_CONTENT_LENGTH := 147

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENABLE_HTTP_PROTOCOL := 148

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_HTTP_PROTOCOL_USED := 149

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENCODE_EXTRA := 155

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_HSTS := 157

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENTERPRISE_CONTEXT := 159

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONNECTION_FILTER := 162

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_REFERER_TOKEN_BINDING_HOSTNAME := 163

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_TOKEN_BINDING_PUBLIC_KEY := 181

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_COOKIES_SAME_SITE_LEVEL := 187

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_REQUEST_ANNOTATION := 193

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FIRST_OPTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_LAST_OPTION := 193

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_PRIORITY_FOREGROUND := 1000

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_COOKIES_SAME_SITE_LEVEL_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_COOKIES_SAME_SITE_LEVEL_SAME_SITE := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_COOKIES_SAME_SITE_LEVEL_CROSS_SITE_LAX := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_COOKIES_SAME_SITE_LEVEL_CROSS_SITE := 3

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_COOKIES_SAME_SITE_LEVEL_MAX := 3

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_PROTOCOL_FLAG_HTTP2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_PROTOCOL_MASK := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_REQUEST_ANNOTATION_MAX_LENGTH := 64000

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_INTERNET := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_CONNECT_FTP := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_CONNECT_GOPHER := 3

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_CONNECT_HTTP := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_FTP_FIND := 5

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_FTP_FIND_HTML := 6

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_FTP_FILE := 7

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_FTP_FILE_HTML := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_GOPHER_FIND := 9

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_GOPHER_FIND_HTML := 10

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_GOPHER_FILE := 11

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_GOPHER_FILE_HTML := 12

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_HTTP_REQUEST := 13

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_HANDLE_TYPE_FILE_REQUEST := 14

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_FLAG_DISABLE_NEGOTIATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_FLAG_ENABLE_NEGOTIATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_FLAG_DISABLE_BASIC_CLEARCHANNEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_FLAG_DISABLE_SERVER_AUTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_UNKNOWNBIT := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_FORTEZZA := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_NORMALBITNESS := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_SSL := 2

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_SSL3 := 4

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_PCT := 8

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_PCT4 := 16

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IETFSSL4 := 32

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_40BIT := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_128BIT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_56BIT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IGNORE_REVOCATION := 128

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IGNORE_WRONG_USAGE := 512

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTPS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTP := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_IGNORE_WEAK_SIGNATURE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_FLAG_OPT_IN_WEAK_SIGNATURE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global AUTODIAL_MODE_NEVER := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTODIAL_MODE_ALWAYS := 2

/**
 * @type {Integer (UInt32)}
 */
export global AUTODIAL_MODE_NO_NETWORK_PRESENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_RESOLVING_NAME := 10

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_NAME_RESOLVED := 11

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_CONNECTING_TO_SERVER := 20

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_CONNECTED_TO_SERVER := 21

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_SENDING_REQUEST := 30

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_REQUEST_SENT := 31

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_RECEIVING_RESPONSE := 40

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_RESPONSE_RECEIVED := 41

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_CTL_RESPONSE_RECEIVED := 42

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_PREFETCH := 43

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_CLOSING_CONNECTION := 50

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_CONNECTION_CLOSED := 51

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_HANDLE_CREATED := 60

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_HANDLE_CLOSING := 70

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_DETECTING_PROXY := 80

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_REQUEST_COMPLETE := 100

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_REDIRECT := 110

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_INTERMEDIATE_RESPONSE := 120

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_USER_INPUT_REQUIRED := 140

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_STATE_CHANGE := 200

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_COOKIE_SENT := 320

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_COOKIE_RECEIVED := 321

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_PRIVACY_IMPACTED := 324

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_P3P_HEADER := 325

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_P3P_POLICYREF := 326

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_COOKIE_HISTORY := 327

/**
 * @type {Integer (UInt32)}
 */
export global MAX_GOPHER_DISPLAY_TEXT := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_GOPHER_SELECTOR_TEXT := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_GOPHER_HOST_NAME := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_GOPHER_CATEGORY_NAME := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_GOPHER_ATTRIBUTE_NAME := 128

/**
 * @type {Integer (UInt32)}
 */
export global MIN_GOPHER_ATTRIBUTE_LENGTH := 256

/**
 * @type {String}
 */
export global GOPHER_INFO_CATEGORY := "+INFO"

/**
 * @type {String}
 */
export global GOPHER_ADMIN_CATEGORY := "+ADMIN"

/**
 * @type {String}
 */
export global GOPHER_VIEWS_CATEGORY := "+VIEWS"

/**
 * @type {String}
 */
export global GOPHER_ABSTRACT_CATEGORY := "+ABSTRACT"

/**
 * @type {String}
 */
export global GOPHER_VERONICA_CATEGORY := "+VERONICA"

/**
 * @type {String}
 */
export global GOPHER_ADMIN_ATTRIBUTE := "Admin"

/**
 * @type {String}
 */
export global GOPHER_MOD_DATE_ATTRIBUTE := "Mod-Date"

/**
 * @type {String}
 */
export global GOPHER_TTL_ATTRIBUTE := "TTL"

/**
 * @type {String}
 */
export global GOPHER_SCORE_ATTRIBUTE := "Score"

/**
 * @type {String}
 */
export global GOPHER_RANGE_ATTRIBUTE := "Score-range"

/**
 * @type {String}
 */
export global GOPHER_SITE_ATTRIBUTE := "Site"

/**
 * @type {String}
 */
export global GOPHER_ORG_ATTRIBUTE := "Org"

/**
 * @type {String}
 */
export global GOPHER_LOCATION_ATTRIBUTE := "Loc"

/**
 * @type {String}
 */
export global GOPHER_GEOG_ATTRIBUTE := "Geog"

/**
 * @type {String}
 */
export global GOPHER_TIMEZONE_ATTRIBUTE := "TZ"

/**
 * @type {String}
 */
export global GOPHER_PROVIDER_ATTRIBUTE := "Provider"

/**
 * @type {String}
 */
export global GOPHER_VERSION_ATTRIBUTE := "Version"

/**
 * @type {String}
 */
export global GOPHER_ABSTRACT_ATTRIBUTE := "Abstract"

/**
 * @type {String}
 */
export global GOPHER_VIEW_ATTRIBUTE := "View"

/**
 * @type {String}
 */
export global GOPHER_TREEWALK_ATTRIBUTE := "treewalk"

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_BASE := 2882325504

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_CATEGORY_ID_ALL := 2882325505

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_CATEGORY_ID_INFO := 2882325506

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_CATEGORY_ID_ADMIN := 2882325507

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_CATEGORY_ID_VIEWS := 2882325508

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_CATEGORY_ID_ABSTRACT := 2882325509

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_CATEGORY_ID_VERONICA := 2882325510

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_CATEGORY_ID_ASK := 2882325511

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_CATEGORY_ID_UNKNOWN := 2882325512

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_ALL := 2882325513

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_ADMIN := 2882325514

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_MOD_DATE := 2882325515

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_TTL := 2882325516

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_SCORE := 2882325517

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_RANGE := 2882325518

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_SITE := 2882325519

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_ORG := 2882325520

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_LOCATION := 2882325521

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_GEOG := 2882325522

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_TIMEZONE := 2882325523

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_PROVIDER := 2882325524

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_VERSION := 2882325525

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_ABSTRACT := 2882325526

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_VIEW := 2882325527

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_TREEWALK := 2882325528

/**
 * @type {Integer (UInt32)}
 */
export global GOPHER_ATTRIBUTE_ID_UNKNOWN := 2882325529

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_MAJOR_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_MINOR_VERSION := 0

/**
 * @type {String}
 */
export global HTTP_VERSIONA := "HTTP/1.0"

/**
 * @type {String}
 */
export global HTTP_VERSIONW := "HTTP/1.0"

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_MIME_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_TRANSFER_ENCODING := 2

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_DESCRIPTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_LENGTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_LANGUAGE := 6

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ALLOW := 7

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PUBLIC := 8

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_DATE := 9

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_EXPIRES := 10

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_LAST_MODIFIED := 11

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_MESSAGE_ID := 12

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_URI := 13

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_DERIVED_FROM := 14

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_COST := 15

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_LINK := 16

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PRAGMA := 17

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_VERSION := 18

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_STATUS_CODE := 19

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_STATUS_TEXT := 20

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_RAW_HEADERS := 21

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_RAW_HEADERS_CRLF := 22

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONNECTION := 23

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ACCEPT := 24

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ACCEPT_CHARSET := 25

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ACCEPT_ENCODING := 26

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ACCEPT_LANGUAGE := 27

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_AUTHORIZATION := 28

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_ENCODING := 29

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_FORWARDED := 30

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_FROM := 31

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_IF_MODIFIED_SINCE := 32

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_LOCATION := 33

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ORIG_URI := 34

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_REFERER := 35

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_RETRY_AFTER := 36

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_SERVER := 37

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_TITLE := 38

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_USER_AGENT := 39

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_WWW_AUTHENTICATE := 40

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PROXY_AUTHENTICATE := 41

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ACCEPT_RANGES := 42

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_SET_COOKIE := 43

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_COOKIE := 44

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_REQUEST_METHOD := 45

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_REFRESH := 46

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_DISPOSITION := 47

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_AGE := 48

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CACHE_CONTROL := 49

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_BASE := 50

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_LOCATION := 51

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_MD5 := 52

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CONTENT_RANGE := 53

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ETAG := 54

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_HOST := 55

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_IF_MATCH := 56

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_IF_NONE_MATCH := 57

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_IF_RANGE := 58

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_IF_UNMODIFIED_SINCE := 59

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_MAX_FORWARDS := 60

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PROXY_AUTHORIZATION := 61

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_RANGE := 62

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_TRANSFER_ENCODING := 63

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_UPGRADE := 64

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_VARY := 65

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_VIA := 66

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_WARNING := 67

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_EXPECT := 68

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PROXY_CONNECTION := 69

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_UNLESS_MODIFIED_SINCE := 70

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ECHO_REQUEST := 71

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ECHO_REPLY := 72

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ECHO_HEADERS := 73

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_ECHO_HEADERS_CRLF := 74

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PROXY_SUPPORT := 75

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_AUTHENTICATION_INFO := 76

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PASSPORT_URLS := 77

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PASSPORT_CONFIG := 78

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_X_CONTENT_TYPE_OPTIONS := 79

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_P3P := 80

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_X_P2P_PEERDIST := 81

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_TRANSLATE := 82

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_X_UA_COMPATIBLE := 83

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_DEFAULT_STYLE := 84

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_X_FRAME_OPTIONS := 85

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_X_XSS_PROTECTION := 86

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_SET_COOKIE2 := 87

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_DO_NOT_TRACK := 88

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_KEEP_ALIVE := 89

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_HTTP2_SETTINGS := 90

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_STRICT_TRANSPORT_SECURITY := 91

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_TOKEN_BINDING := 92

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_INCLUDE_REFERRED_TOKEN_BINDING_ID := 93

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_INCLUDE_REFERER_TOKEN_BINDING_ID := 93

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PUBLIC_KEY_PINS := 94

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_PUBLIC_KEY_PINS_REPORT_ONLY := 95

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_MAX := 95

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_CUSTOM := 65535

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_FLAG_REQUEST_HEADERS := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_FLAG_SYSTEMTIME := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_FLAG_NUMBER := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_FLAG_COALESCE := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_FLAG_NUMBER64 := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_QUERY_FLAG_COALESCE_WITH_COMMA := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_STATUS_MISDIRECTED_REQUEST := 421

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_ADDREQ_INDEX_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_ADDREQ_FLAGS_MASK := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global HSR_ASYNC := 1

/**
 * @type {Integer (UInt32)}
 */
export global HSR_SYNC := 4

/**
 * @type {Integer (UInt32)}
 */
export global HSR_USE_CONTEXT := 8

/**
 * @type {Integer (UInt32)}
 */
export global HSR_INITIATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global HSR_DOWNLOAD := 16

/**
 * @type {Integer (UInt32)}
 */
export global HSR_CHUNKED := 32

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_IS_SECURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_IS_SESSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_PROMPT_REQUIRED := 32

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_EVALUATE_P3P := 64

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_APPLY_P3P := 128

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_P3P_ENABLED := 256

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_IS_RESTRICTED := 512

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_IE6 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_IS_LEGACY := 2048

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_NON_SCRIPT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_HOST_ONLY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_APPLY_HOST_ONLY := 32768

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_HOST_ONLY_APPLIED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_SAME_SITE_STRICT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_SAME_SITE_LAX := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_SAME_SITE_LEVEL_CROSS_SITE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_ICC_FORCE_CONNECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_ERROR_UI_FILTER_FOR_ERRORS := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_ERROR_UI_FLAGS_GENERATE_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_ERROR_UI_FLAGS_NO_UI := 8

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_ERROR_UI_SERIALIZE_DIALOGS := 16

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_ERROR_BASE := 12000

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_OUT_OF_HANDLES := 12001

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_TIMEOUT := 12002

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_EXTENDED_ERROR := 12003

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INTERNAL_ERROR := 12004

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INVALID_URL := 12005

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_UNRECOGNIZED_SCHEME := 12006

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NAME_NOT_RESOLVED := 12007

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_PROTOCOL_NOT_FOUND := 12008

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INVALID_OPTION := 12009

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_BAD_OPTION_LENGTH := 12010

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_OPTION_NOT_SETTABLE := 12011

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SHUTDOWN := 12012

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INCORRECT_USER_NAME := 12013

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INCORRECT_PASSWORD := 12014

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_LOGIN_FAILURE := 12015

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INVALID_OPERATION := 12016

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_OPERATION_CANCELLED := 12017

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INCORRECT_HANDLE_TYPE := 12018

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INCORRECT_HANDLE_STATE := 12019

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NOT_PROXY_REQUEST := 12020

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_REGISTRY_VALUE_NOT_FOUND := 12021

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_BAD_REGISTRY_PARAMETER := 12022

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NO_DIRECT_ACCESS := 12023

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NO_CONTEXT := 12024

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NO_CALLBACK := 12025

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_REQUEST_PENDING := 12026

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INCORRECT_FORMAT := 12027

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_ITEM_NOT_FOUND := 12028

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_CANNOT_CONNECT := 12029

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_CONNECTION_ABORTED := 12030

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_CONNECTION_RESET := 12031

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_FORCE_RETRY := 12032

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INVALID_PROXY_REQUEST := 12033

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NEED_UI := 12034

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_HANDLE_EXISTS := 12036

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SEC_CERT_DATE_INVALID := 12037

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SEC_CERT_CN_INVALID := 12038

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_HTTP_TO_HTTPS_ON_REDIR := 12039

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_HTTPS_TO_HTTP_ON_REDIR := 12040

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_MIXED_SECURITY := 12041

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_CHG_POST_IS_NON_SECURE := 12042

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_POST_IS_NON_SECURE := 12043

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED := 12044

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INVALID_CA := 12045

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_CLIENT_AUTH_NOT_SETUP := 12046

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_ASYNC_THREAD_FAILED := 12047

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_REDIRECT_SCHEME_CHANGE := 12048

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_DIALOG_PENDING := 12049

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_RETRY_DIALOG := 12050

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_HTTPS_HTTP_SUBMIT_REDIR := 12052

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INSERT_CDROM := 12053

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_FORTEZZA_LOGIN_NEEDED := 12054

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SEC_CERT_ERRORS := 12055

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SEC_CERT_NO_REV := 12056

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SEC_CERT_REV_FAILED := 12057

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_HSTS_REDIRECT_REQUIRED := 12060

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SEC_CERT_WEAK_SIGNATURE := 12062

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FTP_TRANSFER_IN_PROGRESS := 12110

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FTP_DROPPED := 12111

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_FTP_NO_PASSIVE_MODE := 12112

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_GOPHER_PROTOCOL_ERROR := 12130

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_GOPHER_NOT_FILE := 12131

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_GOPHER_DATA_ERROR := 12132

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_GOPHER_END_OF_DATA := 12133

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_GOPHER_INVALID_LOCATOR := 12134

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_GOPHER_INCORRECT_LOCATOR_TYPE := 12135

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_GOPHER_NOT_GOPHER_PLUS := 12136

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_GOPHER_ATTRIBUTE_NOT_FOUND := 12137

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_GOPHER_UNKNOWN_LOCATOR := 12138

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_HEADER_NOT_FOUND := 12150

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_DOWNLEVEL_SERVER := 12151

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_INVALID_SERVER_RESPONSE := 12152

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_INVALID_HEADER := 12153

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_INVALID_QUERY_REQUEST := 12154

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_HEADER_ALREADY_EXISTS := 12155

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_REDIRECT_FAILED := 12156

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_NOT_REDIRECTED := 12160

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION := 12161

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_COOKIE_DECLINED := 12162

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_REDIRECT_NEEDS_CONFIRMATION := 12168

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SECURITY_CHANNEL_ERROR := 12157

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_UNABLE_TO_CACHE_FILE := 12158

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_TCPIP_NOT_INSTALLED := 12159

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_DISCONNECTED := 12163

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SERVER_UNREACHABLE := 12164

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_PROXY_SERVER_UNREACHABLE := 12165

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_BAD_AUTO_PROXY_SCRIPT := 12166

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_UNABLE_TO_DOWNLOAD_SCRIPT := 12167

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SEC_INVALID_CERT := 12169

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SEC_CERT_REVOKED := 12170

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_FAILED_DUETOSECURITYCHECK := 12171

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NOT_INITIALIZED := 12172

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NEED_MSN_SSPI_PKG := 12173

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_LOGIN_FAILURE_DISPLAY_ENTITY_BODY := 12174

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_DECODING_FAILED := 12175

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED_PROXY := 12187

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SECURE_FAILURE_PROXY := 12188

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_HTTP_PROTOCOL_MISMATCH := 12190

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_GLOBAL_CALLBACK_FAILED := 12191

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_FEATURE_DISABLED := 12192

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_ERROR_LAST := 12192

/**
 * @type {Integer (UInt32)}
 */
export global NORMAL_CACHE_ENTRY := 1

/**
 * @type {Integer (UInt32)}
 */
export global STICKY_CACHE_ENTRY := 4

/**
 * @type {Integer (UInt32)}
 */
export global EDITED_CACHE_ENTRY := 8

/**
 * @type {Integer (UInt32)}
 */
export global TRACK_OFFLINE_CACHE_ENTRY := 16

/**
 * @type {Integer (UInt32)}
 */
export global TRACK_ONLINE_CACHE_ENTRY := 32

/**
 * @type {Integer (UInt32)}
 */
export global SPARSE_CACHE_ENTRY := 65536

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_CACHE_ENTRY := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global URLHISTORY_CACHE_ENTRY := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_ATTRIBUTE_GET_ALL := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_ATTRIBUTE_BASIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_ATTRIBUTE_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_ATTRIBUTE_TYPE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_ATTRIBUTE_QUOTA := 8

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_ATTRIBUTE_GROUPNAME := 16

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_ATTRIBUTE_STORAGE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_FLAG_NONPURGEABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_FLAG_GIDONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_FLAG_FLUSHURL_ONDELETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_SEARCH_ALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_SEARCH_BYURL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_TYPE_INVALID := 1

/**
 * @type {Integer (UInt32)}
 */
export global GROUPNAME_MAX_LENGTH := 120

/**
 * @type {Integer (UInt32)}
 */
export global GROUP_OWNER_STORAGE_SIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_ATTRIBUTE_FC := 4

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_HITRATE_FC := 16

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_MODTIME_FC := 64

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_EXPTIME_FC := 128

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_ACCTIME_FC := 256

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_SYNCTIME_FC := 512

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_HEADERINFO_FC := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_EXEMPT_DELTA_FC := 2048

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_GROUP_ADD := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_GROUP_REMOVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_DIAL_FORCE_PROMPT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_DIAL_SHOW_OFFLINE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_DIAL_UNATTENDED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global INTERENT_GOONLINE_REFRESH := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERENT_GOONLINE_NOPROMPT := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERENT_GOONLINE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CUSTOMDIAL_CONNECT := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CUSTOMDIAL_UNATTENDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CUSTOMDIAL_DISCONNECT := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CUSTOMDIAL_SHOWOFFLINE := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CUSTOMDIAL_SAFE_FOR_UNATTENDED := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CUSTOMDIAL_WILL_SUPPLY_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CUSTOMDIAL_CAN_HANGUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_DIALSTATE_DISCONNECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_IDENTITY_FLAG_PRIVATE_CACHE := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_IDENTITY_FLAG_SHARED_CACHE := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_IDENTITY_FLAG_CLEAR_DATA := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_IDENTITY_FLAG_CLEAR_COOKIES := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_IDENTITY_FLAG_CLEAR_HISTORY := 16

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_IDENTITY_FLAG_CLEAR_CONTENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_SUPPRESS_RESET_ALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_SUPPRESS_COOKIE_POLICY := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_SUPPRESS_COOKIE_POLICY_RESET := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TEMPLATE_NO_COOKIES := 0

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TEMPLATE_HIGH := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TEMPLATE_MEDIUM_HIGH := 2

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TEMPLATE_MEDIUM := 3

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TEMPLATE_MEDIUM_LOW := 4

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TEMPLATE_LOW := 5

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TEMPLATE_CUSTOM := 100

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TEMPLATE_ADVANCED := 101

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TEMPLATE_MAX := 5

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TYPE_FIRST_PARTY := 0

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_TYPE_THIRD_PARTY := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CACHE_ENTRY_INFO_SIZE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_REQFLAG_FROM_APP_CACHE := 256

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_BGUPDATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_FLAG_FTP_FOLDER_VIEW := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_PREFETCH_PROGRESS := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_PREFETCH_COMPLETE := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_PREFETCH_ABORTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISO_FORCE_OFFLINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DLG_FLAGS_INVALID_CA := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global DLG_FLAGS_SEC_CERT_CN_INVALID := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global DLG_FLAGS_SEC_CERT_DATE_INVALID := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global DLG_FLAGS_WEAK_SIGNATURE := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global DLG_FLAGS_INSECURE_FALLBACK := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global DLG_FLAGS_SEC_CERT_REV_FAILED := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_SERVICE_URL := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONTEXT_VALUE_OLD := 10

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_NET_SPEED := 61

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SECURITY_CONNECTION_INFO := 66

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DETECT_POST_SEND := 71

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DISABLE_NTLM_PREAUTH := 72

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ORIGINAL_CONNECT_FLAGS := 97

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CERT_ERROR_FLAGS := 98

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_IGNORE_CERT_ERROR_FLAGS := 99

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SESSION_START_TIME := 106

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PROXY_CREDENTIALS := 107

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_EXTENDED_CALLBACKS := 108

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PROXY_FROM_REQUEST := 109

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ALLOW_FAILED_CONNECT_CONTENT := 110

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CACHE_PARTITION := 111

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_AUTODIAL_HWND := 112

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SERVER_CREDENTIALS := 113

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_WPAD_SLEEP := 114

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_FAIL_ON_CACHE_WRITE_ERROR := 115

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DOWNLOAD_MODE := 116

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_RESPONSE_RESUMABLE := 117

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CM_HANDLE_COPY_REF := 118

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CONNECTION_INFO := 120

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_BACKGROUND_CONNECTIONS := 121

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DO_NOT_TRACK := 123

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_USE_MODIFIED_HEADER_FILTER := 124

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_WWA_MODE := 125

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_UPGRADE_TO_WEB_SOCKET := 126

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_WEB_SOCKET_KEEPALIVE_INTERVAL := 127

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_UNLOAD_NOTIFY_EVENT := 128

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SOCKET_NODELAY := 129

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_APP_CACHE := 130

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DEPENDENCY_HANDLE := 131

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_USE_FIRST_AVAILABLE_CONNECTION := 132

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_TIMED_CONNECTION_LIMIT_BYPASS := 133

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_WEB_SOCKET_CLOSE_TIMEOUT := 134

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_FLUSH_STATE := 135

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DISALLOW_PREMATURE_EOF := 137

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SOCKET_NOTIFICATION_IOCTL := 138

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CACHE_ENTRY_EXTRA_DATA := 139

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_MAX_QUERY_BUFFER_SIZE := 140

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_FALSE_START := 141

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_USER_PASS_SERVER_ONLY := 142

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SERVER_AUTH_SCHEME := 143

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PROXY_AUTH_SCHEME := 144

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_TUNNEL_ONLY := 145

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SOURCE_PORT := 146

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENABLE_DUO := 148

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DUO_USED := 149

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CHUNK_ENCODE_REQUEST := 150

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SECURE_FAILURE := 151

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_NOTIFY_SENDING_COOKIE := 152

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CLIENT_CERT_ISSUER_LIST := 153

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_RESET := 154

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SERVER_ADDRESS_INFO := 156

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENABLE_WBOEXT := 158

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DISABLE_INSECURE_FALLBACK := 160

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ALLOW_INSECURE_FALLBACK := 161

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SET_IN_PRIVATE := 164

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DOWNLOAD_MODE_HANDLE := 165

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_EDGE_COOKIES := 166

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_NO_HTTP_SERVER_AUTH := 167

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENABLE_HEADER_CALLBACKS := 168

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PRESERVE_REQUEST_SERVER_CREDENTIALS_ON_REDIRECT := 169

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PRESERVE_REFERER_ON_HTTPS_TO_HTTP_REDIRECT := 170

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_TCP_FAST_OPEN := 171

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_SYNC_MODE_AUTOMATIC_SESSION_DISABLED := 172

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENABLE_ZLIB_DEFLATE := 173

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENCODE_FALLBACK_FOR_REDIRECT_URI := 174

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_EDGE_COOKIES_TEMP := 175

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_OPT_IN_WEAK_SIGNATURE := 176

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_PARSE_LINE_FOLDING := 177

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_FORCE_DECODE := 178

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_COOKIES_APPLY_HOST_ONLY := 179

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_EDGE_MODE := 180

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CANCEL_CACHE_WRITE := 182

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_AUTH_SCHEME_SELECTED := 183

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_NOCACHE_WRITE_IN_PRIVATE := 184

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ACTIVITY_ID := 185

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_REQUEST_TIMES := 186

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_GLOBAL_CALLBACK := 188

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_ENABLE_TEST_SIGNING := 189

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_DISABLE_PROXY_LINK_LOCAL_NAME_RESOLUTION := 190

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_HTTP_09 := 191

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_CALLER_MODULE := 192

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_LAST_OPTION_INTERNAL := 193

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_OFFLINE_TIMEOUT := 49

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_OPTION_LINE_STATE := 50

/**
 * @type {Integer (UInt32)}
 */
export global DUO_PROTOCOL_FLAG_SPDY3 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DUO_PROTOCOL_MASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global AUTH_FLAG_RESET := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTH_SCHEME_BASIC := 0

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTH_SCHEME_DIGEST := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTH_SCHEME_NTLM := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTH_SCHEME_KERBEROS := 3

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTH_SCHEME_NEGOTIATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTH_SCHEME_PASSPORT := 5

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTH_SCHEME_UNKNOWN := 6

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_SENDING_COOKIE := 328

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_REQUEST_HEADERS_SET := 329

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_RESPONSE_HEADERS_SET := 330

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_PROXY_CREDENTIALS := 400

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_SERVER_CREDENTIALS := 401

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_SERVER_CONNECTION_STATE := 410

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_END_BROWSER_SESSION := 420

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_COOKIE := 430

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_STATE_LB := 0

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_STATE_UB := 5

/**
 * @type {Integer (UInt32)}
 */
export global MaxPrivacySettings := 16384

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_RESOLVING := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_RESOLVED := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_CONNECTING := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_CONNECTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_SENDING := 16

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_SENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_RECEIVING := 64

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_RECEIVED := 128

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_CLOSING := 256

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_CLOSED := 512

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_HANDLE_CREATED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_HANDLE_CLOSING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_PREFETCH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_REDIRECT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_STATUS_FILTER_STATE_CHANGE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_ADDREQ_FLAG_RESPONSE_HEADERS := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_ADDREQ_FLAG_ALLOW_EMPTY_VALUES := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_DONT_ALLOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_ALLOW := 2

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_ALLOW_ALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_DONT_ALLOW_ALL := 8

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_OP_SET := 1

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_OP_MODIFY := 2

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_OP_GET := 4

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_OP_SESSION := 8

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_OP_PERSISTENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_OP_3RD_PARTY := 32

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_PERSISTENT_HOST_ONLY := 65536

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_RESTRICTED_ZONE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_EDGE_COOKIES := 262144

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_ALL_COOKIES := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_NO_CALLBACK := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_COOKIE_ECTX_3RDPARTY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global FLAGS_ERROR_UI_SHOW_IDN_HOSTNAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NO_NEW_CONTAINERS := 12051

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_SOURCE_PORT_IN_USE := 12058

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INSECURE_FALLBACK_REQUIRED := 12059

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_PROXY_ALERT := 12061

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NO_CM_CONNECTION := 12080

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_PUSH_STATUS_CODE_NOT_SUPPORTED := 12147

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_PUSH_RETRY_NOT_SUPPORTED := 12148

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_PUSH_ENABLE_FAILED := 12149

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_DISALLOW_INPRIVATE := 12189

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_OFFLINE := 12163

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_INTERNAL_ERROR_BASE := 12900

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_INTERNAL_SOCKET_ERROR := 12901

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_CONNECTION_AVAILABLE := 12902

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NO_KNOWN_SERVERS := 12903

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_PING_FAILED := 12904

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_NO_PING_SUPPORT := 12905

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_INTERNET_CACHE_SUCCESS := 12906

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION_EX := 12907

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_1_1_CACHE_ENTRY := 64

/**
 * @type {Integer (UInt32)}
 */
export global STATIC_CACHE_ENTRY := 128

/**
 * @type {Integer (UInt32)}
 */
export global MUST_REVALIDATE_CACHE_ENTRY := 256

/**
 * @type {Integer (UInt32)}
 */
export global SHORTPATH_CACHE_ENTRY := 512

/**
 * @type {Integer (UInt32)}
 */
export global DOWNLOAD_CACHE_ENTRY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global REDIRECT_CACHE_ENTRY := 2048

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_ACCEPTED_CACHE_ENTRY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_LEASHED_CACHE_ENTRY := 8192

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_DOWNGRADED_CACHE_ENTRY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global COOKIE_REJECTED_CACHE_ENTRY := 32768

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_MODE_CACHE_ENTRY := 131072

/**
 * @type {Integer (UInt32)}
 */
export global XDR_CACHE_ENTRY := 262144

/**
 * @type {Integer (UInt32)}
 */
export global IMMUTABLE_CACHE_ENTRY := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PENDING_DELETE_CACHE_ENTRY := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global OTHER_USER_CACHE_ENTRY := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global PRIVACY_IMPACTED_CACHE_ENTRY := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global POST_RESPONSE_CACHE_ENTRY := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global INSTALLED_CACHE_ENTRY := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global POST_CHECK_CACHE_ENTRY := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global IDENTITY_CACHE_ENTRY := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global ANY_CACHE_ENTRY := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CACHEGROUP_FLAG_VALID := 7

/**
 * @type {Integer (UInt64)}
 */
export global CACHEGROUP_ID_BUILTIN_STICKY := 1152921504606846983

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_FLAG_ALLOW_COLLISIONS := 256

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_FLAG_INSTALLED_ENTRY := 512

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_FLAG_ENTRY_OR_MAPPING := 1024

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_FLAG_ADD_FILENAME_ONLY := 2048

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_FLAG_GET_STRUCT_ONLY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_TYPE_FC := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_ENTRY_MODIFY_DATA_FC := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_CONTAINER_NOSUBDIRS := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_CONTAINER_AUTODELETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_CONTAINER_RESERVED1 := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_CONTAINER_NODESKTOPINIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_CONTAINER_MAP_ENABLED := 16

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_CONTAINER_BLOOM_FILTER := 32

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_CONTAINER_SHARE_READ := 256

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_CACHE_CONTAINER_SHARE_READ_WRITE := 768

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_FIND_CONTAINER_RETURN_NOCHANGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CURRENT_SETTINGS_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CONLIST_CHANGE_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_COOKIE_CHANGE_COUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_NOTIFICATION_HWND := 3

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_NOTIFICATION_MESG := 4

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_ROOTGROUP_OFFSET := 5

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_GID_LOW := 6

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_GID_HIGH := 7

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_LAST_SCAVENGE_TIMESTAMP := 8

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_READ_COUNT_SINCE_LAST_SCAVENGE := 9

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_WRITE_COUNT_SINCE_LAST_SCAVENGE := 10

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_HSTS_CHANGE_COUNT := 11

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_12 := 12

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_13 := 13

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_SSL_STATE_COUNT := 14

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_DOWNLOAD_PARTIAL := 14

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_15 := 15

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_16 := 16

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_17 := 17

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_18 := 18

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_19 := 19

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_20 := 20

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_NOTIFICATION_FILTER := 21

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_ROOT_LEAK_OFFSET := 22

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_23 := 23

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_24 := 24

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_25 := 25

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_26 := 26

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_ROOT_GROUPLIST_OFFSET := 27

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_28 := 28

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_29 := 29

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_30 := 30

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_CACHE_RESERVED_31 := 31

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_HEADER_DATA_LAST := 31

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_NOTIFY_ADD_URL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_NOTIFY_DELETE_URL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_NOTIFY_UPDATE_URL := 4

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_NOTIFY_DELETE_ALL := 8

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_NOTIFY_URL_SET_STICKY := 16

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_NOTIFY_URL_UNSET_STICKY := 32

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_NOTIFY_SET_ONLINE := 256

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_NOTIFY_SET_OFFLINE := 512

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_NOTIFY_FILTER_CHANGED := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global APP_CACHE_LOOKUP_NO_MASTER_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global APP_CACHE_ENTRY_TYPE_MASTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global APP_CACHE_ENTRY_TYPE_EXPLICIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global APP_CACHE_ENTRY_TYPE_FALLBACK := 4

/**
 * @type {Integer (UInt32)}
 */
export global APP_CACHE_ENTRY_TYPE_FOREIGN := 8

/**
 * @type {Integer (UInt32)}
 */
export global APP_CACHE_ENTRY_TYPE_MANIFEST := 16

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_CONFIG_CONTENT_QUOTA_FC := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_CONFIG_TOTAL_CONTENT_QUOTA_FC := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_CONFIG_APPCONTAINER_CONTENT_QUOTA_FC := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CACHE_CONFIG_APPCONTAINER_TOTAL_CONTENT_QUOTA_FC := 262144

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTOPROXY_INIT_DEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTOPROXY_INIT_DOWNLOADSYNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTOPROXY_INIT_QUERYSTATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_AUTOPROXY_INIT_ONLYQUERY := 8

/**
 * @type {String}
 */
export global REGSTR_DIAL_AUTOCONNECT := "AutoConnect"

/**
 * @type {String}
 */
export global REGSTR_LEASH_LEGACY_COOKIES := "LeashLegacyCookies"

/**
 * @type {String}
 */
export global LOCAL_NAMESPACE_PREFIX := "Local\"

/**
 * @type {String}
 */
export global LOCAL_NAMESPACE_PREFIX_W := "Local\"

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_SUPPRESS_COOKIE_PERSIST := 3

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_SUPPRESS_COOKIE_PERSIST_RESET := 4

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_WEB_SOCKET_MAX_CLOSE_REASON_LENGTH := 123

/**
 * @type {Integer (UInt32)}
 */
export global HTTP_WEB_SOCKET_MIN_KEEPALIVE_VALUE := 10000

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_GLOBAL_CALLBACK_SENDING_HTTP_HEADERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_GLOBAL_CALLBACK_DETECTING_PROXY := 2
;@endregion Constants
