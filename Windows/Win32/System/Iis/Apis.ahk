#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class Iis {

;@region Constants

    /**
     * @type {String}
     */
    static IISADMIN_EXTENSIONS_REG_KEYA => "SOFTWARE\Microsoft\InetStp\Extensions"

    /**
     * @type {String}
     */
    static IISADMIN_EXTENSIONS_REG_KEYW => "SOFTWARE\Microsoft\InetStp\Extensions"

    /**
     * @type {String}
     */
    static IISADMIN_EXTENSIONS_REG_KEY => "SOFTWARE\Microsoft\InetStp\Extensions"

    /**
     * @type {String}
     */
    static IISADMIN_EXTENSIONS_CLSID_MD_KEYA => "LM/IISADMIN/EXTENSIONS/DCOMCLSIDS"

    /**
     * @type {String}
     */
    static IISADMIN_EXTENSIONS_CLSID_MD_KEYW => "LM/IISADMIN/EXTENSIONS/DCOMCLSIDS"

    /**
     * @type {String}
     */
    static IISADMIN_EXTENSIONS_CLSID_MD_KEY => "LM/IISADMIN/EXTENSIONS/DCOMCLSIDS"

    /**
     * @type {Integer (UInt32)}
     */
    static ADMINDATA_MAX_NAME_LEN => 256

    /**
     * @type {String}
     */
    static CLSID_MSAdminBase_W => "{a9e69610-b80d-11d0-b9b9-00a0c922e750}"

    /**
     * @type {Integer (UInt32)}
     */
    static IMGCHG_SIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMGCHG_VIEW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMGCHG_COMPLETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMGCHG_ANIMATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMGCHG_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMGLOAD_NOTLOADED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static IMGLOAD_LOADING => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static IMGLOAD_STOPPED => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static IMGLOAD_ERROR => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static IMGLOAD_COMPLETE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static IMGLOAD_MASK => 32505856

    /**
     * @type {Integer (UInt32)}
     */
    static IMGBITS_NONE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static IMGBITS_PARTIAL => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static IMGBITS_TOTAL => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static IMGBITS_MASK => 234881024

    /**
     * @type {Integer (UInt32)}
     */
    static IMGANIM_ANIMATED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static IMGANIM_MASK => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static IMGTRANS_OPAQUE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static IMGTRANS_MASK => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DWN_COLORMODE => 63

    /**
     * @type {Integer (UInt32)}
     */
    static DWN_DOWNLOADONLY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DWN_FORCEDITHER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DWN_RAWIMAGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DWN_MIRRORIMAGE => 512

    /**
     * @type {String}
     */
    static CLSID_IImgCtx => "{3050f3d6-98b5-11cf-bb82-00aa00bdce0b}"

    /**
     * @type {String}
     */
    static IIS_MD_LOCAL_MACHINE_PATH => "LM"

    /**
     * @type {String}
     */
    static IIS_MD_INSTANCE_ROOT => "Root"

    /**
     * @type {String}
     */
    static IIS_MD_ISAPI_FILTERS => "/Filters"

    /**
     * @type {String}
     */
    static IIS_MD_SVC_INFO_PATH => "Info"

    /**
     * @type {String}
     */
    static IIS_MD_ADSI_SCHEMA_PATH_A => "/Schema"

    /**
     * @type {String}
     */
    static IIS_MD_ADSI_SCHEMA_PATH_W => "/Schema"

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_ADSI_METAID_BEGIN => 130000

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_UT_SERVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_UT_FILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_UT_WAM => 100

    /**
     * @type {Integer (UInt32)}
     */
    static ASP_MD_UT_APP => 101

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_UT_END_RESERVED => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_ID_BEGIN_RESERVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_ID_END_RESERVED => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static ASP_MD_ID_BEGIN_RESERVED => 28672

    /**
     * @type {Integer (UInt32)}
     */
    static ASP_MD_ID_END_RESERVED => 29951

    /**
     * @type {Integer (UInt32)}
     */
    static WAM_MD_ID_BEGIN_RESERVED => 29952

    /**
     * @type {Integer (UInt32)}
     */
    static WAM_MD_ID_END_RESERVED => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static FP_MD_ID_BEGIN_RESERVED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FP_MD_ID_END_RESERVED => 36863

    /**
     * @type {Integer (UInt32)}
     */
    static SMTP_MD_ID_BEGIN_RESERVED => 36864

    /**
     * @type {Integer (UInt32)}
     */
    static SMTP_MD_ID_END_RESERVED => 40959

    /**
     * @type {Integer (UInt32)}
     */
    static POP3_MD_ID_BEGIN_RESERVED => 40960

    /**
     * @type {Integer (UInt32)}
     */
    static POP3_MD_ID_END_RESERVED => 45055

    /**
     * @type {Integer (UInt32)}
     */
    static NNTP_MD_ID_BEGIN_RESERVED => 45056

    /**
     * @type {Integer (UInt32)}
     */
    static NNTP_MD_ID_END_RESERVED => 49151

    /**
     * @type {Integer (UInt32)}
     */
    static IMAP_MD_ID_BEGIN_RESERVED => 49152

    /**
     * @type {Integer (UInt32)}
     */
    static IMAP_MD_ID_END_RESERVED => 53247

    /**
     * @type {Integer (UInt32)}
     */
    static MSCS_MD_ID_BEGIN_RESERVED => 53248

    /**
     * @type {Integer (UInt32)}
     */
    static MSCS_MD_ID_END_RESERVED => 57343

    /**
     * @type {Integer (UInt32)}
     */
    static APPCTR_MD_ID_BEGIN_RESERVED => 57344

    /**
     * @type {Integer (UInt32)}
     */
    static APPCTR_MD_ID_END_RESERVED => 61439

    /**
     * @type {Integer (UInt32)}
     */
    static USER_MD_ID_BASE_RESERVED => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_SERVER_BASE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_BANDWIDTH => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_KEY_TYPE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_BANDWIDTH_BLOCKED => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SCHEMA_METAID => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_COMMAND => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CONNECTION_TIMEOUT => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_CONNECTIONS => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_COMMENT => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_STATE => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_AUTOSTART => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_SIZE => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_LISTEN_BACKLOG => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_LISTEN_TIMEOUT => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DOWNLEVEL_ADMIN_INSTANCE => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LEVELS_TO_SCAN => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_BINDINGS => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_ENDPOINT_CONNECTIONS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_CONFIGURATION_INFO => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static MD_IISADMIN_EXTENSIONS => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DISABLE_SOCKET_POOLING => 1029

    /**
     * @type {Integer (UInt32)}
     */
    static MD_METADATA_ID_REGISTRATION => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_HTTP_BASE => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SECURE_BINDINGS => 2021

    /**
     * @type {Integer (UInt32)}
     */
    static MD_BINDINGS => 2022

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ENABLEDPROTOCOLS => 2023

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FILTER_LOAD_ORDER => 2040

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FILTER_IMAGE_PATH => 2041

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FILTER_STATE => 2042

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FILTER_ENABLED => 2043

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FILTER_FLAGS => 2044

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FILTER_DESCRIPTION => 2045

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FILTER_ENABLE_CACHE => 2046

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ADV_NOTIFY_PWD_EXP_IN_DAYS => 2063

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ADV_CACHE_TTL => 2064

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NET_LOGON_WKS => 2065

    /**
     * @type {Integer (UInt32)}
     */
    static MD_USE_HOST_NAME => 2066

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_CHANGE_FLAGS => 2068

    /**
     * @type {Integer (UInt32)}
     */
    static MD_PROCESS_NTCR_IF_LOGGED_ON => 2070

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FRONTPAGE_WEB => 2072

    /**
     * @type {Integer (UInt32)}
     */
    static MD_IN_PROCESS_ISAPI_APPS => 2073

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_CHANGE_URL => 2060

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_EXPIRED_URL => 2061

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_EXPIRED_UNSECUREURL => 2067

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ALLOW_PATH_INFO_FOR_SCRIPT_MAPPINGS => 2095

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_FRIENDLY_NAME => 2102

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_ROOT => 2103

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_ISOLATED => 2104

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_WAM_CLSID => 2105

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_PACKAGE_ID => 2106

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_PACKAGE_NAME => 2107

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_OOP_RECOVER_LIMIT => 2110

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_PERIODIC_RESTART_TIME => 2111

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_PERIODIC_RESTART_REQUESTS => 2112

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_PERIODIC_RESTART_SCHEDULE => 2113

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_SHUTDOWN_TIME_LIMIT => 2114

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ADMIN_INSTANCE => 2115

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOT_DELETABLE => 2116

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_TRACE_URL_LIST => 2118

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CENTRAL_W3C_LOGGING_ENABLED => 2119

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CUSTOM_ERROR_DESC => 2120

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CAL_VC_PER_CONNECT => 2130

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CAL_AUTH_RESERVE_TIMEOUT => 2131

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CAL_SSL_RESERVE_TIMEOUT => 2132

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CAL_W3_ERROR => 2133

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_CGI_ENABLED => 2140

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_APP_ENABLED => 2141

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_LIMITS_ENABLED => 2143

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_RESET_INTERVAL => 2144

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_LOGGING_INTERVAL => 2145

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_LOGGING_OPTIONS => 2146

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_CGI_LIMIT => 2148

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_LIMIT_LOGEVENT => 2149

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_LIMIT_PRIORITY => 2150

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_LIMIT_PROCSTOP => 2151

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_LIMIT_PAUSE => 2152

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SET_HOST_NAME => 2154

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_DISABLE_ALL_LOGGING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_ALL_PROC_LOGGING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_CGI_LOGGING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_APP_LOGGING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_PROC_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_USER_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_KERNEL_TIME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_PAGE_FAULTS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_TOTAL_PROCS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_ACTIVE_PROCS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_TERMINATED_PROCS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ENABLE_LOGGING => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ISAPI_RESTRICTION_LIST => 2163

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CGI_RESTRICTION_LIST => 2164

    /**
     * @type {Integer (UInt32)}
     */
    static MD_RESTRICTION_LIST_CUSTOM_DESC => 2165

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SECURITY_SETUP_REQUIRED => 2166

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_DEPENDENCIES => 2167

    /**
     * @type {Integer (UInt32)}
     */
    static MD_WEB_SVC_EXT_RESTRICTION_LIST => 2168

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MD_SERVER_SS_AUTH_MAPPING => 2200

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CERT_NO_REVOC_CHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CERT_CACHE_RETRIEVAL_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CERT_CHECK_REVOCATION_FRESHNESS_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CERT_NO_USAGE_CHECK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_COMPRESSION_DIRECTORY => 2210

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_CACHE_CONTROL_HEADER => 2211

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_EXPIRES_HEADER => 2212

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_DO_DYNAMIC_COMPRESSION => 2213

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_DO_STATIC_COMPRESSION => 2214

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_DO_ON_DEMAND_COMPRESSION => 2215

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_DO_DISK_SPACE_LIMITING => 2216

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_NO_COMPRESSION_FOR_HTTP_10 => 2217

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_NO_COMPRESSION_FOR_PROXIES => 2218

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_NO_COMPRESSION_FOR_RANGE => 2219

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_SEND_CACHE_HEADERS => 2220

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_MAX_DISK_SPACE_USAGE => 2221

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_IO_BUFFER_SIZE => 2222

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_COMPRESSION_BUFFER_SIZE => 2223

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_MAX_QUEUE_LENGTH => 2224

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_FILES_DELETED_PER_DISK_FREE => 2225

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_MIN_FILE_SIZE_FOR_COMP => 2226

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_COMPRESSION_DLL => 2237

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_FILE_EXTENSIONS => 2238

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_MIME_TYPE => 2239

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_PRIORITY => 2240

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_DYNAMIC_COMPRESSION_LEVEL => 2241

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_ON_DEMAND_COMP_LEVEL => 2242

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_CREATE_FLAGS => 2243

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_SCRIPT_FILE_EXTENSIONS => 2244

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_DO_NAMESPACE_DYNAMIC_COMPRESSION => 2255

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HC_DO_NAMESPACE_STATIC_COMPRESSION => 2256

    /**
     * @type {Integer (UInt32)}
     */
    static MD_WIN32_ERROR => 1099

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_VR_BASE => 3000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_VR_PATH => 3001

    /**
     * @type {Integer (UInt32)}
     */
    static MD_VR_USERNAME => 3002

    /**
     * @type {Integer (UInt32)}
     */
    static MD_VR_PASSWORD => 3003

    /**
     * @type {Integer (UInt32)}
     */
    static MD_VR_PASSTHROUGH => 3006

    /**
     * @type {Integer (UInt32)}
     */
    static MD_VR_NO_CACHE => 3007

    /**
     * @type {Integer (UInt32)}
     */
    static MD_VR_IGNORE_TRANSLATE => 3008

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_LOG_BASE => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_TYPE => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_DIRECTORY => 4001

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_UNUSED1 => 4002

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_PERIOD => 4003

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_TRUNCATE_SIZE => 4004

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_PLUGIN_MOD_ID => 4005

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_PLUGIN_UI_ID => 4006

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGSQL_DATA_SOURCES => 4007

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGSQL_TABLE_NAME => 4008

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGSQL_USER_NAME => 4009

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGSQL_PASSWORD => 4010

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_PLUGIN_ORDER => 4011

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_PLUGINS_AVAILABLE => 4012

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGEXT_FIELD_MASK => 4013

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGEXT_FIELD_MASK2 => 4014

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_LOCALTIME_ROLLOVER => 4015

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_LOG_LAST => 4015

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GLOBAL_BINARY_LOGGING_ENABLED => 4016

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_TYPE_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_TYPE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_PERIOD_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_PERIOD_MAXSIZE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_PERIOD_DAILY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_PERIOD_WEEKLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_PERIOD_MONTHLY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGFILE_PERIOD_HOURLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_DATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_TIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_CLIENT_IP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_USERNAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_SITE_NAME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_COMPUTER_NAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_SERVER_IP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_METHOD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_URI_STEM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_URI_QUERY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_HTTP_STATUS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_WIN32_STATUS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_BYTES_SENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_BYTES_RECV => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_TIME_TAKEN => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_SERVER_PORT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_USER_AGENT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_COOKIE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_REFERER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_PROTOCOL_VERSION => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_HOST => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXTLOG_HTTP_SUB_STATUS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_LOGCUSTOM_BASE => 4500

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_PROPERTY_NAME => 4501

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_PROPERTY_HEADER => 4502

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_PROPERTY_ID => 4503

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_PROPERTY_MASK => 4504

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_PROPERTY_DATATYPE => 4505

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_SERVICES_STRING => 4506

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_LOGGING_MASK => 4507

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_PROPERTY_NODE_ID => 4508

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_LOGCUSTOM_LAST => 4508

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_DATATYPE_INT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_DATATYPE_UINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_DATATYPE_LONG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_DATATYPE_ULONG => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_DATATYPE_FLOAT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_DATATYPE_DOUBLE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_DATATYPE_LPSTR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGCUSTOM_DATATYPE_LPWSTR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_SECURE_PORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_NONSECURE_PORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_READ_RAW_DATA => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_PREPROC_HEADERS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_AUTHENTICATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_URL_MAP => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_ACCESS_DENIED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_SEND_RESPONSE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_SEND_RAW_DATA => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_LOG => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_END_OF_REQUEST => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_END_OF_NET_SESSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_AUTH_COMPLETE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_ORDER_HIGH => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_ORDER_MEDIUM => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_ORDER_LOW => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFY_ORDER_DEFAULT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_FTP_BASE => 5000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXIT_MESSAGE => 5001

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GREETING_MESSAGE => 5002

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_CLIENTS_MESSAGE => 5003

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MSDOS_DIR_OUTPUT => 5004

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ALLOW_ANONYMOUS => 5005

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ANONYMOUS_ONLY => 5006

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_ANONYMOUS => 5007

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOG_NONANONYMOUS => 5008

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ALLOW_REPLACE_ON_RENAME => 5009

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SHOW_4_DIGIT_YEAR => 5010

    /**
     * @type {Integer (UInt32)}
     */
    static MD_BANNER_MESSAGE => 5011

    /**
     * @type {Integer (UInt32)}
     */
    static MD_USER_ISOLATION => 5012

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FTP_LOG_IN_UTF_8 => 5013

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AD_CONNECTIONS_USERNAME => 5014

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AD_CONNECTIONS_PASSWORD => 5015

    /**
     * @type {Integer (UInt32)}
     */
    static MD_PASSIVE_PORT_RANGE => 5016

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SUPPRESS_DEFAULT_BANNER => 5017

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FTP_PASV_RESPONSE_IP => 5018

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FTP_KEEP_PARTIAL_UPLOADS => 5019

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FTP_UTF8_FILE_NAMES => 5020

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FTPS_SECURE_CONTROL_CHANNEL => 5050

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FTPS_SECURE_DATA_CHANNEL => 5051

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FTPS_SECURE_ANONYMOUS => 5052

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FTPS_128_BITS => 5053

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FTPS_ALLOW_CCC => 5054

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_SSL_BASE => 5500

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SSL_PUBLIC_KEY => 5500

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SSL_PRIVATE_KEY => 5501

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SSL_KEY_PASSWORD => 5502

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SSL_KEY_REQUEST => 5503

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SSL_USE_DS_MAPPER => 5519

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SSL_ALWAYS_NEGO_CLIENT_CERT => 5521

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_FILE_PROP_BASE => 6000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTHORIZATION => 6000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_REALM => 6001

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HTTP_EXPIRES => 6002

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HTTP_PICS => 6003

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HTTP_CUSTOM => 6004

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIRECTORY_BROWSING => 6005

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DEFAULT_LOAD_FILE => 6006

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CUSTOM_ERROR => 6008

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FOOTER_DOCUMENT => 6009

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FOOTER_ENABLED => 6010

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HTTP_REDIRECT => 6011

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DEFAULT_LOGON_DOMAIN => 6012

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGON_METHOD => 6013

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SCRIPT_MAPS => 6014

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MIME_MAP => 6015

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_PERM => 6016

    /**
     * @type {Integer (UInt32)}
     */
    static MD_IP_SEC => 6019

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ANONYMOUS_USER_NAME => 6020

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ANONYMOUS_PWD => 6021

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ANONYMOUS_USE_SUBAUTH => 6022

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DONT_LOG => 6023

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ADMIN_ACL => 6027

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SSI_EXEC_DISABLED => 6028

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DO_REVERSE_DNS => 6029

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SSL_ACCESS_PERM => 6030

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTHORIZATION_PERSISTENCE => 6031

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NTAUTHENTICATION_PROVIDERS => 6032

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SCRIPT_TIMEOUT => 6033

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CACHE_EXTENSIONS => 6034

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CREATE_PROCESS_AS_USER => 6035

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CREATE_PROC_NEW_CONSOLE => 6036

    /**
     * @type {Integer (UInt32)}
     */
    static MD_POOL_IDC_TIMEOUT => 6037

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ALLOW_KEEPALIVES => 6038

    /**
     * @type {Integer (UInt32)}
     */
    static MD_IS_CONTENT_INDEXED => 6039

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CC_NO_CACHE => 6041

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CC_MAX_AGE => 6042

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CC_OTHER => 6043

    /**
     * @type {Integer (UInt32)}
     */
    static MD_REDIRECT_HEADERS => 6044

    /**
     * @type {Integer (UInt32)}
     */
    static MD_UPLOAD_READAHEAD_SIZE => 6045

    /**
     * @type {Integer (UInt32)}
     */
    static MD_PUT_READ_SIZE => 6046

    /**
     * @type {Integer (UInt32)}
     */
    static MD_USE_DIGEST_SSP => 6047

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ENABLE_URL_AUTHORIZATION => 6048

    /**
     * @type {Integer (UInt32)}
     */
    static MD_URL_AUTHORIZATION_STORE_NAME => 6049

    /**
     * @type {Integer (UInt32)}
     */
    static MD_URL_AUTHORIZATION_SCOPE_NAME => 6050

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_REQUEST_ENTITY_ALLOWED => 6051

    /**
     * @type {Integer (UInt32)}
     */
    static MD_PASSPORT_REQUIRE_AD_MAPPING => 6052

    /**
     * @type {Integer (UInt32)}
     */
    static MD_URL_AUTHORIZATION_IMPERSONATION_LEVEL => 6053

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HTTP_FORWARDER_CUSTOM => 6054

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CUSTOM_DEPLOYMENT_DATA => 6055

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HTTPERRORS_EXISTING_RESPONSE => 6056

    /**
     * @type {Integer (UInt32)}
     */
    static ASP_MD_SERVER_BASE => 7000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_BUFFERINGON => 7000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_LOGERRORREQUESTS => 7001

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SCRIPTERRORSSENTTOBROWSER => 7002

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SCRIPTERRORMESSAGE => 7003

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SCRIPTFILECACHESIZE => 7004

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SCRIPTENGINECACHEMAX => 7005

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SCRIPTTIMEOUT => 7006

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SESSIONTIMEOUT => 7007

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ENABLEPARENTPATHS => 7008

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_MEMFREEFACTOR => 7009

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_MINUSEDBLOCKS => 7010

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ALLOWSESSIONSTATE => 7011

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SCRIPTLANGUAGE => 7012

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_QUEUETIMEOUT => 7013

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ALLOWOUTOFPROCCOMPONENTS => 7014

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ALLOWOUTOFPROCCMPNTS => 7014

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_EXCEPTIONCATCHENABLE => 7015

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_CODEPAGE => 7016

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SCRIPTLANGUAGELIST => 7017

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ENABLESERVERDEBUG => 7018

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ENABLECLIENTDEBUG => 7019

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_TRACKTHREADINGMODEL => 7020

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ENABLEASPHTMLFALLBACK => 7021

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ENABLECHUNKEDENCODING => 7022

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ENABLETYPELIBCACHE => 7023

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ERRORSTONTLOG => 7024

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_PROCESSORTHREADMAX => 7025

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_REQEUSTQUEUEMAX => 7026

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ENABLEAPPLICATIONRESTART => 7027

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_QUEUECONNECTIONTESTTIME => 7028

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SESSIONMAX => 7029

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_THREADGATEENABLED => 7030

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_THREADGATETIMESLICE => 7031

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_THREADGATESLEEPDELAY => 7032

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_THREADGATESLEEPMAX => 7033

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_THREADGATELOADLOW => 7034

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_THREADGATELOADHIGH => 7035

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_DISKTEMPLATECACHEDIRECTORY => 7036

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_MAXDISKTEMPLATECACHEFILES => 7040

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_EXECUTEINMTA => 7041

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_LCID => 7042

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_KEEPSESSIONIDSECURE => 7043

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SERVICE_FLAGS => 7044

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SERVICE_FLAG_TRACKER => 7045

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SERVICE_FLAG_FUSION => 7046

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SERVICE_FLAG_PARTITIONS => 7047

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SERVICE_PARTITION_ID => 7048

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SERVICE_SXS_NAME => 7049

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SERVICE_ENABLE_TRACKER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SERVICE_ENABLE_SXS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_SERVICE_USE_PARTITION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_CALCLINENUMBER => 7050

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_RUN_ONEND_ANON => 7051

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_BUFFER_LIMIT => 7052

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_MAX_REQUEST_ENTITY_ALLOWED => 7053

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_MAXREQUESTENTITY => 7053

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ASP_ID_LAST => 7053

    /**
     * @type {Integer (UInt32)}
     */
    static WAM_MD_SERVER_BASE => 7500

    /**
     * @type {Integer (UInt32)}
     */
    static MD_WAM_USER_NAME => 7501

    /**
     * @type {Integer (UInt32)}
     */
    static MD_WAM_PWD => 7502

    /**
     * @type {Integer (UInt32)}
     */
    static WEBDAV_MD_SERVER_BASE => 8500

    /**
     * @type {Integer (UInt32)}
     */
    static MD_WEBDAV_MAX_ATTRIBUTES_PER_ELEMENT => 8501

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_APPPOOL_BASE => 9000

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_PERIODIC_RESTART_TIME => 9001

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_PERIODIC_RESTART_REQUEST_COUNT => 9002

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_MAX_PROCESS_COUNT => 9003

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_PINGING_ENABLED => 9004

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_IDLE_TIMEOUT => 9005

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_RAPID_FAIL_PROTECTION_ENABLED => 9006

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_SMP_AFFINITIZED => 9007

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_SMP_AFFINITIZED_PROCESSOR_MASK => 9008

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_ORPHAN_PROCESSES_FOR_DEBUGGING => 9009

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_STARTUP_TIMELIMIT => 9011

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_SHUTDOWN_TIMELIMIT => 9012

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_PING_INTERVAL => 9013

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_PING_RESPONSE_TIMELIMIT => 9014

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_DISALLOW_OVERLAPPING_ROTATION => 9015

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_UL_APPPOOL_QUEUE_LENGTH => 9017

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_DISALLOW_ROTATION_ON_CONFIG_CHANGE => 9018

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_PERIODIC_RESTART_SCHEDULE => 9020

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_IDENTITY_TYPE => 9021

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_ACTION => 9022

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_LIMIT => 9023

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_PERIODIC_RESTART_MEMORY => 9024

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_COMMAND => 9026

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_STATE => 9027

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_AUTO_START => 9028

    /**
     * @type {Integer (UInt32)}
     */
    static MD_RAPID_FAIL_PROTECTION_INTERVAL => 9029

    /**
     * @type {Integer (UInt32)}
     */
    static MD_RAPID_FAIL_PROTECTION_MAX_CRASHES => 9030

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_ORPHAN_ACTION_EXE => 9031

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_ORPHAN_ACTION_PARAMS => 9032

    /**
     * @type {Integer (UInt32)}
     */
    static MB_DONT_IMPERSONATE => 9033

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOAD_BALANCER_CAPABILITIES => 9034

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_AUTO_SHUTDOWN_EXE => 9035

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_AUTO_SHUTDOWN_PARAMS => 9036

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_LOG_EVENT_ON_RECYCLE => 9037

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_PERIODIC_RESTART_PRIVATE_MEMORY => 9038

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_MANAGED_RUNTIME_VERSION => 9039

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_32_BIT_APP_ON_WIN64 => 9040

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_MANAGED_PIPELINE_MODE => 9041

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_LOG_EVENT_ON_PROCESSMODEL => 9042

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_EMULATION_ON_WINARM64 => 9043

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_PROCESSMODEL_IDLE_TIMEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_RECYCLE_TIME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_RECYCLE_REQUESTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_RECYCLE_SCHEDULE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_RECYCLE_MEMORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_RECYCLE_ISAPI_UNHEALTHY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_RECYCLE_ON_DEMAND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_RECYCLE_CONFIG_CHANGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_POOL_RECYCLE_PRIVATE_MEMORY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_NO_ACTION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_KILL_W3WP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_TRACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CPU_THROTTLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_COMMAND_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_COMMAND_STOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_STATE_STARTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_STATE_STARTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_STATE_STOPPING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_STATE_STOPPED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_IDENTITY_TYPE_LOCALSYSTEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_IDENTITY_TYPE_LOCALSERVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_IDENTITY_TYPE_NETWORKSERVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_IDENTITY_TYPE_SPECIFICUSER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOAD_BALANCER_CAPABILITIES_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOAD_BALANCER_CAPABILITIES_SOPHISTICATED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_APP_BASE => 9100

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_APPPOOL_ID => 9101

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_ALLOW_TRANSIENT_REGISTRATION => 9102

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APP_AUTO_START => 9103

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_PERIODIC_RESTART_CONNECTIONS => 9104

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_APPPOOL_ID => 9201

    /**
     * @type {Integer (UInt32)}
     */
    static MD_APPPOOL_ALLOW_TRANSIENT_REGISTRATION => 9202

    /**
     * @type {Integer (UInt32)}
     */
    static IIS_MD_GLOBAL_BASE => 9200

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_GLOBAL_BANDWIDTH => 9201

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_GLOBAL_CONNECTIONS => 9202

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GLOBAL_STANDARD_APP_MODE_ENABLED => 9203

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HEADER_WAIT_TIMEOUT => 9204

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MIN_FILE_BYTES_PER_SEC => 9205

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GLOBAL_LOG_IN_UTF_8 => 9206

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DEMAND_START_THRESHOLD => 9207

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GLOBAL_SESSIONKEY => 9999

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ROOT_ENABLE_EDIT_WHILE_RUNNING => 9998

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GLOBAL_CHANGE_NUMBER => 9997

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ROOT_ENABLE_HISTORY => 9996

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ROOT_MAX_HISTORY_FILES => 9995

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GLOBAL_EDIT_WHILE_RUNNING_MAJOR_VERSION_NUMBER => 9994

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GLOBAL_EDIT_WHILE_RUNNING_MINOR_VERSION_NUMBER => 9993

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GLOBAL_XMLSCHEMATIMESTAMP => 9992

    /**
     * @type {Integer (UInt32)}
     */
    static MD_GLOBAL_BINSCHEMATIMESTAMP => 9991

    /**
     * @type {Integer (UInt32)}
     */
    static MD_COMMENTS => 9990

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOCATION => 9989

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_ERROR_FILES => 9988

    /**
     * @type {Integer (UInt32)}
     */
    static MD_STOP_LISTENING => 9987

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_ANONYMOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_BASIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_NT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_MD5 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_PASSPORT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_SINGLEREQUEST => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_SINGLEREQUESTIFPROXY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_SINGLEREQUESTALWAYSIFPROXY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_EXECUTE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_SOURCE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_SCRIPT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_NO_REMOTE_WRITE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_NO_REMOTE_READ => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_NO_REMOTE_EXECUTE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_NO_REMOTE_SCRIPT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_NO_PHYSICAL_DIR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_SSL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_NEGO_CERT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_REQUIRE_CERT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_MAP_CERT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_SSL128 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACCESS_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIRBROW_SHOW_DATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIRBROW_SHOW_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIRBROW_SHOW_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIRBROW_SHOW_EXTENSION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIRBROW_LONG_DATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIRBROW_ENABLED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MD_DIRBROW_LOADDEFAULT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGON_INTERACTIVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGON_BATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGON_NETWORK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_LOGON_NETWORK_CLEARTEXT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_PASSPORT_NO_MAPPING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_PASSPORT_TRY_MAPPING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_PASSPORT_NEED_MAPPING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NOTIFEXAUTH_NTLMSSL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FILTER_STATE_LOADED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_FILTER_STATE_UNLOADED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_STATE_STARTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_STATE_STARTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_STATE_STOPPING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_STATE_STOPPED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_STATE_PAUSING => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_STATE_PAUSED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_STATE_CONTINUING => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_COMMAND_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_COMMAND_STOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_COMMAND_PAUSE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_COMMAND_CONTINUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_SIZE_SMALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_SIZE_MEDIUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_SIZE_LARGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_CONFIG_SSL_40 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_CONFIG_SSL_128 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_CONFIG_ALLOW_ENCRYPT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SERVER_CONFIG_AUTO_PW_SYNC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SCRIPTMAPFLAG_SCRIPT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SCRIPTMAPFLAG_CHECK_PATH_INFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_SCRIPTMAPFLAG_ALLOWED_ON_READ_DIR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_CHANGE_UNSECURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_CHANGE_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_AUTH_ADVNOTIFY_DISABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NETLOGON_WKS_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NETLOGON_WKS_IP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_NETLOGON_WKS_DNS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_DESTINATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_DEPTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_IF => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_OVERWRITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_TRANSLATE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_REQUEST_BODY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_CONTENT_LENGTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_TIMEOUT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_LOCK_TOKEN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_XFF_HEADER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB400_INVALID_WEBSOCKET_REQUEST => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB401_LOGON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB401_LOGON_CONFIG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB401_LOGON_ACL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB401_FILTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB401_APPLICATION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB401_URLAUTH_POLICY => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_EXECUTE_ACCESS_DENIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_READ_ACCESS_DENIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_WRITE_ACCESS_DENIED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_SSL_REQUIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_SSL128_REQUIRED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_ADDR_REJECT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_CERT_REQUIRED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_SITE_ACCESS_DENIED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_TOO_MANY_USERS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_INVALID_CNFG => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_PWD_CHANGE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_MAPPER_DENY_ACCESS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_CERT_REVOKED => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_DIR_LIST_DENIED => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_CAL_EXCEEDED => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_CERT_BAD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_CERT_TIME_INVALID => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_APPPOOL_DENIED => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_INSUFFICIENT_PRIVILEGE_FOR_CGI => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_PASSPORT_LOGIN_FAILURE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_SOURCE_ACCESS_DENIED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_INFINITE_DEPTH_DENIED => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_LOCK_TOKEN_REQUIRED => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB403_VALIDATION_FAILURE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_SITE_NOT_FOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_DENIED_BY_POLICY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_DENIED_BY_MIMEMAP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_NO_HANDLER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_URL_SEQUENCE_DENIED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_VERB_DENIED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_FILE_EXTENSION_DENIED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_HIDDEN_SEGMENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_FILE_ATTRIBUTE_HIDDEN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_URL_DOUBLE_ESCAPED => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_URL_HAS_HIGH_BIT_CHARS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_URL_TOO_LONG => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_QUERY_STRING_TOO_LONG => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_STATICFILE_DAV => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_PRECONDITIONED_HANDLER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_QUERY_STRING_SEQUENCE_DENIED => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_DENIED_BY_FILTERING_RULE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB404_TOO_MANY_URL_SEGMENTS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB413_CONTENT_LENGTH_TOO_LARGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB423_LOCK_TOKEN_SUBMITTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB423_NO_CONFLICTING_LOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB500_UNC_ACCESS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB500_URLAUTH_NO_STORE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB500_URLAUTH_STORE_ERROR => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB500_BAD_METADATA => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB500_URLAUTH_NO_SCOPE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB500_HANDLERS_MODULE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB500_ASPNET_MODULES => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB500_ASPNET_HANDLERS => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB500_ASPNET_IMPERSONATION => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB502_TIMEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB502_PREMATURE_EXIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB502_ARR_CONNECTION_ERROR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB502_ARR_NO_SERVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB503_CPU_LIMIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB503_APP_CONCURRENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB503_ASPNET_QUEUE_FULL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB503_FASTCGI_QUEUE_FULL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ERROR_SUB503_CONNECTION_LIMIT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACR_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACR_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACR_RESTRICTED_WRITE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACR_UNSECURE_PROPS_READ => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACR_ENUM_KEYS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_ACR_WRITE_DAC => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MD_USER_ISOLATION_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_USER_ISOLATION_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_USER_ISOLATION_AD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_USER_ISOLATION_LAST => 2

    /**
     * @type {String}
     */
    static IIS_CLASS_COMPUTER => "IIsComputer"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_SERVICE => "IIsWebService"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_SERVER => "IIsWebServer"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_INFO => "IIsWebInfo"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_DIR => "IIsWebDirectory"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_VDIR => "IIsWebVirtualDir"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_FILE => "IIsWebFile"

    /**
     * @type {String}
     */
    static IIS_CLASS_FTP_SERVICE => "IIsFtpService"

    /**
     * @type {String}
     */
    static IIS_CLASS_FTP_SERVER => "IIsFtpServer"

    /**
     * @type {String}
     */
    static IIS_CLASS_FTP_INFO => "IIsFtpInfo"

    /**
     * @type {String}
     */
    static IIS_CLASS_FTP_VDIR => "IIsFtpVirtualDir"

    /**
     * @type {String}
     */
    static IIS_CLASS_FILTERS => "IIsFilters"

    /**
     * @type {String}
     */
    static IIS_CLASS_FILTER => "IIsFilter"

    /**
     * @type {String}
     */
    static IIS_CLASS_LOG_MODULES => "IIsLogModules"

    /**
     * @type {String}
     */
    static IIS_CLASS_LOG_MODULE => "IIsLogModule"

    /**
     * @type {String}
     */
    static IIS_CLASS_MIMEMAP => "IIsMimeMap"

    /**
     * @type {String}
     */
    static IIS_CLASS_CERTMAPPER => "IIsCertMapper"

    /**
     * @type {String}
     */
    static IIS_CLASS_COMPRESS_SCHEMES => "IIsCompressionSchemes"

    /**
     * @type {String}
     */
    static IIS_CLASS_COMPRESS_SCHEME => "IIsCompressionScheme"

    /**
     * @type {String}
     */
    static IIS_CLASS_COMPUTER_W => "IIsComputer"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_SERVICE_W => "IIsWebService"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_SERVER_W => "IIsWebServer"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_INFO_W => "IIsWebInfo"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_DIR_W => "IIsWebDirectory"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_VDIR_W => "IIsWebVirtualDir"

    /**
     * @type {String}
     */
    static IIS_CLASS_WEB_FILE_W => "IIsWebFile"

    /**
     * @type {String}
     */
    static IIS_CLASS_FTP_SERVICE_W => "IIsFtpService"

    /**
     * @type {String}
     */
    static IIS_CLASS_FTP_SERVER_W => "IIsFtpServer"

    /**
     * @type {String}
     */
    static IIS_CLASS_FTP_INFO_W => "IIsFtpInfo"

    /**
     * @type {String}
     */
    static IIS_CLASS_FTP_VDIR_W => "IIsFtpVirtualDir"

    /**
     * @type {String}
     */
    static IIS_CLASS_FILTERS_W => "IIsFilters"

    /**
     * @type {String}
     */
    static IIS_CLASS_FILTER_W => "IIsFilter"

    /**
     * @type {String}
     */
    static IIS_CLASS_LOG_MODULES_W => "IIsLogModules"

    /**
     * @type {String}
     */
    static IIS_CLASS_LOG_MODULE_W => "IIsLogModule"

    /**
     * @type {String}
     */
    static IIS_CLASS_MIMEMAP_W => "IIsMimeMap"

    /**
     * @type {String}
     */
    static IIS_CLASS_CERTMAPPER_W => "IIsCertMapper"

    /**
     * @type {String}
     */
    static IIS_CLASS_COMPRESS_SCHEMES_W => "IIsCompressionSchemes"

    /**
     * @type {String}
     */
    static IIS_CLASS_COMPRESS_SCHEME_W => "IIsCompressionScheme"

    /**
     * @type {String}
     */
    static CLSID_IisServiceControl => "{e8fb8621-588f-11d2-9d61-00c04f79c5fe}"

    /**
     * @type {String}
     */
    static LIBID_IISRSTALib => "{e8fb8614-588f-11d2-9d61-00c04f79c5fe}"

    /**
     * @type {String}
     */
    static IIS_WEBSOCKET => "websockets"

    /**
     * @type {String}
     */
    static IIS_WEBSOCKET_SERVER_VARIABLE => "IIS_WEBSOCK"

    /**
     * @type {String}
     */
    static LIBID_WAMREGLib => "{29822aa8-f302-11d0-9953-00c04fd919c1}"

    /**
     * @type {String}
     */
    static CLSID_WamAdmin => "{61738644-f196-11d0-9953-00c04fd919c1}"

    /**
     * @type {Integer (UInt32)}
     */
    static APPSTATUS_STOPPED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APPSTATUS_RUNNING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APPSTATUS_NOTDEFINED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_MAX_NAME_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_PERMISSION_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_PERMISSION_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_NO_ATTRIBUTES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_INHERIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_PARTIAL_PATH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_SECURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_REFERENCE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_VOLATILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_ISINHERITED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_INSERT_PATH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_LOCAL_MACHINE_ONLY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_NON_SECURE_ONLY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_DONT_EXPAND => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MD_BACKUP_OVERWRITE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_BACKUP_SAVE_FIRST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_BACKUP_FORCE_BACKUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_BACKUP_NEXT_VERSION => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MD_BACKUP_HIGHEST_VERSION => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static MD_BACKUP_MAX_VERSION => 9999

    /**
     * @type {Integer (UInt32)}
     */
    static MD_BACKUP_MAX_LEN => 100

    /**
     * @type {String}
     */
    static MD_DEFAULT_BACKUP_LOCATION => "MDBackUp"

    /**
     * @type {Integer (UInt32)}
     */
    static MD_HISTORY_LATEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXPORT_INHERITED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_EXPORT_NODE_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_IMPORT_INHERITED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_IMPORT_NODE_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_IMPORT_MERGE => 4

    /**
     * @type {String}
     */
    static MD_INSERT_PATH_STRINGA => "<%INSERT_PATH%>"

    /**
     * @type {String}
     */
    static MD_INSERT_PATH_STRING => "<%INSERT_PATH%>"

    /**
     * @type {Integer (UInt32)}
     */
    static METADATA_MASTER_ROOT_HANDLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CHANGE_TYPE_DELETE_OBJECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CHANGE_TYPE_ADD_OBJECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CHANGE_TYPE_SET_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CHANGE_TYPE_DELETE_DATA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CHANGE_TYPE_RENAME_OBJECT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MD_CHANGE_TYPE_RESTORE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MD_MAX_CHANGE_ENTRIES => 100

    /**
     * @type {Integer (Int32)}
     */
    static MD_ERROR_NOT_INITIALIZED => -2146646016

    /**
     * @type {Integer (Int32)}
     */
    static MD_ERROR_DATA_NOT_FOUND => -2146646015

    /**
     * @type {Integer (Int32)}
     */
    static MD_ERROR_INVALID_VERSION => -2146646014

    /**
     * @type {Integer (Int32)}
     */
    static MD_WARNING_PATH_NOT_FOUND => 837635

    /**
     * @type {Integer (Int32)}
     */
    static MD_WARNING_DUP_NAME => 837636

    /**
     * @type {Integer (Int32)}
     */
    static MD_WARNING_INVALID_DATA => 837637

    /**
     * @type {Integer (Int32)}
     */
    static MD_ERROR_SECURE_CHANNEL_FAILURE => -2146646010

    /**
     * @type {Integer (Int32)}
     */
    static MD_WARNING_PATH_NOT_INSERTED => 837639

    /**
     * @type {Integer (Int32)}
     */
    static MD_ERROR_CANNOT_REMOVE_SECURE_ATTRIBUTE => -2146646008

    /**
     * @type {Integer (Int32)}
     */
    static MD_WARNING_SAVE_FAILED => 837641

    /**
     * @type {Integer (Int32)}
     */
    static MD_ERROR_IISAO_INVALID_SCHEMA => -2146646000

    /**
     * @type {Integer (Int32)}
     */
    static MD_ERROR_READ_METABASE_FILE => -2146645991

    /**
     * @type {Integer (Int32)}
     */
    static MD_ERROR_NO_SESSION_KEY => -2146645987

    /**
     * @type {String}
     */
    static LIBID_ASPTypeLibrary => "{d97a6da0-a85c-11cf-83ae-00a0c90c2bd8}"

    /**
     * @type {String}
     */
    static CLSID_Request => "{920c25d0-25d9-11d0-a55f-00a0c90c2091}"

    /**
     * @type {String}
     */
    static CLSID_Response => "{46e19ba0-25dd-11d0-a55f-00a0c90c2091}"

    /**
     * @type {String}
     */
    static CLSID_Session => "{509f8f20-25de-11d0-a55f-00a0c90c2091}"

    /**
     * @type {String}
     */
    static CLSID_Server => "{a506d160-25e0-11d0-a55f-00a0c90c2091}"

    /**
     * @type {String}
     */
    static CLSID_ScriptingContext => "{d97a6da0-a868-11cf-83ae-11b0c90c2bd8}"

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_VERSION_MAJOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_VERSION_MINOR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_LOG_BUFFER_LEN => 80

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_MAX_EXT_DLL_NAME_LEN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_STATUS_SUCCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_STATUS_SUCCESS_AND_KEEP_CONN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_STATUS_PENDING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_STATUS_ERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_SEND_URL_REDIRECT_RESP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_SEND_URL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_SEND_RESPONSE_HEADER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_DONE_WITH_SESSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_END_RESERVED => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_MAP_URL_TO_PATH => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_SSPI_INFO => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_APPEND_LOG_PARAMETER => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_IO_COMPLETION => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_TRANSMIT_FILE => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_REFRESH_ISAPI_ACL => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_IS_KEEP_CONN => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_ASYNC_READ_CLIENT => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_IMPERSONATION_TOKEN => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_MAP_URL_TO_PATH_EX => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_ABORTIVE_CLOSE => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_CERT_INFO_EX => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_SEND_RESPONSE_HEADER_EX => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_CLOSE_CONNECTION => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_IS_CONNECTED => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_MAP_UNICODE_URL_TO_PATH => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_MAP_UNICODE_URL_TO_PATH_EX => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_EXEC_UNICODE_URL => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_EXEC_URL => 1026

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_EXEC_URL_STATUS => 1027

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_SEND_CUSTOM_ERROR => 1028

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_IS_IN_PROCESS => 1030

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_REPORT_UNHEALTHY => 1032

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_NORMALIZE_URL => 1033

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_VECTOR_SEND => 1037

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_ANONYMOUS_TOKEN => 1038

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_CACHE_INVALIDATION_CALLBACK => 1040

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_UNICODE_ANONYMOUS_TOKEN => 1041

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_TRACE_INFO => 1042

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_SET_FLUSH_FLAG => 1043

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_TRACE_INFO_EX => 1044

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_RAISE_TRACE_EVENT => 1045

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_CONFIG_OBJECT => 1046

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_WORKER_PROCESS_SETTINGS => 1047

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_PROTOCOL_MANAGER_CUSTOM_INTERFACE_CALLBACK => 1048

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_CANCEL_IO => 1049

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_REQ_GET_CHANNEL_BINDING_TOKEN => 1050

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_TERM_ADVISORY_UNLOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_TERM_MUST_UNLOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_IO_SYNC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_IO_ASYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_IO_DISCONNECT_AFTER_SEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_IO_SEND_HEADERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_IO_NODELAY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_IO_FINAL_SEND => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_IO_CACHE_RESPONSE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_IO_TRY_SKIP_CUSTOM_ERRORS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_EXECUTE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_SSL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_DONT_CACHE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_NEGO_CERT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_REQUIRE_CERT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_MAP_CERT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_SSL128 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_SCRIPT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_URL_FLAGS_MASK => 1023

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_EXEC_URL_NO_HEADERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_EXEC_URL_IGNORE_CURRENT_INTERCEPTOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_EXEC_URL_IGNORE_VALIDATION_AND_RANGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_EXEC_URL_DISABLE_CUSTOM_ERROR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_EXEC_URL_SSI_CMD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_EXEC_URL_HTTP_CACHE_ELIGIBLE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_VECTOR_ELEMENT_TYPE_MEMORY_BUFFER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_VECTOR_ELEMENT_TYPE_FILE_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_APP_FLAG_IN_PROCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_APP_FLAG_ISOLATED_OOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HSE_APP_FLAG_POOLED_OOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SF_MAX_USERNAME => 257

    /**
     * @type {Integer (UInt32)}
     */
    static SF_MAX_PASSWORD => 257

    /**
     * @type {Integer (UInt32)}
     */
    static SF_MAX_AUTH_TYPE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static SF_MAX_FILTER_DESC_LEN => 257

    /**
     * @type {Integer (UInt32)}
     */
    static SF_DENIED_LOGON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SF_DENIED_RESOURCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SF_DENIED_FILTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SF_DENIED_APPLICATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SF_DENIED_BY_CONFIG => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_SECURE_PORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_NONSECURE_PORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_READ_RAW_DATA => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_PREPROC_HEADERS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_AUTHENTICATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_URL_MAP => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_ACCESS_DENIED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_SEND_RESPONSE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_SEND_RAW_DATA => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_LOG => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_END_OF_REQUEST => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_END_OF_NET_SESSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_AUTH_COMPLETE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_ORDER_HIGH => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_ORDER_MEDIUM => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_ORDER_LOW => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SF_NOTIFY_ORDER_DEFAULT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_BASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_OPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_SETREQUESTHEADER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_GETRESPONSEHEADER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_GETALLRESPONSEHEADERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_SEND => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_OPTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_STATUS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_STATUSTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_RESPONSETEXT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_RESPONSEBODY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_RESPONSESTREAM => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_ABORT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_SETPROXY => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_SETCREDENTIALS => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_WAITFORRESPONSE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_SETTIMEOUTS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_SETCLIENTCERTIFICATE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_HTTPREQUEST_SETAUTOLOGONPOLICY => 18

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_TRACE_EVENT_FLAG_STATIC_DESCRIPTIVE_FIELDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_TRACE_LEVEL_START => 6

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_TRACE_LEVEL_END => 7

    /**
     * @type {String}
     */
    static GUID_IIS_ALL_TRACE_PROVIDERS => "{00000000-0000-0000-0000-000000000000}"

    /**
     * @type {String}
     */
    static GUID_IIS_WWW_SERVER_TRACE_PROVIDER => "{3a2a4e84-4c21-4981-ae10-3fda0d9b0f83}"

    /**
     * @type {String}
     */
    static GUID_IIS_WWW_SERVER_V2_TRACE_PROVIDER => "{de4649c9-15e8-4fea-9d85-1cdda520c334}"

    /**
     * @type {String}
     */
    static GUID_IIS_ASPNET_TRACE_PROVIDER => "{aff081fe-0247-4275-9c4e-021f3dc1da35}"

    /**
     * @type {String}
     */
    static GUID_IIS_ASP_TRACE_TRACE_PROVIDER => "{06b94d9a-b15e-456e-a4ef-37c984a2cb4b}"

    /**
     * @type {String}
     */
    static GUID_IIS_WWW_GLOBAL_TRACE_PROVIDER => "{d55d3bc9-cba9-44df-827e-132d3a4596c2}"

    /**
     * @type {String}
     */
    static GUID_IIS_ISAPI_TRACE_PROVIDER => "{a1c2040e-8840-4c31-ba11-9871031a19ea}"

    /**
     * @type {String}
     */
    static WEB_CORE_DLL_NAME => "hwebcore.dll"

    /**
     * @type {String}
     */
    static WEB_CORE_ACTIVATE_DLL_ENTRY => "WebCoreActivate"

    /**
     * @type {String}
     */
    static WEB_CORE_SHUTDOWN_DLL_ENTRY => "WebCoreShutdown"

    /**
     * @type {String}
     */
    static WEB_CORE_SET_METADATA_DLL_ENTRY => "WebCoreSetMetadata"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<HSE_VERSION_INFO>} pVer 
     * @returns {BOOL} 
     */
    static GetExtensionVersion(pVer) {
        result := DllCall("RpcProxy.dll\GetExtensionVersion", "ptr", pVer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<EXTENSION_CONTROL_BLOCK>} pECB 
     * @returns {Integer} 
     */
    static HttpExtensionProc(pECB) {
        result := DllCall("RpcProxy.dll\HttpExtensionProc", "ptr", pECB, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HTTP_FILTER_CONTEXT>} pfc 
     * @param {Integer} NotificationType 
     * @param {Pointer<Void>} pvNotification 
     * @returns {Integer} 
     */
    static HttpFilterProc(pfc, NotificationType, pvNotification) {
        result := DllCall("RpcProxy.dll\HttpFilterProc", "ptr", pfc, "uint", NotificationType, "ptr", pvNotification, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<HTTP_FILTER_VERSION>} pVer 
     * @returns {BOOL} 
     */
    static GetFilterVersion(pVer) {
        result := DllCall("RpcProxy.dll\GetFilterVersion", "ptr", pVer, "int")
        return result
    }

;@endregion Methods
}
