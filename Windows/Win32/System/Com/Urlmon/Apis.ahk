#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class Urlmon {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MKSYS_URLMONIKER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static URL_MK_LEGACY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static URL_MK_UNIFORM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static URL_MK_NO_CANONICALIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FIEF_FLAG_FORCE_JITUI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIEF_FLAG_PEEK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FIEF_FLAG_SKIP_INSTALLED_VERSION_CHECK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FIEF_FLAG_RESERVED_0 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FMFD_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FMFD_URLASFILENAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FMFD_ENABLEMIMESNIFFING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FMFD_IGNOREMIMETEXTPLAIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FMFD_SERVERMIME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FMFD_RESPECTTEXTPLAIN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FMFD_RETURNUPDATEDIMGMIMES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FMFD_RESERVED_1 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FMFD_RESERVED_2 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static UAS_EXACTLEGACY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static URLMON_OPTION_USERAGENT => 268435457

    /**
     * @type {Integer (UInt32)}
     */
    static URLMON_OPTION_USERAGENT_REFRESH => 268435458

    /**
     * @type {Integer (UInt32)}
     */
    static URLMON_OPTION_URL_ENCODING => 268435460

    /**
     * @type {Integer (UInt32)}
     */
    static URLMON_OPTION_USE_BINDSTRINGCREDS => 268435464

    /**
     * @type {Integer (UInt32)}
     */
    static URLMON_OPTION_USE_BROWSERAPPSDOCUMENTS => 268435472

    /**
     * @type {Integer (UInt32)}
     */
    static CF_NULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static MK_S_ASYNCHRONOUS => 262632

    /**
     * @type {Integer (Int32)}
     */
    static S_ASYNCHRONOUS => 262632

    /**
     * @type {Integer (Int32)}
     */
    static E_PENDING => -2147483638

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_INVALID_URL => -2146697214

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_NO_SESSION => -2146697213

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CANNOT_CONNECT => -2146697212

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_RESOURCE_NOT_FOUND => -2146697211

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_OBJECT_NOT_FOUND => -2146697210

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_DATA_NOT_AVAILABLE => -2146697209

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_DOWNLOAD_FAILURE => -2146697208

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_AUTHENTICATION_REQUIRED => -2146697207

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_NO_VALID_MEDIA => -2146697206

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CONNECTION_TIMEOUT => -2146697205

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_INVALID_REQUEST => -2146697204

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_UNKNOWN_PROTOCOL => -2146697203

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_SECURITY_PROBLEM => -2146697202

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CANNOT_LOAD_DATA => -2146697201

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CANNOT_INSTANTIATE_OBJECT => -2146697200

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_INVALID_CERTIFICATE => -2146697191

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_REDIRECT_FAILED => -2146697196

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_REDIRECT_TO_DIR => -2146697195

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CANNOT_LOCK_REQUEST => -2146697194

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_USE_EXTEND_BINDING => -2146697193

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_TERMINATED_BIND => -2146697192

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_RESERVED_1 => -2146697190

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_BLOCKED_REDIRECT_XSECURITYID => -2146697189

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_DOMINJECTIONVALIDATION => -2146697188

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_VTAB_SWITCH_FORCE_ENGINE => -2146697187

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_HSTS_CERTIFICATE_ERROR => -2146697186

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_RESERVED_2 => -2146697185

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_RESERVED_3 => -2146697184

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_RESERVED_4 => -2146697183

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_RESERVED_5 => -2146697182

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_ERROR_FIRST => -2146697214

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CODE_DOWNLOAD_DECLINED => -2146696960

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_RESULT_DISPATCHED => -2146696704

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CANNOT_REPLACE_SFP_FILE => -2146696448

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CODE_INSTALL_SUPPRESSED => -2146696192

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CODE_INSTALL_BLOCKED_BY_HASH_POLICY => -2146695936

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_DOWNLOAD_BLOCKED_BY_INPRIVATE => -2146695935

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CODE_INSTALL_BLOCKED_IMMERSIVE => -2146695934

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_FORBIDFRAMING => -2146695933

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CODE_INSTALL_BLOCKED_ARM => -2146695932

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_BLOCKED_PLUGGABLE_PROTOCOL => -2146695931

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_BLOCKED_ENHANCEDPROTECTEDMODE => -2146695930

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_CODE_INSTALL_BLOCKED_BITNESS => -2146695929

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_DOWNLOAD_BLOCKED_BY_CSP => -2146695928

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_ERROR_LAST => -2146695928

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_DISPLAY_NO_FRAGMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_PUNYCODE_IDN_HOST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_DISPLAY_IDN_HOST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_DISPLAY_NO_PUNYCODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_ENCODING_USER_INFO_AND_PATH_IS_PERCENT_ENCODED_UTF8 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_ENCODING_USER_INFO_AND_PATH_IS_CP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_ENCODING_HOST_IS_IDN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_ENCODING_HOST_IS_PERCENT_ENCODED_UTF8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_ENCODING_HOST_IS_PERCENT_ENCODED_CP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_ENCODING_QUERY_AND_FRAGMENT_IS_PERCENT_ENCODED_UTF8 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static Uri_ENCODING_QUERY_AND_FRAGMENT_IS_CP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static UriBuilder_USE_ORIGINAL_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WININETINFO_OPTION_LOCK_HANDLE => 65534

    /**
     * @type {Integer (UInt32)}
     */
    static URLOSTRM_USECACHEDCOPY_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static URLOSTRM_USECACHEDCOPY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static URLOSTRM_GETNEWESTVERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SET_FEATURE_ON_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SET_FEATURE_ON_PROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SET_FEATURE_IN_REGISTRY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SET_FEATURE_ON_THREAD_LOCALMACHINE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SET_FEATURE_ON_THREAD_INTRANET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SET_FEATURE_ON_THREAD_TRUSTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SET_FEATURE_ON_THREAD_INTERNET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SET_FEATURE_ON_THREAD_RESTRICTED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GET_FEATURE_FROM_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GET_FEATURE_FROM_PROCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GET_FEATURE_FROM_REGISTRY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GET_FEATURE_FROM_THREAD_LOCALMACHINE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GET_FEATURE_FROM_THREAD_INTRANET => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GET_FEATURE_FROM_THREAD_TRUSTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GET_FEATURE_FROM_THREAD_INTERNET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static GET_FEATURE_FROM_THREAD_RESTRICTED => 128

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_USE_DEFAULT_PROTOCOLHANDLER => -2146697199

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_USE_DEFAULT_SETTING => -2146697198

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_DEFAULT_ACTION => -2146697199

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_QUERYOPTION_UNKNOWN => -2146697197

    /**
     * @type {Integer (Int32)}
     */
    static INET_E_REDIRECTING => -2146697196

    /**
     * @type {Integer (UInt32)}
     */
    static PROTOCOLFLAG_NO_PICS_CHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_NOSAVEDFILECHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_ISFILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_ACCEPT_WILDCARD_SCHEME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_ENFORCERESTRICTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_RESERVED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_REQUIRESAVEDFILECHECK => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_DONT_UNESCAPE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_DONT_USE_CACHE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_FORCE_INTRANET_FLAGS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MUTZ_IGNORE_ZONE_MAPPINGS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_SIZE_SECURITY_ID => 512

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_MIN => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_DOWNLOAD_MIN => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_DOWNLOAD_SIGNED_ACTIVEX => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_DOWNLOAD_UNSIGNED_ACTIVEX => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_DOWNLOAD_CURR_MAX => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_DOWNLOAD_MAX => 4607

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_MIN => 4608

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_RUN => 4608

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_ACTIVEX_CHECK_LIST => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_OVERRIDE_OBJECT_SAFETY => 4609

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_OVERRIDE_DATA_SAFETY => 4610

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_OVERRIDE_SCRIPT_SAFETY => 4611

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_OVERRIDE_SAFETY => 5121

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_CONFIRM_NOOBJECTSAFETY => 4612

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_TREATASUNTRUSTED => 4613

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_NO_WEBOC_SCRIPT => 4614

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_OVERRIDE_REPURPOSEDETECTION => 4615

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_OVERRIDE_OPTIN => 4616

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_SCRIPTLET_RUN => 4617

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_DYNSRC_VIDEO_AND_ANIMATION => 4618

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_OVERRIDE_DOMAINLIST => 4619

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_ALLOW_TDC => 4620

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_CURR_MAX => 4620

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ACTIVEX_MAX => 5119

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_MIN => 5120

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_RUN => 5120

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_JAVA_USE => 5122

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_SAFE_ACTIVEX => 5125

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_CROSS_DOMAIN_DATA => 5126

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_PASTE => 5127

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_XDOMAIN_SUBFRAME_RESIZE => 5128

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_XSSFILTER => 5129

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_NAVIGATE => 5130

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_PLUGGABLE_PROTOCOL_XHR => 5131

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_VBSCRIPT_IE => 5132

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_JSCRIPT_IE => 5133

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_CURR_MAX => 5133

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SCRIPT_MAX => 5631

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_MIN => 5632

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_SUBMIT_FORMS => 5633

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_SUBMIT_FORMS_FROM => 5634

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_SUBMIT_FORMS_TO => 5635

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_FONT_DOWNLOAD => 5636

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_JAVA_RUN => 5637

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_USERDATA_SAVE => 5638

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_SUBFRAME_NAVIGATE => 5639

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_META_REFRESH => 5640

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_MIXED_CONTENT => 5641

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_INCLUDE_FILE_PATH => 5642

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_ALLOW_INJECTED_DYNAMIC_HTML => 5643

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_REQUIRE_UTF8_DOCUMENT_CODEPAGE => 5644

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_ALLOW_CROSS_DOMAIN_CANVAS => 5645

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_ALLOW_WINDOW_CLOSE => 5646

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_ALLOW_CROSS_DOMAIN_WEBWORKER => 5647

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_ALLOW_CROSS_DOMAIN_TEXTTRACK => 5648

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_ALLOW_INDEXEDDB => 5649

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_HTML_MAX => 6143

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_MIN => 6144

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_INSTALL_DTITEMS => 6144

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_MOVE_OR_COPY => 6146

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_FILE_DOWNLOAD => 6147

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_VERB => 6148

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_WEBVIEW_VERB => 6149

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_SHELLEXECUTE => 6150

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_EXECUTE_HIGHRISK => 6150

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_EXECUTE_MODRISK => 6151

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_EXECUTE_LOWRISK => 6152

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_POPUPMGR => 6153

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_RTF_OBJECTS_LOAD => 6154

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_ENHANCED_DRAGDROP_SECURITY => 6155

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_EXTENSIONSECURITY => 6156

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_SECURE_DRAGSOURCE => 6157

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_REMOTEQUERY => 6158

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_PREVIEW => 6159

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_SHARE => 6160

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_ALLOW_CROSS_SITE_SHARE => 6161

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_TOCTOU_RISK => 6162

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_CURR_MAX => 6162

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_SHELL_MAX => 6655

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_NETWORK_MIN => 6656

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_CREDENTIALS_USE => 6656

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_CREDENTIALS_SILENT_LOGON_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_CREDENTIALS_MUST_PROMPT_USER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_CREDENTIALS_CONDITIONAL_PROMPT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_CREDENTIALS_ANONYMOUS_ONLY => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_AUTHENTICATE_CLIENT => 6657

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_AUTHENTICATE_CLEARTEXT_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_AUTHENTICATE_CHALLENGE_RESPONSE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_AUTHENTICATE_MUTUAL_ONLY => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_COOKIES => 6658

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_COOKIES_SESSION => 6659

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_CLIENT_CERT_PROMPT => 6660

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_COOKIES_THIRD_PARTY => 6661

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_COOKIES_SESSION_THIRD_PARTY => 6662

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_COOKIES_ENABLED => 6672

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_NETWORK_CURR_MAX => 6672

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_NETWORK_MAX => 7167

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_JAVA_MIN => 7168

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_JAVA_PERMISSIONS => 7168

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_JAVA_PROHIBIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_JAVA_HIGH => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_JAVA_MEDIUM => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_JAVA_LOW => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_JAVA_CUSTOM => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_JAVA_CURR_MAX => 7168

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_JAVA_MAX => 7423

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_MIN => 7424

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_NO_ADDING_CHANNELS => 7424

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_NO_EDITING_CHANNELS => 7425

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_NO_REMOVING_CHANNELS => 7426

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_NO_ADDING_SUBSCRIPTIONS => 7427

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_NO_EDITING_SUBSCRIPTIONS => 7428

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_NO_REMOVING_SUBSCRIPTIONS => 7429

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_NO_CHANNEL_LOGGING => 7430

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_CURR_MAX => 7430

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INFODELIVERY_MAX => 7679

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_CHANNEL_SOFTDIST_MIN => 7680

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_CHANNEL_SOFTDIST_PERMISSIONS => 7685

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_CHANNEL_SOFTDIST_PROHIBIT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_CHANNEL_SOFTDIST_PRECACHE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_CHANNEL_SOFTDIST_AUTOINSTALL => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_CHANNEL_SOFTDIST_MAX => 7935

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_DOTNET_USERCONTROLS => 8197

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_BEHAVIOR_MIN => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_BEHAVIOR_RUN => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_BEHAVIOR_CHECK_LIST => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_FEATURE_MIN => 8448

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_FEATURE_MIME_SNIFFING => 8448

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_FEATURE_ZONE_ELEVATION => 8449

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_FEATURE_WINDOW_RESTRICTIONS => 8450

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_FEATURE_SCRIPT_STATUS_BAR => 8451

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_FEATURE_FORCE_ADDR_AND_STATUS => 8452

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_FEATURE_BLOCK_INPUT_PROMPTS => 8453

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_FEATURE_DATA_BINDING => 8454

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_FEATURE_CROSSDOMAIN_FOCUS_CHANGE => 8455

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_AUTOMATIC_DOWNLOAD_UI_MIN => 8704

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_AUTOMATIC_DOWNLOAD_UI => 8704

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_AUTOMATIC_ACTIVEX_UI => 8705

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_RESTRICTEDPROTOCOLS => 8960

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_APEVALUATION => 8961

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_XHR_EVALUATION => 8962

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_WINDOWS_BROWSER_APPLICATIONS => 9216

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_XPS_DOCUMENTS => 9217

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_LOOSE_XAML => 9218

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_LOWRIGHTS => 9472

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_WINFX_SETUP => 9728

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_INPRIVATE_BLOCKING => 9984

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_AUDIO_VIDEO => 9985

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_ACTIVEX_FILTERING => 9986

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_STRUCTURED_STORAGE_SNIFFING => 9987

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_AUDIO_VIDEO_PLUGINS => 9988

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_ZONE_ELEVATION_VIA_OPT_OUT => 9989

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_ZONE_ELEVATION_OPT_OUT_ADDITION => 9990

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_CROSSDOMAIN_DROP_WITHIN_WINDOW => 9992

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_CROSSDOMAIN_DROP_ACROSS_WINDOWS => 9993

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_CROSSDOMAIN_APPCACHE_MANIFEST => 9994

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_RENDER_LEGACY_DXTFILTERS => 9995

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_ANTIMALWARE_SCANNING_OF_ACTIVEX => 9996

    /**
     * @type {Integer (UInt32)}
     */
    static URLACTION_ALLOW_CSS_EXPRESSIONS => 9997

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_ALLOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_DISALLOW => 3

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_NOTIFY_ON_ALLOW => 16

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_NOTIFY_ON_DISALLOW => 32

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_LOG_ON_ALLOW => 64

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_LOG_ON_DISALLOW => 128

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_MASK_PERMISSIONS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static URLPOLICY_DONTCHECKDLGBOX => 256

    /**
     * @type {Integer (UInt32)}
     */
    static URLZONE_ESC_FLAG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_IE_STATE_GREEN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_IE_STATE_RED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTDIST_FLAG_USAGE_EMAIL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTDIST_FLAG_USAGE_PRECACHE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTDIST_FLAG_USAGE_AUTOINSTALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTDIST_FLAG_DELETE_SUBSCRIPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTDIST_ADSTATE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTDIST_ADSTATE_AVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTDIST_ADSTATE_DOWNLOADED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SOFTDIST_ADSTATE_INSTALLED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIRMSAFETYACTION_LOADOBJECT => 1
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<IMoniker>} pMkCtx 
     * @param {Pointer<PWSTR>} szURL 
     * @param {Pointer<IMoniker>} ppmk 
     * @returns {Integer} 
     */
    static CreateURLMoniker(pMkCtx, szURL, ppmk) {
        szURL := szURL is String? StrPtr(szURL) : szURL

        result := DllCall("urlmon.dll\CreateURLMoniker", "ptr", pMkCtx, "ptr", szURL, "ptr", ppmk, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pMkCtx 
     * @param {Pointer<PWSTR>} szURL 
     * @param {Pointer<IMoniker>} ppmk 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static CreateURLMonikerEx(pMkCtx, szURL, ppmk, dwFlags) {
        szURL := szURL is String? StrPtr(szURL) : szURL

        result := DllCall("urlmon.dll\CreateURLMonikerEx", "ptr", pMkCtx, "ptr", szURL, "ptr", ppmk, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szURL 
     * @param {Pointer<Guid>} pClsID 
     * @returns {Integer} 
     */
    static GetClassURL(szURL, pClsID) {
        szURL := szURL is String? StrPtr(szURL) : szURL

        result := DllCall("urlmon.dll\GetClassURL", "ptr", szURL, "ptr", pClsID, "int")
        return result
    }

    /**
     * Creates an asynchronous bind context for use with asynchronous monikers.
     * @remarks
     * This function automatically registers the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces with the bind context. The client can specify flags from BSCO_OPTION to indicate which callback notifications the client is capable of receiving. If the client does not wish to receive certain notification, it can choose to implement those callback methods as empty function stubs (returning E_NOTIMPL), and they should not be called.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775115(v=vs.85)">RegisterBindStatusCallback</a> function can also be used to register callback interfaces in the bind context.
     * @param {Integer} reserved This parameter is reserved and must be 0.
     * @param {Pointer<IBindStatusCallback>} pBSCb A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> interface used for receiving data availability and progress notification.
     * @param {Pointer<IEnumFORMATETC>} pEFetc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interface that can be used to enumerate formats for format negotiation during binding. This parameter can be <b>NULL</b>, in which case the caller is not interested in format negotiation during binding, and the default format of the object will be bound to.
     * @param {Pointer<IBindCtx>} ppBC Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>* pointer variable that receives the interface pointer to the new bind context.
     * @returns {Integer} This function can return the following values.
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
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method ran out of memory and did not complete.
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
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/urlmon/nf-urlmon-createasyncbindctx
     * @since windows5.0
     */
    static CreateAsyncBindCtx(reserved, pBSCb, pEFetc, ppBC) {
        result := DllCall("urlmon.dll\CreateAsyncBindCtx", "uint", reserved, "ptr", pBSCb, "ptr", pEFetc, "ptr", ppBC, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pMkCtx 
     * @param {Pointer<IUri>} pUri 
     * @param {Pointer<IMoniker>} ppmk 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static CreateURLMonikerEx2(pMkCtx, pUri, ppmk, dwFlags) {
        result := DllCall("urlmon.dll\CreateURLMonikerEx2", "ptr", pMkCtx, "ptr", pUri, "ptr", ppmk, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pbc 
     * @param {Integer} dwOptions 
     * @param {Pointer<IBindStatusCallback>} pBSCb 
     * @param {Pointer<IEnumFORMATETC>} pEnum 
     * @param {Pointer<IBindCtx>} ppBC 
     * @param {Integer} reserved 
     * @returns {Integer} 
     */
    static CreateAsyncBindCtxEx(pbc, dwOptions, pBSCb, pEnum, ppBC, reserved) {
        result := DllCall("urlmon.dll\CreateAsyncBindCtxEx", "ptr", pbc, "uint", dwOptions, "ptr", pBSCb, "ptr", pEnum, "ptr", ppBC, "uint", reserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pbc 
     * @param {Pointer<PWSTR>} szDisplayName 
     * @param {Pointer<UInt32>} pchEaten 
     * @param {Pointer<IMoniker>} ppmk 
     * @returns {Integer} 
     */
    static MkParseDisplayNameEx(pbc, szDisplayName, pchEaten, ppmk) {
        szDisplayName := szDisplayName is String? StrPtr(szDisplayName) : szDisplayName

        result := DllCall("urlmon.dll\MkParseDisplayNameEx", "ptr", pbc, "ptr", szDisplayName, "ptr", pchEaten, "ptr", ppmk, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<IBindStatusCallback>} pBSCb 
     * @param {Pointer<IBindStatusCallback>} ppBSCBPrev 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static RegisterBindStatusCallback(pBC, pBSCb, ppBSCBPrev, dwReserved) {
        result := DllCall("urlmon.dll\RegisterBindStatusCallback", "ptr", pBC, "ptr", pBSCb, "ptr", ppBSCBPrev, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<IBindStatusCallback>} pBSCb 
     * @returns {Integer} 
     */
    static RevokeBindStatusCallback(pBC, pBSCb) {
        result := DllCall("urlmon.dll\RevokeBindStatusCallback", "ptr", pBC, "ptr", pBSCb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<PWSTR>} szFilename 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbSize 
     * @param {Pointer<PWSTR>} szMime 
     * @param {Integer} dwReserved 
     * @param {Pointer<Guid>} pclsid 
     * @returns {Integer} 
     */
    static GetClassFileOrMime(pBC, szFilename, pBuffer, cbSize, szMime, dwReserved, pclsid) {
        szFilename := szFilename is String? StrPtr(szFilename) : szFilename
        szMime := szMime is String? StrPtr(szMime) : szMime

        result := DllCall("urlmon.dll\GetClassFileOrMime", "ptr", pBC, "ptr", szFilename, "ptr", pBuffer, "uint", cbSize, "ptr", szMime, "uint", dwReserved, "ptr", pclsid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<PWSTR>} szURL 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static IsValidURL(pBC, szURL, dwReserved) {
        szURL := szURL is String? StrPtr(szURL) : szURL

        result := DllCall("urlmon.dll\IsValidURL", "ptr", pBC, "ptr", szURL, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rCLASSID 
     * @param {Pointer<PWSTR>} szCODE 
     * @param {Integer} dwFileVersionMS 
     * @param {Integer} dwFileVersionLS 
     * @param {Pointer<PWSTR>} szTYPE 
     * @param {Pointer<IBindCtx>} pBindCtx 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {Integer} 
     */
    static CoGetClassObjectFromURL(rCLASSID, szCODE, dwFileVersionMS, dwFileVersionLS, szTYPE, pBindCtx, dwClsContext, riid, ppv) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        szCODE := szCODE is String? StrPtr(szCODE) : szCODE
        szTYPE := szTYPE is String? StrPtr(szTYPE) : szTYPE

        result := DllCall("urlmon.dll\CoGetClassObjectFromURL", "ptr", rCLASSID, "ptr", szCODE, "uint", dwFileVersionMS, "uint", dwFileVersionLS, "ptr", szTYPE, "ptr", pBindCtx, "uint", dwClsContext, "ptr", pvReserved, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwScope 
     * @returns {Integer} 
     */
    static IEInstallScope(pdwScope) {
        result := DllCall("urlmon.dll\IEInstallScope", "ptr", pdwScope, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hWnd 
     * @param {Pointer<uCLSSPEC>} pClassSpec 
     * @param {Pointer<QUERYCONTEXT>} pQuery 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static FaultInIEFeature(hWnd, pClassSpec, pQuery, dwFlags) {
        result := DllCall("urlmon.dll\FaultInIEFeature", "ptr", hWnd, "ptr", pClassSpec, "ptr", pQuery, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<uCLSSPEC>} pClassspec 
     * @param {Pointer<PSTR>} ppszComponentID 
     * @returns {Integer} 
     */
    static GetComponentIDFromCLSSPEC(pClassspec, ppszComponentID) {
        ppszComponentID := ppszComponentID is String? StrPtr(ppszComponentID) : ppszComponentID

        result := DllCall("urlmon.dll\GetComponentIDFromCLSSPEC", "ptr", pClassspec, "ptr", ppszComponentID, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pmk 
     * @returns {Integer} 
     */
    static IsAsyncMoniker(pmk) {
        result := DllCall("urlmon.dll\IsAsyncMoniker", "ptr", pmk, "int")
        return result
    }

    /**
     * 
     * @param {Integer} ctypes 
     * @param {Pointer<PSTR>} rgszTypes 
     * @param {Pointer<UInt16>} rgcfTypes 
     * @returns {Integer} 
     */
    static RegisterMediaTypes(ctypes, rgszTypes, rgcfTypes) {
        rgszTypes := rgszTypes is String? StrPtr(rgszTypes) : rgszTypes

        result := DllCall("urlmon.dll\RegisterMediaTypes", "uint", ctypes, "ptr", rgszTypes, "ptr", rgcfTypes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} rgszTypes 
     * @param {Pointer<UInt16>} rgcfTypes 
     * @returns {Integer} 
     */
    static FindMediaType(rgszTypes, rgcfTypes) {
        rgszTypes := rgszTypes is String? StrPtr(rgszTypes) : rgszTypes

        result := DllCall("urlmon.dll\FindMediaType", "ptr", rgszTypes, "ptr", rgcfTypes, "int")
        return result
    }

    /**
     * Creates an object that implements IEnumFORMATETC over a static array of FORMATETC structures.
     * @remarks
     * The <b>CreateFormatEnumerator</b> function creates an enumerator object that implements <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> over a static array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures. The <i>cfmtetc</i> parameter specifies the number of these structures. With the pointer, you can call the standard enumeration methods to enumerate the structures.
     * @param {Integer} cfmtetc Number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures in the static array specified by the <i>rgfmtetc</i> parameter. The <i>cfmtetc</i> parameter cannot be zero.
     * @param {Pointer<FORMATETC>} rgfmtetc Pointer to a static array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures.
     * @param {Pointer<IEnumFORMATETC>} ppenumfmtetc Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> pointer variable that receives the interface pointer to the enumerator object.
     * @returns {Integer} This function returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/urlmon/nf-urlmon-createformatenumerator
     * @since windows5.0
     */
    static CreateFormatEnumerator(cfmtetc, rgfmtetc, ppenumfmtetc) {
        result := DllCall("urlmon.dll\CreateFormatEnumerator", "uint", cfmtetc, "ptr", rgfmtetc, "ptr", ppenumfmtetc, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<IEnumFORMATETC>} pEFetc 
     * @param {Integer} reserved 
     * @returns {Integer} 
     */
    static RegisterFormatEnumerator(pBC, pEFetc, reserved) {
        result := DllCall("urlmon.dll\RegisterFormatEnumerator", "ptr", pBC, "ptr", pEFetc, "uint", reserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<IEnumFORMATETC>} pEFetc 
     * @returns {Integer} 
     */
    static RevokeFormatEnumerator(pBC, pEFetc) {
        result := DllCall("urlmon.dll\RevokeFormatEnumerator", "ptr", pBC, "ptr", pEFetc, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Integer} ctypes 
     * @param {Pointer<PSTR>} rgszTypes 
     * @param {Pointer<Guid>} rgclsID 
     * @param {Integer} reserved 
     * @returns {Integer} 
     */
    static RegisterMediaTypeClass(pBC, ctypes, rgszTypes, rgclsID, reserved) {
        rgszTypes := rgszTypes is String? StrPtr(rgszTypes) : rgszTypes

        result := DllCall("urlmon.dll\RegisterMediaTypeClass", "ptr", pBC, "uint", ctypes, "ptr", rgszTypes, "ptr", rgclsID, "uint", reserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<PSTR>} szType 
     * @param {Pointer<Guid>} pclsID 
     * @param {Integer} reserved 
     * @returns {Integer} 
     */
    static FindMediaTypeClass(pBC, szType, pclsID, reserved) {
        szType := szType is String? StrPtr(szType) : szType

        result := DllCall("urlmon.dll\FindMediaTypeClass", "ptr", pBC, "ptr", szType, "ptr", pclsID, "uint", reserved, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} dwBufferLength 
     * @returns {Integer} 
     */
    static UrlMkSetSessionOption(dwOption, pBuffer, dwBufferLength) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("urlmon.dll\UrlMkSetSessionOption", "uint", dwOption, "ptr", pBuffer, "uint", dwBufferLength, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} dwBufferLength 
     * @param {Pointer<UInt32>} pdwBufferLengthOut 
     * @returns {Integer} 
     */
    static UrlMkGetSessionOption(dwOption, pBuffer, dwBufferLength, pdwBufferLengthOut) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("urlmon.dll\UrlMkGetSessionOption", "uint", dwOption, "ptr", pBuffer, "uint", dwBufferLength, "ptr", pdwBufferLengthOut, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pBC 
     * @param {Pointer<PWSTR>} pwzUrl 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} cbSize 
     * @param {Pointer<PWSTR>} pwzMimeProposed 
     * @param {Integer} dwMimeFlags 
     * @param {Pointer<PWSTR>} ppwzMimeOut 
     * @returns {Integer} 
     */
    static FindMimeFromData(pBC, pwzUrl, pBuffer, cbSize, pwzMimeProposed, dwMimeFlags, ppwzMimeOut) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pwzUrl := pwzUrl is String? StrPtr(pwzUrl) : pwzUrl
        pwzMimeProposed := pwzMimeProposed is String? StrPtr(pwzMimeProposed) : pwzMimeProposed
        ppwzMimeOut := ppwzMimeOut is String? StrPtr(ppwzMimeOut) : ppwzMimeOut

        result := DllCall("urlmon.dll\FindMimeFromData", "ptr", pBC, "ptr", pwzUrl, "ptr", pBuffer, "uint", cbSize, "ptr", pwzMimeProposed, "uint", dwMimeFlags, "ptr", ppwzMimeOut, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwOption 
     * @param {Pointer<PSTR>} pszUAOut 
     * @param {Pointer<UInt32>} cbSize 
     * @returns {Integer} 
     */
    static ObtainUserAgentString(dwOption, pszUAOut, cbSize) {
        pszUAOut := pszUAOut is String? StrPtr(pszUAOut) : pszUAOut

        result := DllCall("urlmon.dll\ObtainUserAgentString", "uint", dwOption, "ptr", pszUAOut, "ptr", cbSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbSecurityId1 
     * @param {Integer} dwLen1 
     * @param {Pointer<Byte>} pbSecurityId2 
     * @param {Integer} dwLen2 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static CompareSecurityIds(pbSecurityId1, dwLen1, pbSecurityId2, dwLen2, dwReserved) {
        result := DllCall("urlmon.dll\CompareSecurityIds", "ptr", pbSecurityId1, "uint", dwLen1, "ptr", pbSecurityId2, "uint", dwLen2, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @param {Pointer<UInt32>} pdwCompatFlags 
     * @param {Pointer<UInt32>} pdwMiscStatusFlags 
     * @returns {Integer} 
     */
    static CompatFlagsFromClsid(pclsid, pdwCompatFlags, pdwMiscStatusFlags) {
        result := DllCall("urlmon.dll\CompatFlagsFromClsid", "ptr", pclsid, "ptr", pdwCompatFlags, "ptr", pdwMiscStatusFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} hObject 
     * @param {Integer} ieObjectType 
     * @param {Integer} dwAccessMask 
     * @returns {Integer} 
     */
    static SetAccessForIEAppContainer(hObject, ieObjectType, dwAccessMask) {
        result := DllCall("urlmon.dll\SetAccessForIEAppContainer", "ptr", hObject, "int", ieObjectType, "uint", dwAccessMask, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szTarget 
     * @param {Pointer<PWSTR>} szLocation 
     * @param {Pointer<PWSTR>} szTargetFrameName 
     * @param {Pointer<IUnknown>} pUnk 
     * @param {Pointer<IBindCtx>} pbc 
     * @param {Pointer<IBindStatusCallback>} param5 
     * @param {Integer} grfHLNF 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static HlinkSimpleNavigateToString(szTarget, szLocation, szTargetFrameName, pUnk, pbc, param5, grfHLNF, dwReserved) {
        szTarget := szTarget is String? StrPtr(szTarget) : szTarget
        szLocation := szLocation is String? StrPtr(szLocation) : szLocation
        szTargetFrameName := szTargetFrameName is String? StrPtr(szTargetFrameName) : szTargetFrameName

        result := DllCall("urlmon.dll\HlinkSimpleNavigateToString", "ptr", szTarget, "ptr", szLocation, "ptr", szTargetFrameName, "ptr", pUnk, "ptr", pbc, "ptr", param5, "uint", grfHLNF, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pmkTarget 
     * @param {Pointer<PWSTR>} szLocation 
     * @param {Pointer<PWSTR>} szTargetFrameName 
     * @param {Pointer<IUnknown>} pUnk 
     * @param {Pointer<IBindCtx>} pbc 
     * @param {Pointer<IBindStatusCallback>} param5 
     * @param {Integer} grfHLNF 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static HlinkSimpleNavigateToMoniker(pmkTarget, szLocation, szTargetFrameName, pUnk, pbc, param5, grfHLNF, dwReserved) {
        szLocation := szLocation is String? StrPtr(szLocation) : szLocation
        szTargetFrameName := szTargetFrameName is String? StrPtr(szTargetFrameName) : szTargetFrameName

        result := DllCall("urlmon.dll\HlinkSimpleNavigateToMoniker", "ptr", pmkTarget, "ptr", szLocation, "ptr", szTargetFrameName, "ptr", pUnk, "ptr", pbc, "ptr", param5, "uint", grfHLNF, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PSTR>} param1 
     * @param {Integer} param2 
     * @param {Pointer<IBindStatusCallback>} param3 
     * @returns {Integer} 
     */
    static URLOpenStreamA(param0, param1, param2, param3) {
        param1 := param1 is String? StrPtr(param1) : param1

        result := DllCall("urlmon.dll\URLOpenStreamA", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PWSTR>} param1 
     * @param {Integer} param2 
     * @param {Pointer<IBindStatusCallback>} param3 
     * @returns {Integer} 
     */
    static URLOpenStreamW(param0, param1, param2, param3) {
        param1 := param1 is String? StrPtr(param1) : param1

        result := DllCall("urlmon.dll\URLOpenStreamW", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PSTR>} param1 
     * @param {Integer} param2 
     * @param {Pointer<IBindStatusCallback>} param3 
     * @returns {Integer} 
     */
    static URLOpenPullStreamA(param0, param1, param2, param3) {
        param1 := param1 is String? StrPtr(param1) : param1

        result := DllCall("urlmon.dll\URLOpenPullStreamA", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PWSTR>} param1 
     * @param {Integer} param2 
     * @param {Pointer<IBindStatusCallback>} param3 
     * @returns {Integer} 
     */
    static URLOpenPullStreamW(param0, param1, param2, param3) {
        param1 := param1 is String? StrPtr(param1) : param1

        result := DllCall("urlmon.dll\URLOpenPullStreamW", "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PSTR>} param1 
     * @param {Pointer<PSTR>} param2 
     * @param {Integer} param3 
     * @param {Pointer<IBindStatusCallback>} param4 
     * @returns {Integer} 
     */
    static URLDownloadToFileA(param0, param1, param2, param3, param4) {
        param1 := param1 is String? StrPtr(param1) : param1
        param2 := param2 is String? StrPtr(param2) : param2

        result := DllCall("urlmon.dll\URLDownloadToFileA", "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PWSTR>} param1 
     * @param {Pointer<PWSTR>} param2 
     * @param {Integer} param3 
     * @param {Pointer<IBindStatusCallback>} param4 
     * @returns {Integer} 
     */
    static URLDownloadToFileW(param0, param1, param2, param3, param4) {
        param1 := param1 is String? StrPtr(param1) : param1
        param2 := param2 is String? StrPtr(param2) : param2

        result := DllCall("urlmon.dll\URLDownloadToFileW", "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PSTR>} param1 
     * @param {Pointer<PSTR>} param2 
     * @param {Integer} cchFileName 
     * @param {Integer} param4 
     * @param {Pointer<IBindStatusCallback>} param5 
     * @returns {Integer} 
     */
    static URLDownloadToCacheFileA(param0, param1, param2, cchFileName, param4, param5) {
        param1 := param1 is String? StrPtr(param1) : param1
        param2 := param2 is String? StrPtr(param2) : param2

        result := DllCall("urlmon.dll\URLDownloadToCacheFileA", "ptr", param0, "ptr", param1, "ptr", param2, "uint", cchFileName, "uint", param4, "ptr", param5, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PWSTR>} param1 
     * @param {Pointer<PWSTR>} param2 
     * @param {Integer} cchFileName 
     * @param {Integer} param4 
     * @param {Pointer<IBindStatusCallback>} param5 
     * @returns {Integer} 
     */
    static URLDownloadToCacheFileW(param0, param1, param2, cchFileName, param4, param5) {
        param1 := param1 is String? StrPtr(param1) : param1
        param2 := param2 is String? StrPtr(param2) : param2

        result := DllCall("urlmon.dll\URLDownloadToCacheFileW", "ptr", param0, "ptr", param1, "ptr", param2, "uint", cchFileName, "uint", param4, "ptr", param5, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PSTR>} param1 
     * @param {Pointer<IStream>} param2 
     * @param {Integer} param3 
     * @param {Pointer<IBindStatusCallback>} param4 
     * @returns {Integer} 
     */
    static URLOpenBlockingStreamA(param0, param1, param2, param3, param4) {
        param1 := param1 is String? StrPtr(param1) : param1

        result := DllCall("urlmon.dll\URLOpenBlockingStreamA", "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} param0 
     * @param {Pointer<PWSTR>} param1 
     * @param {Pointer<IStream>} param2 
     * @param {Integer} param3 
     * @param {Pointer<IBindStatusCallback>} param4 
     * @returns {Integer} 
     */
    static URLOpenBlockingStreamW(param0, param1, param2, param3, param4) {
        param1 := param1 is String? StrPtr(param1) : param1

        result := DllCall("urlmon.dll\URLOpenBlockingStreamW", "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {Integer} 
     */
    static HlinkGoBack(pUnk) {
        result := DllCall("urlmon.dll\HlinkGoBack", "ptr", pUnk, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {Integer} 
     */
    static HlinkGoForward(pUnk) {
        result := DllCall("urlmon.dll\HlinkGoForward", "ptr", pUnk, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @param {Pointer<PWSTR>} szTarget 
     * @returns {Integer} 
     */
    static HlinkNavigateString(pUnk, szTarget) {
        szTarget := szTarget is String? StrPtr(szTarget) : szTarget

        result := DllCall("urlmon.dll\HlinkNavigateString", "ptr", pUnk, "ptr", szTarget, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @param {Pointer<IMoniker>} pmkTarget 
     * @returns {Integer} 
     */
    static HlinkNavigateMoniker(pUnk, pmkTarget) {
        result := DllCall("urlmon.dll\HlinkNavigateMoniker", "ptr", pUnk, "ptr", pmkTarget, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwzUrl 
     * @param {Integer} ParseAction 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} pszResult 
     * @param {Integer} cchResult 
     * @param {Pointer<UInt32>} pcchResult 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static CoInternetParseUrl(pwzUrl, ParseAction, dwFlags, pszResult, cchResult, pcchResult, dwReserved) {
        pwzUrl := pwzUrl is String? StrPtr(pwzUrl) : pwzUrl
        pszResult := pszResult is String? StrPtr(pszResult) : pszResult

        result := DllCall("urlmon.dll\CoInternetParseUrl", "ptr", pwzUrl, "int", ParseAction, "uint", dwFlags, "ptr", pszResult, "uint", cchResult, "ptr", pcchResult, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} pIUri 
     * @param {Integer} ParseAction 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} pwzResult 
     * @param {Integer} cchResult 
     * @param {Pointer<UInt32>} pcchResult 
     * @returns {Integer} 
     */
    static CoInternetParseIUri(pIUri, ParseAction, dwFlags, pwzResult, cchResult, pcchResult) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pwzResult := pwzResult is String? StrPtr(pwzResult) : pwzResult

        result := DllCall("urlmon.dll\CoInternetParseIUri", "ptr", pIUri, "int", ParseAction, "uint", dwFlags, "ptr", pwzResult, "uint", cchResult, "ptr", pcchResult, "ptr", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwzBaseUrl 
     * @param {Pointer<PWSTR>} pwzRelativeUrl 
     * @param {Integer} dwCombineFlags 
     * @param {Pointer<PWSTR>} pszResult 
     * @param {Integer} cchResult 
     * @param {Pointer<UInt32>} pcchResult 
     * @returns {Integer} 
     */
    static CoInternetCombineUrl(pwzBaseUrl, pwzRelativeUrl, dwCombineFlags, pszResult, cchResult, pcchResult) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pwzBaseUrl := pwzBaseUrl is String? StrPtr(pwzBaseUrl) : pwzBaseUrl
        pwzRelativeUrl := pwzRelativeUrl is String? StrPtr(pwzRelativeUrl) : pwzRelativeUrl
        pszResult := pszResult is String? StrPtr(pszResult) : pszResult

        result := DllCall("urlmon.dll\CoInternetCombineUrl", "ptr", pwzBaseUrl, "ptr", pwzRelativeUrl, "uint", dwCombineFlags, "ptr", pszResult, "uint", cchResult, "ptr", pcchResult, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} pBaseUri 
     * @param {Pointer<PWSTR>} pwzRelativeUrl 
     * @param {Integer} dwCombineFlags 
     * @param {Pointer<IUri>} ppCombinedUri 
     * @param {Pointer} dwReserved 
     * @returns {Integer} 
     */
    static CoInternetCombineUrlEx(pBaseUri, pwzRelativeUrl, dwCombineFlags, ppCombinedUri, dwReserved) {
        pwzRelativeUrl := pwzRelativeUrl is String? StrPtr(pwzRelativeUrl) : pwzRelativeUrl

        result := DllCall("urlmon.dll\CoInternetCombineUrlEx", "ptr", pBaseUri, "ptr", pwzRelativeUrl, "uint", dwCombineFlags, "ptr", ppCombinedUri, "ptr", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} pBaseUri 
     * @param {Pointer<IUri>} pRelativeUri 
     * @param {Integer} dwCombineFlags 
     * @param {Pointer<IUri>} ppCombinedUri 
     * @param {Pointer} dwReserved 
     * @returns {Integer} 
     */
    static CoInternetCombineIUri(pBaseUri, pRelativeUri, dwCombineFlags, ppCombinedUri, dwReserved) {
        result := DllCall("urlmon.dll\CoInternetCombineIUri", "ptr", pBaseUri, "ptr", pRelativeUri, "uint", dwCombineFlags, "ptr", ppCombinedUri, "ptr", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwzUrl1 
     * @param {Pointer<PWSTR>} pwzUrl2 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static CoInternetCompareUrl(pwzUrl1, pwzUrl2, dwFlags) {
        pwzUrl1 := pwzUrl1 is String? StrPtr(pwzUrl1) : pwzUrl1
        pwzUrl2 := pwzUrl2 is String? StrPtr(pwzUrl2) : pwzUrl2

        result := DllCall("urlmon.dll\CoInternetCompareUrl", "ptr", pwzUrl1, "ptr", pwzUrl2, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwzUrl 
     * @param {Pointer<UInt32>} pdwFlags 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static CoInternetGetProtocolFlags(pwzUrl, pdwFlags, dwReserved) {
        pwzUrl := pwzUrl is String? StrPtr(pwzUrl) : pwzUrl

        result := DllCall("urlmon.dll\CoInternetGetProtocolFlags", "ptr", pwzUrl, "ptr", pdwFlags, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwzUrl 
     * @param {Integer} QueryOptions 
     * @param {Integer} dwQueryFlags 
     * @param {Pointer<Void>} pvBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<UInt32>} pcbBuffer 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static CoInternetQueryInfo(pwzUrl, QueryOptions, dwQueryFlags, pvBuffer, cbBuffer, pcbBuffer, dwReserved) {
        pwzUrl := pwzUrl is String? StrPtr(pwzUrl) : pwzUrl

        result := DllCall("urlmon.dll\CoInternetQueryInfo", "ptr", pwzUrl, "int", QueryOptions, "uint", dwQueryFlags, "ptr", pvBuffer, "uint", cbBuffer, "ptr", pcbBuffer, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwSessionMode 
     * @param {Pointer<IInternetSession>} ppIInternetSession 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static CoInternetGetSession(dwSessionMode, ppIInternetSession, dwReserved) {
        result := DllCall("urlmon.dll\CoInternetGetSession", "uint", dwSessionMode, "ptr", ppIInternetSession, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwszUrl 
     * @param {Pointer<PWSTR>} ppwszSecUrl 
     * @param {Integer} psuAction 
     * @returns {Integer} 
     */
    static CoInternetGetSecurityUrl(pwszUrl, ppwszSecUrl, psuAction) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pwszUrl := pwszUrl is String? StrPtr(pwszUrl) : pwszUrl
        ppwszSecUrl := ppwszSecUrl is String? StrPtr(ppwszSecUrl) : ppwszSecUrl

        result := DllCall("urlmon.dll\CoInternetGetSecurityUrl", "ptr", pwszUrl, "ptr", ppwszSecUrl, "int", psuAction, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} pUri 
     * @param {Pointer<IUri>} ppSecUri 
     * @param {Integer} psuAction 
     * @returns {Integer} 
     */
    static CoInternetGetSecurityUrlEx(pUri, ppSecUri, psuAction) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("urlmon.dll\CoInternetGetSecurityUrlEx", "ptr", pUri, "ptr", ppSecUri, "int", psuAction, "ptr", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Integer} FeatureEntry 
     * @param {Integer} dwFlags 
     * @param {Integer} fEnable 
     * @returns {Integer} 
     */
    static CoInternetSetFeatureEnabled(FeatureEntry, dwFlags, fEnable) {
        result := DllCall("urlmon.dll\CoInternetSetFeatureEnabled", "int", FeatureEntry, "uint", dwFlags, "int", fEnable, "int")
        return result
    }

    /**
     * 
     * @param {Integer} FeatureEntry 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static CoInternetIsFeatureEnabled(FeatureEntry, dwFlags) {
        result := DllCall("urlmon.dll\CoInternetIsFeatureEnabled", "int", FeatureEntry, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} FeatureEntry 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} szURL 
     * @param {Pointer<IInternetSecurityManager>} pSecMgr 
     * @returns {Integer} 
     */
    static CoInternetIsFeatureEnabledForUrl(FeatureEntry, dwFlags, szURL, pSecMgr) {
        szURL := szURL is String? StrPtr(szURL) : szURL

        result := DllCall("urlmon.dll\CoInternetIsFeatureEnabledForUrl", "int", FeatureEntry, "uint", dwFlags, "ptr", szURL, "ptr", pSecMgr, "int")
        return result
    }

    /**
     * 
     * @param {Integer} FeatureEntry 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUri>} pIUri 
     * @param {Pointer<IInternetSecurityManagerEx2>} pSecMgr 
     * @returns {Integer} 
     */
    static CoInternetIsFeatureEnabledForIUri(FeatureEntry, dwFlags, pIUri, pSecMgr) {
        result := DllCall("urlmon.dll\CoInternetIsFeatureEnabledForIUri", "int", FeatureEntry, "uint", dwFlags, "ptr", pIUri, "ptr", pSecMgr, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szFromURL 
     * @param {Pointer<PWSTR>} szToURL 
     * @param {Pointer<IInternetSecurityManager>} pSecMgr 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static CoInternetIsFeatureZoneElevationEnabled(szFromURL, szToURL, pSecMgr, dwFlags) {
        szFromURL := szFromURL is String? StrPtr(szFromURL) : szFromURL
        szToURL := szToURL is String? StrPtr(szToURL) : szToURL

        result := DllCall("urlmon.dll\CoInternetIsFeatureZoneElevationEnabled", "ptr", szFromURL, "ptr", szToURL, "ptr", pSecMgr, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<STGMEDIUM>} pcstgmedSrc 
     * @param {Pointer<STGMEDIUM>} pstgmedDest 
     * @returns {Integer} 
     */
    static CopyStgMedium(pcstgmedSrc, pstgmedDest) {
        result := DllCall("urlmon.dll\CopyStgMedium", "ptr", pcstgmedSrc, "ptr", pstgmedDest, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<BINDINFO>} pcbiSrc 
     * @param {Pointer<BINDINFO>} pbiDest 
     * @returns {Integer} 
     */
    static CopyBindInfo(pcbiSrc, pbiDest) {
        result := DllCall("urlmon.dll\CopyBindInfo", "ptr", pcbiSrc, "ptr", pbiDest, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @returns {String} Nothing - always returns an empty string
     */
    static ReleaseBindInfo(pbindinfo) {
        DllCall("urlmon.dll\ReleaseBindInfo", "ptr", pbindinfo)
    }

    /**
     * 
     * @returns {Pointer<PWSTR>} 
     */
    static IEGetUserPrivateNamespaceName() {
        result := DllCall("urlmon.dll\IEGetUserPrivateNamespaceName", "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<IServiceProvider>} pSP 
     * @param {Pointer<IInternetSecurityManager>} ppSM 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static CoInternetCreateSecurityManager(pSP, ppSM, dwReserved) {
        result := DllCall("urlmon.dll\CoInternetCreateSecurityManager", "ptr", pSP, "ptr", ppSM, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IServiceProvider>} pSP 
     * @param {Pointer<IInternetZoneManager>} ppZM 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    static CoInternetCreateZoneManager(pSP, ppZM, dwReserved) {
        result := DllCall("urlmon.dll\CoInternetCreateZoneManager", "ptr", pSP, "ptr", ppZM, "uint", dwReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szDistUnit 
     * @param {Pointer<SOFTDISTINFO>} psdi 
     * @returns {Integer} 
     */
    static GetSoftwareUpdateInfo(szDistUnit, psdi) {
        szDistUnit := szDistUnit is String? StrPtr(szDistUnit) : szDistUnit

        result := DllCall("urlmon.dll\GetSoftwareUpdateInfo", "ptr", szDistUnit, "ptr", psdi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szDistUnit 
     * @param {Integer} dwAdState 
     * @param {Integer} dwAdvertisedVersionMS 
     * @param {Integer} dwAdvertisedVersionLS 
     * @returns {Integer} 
     */
    static SetSoftwareUpdateAdvertisementState(szDistUnit, dwAdState, dwAdvertisedVersionMS, dwAdvertisedVersionLS) {
        szDistUnit := szDistUnit is String? StrPtr(szDistUnit) : szDistUnit

        result := DllCall("urlmon.dll\SetSoftwareUpdateAdvertisementState", "ptr", szDistUnit, "uint", dwAdState, "uint", dwAdvertisedVersionMS, "uint", dwAdvertisedVersionLS, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pszUrl 
     * @returns {Integer} 
     */
    static IsLoggingEnabledA(pszUrl) {
        pszUrl := pszUrl is String? StrPtr(pszUrl) : pszUrl

        result := DllCall("urlmon.dll\IsLoggingEnabledA", "ptr", pszUrl, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwszUrl 
     * @returns {Integer} 
     */
    static IsLoggingEnabledW(pwszUrl) {
        pwszUrl := pwszUrl is String? StrPtr(pwszUrl) : pwszUrl

        result := DllCall("urlmon.dll\IsLoggingEnabledW", "ptr", pwszUrl, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HIT_LOGGING_INFO>} lpLogginginfo 
     * @returns {Integer} 
     */
    static WriteHitLogging(lpLogginginfo) {
        result := DllCall("urlmon.dll\WriteHitLogging", "ptr", lpLogginginfo, "int")
        return result
    }

;@endregion Methods
}
