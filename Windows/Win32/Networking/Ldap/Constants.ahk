#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Ldap
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global LBER_ERROR := -1

/**
 * @type {Integer (Int32)}
 */
export global LBER_DEFAULT := -1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_UNICODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_PORT := 389

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_SSL_PORT := 636

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_GC_PORT := 3268

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_SSL_GC_PORT := 3269

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_VERSION2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_VERSION3 := 3

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_VERSION := 2

/**
 * @type {Integer (Int32)}
 */
export global LDAP_BIND_CMD := 96

/**
 * @type {Integer (Int32)}
 */
export global LDAP_UNBIND_CMD := 66

/**
 * @type {Integer (Int32)}
 */
export global LDAP_SEARCH_CMD := 99

/**
 * @type {Integer (Int32)}
 */
export global LDAP_MODIFY_CMD := 102

/**
 * @type {Integer (Int32)}
 */
export global LDAP_ADD_CMD := 104

/**
 * @type {Integer (Int32)}
 */
export global LDAP_DELETE_CMD := 74

/**
 * @type {Integer (Int32)}
 */
export global LDAP_MODRDN_CMD := 108

/**
 * @type {Integer (Int32)}
 */
export global LDAP_COMPARE_CMD := 110

/**
 * @type {Integer (Int32)}
 */
export global LDAP_ABANDON_CMD := 80

/**
 * @type {Integer (Int32)}
 */
export global LDAP_SESSION_CMD := 113

/**
 * @type {Integer (Int32)}
 */
export global LDAP_EXTENDED_CMD := 119

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_BIND := 97

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_SEARCH_ENTRY := 100

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_SEARCH_RESULT := 101

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_MODIFY := 103

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_ADD := 105

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_DELETE := 107

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_MODRDN := 109

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_COMPARE := 111

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_SESSION := 114

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_REFERRAL := 115

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_EXTENDED := 120

/**
 * @type {Integer (Int32)}
 */
export global LDAP_RES_ANY := -1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_INVALID_CMD := 255

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_INVALID_RES := 255

/**
 * @type {Integer (Int32)}
 */
export global LDAP_AUTH_SIMPLE := 128

/**
 * @type {Integer (Int32)}
 */
export global LDAP_AUTH_SASL := 131

/**
 * @type {Integer (Int32)}
 */
export global LDAP_AUTH_OTHERKIND := 134

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_AND := 160

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_OR := 161

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_NOT := 162

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_EQUALITY := 163

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_SUBSTRINGS := 164

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_GE := 165

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_LE := 166

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_PRESENT := 135

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_APPROX := 168

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FILTER_EXTENSIBLE := 169

/**
 * @type {Integer (Int32)}
 */
export global LDAP_SUBSTRING_INITIAL := 128

/**
 * @type {Integer (Int32)}
 */
export global LDAP_SUBSTRING_ANY := 129

/**
 * @type {Integer (Int32)}
 */
export global LDAP_SUBSTRING_FINAL := 130

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_DEREF_NEVER := 0

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_DEREF_SEARCHING := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_DEREF_FINDING := 2

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_DEREF_ALWAYS := 3

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_NO_LIMIT := 0

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_DNS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_CHASE_REFERRALS := 2

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_RETURN_REFS := 4

/**
 * @type {String}
 */
export global LDAP_CONTROL_REFERRALS_W := "1.2.840.113556.1.4.616"

/**
 * @type {String}
 */
export global LDAP_CONTROL_REFERRALS := "1.2.840.113556.1.4.616"

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_MOD_ADD := 0

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_MOD_DELETE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_MOD_REPLACE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_MOD_BVALUES := 128

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_API_INFO := 0

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_DESC := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_DEREF := 2

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SIZELIMIT := 3

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_TIMELIMIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_THREAD_FN_PTRS := 5

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_REBIND_FN := 6

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_REBIND_ARG := 7

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_REFERRALS := 8

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_RESTART := 9

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SSL := 10

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_IO_FN_PTRS := 11

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_CACHE_FN_PTRS := 13

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_CACHE_STRATEGY := 14

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_CACHE_ENABLE := 15

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_REFERRAL_HOP_LIMIT := 16

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_PROTOCOL_VERSION := 17

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_VERSION := 17

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_API_FEATURE_INFO := 21

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_HOST_NAME := 48

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_ERROR_NUMBER := 49

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_ERROR_STRING := 50

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SERVER_ERROR := 51

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SERVER_EXT_ERROR := 52

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_HOST_REACHABLE := 62

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_PING_KEEP_ALIVE := 54

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_PING_WAIT_TIME := 55

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_PING_LIMIT := 56

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_DNSDOMAIN_NAME := 59

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_GETDSNAME_FLAGS := 61

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_PROMPT_CREDENTIALS := 63

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_AUTO_RECONNECT := 145

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SSPI_FLAGS := 146

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SSL_INFO := 147

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_TLS := 10

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_TLS_INFO := 147

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SIGN := 149

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_ENCRYPT := 150

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SASL_METHOD := 151

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_AREC_EXCLUSIVE := 152

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SECURITY_CONTEXT := 153

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_ROOTDSE_CACHE := 154

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_TCP_KEEPALIVE := 64

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_FAST_CONCURRENT_BIND := 65

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SEND_TIMEOUT := 66

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SCH_FLAGS := 67

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SOCKET_BIND_ADDRESSES := 68

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_CLDAP_TIMEOUT := 69

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_CLDAP_TRIES := 70

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_ANONYMOUS_MAX_VAL_RANGE := 71

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_CHASE_SUBORDINATE_REFERRALS := 32

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_CHASE_EXTERNAL_REFERRALS := 64

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_SCOPE_BASE := 0

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_SCOPE_ONELEVEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_SCOPE_SUBTREE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_MSG_ONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_MSG_ALL := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_MSG_RECEIVED := 2

/**
 * @type {Integer (UInt32)}
 */
export global LBER_USE_DER := 1

/**
 * @type {Integer (UInt32)}
 */
export global LBER_USE_INDEFINITE_LEN := 2

/**
 * @type {Integer (UInt32)}
 */
export global LBER_TRANSLATE_STRINGS := 4

/**
 * @type {Integer (UInt32)}
 */
export global LAPI_MAJOR_VER1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global LAPI_MINOR_VER1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_API_INFO_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_API_VERSION := 2004

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_VERSION_MIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_VERSION_MAX := 3

/**
 * @type {String}
 */
export global LDAP_VENDOR_NAME := "Microsoft Corporation."

/**
 * @type {String}
 */
export global LDAP_VENDOR_NAME_W := "Microsoft Corporation."

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_VENDOR_VERSION := 510

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_FEATURE_INFO_VERSION := 1

/**
 * @type {String}
 */
export global LDAP_SERVER_SORT_OID := "1.2.840.113556.1.4.473"

/**
 * @type {String}
 */
export global LDAP_SERVER_SORT_OID_W := "1.2.840.113556.1.4.473"

/**
 * @type {String}
 */
export global LDAP_SERVER_RESP_SORT_OID := "1.2.840.113556.1.4.474"

/**
 * @type {String}
 */
export global LDAP_SERVER_RESP_SORT_OID_W := "1.2.840.113556.1.4.474"

/**
 * @type {String}
 */
export global LDAP_PAGED_RESULT_OID_STRING := "1.2.840.113556.1.4.319"

/**
 * @type {String}
 */
export global LDAP_PAGED_RESULT_OID_STRING_W := "1.2.840.113556.1.4.319"

/**
 * @type {String}
 */
export global LDAP_CONTROL_VLVREQUEST := "2.16.840.1.113730.3.4.9"

/**
 * @type {String}
 */
export global LDAP_CONTROL_VLVREQUEST_W := "2.16.840.1.113730.3.4.9"

/**
 * @type {String}
 */
export global LDAP_CONTROL_VLVRESPONSE := "2.16.840.1.113730.3.4.10"

/**
 * @type {String}
 */
export global LDAP_CONTROL_VLVRESPONSE_W := "2.16.840.1.113730.3.4.10"

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_API_FEATURE_VIRTUAL_LIST_VIEW := 1001

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_VLVINFO_VERSION := 1

/**
 * @type {String}
 */
export global LDAP_START_TLS_OID := "1.3.6.1.4.1.1466.20037"

/**
 * @type {String}
 */
export global LDAP_START_TLS_OID_W := "1.3.6.1.4.1.1466.20037"

/**
 * @type {String}
 */
export global LDAP_TTL_EXTENDED_OP_OID := "1.3.6.1.4.1.1466.101.119.1"

/**
 * @type {String}
 */
export global LDAP_TTL_EXTENDED_OP_OID_W := "1.3.6.1.4.1.1466.101.119.1"

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_REFERRAL_CALLBACK := 112

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_CLIENT_CERTIFICATE := 128

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_SERVER_CERTIFICATE := 129

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_OPT_REF_DEREF_CONN_PER_MSG := 148

/**
 * @type {String}
 */
export global LDAP_SERVER_FORCE_UPDATE_OID := "1.2.840.113556.1.4.1974"

/**
 * @type {String}
 */
export global LDAP_SERVER_FORCE_UPDATE_OID_W := "1.2.840.113556.1.4.1974"

/**
 * @type {String}
 */
export global LDAP_SERVER_PERMISSIVE_MODIFY_OID := "1.2.840.113556.1.4.1413"

/**
 * @type {String}
 */
export global LDAP_SERVER_PERMISSIVE_MODIFY_OID_W := "1.2.840.113556.1.4.1413"

/**
 * @type {String}
 */
export global LDAP_SERVER_SHOW_DELETED_OID := "1.2.840.113556.1.4.417"

/**
 * @type {String}
 */
export global LDAP_SERVER_SHOW_DELETED_OID_W := "1.2.840.113556.1.4.417"

/**
 * @type {String}
 */
export global LDAP_SERVER_SHOW_RECYCLED_OID := "1.2.840.113556.1.4.2064"

/**
 * @type {String}
 */
export global LDAP_SERVER_SHOW_RECYCLED_OID_W := "1.2.840.113556.1.4.2064"

/**
 * @type {String}
 */
export global LDAP_SERVER_EXPECTED_ENTRY_COUNT_OID := "1.2.840.113556.1.4.2211"

/**
 * @type {String}
 */
export global LDAP_SERVER_EXPECTED_ENTRY_COUNT_OID_W := "1.2.840.113556.1.4.2211"

/**
 * @type {String}
 */
export global LDAP_SERVER_SEARCH_HINTS_OID := "1.2.840.113556.1.4.2206"

/**
 * @type {String}
 */
export global LDAP_SERVER_SEARCH_HINTS_OID_W := "1.2.840.113556.1.4.2206"

/**
 * @type {String}
 */
export global LDAP_SEARCH_HINT_INDEX_ONLY_OID := "1.2.840.113556.1.4.2207"

/**
 * @type {String}
 */
export global LDAP_SEARCH_HINT_INDEX_ONLY_OID_W := "1.2.840.113556.1.4.2207"

/**
 * @type {String}
 */
export global LDAP_SEARCH_HINT_SOFT_SIZE_LIMIT_OID := "1.2.840.113556.1.4.2210"

/**
 * @type {String}
 */
export global LDAP_SEARCH_HINT_SOFT_SIZE_LIMIT_OID_W := "1.2.840.113556.1.4.2210"

/**
 * @type {String}
 */
export global LDAP_SEARCH_HINT_REQUIRED_INDEX_OID := "1.2.840.113556.1.4.2306"

/**
 * @type {String}
 */
export global LDAP_SEARCH_HINT_REQUIRED_INDEX_OID_W := "1.2.840.113556.1.4.2306"

/**
 * @type {String}
 */
export global LDAP_SERVER_UPDATE_STATS_OID := "1.2.840.113556.1.4.2205"

/**
 * @type {String}
 */
export global LDAP_SERVER_UPDATE_STATS_OID_W := "1.2.840.113556.1.4.2205"

/**
 * @type {String}
 */
export global LDAP_UPDATE_STATS_USN_OID := "1.2.840.113556.1.4.2208"

/**
 * @type {String}
 */
export global LDAP_UPDATE_STATS_USN_OID_W := "1.2.840.113556.1.4.2208"

/**
 * @type {String}
 */
export global LDAP_UPDATE_STATS_INVOCATIONID_OID := "1.2.840.113556.1.4.2209"

/**
 * @type {String}
 */
export global LDAP_UPDATE_STATS_INVOCATIONID_OID_W := "1.2.840.113556.1.4.2209"

/**
 * @type {String}
 */
export global LDAP_SERVER_GET_STATS_OID := "1.2.840.113556.1.4.970"

/**
 * @type {String}
 */
export global LDAP_SERVER_GET_STATS_OID_W := "1.2.840.113556.1.4.970"

/**
 * @type {String}
 */
export global LDAP_SERVER_SHOW_DEACTIVATED_LINK_OID := "1.2.840.113556.1.4.2065"

/**
 * @type {String}
 */
export global LDAP_SERVER_SHOW_DEACTIVATED_LINK_OID_W := "1.2.840.113556.1.4.2065"

/**
 * @type {String}
 */
export global LDAP_SERVER_POLICY_HINTS_DEPRECATED_OID := "1.2.840.113556.1.4.2066"

/**
 * @type {String}
 */
export global LDAP_SERVER_POLICY_HINTS_DEPRECATED_OID_W := "1.2.840.113556.1.4.2066"

/**
 * @type {String}
 */
export global LDAP_SERVER_POLICY_HINTS_OID := "1.2.840.113556.1.4.2239"

/**
 * @type {String}
 */
export global LDAP_SERVER_POLICY_HINTS_OID_W := "1.2.840.113556.1.4.2239"

/**
 * @type {String}
 */
export global LDAP_SERVER_RANGE_OPTION_OID := "1.2.840.113556.1.4.802"

/**
 * @type {String}
 */
export global LDAP_SERVER_RANGE_OPTION_OID_W := "1.2.840.113556.1.4.802"

/**
 * @type {String}
 */
export global LDAP_SERVER_CROSSDOM_MOVE_TARGET_OID := "1.2.840.113556.1.4.521"

/**
 * @type {String}
 */
export global LDAP_SERVER_CROSSDOM_MOVE_TARGET_OID_W := "1.2.840.113556.1.4.521"

/**
 * @type {String}
 */
export global LDAP_SERVER_NOTIFICATION_OID := "1.2.840.113556.1.4.528"

/**
 * @type {String}
 */
export global LDAP_SERVER_NOTIFICATION_OID_W := "1.2.840.113556.1.4.528"

/**
 * @type {String}
 */
export global LDAP_SERVER_SHUTDOWN_NOTIFY_OID := "1.2.840.113556.1.4.1907"

/**
 * @type {String}
 */
export global LDAP_SERVER_SHUTDOWN_NOTIFY_OID_W := "1.2.840.113556.1.4.1907"

/**
 * @type {String}
 */
export global LDAP_SERVER_LAZY_COMMIT_OID := "1.2.840.113556.1.4.619"

/**
 * @type {String}
 */
export global LDAP_SERVER_LAZY_COMMIT_OID_W := "1.2.840.113556.1.4.619"

/**
 * @type {String}
 */
export global LDAP_SERVER_SD_FLAGS_OID := "1.2.840.113556.1.4.801"

/**
 * @type {String}
 */
export global LDAP_SERVER_SD_FLAGS_OID_W := "1.2.840.113556.1.4.801"

/**
 * @type {String}
 */
export global LDAP_SERVER_TREE_DELETE_EX_OID := "1.2.840.113556.1.4.2204"

/**
 * @type {String}
 */
export global LDAP_SERVER_TREE_DELETE_EX_OID_W := "1.2.840.113556.1.4.2204"

/**
 * @type {String}
 */
export global LDAP_SERVER_TREE_DELETE_OID := "1.2.840.113556.1.4.805"

/**
 * @type {String}
 */
export global LDAP_SERVER_TREE_DELETE_OID_W := "1.2.840.113556.1.4.805"

/**
 * @type {String}
 */
export global LDAP_SERVER_ASQ_OID := "1.2.840.113556.1.4.1504"

/**
 * @type {String}
 */
export global LDAP_SERVER_ASQ_OID_W := "1.2.840.113556.1.4.1504"

/**
 * @type {String}
 */
export global LDAP_SERVER_DIRSYNC_OID := "1.2.840.113556.1.4.841"

/**
 * @type {String}
 */
export global LDAP_SERVER_DIRSYNC_OID_W := "1.2.840.113556.1.4.841"

/**
 * @type {String}
 */
export global LDAP_SERVER_DIRSYNC_EX_OID := "1.2.840.113556.1.4.2090"

/**
 * @type {String}
 */
export global LDAP_SERVER_DIRSYNC_EX_OID_W := "1.2.840.113556.1.4.2090"

/**
 * @type {String}
 */
export global LDAP_SERVER_EXTENDED_DN_OID := "1.2.840.113556.1.4.529"

/**
 * @type {String}
 */
export global LDAP_SERVER_EXTENDED_DN_OID_W := "1.2.840.113556.1.4.529"

/**
 * @type {String}
 */
export global LDAP_SERVER_VERIFY_NAME_OID := "1.2.840.113556.1.4.1338"

/**
 * @type {String}
 */
export global LDAP_SERVER_VERIFY_NAME_OID_W := "1.2.840.113556.1.4.1338"

/**
 * @type {String}
 */
export global LDAP_SERVER_DOMAIN_SCOPE_OID := "1.2.840.113556.1.4.1339"

/**
 * @type {String}
 */
export global LDAP_SERVER_DOMAIN_SCOPE_OID_W := "1.2.840.113556.1.4.1339"

/**
 * @type {String}
 */
export global LDAP_SERVER_SEARCH_OPTIONS_OID := "1.2.840.113556.1.4.1340"

/**
 * @type {String}
 */
export global LDAP_SERVER_SEARCH_OPTIONS_OID_W := "1.2.840.113556.1.4.1340"

/**
 * @type {Integer (UInt32)}
 */
export global SERVER_SEARCH_FLAG_DOMAIN_SCOPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVER_SEARCH_FLAG_PHANTOM_ROOT := 2

/**
 * @type {String}
 */
export global LDAP_SERVER_QUOTA_CONTROL_OID := "1.2.840.113556.1.4.1852"

/**
 * @type {String}
 */
export global LDAP_SERVER_QUOTA_CONTROL_OID_W := "1.2.840.113556.1.4.1852"

/**
 * @type {String}
 */
export global LDAP_SERVER_RANGE_RETRIEVAL_NOERR_OID := "1.2.840.113556.1.4.1948"

/**
 * @type {String}
 */
export global LDAP_SERVER_RANGE_RETRIEVAL_NOERR_OID_W := "1.2.840.113556.1.4.1948"

/**
 * @type {String}
 */
export global LDAP_SERVER_DN_INPUT_OID := "1.2.840.113556.1.4.2026"

/**
 * @type {String}
 */
export global LDAP_SERVER_DN_INPUT_OID_W := "1.2.840.113556.1.4.2026"

/**
 * @type {String}
 */
export global LDAP_SERVER_SET_OWNER_OID := "1.2.840.113556.1.4.2255"

/**
 * @type {String}
 */
export global LDAP_SERVER_SET_OWNER_OID_W := "1.2.840.113556.1.4.2255"

/**
 * @type {String}
 */
export global LDAP_SERVER_BYPASS_QUOTA_OID := "1.2.840.113556.1.4.2256"

/**
 * @type {String}
 */
export global LDAP_SERVER_BYPASS_QUOTA_OID_W := "1.2.840.113556.1.4.2256"

/**
 * @type {String}
 */
export global LDAP_SERVER_LINK_TTL_OID := "1.2.840.113556.1.4.2309"

/**
 * @type {String}
 */
export global LDAP_SERVER_LINK_TTL_OID_W := "1.2.840.113556.1.4.2309"

/**
 * @type {String}
 */
export global LDAP_OPATT_BECOME_DOM_MASTER := "becomeDomainMaster"

/**
 * @type {String}
 */
export global LDAP_OPATT_BECOME_DOM_MASTER_W := "becomeDomainMaster"

/**
 * @type {String}
 */
export global LDAP_OPATT_BECOME_RID_MASTER := "becomeRidMaster"

/**
 * @type {String}
 */
export global LDAP_OPATT_BECOME_RID_MASTER_W := "becomeRidMaster"

/**
 * @type {String}
 */
export global LDAP_OPATT_BECOME_SCHEMA_MASTER := "becomeSchemaMaster"

/**
 * @type {String}
 */
export global LDAP_OPATT_BECOME_SCHEMA_MASTER_W := "becomeSchemaMaster"

/**
 * @type {String}
 */
export global LDAP_OPATT_RECALC_HIERARCHY := "recalcHierarchy"

/**
 * @type {String}
 */
export global LDAP_OPATT_RECALC_HIERARCHY_W := "recalcHierarchy"

/**
 * @type {String}
 */
export global LDAP_OPATT_SCHEMA_UPDATE_NOW := "schemaUpdateNow"

/**
 * @type {String}
 */
export global LDAP_OPATT_SCHEMA_UPDATE_NOW_W := "schemaUpdateNow"

/**
 * @type {String}
 */
export global LDAP_OPATT_BECOME_PDC := "becomePdc"

/**
 * @type {String}
 */
export global LDAP_OPATT_BECOME_PDC_W := "becomePdc"

/**
 * @type {String}
 */
export global LDAP_OPATT_FIXUP_INHERITANCE := "fixupInheritance"

/**
 * @type {String}
 */
export global LDAP_OPATT_FIXUP_INHERITANCE_W := "fixupInheritance"

/**
 * @type {String}
 */
export global LDAP_OPATT_INVALIDATE_RID_POOL := "invalidateRidPool"

/**
 * @type {String}
 */
export global LDAP_OPATT_INVALIDATE_RID_POOL_W := "invalidateRidPool"

/**
 * @type {String}
 */
export global LDAP_OPATT_ABANDON_REPL := "abandonReplication"

/**
 * @type {String}
 */
export global LDAP_OPATT_ABANDON_REPL_W := "abandonReplication"

/**
 * @type {String}
 */
export global LDAP_OPATT_DO_GARBAGE_COLLECTION := "doGarbageCollection"

/**
 * @type {String}
 */
export global LDAP_OPATT_DO_GARBAGE_COLLECTION_W := "doGarbageCollection"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUBSCHEMA_SUBENTRY := "subschemaSubentry"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUBSCHEMA_SUBENTRY_W := "subschemaSubentry"

/**
 * @type {String}
 */
export global LDAP_OPATT_CURRENT_TIME := "currentTime"

/**
 * @type {String}
 */
export global LDAP_OPATT_CURRENT_TIME_W := "currentTime"

/**
 * @type {String}
 */
export global LDAP_OPATT_SERVER_NAME := "serverName"

/**
 * @type {String}
 */
export global LDAP_OPATT_SERVER_NAME_W := "serverName"

/**
 * @type {String}
 */
export global LDAP_OPATT_NAMING_CONTEXTS := "namingContexts"

/**
 * @type {String}
 */
export global LDAP_OPATT_NAMING_CONTEXTS_W := "namingContexts"

/**
 * @type {String}
 */
export global LDAP_OPATT_DEFAULT_NAMING_CONTEXT := "defaultNamingContext"

/**
 * @type {String}
 */
export global LDAP_OPATT_DEFAULT_NAMING_CONTEXT_W := "defaultNamingContext"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_CONTROL := "supportedControl"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_CONTROL_W := "supportedControl"

/**
 * @type {String}
 */
export global LDAP_OPATT_HIGHEST_COMMITTED_USN := "highestCommitedUSN"

/**
 * @type {String}
 */
export global LDAP_OPATT_HIGHEST_COMMITTED_USN_W := "highestCommitedUSN"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_LDAP_VERSION := "supportedLDAPVersion"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_LDAP_VERSION_W := "supportedLDAPVersion"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_LDAP_POLICIES := "supportedLDAPPolicies"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_LDAP_POLICIES_W := "supportedLDAPPolicies"

/**
 * @type {String}
 */
export global LDAP_OPATT_SCHEMA_NAMING_CONTEXT := "schemaNamingContext"

/**
 * @type {String}
 */
export global LDAP_OPATT_SCHEMA_NAMING_CONTEXT_W := "schemaNamingContext"

/**
 * @type {String}
 */
export global LDAP_OPATT_CONFIG_NAMING_CONTEXT := "configurationNamingContext"

/**
 * @type {String}
 */
export global LDAP_OPATT_CONFIG_NAMING_CONTEXT_W := "configurationNamingContext"

/**
 * @type {String}
 */
export global LDAP_OPATT_ROOT_DOMAIN_NAMING_CONTEXT := "rootDomainNamingContext"

/**
 * @type {String}
 */
export global LDAP_OPATT_ROOT_DOMAIN_NAMING_CONTEXT_W := "rootDomainNamingContext"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_SASL_MECHANISM := "supportedSASLMechanisms"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_SASL_MECHANISM_W := "supportedSASLMechanisms"

/**
 * @type {String}
 */
export global LDAP_OPATT_DNS_HOST_NAME := "dnsHostName"

/**
 * @type {String}
 */
export global LDAP_OPATT_DNS_HOST_NAME_W := "dnsHostName"

/**
 * @type {String}
 */
export global LDAP_OPATT_LDAP_SERVICE_NAME := "ldapServiceName"

/**
 * @type {String}
 */
export global LDAP_OPATT_LDAP_SERVICE_NAME_W := "ldapServiceName"

/**
 * @type {String}
 */
export global LDAP_OPATT_DS_SERVICE_NAME := "dsServiceName"

/**
 * @type {String}
 */
export global LDAP_OPATT_DS_SERVICE_NAME_W := "dsServiceName"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_CAPABILITIES := "supportedCapabilities"

/**
 * @type {String}
 */
export global LDAP_OPATT_SUPPORTED_CAPABILITIES_W := "supportedCapabilities"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_OID := "1.2.840.113556.1.4.800"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_OID_W := "1.2.840.113556.1.4.800"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_V51_OID := "1.2.840.113556.1.4.1670"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_V51_OID_W := "1.2.840.113556.1.4.1670"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_LDAP_INTEG_OID := "1.2.840.113556.1.4.1791"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_LDAP_INTEG_OID_W := "1.2.840.113556.1.4.1791"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_ADAM_OID := "1.2.840.113556.1.4.1851"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_ADAM_OID_W := "1.2.840.113556.1.4.1851"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_PARTIAL_SECRETS_OID := "1.2.840.113556.1.4.1920"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_PARTIAL_SECRETS_OID_W := "1.2.840.113556.1.4.1920"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_V60_OID := "1.2.840.113556.1.4.1935"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_V60_OID_W := "1.2.840.113556.1.4.1935"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_V61_OID := "1.2.840.113556.1.4.1935"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_V61_OID_W := "1.2.840.113556.1.4.1935"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_V61_R2_OID := "1.2.840.113556.1.4.2080"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_V61_R2_OID_W := "1.2.840.113556.1.4.2080"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_W8_OID := "1.2.840.113556.1.4.2237"

/**
 * @type {String}
 */
export global LDAP_CAP_ACTIVE_DIRECTORY_W8_OID_W := "1.2.840.113556.1.4.2237"

/**
 * @type {String}
 */
export global LDAP_MATCHING_RULE_BIT_AND := "1.2.840.113556.1.4.803"

/**
 * @type {String}
 */
export global LDAP_MATCHING_RULE_BIT_AND_W := "1.2.840.113556.1.4.803"

/**
 * @type {String}
 */
export global LDAP_MATCHING_RULE_BIT_OR := "1.2.840.113556.1.4.804"

/**
 * @type {String}
 */
export global LDAP_MATCHING_RULE_BIT_OR_W := "1.2.840.113556.1.4.804"

/**
 * @type {String}
 */
export global LDAP_MATCHING_RULE_TRANSITIVE_EVALUATION := "1.2.840.113556.1.4.1941"

/**
 * @type {String}
 */
export global LDAP_MATCHING_RULE_TRANSITIVE_EVALUATION_W := "1.2.840.113556.1.4.1941"

/**
 * @type {String}
 */
export global LDAP_MATCHING_RULE_DN_BINARY_COMPLEX := "1.2.840.113556.1.4.2253"

/**
 * @type {String}
 */
export global LDAP_MATCHING_RULE_DN_BINARY_COMPLEX_W := "1.2.840.113556.1.4.2253"

/**
 * @type {String}
 */
export global LDAP_SERVER_FAST_BIND_OID := "1.2.840.113556.1.4.1781"

/**
 * @type {String}
 */
export global LDAP_SERVER_FAST_BIND_OID_W := "1.2.840.113556.1.4.1781"

/**
 * @type {String}
 */
export global LDAP_SERVER_WHO_AM_I_OID := "1.3.6.1.4.1.4203.1.11.3"

/**
 * @type {String}
 */
export global LDAP_SERVER_WHO_AM_I_OID_W := "1.3.6.1.4.1.4203.1.11.3"

/**
 * @type {String}
 */
export global LDAP_SERVER_BATCH_REQUEST_OID := "1.2.840.113556.1.4.2212"

/**
 * @type {String}
 */
export global LDAP_SERVER_BATCH_REQUEST_OID_W := "1.2.840.113556.1.4.2212"

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_DIRSYNC_OBJECT_SECURITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_DIRSYNC_ANCESTORS_FIRST_ORDER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_DIRSYNC_PUBLIC_DATA_ONLY := 8192

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_DIRSYNC_INCREMENTAL_VALUES := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_DIRSYNC_ROPAS_DATA_ONLY := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global LDAP_POLICYHINT_APPLY_FULLPWDPOLICY := 1
;@endregion Constants
