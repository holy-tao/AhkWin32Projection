#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MKSYS_URLMONIKER := 6

/**
 * @type {Integer (UInt32)}
 */
export global URL_MK_LEGACY := 0

/**
 * @type {Integer (UInt32)}
 */
export global URL_MK_UNIFORM := 1

/**
 * @type {Integer (UInt32)}
 */
export global URL_MK_NO_CANONICALIZE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FIEF_FLAG_FORCE_JITUI := 1

/**
 * @type {Integer (UInt32)}
 */
export global FIEF_FLAG_PEEK := 2

/**
 * @type {Integer (UInt32)}
 */
export global FIEF_FLAG_SKIP_INSTALLED_VERSION_CHECK := 4

/**
 * @type {Integer (UInt32)}
 */
export global FIEF_FLAG_RESERVED_0 := 8

/**
 * @type {Integer (UInt32)}
 */
export global FMFD_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global FMFD_URLASFILENAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global FMFD_ENABLEMIMESNIFFING := 2

/**
 * @type {Integer (UInt32)}
 */
export global FMFD_IGNOREMIMETEXTPLAIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global FMFD_SERVERMIME := 8

/**
 * @type {Integer (UInt32)}
 */
export global FMFD_RESPECTTEXTPLAIN := 16

/**
 * @type {Integer (UInt32)}
 */
export global FMFD_RETURNUPDATEDIMGMIMES := 32

/**
 * @type {Integer (UInt32)}
 */
export global FMFD_RESERVED_1 := 64

/**
 * @type {Integer (UInt32)}
 */
export global FMFD_RESERVED_2 := 128

/**
 * @type {Integer (UInt32)}
 */
export global UAS_EXACTLEGACY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global URLMON_OPTION_USERAGENT := 268435457

/**
 * @type {Integer (UInt32)}
 */
export global URLMON_OPTION_USERAGENT_REFRESH := 268435458

/**
 * @type {Integer (UInt32)}
 */
export global URLMON_OPTION_URL_ENCODING := 268435460

/**
 * @type {Integer (UInt32)}
 */
export global URLMON_OPTION_USE_BINDSTRINGCREDS := 268435464

/**
 * @type {Integer (UInt32)}
 */
export global URLMON_OPTION_USE_BROWSERAPPSDOCUMENTS := 268435472

/**
 * @type {Integer (UInt32)}
 */
export global CF_NULL := 0

/**
 * @type {Integer (Int32)}
 */
export global MK_S_ASYNCHRONOUS := 262632

/**
 * @type {Integer (Int32)}
 */
export global S_ASYNCHRONOUS := 262632

/**
 * @type {Integer (Int32)}
 */
export global E_PENDING := -2147483638

/**
 * @type {Integer (Int32)}
 */
export global INET_E_INVALID_URL := -2146697214

/**
 * @type {Integer (Int32)}
 */
export global INET_E_NO_SESSION := -2146697213

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CANNOT_CONNECT := -2146697212

/**
 * @type {Integer (Int32)}
 */
export global INET_E_RESOURCE_NOT_FOUND := -2146697211

/**
 * @type {Integer (Int32)}
 */
export global INET_E_OBJECT_NOT_FOUND := -2146697210

/**
 * @type {Integer (Int32)}
 */
export global INET_E_DATA_NOT_AVAILABLE := -2146697209

/**
 * @type {Integer (Int32)}
 */
export global INET_E_DOWNLOAD_FAILURE := -2146697208

/**
 * @type {Integer (Int32)}
 */
export global INET_E_AUTHENTICATION_REQUIRED := -2146697207

/**
 * @type {Integer (Int32)}
 */
export global INET_E_NO_VALID_MEDIA := -2146697206

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CONNECTION_TIMEOUT := -2146697205

/**
 * @type {Integer (Int32)}
 */
export global INET_E_INVALID_REQUEST := -2146697204

/**
 * @type {Integer (Int32)}
 */
export global INET_E_UNKNOWN_PROTOCOL := -2146697203

/**
 * @type {Integer (Int32)}
 */
export global INET_E_SECURITY_PROBLEM := -2146697202

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CANNOT_LOAD_DATA := -2146697201

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CANNOT_INSTANTIATE_OBJECT := -2146697200

/**
 * @type {Integer (Int32)}
 */
export global INET_E_INVALID_CERTIFICATE := -2146697191

/**
 * @type {Integer (Int32)}
 */
export global INET_E_REDIRECT_FAILED := -2146697196

/**
 * @type {Integer (Int32)}
 */
export global INET_E_REDIRECT_TO_DIR := -2146697195

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CANNOT_LOCK_REQUEST := -2146697194

/**
 * @type {Integer (Int32)}
 */
export global INET_E_USE_EXTEND_BINDING := -2146697193

/**
 * @type {Integer (Int32)}
 */
export global INET_E_TERMINATED_BIND := -2146697192

/**
 * @type {Integer (Int32)}
 */
export global INET_E_RESERVED_1 := -2146697190

/**
 * @type {Integer (Int32)}
 */
export global INET_E_BLOCKED_REDIRECT_XSECURITYID := -2146697189

/**
 * @type {Integer (Int32)}
 */
export global INET_E_DOMINJECTIONVALIDATION := -2146697188

/**
 * @type {Integer (Int32)}
 */
export global INET_E_VTAB_SWITCH_FORCE_ENGINE := -2146697187

/**
 * @type {Integer (Int32)}
 */
export global INET_E_HSTS_CERTIFICATE_ERROR := -2146697186

/**
 * @type {Integer (Int32)}
 */
export global INET_E_RESERVED_2 := -2146697185

/**
 * @type {Integer (Int32)}
 */
export global INET_E_RESERVED_3 := -2146697184

/**
 * @type {Integer (Int32)}
 */
export global INET_E_RESERVED_4 := -2146697183

/**
 * @type {Integer (Int32)}
 */
export global INET_E_RESERVED_5 := -2146697182

/**
 * @type {Integer (Int32)}
 */
export global INET_E_ERROR_FIRST := -2146697214

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CODE_DOWNLOAD_DECLINED := -2146696960

/**
 * @type {Integer (Int32)}
 */
export global INET_E_RESULT_DISPATCHED := -2146696704

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CANNOT_REPLACE_SFP_FILE := -2146696448

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CODE_INSTALL_SUPPRESSED := -2146696192

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CODE_INSTALL_BLOCKED_BY_HASH_POLICY := -2146695936

/**
 * @type {Integer (Int32)}
 */
export global INET_E_DOWNLOAD_BLOCKED_BY_INPRIVATE := -2146695935

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CODE_INSTALL_BLOCKED_IMMERSIVE := -2146695934

/**
 * @type {Integer (Int32)}
 */
export global INET_E_FORBIDFRAMING := -2146695933

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CODE_INSTALL_BLOCKED_ARM := -2146695932

/**
 * @type {Integer (Int32)}
 */
export global INET_E_BLOCKED_PLUGGABLE_PROTOCOL := -2146695931

/**
 * @type {Integer (Int32)}
 */
export global INET_E_BLOCKED_ENHANCEDPROTECTEDMODE := -2146695930

/**
 * @type {Integer (Int32)}
 */
export global INET_E_CODE_INSTALL_BLOCKED_BITNESS := -2146695929

/**
 * @type {Integer (Int32)}
 */
export global INET_E_DOWNLOAD_BLOCKED_BY_CSP := -2146695928

/**
 * @type {Integer (Int32)}
 */
export global INET_E_ERROR_LAST := -2146695928

/**
 * @type {Integer (UInt32)}
 */
export global Uri_DISPLAY_NO_FRAGMENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global Uri_PUNYCODE_IDN_HOST := 2

/**
 * @type {Integer (UInt32)}
 */
export global Uri_DISPLAY_IDN_HOST := 4

/**
 * @type {Integer (UInt32)}
 */
export global Uri_DISPLAY_NO_PUNYCODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global Uri_ENCODING_USER_INFO_AND_PATH_IS_PERCENT_ENCODED_UTF8 := 1

/**
 * @type {Integer (UInt32)}
 */
export global Uri_ENCODING_USER_INFO_AND_PATH_IS_CP := 2

/**
 * @type {Integer (UInt32)}
 */
export global Uri_ENCODING_HOST_IS_IDN := 4

/**
 * @type {Integer (UInt32)}
 */
export global Uri_ENCODING_HOST_IS_PERCENT_ENCODED_UTF8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global Uri_ENCODING_HOST_IS_PERCENT_ENCODED_CP := 16

/**
 * @type {Integer (UInt32)}
 */
export global Uri_ENCODING_QUERY_AND_FRAGMENT_IS_PERCENT_ENCODED_UTF8 := 32

/**
 * @type {Integer (UInt32)}
 */
export global Uri_ENCODING_QUERY_AND_FRAGMENT_IS_CP := 64

/**
 * @type {Integer (UInt32)}
 */
export global UriBuilder_USE_ORIGINAL_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global WININETINFO_OPTION_LOCK_HANDLE := 65534

/**
 * @type {Integer (UInt32)}
 */
export global URLOSTRM_USECACHEDCOPY_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global URLOSTRM_USECACHEDCOPY := 2

/**
 * @type {Integer (UInt32)}
 */
export global URLOSTRM_GETNEWESTVERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global SET_FEATURE_ON_THREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global SET_FEATURE_ON_PROCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global SET_FEATURE_IN_REGISTRY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SET_FEATURE_ON_THREAD_LOCALMACHINE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SET_FEATURE_ON_THREAD_INTRANET := 16

/**
 * @type {Integer (UInt32)}
 */
export global SET_FEATURE_ON_THREAD_TRUSTED := 32

/**
 * @type {Integer (UInt32)}
 */
export global SET_FEATURE_ON_THREAD_INTERNET := 64

/**
 * @type {Integer (UInt32)}
 */
export global SET_FEATURE_ON_THREAD_RESTRICTED := 128

/**
 * @type {Integer (UInt32)}
 */
export global GET_FEATURE_FROM_THREAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global GET_FEATURE_FROM_PROCESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global GET_FEATURE_FROM_REGISTRY := 4

/**
 * @type {Integer (UInt32)}
 */
export global GET_FEATURE_FROM_THREAD_LOCALMACHINE := 8

/**
 * @type {Integer (UInt32)}
 */
export global GET_FEATURE_FROM_THREAD_INTRANET := 16

/**
 * @type {Integer (UInt32)}
 */
export global GET_FEATURE_FROM_THREAD_TRUSTED := 32

/**
 * @type {Integer (UInt32)}
 */
export global GET_FEATURE_FROM_THREAD_INTERNET := 64

/**
 * @type {Integer (UInt32)}
 */
export global GET_FEATURE_FROM_THREAD_RESTRICTED := 128

/**
 * @type {Integer (Int32)}
 */
export global INET_E_USE_DEFAULT_PROTOCOLHANDLER := -2146697199

/**
 * @type {Integer (Int32)}
 */
export global INET_E_USE_DEFAULT_SETTING := -2146697198

/**
 * @type {Integer (Int32)}
 */
export global INET_E_DEFAULT_ACTION := -2146697199

/**
 * @type {Integer (Int32)}
 */
export global INET_E_QUERYOPTION_UNKNOWN := -2146697197

/**
 * @type {Integer (Int32)}
 */
export global INET_E_REDIRECTING := -2146697196

/**
 * @type {Integer (UInt32)}
 */
export global PROTOCOLFLAG_NO_PICS_CHECK := 1

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_NOSAVEDFILECHECK := 1

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_ISFILE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_ACCEPT_WILDCARD_SCHEME := 128

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_ENFORCERESTRICTED := 256

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_RESERVED := 512

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_REQUIRESAVEDFILECHECK := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_DONT_UNESCAPE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_DONT_USE_CACHE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_FORCE_INTRANET_FLAGS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global MUTZ_IGNORE_ZONE_MAPPINGS := 16384

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SIZE_SECURITY_ID := 512

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_MIN := 4096

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_DOWNLOAD_MIN := 4096

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_DOWNLOAD_SIGNED_ACTIVEX := 4097

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_DOWNLOAD_UNSIGNED_ACTIVEX := 4100

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_DOWNLOAD_CURR_MAX := 4100

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_DOWNLOAD_MAX := 4607

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_MIN := 4608

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_RUN := 4608

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_ACTIVEX_CHECK_LIST := 65536

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_OVERRIDE_OBJECT_SAFETY := 4609

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_OVERRIDE_DATA_SAFETY := 4610

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_OVERRIDE_SCRIPT_SAFETY := 4611

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_OVERRIDE_SAFETY := 5121

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_CONFIRM_NOOBJECTSAFETY := 4612

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_TREATASUNTRUSTED := 4613

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_NO_WEBOC_SCRIPT := 4614

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_OVERRIDE_REPURPOSEDETECTION := 4615

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_OVERRIDE_OPTIN := 4616

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_SCRIPTLET_RUN := 4617

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_DYNSRC_VIDEO_AND_ANIMATION := 4618

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_OVERRIDE_DOMAINLIST := 4619

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_ALLOW_TDC := 4620

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_CURR_MAX := 4620

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ACTIVEX_MAX := 5119

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_MIN := 5120

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_RUN := 5120

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_JAVA_USE := 5122

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_SAFE_ACTIVEX := 5125

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_CROSS_DOMAIN_DATA := 5126

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_PASTE := 5127

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_XDOMAIN_SUBFRAME_RESIZE := 5128

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_XSSFILTER := 5129

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_NAVIGATE := 5130

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_PLUGGABLE_PROTOCOL_XHR := 5131

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_VBSCRIPT_IE := 5132

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_JSCRIPT_IE := 5133

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_CURR_MAX := 5133

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SCRIPT_MAX := 5631

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_MIN := 5632

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_SUBMIT_FORMS := 5633

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_SUBMIT_FORMS_FROM := 5634

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_SUBMIT_FORMS_TO := 5635

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_FONT_DOWNLOAD := 5636

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_JAVA_RUN := 5637

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_USERDATA_SAVE := 5638

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_SUBFRAME_NAVIGATE := 5639

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_META_REFRESH := 5640

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_MIXED_CONTENT := 5641

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_INCLUDE_FILE_PATH := 5642

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_ALLOW_INJECTED_DYNAMIC_HTML := 5643

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_REQUIRE_UTF8_DOCUMENT_CODEPAGE := 5644

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_ALLOW_CROSS_DOMAIN_CANVAS := 5645

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_ALLOW_WINDOW_CLOSE := 5646

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_ALLOW_CROSS_DOMAIN_WEBWORKER := 5647

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_ALLOW_CROSS_DOMAIN_TEXTTRACK := 5648

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_ALLOW_INDEXEDDB := 5649

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_HTML_MAX := 6143

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_MIN := 6144

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_INSTALL_DTITEMS := 6144

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_MOVE_OR_COPY := 6146

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_FILE_DOWNLOAD := 6147

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_VERB := 6148

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_WEBVIEW_VERB := 6149

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_SHELLEXECUTE := 6150

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_EXECUTE_HIGHRISK := 6150

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_EXECUTE_MODRISK := 6151

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_EXECUTE_LOWRISK := 6152

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_POPUPMGR := 6153

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_RTF_OBJECTS_LOAD := 6154

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_ENHANCED_DRAGDROP_SECURITY := 6155

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_EXTENSIONSECURITY := 6156

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_SECURE_DRAGSOURCE := 6157

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_REMOTEQUERY := 6158

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_PREVIEW := 6159

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_SHARE := 6160

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_ALLOW_CROSS_SITE_SHARE := 6161

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_TOCTOU_RISK := 6162

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_CURR_MAX := 6162

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_SHELL_MAX := 6655

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_NETWORK_MIN := 6656

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_CREDENTIALS_USE := 6656

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_CREDENTIALS_SILENT_LOGON_OK := 0

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_CREDENTIALS_MUST_PROMPT_USER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_CREDENTIALS_CONDITIONAL_PROMPT := 131072

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_CREDENTIALS_ANONYMOUS_ONLY := 196608

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_AUTHENTICATE_CLIENT := 6657

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_AUTHENTICATE_CLEARTEXT_OK := 0

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_AUTHENTICATE_CHALLENGE_RESPONSE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_AUTHENTICATE_MUTUAL_ONLY := 196608

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_COOKIES := 6658

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_COOKIES_SESSION := 6659

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_CLIENT_CERT_PROMPT := 6660

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_COOKIES_THIRD_PARTY := 6661

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_COOKIES_SESSION_THIRD_PARTY := 6662

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_COOKIES_ENABLED := 6672

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_NETWORK_CURR_MAX := 6672

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_NETWORK_MAX := 7167

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_JAVA_MIN := 7168

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_JAVA_PERMISSIONS := 7168

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_JAVA_PROHIBIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_JAVA_HIGH := 65536

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_JAVA_MEDIUM := 131072

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_JAVA_LOW := 196608

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_JAVA_CUSTOM := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_JAVA_CURR_MAX := 7168

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_JAVA_MAX := 7423

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_MIN := 7424

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_NO_ADDING_CHANNELS := 7424

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_NO_EDITING_CHANNELS := 7425

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_NO_REMOVING_CHANNELS := 7426

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_NO_ADDING_SUBSCRIPTIONS := 7427

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_NO_EDITING_SUBSCRIPTIONS := 7428

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_NO_REMOVING_SUBSCRIPTIONS := 7429

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_NO_CHANNEL_LOGGING := 7430

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_CURR_MAX := 7430

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INFODELIVERY_MAX := 7679

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_CHANNEL_SOFTDIST_MIN := 7680

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_CHANNEL_SOFTDIST_PERMISSIONS := 7685

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_CHANNEL_SOFTDIST_PROHIBIT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_CHANNEL_SOFTDIST_PRECACHE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_CHANNEL_SOFTDIST_AUTOINSTALL := 196608

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_CHANNEL_SOFTDIST_MAX := 7935

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_DOTNET_USERCONTROLS := 8197

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_BEHAVIOR_MIN := 8192

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_BEHAVIOR_RUN := 8192

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_BEHAVIOR_CHECK_LIST := 65536

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_FEATURE_MIN := 8448

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_FEATURE_MIME_SNIFFING := 8448

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_FEATURE_ZONE_ELEVATION := 8449

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_FEATURE_WINDOW_RESTRICTIONS := 8450

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_FEATURE_SCRIPT_STATUS_BAR := 8451

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_FEATURE_FORCE_ADDR_AND_STATUS := 8452

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_FEATURE_BLOCK_INPUT_PROMPTS := 8453

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_FEATURE_DATA_BINDING := 8454

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_FEATURE_CROSSDOMAIN_FOCUS_CHANGE := 8455

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_AUTOMATIC_DOWNLOAD_UI_MIN := 8704

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_AUTOMATIC_DOWNLOAD_UI := 8704

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_AUTOMATIC_ACTIVEX_UI := 8705

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_RESTRICTEDPROTOCOLS := 8960

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_APEVALUATION := 8961

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_XHR_EVALUATION := 8962

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_WINDOWS_BROWSER_APPLICATIONS := 9216

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_XPS_DOCUMENTS := 9217

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_LOOSE_XAML := 9218

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_LOWRIGHTS := 9472

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_WINFX_SETUP := 9728

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_INPRIVATE_BLOCKING := 9984

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_AUDIO_VIDEO := 9985

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_ACTIVEX_FILTERING := 9986

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_STRUCTURED_STORAGE_SNIFFING := 9987

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_AUDIO_VIDEO_PLUGINS := 9988

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_ZONE_ELEVATION_VIA_OPT_OUT := 9989

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_ZONE_ELEVATION_OPT_OUT_ADDITION := 9990

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_CROSSDOMAIN_DROP_WITHIN_WINDOW := 9992

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_CROSSDOMAIN_DROP_ACROSS_WINDOWS := 9993

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_CROSSDOMAIN_APPCACHE_MANIFEST := 9994

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_RENDER_LEGACY_DXTFILTERS := 9995

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_ANTIMALWARE_SCANNING_OF_ACTIVEX := 9996

/**
 * @type {Integer (UInt32)}
 */
export global URLACTION_ALLOW_CSS_EXPRESSIONS := 9997

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_ALLOW := 0

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_QUERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_DISALLOW := 3

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_NOTIFY_ON_ALLOW := 16

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_NOTIFY_ON_DISALLOW := 32

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_LOG_ON_ALLOW := 64

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_LOG_ON_DISALLOW := 128

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_MASK_PERMISSIONS := 15

/**
 * @type {Integer (UInt32)}
 */
export global URLPOLICY_DONTCHECKDLGBOX := 256

/**
 * @type {Integer (UInt32)}
 */
export global URLZONE_ESC_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_IE_STATE_GREEN := 0

/**
 * @type {Integer (UInt32)}
 */
export global SECURITY_IE_STATE_RED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOFTDIST_FLAG_USAGE_EMAIL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOFTDIST_FLAG_USAGE_PRECACHE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOFTDIST_FLAG_USAGE_AUTOINSTALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global SOFTDIST_FLAG_DELETE_SUBSCRIPTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global SOFTDIST_ADSTATE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SOFTDIST_ADSTATE_AVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOFTDIST_ADSTATE_DOWNLOADED := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOFTDIST_ADSTATE_INSTALLED := 3

/**
 * @type {Integer (UInt32)}
 */
export global CONFIRMSAFETYACTION_LOADOBJECT := 1
;@endregion Constants
