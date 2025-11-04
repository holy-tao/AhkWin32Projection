#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class Ldap {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static LBER_ERROR => -1

    /**
     * @type {Integer (Int32)}
     */
    static LBER_DEFAULT => -1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_UNICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_PORT => 389

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_SSL_PORT => 636

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_GC_PORT => 3268

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_SSL_GC_PORT => 3269

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_VERSION2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_VERSION3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_VERSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_BIND_CMD => 96

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_UNBIND_CMD => 66

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SEARCH_CMD => 99

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_MODIFY_CMD => 102

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_ADD_CMD => 104

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_DELETE_CMD => 74

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_MODRDN_CMD => 108

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_COMPARE_CMD => 110

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_ABANDON_CMD => 80

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SESSION_CMD => 113

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_EXTENDED_CMD => 119

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_BIND => 97

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_SEARCH_ENTRY => 100

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_SEARCH_RESULT => 101

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_MODIFY => 103

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_ADD => 105

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_DELETE => 107

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_MODRDN => 109

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_COMPARE => 111

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_SESSION => 114

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_REFERRAL => 115

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_EXTENDED => 120

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RES_ANY => -1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_INVALID_CMD => 255

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_INVALID_RES => 255

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_AUTH_SIMPLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_AUTH_SASL => 131

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_AUTH_OTHERKIND => 134

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_AND => 160

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_OR => 161

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_NOT => 162

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_EQUALITY => 163

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_SUBSTRINGS => 164

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_GE => 165

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_LE => 166

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_PRESENT => 135

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_APPROX => 168

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FILTER_EXTENSIBLE => 169

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SUBSTRING_INITIAL => 128

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SUBSTRING_ANY => 129

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SUBSTRING_FINAL => 130

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_DEREF_NEVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_DEREF_SEARCHING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_DEREF_FINDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_DEREF_ALWAYS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_NO_LIMIT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_DNS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_CHASE_REFERRALS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_RETURN_REFS => 4

    /**
     * @type {String}
     */
    static LDAP_CONTROL_REFERRALS_W => "1.2.840.113556.1.4.616"

    /**
     * @type {String}
     */
    static LDAP_CONTROL_REFERRALS => "1.2.840.113556.1.4.616"

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_MOD_ADD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_MOD_DELETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_MOD_REPLACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_MOD_BVALUES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_API_INFO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_DESC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_DEREF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SIZELIMIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_TIMELIMIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_THREAD_FN_PTRS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_REBIND_FN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_REBIND_ARG => 7

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_REFERRALS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_RESTART => 9

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SSL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_IO_FN_PTRS => 11

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_CACHE_FN_PTRS => 13

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_CACHE_STRATEGY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_CACHE_ENABLE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_REFERRAL_HOP_LIMIT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_PROTOCOL_VERSION => 17

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_VERSION => 17

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_API_FEATURE_INFO => 21

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_HOST_NAME => 48

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_ERROR_NUMBER => 49

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_ERROR_STRING => 50

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SERVER_ERROR => 51

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SERVER_EXT_ERROR => 52

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_HOST_REACHABLE => 62

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_PING_KEEP_ALIVE => 54

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_PING_WAIT_TIME => 55

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_PING_LIMIT => 56

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_DNSDOMAIN_NAME => 59

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_GETDSNAME_FLAGS => 61

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_PROMPT_CREDENTIALS => 63

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_AUTO_RECONNECT => 145

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SSPI_FLAGS => 146

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SSL_INFO => 147

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_TLS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_TLS_INFO => 147

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SIGN => 149

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_ENCRYPT => 150

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SASL_METHOD => 151

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_AREC_EXCLUSIVE => 152

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SECURITY_CONTEXT => 153

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_ROOTDSE_CACHE => 154

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_TCP_KEEPALIVE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_FAST_CONCURRENT_BIND => 65

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SEND_TIMEOUT => 66

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SCH_FLAGS => 67

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SOCKET_BIND_ADDRESSES => 68

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_CLDAP_TIMEOUT => 69

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_CLDAP_TRIES => 70

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_CHASE_SUBORDINATE_REFERRALS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_CHASE_EXTERNAL_REFERRALS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_SCOPE_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_SCOPE_ONELEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_SCOPE_SUBTREE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_MSG_ONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_MSG_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_MSG_RECEIVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LBER_USE_DER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LBER_USE_INDEFINITE_LEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LBER_TRANSLATE_STRINGS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LAPI_MAJOR_VER1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LAPI_MINOR_VER1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_API_INFO_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_API_VERSION => 2004

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_VERSION_MIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_VERSION_MAX => 3

    /**
     * @type {String}
     */
    static LDAP_VENDOR_NAME => "Microsoft Corporation."

    /**
     * @type {String}
     */
    static LDAP_VENDOR_NAME_W => "Microsoft Corporation."

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_VENDOR_VERSION => 510

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_FEATURE_INFO_VERSION => 1

    /**
     * @type {String}
     */
    static LDAP_SERVER_SORT_OID => "1.2.840.113556.1.4.473"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SORT_OID_W => "1.2.840.113556.1.4.473"

    /**
     * @type {String}
     */
    static LDAP_SERVER_RESP_SORT_OID => "1.2.840.113556.1.4.474"

    /**
     * @type {String}
     */
    static LDAP_SERVER_RESP_SORT_OID_W => "1.2.840.113556.1.4.474"

    /**
     * @type {String}
     */
    static LDAP_PAGED_RESULT_OID_STRING => "1.2.840.113556.1.4.319"

    /**
     * @type {String}
     */
    static LDAP_PAGED_RESULT_OID_STRING_W => "1.2.840.113556.1.4.319"

    /**
     * @type {String}
     */
    static LDAP_CONTROL_VLVREQUEST => "2.16.840.1.113730.3.4.9"

    /**
     * @type {String}
     */
    static LDAP_CONTROL_VLVREQUEST_W => "2.16.840.1.113730.3.4.9"

    /**
     * @type {String}
     */
    static LDAP_CONTROL_VLVRESPONSE => "2.16.840.1.113730.3.4.10"

    /**
     * @type {String}
     */
    static LDAP_CONTROL_VLVRESPONSE_W => "2.16.840.1.113730.3.4.10"

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_API_FEATURE_VIRTUAL_LIST_VIEW => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_VLVINFO_VERSION => 1

    /**
     * @type {String}
     */
    static LDAP_START_TLS_OID => "1.3.6.1.4.1.1466.20037"

    /**
     * @type {String}
     */
    static LDAP_START_TLS_OID_W => "1.3.6.1.4.1.1466.20037"

    /**
     * @type {String}
     */
    static LDAP_TTL_EXTENDED_OP_OID => "1.3.6.1.4.1.1466.101.119.1"

    /**
     * @type {String}
     */
    static LDAP_TTL_EXTENDED_OP_OID_W => "1.3.6.1.4.1.1466.101.119.1"

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_REFERRAL_CALLBACK => 112

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_CLIENT_CERTIFICATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_SERVER_CERTIFICATE => 129

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_OPT_REF_DEREF_CONN_PER_MSG => 148

    /**
     * @type {String}
     */
    static LDAP_SERVER_FORCE_UPDATE_OID => "1.2.840.113556.1.4.1974"

    /**
     * @type {String}
     */
    static LDAP_SERVER_FORCE_UPDATE_OID_W => "1.2.840.113556.1.4.1974"

    /**
     * @type {String}
     */
    static LDAP_SERVER_PERMISSIVE_MODIFY_OID => "1.2.840.113556.1.4.1413"

    /**
     * @type {String}
     */
    static LDAP_SERVER_PERMISSIVE_MODIFY_OID_W => "1.2.840.113556.1.4.1413"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SHOW_DELETED_OID => "1.2.840.113556.1.4.417"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SHOW_DELETED_OID_W => "1.2.840.113556.1.4.417"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SHOW_RECYCLED_OID => "1.2.840.113556.1.4.2064"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SHOW_RECYCLED_OID_W => "1.2.840.113556.1.4.2064"

    /**
     * @type {String}
     */
    static LDAP_SERVER_EXPECTED_ENTRY_COUNT_OID => "1.2.840.113556.1.4.2211"

    /**
     * @type {String}
     */
    static LDAP_SERVER_EXPECTED_ENTRY_COUNT_OID_W => "1.2.840.113556.1.4.2211"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SEARCH_HINTS_OID => "1.2.840.113556.1.4.2206"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SEARCH_HINTS_OID_W => "1.2.840.113556.1.4.2206"

    /**
     * @type {String}
     */
    static LDAP_SEARCH_HINT_INDEX_ONLY_OID => "1.2.840.113556.1.4.2207"

    /**
     * @type {String}
     */
    static LDAP_SEARCH_HINT_INDEX_ONLY_OID_W => "1.2.840.113556.1.4.2207"

    /**
     * @type {String}
     */
    static LDAP_SEARCH_HINT_SOFT_SIZE_LIMIT_OID => "1.2.840.113556.1.4.2210"

    /**
     * @type {String}
     */
    static LDAP_SEARCH_HINT_SOFT_SIZE_LIMIT_OID_W => "1.2.840.113556.1.4.2210"

    /**
     * @type {String}
     */
    static LDAP_SEARCH_HINT_REQUIRED_INDEX_OID => "1.2.840.113556.1.4.2306"

    /**
     * @type {String}
     */
    static LDAP_SEARCH_HINT_REQUIRED_INDEX_OID_W => "1.2.840.113556.1.4.2306"

    /**
     * @type {String}
     */
    static LDAP_SERVER_UPDATE_STATS_OID => "1.2.840.113556.1.4.2205"

    /**
     * @type {String}
     */
    static LDAP_SERVER_UPDATE_STATS_OID_W => "1.2.840.113556.1.4.2205"

    /**
     * @type {String}
     */
    static LDAP_UPDATE_STATS_USN_OID => "1.2.840.113556.1.4.2208"

    /**
     * @type {String}
     */
    static LDAP_UPDATE_STATS_USN_OID_W => "1.2.840.113556.1.4.2208"

    /**
     * @type {String}
     */
    static LDAP_UPDATE_STATS_INVOCATIONID_OID => "1.2.840.113556.1.4.2209"

    /**
     * @type {String}
     */
    static LDAP_UPDATE_STATS_INVOCATIONID_OID_W => "1.2.840.113556.1.4.2209"

    /**
     * @type {String}
     */
    static LDAP_SERVER_GET_STATS_OID => "1.2.840.113556.1.4.970"

    /**
     * @type {String}
     */
    static LDAP_SERVER_GET_STATS_OID_W => "1.2.840.113556.1.4.970"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SHOW_DEACTIVATED_LINK_OID => "1.2.840.113556.1.4.2065"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SHOW_DEACTIVATED_LINK_OID_W => "1.2.840.113556.1.4.2065"

    /**
     * @type {String}
     */
    static LDAP_SERVER_POLICY_HINTS_DEPRECATED_OID => "1.2.840.113556.1.4.2066"

    /**
     * @type {String}
     */
    static LDAP_SERVER_POLICY_HINTS_DEPRECATED_OID_W => "1.2.840.113556.1.4.2066"

    /**
     * @type {String}
     */
    static LDAP_SERVER_POLICY_HINTS_OID => "1.2.840.113556.1.4.2239"

    /**
     * @type {String}
     */
    static LDAP_SERVER_POLICY_HINTS_OID_W => "1.2.840.113556.1.4.2239"

    /**
     * @type {String}
     */
    static LDAP_SERVER_RANGE_OPTION_OID => "1.2.840.113556.1.4.802"

    /**
     * @type {String}
     */
    static LDAP_SERVER_RANGE_OPTION_OID_W => "1.2.840.113556.1.4.802"

    /**
     * @type {String}
     */
    static LDAP_SERVER_CROSSDOM_MOVE_TARGET_OID => "1.2.840.113556.1.4.521"

    /**
     * @type {String}
     */
    static LDAP_SERVER_CROSSDOM_MOVE_TARGET_OID_W => "1.2.840.113556.1.4.521"

    /**
     * @type {String}
     */
    static LDAP_SERVER_NOTIFICATION_OID => "1.2.840.113556.1.4.528"

    /**
     * @type {String}
     */
    static LDAP_SERVER_NOTIFICATION_OID_W => "1.2.840.113556.1.4.528"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SHUTDOWN_NOTIFY_OID => "1.2.840.113556.1.4.1907"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SHUTDOWN_NOTIFY_OID_W => "1.2.840.113556.1.4.1907"

    /**
     * @type {String}
     */
    static LDAP_SERVER_LAZY_COMMIT_OID => "1.2.840.113556.1.4.619"

    /**
     * @type {String}
     */
    static LDAP_SERVER_LAZY_COMMIT_OID_W => "1.2.840.113556.1.4.619"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SD_FLAGS_OID => "1.2.840.113556.1.4.801"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SD_FLAGS_OID_W => "1.2.840.113556.1.4.801"

    /**
     * @type {String}
     */
    static LDAP_SERVER_TREE_DELETE_EX_OID => "1.2.840.113556.1.4.2204"

    /**
     * @type {String}
     */
    static LDAP_SERVER_TREE_DELETE_EX_OID_W => "1.2.840.113556.1.4.2204"

    /**
     * @type {String}
     */
    static LDAP_SERVER_TREE_DELETE_OID => "1.2.840.113556.1.4.805"

    /**
     * @type {String}
     */
    static LDAP_SERVER_TREE_DELETE_OID_W => "1.2.840.113556.1.4.805"

    /**
     * @type {String}
     */
    static LDAP_SERVER_ASQ_OID => "1.2.840.113556.1.4.1504"

    /**
     * @type {String}
     */
    static LDAP_SERVER_ASQ_OID_W => "1.2.840.113556.1.4.1504"

    /**
     * @type {String}
     */
    static LDAP_SERVER_DIRSYNC_OID => "1.2.840.113556.1.4.841"

    /**
     * @type {String}
     */
    static LDAP_SERVER_DIRSYNC_OID_W => "1.2.840.113556.1.4.841"

    /**
     * @type {String}
     */
    static LDAP_SERVER_DIRSYNC_EX_OID => "1.2.840.113556.1.4.2090"

    /**
     * @type {String}
     */
    static LDAP_SERVER_DIRSYNC_EX_OID_W => "1.2.840.113556.1.4.2090"

    /**
     * @type {String}
     */
    static LDAP_SERVER_EXTENDED_DN_OID => "1.2.840.113556.1.4.529"

    /**
     * @type {String}
     */
    static LDAP_SERVER_EXTENDED_DN_OID_W => "1.2.840.113556.1.4.529"

    /**
     * @type {String}
     */
    static LDAP_SERVER_VERIFY_NAME_OID => "1.2.840.113556.1.4.1338"

    /**
     * @type {String}
     */
    static LDAP_SERVER_VERIFY_NAME_OID_W => "1.2.840.113556.1.4.1338"

    /**
     * @type {String}
     */
    static LDAP_SERVER_DOMAIN_SCOPE_OID => "1.2.840.113556.1.4.1339"

    /**
     * @type {String}
     */
    static LDAP_SERVER_DOMAIN_SCOPE_OID_W => "1.2.840.113556.1.4.1339"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SEARCH_OPTIONS_OID => "1.2.840.113556.1.4.1340"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SEARCH_OPTIONS_OID_W => "1.2.840.113556.1.4.1340"

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_SEARCH_FLAG_DOMAIN_SCOPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVER_SEARCH_FLAG_PHANTOM_ROOT => 2

    /**
     * @type {String}
     */
    static LDAP_SERVER_QUOTA_CONTROL_OID => "1.2.840.113556.1.4.1852"

    /**
     * @type {String}
     */
    static LDAP_SERVER_QUOTA_CONTROL_OID_W => "1.2.840.113556.1.4.1852"

    /**
     * @type {String}
     */
    static LDAP_SERVER_RANGE_RETRIEVAL_NOERR_OID => "1.2.840.113556.1.4.1948"

    /**
     * @type {String}
     */
    static LDAP_SERVER_RANGE_RETRIEVAL_NOERR_OID_W => "1.2.840.113556.1.4.1948"

    /**
     * @type {String}
     */
    static LDAP_SERVER_DN_INPUT_OID => "1.2.840.113556.1.4.2026"

    /**
     * @type {String}
     */
    static LDAP_SERVER_DN_INPUT_OID_W => "1.2.840.113556.1.4.2026"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SET_OWNER_OID => "1.2.840.113556.1.4.2255"

    /**
     * @type {String}
     */
    static LDAP_SERVER_SET_OWNER_OID_W => "1.2.840.113556.1.4.2255"

    /**
     * @type {String}
     */
    static LDAP_SERVER_BYPASS_QUOTA_OID => "1.2.840.113556.1.4.2256"

    /**
     * @type {String}
     */
    static LDAP_SERVER_BYPASS_QUOTA_OID_W => "1.2.840.113556.1.4.2256"

    /**
     * @type {String}
     */
    static LDAP_SERVER_LINK_TTL_OID => "1.2.840.113556.1.4.2309"

    /**
     * @type {String}
     */
    static LDAP_SERVER_LINK_TTL_OID_W => "1.2.840.113556.1.4.2309"

    /**
     * @type {String}
     */
    static LDAP_OPATT_BECOME_DOM_MASTER => "becomeDomainMaster"

    /**
     * @type {String}
     */
    static LDAP_OPATT_BECOME_DOM_MASTER_W => "becomeDomainMaster"

    /**
     * @type {String}
     */
    static LDAP_OPATT_BECOME_RID_MASTER => "becomeRidMaster"

    /**
     * @type {String}
     */
    static LDAP_OPATT_BECOME_RID_MASTER_W => "becomeRidMaster"

    /**
     * @type {String}
     */
    static LDAP_OPATT_BECOME_SCHEMA_MASTER => "becomeSchemaMaster"

    /**
     * @type {String}
     */
    static LDAP_OPATT_BECOME_SCHEMA_MASTER_W => "becomeSchemaMaster"

    /**
     * @type {String}
     */
    static LDAP_OPATT_RECALC_HIERARCHY => "recalcHierarchy"

    /**
     * @type {String}
     */
    static LDAP_OPATT_RECALC_HIERARCHY_W => "recalcHierarchy"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SCHEMA_UPDATE_NOW => "schemaUpdateNow"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SCHEMA_UPDATE_NOW_W => "schemaUpdateNow"

    /**
     * @type {String}
     */
    static LDAP_OPATT_BECOME_PDC => "becomePdc"

    /**
     * @type {String}
     */
    static LDAP_OPATT_BECOME_PDC_W => "becomePdc"

    /**
     * @type {String}
     */
    static LDAP_OPATT_FIXUP_INHERITANCE => "fixupInheritance"

    /**
     * @type {String}
     */
    static LDAP_OPATT_FIXUP_INHERITANCE_W => "fixupInheritance"

    /**
     * @type {String}
     */
    static LDAP_OPATT_INVALIDATE_RID_POOL => "invalidateRidPool"

    /**
     * @type {String}
     */
    static LDAP_OPATT_INVALIDATE_RID_POOL_W => "invalidateRidPool"

    /**
     * @type {String}
     */
    static LDAP_OPATT_ABANDON_REPL => "abandonReplication"

    /**
     * @type {String}
     */
    static LDAP_OPATT_ABANDON_REPL_W => "abandonReplication"

    /**
     * @type {String}
     */
    static LDAP_OPATT_DO_GARBAGE_COLLECTION => "doGarbageCollection"

    /**
     * @type {String}
     */
    static LDAP_OPATT_DO_GARBAGE_COLLECTION_W => "doGarbageCollection"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUBSCHEMA_SUBENTRY => "subschemaSubentry"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUBSCHEMA_SUBENTRY_W => "subschemaSubentry"

    /**
     * @type {String}
     */
    static LDAP_OPATT_CURRENT_TIME => "currentTime"

    /**
     * @type {String}
     */
    static LDAP_OPATT_CURRENT_TIME_W => "currentTime"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SERVER_NAME => "serverName"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SERVER_NAME_W => "serverName"

    /**
     * @type {String}
     */
    static LDAP_OPATT_NAMING_CONTEXTS => "namingContexts"

    /**
     * @type {String}
     */
    static LDAP_OPATT_NAMING_CONTEXTS_W => "namingContexts"

    /**
     * @type {String}
     */
    static LDAP_OPATT_DEFAULT_NAMING_CONTEXT => "defaultNamingContext"

    /**
     * @type {String}
     */
    static LDAP_OPATT_DEFAULT_NAMING_CONTEXT_W => "defaultNamingContext"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_CONTROL => "supportedControl"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_CONTROL_W => "supportedControl"

    /**
     * @type {String}
     */
    static LDAP_OPATT_HIGHEST_COMMITTED_USN => "highestCommitedUSN"

    /**
     * @type {String}
     */
    static LDAP_OPATT_HIGHEST_COMMITTED_USN_W => "highestCommitedUSN"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_LDAP_VERSION => "supportedLDAPVersion"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_LDAP_VERSION_W => "supportedLDAPVersion"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_LDAP_POLICIES => "supportedLDAPPolicies"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_LDAP_POLICIES_W => "supportedLDAPPolicies"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SCHEMA_NAMING_CONTEXT => "schemaNamingContext"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SCHEMA_NAMING_CONTEXT_W => "schemaNamingContext"

    /**
     * @type {String}
     */
    static LDAP_OPATT_CONFIG_NAMING_CONTEXT => "configurationNamingContext"

    /**
     * @type {String}
     */
    static LDAP_OPATT_CONFIG_NAMING_CONTEXT_W => "configurationNamingContext"

    /**
     * @type {String}
     */
    static LDAP_OPATT_ROOT_DOMAIN_NAMING_CONTEXT => "rootDomainNamingContext"

    /**
     * @type {String}
     */
    static LDAP_OPATT_ROOT_DOMAIN_NAMING_CONTEXT_W => "rootDomainNamingContext"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_SASL_MECHANISM => "supportedSASLMechanisms"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_SASL_MECHANISM_W => "supportedSASLMechanisms"

    /**
     * @type {String}
     */
    static LDAP_OPATT_DNS_HOST_NAME => "dnsHostName"

    /**
     * @type {String}
     */
    static LDAP_OPATT_DNS_HOST_NAME_W => "dnsHostName"

    /**
     * @type {String}
     */
    static LDAP_OPATT_LDAP_SERVICE_NAME => "ldapServiceName"

    /**
     * @type {String}
     */
    static LDAP_OPATT_LDAP_SERVICE_NAME_W => "ldapServiceName"

    /**
     * @type {String}
     */
    static LDAP_OPATT_DS_SERVICE_NAME => "dsServiceName"

    /**
     * @type {String}
     */
    static LDAP_OPATT_DS_SERVICE_NAME_W => "dsServiceName"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_CAPABILITIES => "supportedCapabilities"

    /**
     * @type {String}
     */
    static LDAP_OPATT_SUPPORTED_CAPABILITIES_W => "supportedCapabilities"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_OID => "1.2.840.113556.1.4.800"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_OID_W => "1.2.840.113556.1.4.800"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_V51_OID => "1.2.840.113556.1.4.1670"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_V51_OID_W => "1.2.840.113556.1.4.1670"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_LDAP_INTEG_OID => "1.2.840.113556.1.4.1791"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_LDAP_INTEG_OID_W => "1.2.840.113556.1.4.1791"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_ADAM_OID => "1.2.840.113556.1.4.1851"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_ADAM_OID_W => "1.2.840.113556.1.4.1851"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_PARTIAL_SECRETS_OID => "1.2.840.113556.1.4.1920"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_PARTIAL_SECRETS_OID_W => "1.2.840.113556.1.4.1920"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_V60_OID => "1.2.840.113556.1.4.1935"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_V60_OID_W => "1.2.840.113556.1.4.1935"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_V61_OID => "1.2.840.113556.1.4.1935"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_V61_OID_W => "1.2.840.113556.1.4.1935"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_V61_R2_OID => "1.2.840.113556.1.4.2080"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_V61_R2_OID_W => "1.2.840.113556.1.4.2080"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_W8_OID => "1.2.840.113556.1.4.2237"

    /**
     * @type {String}
     */
    static LDAP_CAP_ACTIVE_DIRECTORY_W8_OID_W => "1.2.840.113556.1.4.2237"

    /**
     * @type {String}
     */
    static LDAP_MATCHING_RULE_BIT_AND => "1.2.840.113556.1.4.803"

    /**
     * @type {String}
     */
    static LDAP_MATCHING_RULE_BIT_AND_W => "1.2.840.113556.1.4.803"

    /**
     * @type {String}
     */
    static LDAP_MATCHING_RULE_BIT_OR => "1.2.840.113556.1.4.804"

    /**
     * @type {String}
     */
    static LDAP_MATCHING_RULE_BIT_OR_W => "1.2.840.113556.1.4.804"

    /**
     * @type {String}
     */
    static LDAP_MATCHING_RULE_TRANSITIVE_EVALUATION => "1.2.840.113556.1.4.1941"

    /**
     * @type {String}
     */
    static LDAP_MATCHING_RULE_TRANSITIVE_EVALUATION_W => "1.2.840.113556.1.4.1941"

    /**
     * @type {String}
     */
    static LDAP_MATCHING_RULE_DN_BINARY_COMPLEX => "1.2.840.113556.1.4.2253"

    /**
     * @type {String}
     */
    static LDAP_MATCHING_RULE_DN_BINARY_COMPLEX_W => "1.2.840.113556.1.4.2253"

    /**
     * @type {String}
     */
    static LDAP_SERVER_FAST_BIND_OID => "1.2.840.113556.1.4.1781"

    /**
     * @type {String}
     */
    static LDAP_SERVER_FAST_BIND_OID_W => "1.2.840.113556.1.4.1781"

    /**
     * @type {String}
     */
    static LDAP_SERVER_WHO_AM_I_OID => "1.3.6.1.4.1.4203.1.11.3"

    /**
     * @type {String}
     */
    static LDAP_SERVER_WHO_AM_I_OID_W => "1.3.6.1.4.1.4203.1.11.3"

    /**
     * @type {String}
     */
    static LDAP_SERVER_BATCH_REQUEST_OID => "1.2.840.113556.1.4.2212"

    /**
     * @type {String}
     */
    static LDAP_SERVER_BATCH_REQUEST_OID_W => "1.2.840.113556.1.4.2212"

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_DIRSYNC_OBJECT_SECURITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_DIRSYNC_ANCESTORS_FIRST_ORDER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_DIRSYNC_PUBLIC_DATA_ONLY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_DIRSYNC_INCREMENTAL_VALUES => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_DIRSYNC_ROPAS_DATA_ONLY => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static LDAP_POLICYHINT_APPLY_FULLPWDPOLICY => 1
;@endregion Constants

;@region Methods
    /**
     * ldap_open is not recommended for use.
     * @param {PWSTR} HostName A pointer to a null-terminated string. A domain name, a list of host names, or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made. Be aware that only <b>ldap_open</b> attempts to make the connection before returning to the caller. The function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> does not connect to the LDAP server.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. The default LDAP port, 389, can be obtained by supplying the constant <b>LDAP_PORT</b>. If a host name includes a port number then this parameter is ignored.
     * @returns {Pointer<LDAP>} If the function succeeds, it returns a session handle, in the form of a pointer to an LDAP data structure. Free the session handle, when no longer required,  with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a>.
     * 
     * If the function fails, it returns <b>NULL</b>. Use the 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> function to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_openw
     * @since windows6.0.6000
     */
    static ldap_openW(HostName, PortNumber) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        result := DllCall("WLDAP32.dll\ldap_openW", "ptr", HostName, "uint", PortNumber, "CDecl ptr")
        return result
    }

    /**
     * ldap_open is not recommended for use.
     * @param {PSTR} HostName A pointer to a null-terminated string. A domain name, a list of host names, or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made. Be aware that only <b>ldap_open</b> attempts to make the connection before returning to the caller. The function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> does not connect to the LDAP server.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. The default LDAP port, 389, can be obtained by supplying the constant <b>LDAP_PORT</b>. If a host name includes a port number then this parameter is ignored.
     * @returns {Pointer<LDAP>} If the function succeeds, it returns a session handle, in the form of a pointer to an LDAP data structure. Free the session handle, when no longer required,  with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a>.
     * 
     * If the function fails, it returns <b>NULL</b>. Use the 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> function to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_opena
     * @since windows6.0.6000
     */
    static ldap_openA(HostName, PortNumber) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        result := DllCall("WLDAP32.dll\ldap_openA", "ptr", HostName, "uint", PortNumber, "CDecl ptr")
        return result
    }

    /**
     * Initializes a session with an LDAP server.
     * @param {PWSTR} HostName A pointer to a null-terminated string that contains a domain name, or a space-separated list of host names or dotted strings that represent the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:). For more information about the use of the <b>LDAP_OPT_AREC_EXCLUSIVE</b> option when connecting to Active Directory servers, see the Remarks section.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_PORT</b> to obtain the default port, 389. This parameter is ignored if a host name includes a port number.
     * @returns {Pointer<LDAP>} If the function succeeds, it returns a session handle, in the form of a pointer to an 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. The session handle must be freed with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer required.
     * 
     * If the function fails, it returns <b>NULL</b>. Use 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_initw
     * @since windows6.0.6000
     */
    static ldap_initW(HostName, PortNumber) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        result := DllCall("WLDAP32.dll\ldap_initW", "ptr", HostName, "uint", PortNumber, "CDecl ptr")
        return result
    }

    /**
     * Initializes a session with an LDAP server.
     * @param {PSTR} HostName A pointer to a null-terminated string that contains a domain name, or a space-separated list of host names or dotted strings that represent the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:). For more information about the use of the <b>LDAP_OPT_AREC_EXCLUSIVE</b> option when connecting to Active Directory servers, see the Remarks section.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_PORT</b> to obtain the default port, 389. This parameter is ignored if a host name includes a port number.
     * @returns {Pointer<LDAP>} If the function succeeds, it returns a session handle, in the form of a pointer to an 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. The session handle must be freed with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer required.
     * 
     * If the function fails, it returns <b>NULL</b>. Use 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_inita
     * @since windows6.0.6000
     */
    static ldap_initA(HostName, PortNumber) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        result := DllCall("WLDAP32.dll\ldap_initA", "ptr", HostName, "uint", PortNumber, "CDecl ptr")
        return result
    }

    /**
     * Initializes a Secure Sockets Layer (SSL) session with an LDAP server.
     * @param {PWSTR} HostName A pointer to a null-terminated string that contains a space-separated list of host names or dotted strings representing the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:) character.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_SSL_PORT</b> to obtain the default port, 636. This parameter is ignored if a host name includes a port number.
     * @param {Integer} secure If nonzero, the function uses SSL encryption. If the value is 0, the function establishes a plain TCP connection and uses clear text (no encryption).
     * @returns {Pointer<LDAP>} If the function succeeds, it returns a session handle, in the form of a pointer to an 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> structure. The session handle must be freed with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer needed.
     * 
     * If the function fails, the return value is <b>NULL</b>. Use 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_sslinitw
     * @since windows6.0.6000
     */
    static ldap_sslinitW(HostName, PortNumber, secure) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        result := DllCall("WLDAP32.dll\ldap_sslinitW", "ptr", HostName, "uint", PortNumber, "int", secure, "CDecl ptr")
        return result
    }

    /**
     * Initializes a Secure Sockets Layer (SSL) session with an LDAP server.
     * @param {PSTR} HostName A pointer to a null-terminated string that contains a space-separated list of host names or dotted strings representing the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:) character.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_SSL_PORT</b> to obtain the default port, 636. This parameter is ignored if a host name includes a port number.
     * @param {Integer} secure If nonzero, the function uses SSL encryption. If the value is 0, the function establishes a plain TCP connection and uses clear text (no encryption).
     * @returns {Pointer<LDAP>} If the function succeeds, it returns a session handle, in the form of a pointer to an 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> structure. The session handle must be freed with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer needed.
     * 
     * If the function fails, the return value is <b>NULL</b>. Use 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_sslinita
     * @since windows6.0.6000
     */
    static ldap_sslinitA(HostName, PortNumber, secure) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        result := DllCall("WLDAP32.dll\ldap_sslinitA", "ptr", HostName, "uint", PortNumber, "int", secure, "CDecl ptr")
        return result
    }

    /**
     * The ldap_connect function establishes a connection with the server.
     * @param {Pointer<LDAP>} ld The session handle obtained from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a>.
     * @param {Pointer<LDAP_TIMEVAL>} timeout A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_timeval">LDAP_TIMEVAL</a> structure that specifies the number of seconds to spend in an attempt to establish a connection before a timeout. If <b>NULL</b>, the function uses a default timeout value.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_connect
     * @since windows6.0.6000
     */
    static ldap_connect(ld, timeout) {
        result := DllCall("WLDAP32.dll\ldap_connect", "ptr", ld, "ptr", timeout, "CDecl uint")
        return result
    }

    /**
     * ldap_open is not recommended for use.
     * @param {PSTR} HostName A pointer to a null-terminated string. A domain name, a list of host names, or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made. Be aware that only <b>ldap_open</b> attempts to make the connection before returning to the caller. The function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> does not connect to the LDAP server.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. The default LDAP port, 389, can be obtained by supplying the constant <b>LDAP_PORT</b>. If a host name includes a port number then this parameter is ignored.
     * @returns {Pointer<LDAP>} If the function succeeds, it returns a session handle, in the form of a pointer to an LDAP data structure. Free the session handle, when no longer required,  with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a>.
     * 
     * If the function fails, it returns <b>NULL</b>. Use the 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> function to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_open
     * @since windows6.0.6000
     */
    static ldap_open(HostName, PortNumber) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        result := DllCall("WLDAP32.dll\ldap_open", "ptr", HostName, "uint", PortNumber, "CDecl ptr")
        return result
    }

    /**
     * Initializes a session with an LDAP server.
     * @param {PSTR} HostName A pointer to a null-terminated string that contains a domain name, or a space-separated list of host names or dotted strings that represent the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:). For more information about the use of the <b>LDAP_OPT_AREC_EXCLUSIVE</b> option when connecting to Active Directory servers, see the Remarks section.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_PORT</b> to obtain the default port, 389. This parameter is ignored if a host name includes a port number.
     * @returns {Pointer<LDAP>} If the function succeeds, it returns a session handle, in the form of a pointer to an 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. The session handle must be freed with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer required.
     * 
     * If the function fails, it returns <b>NULL</b>. Use 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_init
     * @since windows6.0.6000
     */
    static ldap_init(HostName, PortNumber) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        result := DllCall("WLDAP32.dll\ldap_init", "ptr", HostName, "uint", PortNumber, "CDecl ptr")
        return result
    }

    /**
     * Initializes a Secure Sockets Layer (SSL) session with an LDAP server.
     * @param {PSTR} HostName A pointer to a null-terminated string that contains a space-separated list of host names or dotted strings representing the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:) character.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_SSL_PORT</b> to obtain the default port, 636. This parameter is ignored if a host name includes a port number.
     * @param {Integer} secure If nonzero, the function uses SSL encryption. If the value is 0, the function establishes a plain TCP connection and uses clear text (no encryption).
     * @returns {Pointer<LDAP>} If the function succeeds, it returns a session handle, in the form of a pointer to an 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> structure. The session handle must be freed with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer needed.
     * 
     * If the function fails, the return value is <b>NULL</b>. Use 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_sslinit
     * @since windows6.0.6000
     */
    static ldap_sslinit(HostName, PortNumber, secure) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        result := DllCall("WLDAP32.dll\ldap_sslinit", "ptr", HostName, "uint", PortNumber, "int", secure, "CDecl ptr")
        return result
    }

    /**
     * Establishes a session with an LDAP server over a connectionless User Datagram Protocol (UDP) service.
     * @param {PWSTR} HostName A pointer to a null-terminated string that contains a list of host names or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made.
     * @param {Integer} PortNumber The port number to be used. If no port number is specified, the default is port 389, which is defined as LDAP_PORT. If  port numbers are included in the <i>HostName</i> parameter, this parameter is ignored.
     * @returns {Pointer<LDAP>} If the function succeeds, a session handle, in the form of a pointer to an LDAP structure is returned. Free the session handle with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer required.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get the error code, call 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> or the Win32 function 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-cldap_openw
     * @since windows6.0.6000
     */
    static cldap_openW(HostName, PortNumber) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        A_LastError := 0

        result := DllCall("WLDAP32.dll\cldap_openW", "ptr", HostName, "uint", PortNumber, "CDecl ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Establishes a session with an LDAP server over a connectionless User Datagram Protocol (UDP) service.
     * @param {PSTR} HostName A pointer to a null-terminated string that contains a list of host names or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made.
     * @param {Integer} PortNumber The port number to be used. If no port number is specified, the default is port 389, which is defined as LDAP_PORT. If  port numbers are included in the <i>HostName</i> parameter, this parameter is ignored.
     * @returns {Pointer<LDAP>} If the function succeeds, a session handle, in the form of a pointer to an LDAP structure is returned. Free the session handle with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer required.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get the error code, call 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> or the Win32 function 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-cldap_opena
     * @since windows6.0.6000
     */
    static cldap_openA(HostName, PortNumber) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        A_LastError := 0

        result := DllCall("WLDAP32.dll\cldap_openA", "ptr", HostName, "uint", PortNumber, "CDecl ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Establishes a session with an LDAP server over a connectionless User Datagram Protocol (UDP) service.
     * @param {PSTR} HostName A pointer to a null-terminated string that contains a list of host names or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made.
     * @param {Integer} PortNumber The port number to be used. If no port number is specified, the default is port 389, which is defined as LDAP_PORT. If  port numbers are included in the <i>HostName</i> parameter, this parameter is ignored.
     * @returns {Pointer<LDAP>} If the function succeeds, a session handle, in the form of a pointer to an LDAP structure is returned. Free the session handle with a call to <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer required.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get the error code, call 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> or the Win32 function 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-cldap_open
     * @since windows6.0.6000
     */
    static cldap_open(HostName, PortNumber) {
        HostName := HostName is String ? StrPtr(HostName) : HostName

        A_LastError := 0

        result := DllCall("WLDAP32.dll\cldap_open", "ptr", HostName, "uint", PortNumber, "CDecl ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The ldap_unbind function frees resources associated with an LDAP session.
     * @param {Pointer<LDAP>} ld The session handle.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_unbind
     * @since windows6.0.6000
     */
    static ldap_unbind(ld) {
        result := DllCall("WLDAP32.dll\ldap_unbind", "ptr", ld, "CDecl uint")
        return result
    }

    /**
     * The ldap_unbind_s function synchronously frees resources associated with an LDAP session.
     * @param {Pointer<LDAP>} ld The session handle.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_unbind_s
     * @since windows6.0.6000
     */
    static ldap_unbind_s(ld) {
        result := DllCall("WLDAP32.dll\ldap_unbind_s", "ptr", ld, "CDecl uint")
        return result
    }

    /**
     * Retrieves the current values of session-wide parameters.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} option The name of the option accessed. For more information and  a list of allowable options and their values, see the following Remarks section.
     * @param {Pointer<Void>} outvalue The address of the option value. The actual type of this parameter depends on the setting of the option parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_option
     * @since windows6.0.6000
     */
    static ldap_get_option(ld, option, outvalue) {
        outvalueMarshal := outvalue is VarRef ? "ptr" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_get_option", "ptr", ld, "int", option, outvalueMarshal, outvalue, "CDecl uint")
        return result
    }

    /**
     * Retrieves the current values of session-wide parameters.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} option The name of the option accessed. For more information and  a list of allowable options and their values, see the following Remarks section.
     * @param {Pointer<Void>} outvalue The address of the option value. The actual type of this parameter depends on the setting of the option parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_optionw
     * @since windows6.0.6000
     */
    static ldap_get_optionW(ld, option, outvalue) {
        outvalueMarshal := outvalue is VarRef ? "ptr" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_get_optionW", "ptr", ld, "int", option, outvalueMarshal, outvalue, "CDecl uint")
        return result
    }

    /**
     * Sets options on connection blocks.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} option The name of the option set.
     * @param {Pointer<Void>} invalue A pointer to the value that the option is to be given. The actual type of this parameter depends on the setting of the option parameter. The constants LDAP_OPT_ON and LDAP_OPT_OFF can be given for options that have on or off settings.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_set_option
     * @since windows6.0.6000
     */
    static ldap_set_option(ld, option, invalue) {
        invalueMarshal := invalue is VarRef ? "ptr" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_set_option", "ptr", ld, "int", option, invalueMarshal, invalue, "CDecl uint")
        return result
    }

    /**
     * Sets options on connection blocks.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} option The name of the option set.
     * @param {Pointer<Void>} invalue A pointer to the value that the option is to be given. The actual type of this parameter depends on the setting of the option parameter. The constants LDAP_OPT_ON and LDAP_OPT_OFF can be given for options that have on or off settings.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_set_optionw
     * @since windows6.0.6000
     */
    static ldap_set_optionW(ld, option, invalue) {
        invalueMarshal := invalue is VarRef ? "ptr" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_set_optionW", "ptr", ld, "int", option, invalueMarshal, invalue, "CDecl uint")
        return result
    }

    /**
     * Asynchronously authenticates a client to a server, using a plaintext password.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {PWSTR} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, it returns the message ID of the operation initiated.
     * 
     * If the function fails, it returns -1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_simple_bindw
     * @since windows6.0.6000
     */
    static ldap_simple_bindW(ld, dn, passwd) {
        dn := dn is String ? StrPtr(dn) : dn
        passwd := passwd is String ? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bindW", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * Asynchronously authenticates a client to a server, using a plaintext password.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {PSTR} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, it returns the message ID of the operation initiated.
     * 
     * If the function fails, it returns -1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_simple_binda
     * @since windows6.0.6000
     */
    static ldap_simple_bindA(ld, dn, passwd) {
        dn := dn is String ? StrPtr(dn) : dn
        passwd := passwd is String ? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bindA", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * The ldap_simple_bind_s function synchronously authenticates a client to a server, using a plaintext password.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {PWSTR} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_simple_bind_sw
     * @since windows6.0.6000
     */
    static ldap_simple_bind_sW(ld, dn, passwd) {
        dn := dn is String ? StrPtr(dn) : dn
        passwd := passwd is String ? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bind_sW", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * The ldap_simple_bind_s function synchronously authenticates a client to a server, using a plaintext password.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {PSTR} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_simple_bind_sa
     * @since windows6.0.6000
     */
    static ldap_simple_bind_sA(ld, dn, passwd) {
        dn := dn is String ? StrPtr(dn) : dn
        passwd := passwd is String ? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bind_sA", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * Asynchronously authenticates a client with the LDAP server.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry used to bind.
     * @param {PWSTR} cred A pointer to a null-terminated string that contains the credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the setting of the method parameter. For more information, see the Remarks section.
     * @param {Integer} method The authentication method to use.
     * @returns {Integer} If the function succeeds, the return value is the message ID of the initiated operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_bindw
     * @since windows6.0.6000
     */
    static ldap_bindW(ld, dn, cred, method) {
        dn := dn is String ? StrPtr(dn) : dn
        cred := cred is String ? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bindW", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * Asynchronously authenticates a client with the LDAP server.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry used to bind.
     * @param {PSTR} cred A pointer to a null-terminated string that contains the credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the setting of the method parameter. For more information, see the Remarks section.
     * @param {Integer} method The authentication method to use.
     * @returns {Integer} If the function succeeds, the return value is the message ID of the initiated operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_binda
     * @since windows6.0.6000
     */
    static ldap_bindA(ld, dn, cred, method) {
        dn := dn is String ? StrPtr(dn) : dn
        cred := cred is String ? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bindA", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * Synchronously authenticates a client to the LDAP server.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn Pointer to a null-terminated string that contains the distinguished name of the entry used to bind. This can be a DN, a UPN, a WinNT style user name, or other name that the directory server will accept as an identifier.
     * @param {PWSTR} cred Pointer to a null-terminated string that contains the credentials with which to authenticate. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depends on the setting of the <i>method</i> parameter. For more information, see Remarks.
     * @param {Integer} method Indicates the authentication method to use.  For more information and  a listing of valid asynchronous authentication methods, see the Remarks section. For more information and a description of the valid asynchronous authentication method, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_bind_sw
     * @since windows6.0.6000
     */
    static ldap_bind_sW(ld, dn, cred, method) {
        dn := dn is String ? StrPtr(dn) : dn
        cred := cred is String ? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bind_sW", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * Synchronously authenticates a client to the LDAP server.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn Pointer to a null-terminated string that contains the distinguished name of the entry used to bind. This can be a DN, a UPN, a WinNT style user name, or other name that the directory server will accept as an identifier.
     * @param {PSTR} cred Pointer to a null-terminated string that contains the credentials with which to authenticate. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depends on the setting of the <i>method</i> parameter. For more information, see Remarks.
     * @param {Integer} method Indicates the authentication method to use.  For more information and  a listing of valid asynchronous authentication methods, see the Remarks section. For more information and a description of the valid asynchronous authentication method, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_bind_sa
     * @since windows6.0.6000
     */
    static ldap_bind_sA(ld, dn, cred, method) {
        dn := dn is String ? StrPtr(dn) : dn
        cred := cred is String ? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bind_sA", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * The ldap_sasl_bind is an asynchronous function that authenticates a client to the LDAP server using SASL.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistName The distinguished name of the entry used to bind.
     * @param {PSTR} AuthMechanism Indicates the authentication method to use.
     * @param {Pointer<LDAP_BERVAL>} cred The credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the value of the <i>AuthMechanism</i> argument passed. For more information, see Remarks.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerCtrls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientCtrls A list of LDAP client controls.
     * @param {Pointer<Integer>} MessageNumber The message ID for the bind operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_sasl_binda
     * @since windows6.0.6000
     */
    static ldap_sasl_bindA(ExternalHandle, DistName, AuthMechanism, cred, ServerCtrls, ClientCtrls, MessageNumber) {
        DistName := DistName is String ? StrPtr(DistName) : DistName
        AuthMechanism := AuthMechanism is String ? StrPtr(AuthMechanism) : AuthMechanism

        ServerCtrlsMarshal := ServerCtrls is VarRef ? "ptr*" : "ptr"
        ClientCtrlsMarshal := ClientCtrls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "int*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_sasl_bindA", "ptr", ExternalHandle, "ptr", DistName, "ptr", AuthMechanism, "ptr", cred, ServerCtrlsMarshal, ServerCtrls, ClientCtrlsMarshal, ClientCtrls, MessageNumberMarshal, MessageNumber, "CDecl int")
        return result
    }

    /**
     * The ldap_sasl_bind is an asynchronous function that authenticates a client to the LDAP server using SASL.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PWSTR} DistName The distinguished name of the entry used to bind.
     * @param {PWSTR} AuthMechanism Indicates the authentication method to use.
     * @param {Pointer<LDAP_BERVAL>} cred The credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the value of the <i>AuthMechanism</i> argument passed. For more information, see Remarks.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerCtrls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientCtrls A list of LDAP client controls.
     * @param {Pointer<Integer>} MessageNumber The message ID for the bind operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_sasl_bindw
     * @since windows6.0.6000
     */
    static ldap_sasl_bindW(ExternalHandle, DistName, AuthMechanism, cred, ServerCtrls, ClientCtrls, MessageNumber) {
        DistName := DistName is String ? StrPtr(DistName) : DistName
        AuthMechanism := AuthMechanism is String ? StrPtr(AuthMechanism) : AuthMechanism

        ServerCtrlsMarshal := ServerCtrls is VarRef ? "ptr*" : "ptr"
        ClientCtrlsMarshal := ClientCtrls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "int*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_sasl_bindW", "ptr", ExternalHandle, "ptr", DistName, "ptr", AuthMechanism, "ptr", cred, ServerCtrlsMarshal, ServerCtrls, ClientCtrlsMarshal, ClientCtrls, MessageNumberMarshal, MessageNumber, "CDecl int")
        return result
    }

    /**
     * The ldap_sasl_bind_s function is a synchronous function that authenticates a client to the LDAP server using SASL.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistName The distinguished name of the entry used to bind.
     * @param {PSTR} AuthMechanism Indicates the authentication method to use.
     * @param {Pointer<LDAP_BERVAL>} cred The credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the value of the <i>AuthMechanism</i> argument passed. For more information, see Remarks.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerCtrls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientCtrls A list of LDAP client controls.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} ServerData Authentication data returned by the server in response to the bind request.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_sasl_bind_sa
     * @since windows6.0.6000
     */
    static ldap_sasl_bind_sA(ExternalHandle, DistName, AuthMechanism, cred, ServerCtrls, ClientCtrls, ServerData) {
        DistName := DistName is String ? StrPtr(DistName) : DistName
        AuthMechanism := AuthMechanism is String ? StrPtr(AuthMechanism) : AuthMechanism

        ServerCtrlsMarshal := ServerCtrls is VarRef ? "ptr*" : "ptr"
        ClientCtrlsMarshal := ClientCtrls is VarRef ? "ptr*" : "ptr"
        ServerDataMarshal := ServerData is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_sasl_bind_sA", "ptr", ExternalHandle, "ptr", DistName, "ptr", AuthMechanism, "ptr", cred, ServerCtrlsMarshal, ServerCtrls, ClientCtrlsMarshal, ClientCtrls, ServerDataMarshal, ServerData, "CDecl int")
        return result
    }

    /**
     * The ldap_sasl_bind_s function is a synchronous function that authenticates a client to the LDAP server using SASL.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PWSTR} DistName The distinguished name of the entry used to bind.
     * @param {PWSTR} AuthMechanism Indicates the authentication method to use.
     * @param {Pointer<LDAP_BERVAL>} cred The credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the value of the <i>AuthMechanism</i> argument passed. For more information, see Remarks.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerCtrls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientCtrls A list of LDAP client controls.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} ServerData Authentication data returned by the server in response to the bind request.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_sasl_bind_sw
     * @since windows6.0.6000
     */
    static ldap_sasl_bind_sW(ExternalHandle, DistName, AuthMechanism, cred, ServerCtrls, ClientCtrls, ServerData) {
        DistName := DistName is String ? StrPtr(DistName) : DistName
        AuthMechanism := AuthMechanism is String ? StrPtr(AuthMechanism) : AuthMechanism

        ServerCtrlsMarshal := ServerCtrls is VarRef ? "ptr*" : "ptr"
        ClientCtrlsMarshal := ClientCtrls is VarRef ? "ptr*" : "ptr"
        ServerDataMarshal := ServerData is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_sasl_bind_sW", "ptr", ExternalHandle, "ptr", DistName, "ptr", AuthMechanism, "ptr", cred, ServerCtrlsMarshal, ServerCtrls, ClientCtrlsMarshal, ClientCtrls, ServerDataMarshal, ServerData, "CDecl int")
        return result
    }

    /**
     * Asynchronously authenticates a client to a server, using a plaintext password.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {PSTR} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, it returns the message ID of the operation initiated.
     * 
     * If the function fails, it returns -1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_simple_bind
     * @since windows6.0.6000
     */
    static ldap_simple_bind(ld, dn, passwd) {
        dn := dn is String ? StrPtr(dn) : dn
        passwd := passwd is String ? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bind", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * The ldap_simple_bind_s function synchronously authenticates a client to a server, using a plaintext password.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {PSTR} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_simple_bind_s
     * @since windows6.0.6000
     */
    static ldap_simple_bind_s(ld, dn, passwd) {
        dn := dn is String ? StrPtr(dn) : dn
        passwd := passwd is String ? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bind_s", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * Asynchronously authenticates a client with the LDAP server.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry used to bind.
     * @param {PSTR} cred A pointer to a null-terminated string that contains the credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the setting of the method parameter. For more information, see the Remarks section.
     * @param {Integer} method The authentication method to use.
     * @returns {Integer} If the function succeeds, the return value is the message ID of the initiated operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_bind
     * @since windows6.0.6000
     */
    static ldap_bind(ld, dn, cred, method) {
        dn := dn is String ? StrPtr(dn) : dn
        cred := cred is String ? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bind", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * Synchronously authenticates a client to the LDAP server.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn Pointer to a null-terminated string that contains the distinguished name of the entry used to bind. This can be a DN, a UPN, a WinNT style user name, or other name that the directory server will accept as an identifier.
     * @param {PSTR} cred Pointer to a null-terminated string that contains the credentials with which to authenticate. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depends on the setting of the <i>method</i> parameter. For more information, see Remarks.
     * @param {Integer} method Indicates the authentication method to use.  For more information and  a listing of valid asynchronous authentication methods, see the Remarks section. For more information and a description of the valid asynchronous authentication method, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_bind_s
     * @since windows6.0.6000
     */
    static ldap_bind_s(ld, dn, cred, method) {
        dn := dn is String ? StrPtr(dn) : dn
        cred := cred is String ? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bind_s", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * Searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld A session handle.
     * @param {PWSTR} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PWSTR} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @returns {Integer} If the function succeeds, it returns the message ID of the search operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_searchw
     * @since windows6.0.6000
     */
    static ldap_searchW(ld, base, scope, filter, attrs, attrsonly) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_searchW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, "CDecl uint")
        return result
    }

    /**
     * Searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld A session handle.
     * @param {PSTR} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @returns {Integer} If the function succeeds, it returns the message ID of the search operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_searcha
     * @since windows6.0.6000
     */
    static ldap_searchA(ld, base, scope, filter, attrs, attrsonly) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_searchA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_s function synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PWSTR} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PWSTR} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings indicating the attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free results returned with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>when they are no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails it returns an error code, however <b>ldap_search_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_sw
     * @since windows6.0.6000
     */
    static ldap_search_sW(ld, base, scope, filter, attrs, attrsonly, res) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_sW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_s function synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PSTR} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings indicating the attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free results returned with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>when they are no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails it returns an error code, however <b>ldap_search_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_sa
     * @since windows6.0.6000
     */
    static ldap_search_sA(ld, base, scope, filter, attrs, attrsonly, res) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_sA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_st function synchronously searches the LDAP directory and returns a requested set of attributes for each entry matched. An additional parameter specifies a local time-out for the search.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PWSTR} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PWSTR} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that must be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAP_TIMEVAL>} timeout The local search time-out value, in seconds.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Any results returned must be freed with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>when  no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_st</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_stw
     * @since windows6.0.6000
     */
    static ldap_search_stW(ld, base, scope, filter, attrs, attrsonly, timeout, res) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_stW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, "ptr", timeout, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_st function synchronously searches the LDAP directory and returns a requested set of attributes for each entry matched. An additional parameter specifies a local time-out for the search.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PSTR} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that must be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAP_TIMEVAL>} timeout The local search time-out value, in seconds.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Any results returned must be freed with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>when  no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_st</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_sta
     * @since windows6.0.6000
     */
    static ldap_search_stA(ld, base, scope, filter, attrs, attrsonly, timeout, res) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_stA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, "ptr", timeout, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * Searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PWSTR} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. To retrieve all available attributes, pass <b>NULL</b>.
     * @param {Integer} attrsonly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls A list of client controls.
     * @param {Integer} TimeLimit Specifies both the local search time-out value in seconds and the operation time limit sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<Integer>} MessageNumber The request  message ID.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_extw
     * @since windows6.0.6000
     */
    static ldap_search_extW(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, TimeLimit, SizeLimit, MessageNumber) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_extW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "uint", TimeLimit, "uint", SizeLimit, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. To retrieve all available attributes, pass <b>NULL</b>.
     * @param {Integer} attrsonly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @param {Integer} TimeLimit Specifies both the local search time-out value in seconds and the operation time limit sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<Integer>} MessageNumber The request  message ID.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_exta
     * @since windows6.0.6000
     */
    static ldap_search_extA(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, TimeLimit, SizeLimit, MessageNumber) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_extA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "uint", TimeLimit, "uint", SizeLimit, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PWSTR} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PWSTR} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of pointers to null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls A list of client controls.
     * @param {Pointer<LDAP_TIMEVAL>} timeout Specifies both the local search time-out value, in seconds, and the operation time limit that is sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free returned results with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>when no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_ext_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code will allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_ext_sw
     * @since windows6.0.6000
     */
    static ldap_search_ext_sW(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, timeout, SizeLimit, res) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_ext_sW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "ptr", timeout, "uint", SizeLimit, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * Synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PSTR} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of pointers to null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @param {Pointer<LDAP_TIMEVAL>} timeout Specifies both the local search time-out value, in seconds, and the operation time limit that is sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free returned results with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>when no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_ext_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code will allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_ext_sa
     * @since windows6.0.6000
     */
    static ldap_search_ext_sA(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, timeout, SizeLimit, res) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_ext_sA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "ptr", timeout, "uint", SizeLimit, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * Searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld A session handle.
     * @param {PSTR} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @returns {Integer} If the function succeeds, it returns the message ID of the search operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search
     * @since windows6.0.6000
     */
    static ldap_search(ld, base, scope, filter, attrs, attrsonly) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_s function synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PSTR} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings indicating the attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free results returned with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>when they are no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails it returns an error code, however <b>ldap_search_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_s
     * @since windows6.0.6000
     */
    static ldap_search_s(ld, base, scope, filter, attrs, attrsonly, res) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_s", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_st function synchronously searches the LDAP directory and returns a requested set of attributes for each entry matched. An additional parameter specifies a local time-out for the search.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PSTR} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that must be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAP_TIMEVAL>} timeout The local search time-out value, in seconds.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Any results returned must be freed with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>when  no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_st</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_st
     * @since windows6.0.6000
     */
    static ldap_search_st(ld, base, scope, filter, attrs, attrsonly, timeout, res) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_st", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, "ptr", timeout, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * Searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. To retrieve all available attributes, pass <b>NULL</b>.
     * @param {Integer} attrsonly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @param {Integer} TimeLimit Specifies both the local search time-out value in seconds and the operation time limit sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<Integer>} MessageNumber The request  message ID.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_ext
     * @since windows6.0.6000
     */
    static ldap_search_ext(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, TimeLimit, SizeLimit, MessageNumber) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_ext", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "uint", TimeLimit, "uint", SizeLimit, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PSTR} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {PSTR} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} attrs A null-terminated array of pointers to null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @param {Pointer<LDAP_TIMEVAL>} timeout Specifies both the local search time-out value, in seconds, and the operation time limit that is sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free returned results with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>when no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_ext_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code will allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_ext_s
     * @since windows6.0.6000
     */
    static ldap_search_ext_s(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, timeout, SizeLimit, res) {
        base := base is String ? StrPtr(base) : base
        filter := filter is String ? StrPtr(filter) : filter

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_search_ext_s", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, attrsMarshal, attrs, "uint", attrsonly, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "ptr", timeout, "uint", SizeLimit, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * The ldap_check_filter function is used to verify filter syntax.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} SearchFilter A pointer to a wide, null-terminated string that contains the name of the filter to check.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_check_filterw
     * @since windows6.0.6000
     */
    static ldap_check_filterW(ld, SearchFilter) {
        SearchFilter := SearchFilter is String ? StrPtr(SearchFilter) : SearchFilter

        result := DllCall("WLDAP32.dll\ldap_check_filterW", "ptr", ld, "ptr", SearchFilter, "CDecl uint")
        return result
    }

    /**
     * The ldap_check_filter function is used to verify filter syntax.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} SearchFilter A pointer to a wide, null-terminated string that contains the name of the filter to check.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_check_filtera
     * @since windows6.0.6000
     */
    static ldap_check_filterA(ld, SearchFilter) {
        SearchFilter := SearchFilter is String ? StrPtr(SearchFilter) : SearchFilter

        result := DllCall("WLDAP32.dll\ldap_check_filterA", "ptr", ld, "ptr", SearchFilter, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModW>>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modifyw
     * @since windows6.0.6000
     */
    static ldap_modifyW(ld, dn, mods) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modifyW", "ptr", ld, "ptr", dn, modsMarshal, mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModA>>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modifya
     * @since windows6.0.6000
     */
    static ldap_modifyA(ld, dn, mods) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modifyA", "ptr", ld, "ptr", dn, modsMarshal, mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_s function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModW>>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify_sw
     * @since windows6.0.6000
     */
    static ldap_modify_sW(ld, dn, mods) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify_sW", "ptr", ld, "ptr", dn, modsMarshal, mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_s function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModA>>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify_sa
     * @since windows6.0.6000
     */
    static ldap_modify_sA(ld, dn, mods) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify_sA", "ptr", ld, "ptr", dn, modsMarshal, mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModW>>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls A list of client controls
     * @param {Pointer<Integer>} MessageNumber This result parameter is set to the message ID of the request if the call succeeds.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify_extw
     * @since windows6.0.6000
     */
    static ldap_modify_extW(ld, dn, mods, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify_extW", "ptr", ld, "ptr", dn, modsMarshal, mods, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModA>>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls
     * @param {Pointer<Integer>} MessageNumber This result parameter is set to the message ID of the request if the call succeeds.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify_exta
     * @since windows6.0.6000
     */
    static ldap_modify_extA(ld, dn, mods, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify_extA", "ptr", ld, "ptr", dn, modsMarshal, mods, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext_s function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModW>>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify_ext_sw
     * @since windows6.0.6000
     */
    static ldap_modify_ext_sW(ld, dn, mods, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify_ext_sW", "ptr", ld, "ptr", dn, modsMarshal, mods, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext_s function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModA>>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify_ext_sa
     * @since windows6.0.6000
     */
    static ldap_modify_ext_sA(ld, dn, mods, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify_ext_sA", "ptr", ld, "ptr", dn, modsMarshal, mods, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModA>>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify
     * @since windows6.0.6000
     */
    static ldap_modify(ld, dn, mods) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify", "ptr", ld, "ptr", dn, modsMarshal, mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_s function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModA>>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify_s
     * @since windows6.0.6000
     */
    static ldap_modify_s(ld, dn, mods) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify_s", "ptr", ld, "ptr", dn, modsMarshal, mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModA>>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls
     * @param {Pointer<Integer>} MessageNumber This result parameter is set to the message ID of the request if the call succeeds.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify_ext
     * @since windows6.0.6000
     */
    static ldap_modify_ext(ld, dn, mods, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify_ext", "ptr", ld, "ptr", dn, modsMarshal, mods, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext_s function changes an existing entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<Pointer<LDAPModA>>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modify_ext_s
     * @since windows6.0.6000
     */
    static ldap_modify_ext_s(ld, dn, mods, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn

        modsMarshal := mods is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_modify_ext_s", "ptr", ld, "ptr", dn, modsMarshal, mods, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2 function changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PWSTR} DistinguishedName A null-terminated string that contains the distinguished name to change.
     * @param {PWSTR} NewDistinguishedName A null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn2w
     * @since windows6.0.6000
     */
    static ldap_modrdn2W(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2W", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2 function changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A null-terminated string that contains the distinguished name to change.
     * @param {PSTR} NewDistinguishedName A null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn2a
     * @since windows6.0.6000
     */
    static ldap_modrdn2A(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2A", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn function changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PWSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {PWSTR} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdnw
     * @since windows6.0.6000
     */
    static ldap_modrdnW(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdnW", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn function changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {PSTR} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdna
     * @since windows6.0.6000
     */
    static ldap_modrdnA(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdnA", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2_s function changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PWSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name to change.
     * @param {PWSTR} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn2_sw
     * @since windows6.0.6000
     */
    static ldap_modrdn2_sW(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2_sW", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2_s function changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name to change.
     * @param {PSTR} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn2_sa
     * @since windows6.0.6000
     */
    static ldap_modrdn2_sA(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2_sA", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * Changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PWSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {PWSTR} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn_sw
     * @since windows6.0.6000
     */
    static ldap_modrdn_sW(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn_sW", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * Changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {PSTR} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn_sa
     * @since windows6.0.6000
     */
    static ldap_modrdn_sA(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn_sA", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2 function changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A null-terminated string that contains the distinguished name to change.
     * @param {PSTR} NewDistinguishedName A null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn2
     * @since windows6.0.6000
     */
    static ldap_modrdn2(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn function changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {PSTR} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn
     * @since windows6.0.6000
     */
    static ldap_modrdn(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2_s function changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name to change.
     * @param {PSTR} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn2_s
     * @since windows6.0.6000
     */
    static ldap_modrdn2_s(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2_s", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * Changes the relative distinguished name of an LDAP entry.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {PSTR} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_modrdn_s
     * @since windows6.0.6000
     */
    static ldap_modrdn_s(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String ? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn_s", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext function starts an asynchronous operation that changes the distinguished name of an entry in the directory. This function is available effective with LDAP 3.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {PWSTR} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name for the entry.
     * @param {PWSTR} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls List of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls List of client controls.
     * @param {Pointer<Integer>} MessageNumber Pointer to a variable that receives the message identifier for this asynchronous operation. Use this identifier with the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> function to retrieve the results of the operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_rename_extw
     * @since windows6.0.6000
     */
    static ldap_rename_extW(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn
        NewRDN := NewRDN is String ? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String ? StrPtr(NewParent) : NewParent

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_rename_extW", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext function starts an asynchronous operation that changes the distinguished name of an entry in the directory. This function is available effective with LDAP 3.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {PSTR} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name for the entry.
     * @param {PSTR} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls List of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls List of client controls.
     * @param {Pointer<Integer>} MessageNumber Pointer to a variable that receives the message identifier for this asynchronous operation. Use this identifier with the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> function to retrieve the results of the operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_rename_exta
     * @since windows6.0.6000
     */
    static ldap_rename_extA(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn
        NewRDN := NewRDN is String ? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String ? StrPtr(NewParent) : NewParent

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_rename_extA", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext_s function is a synchronous operation that changes the distinguished name of an entry in the directory. This function is available effective with LDAP 3.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {PWSTR} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name.
     * @param {PWSTR} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls List of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls List of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_rename_ext_sw
     * @since windows6.0.6000
     */
    static ldap_rename_ext_sW(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn
        NewRDN := NewRDN is String ? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String ? StrPtr(NewParent) : NewParent

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_rename_ext_sW", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext_s function is a synchronous operation that changes the distinguished name of an entry in the directory. This function is available effective with LDAP 3.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {PSTR} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name.
     * @param {PSTR} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls List of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls List of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_rename_ext_sa
     * @since windows6.0.6000
     */
    static ldap_rename_ext_sA(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn
        NewRDN := NewRDN is String ? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String ? StrPtr(NewParent) : NewParent

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_rename_ext_sA", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext function starts an asynchronous operation that changes the distinguished name of an entry in the directory. This function is available effective with LDAP 3.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {PSTR} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name for the entry.
     * @param {PSTR} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls List of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls List of client controls.
     * @param {Pointer<Integer>} MessageNumber Pointer to a variable that receives the message identifier for this asynchronous operation. Use this identifier with the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> function to retrieve the results of the operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_rename_ext
     * @since windows6.0.6000
     */
    static ldap_rename_ext(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn
        NewRDN := NewRDN is String ? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String ? StrPtr(NewParent) : NewParent

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_rename_ext", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext_s function is a synchronous operation that changes the distinguished name of an entry in the directory. This function is available effective with LDAP 3.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {PSTR} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name.
     * @param {PSTR} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls List of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls List of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_rename_ext_s
     * @since windows6.0.6000
     */
    static ldap_rename_ext_s(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn
        NewRDN := NewRDN is String ? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String ? StrPtr(NewParent) : NewParent

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_rename_ext_s", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * Initiates an asynchronous add operation to a directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModW>>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute.
     * @returns {Integer} If the function succeeds, the message ID of the add operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve the error data, use <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_addw
     * @since windows6.0.6000
     */
    static ldap_addW(ld, dn, attrs) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_addW", "ptr", ld, "ptr", dn, attrsMarshal, attrs, "CDecl uint")
        return result
    }

    /**
     * Initiates an asynchronous add operation to a directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModA>>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute.
     * @returns {Integer} If the function succeeds, the message ID of the add operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve the error data, use <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_adda
     * @since windows6.0.6000
     */
    static ldap_addA(ld, dn, attrs) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_addA", "ptr", ld, "ptr", dn, attrsMarshal, attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_s function initiates a synchronous add operation that adds an entry to a tree. The parent of the entry being added must already exist or the parent must be empty (equal to the root distinguished name) for an add operation to succeed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModW>>} attrs A null-terminated array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. See Remarks for more information.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add_sw
     * @since windows6.0.6000
     */
    static ldap_add_sW(ld, dn, attrs) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add_sW", "ptr", ld, "ptr", dn, attrsMarshal, attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_s function initiates a synchronous add operation that adds an entry to a tree. The parent of the entry being added must already exist or the parent must be empty (equal to the root distinguished name) for an add operation to succeed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModA>>} attrs A null-terminated array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. See Remarks for more information.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add_sa
     * @since windows6.0.6000
     */
    static ldap_add_sA(ld, dn, attrs) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add_sA", "ptr", ld, "ptr", dn, attrsMarshal, attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext function initiates an asynchronous add operation to a tree. The parent of the entry added must exist, or the parent must be empty (equal to the distinguished name of the root) for an add operation to succeed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModW>>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the Remarks section.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls List of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls List of client controls.
     * @param {Pointer<Integer>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="/previous-versions/windows/desktop/ldap/functions">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add_extw
     * @since windows6.0.6000
     */
    static ldap_add_extW(ld, dn, attrs, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add_extW", "ptr", ld, "ptr", dn, attrsMarshal, attrs, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext function initiates an asynchronous add operation to a tree. The parent of the entry added must exist, or the parent must be empty (equal to the distinguished name of the root) for an add operation to succeed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModA>>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the Remarks section.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls List of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls List of client controls.
     * @param {Pointer<Integer>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="/previous-versions/windows/desktop/ldap/functions">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add_exta
     * @since windows6.0.6000
     */
    static ldap_add_extA(ld, dn, attrs, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add_extA", "ptr", ld, "ptr", dn, attrsMarshal, attrs, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext_s function initiates a synchronous add operation to a tree. For an add operation to succeed, the parent of the entry added must exist, or the parent must be empty (equal to the distinguished name of the root).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModW>>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the  Remarks section.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add_ext_sw
     * @since windows6.0.6000
     */
    static ldap_add_ext_sW(ld, dn, attrs, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add_ext_sW", "ptr", ld, "ptr", dn, attrsMarshal, attrs, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext_s function initiates a synchronous add operation to a tree. For an add operation to succeed, the parent of the entry added must exist, or the parent must be empty (equal to the distinguished name of the root).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModA>>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the  Remarks section.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add_ext_sa
     * @since windows6.0.6000
     */
    static ldap_add_ext_sA(ld, dn, attrs, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add_ext_sA", "ptr", ld, "ptr", dn, attrsMarshal, attrs, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * Initiates an asynchronous add operation to a directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModA>>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute.
     * @returns {Integer} If the function succeeds, the message ID of the add operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve the error data, use <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add
     * @since windows6.0.6000
     */
    static ldap_add(ld, dn, attrs) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add", "ptr", ld, "ptr", dn, attrsMarshal, attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_s function initiates a synchronous add operation that adds an entry to a tree. The parent of the entry being added must already exist or the parent must be empty (equal to the root distinguished name) for an add operation to succeed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModA>>} attrs A null-terminated array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. See Remarks for more information.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add_s
     * @since windows6.0.6000
     */
    static ldap_add_s(ld, dn, attrs) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add_s", "ptr", ld, "ptr", dn, attrsMarshal, attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext function initiates an asynchronous add operation to a tree. The parent of the entry added must exist, or the parent must be empty (equal to the distinguished name of the root) for an add operation to succeed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModA>>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the Remarks section.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls List of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls List of client controls.
     * @param {Pointer<Integer>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="/previous-versions/windows/desktop/ldap/functions">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add_ext
     * @since windows6.0.6000
     */
    static ldap_add_ext(ld, dn, attrs, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add_ext", "ptr", ld, "ptr", dn, attrsMarshal, attrs, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext_s function initiates a synchronous add operation to a tree. For an add operation to succeed, the parent of the entry added must exist, or the parent must be empty (equal to the distinguished name of the root).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<Pointer<LDAPModA>>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the  Remarks section.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_add_ext_s
     * @since windows6.0.6000
     */
    static ldap_add_ext_s(ld, dn, attrs, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn

        attrsMarshal := attrs is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_add_ext_s", "ptr", ld, "ptr", dn, attrsMarshal, attrs, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare function to determine whether an attribute for a given entry holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {PWSTR} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PWSTR} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute value.
     * @returns {Integer} If the function succeeds, the message ID of the compare operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure. This error can then be retrieved using <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_comparew
     * @since windows6.0.6000
     */
    static ldap_compareW(ld, dn, attr, value) {
        dn := dn is String ? StrPtr(dn) : dn
        attr := attr is String ? StrPtr(attr) : attr
        value := value is String ? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compareW", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare function to determine whether an attribute for a given entry holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {PSTR} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PSTR} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute value.
     * @returns {Integer} If the function succeeds, the message ID of the compare operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure. This error can then be retrieved using <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_comparea
     * @since windows6.0.6000
     */
    static ldap_compareA(ld, dn, attr, value) {
        dn := dn is String ? StrPtr(dn) : dn
        attr := attr is String ? StrPtr(attr) : attr
        value := value is String ? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compareA", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_s function to determine whether an attribute for a given entry holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {PWSTR} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PWSTR} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute 
     *       value.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, the return value is 
     *        <b>LDAP_COMPARE_TRUE</b>. If the values do not match, the return value is 
     *        <b>LDAP_COMPARE_FALSE</b>.
     * 
     * If the function fails, it returns an error code. See 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare_sw
     * @since windows6.0.6000
     */
    static ldap_compare_sW(ld, dn, attr, value) {
        dn := dn is String ? StrPtr(dn) : dn
        attr := attr is String ? StrPtr(attr) : attr
        value := value is String ? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compare_sW", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_s function to determine whether an attribute for a given entry holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {PSTR} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PSTR} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute 
     *       value.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, the return value is 
     *        <b>LDAP_COMPARE_TRUE</b>. If the values do not match, the return value is 
     *        <b>LDAP_COMPARE_FALSE</b>.
     * 
     * If the function fails, it returns an error code. See 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare_sa
     * @since windows6.0.6000
     */
    static ldap_compare_sA(ld, dn, attr, value) {
        dn := dn is String ? StrPtr(dn) : dn
        attr := attr is String ? StrPtr(attr) : attr
        value := value is String ? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compare_sA", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare function to determine whether an attribute for a given entry holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {PSTR} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PSTR} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute value.
     * @returns {Integer} If the function succeeds, the message ID of the compare operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure. This error can then be retrieved using <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare
     * @since windows6.0.6000
     */
    static ldap_compare(ld, dn, attr, value) {
        dn := dn is String ? StrPtr(dn) : dn
        attr := attr is String ? StrPtr(attr) : attr
        value := value is String ? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compare", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_s function to determine whether an attribute for a given entry holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {PSTR} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PSTR} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute 
     *       value.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, the return value is 
     *        <b>LDAP_COMPARE_TRUE</b>. If the values do not match, the return value is 
     *        <b>LDAP_COMPARE_FALSE</b>.
     * 
     * If the function fails, it returns an error code. See 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare_s
     * @since windows6.0.6000
     */
    static ldap_compare_s(ld, dn, attr, value) {
        dn := dn is String ? StrPtr(dn) : dn
        attr := attr is String ? StrPtr(attr) : attr
        value := value is String ? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compare_s", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_ext function to determine if an attribute, for a given entry, holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {PWSTR} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PWSTR} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls Optional. A list of LDAP server controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls Optional. A list of client controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<Integer>} MessageNumber The message ID for the compare operation.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare_extw
     * @since windows6.0.6000
     */
    static ldap_compare_extW(ld, dn, Attr, Value, Data, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn
        Attr := Attr is String ? StrPtr(Attr) : Attr
        Value := Value is String ? StrPtr(Value) : Value

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_compare_extW", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_ext function to determine if an attribute, for a given entry, holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {PSTR} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PSTR} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. A list of LDAP server controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. A list of client controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<Integer>} MessageNumber The message ID for the compare operation.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare_exta
     * @since windows6.0.6000
     */
    static ldap_compare_extA(ld, dn, Attr, Value, Data, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn
        Attr := Attr is String ? StrPtr(Attr) : Attr
        Value := Value is String ? StrPtr(Value) : Value

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_compare_extA", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_ext_s function to determine if an attribute, for a given entry, holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {PWSTR} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PWSTR} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls Optional. A list of LDAP server controls. Set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls Optional. A list of LDAP client controls. Set to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, <b>LDAP_COMPARE_TRUE</b> is returned; if the values do not match, <b>LDAP_COMPARE_FALSE</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare_ext_sw
     * @since windows6.0.6000
     */
    static ldap_compare_ext_sW(ld, dn, Attr, Value, Data, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn
        Attr := Attr is String ? StrPtr(Attr) : Attr
        Value := Value is String ? StrPtr(Value) : Value

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_compare_ext_sW", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_ext_s function to determine if an attribute, for a given entry, holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {PSTR} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PSTR} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. A list of LDAP server controls. Set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. A list of LDAP client controls. Set to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, <b>LDAP_COMPARE_TRUE</b> is returned; if the values do not match, <b>LDAP_COMPARE_FALSE</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare_ext_sa
     * @since windows6.0.6000
     */
    static ldap_compare_ext_sA(ld, dn, Attr, Value, Data, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn
        Attr := Attr is String ? StrPtr(Attr) : Attr
        Value := Value is String ? StrPtr(Value) : Value

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_compare_ext_sA", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_ext function to determine if an attribute, for a given entry, holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {PSTR} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PSTR} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. A list of LDAP server controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. A list of client controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<Integer>} MessageNumber The message ID for the compare operation.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare_ext
     * @since windows6.0.6000
     */
    static ldap_compare_ext(ld, dn, Attr, Value, Data, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn
        Attr := Attr is String ? StrPtr(Attr) : Attr
        Value := Value is String ? StrPtr(Value) : Value

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_compare_ext", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_ext_s function to determine if an attribute, for a given entry, holds a known value.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {PSTR} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {PSTR} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. A list of LDAP server controls. Set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. A list of LDAP client controls. Set to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, <b>LDAP_COMPARE_TRUE</b> is returned; if the values do not match, <b>LDAP_COMPARE_FALSE</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_compare_ext_s
     * @since windows6.0.6000
     */
    static ldap_compare_ext_s(ld, dn, Attr, Value, Data, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn
        Attr := Attr is String ? StrPtr(Attr) : Attr
        Value := Value is String ? StrPtr(Value) : Value

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_compare_ext_s", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete function deletes an entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, it returns the message ID of the delete operation.
     * 
     * If the function fails, the return value is –1 and the function sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve this value, use <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_deletew
     * @since windows6.0.6000
     */
    static ldap_deleteW(ld, dn) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_deleteW", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete function deletes an entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, it returns the message ID of the delete operation.
     * 
     * If the function fails, the return value is –1 and the function sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve this value, use <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_deletea
     * @since windows6.0.6000
     */
    static ldap_deleteA(ld, dn) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_deleteA", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_s function is a synchronous operation that removes a leaf entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete_sw
     * @since windows6.0.6000
     */
    static ldap_delete_sW(ld, dn) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_sW", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_s function is a synchronous operation that removes a leaf entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete_sa
     * @since windows6.0.6000
     */
    static ldap_delete_sA(ld, dn) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_sA", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext function is an extended routine that removes a leaf entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls Optional. List of LDAP server controls. If not used, set this parameter to NULL.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls Optional. List of client controls. If not used, set this parameter to <b>NULL</b>.
     * @param {Pointer<Integer>} MessageNumber Message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete_extw
     * @since windows6.0.6000
     */
    static ldap_delete_extW(ld, dn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_delete_extW", "ptr", ld, "ptr", dn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext function is an extended routine that removes a leaf entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. List of LDAP server controls. If not used, set this parameter to NULL.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. List of client controls. If not used, set this parameter to <b>NULL</b>.
     * @param {Pointer<Integer>} MessageNumber Message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete_exta
     * @since windows6.0.6000
     */
    static ldap_delete_extA(ld, dn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_delete_extA", "ptr", ld, "ptr", dn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext_s function is an extended routine that performs a synchronous operation to remove a leaf entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls Optional. List of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls Optional. List of client controls. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete_ext_sw
     * @since windows6.0.6000
     */
    static ldap_delete_ext_sW(ld, dn, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_delete_ext_sW", "ptr", ld, "ptr", dn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext_s function is an extended routine that performs a synchronous operation to remove a leaf entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. List of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. List of client controls. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete_ext_sa
     * @since windows6.0.6000
     */
    static ldap_delete_ext_sA(ld, dn, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_delete_ext_sA", "ptr", ld, "ptr", dn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete function deletes an entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, it returns the message ID of the delete operation.
     * 
     * If the function fails, the return value is –1 and the function sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve this value, use <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete
     * @since windows6.0.6000
     */
    static ldap_delete(ld, dn) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_s function is a synchronous operation that removes a leaf entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete_s
     * @since windows6.0.6000
     */
    static ldap_delete_s(ld, dn) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_s", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext function is an extended routine that removes a leaf entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. List of LDAP server controls. If not used, set this parameter to NULL.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. List of client controls. If not used, set this parameter to <b>NULL</b>.
     * @param {Pointer<Integer>} MessageNumber Message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete_ext
     * @since windows6.0.6000
     */
    static ldap_delete_ext(ld, dn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String ? StrPtr(dn) : dn

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_delete_ext", "ptr", ld, "ptr", dn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext_s function is an extended routine that performs a synchronous operation to remove a leaf entry from the directory tree.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. List of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. List of client controls. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_delete_ext_s
     * @since windows6.0.6000
     */
    static ldap_delete_ext_s(ld, dn, ServerControls, ClientControls) {
        dn := dn is String ? StrPtr(dn) : dn

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_delete_ext_s", "ptr", ld, "ptr", dn, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * A client calls ldap_abandon to cancel an in-process asynchronous LDAP call.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} msgid The message ID of the call to be canceled. Asynchronous functions, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify">ldap_modify</a>,  return this message ID when they initiate an operation.
     * @returns {Integer} If the function succeeds, that is, if the cancel operation is successful, the return value is zero.
     * 
     * If the function fails, the return value is –1.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_abandon
     * @since windows6.0.6000
     */
    static ldap_abandon(ld, msgid) {
        result := DllCall("WLDAP32.dll\ldap_abandon", "ptr", ld, "uint", msgid, "CDecl uint")
        return result
    }

    /**
     * Obtains the result of an asynchronous operation.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} msgid The message ID of the operation, or the constant LDAP_RES_ANY if any result is required.
     * @param {Integer} all Specifies how many messages are retrieved in a single call to <b>ldap_result</b>. This parameter only has meaning for search results. Pass the constant LDAP_MSG_ONE (0x00) to retrieve one message at a time. Pass LDAP_MSG_ALL (0x01) to request that all results of a search be received before returning all results in a single chain. Pass LDAP_MSG_RECEIVED (0x02) to indicate that all results retrieved so far should be returned in the result chain.
     * @param {Pointer<LDAP_TIMEVAL>} timeout A timeout that specifies how long, in seconds, to wait for results to be returned. A <b>NULL</b> value causes <b>ldap_result</b> to block until results are available. A timeout value of zero seconds specifies a polling behavior.
     * @param {Pointer<Pointer<LDAPMessage>>} res Contains the result(s) of the operation. Any results returned should be freed with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>once they are no longer required by the application.
     * @returns {Integer} If the function succeeds, it returns one of the following values to indicate the type of the first result in the <i>res</i> parameter. If the time-out expires, the function returns 0.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_result
     * @since windows6.0.6000
     */
    static ldap_result(ld, msgid, all, timeout, res) {
        resMarshal := res is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_result", "ptr", ld, "uint", msgid, "uint", all, "ptr", timeout, resMarshal, res, "CDecl uint")
        return result
    }

    /**
     * The ldap_msgfree function frees the results obtained from a previous call to ldap_result, or to one of the synchronous search routines.
     * @param {Pointer<LDAPMessage>} res The result, or chain of results, to free.
     * @returns {Integer} Returns <b>LDAP_SUCCESS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_msgfree
     * @since windows6.0.6000
     */
    static ldap_msgfree(res) {
        result := DllCall("WLDAP32.dll\ldap_msgfree", "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_result2error function parses a message and returns the error code.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} res The result of an LDAP operation, as returned by 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>, or one of the synchronous API operation calls.
     * @param {Integer} freeit Determines whether the <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a>, pointed to by the <i>res</i> parameter, is freed. Setting <i>freeit</i> to <b>TRUE</b> frees the message by calling the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> function.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_result2error
     * @since windows6.0.6000
     */
    static ldap_result2error(ld, res, freeit) {
        result := DllCall("WLDAP32.dll\ldap_result2error", "ptr", ld, "ptr", res, "uint", freeit, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_result function parses responses from the server and returns the appropriate fields.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage The result of an LDAP operation as returned by one of the synchronous operation calls or by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> for an asynchronous operation.
     * @param {Pointer<Integer>} ReturnCode Indicates the outcome of the server operation that generated the original result message. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PWSTR>} MatchedDNs A pointer to a wide, null-terminated string. In the case of a return of <b>LDAP_NO_SUCH_OBJECT</b>, this result parameter is filled in with a distinguished name indicating how much of the name in the request was recognized. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PWSTR>} ErrorMessage A pointer to a wide, null-terminated string that contains the contents of the error message field from the <i>ResultMessage</i> parameter. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<Pointer<Pointer<Integer>>>} Referrals A pointer to a wide, null-terminated string that contains the contents of the referrals field from the <i>ResultMessage</i> parameter, indicating zero or more alternate LDAP servers where the request should be retried. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<Pointer<Pointer<LDAPControlW>>>} ServerControls This result parameter is filled in with an allocated array of controls copied from the <i>ResultMessage</i> parameter.
     * @param {BOOLEAN} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_resultw
     * @since windows6.0.6000
     */
    static ldap_parse_resultW(Connection, ResultMessage, ReturnCode, MatchedDNs, ErrorMessage, Referrals, ServerControls, Freeit) {
        ReturnCodeMarshal := ReturnCode is VarRef ? "uint*" : "ptr"
        ReferralsMarshal := Referrals is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_resultW", "ptr", Connection, "ptr", ResultMessage, ReturnCodeMarshal, ReturnCode, "ptr", MatchedDNs, "ptr", ErrorMessage, ReferralsMarshal, Referrals, ServerControlsMarshal, ServerControls, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_result function parses responses from the server and returns the appropriate fields.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage The result of an LDAP operation as returned by one of the synchronous operation calls or by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> for an asynchronous operation.
     * @param {Pointer<Integer>} ReturnCode Indicates the outcome of the server operation that generated the original result message. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PSTR>} MatchedDNs A pointer to a wide, null-terminated string. In the case of a return of <b>LDAP_NO_SUCH_OBJECT</b>, this result parameter is filled in with a distinguished name indicating how much of the name in the request was recognized. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PSTR>} ErrorMessage A pointer to a wide, null-terminated string that contains the contents of the error message field from the <i>ResultMessage</i> parameter. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<Pointer<Pointer<Integer>>>} Referrals A pointer to a wide, null-terminated string that contains the contents of the referrals field from the <i>ResultMessage</i> parameter, indicating zero or more alternate LDAP servers where the request should be retried. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<Pointer<Pointer<LDAPControlA>>>} ServerControls This result parameter is filled in with an allocated array of controls copied from the <i>ResultMessage</i> parameter.
     * @param {BOOLEAN} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_resulta
     * @since windows6.0.6000
     */
    static ldap_parse_resultA(Connection, ResultMessage, ReturnCode, MatchedDNs, ErrorMessage, Referrals, ServerControls, Freeit) {
        ReturnCodeMarshal := ReturnCode is VarRef ? "uint*" : "ptr"
        ReferralsMarshal := Referrals is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_resultA", "ptr", Connection, "ptr", ResultMessage, ReturnCodeMarshal, ReturnCode, "ptr", MatchedDNs, "ptr", ErrorMessage, ReferralsMarshal, Referrals, ServerControlsMarshal, ServerControls, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_extended_result parses the results of an LDAP extended operation.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> in response to an extended operation request.
     * @param {Pointer<PSTR>} ResultOID A pointer to a null-terminated string that contains the dotted object identifier (OID) text string of the server's response message.  This is normally the same OID as the one naming the request that was originally passed to the server by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_extended_operation">ldap_extended_operation</a>.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} ResultData The arbitrary data returned by the extended operation (if <b>NULL</b>, no data is returned by the server).
     * @param {BOOLEAN} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_extended_resulta
     * @since windows6.0.6000
     */
    static ldap_parse_extended_resultA(Connection, ResultMessage, ResultOID, ResultData, Freeit) {
        ResultDataMarshal := ResultData is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_extended_resultA", "ptr", Connection, "ptr", ResultMessage, "ptr", ResultOID, ResultDataMarshal, ResultData, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_extended_result parses the results of an LDAP extended operation.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> in response to an extended operation request.
     * @param {Pointer<PWSTR>} ResultOID A pointer to a null-terminated string that contains the dotted object identifier (OID) text string of the server's response message.  This is normally the same OID as the one naming the request that was originally passed to the server by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_extended_operation">ldap_extended_operation</a>.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} ResultData The arbitrary data returned by the extended operation (if <b>NULL</b>, no data is returned by the server).
     * @param {BOOLEAN} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_extended_resultw
     * @since windows6.0.6000
     */
    static ldap_parse_extended_resultW(Connection, ResultMessage, ResultOID, ResultData, Freeit) {
        ResultDataMarshal := ResultData is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_extended_resultW", "ptr", Connection, "ptr", ResultMessage, "ptr", ResultOID, ResultDataMarshal, ResultData, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * Frees an array of LDAPControl structures.
     * @param {Pointer<Pointer<LDAPControlA>>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_controls_freea
     * @since windows6.0.6000
     */
    static ldap_controls_freeA(Controls) {
        ControlsMarshal := Controls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_controls_freeA", ControlsMarshal, Controls, "CDecl uint")
        return result
    }

    /**
     * The ldap_control_free function frees an LDAPControl structure.
     * @param {Pointer<LDAPControlA>} Controls TBD
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_control_freea
     * @since windows6.0.6000
     */
    static ldap_control_freeA(Controls) {
        result := DllCall("WLDAP32.dll\ldap_control_freeA", "ptr", Controls, "CDecl uint")
        return result
    }

    /**
     * Frees an array of LDAPControl structures.
     * @param {Pointer<Pointer<LDAPControlW>>} Control TBD
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_controls_freew
     * @since windows6.0.6000
     */
    static ldap_controls_freeW(Control) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_controls_freeW", ControlMarshal, Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_control_free function frees an LDAPControl structure.
     * @param {Pointer<LDAPControlW>} Control The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_control_freew
     * @since windows6.0.6000
     */
    static ldap_control_freeW(Control) {
        result := DllCall("WLDAP32.dll\ldap_control_freeW", "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * Obsolete function which frees an array of LDAPControl structures.
     * @param {Pointer<Pointer<LDAPControlW>>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_free_controlsw
     * @since windows6.0.6000
     */
    static ldap_free_controlsW(Controls) {
        ControlsMarshal := Controls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_free_controlsW", ControlsMarshal, Controls, "CDecl uint")
        return result
    }

    /**
     * Obsolete function which frees an array of LDAPControl structures.
     * @param {Pointer<Pointer<LDAPControlA>>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_free_controlsa
     * @since windows6.0.6000
     */
    static ldap_free_controlsA(Controls) {
        ControlsMarshal := Controls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_free_controlsA", ControlsMarshal, Controls, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_result function parses responses from the server and returns the appropriate fields.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage The result of an LDAP operation as returned by one of the synchronous operation calls or by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> for an asynchronous operation.
     * @param {Pointer<Integer>} ReturnCode Indicates the outcome of the server operation that generated the original result message. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PSTR>} MatchedDNs A pointer to a wide, null-terminated string. In the case of a return of <b>LDAP_NO_SUCH_OBJECT</b>, this result parameter is filled in with a distinguished name indicating how much of the name in the request was recognized. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PSTR>} ErrorMessage A pointer to a wide, null-terminated string that contains the contents of the error message field from the <i>ResultMessage</i> parameter. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<Pointer<PSTR>>} Referrals A pointer to a wide, null-terminated string that contains the contents of the referrals field from the <i>ResultMessage</i> parameter, indicating zero or more alternate LDAP servers where the request should be retried. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<Pointer<Pointer<LDAPControlA>>>} ServerControls This result parameter is filled in with an allocated array of controls copied from the <i>ResultMessage</i> parameter.
     * @param {BOOLEAN} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_result
     * @since windows6.0.6000
     */
    static ldap_parse_result(Connection, ResultMessage, ReturnCode, MatchedDNs, ErrorMessage, Referrals, ServerControls, Freeit) {
        ReturnCodeMarshal := ReturnCode is VarRef ? "uint*" : "ptr"
        ReferralsMarshal := Referrals is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_result", "ptr", Connection, "ptr", ResultMessage, ReturnCodeMarshal, ReturnCode, "ptr", MatchedDNs, "ptr", ErrorMessage, ReferralsMarshal, Referrals, ServerControlsMarshal, ServerControls, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * Frees an array of LDAPControl structures.
     * @param {Pointer<Pointer<LDAPControlA>>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_controls_free
     * @since windows6.0.6000
     */
    static ldap_controls_free(Controls) {
        ControlsMarshal := Controls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_controls_free", ControlsMarshal, Controls, "CDecl uint")
        return result
    }

    /**
     * The ldap_control_free function frees an LDAPControl structure.
     * @param {Pointer<LDAPControlA>} Control The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_control_free
     * @since windows6.0.6000
     */
    static ldap_control_free(Control) {
        result := DllCall("WLDAP32.dll\ldap_control_free", "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * Obsolete function which frees an array of LDAPControl structures.
     * @param {Pointer<Pointer<LDAPControlA>>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_free_controls
     * @since windows6.0.6000
     */
    static ldap_free_controls(Controls) {
        ControlsMarshal := Controls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_free_controls", ControlsMarshal, Controls, "CDecl uint")
        return result
    }

    /**
     * Converts a numeric LDAP error code into a null-terminated character string that describes the error.
     * @param {Integer} err An LDAP error code as returned by another LDAP function.
     * @returns {PWSTR} If the function succeeds, a pointer to a null-terminated character string that describes the error, is returned.
     * 
     * If the function fails, a pointer to <b>NULL</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_err2stringw
     * @since windows6.0.6000
     */
    static ldap_err2stringW(err) {
        result := DllCall("WLDAP32.dll\ldap_err2stringW", "uint", err, "CDecl char*")
        return result
    }

    /**
     * Converts a numeric LDAP error code into a null-terminated character string that describes the error.
     * @param {Integer} err An LDAP error code as returned by another LDAP function.
     * @returns {PSTR} If the function succeeds, a pointer to a null-terminated character string that describes the error, is returned.
     * 
     * If the function fails, a pointer to <b>NULL</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_err2stringa
     * @since windows6.0.6000
     */
    static ldap_err2stringA(err) {
        result := DllCall("WLDAP32.dll\ldap_err2stringA", "uint", err, "CDecl char*")
        return result
    }

    /**
     * Converts a numeric LDAP error code into a null-terminated character string that describes the error.
     * @param {Integer} err An LDAP error code as returned by another LDAP function.
     * @returns {PSTR} If the function succeeds, a pointer to a null-terminated character string that describes the error, is returned.
     * 
     * If the function fails, a pointer to <b>NULL</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_err2string
     * @since windows6.0.6000
     */
    static ldap_err2string(err) {
        result := DllCall("WLDAP32.dll\ldap_err2string", "uint", err, "CDecl char*")
        return result
    }

    /**
     * Obsolete function. It exists only for compatibility.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {PSTR} msg A message.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_perror
     * @since windows6.0.6000
     */
    static ldap_perror(ld, msg) {
        msg := msg is String ? StrPtr(msg) : msg

        DllCall("WLDAP32.dll\ldap_perror", "ptr", ld, "ptr", msg, "CDecl ")
    }

    /**
     * The ldap_first_entry function returns the first entry of a message.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} res The search result, as obtained by a call to one of the synchronous search routines or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @returns {Pointer<LDAPMessage>} If the search returned valid results, this function returns a pointer to the first result entry. If no entry or reference exists in the result set, it returns <b>NULL</b>. This is the only error return; the session error parameter in the LDAP data structure is cleared to 0 in either case.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_first_entry
     * @since windows6.0.6000
     */
    static ldap_first_entry(ld, res) {
        result := DllCall("WLDAP32.dll\ldap_first_entry", "ptr", ld, "ptr", res, "CDecl ptr")
        return result
    }

    /**
     * The ldap_next_entry function retrieves an entry from a search result chain.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry returned by a previous call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or <b>ldap_next_entry</b>.
     * @returns {Pointer<LDAPMessage>} If the search returned valid results, this function returns a pointer to the next result entry in the results set. If no further entries or references exist in the result set, it returns <b>NULL</b>. This is the only error return; the session error parameter in the LDAP data structure is cleared to 0 in either case.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_next_entry
     * @since windows6.0.6000
     */
    static ldap_next_entry(ld, entry) {
        result := DllCall("WLDAP32.dll\ldap_next_entry", "ptr", ld, "ptr", entry, "CDecl ptr")
        return result
    }

    /**
     * The ldap_count_entries function counts the number of search entries that a server returned.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} res The search result obtained by a call to one of the synchronous search routines or to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @returns {Integer} If the function succeeds, it returns the number of entries.
     * 
     * If the function fails, the return value is –1 and the function sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_count_entries
     * @since windows6.0.6000
     */
    static ldap_count_entries(ld, res) {
        result := DllCall("WLDAP32.dll\ldap_count_entries", "ptr", ld, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * Returns the first attribute.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<Pointer<BerElement>>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {PWSTR} A pointer to a null-terminated string. If the function succeeds, it returns a pointer to an allocated buffer that contains the current attribute name. When there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_first_attributew
     * @since windows6.0.6000
     */
    static ldap_first_attributeW(ld, entry, ptr) {
        ptrMarshal := ptr is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_first_attributeW", "ptr", ld, "ptr", entry, ptrMarshal, ptr, "CDecl char*")
        return result
    }

    /**
     * Returns the first attribute.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<Pointer<BerElement>>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {PSTR} A pointer to a null-terminated string. If the function succeeds, it returns a pointer to an allocated buffer that contains the current attribute name. When there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_first_attributea
     * @since windows6.0.6000
     */
    static ldap_first_attributeA(ld, entry, ptr) {
        ptrMarshal := ptr is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_first_attributeA", "ptr", ld, "ptr", entry, ptrMarshal, ptr, "CDecl char*")
        return result
    }

    /**
     * Returns the first attribute.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<Pointer<BerElement>>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {PSTR} A pointer to a null-terminated string. If the function succeeds, it returns a pointer to an allocated buffer that contains the current attribute name. When there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_first_attribute
     * @since windows6.0.6000
     */
    static ldap_first_attribute(ld, entry, ptr) {
        ptrMarshal := ptr is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_first_attribute", "ptr", ld, "ptr", entry, ptrMarshal, ptr, "CDecl char*")
        return result
    }

    /**
     * Returns the next attribute.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<BerElement>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {PWSTR} If the function succeeds, it returns a pointer to a null-terminated string that contains the current attribute name. If there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_next_attributew
     * @since windows6.0.6000
     */
    static ldap_next_attributeW(ld, entry, ptr) {
        result := DllCall("WLDAP32.dll\ldap_next_attributeW", "ptr", ld, "ptr", entry, "ptr", ptr, "CDecl char*")
        return result
    }

    /**
     * Returns the next attribute.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<BerElement>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {PSTR} If the function succeeds, it returns a pointer to a null-terminated string that contains the current attribute name. If there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_next_attributea
     * @since windows6.0.6000
     */
    static ldap_next_attributeA(ld, entry, ptr) {
        result := DllCall("WLDAP32.dll\ldap_next_attributeA", "ptr", ld, "ptr", entry, "ptr", ptr, "CDecl char*")
        return result
    }

    /**
     * Returns the next attribute.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<BerElement>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {PSTR} If the function succeeds, it returns a pointer to a null-terminated string that contains the current attribute name. If there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_next_attribute
     * @since windows6.0.6000
     */
    static ldap_next_attribute(ld, entry, ptr) {
        result := DllCall("WLDAP32.dll\ldap_next_attribute", "ptr", ld, "ptr", entry, "ptr", ptr, "CDecl char*")
        return result
    }

    /**
     * The ldap_get_values function retrieves the list of values of a given attribute.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry from which to retrieve values.
     * @param {PWSTR} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<PWSTR>} If the function succeeds, it returns a null-terminated list of pointers to values. If no attribute values were found, it usually returns <b>NULL</b>. But in some cases it may return a list one pointer that is <b>NULL</b>. Always make sure to use <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a> to get the count of values in the returned list, as noted in Remarks. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_valuesw
     * @since windows6.0.6000
     */
    static ldap_get_valuesW(ld, entry, attr) {
        attr := attr is String ? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_valuesW", "ptr", ld, "ptr", entry, "ptr", attr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_values function retrieves the list of values of a given attribute.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry from which to retrieve values.
     * @param {PSTR} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a null-terminated list of pointers to values. If no attribute values were found, it usually returns <b>NULL</b>. But in some cases it may return a list one pointer that is <b>NULL</b>. Always make sure to use <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a> to get the count of values in the returned list, as noted in Remarks. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_valuesa
     * @since windows6.0.6000
     */
    static ldap_get_valuesA(ld, entry, attr) {
        attr := attr is String ? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_valuesA", "ptr", ld, "ptr", entry, "ptr", attr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_values function retrieves the list of values of a given attribute.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry from which to retrieve values.
     * @param {PSTR} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a null-terminated list of pointers to values. If no attribute values were found, it usually returns <b>NULL</b>. But in some cases it may return a list one pointer that is <b>NULL</b>. Always make sure to use <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a> to get the count of values in the returned list, as noted in Remarks. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_values
     * @since windows6.0.6000
     */
    static ldap_get_values(ld, entry, attr) {
        attr := attr is String ? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_values", "ptr", ld, "ptr", entry, "ptr", attr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_values_len function retrieves the list of values for a given attribute.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPMessage>} Message Handle to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure.
     * @param {PWSTR} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<Pointer<LDAP_BERVAL>>} If the function succeeds, it returns a null-terminated list of pointers to 
     * <a href="/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures that contain the values of the specified attribute. If no attribute values were found, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_values_lenw
     * @since windows6.0.6000
     */
    static ldap_get_values_lenW(ExternalHandle, Message, attr) {
        attr := attr is String ? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_values_lenW", "ptr", ExternalHandle, "ptr", Message, "ptr", attr, "CDecl ptr*")
        return result
    }

    /**
     * The ldap_get_values_len function retrieves the list of values for a given attribute.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPMessage>} Message Handle to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure.
     * @param {PSTR} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<Pointer<LDAP_BERVAL>>} If the function succeeds, it returns a null-terminated list of pointers to 
     * <a href="/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures that contain the values of the specified attribute. If no attribute values were found, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_values_lena
     * @since windows6.0.6000
     */
    static ldap_get_values_lenA(ExternalHandle, Message, attr) {
        attr := attr is String ? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_values_lenA", "ptr", ExternalHandle, "ptr", Message, "ptr", attr, "CDecl ptr*")
        return result
    }

    /**
     * The ldap_get_values_len function retrieves the list of values for a given attribute.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPMessage>} Message Handle to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure.
     * @param {PSTR} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<Pointer<LDAP_BERVAL>>} If the function succeeds, it returns a null-terminated list of pointers to 
     * <a href="/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures that contain the values of the specified attribute. If no attribute values were found, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_values_len
     * @since windows6.0.6000
     */
    static ldap_get_values_len(ExternalHandle, Message, attr) {
        attr := attr is String ? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_values_len", "ptr", ExternalHandle, "ptr", Message, "ptr", attr, "CDecl ptr*")
        return result
    }

    /**
     * The ldap_count_values function counts the number of values in a list.
     * @param {Pointer<PWSTR>} vals An array of null-terminated strings (values) returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * @returns {Integer} This function returns the number of values in the array. There is no error return.
     * 
     * If a <b>NULL</b> pointer is passed as the argument, 0 is returned. If an invalid argument is passed, the value returned is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_count_valuesw
     * @since windows6.0.6000
     */
    static ldap_count_valuesW(vals) {
        result := DllCall("WLDAP32.dll\ldap_count_valuesW", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_count_values function counts the number of values in a list.
     * @param {Pointer<PSTR>} vals An array of null-terminated strings (values) returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * @returns {Integer} This function returns the number of values in the array. There is no error return.
     * 
     * If a <b>NULL</b> pointer is passed as the argument, 0 is returned. If an invalid argument is passed, the value returned is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_count_valuesa
     * @since windows6.0.6000
     */
    static ldap_count_valuesA(vals) {
        result := DllCall("WLDAP32.dll\ldap_count_valuesA", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_count_values function counts the number of values in a list.
     * @param {Pointer<PSTR>} vals An array of null-terminated strings (values) returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * @returns {Integer} This function returns the number of values in the array. There is no error return.
     * 
     * If a <b>NULL</b> pointer is passed as the argument, 0 is returned. If an invalid argument is passed, the value returned is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_count_values
     * @since windows6.0.6000
     */
    static ldap_count_values(vals) {
        result := DllCall("WLDAP32.dll\ldap_count_values", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * Counts the number of values in a list.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} vals An array of values returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values_len">ldap_get_values_len</a>.
     * @returns {Integer} This function returns the number of values in the array. There is no error return.
     * 
     * If a <b>NULL</b> pointer is passed as the argument, 0 is returned. If an invalid argument is passed, the value returned is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_count_values_len
     * @since windows6.0.6000
     */
    static ldap_count_values_len(vals) {
        valsMarshal := vals is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_count_values_len", valsMarshal, vals, "CDecl uint")
        return result
    }

    /**
     * Frees a structure returned by ldap_get_values.
     * @param {Pointer<PWSTR>} vals The structure to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_value_freew
     * @since windows6.0.6000
     */
    static ldap_value_freeW(vals) {
        result := DllCall("WLDAP32.dll\ldap_value_freeW", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * Frees a structure returned by ldap_get_values.
     * @param {Pointer<PSTR>} vals The structure to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_value_freea
     * @since windows6.0.6000
     */
    static ldap_value_freeA(vals) {
        result := DllCall("WLDAP32.dll\ldap_value_freeA", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * Frees a structure returned by ldap_get_values.
     * @param {Pointer<PSTR>} vals The structure to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_value_free
     * @since windows6.0.6000
     */
    static ldap_value_free(vals) {
        result := DllCall("WLDAP32.dll\ldap_value_free", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_value_free_len frees berval structures that were returned by ldap_get_values_len.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} vals The structure to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_value_free_len
     * @since windows6.0.6000
     */
    static ldap_value_free_len(vals) {
        valsMarshal := vals is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_value_free_len", valsMarshal, vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_get_dn function retrieves the distinguished name for a given entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose distinguished name is to be retrieved.
     * @returns {PWSTR} If the function succeeds, it returns the distinguished name as a pointer to a null-terminated character string.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_dnw
     * @since windows6.0.6000
     */
    static ldap_get_dnW(ld, entry) {
        result := DllCall("WLDAP32.dll\ldap_get_dnW", "ptr", ld, "ptr", entry, "CDecl char*")
        return result
    }

    /**
     * The ldap_get_dn function retrieves the distinguished name for a given entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose distinguished name is to be retrieved.
     * @returns {PSTR} If the function succeeds, it returns the distinguished name as a pointer to a null-terminated character string.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_dna
     * @since windows6.0.6000
     */
    static ldap_get_dnA(ld, entry) {
        result := DllCall("WLDAP32.dll\ldap_get_dnA", "ptr", ld, "ptr", entry, "CDecl char*")
        return result
    }

    /**
     * The ldap_get_dn function retrieves the distinguished name for a given entry.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose distinguished name is to be retrieved.
     * @returns {PSTR} If the function succeeds, it returns the distinguished name as a pointer to a null-terminated character string.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameters in the 
     * <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_dn
     * @since windows6.0.6000
     */
    static ldap_get_dn(ld, entry) {
        result := DllCall("WLDAP32.dll\ldap_get_dn", "ptr", ld, "ptr", entry, "CDecl char*")
        return result
    }

    /**
     * The ldap_explode_dn function breaks up an entry name into its component parts.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name to explode.  The string that this pointer refers to cannot be a constant string.
     * @param {Integer} notypes Indicates whether the type information components should be removed.
     * @returns {Pointer<PWSTR>} If the function succeeds, it returns a null-terminated character array containing the relative distinguished name components of the distinguished name supplied.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_explode_dnw
     * @since windows6.0.6000
     */
    static ldap_explode_dnW(dn, notypes) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_explode_dnW", "ptr", dn, "uint", notypes, "CDecl ptr")
        return result
    }

    /**
     * The ldap_explode_dn function breaks up an entry name into its component parts.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name to explode.  The string that this pointer refers to cannot be a constant string.
     * @param {Integer} notypes Indicates whether the type information components should be removed.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a null-terminated character array containing the relative distinguished name components of the distinguished name supplied.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_explode_dna
     * @since windows6.0.6000
     */
    static ldap_explode_dnA(dn, notypes) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_explode_dnA", "ptr", dn, "uint", notypes, "CDecl ptr")
        return result
    }

    /**
     * The ldap_explode_dn function breaks up an entry name into its component parts.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name to explode.  The string that this pointer refers to cannot be a constant string.
     * @param {Integer} notypes Indicates whether the type information components should be removed.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a null-terminated character array containing the relative distinguished name components of the distinguished name supplied.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_explode_dn
     * @since windows6.0.6000
     */
    static ldap_explode_dn(dn, notypes) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_explode_dn", "ptr", dn, "uint", notypes, "CDecl ptr")
        return result
    }

    /**
     * Converts a distinguished name to a user-friendly format.
     * @param {PWSTR} dn A pointer to a null-terminated string that contains the distinguished name to convert.
     * @returns {PWSTR} If the function is successful, the user-friendly name is returned as a pointer to a null-terminated character string.
     * 
     * If the function fails, <b>NULL</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_dn2ufnw
     * @since windows6.0.6000
     */
    static ldap_dn2ufnW(dn) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_dn2ufnW", "ptr", dn, "CDecl char*")
        return result
    }

    /**
     * Converts a distinguished name to a user-friendly format.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name to convert.
     * @returns {PSTR} If the function is successful, the user-friendly name is returned as a pointer to a null-terminated character string.
     * 
     * If the function fails, <b>NULL</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_dn2ufna
     * @since windows6.0.6000
     */
    static ldap_dn2ufnA(dn) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_dn2ufnA", "ptr", dn, "CDecl char*")
        return result
    }

    /**
     * Converts a distinguished name to a user-friendly format.
     * @param {PSTR} dn A pointer to a null-terminated string that contains the distinguished name to convert.
     * @returns {PSTR} If the function is successful, the user-friendly name is returned as a pointer to a null-terminated character string.
     * 
     * If the function fails, <b>NULL</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_dn2ufn
     * @since windows6.0.6000
     */
    static ldap_dn2ufn(dn) {
        dn := dn is String ? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_dn2ufn", "ptr", dn, "CDecl char*")
        return result
    }

    /**
     * Frees memory allocated from the LDAP heap.
     * @param {PWSTR} Block A pointer to a null-terminated string that contains a pointer to memory allocated by the LDAP library.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_memfreew
     * @since windows6.0.6000
     */
    static ldap_memfreeW(Block) {
        Block := Block is String ? StrPtr(Block) : Block

        DllCall("WLDAP32.dll\ldap_memfreeW", "ptr", Block, "CDecl ")
    }

    /**
     * Frees memory allocated from the LDAP heap.
     * @param {PSTR} Block A pointer to a null-terminated string that contains a pointer to memory allocated by the LDAP library.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_memfreea
     * @since windows6.0.6000
     */
    static ldap_memfreeA(Block) {
        Block := Block is String ? StrPtr(Block) : Block

        DllCall("WLDAP32.dll\ldap_memfreeA", "ptr", Block, "CDecl ")
    }

    /**
     * The ber_bvfree function frees a berval structure.
     * @param {Pointer<LDAP_BERVAL>} bv TBD
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ber_bvfree
     * @since windows6.0.6000
     */
    static ber_bvfree(bv) {
        DllCall("WLDAP32.dll\ber_bvfree", "ptr", bv, "CDecl ")
    }

    /**
     * Frees memory allocated from the LDAP heap.
     * @param {PSTR} Block A pointer to a null-terminated string that contains a pointer to memory allocated by the LDAP library.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_memfree
     * @since windows6.0.6000
     */
    static ldap_memfree(Block) {
        Block := Block is String ? StrPtr(Block) : Block

        DllCall("WLDAP32.dll\ldap_memfree", "ptr", Block, "CDecl ")
    }

    /**
     * Converts a user-friendly name to a distinguished name.
     * @param {PWSTR} ufn Pointer to a null-terminated string that contains the user-friendly name to convert.
     * @param {Pointer<PWSTR>} pDn Pointer to a variable that receives a pointer to a null-terminated string that contains the resulting distinguished name.
     * 
     * If the <i>pDn</i> parameter returns non-<b>NULL</b>, free it with a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_ufn2dnw
     * @since windows6.0.6000
     */
    static ldap_ufn2dnW(ufn, pDn) {
        ufn := ufn is String ? StrPtr(ufn) : ufn

        result := DllCall("WLDAP32.dll\ldap_ufn2dnW", "ptr", ufn, "ptr", pDn, "CDecl uint")
        return result
    }

    /**
     * Converts a user-friendly name to a distinguished name.
     * @param {PSTR} ufn Pointer to a null-terminated string that contains the user-friendly name to convert.
     * @param {Pointer<PSTR>} pDn Pointer to a variable that receives a pointer to a null-terminated string that contains the resulting distinguished name.
     * 
     * If the <i>pDn</i> parameter returns non-<b>NULL</b>, free it with a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_ufn2dna
     * @since windows6.0.6000
     */
    static ldap_ufn2dnA(ufn, pDn) {
        ufn := ufn is String ? StrPtr(ufn) : ufn

        result := DllCall("WLDAP32.dll\ldap_ufn2dnA", "ptr", ufn, "ptr", pDn, "CDecl uint")
        return result
    }

    /**
     * Converts a user-friendly name to a distinguished name.
     * @param {PSTR} ufn Pointer to a null-terminated string that contains the user-friendly name to convert.
     * @param {Pointer<PSTR>} pDn Pointer to a variable that receives a pointer to a null-terminated string that contains the resulting distinguished name.
     * 
     * If the <i>pDn</i> parameter returns non-<b>NULL</b>, free it with a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_ufn2dn
     * @since windows6.0.6000
     */
    static ldap_ufn2dn(ufn, pDn) {
        ufn := ufn is String ? StrPtr(ufn) : ufn

        result := DllCall("WLDAP32.dll\ldap_ufn2dn", "ptr", ufn, "ptr", pDn, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Pointer<LDAP_VERSION_INFO>} version 
     * @param {Pointer<HANDLE>} Instance 
     * @returns {Integer} 
     */
    static ldap_startup(version, Instance) {
        result := DllCall("WLDAP32.dll\ldap_startup", "ptr", version, "ptr", Instance, "CDecl uint")
        return result
    }

    /**
     * Warning  The ldap_cleanup function may cause unpredictable behavior at DLL unload time so, there is no way to safely clean up resources when dynamically loading and unloading the wldap32.dll.Because of this, resource leaks can occur on unload of the library. Use of ldap_cleanup is therefore not recommended and, is at your own risk. .
     * @param {HANDLE} hInstance This parameter is ignored.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     *        <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_cleanup
     * @since windows6.0.6000
     */
    static ldap_cleanup(hInstance) {
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance

        result := DllCall("WLDAP32.dll\ldap_cleanup", "ptr", hInstance, "CDecl uint")
        return result
    }

    /**
     * The ldap_escape_filter_element function converts a filter element to a null-terminated character string that can be passed safely in a search filter.
     * @param {Pointer} sourceFilterElement A pointer to a null-terminated string that contains the filter element to convert.
     * @param {Integer} sourceLength The length, in bytes, of the source filter element.
     * @param {Pointer} destFilterElement A pointer to a null-terminated character string.
     * @param {Integer} destLength The length, in bytes, of the <i>destFilterElement</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_escape_filter_elementw
     * @since windows6.0.6000
     */
    static ldap_escape_filter_elementW(sourceFilterElement, sourceLength, destFilterElement, destLength) {
        result := DllCall("WLDAP32.dll\ldap_escape_filter_elementW", "ptr", sourceFilterElement, "uint", sourceLength, "ptr", destFilterElement, "uint", destLength, "CDecl uint")
        return result
    }

    /**
     * The ldap_escape_filter_element function converts a filter element to a null-terminated character string that can be passed safely in a search filter.
     * @param {Pointer} sourceFilterElement A pointer to a null-terminated string that contains the filter element to convert.
     * @param {Integer} sourceLength The length, in bytes, of the source filter element.
     * @param {Pointer} destFilterElement A pointer to a null-terminated character string.
     * @param {Integer} destLength The length, in bytes, of the <i>destFilterElement</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_escape_filter_elementa
     * @since windows6.0.6000
     */
    static ldap_escape_filter_elementA(sourceFilterElement, sourceLength, destFilterElement, destLength) {
        result := DllCall("WLDAP32.dll\ldap_escape_filter_elementA", "ptr", sourceFilterElement, "uint", sourceLength, "ptr", destFilterElement, "uint", destLength, "CDecl uint")
        return result
    }

    /**
     * The ldap_escape_filter_element function converts a filter element to a null-terminated character string that can be passed safely in a search filter.
     * @param {Pointer} sourceFilterElement A pointer to a null-terminated string that contains the filter element to convert.
     * @param {Integer} sourceLength The length, in bytes, of the source filter element.
     * @param {Pointer} destFilterElement A pointer to a null-terminated character string.
     * @param {Integer} destLength The length, in bytes, of the <i>destFilterElement</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_escape_filter_element
     * @since windows6.0.6000
     */
    static ldap_escape_filter_element(sourceFilterElement, sourceLength, destFilterElement, destLength) {
        result := DllCall("WLDAP32.dll\ldap_escape_filter_element", "ptr", sourceFilterElement, "uint", sourceLength, "ptr", destFilterElement, "uint", destLength, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Integer} NewFlags 
     * @returns {Integer} 
     */
    static ldap_set_dbg_flags(NewFlags) {
        result := DllCall("WLDAP32.dll\ldap_set_dbg_flags", "uint", NewFlags, "CDecl uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DBGPRINT>} DebugPrintRoutine 
     * @returns {String} Nothing - always returns an empty string
     */
    static ldap_set_dbg_routine(DebugPrintRoutine) {
        DllCall("WLDAP32.dll\ldap_set_dbg_routine", "ptr", DebugPrintRoutine, "CDecl ")
    }

    /**
     * Used to translate strings for modules that do not have the UTF-8 code page.
     * @param {PSTR} lpSrcStr A pointer to a null-terminated UTF-8 string to convert.
     * @param {Integer} cchSrc An integer that specifies the size, in characters, of the <i>lpSrcStr</i> string.
     * @param {PWSTR} lpDestStr A pointer to a buffer that receives the converted Unicode string, without a null terminator.
     * @param {Integer} cchDest An integer that specifies the size, in characters, of the <i>lpDestStr</i> buffer.
     * @returns {Integer} The return value is the number of characters written to the <i>lpDestStr</i> buffer.
     *       If the <i>lpDestStr</i> buffer is too small, <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * When the <i>cchDest</i> parameter is zero, the required size of the destination buffer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldaputf8tounicode
     * @since windows6.0.6000
     */
    static LdapUTF8ToUnicode(lpSrcStr, cchSrc, lpDestStr, cchDest) {
        lpSrcStr := lpSrcStr is String ? StrPtr(lpSrcStr) : lpSrcStr
        lpDestStr := lpDestStr is String ? StrPtr(lpDestStr) : lpDestStr

        A_LastError := 0

        result := DllCall("WLDAP32.dll\LdapUTF8ToUnicode", "ptr", lpSrcStr, "int", cchSrc, "ptr", lpDestStr, "int", cchDest, "CDecl int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Converts Unicode strings to UTF-8.
     * @param {PWSTR} lpSrcStr A pointer to a null-terminated Unicode string to convert.
     * @param {Integer} cchSrc An integer that specifies the size, in characters, of the <i>lpSrcStr</i> string.
     * @param {PSTR} lpDestStr A pointer to a buffer that receives the converted UTF-8 character string, without a null terminator.
     * @param {Integer} cchDest An integer that specifies the size, in characters, of the <i>lpDestStr</i> buffer.
     * @returns {Integer} The return value is the size, in characters, written to the <i>lpDestStr</i> buffer.
     *       If the <i>lpDestStr</i> buffer is too small, <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * 
     * When the <i>cchDest</i> parameter is zero, the required size of the destination buffer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldapunicodetoutf8
     * @since windows6.0.6000
     */
    static LdapUnicodeToUTF8(lpSrcStr, cchSrc, lpDestStr, cchDest) {
        lpSrcStr := lpSrcStr is String ? StrPtr(lpSrcStr) : lpSrcStr
        lpDestStr := lpDestStr is String ? StrPtr(lpDestStr) : lpDestStr

        A_LastError := 0

        result := DllCall("WLDAP32.dll\LdapUnicodeToUTF8", "ptr", lpSrcStr, "int", cchSrc, "ptr", lpDestStr, "int", cchDest, "CDecl int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The ldap_create_sort_control function is used to format a list of sort keys into a search control. Support for controls is available effective with LDAP 3, but whether the sort control is supported or not is dependent on the particular server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPSortKeyA>>} SortKeys Pointer to an array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures. Each structure in the array specifies the name of an attribute to use as a sort key, the matching rule for that key, and whether the sort order is ascending or descending.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search. 0 ==&gt; FALSE, !0 ==&gt; TRUE.
     * @param {Pointer<Pointer<LDAPControlA>>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_create_sort_controla
     * @since windows6.0.6000
     */
    static ldap_create_sort_controlA(ExternalHandle, SortKeys, IsCritical, Control) {
        SortKeysMarshal := SortKeys is VarRef ? "ptr*" : "ptr"
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_create_sort_controlA", "ptr", ExternalHandle, SortKeysMarshal, SortKeys, "char", IsCritical, ControlMarshal, Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_create_sort_control function is used to format a list of sort keys into a search control. Support for controls is available effective with LDAP 3, but whether the sort control is supported or not is dependent on the particular server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPSortKeyW>>} SortKeys Pointer to an array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures. Each structure in the array specifies the name of an attribute to use as a sort key, the matching rule for that key, and whether the sort order is ascending or descending.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search. 0 ==&gt; FALSE, !0 ==&gt; TRUE.
     * @param {Pointer<Pointer<LDAPControlW>>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_create_sort_controlw
     * @since windows6.0.6000
     */
    static ldap_create_sort_controlW(ExternalHandle, SortKeys, IsCritical, Control) {
        SortKeysMarshal := SortKeys is VarRef ? "ptr*" : "ptr"
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_create_sort_controlW", "ptr", ExternalHandle, SortKeysMarshal, SortKeys, "char", IsCritical, ControlMarshal, Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_sort_control function parses the sort control returned by the server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPControlA>>} Control The control returned from the server, as obtained from a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<Integer>} Result The result code.
     * @param {Pointer<PSTR>} Attribute A pointer to a null-terminated string that contains the name of the attribute that caused the operation to fail.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_sort_controla
     * @since windows6.0.6000
     */
    static ldap_parse_sort_controlA(ExternalHandle, Control, Result, Attribute) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"
        ResultMarshal := Result is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_sort_controlA", "ptr", ExternalHandle, ControlMarshal, Control, ResultMarshal, Result, "ptr", Attribute, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_sort_control function parses the sort control returned by the server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPControlW>>} Control The control returned from the server, as obtained from a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<Integer>} Result The result code.
     * @param {Pointer<PWSTR>} Attribute A pointer to a null-terminated string that contains the name of the attribute that caused the operation to fail.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_sort_controlw
     * @since windows6.0.6000
     */
    static ldap_parse_sort_controlW(ExternalHandle, Control, Result, Attribute) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"
        ResultMarshal := Result is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_sort_controlW", "ptr", ExternalHandle, ControlMarshal, Control, ResultMarshal, Result, "ptr", Attribute, "CDecl uint")
        return result
    }

    /**
     * The ldap_create_sort_control function is used to format a list of sort keys into a search control. Support for controls is available effective with LDAP 3, but whether the sort control is supported or not is dependent on the particular server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPSortKeyA>>} SortKeys Pointer to an array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures. Each structure in the array specifies the name of an attribute to use as a sort key, the matching rule for that key, and whether the sort order is ascending or descending.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search. 0 ==&gt; FALSE, !0 ==&gt; TRUE.
     * @param {Pointer<Pointer<LDAPControlA>>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_create_sort_control
     * @since windows6.0.6000
     */
    static ldap_create_sort_control(ExternalHandle, SortKeys, IsCritical, Control) {
        SortKeysMarshal := SortKeys is VarRef ? "ptr*" : "ptr"
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_create_sort_control", "ptr", ExternalHandle, SortKeysMarshal, SortKeys, "char", IsCritical, ControlMarshal, Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_sort_control function parses the sort control returned by the server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPControlA>>} Control The control returned from the server, as obtained from a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<Integer>} Result The result code.
     * @param {Pointer<PSTR>} Attribute A pointer to a null-terminated string that contains the name of the attribute that caused the operation to fail.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_sort_control
     * @since windows6.0.6000
     */
    static ldap_parse_sort_control(ExternalHandle, Control, Result, Attribute) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"
        ResultMarshal := Result is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_sort_control", "ptr", ExternalHandle, ControlMarshal, Control, ResultMarshal, Result, "ptr", Attribute, "CDecl uint")
        return result
    }

    /**
     * The ldap_encode_sort_control function formats a list of sort keys into a search control. This function is obsolete. Instead, use ldap_create_sort_control.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPSortKeyW>>} SortKeys A list of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures.
     * @param {Pointer<LDAPControlW>} Control Pointer to the new control.
     * @param {BOOLEAN} Criticality Notifies the server whether this control is critical to the search.
     * @returns {Integer} If the call completed successfully, <b>LDAP_SUCCESS</b> is returned. Other standard LDAP return values, such as <b>LDAP_NO_MEMORY</b> or <b>LDAP_PARAM_ERROR</b>, may also be returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_encode_sort_controlw
     * @since windows6.0.6000
     */
    static ldap_encode_sort_controlW(ExternalHandle, SortKeys, Control, Criticality) {
        SortKeysMarshal := SortKeys is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_encode_sort_controlW", "ptr", ExternalHandle, SortKeysMarshal, SortKeys, "ptr", Control, "char", Criticality, "CDecl uint")
        return result
    }

    /**
     * The ldap_encode_sort_control function formats a list of sort keys into a search control. This function is obsolete. Instead, use ldap_create_sort_control.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPSortKeyA>>} SortKeys A list of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures.
     * @param {Pointer<LDAPControlA>} Control Pointer to the new control.
     * @param {BOOLEAN} Criticality Notifies the server whether this control is critical to the search.
     * @returns {Integer} If the call completed successfully, <b>LDAP_SUCCESS</b> is returned. Other standard LDAP return values, such as <b>LDAP_NO_MEMORY</b> or <b>LDAP_PARAM_ERROR</b>, may also be returned.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_encode_sort_controla
     * @since windows6.0.6000
     */
    static ldap_encode_sort_controlA(ExternalHandle, SortKeys, Control, Criticality) {
        SortKeysMarshal := SortKeys is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_encode_sort_controlA", "ptr", ExternalHandle, SortKeysMarshal, SortKeys, "ptr", Control, "char", Criticality, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_create_page_control function to create a basic control for paging results. Support for controls is available effective with LDAP 3, but whether the page control is supported or not is dependent on the particular server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Integer} PageSize The number of entries to return in each page.
     * @param {Pointer<LDAP_BERVAL>} Cookie Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure that the server uses to determine its location in the result set. This is an opaque structure that you should not access directly. Set to <b>NULL</b> for the first call to <b>ldap_create_page_control</b>.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search.
     * @param {Pointer<Pointer<LDAPControlW>>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_create_page_controlw
     * @since windows6.0.6000
     */
    static ldap_create_page_controlW(ExternalHandle, PageSize, Cookie, IsCritical, Control) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_create_page_controlW", "ptr", ExternalHandle, "uint", PageSize, "ptr", Cookie, "char", IsCritical, ControlMarshal, Control, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_create_page_control function to create a basic control for paging results. Support for controls is available effective with LDAP 3, but whether the page control is supported or not is dependent on the particular server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Integer} PageSize The number of entries to return in each page.
     * @param {Pointer<LDAP_BERVAL>} Cookie Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure that the server uses to determine its location in the result set. This is an opaque structure that you should not access directly. Set to <b>NULL</b> for the first call to <b>ldap_create_page_control</b>.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search.
     * @param {Pointer<Pointer<LDAPControlA>>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_create_page_controla
     * @since windows6.0.6000
     */
    static ldap_create_page_controlA(ExternalHandle, PageSize, Cookie, IsCritical, Control) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_create_page_controlA", "ptr", ExternalHandle, "uint", PageSize, "ptr", Cookie, "char", IsCritical, ControlMarshal, Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_page_control parses the results of a search into pages.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls An array of controls that includes a page control. The page control contains the cookie and total count fields returned by the server.
     * @param {Pointer<Integer>} TotalCount A pointer to the total count of entries returned in this page (optional).
     * @param {Pointer<Pointer<LDAP_BERVAL>>} Cookie An opaque cookie, used by the server to determine its location in the result set. Use ber_bvfree to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_page_controlw
     * @since windows6.0.6000
     */
    static ldap_parse_page_controlW(ExternalHandle, ServerControls, TotalCount, Cookie) {
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        TotalCountMarshal := TotalCount is VarRef ? "uint*" : "ptr"
        CookieMarshal := Cookie is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_page_controlW", "ptr", ExternalHandle, ServerControlsMarshal, ServerControls, TotalCountMarshal, TotalCount, CookieMarshal, Cookie, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_page_control parses the results of a search into pages.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls An array of controls that includes a page control. The page control contains the cookie and total count fields returned by the server.
     * @param {Pointer<Integer>} TotalCount A pointer to the total count of entries returned in this page (optional).
     * @param {Pointer<Pointer<LDAP_BERVAL>>} Cookie An opaque cookie, used by the server to determine its location in the result set. Use ber_bvfree to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_page_controla
     * @since windows6.0.6000
     */
    static ldap_parse_page_controlA(ExternalHandle, ServerControls, TotalCount, Cookie) {
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        TotalCountMarshal := TotalCount is VarRef ? "uint*" : "ptr"
        CookieMarshal := Cookie is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_page_controlA", "ptr", ExternalHandle, ServerControlsMarshal, ServerControls, TotalCountMarshal, TotalCount, CookieMarshal, Cookie, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_create_page_control function to create a basic control for paging results. Support for controls is available effective with LDAP 3, but whether the page control is supported or not is dependent on the particular server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Integer} PageSize The number of entries to return in each page.
     * @param {Pointer<LDAP_BERVAL>} Cookie Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure that the server uses to determine its location in the result set. This is an opaque structure that you should not access directly. Set to <b>NULL</b> for the first call to <b>ldap_create_page_control</b>.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search.
     * @param {Pointer<Pointer<LDAPControlA>>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_create_page_control
     * @since windows6.0.6000
     */
    static ldap_create_page_control(ExternalHandle, PageSize, Cookie, IsCritical, Control) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_create_page_control", "ptr", ExternalHandle, "uint", PageSize, "ptr", Cookie, "char", IsCritical, ControlMarshal, Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_page_control parses the results of a search into pages.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls An array of controls that includes a page control. The page control contains the cookie and total count fields returned by the server.
     * @param {Pointer<Integer>} TotalCount A pointer to the total count of entries returned in this page (optional).
     * @param {Pointer<Pointer<LDAP_BERVAL>>} Cookie An opaque cookie, used by the server to determine its location in the result set. Use ber_bvfree to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_page_control
     * @since windows6.0.6000
     */
    static ldap_parse_page_control(ExternalHandle, ServerControls, TotalCount, Cookie) {
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        TotalCountMarshal := TotalCount is VarRef ? "uint*" : "ptr"
        CookieMarshal := Cookie is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_page_control", "ptr", ExternalHandle, ServerControlsMarshal, ServerControls, TotalCountMarshal, TotalCount, CookieMarshal, Cookie, "CDecl uint")
        return result
    }

    /**
     * Initializes a search block for a simple paged-results search.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PWSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} ScopeOfSearch 
     * @param {PWSTR} SearchFilter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} AttributeList A null-terminated array of null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} AttributesOnly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls A list of client controls.
     * @param {Integer} PageTimeLimit The time value, in seconds, that the client will wait for the server to return a page.
     * @param {Integer} TotalSizeLimit The maximum number of entries the client will accept.  The <i>TotalSizeLimit</i> value affects only the individual pages within the paged search (not the overall paged search).  So if <i>TotalSizeLimit</i> is greater than page size, then <i>TotalSizeLimit</i> will have no effect.
     * @param {Pointer<Pointer<LDAPSortKeyW>>} SortKeys A pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure, which specifies the attribute type, the ordering rule, and the direction for the search.
     * @returns {PLDAPSearch} If the function succeeds, it returns a pointer to an 
     * <a href="/previous-versions/windows/desktop/legacy/aa366129(v=vs.85)">LDAPSearch</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>. Use 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> or 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * 
     * Call the <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_abandon_page">ldap_search_abandon_page</a> to free the returned structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_init_pagew
     * @since windows6.0.6000
     */
    static ldap_search_init_pageW(ExternalHandle, DistinguishedName, ScopeOfSearch, SearchFilter, AttributeList, AttributesOnly, ServerControls, ClientControls, PageTimeLimit, TotalSizeLimit, SortKeys) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        SearchFilter := SearchFilter is String ? StrPtr(SearchFilter) : SearchFilter

        AttributeListMarshal := AttributeList is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        SortKeysMarshal := SortKeys is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WLDAP32.dll\ldap_search_init_pageW", "ptr", ExternalHandle, "ptr", DistinguishedName, "uint", ScopeOfSearch, "ptr", SearchFilter, AttributeListMarshal, AttributeList, "uint", AttributesOnly, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "uint", PageTimeLimit, "uint", TotalSizeLimit, SortKeysMarshal, SortKeys, "CDecl ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a search block for a simple paged-results search.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} ScopeOfSearch 
     * @param {PSTR} SearchFilter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} AttributeList A null-terminated array of null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} AttributesOnly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @param {Integer} PageTimeLimit The time value, in seconds, that the client will wait for the server to return a page.
     * @param {Integer} TotalSizeLimit The maximum number of entries the client will accept.  The <i>TotalSizeLimit</i> value affects only the individual pages within the paged search (not the overall paged search).  So if <i>TotalSizeLimit</i> is greater than page size, then <i>TotalSizeLimit</i> will have no effect.
     * @param {Pointer<Pointer<LDAPSortKeyA>>} SortKeys A pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure, which specifies the attribute type, the ordering rule, and the direction for the search.
     * @returns {PLDAPSearch} If the function succeeds, it returns a pointer to an 
     * <a href="/previous-versions/windows/desktop/legacy/aa366129(v=vs.85)">LDAPSearch</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>. Use 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> or 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * 
     * Call the <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_abandon_page">ldap_search_abandon_page</a> to free the returned structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_init_pagea
     * @since windows6.0.6000
     */
    static ldap_search_init_pageA(ExternalHandle, DistinguishedName, ScopeOfSearch, SearchFilter, AttributeList, AttributesOnly, ServerControls, ClientControls, PageTimeLimit, TotalSizeLimit, SortKeys) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        SearchFilter := SearchFilter is String ? StrPtr(SearchFilter) : SearchFilter

        AttributeListMarshal := AttributeList is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        SortKeysMarshal := SortKeys is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WLDAP32.dll\ldap_search_init_pageA", "ptr", ExternalHandle, "ptr", DistinguishedName, "uint", ScopeOfSearch, "ptr", SearchFilter, AttributeListMarshal, AttributeList, "uint", AttributesOnly, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "uint", PageTimeLimit, "uint", TotalSizeLimit, SortKeysMarshal, SortKeys, "CDecl ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a search block for a simple paged-results search.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} ScopeOfSearch 
     * @param {PSTR} SearchFilter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<Pointer<Integer>>} AttributeList A null-terminated array of null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} AttributesOnly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls A list of LDAP server controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls A list of client controls.
     * @param {Integer} PageTimeLimit The time value, in seconds, that the client will wait for the server to return a page.
     * @param {Integer} TotalSizeLimit The maximum number of entries the client will accept.  The <i>TotalSizeLimit</i> value affects only the individual pages within the paged search (not the overall paged search).  So if <i>TotalSizeLimit</i> is greater than page size, then <i>TotalSizeLimit</i> will have no effect.
     * @param {Pointer<Pointer<LDAPSortKeyA>>} SortKeys A pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure, which specifies the attribute type, the ordering rule, and the direction for the search.
     * @returns {PLDAPSearch} If the function succeeds, it returns a pointer to an 
     * <a href="/previous-versions/windows/desktop/legacy/aa366129(v=vs.85)">LDAPSearch</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>. Use 
     * <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> or 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * 
     * Call the <a href="/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_abandon_page">ldap_search_abandon_page</a> to free the returned structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_init_page
     * @since windows6.0.6000
     */
    static ldap_search_init_page(ExternalHandle, DistinguishedName, ScopeOfSearch, SearchFilter, AttributeList, AttributesOnly, ServerControls, ClientControls, PageTimeLimit, TotalSizeLimit, SortKeys) {
        DistinguishedName := DistinguishedName is String ? StrPtr(DistinguishedName) : DistinguishedName
        SearchFilter := SearchFilter is String ? StrPtr(SearchFilter) : SearchFilter

        AttributeListMarshal := AttributeList is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        SortKeysMarshal := SortKeys is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WLDAP32.dll\ldap_search_init_page", "ptr", ExternalHandle, "ptr", DistinguishedName, "uint", ScopeOfSearch, "ptr", SearchFilter, AttributeListMarshal, AttributeList, "uint", AttributesOnly, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "uint", PageTimeLimit, "uint", TotalSizeLimit, SortKeysMarshal, SortKeys, "CDecl ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the next page in a sequence of asynchronous paged search results.
     * @param {Pointer<LDAP>} ExternalHandle Session handle.
     * @param {PLDAPSearch} SearchHandle Search block handle.
     * @param {Integer} PageSize The number of entries to return in a single page.
     * @param {Pointer<Integer>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code return value. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_next_page
     * @since windows6.0.6000
     */
    static ldap_get_next_page(ExternalHandle, SearchHandle, PageSize, MessageNumber) {
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_get_next_page", "ptr", ExternalHandle, "ptr", SearchHandle, "uint", PageSize, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Returns the next page in a sequence of synchronous paged search results.
     * @param {Pointer<LDAP>} ExternalHandle Session handle.
     * @param {PLDAPSearch} SearchHandle Search block handle.
     * @param {Pointer<LDAP_TIMEVAL>} timeout The time value, in seconds, that the client will wait for the call to return.
     * @param {Integer} PageSize The number of entries to return in a single page.
     * @param {Pointer<Integer>} TotalCount The server estimate of the total number of entries in the entire result set. A value of zero indicates that the server cannot provide an estimate.
     * @param {Pointer<Pointer<LDAPMessage>>} Results A pointer to the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure that contains the results.
     * @returns {Integer} If the server returns a null cookie (non-continuation), the value is <b>LDAP_NO_RESULTS_RETURNED</b>. Otherwise, the client signals a continuation (more data available) by returning <b>LDAP_SUCCESS</b>.
     * 
     * If the function otherwise fails, it returns the error code return value related to the failure. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_next_page_s
     * @since windows6.0.6000
     */
    static ldap_get_next_page_s(ExternalHandle, SearchHandle, timeout, PageSize, TotalCount, Results) {
        TotalCountMarshal := TotalCount is VarRef ? "uint*" : "ptr"
        ResultsMarshal := Results is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_get_next_page_s", "ptr", ExternalHandle, "ptr", SearchHandle, "ptr", timeout, "uint", PageSize, TotalCountMarshal, TotalCount, ResultsMarshal, Results, "CDecl uint")
        return result
    }

    /**
     * Records the number of paged results that the server has returned for a search.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PLDAPSearch} SearchBlock Handle to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366129(v=vs.85)">LDAPSearch</a> structure.
     * @param {Pointer<Integer>} TotalCount The total pages in the search results.
     * @param {Pointer<LDAPMessage>} Results A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure that contains the results of the operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_get_paged_count
     * @since windows6.0.6000
     */
    static ldap_get_paged_count(ExternalHandle, SearchBlock, TotalCount, Results) {
        TotalCountMarshal := TotalCount is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_get_paged_count", "ptr", ExternalHandle, "ptr", SearchBlock, TotalCountMarshal, TotalCount, "ptr", Results, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_abandon_page function terminates a paged-results search.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PLDAPSearch} SearchBlock A handle to the search block for the current search.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_search_abandon_page
     * @since windows6.0.6000
     */
    static ldap_search_abandon_page(ExternalHandle, SearchBlock) {
        result := DllCall("WLDAP32.dll\ldap_search_abandon_page", "ptr", ExternalHandle, "ptr", SearchBlock, "CDecl uint")
        return result
    }

    /**
     * The ldap_create_vlv_control function is used to create the request control (LDAP_CONTROL_VLVREQUEST) on the server.
     * @param {Pointer<LDAP>} ExternalHandle An LDAP session handle, as obtained from a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a>.
     * @param {Pointer<LDAPVLVInfo>} VlvInfo The address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapvlvinfo">LDAPVLVInfo</a> structure whose contents are used to construct the value of the control created.
     * @param {Integer} IsCritical If this value is not zero, the control created will have its criticality set to <b>TRUE</b>.
     * @param {Pointer<Pointer<LDAPControlW>>} Control A result parameter assigned the address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure that contains the request control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvrequest">LDAP_CONTROL_VLVREQUEST</a>) created by this function.
     * @returns {Integer} The <b>ldap_create_vlv_control</b> function returns an 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">LDAP error code</a> to indicate failure, or LDAP_SUCCESS if successful.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_create_vlv_controlw
     * @since windows6.0.6000
     */
    static ldap_create_vlv_controlW(ExternalHandle, VlvInfo, IsCritical, Control) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_create_vlv_controlW", "ptr", ExternalHandle, "ptr", VlvInfo, "char", IsCritical, ControlMarshal, Control, "CDecl int")
        return result
    }

    /**
     * The ldap_create_vlv_control function is used to create the request control (LDAP_CONTROL_VLVREQUEST) on the server.
     * @param {Pointer<LDAP>} ExternalHandle An LDAP session handle, as obtained from a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a>.
     * @param {Pointer<LDAPVLVInfo>} VlvInfo The address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapvlvinfo">LDAPVLVInfo</a> structure whose contents are used to construct the value of the control created.
     * @param {Integer} IsCritical If this value is not zero, the control created will have its criticality set to <b>TRUE</b>.
     * @param {Pointer<Pointer<LDAPControlA>>} Control A result parameter assigned the address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure that contains the request control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvrequest">LDAP_CONTROL_VLVREQUEST</a>) created by this function.
     * @returns {Integer} The <b>ldap_create_vlv_control</b> function returns an 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">LDAP error code</a> to indicate failure, or LDAP_SUCCESS if successful.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_create_vlv_controla
     * @since windows6.0.6000
     */
    static ldap_create_vlv_controlA(ExternalHandle, VlvInfo, IsCritical, Control) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_create_vlv_controlA", "ptr", ExternalHandle, "ptr", VlvInfo, "char", IsCritical, ControlMarshal, Control, "CDecl int")
        return result
    }

    /**
     * Used to find and parse VLV search results.
     * @param {Pointer<LDAP>} ExternalHandle The LDAP session handle.
     * @param {Pointer<Pointer<LDAPControlW>>} Control The address of a NULL-terminated array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures, typically obtained by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<Integer>} TargetPos The numeric position of the target entry in the result set list, as provided by the targetPosition element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the target position is not returned.
     * @param {Pointer<Integer>} ListCount The server estimate of the number of entries in the list as provided by the contentCount element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the size is not returned.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} Context The server-generated context identifier. If the server does not return a context identifier, this parameter will be set to <b>NULL</b>. If <b>NULL</b> is passed for contextp, the context identifier is not returned.
     * @param {Pointer<Integer>} ErrCode The VLV result code, as provided by the virtualListViewResult element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the result code is not returned.
     * @returns {Integer} This function returns an 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">LDAP error code</a> that indicates whether a VLV result control was found and parsed successfully. <b>LDAP_SUCCESS</b> is returned if all goes well, <b>LDAP_CONTROL_MISSING</b> is returned if the <i>ctrls</i> array does not include a response control (<a href="/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>), and another LDAP error code is returned if a parsing error or other issue occurs.
     * 
     * VLV uses the following LDAP return value codes:
     * 
     * <b>LDAP_OPERATIONS_ERROR</b>
     * 
     * <b>LDAP_UNWILLING_TO_PERFORM</b>
     * 
     * <b>LDAP_INSUFFICIENT_ACCESS</b>
     * 
     * <b>LDAP_BUSY</b>
     * 
     * <b>LDAP_TIMELIMIT_EXCEEDED</b>
     * 
     * <b>LDAP_ADMINLIMIT_EXCEEDED</b>
     * 
     * <b>LDAP_OTHER</b>
     * 
     * In addition, the following two codes have been added to support VLV:
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_vlv_controlw
     * @since windows6.0.6000
     */
    static ldap_parse_vlv_controlW(ExternalHandle, Control, TargetPos, ListCount, Context, ErrCode) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"
        TargetPosMarshal := TargetPos is VarRef ? "uint*" : "ptr"
        ListCountMarshal := ListCount is VarRef ? "uint*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"
        ErrCodeMarshal := ErrCode is VarRef ? "int*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_vlv_controlW", "ptr", ExternalHandle, ControlMarshal, Control, TargetPosMarshal, TargetPos, ListCountMarshal, ListCount, ContextMarshal, Context, ErrCodeMarshal, ErrCode, "CDecl int")
        return result
    }

    /**
     * Used to find and parse VLV search results.
     * @param {Pointer<LDAP>} ExternalHandle The LDAP session handle.
     * @param {Pointer<Pointer<LDAPControlA>>} Control The address of a NULL-terminated array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures, typically obtained by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<Integer>} TargetPos The numeric position of the target entry in the result set list, as provided by the targetPosition element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the target position is not returned.
     * @param {Pointer<Integer>} ListCount The server estimate of the number of entries in the list as provided by the contentCount element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the size is not returned.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} Context The server-generated context identifier. If the server does not return a context identifier, this parameter will be set to <b>NULL</b>. If <b>NULL</b> is passed for contextp, the context identifier is not returned.
     * @param {Pointer<Integer>} ErrCode The VLV result code, as provided by the virtualListViewResult element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the result code is not returned.
     * @returns {Integer} This function returns an 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">LDAP error code</a> that indicates whether a VLV result control was found and parsed successfully. <b>LDAP_SUCCESS</b> is returned if all goes well, <b>LDAP_CONTROL_MISSING</b> is returned if the <i>ctrls</i> array does not include a response control (<a href="/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>), and another LDAP error code is returned if a parsing error or other issue occurs.
     * 
     * VLV uses the following LDAP return value codes:
     * 
     * <b>LDAP_OPERATIONS_ERROR</b>
     * 
     * <b>LDAP_UNWILLING_TO_PERFORM</b>
     * 
     * <b>LDAP_INSUFFICIENT_ACCESS</b>
     * 
     * <b>LDAP_BUSY</b>
     * 
     * <b>LDAP_TIMELIMIT_EXCEEDED</b>
     * 
     * <b>LDAP_ADMINLIMIT_EXCEEDED</b>
     * 
     * <b>LDAP_OTHER</b>
     * 
     * In addition, the following two codes have been added to support VLV:
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_vlv_controla
     * @since windows6.0.6000
     */
    static ldap_parse_vlv_controlA(ExternalHandle, Control, TargetPos, ListCount, Context, ErrCode) {
        ControlMarshal := Control is VarRef ? "ptr*" : "ptr"
        TargetPosMarshal := TargetPos is VarRef ? "uint*" : "ptr"
        ListCountMarshal := ListCount is VarRef ? "uint*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr*" : "ptr"
        ErrCodeMarshal := ErrCode is VarRef ? "int*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_vlv_controlA", "ptr", ExternalHandle, ControlMarshal, Control, TargetPosMarshal, TargetPos, ListCountMarshal, ListCount, ContextMarshal, Context, ErrCodeMarshal, ErrCode, "CDecl int")
        return result
    }

    /**
     * Used in an active LDAP session to begin using TLS encryption.
     * @param {Pointer<LDAP>} ExternalHandle A pointer to an <b>LDAP</b> structure that represents the current session.
     * @param {Pointer<Integer>} ServerReturnValue Optional. A pointer to a <b>ULONG</b> that may contain a server error code. This parameter should be consulted if <b>LDAP_OTHER</b> is returned in the return value.  Pass in <b>NULL</b> if you do not wish to use it.
     * @param {Pointer<Pointer<LDAPMessage>>} result Optional. A pointer to a pointer for an <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a>  structure that may contain a server referral message.  Pass in <b>NULL</b> if you do not wish to use it.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls Optional. A NULL-terminated array of pointers to  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures that represent server controls.  Pass in <b>NULL</b> if you do not want to specify server  controls.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls Optional. A NULL-terminated array of pointers to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures that represent client controls.  Pass in <b>NULL</b> if you do not want to specify client controls.
     * @returns {Integer} If the function call succeeds, <b>LDAP_SUCCESS</b> is returned. <b>LDAP_UNWILLING_TO_PERFORM</b> is returned if a TLD/SSL session is already in progress, or if a bind is currently in progress, or if there is an outstanding LDAP request on the connection. If the server rejects the extended operation, <b>LDAP_OTHER</b> is returned and the <i>ServerReturnValue</i> parameter should be checked for the server error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_start_tls_sw
     * @since windows6.0.6000
     */
    static ldap_start_tls_sW(ExternalHandle, ServerReturnValue, result, ServerControls, ClientControls) {
        ServerReturnValueMarshal := ServerReturnValue is VarRef ? "uint*" : "ptr"
        resultMarshal := result is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_start_tls_sW", "ptr", ExternalHandle, ServerReturnValueMarshal, ServerReturnValue, resultMarshal, result, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * Used in an active LDAP session to begin using TLS encryption.
     * @param {Pointer<LDAP>} ExternalHandle A pointer to an <b>LDAP</b> structure that represents the current session.
     * @param {Pointer<Integer>} ServerReturnValue Optional. A pointer to a <b>ULONG</b> that may contain a server error code. This parameter should be consulted if <b>LDAP_OTHER</b> is returned in the return value.  Pass in <b>NULL</b> if you do not wish to use it.
     * @param {Pointer<Pointer<LDAPMessage>>} result Optional. A pointer to a pointer for an <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a>  structure that may contain a server referral message.  Pass in <b>NULL</b> if you do not wish to use it.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. A NULL-terminated array of pointers to  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures that represent server controls.  Pass in <b>NULL</b> if you do not want to specify server  controls.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. A NULL-terminated array of pointers to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures that represent client controls.  Pass in <b>NULL</b> if you do not want to specify client controls.
     * @returns {Integer} If the function call succeeds, <b>LDAP_SUCCESS</b> is returned. <b>LDAP_UNWILLING_TO_PERFORM</b> is returned if a TLD/SSL session is already in progress, or if a bind is currently in progress, or if there is an outstanding LDAP request on the connection. If the server rejects the extended operation, <b>LDAP_OTHER</b> is returned and the <i>ServerReturnValue</i> parameter should be checked for the server error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_start_tls_sa
     * @since windows6.0.6000
     */
    static ldap_start_tls_sA(ExternalHandle, ServerReturnValue, result, ServerControls, ClientControls) {
        ServerReturnValueMarshal := ServerReturnValue is VarRef ? "uint*" : "ptr"
        resultMarshal := result is VarRef ? "ptr*" : "ptr"
        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_start_tls_sA", "ptr", ExternalHandle, ServerReturnValueMarshal, ServerReturnValue, resultMarshal, result, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "CDecl uint")
        return result
    }

    /**
     * Stops the encryption operation started by a call to ldap_start_tls_s.
     * @param {Pointer<LDAP>} ExternalHandle A pointer to an <b>LDAP</b> structure that represents the current session.
     * @returns {BOOLEAN} Returns <b>TRUE</b> if the function call succeeds. Returns <b>FALSE</b> if a bind is currently in progress on the connection, if the connection is not actively connected to the server, or if TLS (SSL) negotiation is in progress on the connection.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_stop_tls_s
     * @since windows6.0.6000
     */
    static ldap_stop_tls_s(ExternalHandle) {
        result := DllCall("WLDAP32.dll\ldap_stop_tls_s", "ptr", ExternalHandle, "CDecl char")
        return result
    }

    /**
     * Returns the first reference from a message.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} res The search result, as obtained by a call to one of the synchronous search routines or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @returns {Pointer<LDAPMessage>} If the search returned valid results, this function returns a pointer to the first result reference. If no entry or reference exists in the result set, it returns <b>NULL</b>. This is the only error return; the session error parameter in the LDAP data structure is cleared to 0 in either case.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_first_reference
     * @since windows6.0.6000
     */
    static ldap_first_reference(ld, res) {
        result := DllCall("WLDAP32.dll\ldap_first_reference", "ptr", ld, "ptr", res, "CDecl ptr")
        return result
    }

    /**
     * Retrieves a reference from a search result chain.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry returned by a previous call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_reference">ldap_first_reference</a> or <b>ldap_next_reference</b>.
     * @returns {Pointer<LDAPMessage>} If the search returned valid results, this function returns a pointer to the next result entry in the results set. If no further entries or references exist in the result set, it returns <b>NULL</b>. This is the only error return; the session error parameter in the LDAP data structure is cleared to 0 in either case.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_next_reference
     * @since windows6.0.6000
     */
    static ldap_next_reference(ld, entry) {
        result := DllCall("WLDAP32.dll\ldap_next_reference", "ptr", ld, "ptr", entry, "CDecl ptr")
        return result
    }

    /**
     * The ldap_count_references function counts the number of subordinate references that were returned by the server in a response to a search request.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} res The search result obtained by a call to one of the synchronous search routines or to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @returns {Integer} If the function succeeds, it returns the number of references.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_count_references
     * @since windows6.0.6000
     */
    static ldap_count_references(ld, res) {
        result := DllCall("WLDAP32.dll\ldap_count_references", "ptr", ld, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_reference function returns a list of subordinate referrals in a search response message.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure containing the search response.
     * @param {Pointer<Pointer<PWSTR>>} Referrals A pointer to the list of subordinate referrals. Free with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_referencew
     * @since windows6.0.6000
     */
    static ldap_parse_referenceW(Connection, ResultMessage, Referrals) {
        ReferralsMarshal := Referrals is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_referenceW", "ptr", Connection, "ptr", ResultMessage, ReferralsMarshal, Referrals, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_reference function returns a list of subordinate referrals in a search response message.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure containing the search response.
     * @param {Pointer<Pointer<PSTR>>} Referrals A pointer to the list of subordinate referrals. Free with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_referencea
     * @since windows6.0.6000
     */
    static ldap_parse_referenceA(Connection, ResultMessage, Referrals) {
        ReferralsMarshal := Referrals is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_referenceA", "ptr", Connection, "ptr", ResultMessage, ReferralsMarshal, Referrals, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_reference function returns a list of subordinate referrals in a search response message.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure containing the search response.
     * @param {Pointer<Pointer<PSTR>>} Referrals A pointer to the list of subordinate referrals. Free with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_parse_reference
     * @since windows6.0.6000
     */
    static ldap_parse_reference(Connection, ResultMessage, Referrals) {
        ReferralsMarshal := Referrals is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_parse_reference", "ptr", Connection, "ptr", ResultMessage, ReferralsMarshal, Referrals, "CDecl uint")
        return result
    }

    /**
     * The ldap_extended_operation function enables you to pass extended LDAP operations to the server.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PWSTR} Oid A pointer to a null-terminated string that contains the dotted object identifier  text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<Integer>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_extended_operationw
     * @since windows6.0.6000
     */
    static ldap_extended_operationW(ld, Oid, Data, ServerControls, ClientControls, MessageNumber) {
        Oid := Oid is String ? StrPtr(Oid) : Oid

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_extended_operationW", "ptr", ld, "ptr", Oid, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_extended_operation function enables you to pass extended LDAP operations to the server.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} Oid A pointer to a null-terminated string that contains the dotted object identifier  text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<Integer>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_extended_operationa
     * @since windows6.0.6000
     */
    static ldap_extended_operationA(ld, Oid, Data, ServerControls, ClientControls, MessageNumber) {
        Oid := Oid is String ? StrPtr(Oid) : Oid

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_extended_operationA", "ptr", ld, "ptr", Oid, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Used to pass extended LDAP operations to the server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PSTR} Oid A pointer to a null-terminated string that contains the dotted object identifier (OID) text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<PSTR>} ReturnedOid Optional. A pointer to a null-terminated string that contains the dotted OID text string of the server response message.  This is normally the same OID  as that which names the request passed to the server in the <i>Oid</i> parameter. Set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} ReturnedData Optional. The arbitrary data returned by the extended operation. If <b>NULL</b>, no data is returned by the server. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_extended_operation_sa
     * @since windows6.0.6000
     */
    static ldap_extended_operation_sA(ExternalHandle, Oid, Data, ServerControls, ClientControls, ReturnedOid, ReturnedData) {
        Oid := Oid is String ? StrPtr(Oid) : Oid

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        ReturnedDataMarshal := ReturnedData is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_extended_operation_sA", "ptr", ExternalHandle, "ptr", Oid, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "ptr", ReturnedOid, ReturnedDataMarshal, ReturnedData, "CDecl uint")
        return result
    }

    /**
     * Used to pass extended LDAP operations to the server.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {PWSTR} Oid A pointer to a null-terminated string that contains the dotted object identifier (OID) text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<Pointer<LDAPControlW>>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAPControlW>>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<PWSTR>} ReturnedOid Optional. A pointer to a null-terminated string that contains the dotted OID text string of the server response message.  This is normally the same OID  as that which names the request passed to the server in the <i>Oid</i> parameter. Set to <b>NULL</b> if not used.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} ReturnedData Optional. The arbitrary data returned by the extended operation. If <b>NULL</b>, no data is returned by the server. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_extended_operation_sw
     * @since windows6.0.6000
     */
    static ldap_extended_operation_sW(ExternalHandle, Oid, Data, ServerControls, ClientControls, ReturnedOid, ReturnedData) {
        Oid := Oid is String ? StrPtr(Oid) : Oid

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        ReturnedDataMarshal := ReturnedData is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_extended_operation_sW", "ptr", ExternalHandle, "ptr", Oid, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, "ptr", ReturnedOid, ReturnedDataMarshal, ReturnedData, "CDecl uint")
        return result
    }

    /**
     * The ldap_extended_operation function enables you to pass extended LDAP operations to the server.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {PSTR} Oid A pointer to a null-terminated string that contains the dotted object identifier  text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<Pointer<LDAPControlA>>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<Pointer<LDAPControlA>>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<Integer>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_extended_operation
     * @since windows6.0.6000
     */
    static ldap_extended_operation(ld, Oid, Data, ServerControls, ClientControls, MessageNumber) {
        Oid := Oid is String ? StrPtr(Oid) : Oid

        ServerControlsMarshal := ServerControls is VarRef ? "ptr*" : "ptr"
        ClientControlsMarshal := ClientControls is VarRef ? "ptr*" : "ptr"
        MessageNumberMarshal := MessageNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ldap_extended_operation", "ptr", ld, "ptr", Oid, "ptr", Data, ServerControlsMarshal, ServerControls, ClientControlsMarshal, ClientControls, MessageNumberMarshal, MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_close_extended_op function ends a request that was made by calling ldap_extended_operation.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_close_extended_op
     * @since windows6.0.6000
     */
    static ldap_close_extended_op(ld, MessageNumber) {
        result := DllCall("WLDAP32.dll\ldap_close_extended_op", "ptr", ld, "uint", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The LdapGetLastError function retrieves the last error code returned by an LDAP call.
     * @returns {Integer} An LDAP error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldapgetlasterror
     * @since windows6.0.6000
     */
    static LdapGetLastError() {
        result := DllCall("WLDAP32.dll\LdapGetLastError", "CDecl uint")
        return result
    }

    /**
     * The LdapMapErrorToWin32 function translates an LdapError value to the closest Win32 error code.
     * @param {Integer} LdapError The error code returned from an LDAP function.
     * @returns {Integer} Returns the corresponding Win32 error code.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldapmaperrortowin32
     * @since windows6.0.6000
     */
    static LdapMapErrorToWin32(LdapError) {
        result := DllCall("WLDAP32.dll\LdapMapErrorToWin32", "uint", LdapError, "CDecl uint")
        return result
    }

    /**
     * Returns the LDAP session handle (connection pointer) for a particular message.
     * @param {Pointer<LDAP>} PrimaryConn A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle of the message, if known. If the <b>LDAP</b> session handle for the message is unknown, then <b>NULL</b> may be passed for this parameter provided that the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">LDAP_OPT_REF_DEREF_CONN_PER_MSG</a> session option had been previously set for the message session.
     * @param {Pointer<LDAPMessage>} res The <b>LDAP</b> message queried.  If <b>NULL</b> is passed for this parameter, then the function will respond with a <b>NULL</b> return value.
     * @returns {Pointer<LDAP>} The return value is the <a href="/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle (connection pointer) where the message originated from. This function returns <b>NULL</b> if the originating session has closed or if a <b>NULL</b> <b>LDAPMessage</b> pointer is passed to the function and the <a href="/previous-versions/windows/desktop/ldap/session-options">LDAP_OPT_REF_DEREF_CONN_PER_MSG</a> session option was not previously set for the message session.
     * @see https://docs.microsoft.com/windows/win32/api//winldap/nf-winldap-ldap_conn_from_msg
     * @since windows6.0.6000
     */
    static ldap_conn_from_msg(PrimaryConn, res) {
        result := DllCall("WLDAP32.dll\ldap_conn_from_msg", "ptr", PrimaryConn, "ptr", res, "CDecl ptr")
        return result
    }

    /**
     * The ber_init function allocates a new BerElement structure containing the data taken from the supplied berval structure.
     * @param {Pointer<LDAP_BERVAL>} pBerVal Pointer to the source <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure.
     * @returns {Pointer<BerElement>} If the function succeeds, the return value is a pointer to the newly allocated <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * 
     * If the function fails, it returns a <b>NULL</b> pointer.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_init
     * @since windows6.0.6000
     */
    static ber_init(pBerVal) {
        result := DllCall("WLDAP32.dll\ber_init", "ptr", pBerVal, "CDecl ptr")
        return result
    }

    /**
     * The ber_free function frees a BerElement structure that was previously allocated with ber_alloc_t, ber_init, or the ldap_first_attribute/ ldap_next_attribute search functions.
     * @param {Pointer<BerElement>} pBerElement Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure to be deallocated.
     * @param {Integer} fbuf Must be set to 0 if freeing structures allocated by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a>/
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a>, otherwise it must be set to 1.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_free
     * @since windows6.0.6000
     */
    static ber_free(pBerElement, fbuf) {
        DllCall("WLDAP32.dll\ber_free", "ptr", pBerElement, "int", fbuf, "CDecl ")
    }

    /**
     * The ber_bvecfree function frees an array of berval structures.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} pBerVal Pointer to a NULL-terminated array of <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures to be deallocated.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_bvecfree
     * @since windows6.0.6000
     */
    static ber_bvecfree(pBerVal) {
        pBerValMarshal := pBerVal is VarRef ? "ptr*" : "ptr"

        DllCall("WLDAP32.dll\ber_bvecfree", pBerValMarshal, pBerVal, "CDecl ")
    }

    /**
     * The ber_bvdup function creates a copy of the supplied berval structure.
     * @param {Pointer<LDAP_BERVAL>} pBerVal Pointer to the source <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure.
     * @returns {Pointer<LDAP_BERVAL>} If the function succeeds, the return value is a pointer to the newly allocated <a href="/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure.
     * 
     * If the function fails, it returns a <b>NULL</b> pointer.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_bvdup
     * @since windows6.0.6000
     */
    static ber_bvdup(pBerVal) {
        result := DllCall("WLDAP32.dll\ber_bvdup", "ptr", pBerVal, "CDecl ptr")
        return result
    }

    /**
     * Allocates and constructs a new BerElement structure.
     * @param {Integer} options A bitwise OR of the options used to generate the encoding or decoding of the <b>BerElement</b>. The <b>LBER_USE_DER</b> flag (0x01) should always be specified, which causes the element lengths to be encoded in the minimum number of octets.
     * 
     * Unrecognized option bits are ignored.
     * @returns {Pointer<BerElement>} If the function succeeds, the return value is a pointer to the newly allocated <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * 
     * If the function fails, it returns a <b>NULL</b> pointer.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_alloc_t
     * @since windows6.0.6000
     */
    static ber_alloc_t(options) {
        result := DllCall("WLDAP32.dll\ber_alloc_t", "int", options, "CDecl ptr")
        return result
    }

    /**
     * The ber_skip_tag function skips the current tag and returns the tag of the next element in the supplied BerElement structure.
     * @param {Pointer<BerElement>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<Integer>} pLen Returns the length of the skipped element.
     * @returns {Integer} Returns the tag of the next element in the <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. LBER_DEFAULT is returned if there is no further data to read.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_skip_tag
     * @since windows6.0.6000
     */
    static ber_skip_tag(pBerElement, pLen) {
        pLenMarshal := pLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ber_skip_tag", "ptr", pBerElement, pLenMarshal, pLen, "CDecl uint")
        return result
    }

    /**
     * Returns the tag of the next element to be parsed in the supplied BerElement structure.
     * @param {Pointer<BerElement>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<Integer>} pLen Returns the length of the next element to be parsed.
     * @returns {Integer} Returns the tag of the next element to be read in the <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. LBER_DEFAULT is returned if there is no further data to be read.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_peek_tag
     * @since windows6.0.6000
     */
    static ber_peek_tag(pBerElement, pLen) {
        pLenMarshal := pLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ber_peek_tag", "ptr", pBerElement, pLenMarshal, pLen, "CDecl uint")
        return result
    }

    /**
     * The ber_first_element function is used to begin the traversal of a SET, SET OF, SEQUENCE or SEQUENCE OF data value stored in the supplied BerElement structure. It returns the tag and length of the first element.
     * @param {Pointer<BerElement>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<Integer>} pLen Returns the length of the next element to be parsed.
     * @param {Pointer<Pointer<CHAR>>} ppOpaque Returns a pointer to a cookie that is passed to subsequent calls of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_next_element">ber_next_element</a> function.
     * @returns {Integer} Returns the tag of the next element to be read in the <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. LBER_DEFAULT is returned if there is no further data to be read.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_first_element
     * @since windows6.0.6000
     */
    static ber_first_element(pBerElement, pLen, ppOpaque) {
        pLenMarshal := pLen is VarRef ? "uint*" : "ptr"
        ppOpaqueMarshal := ppOpaque is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ber_first_element", "ptr", pBerElement, pLenMarshal, pLen, ppOpaqueMarshal, ppOpaque, "CDecl uint")
        return result
    }

    /**
     * The ber_next_element function is used along with ber_first_element to traverse a SET, SET OF, SEQUENCE or SEQUENCE OF data value stored in the supplied BerElement structure. It returns the tag and length of the next element in the constructed type.
     * @param {Pointer<BerElement>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<Integer>} pLen Returns the length of the next element to be parsed.
     * @param {PSTR} opaque An opaque cookie used internally that was returned by the initial call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_first_element">ber_first_element</a> function.
     * @returns {Integer} Returns the tag of the next element to be read in the <a href="/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. LBER_DEFAULT is returned if there is no further data to be read.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_next_element
     * @since windows6.0.6000
     */
    static ber_next_element(pBerElement, pLen, opaque) {
        opaque := opaque is String ? StrPtr(opaque) : opaque

        pLenMarshal := pLen is VarRef ? "uint*" : "ptr"

        result := DllCall("WLDAP32.dll\ber_next_element", "ptr", pBerElement, pLenMarshal, pLen, "ptr", opaque, "CDecl uint")
        return result
    }

    /**
     * The ber_flatten function allocates a new berval structure containing the data taken from the supplied BerElement structure.
     * @param {Pointer<BerElement>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<Pointer<LDAP_BERVAL>>} pBerVal Pointer to the newly allocated <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure, which should be freed using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_bvfree">ber_bvfree</a>.
     * @returns {Integer} The function returns 0 on success and -1 on failure.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_flatten
     * @since windows6.0.6000
     */
    static ber_flatten(pBerElement, pBerVal) {
        pBerValMarshal := pBerVal is VarRef ? "ptr*" : "ptr"

        result := DllCall("WLDAP32.dll\ber_flatten", "ptr", pBerElement, pBerValMarshal, pBerVal, "CDecl int")
        return result
    }

    /**
     * Used to encode a BER element and is similar to sprintf_s.
     * @param {Pointer<BerElement>} pBerElement A pointer to the encoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {PSTR} fmt An encoding format string. For more information, see Remarks.
     * @returns {Integer} If the function succeeds, a non-negative number is returned. If the function fails,  -1 is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_printf
     * @since windows6.0.6000
     */
    static ber_printf(pBerElement, fmt) {
        fmt := fmt is String ? StrPtr(fmt) : fmt

        result := DllCall("WLDAP32.dll\ber_printf", "ptr", pBerElement, "ptr", fmt, "CDecl int")
        return result
    }

    /**
     * The ber_scanf function decodes a BER element in a similar manner as sscanf_s.
     * @param {Pointer<BerElement>} pBerElement Pointer to the decoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {PSTR} fmt Encoding format string. For more information, see Remarks section.
     * @returns {Integer} On error, the function returns LBER_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//winber/nf-winber-ber_scanf
     * @since windows6.0.6000
     */
    static ber_scanf(pBerElement, fmt) {
        fmt := fmt is String ? StrPtr(fmt) : fmt

        result := DllCall("WLDAP32.dll\ber_scanf", "ptr", pBerElement, "ptr", fmt, "CDecl uint")
        return result
    }

;@endregion Methods
}
