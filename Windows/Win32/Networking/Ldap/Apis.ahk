#Requires AutoHotkey v2.0.0 64-bit

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
     * The ldap_openW (Unicode) function creates and initializes a connection block, then opens the connection to an LDAP server. It is not recommended, use the ldap_initW (Unicode) function instead.
     * @remarks
     * Call <b>ldap_open</b> to create a connection block to an LDAP server. The  <i>HostName</i> can be <b>NULL</b> in which case the run time attempts to find the default LDAP server. The host names are tried in the order listed, stopping with the first successful connection. For Active Directory servers, the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function can be used to obtain name of the server, which can then be passed as the <i>HostName</i> parameter instead of using <b>NULL</b>.
     * 
     * If the <i>HostName</i> was set to either <b>NULL</b> or the domain name, automatic reconnect applies. If the connected DC stops functioning for some reason during the connection's lifetime, LDAP will automatically reconnect to another DC in the specified domain. This behavior can be toggled off or on using the <b>LDAP_OPT_AUTO_RECONNECT</b> session option, which is on by default.
     * 
     * The default LDAP server is a Microsoft specific option when you use <b>LDAP_OPT_HOST_NAME</b>. This option specifies the host name of the default LDAP server and returns the host name of the server in Unicode or ANSI, contingent on the use of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_optionW</a> or <b>ldap_get_optionA</b>, respectively.
     * 
     * If a Global Catalog port number is passed to <b>ldap_open</b> as one of the arguments, then the <i>HostName</i> passed for that port number must be the name of the forest for the underlying call to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName()</a> to correctly find the GC in the enterprise.
     * 
     * The <b>ldap_open</b> function allocates an LDAP data structure to maintain state data for the session and returns a handle to this structure. Pass this handle to subsequent LDAP function calls during the course of the session.
     * 
     * Multithreading: Calls to <b>ldap_open</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  <b>ldap_open</b> is heavily deprecated by the current LDAP RFC because it immediately opens a session to the domain controller without giving the calling application a chance to configure any session options, for example (and most importantly) security-related session options. Users are encouraged to use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> as the preferred method of initializing an LDAP session.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_open as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} HostName A pointer to a null-terminated string. A domain name, a list of host names, or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made. Be aware that only <b>ldap_open</b> attempts to make the connection before returning to the caller. The function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> does not connect to the LDAP server.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. The default LDAP port, 389, can be obtained by supplying the constant <b>LDAP_PORT</b>. If a host name includes a port number then this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_openw
     * @since windows6.0.6000
     */
    static ldap_openW(HostName, PortNumber) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        DllCall("WLDAP32.dll\ldap_openW", "ptr", HostName, "uint", PortNumber, "CDecl ")
    }

    /**
     * ldap_open is not recommended for use. (ldap_openA)
     * @remarks
     * Call <b>ldap_open</b> to create a connection block to an LDAP server. The  <i>HostName</i> can be <b>NULL</b> in which case the run time attempts to find the default LDAP server. The host names are tried in the order listed, stopping with the first successful connection. For Active Directory servers, the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function can be used to obtain name of the server, which can then be passed as the <i>HostName</i> parameter instead of using <b>NULL</b>.
     * 
     * If the <i>HostName</i> was set to either <b>NULL</b> or the domain name, automatic reconnect applies. If the connected DC stops functioning for some reason during the connection's lifetime, LDAP will automatically reconnect to another DC in the specified domain. This behavior can be toggled off or on using the <b>LDAP_OPT_AUTO_RECONNECT</b> session option, which is on by default.
     * 
     * The default LDAP server is a Microsoft specific option when you use <b>LDAP_OPT_HOST_NAME</b>. This option specifies the host name of the default LDAP server and returns the host name of the server in Unicode or ANSI, contingent on the use of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_optionW</a> or <b>ldap_get_optionA</b>, respectively.
     * 
     * If a Global Catalog port number is passed to <b>ldap_open</b> as one of the arguments, then the <i>HostName</i> passed for that port number must be the name of the forest for the underlying call to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName()</a> to correctly find the GC in the enterprise.
     * 
     * The <b>ldap_open</b> function allocates an LDAP data structure to maintain state data for the session and returns a handle to this structure. Pass this handle to subsequent LDAP function calls during the course of the session.
     * 
     * Multithreading: Calls to <b>ldap_open</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  <b>ldap_open</b> is heavily deprecated by the current LDAP RFC because it immediately opens a session to the domain controller without giving the calling application a chance to configure any session options, for example (and most importantly) security-related session options. Users are encouraged to use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> as the preferred method of initializing an LDAP session.</div>
     * <div> </div>
     * @param {Pointer<PSTR>} HostName A pointer to a null-terminated string. A domain name, a list of host names, or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made. Be aware that only <b>ldap_open</b> attempts to make the connection before returning to the caller. The function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> does not connect to the LDAP server.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. The default LDAP port, 389, can be obtained by supplying the constant <b>LDAP_PORT</b>. If a host name includes a port number then this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_opena
     * @since windows6.0.6000
     */
    static ldap_openA(HostName, PortNumber) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        DllCall("WLDAP32.dll\ldap_openA", "ptr", HostName, "uint", PortNumber, "CDecl ")
    }

    /**
     * The ldap_initW (Unicode) function (winldap.h) initializes a session with an LDAP server.
     * @remarks
     * Call <b>ldap_init</b> to create a connection block to an LDAP server. Unlike 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>, a call to <b>ldap_init</b> does not open the connection. You can call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_connect">ldap_connect</a> explicitly to have the library contact the server. This is useful when you want to specify a local timeout in which case you would call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>, with the connection block from <b>ldap_init</b>, before calling <b>ldap_connect</b>. Typically, however, this call is unnecessary because the first operation function that requires an open connection calls <b>ldap_connect</b> internally if it has not  been called.
     * 
     * The function allocates an LDAP data structure to maintain state data for the session, and returns a handle to this structure. Pass this handle to LDAP function calls during the session.
     * 
     * The <i>HostName</i> parameter can be <b>NULL</b>, in which case the run time attempts to find the "default" LDAP server. When 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_connect">ldap_connect</a> is called, the hosts are attempted in the order listed, stopping with the first successful connection. For Active Directory servers, the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function can be used to obtain name of the server, which can then be passed as the <i>HostName</i> parameter instead of using <b>NULL</b>.
     * 
     * Even when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function  is used to set the <b>LDAP_OPT_GETDSNAME_FLAGS</b> option, which in turn specifies the flags that will be passed to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDCName</a> to discover which DC to connect to. The LDAP client also passes the  <b>DS_ONLY_LDAP_NEEDED</b> flag to <b>DsGetDCName</b> in addition to the flags that <b>LDAP_OPT_GETDSNAME_FLAGS</b> specifies.
     * 
     * If <b>NULL</b> is passed for the <i>HostName</i> parameter and the calling computer is a member of an Active Directory domain, then the runtime will search for a DC in the domain in which the current computer is a member when attempting to connect.
     * 
     * If <b>NULL</b> is passed for the <i>HostName</i> parameter and the calling computer is a DC of an Active Directory domain, then the runtime will switch <b>NULL</b> with 127.0.0.1 and connect to the local computer using loopback when attempting to connect.
     * 
     * If an Active Directory domain name is passed for the <i>HostName</i> parameter, then <b>ldap_init</b> will find the "default" LDAP server in that domain.
     * 
     * If the <i>HostName</i> was set to either <b>NULL</b> or the domain name, automatic reconnect applies. If the connected DC stops functioning for some reason during the connection's lifetime, LDAP will automatically reconnect to another DC in the specified domain. This behavior can be toggled off or on using the <b>LDAP_OPT_AUTO_RECONNECT</b> session option, which is on by default.
     * 
     * If an Active Directory DNS server name is passed for the <i>HostName</i> parameter, then 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> should be called to set the <b>LDAP_OPT_AREC_EXCLUSIVE</b> flag on before calling any LDAP function that creates the actual connection.  This forces an A-record lookup and bypasses any SRV record lookup when resolving the host name.  In the case of a branch office with a dial-up connection, using A-Record lookup can avoid forcing the dialup to query a remote DNS server for SRV records when resolving names.
     * 
     * If a Global Catalog port number is passed to <b>ldap_init</b> as one of the arguments, then the <i>HostName</i> passed for that port number must be the name of the forest for the underlying call to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName()</a> to correctly find the GC in the enterprise.
     * 
     * Multithreading: A call to <b>ldap_init</b> is thread safe.
     * 
     * <div class="alert"><b>Note</b>  <b>ldap_init</b> is the preferred method of initializing an LDAP session. The use of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a> is heavily deprecated by the current LDAP RFC because it precludes the use of setting any session options.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_init as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} HostName A pointer to a null-terminated string that contains a domain name, or a space-separated list of host names or dotted strings that represent the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:). For more information about the use of the <b>LDAP_OPT_AREC_EXCLUSIVE</b> option when connecting to Active Directory servers, see the Remarks section.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_PORT</b> to obtain the default port, 389. This parameter is ignored if a host name includes a port number.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_initw
     * @since windows6.0.6000
     */
    static ldap_initW(HostName, PortNumber) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        DllCall("WLDAP32.dll\ldap_initW", "ptr", HostName, "uint", PortNumber, "CDecl ")
    }

    /**
     * Initializes a session with an LDAP server. (ldap_initA)
     * @remarks
     * Call <b>ldap_init</b> to create a connection block to an LDAP server. Unlike 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>, a call to <b>ldap_init</b> does not open the connection. You can call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_connect">ldap_connect</a> explicitly to have the library contact the server. This is useful when you want to specify a local timeout in which case you would call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>, with the connection block from <b>ldap_init</b>, before calling <b>ldap_connect</b>. Typically, however, this call is unnecessary because the first operation function that requires an open connection calls <b>ldap_connect</b> internally if it has not  been called.
     * 
     * The function allocates an LDAP data structure to maintain state data for the session, and returns a handle to this structure. Pass this handle to LDAP function calls during the session.
     * 
     * The <i>HostName</i> parameter can be <b>NULL</b>, in which case the run time attempts to find the "default" LDAP server. When 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_connect">ldap_connect</a> is called, the hosts are attempted in the order listed, stopping with the first successful connection. For Active Directory servers, the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function can be used to obtain name of the server, which can then be passed as the <i>HostName</i> parameter instead of using <b>NULL</b>.
     * 
     * Even when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function  is used to set the <b>LDAP_OPT_GETDSNAME_FLAGS</b> option, which in turn specifies the flags that will be passed to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDCName</a> to discover which DC to connect to. The LDAP client also passes the  <b>DS_ONLY_LDAP_NEEDED</b> flag to <b>DsGetDCName</b> in addition to the flags that <b>LDAP_OPT_GETDSNAME_FLAGS</b> specifies.
     * 
     * If <b>NULL</b> is passed for the <i>HostName</i> parameter and the calling computer is a member of an Active Directory domain, then the runtime will search for a DC in the domain in which the current computer is a member when attempting to connect.
     * 
     * If <b>NULL</b> is passed for the <i>HostName</i> parameter and the calling computer is a DC of an Active Directory domain, then the runtime will switch <b>NULL</b> with 127.0.0.1 and connect to the local computer using loopback when attempting to connect.
     * 
     * If an Active Directory domain name is passed for the <i>HostName</i> parameter, then <b>ldap_init</b> will find the "default" LDAP server in that domain.
     * 
     * If the <i>HostName</i> was set to either <b>NULL</b> or the domain name, automatic reconnect applies. If the connected DC stops functioning for some reason during the connection's lifetime, LDAP will automatically reconnect to another DC in the specified domain. This behavior can be toggled off or on using the <b>LDAP_OPT_AUTO_RECONNECT</b> session option, which is on by default.
     * 
     * If an Active Directory DNS server name is passed for the <i>HostName</i> parameter, then 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> should be called to set the <b>LDAP_OPT_AREC_EXCLUSIVE</b> flag on before calling any LDAP function that creates the actual connection.  This forces an A-record lookup and bypasses any SRV record lookup when resolving the host name.  In the case of a branch office with a dial-up connection, using A-Record lookup can avoid forcing the dialup to query a remote DNS server for SRV records when resolving names.
     * 
     * If a Global Catalog port number is passed to <b>ldap_init</b> as one of the arguments, then the <i>HostName</i> passed for that port number must be the name of the forest for the underlying call to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName()</a> to correctly find the GC in the enterprise.
     * 
     * Multithreading: A call to <b>ldap_init</b> is thread safe.
     * 
     * <div class="alert"><b>Note</b>  <b>ldap_init</b> is the preferred method of initializing an LDAP session. The use of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a> is heavily deprecated by the current LDAP RFC because it precludes the use of setting any session options.</div>
     * <div> </div>
     * @param {Pointer<PSTR>} HostName A pointer to a null-terminated string that contains a domain name, or a space-separated list of host names or dotted strings that represent the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:). For more information about the use of the <b>LDAP_OPT_AREC_EXCLUSIVE</b> option when connecting to Active Directory servers, see the Remarks section.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_PORT</b> to obtain the default port, 389. This parameter is ignored if a host name includes a port number.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_inita
     * @since windows6.0.6000
     */
    static ldap_initA(HostName, PortNumber) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        DllCall("WLDAP32.dll\ldap_initA", "ptr", HostName, "uint", PortNumber, "CDecl ")
    }

    /**
     * The ldap_sslinitW (Unicode) function (winldap.h) initializes a Secure Sockets Layer (SSL) session with an LDAP server.
     * @remarks
     * Call <b>ldap_sslinit</b> to create a connection block to a secured LDAP server. The <i>HostName</i> parameter can be <b>NULL</b> in which case the run time attempts to find the "default" LDAP server. The hosts are tried in the order listed, stopping with the first one to which a successful connection is made.
     * 
     * If the <i>HostName</i> was set to either <b>NULL</b> or the domain name, automatic reconnect applies. If the connected DC stops functioning for some reason during the connection's lifetime, LDAP will automatically reconnect to another DC in the specified domain. This behavior can be toggled off or on using the <b>LDAP_OPT_AUTO_RECONNECT</b> session option, which is on by default.
     * 
     * If a Global Catalog port number is passed to <b>ldap_sslinit</b> as one of the arguments, then the <i>HostName</i> passed for that port number must be the name of the forest for the underlying call to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to correctly find the GC in the enterprise.
     * 
     * The function allocates an LDAP structure to maintain state information for the session, and returns a handle to this structure. You pass this handle to subsequent LDAP function calls during the course of the session.
     * 
     * Multithreading: Calls to <b>ldap_sslinit</b> are thread-safe.
     * 
     * Microsoft implements security features, like SSL, through its SSPI capabilities.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_sslinit as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} HostName A pointer to a null-terminated string that contains a space-separated list of host names or dotted strings representing the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:) character.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_SSL_PORT</b> to obtain the default port, 636. This parameter is ignored if a host name includes a port number.
     * @param {Integer} secure If nonzero, the function uses SSL encryption. If the value is 0, the function establishes a plain TCP connection and uses clear text (no encryption).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_sslinitw
     * @since windows6.0.6000
     */
    static ldap_sslinitW(HostName, PortNumber, secure) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        DllCall("WLDAP32.dll\ldap_sslinitW", "ptr", HostName, "uint", PortNumber, "int", secure, "CDecl ")
    }

    /**
     * Initializes a Secure Sockets Layer (SSL) session with an LDAP server. (ldap_sslinitA)
     * @remarks
     * Call <b>ldap_sslinit</b> to create a connection block to a secured LDAP server. The <i>HostName</i> parameter can be <b>NULL</b> in which case the run time attempts to find the "default" LDAP server. The hosts are tried in the order listed, stopping with the first one to which a successful connection is made.
     * 
     * If the <i>HostName</i> was set to either <b>NULL</b> or the domain name, automatic reconnect applies. If the connected DC stops functioning for some reason during the connection's lifetime, LDAP will automatically reconnect to another DC in the specified domain. This behavior can be toggled off or on using the <b>LDAP_OPT_AUTO_RECONNECT</b> session option, which is on by default.
     * 
     * If a Global Catalog port number is passed to <b>ldap_sslinit</b> as one of the arguments, then the <i>HostName</i> passed for that port number must be the name of the forest for the underlying call to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to correctly find the GC in the enterprise.
     * 
     * The function allocates an LDAP structure to maintain state information for the session, and returns a handle to this structure. You pass this handle to subsequent LDAP function calls during the course of the session.
     * 
     * Multithreading: Calls to <b>ldap_sslinit</b> are thread-safe.
     * 
     * Microsoft implements security features, like SSL, through its SSPI capabilities.
     * @param {Pointer<PSTR>} HostName A pointer to a null-terminated string that contains a space-separated list of host names or dotted strings representing the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:) character.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_SSL_PORT</b> to obtain the default port, 636. This parameter is ignored if a host name includes a port number.
     * @param {Integer} secure If nonzero, the function uses SSL encryption. If the value is 0, the function establishes a plain TCP connection and uses clear text (no encryption).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_sslinita
     * @since windows6.0.6000
     */
    static ldap_sslinitA(HostName, PortNumber, secure) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        DllCall("WLDAP32.dll\ldap_sslinitA", "ptr", HostName, "uint", PortNumber, "int", secure, "CDecl ")
    }

    /**
     * The ldap_connect function establishes a connection with the server.
     * @remarks
     * Although it is not required that a client call <b>ldap_connect</b> to establish a connection to the server, it is good programming practice to do so. If the connection does not exist, other functions, for example,  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind_s">ldap_bind_s</a>, perform the call internally. However, if you have to troubleshoot this part of your application, establishing the connection prior to making the call to some other function, for example <b>ldap_bind_s</b>, will also separate the possible problems if the connection fails. Alternately,  you can specify additional options on the connection block. For example, a client can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> to initialize a session, then call 
     * <b>ldap_connect</b>, with a non-<b>NULL</b> timeout parameter value, to connect to the server with a specified time-out.
     * 
     * If the call to <b>ldap_connect</b> succeeds, the client is connected to the LDAP server as an  anonymous user. The session handle should be freed with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when it is no longer required.
     * 
     * If the <b>ldap_connect</b> call fails, the session handle should be freed with a call to  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> when no longer required for error recovery.
     * @param {Pointer<LDAP>} ld The session handle obtained from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a>.
     * @param {Pointer<LDAP_TIMEVAL>} timeout A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_timeval">LDAP_TIMEVAL</a> structure that specifies the number of seconds to spend in an attempt to establish a connection before a timeout. If <b>NULL</b>, the function uses a default timeout value.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_connect
     * @since windows6.0.6000
     */
    static ldap_connect(ld, timeout) {
        result := DllCall("WLDAP32.dll\ldap_connect", "ptr", ld, "ptr", timeout, "CDecl uint")
        return result
    }

    /**
     * The ldap_open function creates and initializes a connection block, then opens the connection to an LDAP server. It is not recommended, use the ldap_init function instead.
     * @remarks
     * Call <b>ldap_open</b> to create a connection block to an LDAP server. The  <i>HostName</i> can be <b>NULL</b> in which case the run time attempts to find the default LDAP server. The host names are tried in the order listed, stopping with the first successful connection. For Active Directory servers, the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function can be used to obtain name of the server, which can then be passed as the <i>HostName</i> parameter instead of using <b>NULL</b>.
     * 
     * If the <i>HostName</i> was set to either <b>NULL</b> or the domain name, automatic reconnect applies. If the connected DC stops functioning for some reason during the connection's lifetime, LDAP will automatically reconnect to another DC in the specified domain. This behavior can be toggled off or on using the <b>LDAP_OPT_AUTO_RECONNECT</b> session option, which is on by default.
     * 
     * The default LDAP server is a Microsoft specific option when you use <b>LDAP_OPT_HOST_NAME</b>. This option specifies the host name of the default LDAP server and returns the host name of the server in Unicode or ANSI, contingent on the use of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_optionW</a> or <b>ldap_get_optionA</b>, respectively.
     * 
     * If a Global Catalog port number is passed to <b>ldap_open</b> as one of the arguments, then the <i>HostName</i> passed for that port number must be the name of the forest for the underlying call to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName()</a> to correctly find the GC in the enterprise.
     * 
     * The <b>ldap_open</b> function allocates an LDAP data structure to maintain state data for the session and returns a handle to this structure. Pass this handle to subsequent LDAP function calls during the course of the session.
     * 
     * Multithreading: Calls to <b>ldap_open</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  <b>ldap_open</b> is heavily deprecated by the current LDAP RFC because it immediately opens a session to the domain controller without giving the calling application a chance to configure any session options, for example (and most importantly) security-related session options. Users are encouraged to use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> as the preferred method of initializing an LDAP session.</div>
     * <div> </div>
     * @param {Pointer<PSTR>} HostName A pointer to a null-terminated string. A domain name, a list of host names, or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made. Be aware that only <b>ldap_open</b> attempts to make the connection before returning to the caller. The function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a> does not connect to the LDAP server.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. The default LDAP port, 389, can be obtained by supplying the constant <b>LDAP_PORT</b>. If a host name includes a port number then this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_open
     * @since windows6.0.6000
     */
    static ldap_open(HostName, PortNumber) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        DllCall("WLDAP32.dll\ldap_open", "ptr", HostName, "uint", PortNumber, "CDecl ")
    }

    /**
     * The ldap_init function (winldap.h) initializes a session with an LDAP server.
     * @remarks
     * Call <b>ldap_init</b> to create a connection block to an LDAP server. Unlike 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>, a call to <b>ldap_init</b> does not open the connection. You can call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_connect">ldap_connect</a> explicitly to have the library contact the server. This is useful when you want to specify a local timeout in which case you would call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>, with the connection block from <b>ldap_init</b>, before calling <b>ldap_connect</b>. Typically, however, this call is unnecessary because the first operation function that requires an open connection calls <b>ldap_connect</b> internally if it has not  been called.
     * 
     * The function allocates an LDAP data structure to maintain state data for the session, and returns a handle to this structure. Pass this handle to LDAP function calls during the session.
     * 
     * The <i>HostName</i> parameter can be <b>NULL</b>, in which case the run time attempts to find the "default" LDAP server. When 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_connect">ldap_connect</a> is called, the hosts are attempted in the order listed, stopping with the first successful connection. For Active Directory servers, the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function can be used to obtain name of the server, which can then be passed as the <i>HostName</i> parameter instead of using <b>NULL</b>.
     * 
     * Even when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function  is used to set the <b>LDAP_OPT_GETDSNAME_FLAGS</b> option, which in turn specifies the flags that will be passed to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDCName</a> to discover which DC to connect to. The LDAP client also passes the  <b>DS_ONLY_LDAP_NEEDED</b> flag to <b>DsGetDCName</b> in addition to the flags that <b>LDAP_OPT_GETDSNAME_FLAGS</b> specifies.
     * 
     * If <b>NULL</b> is passed for the <i>HostName</i> parameter and the calling computer is a member of an Active Directory domain, then the runtime will search for a DC in the domain in which the current computer is a member when attempting to connect.
     * 
     * If <b>NULL</b> is passed for the <i>HostName</i> parameter and the calling computer is a DC of an Active Directory domain, then the runtime will switch <b>NULL</b> with 127.0.0.1 and connect to the local computer using loopback when attempting to connect.
     * 
     * If an Active Directory domain name is passed for the <i>HostName</i> parameter, then <b>ldap_init</b> will find the "default" LDAP server in that domain.
     * 
     * If the <i>HostName</i> was set to either <b>NULL</b> or the domain name, automatic reconnect applies. If the connected DC stops functioning for some reason during the connection's lifetime, LDAP will automatically reconnect to another DC in the specified domain. This behavior can be toggled off or on using the <b>LDAP_OPT_AUTO_RECONNECT</b> session option, which is on by default.
     * 
     * If an Active Directory DNS server name is passed for the <i>HostName</i> parameter, then 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> should be called to set the <b>LDAP_OPT_AREC_EXCLUSIVE</b> flag on before calling any LDAP function that creates the actual connection.  This forces an A-record lookup and bypasses any SRV record lookup when resolving the host name.  In the case of a branch office with a dial-up connection, using A-Record lookup can avoid forcing the dialup to query a remote DNS server for SRV records when resolving names.
     * 
     * If a Global Catalog port number is passed to <b>ldap_init</b> as one of the arguments, then the <i>HostName</i> passed for that port number must be the name of the forest for the underlying call to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName()</a> to correctly find the GC in the enterprise.
     * 
     * Multithreading: A call to <b>ldap_init</b> is thread safe.
     * 
     * <div class="alert"><b>Note</b>  <b>ldap_init</b> is the preferred method of initializing an LDAP session. The use of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a> is heavily deprecated by the current LDAP RFC because it precludes the use of setting any session options.</div>
     * <div> </div>
     * @param {Pointer<PSTR>} HostName A pointer to a null-terminated string that contains a domain name, or a space-separated list of host names or dotted strings that represent the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:). For more information about the use of the <b>LDAP_OPT_AREC_EXCLUSIVE</b> option when connecting to Active Directory servers, see the Remarks section.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_PORT</b> to obtain the default port, 389. This parameter is ignored if a host name includes a port number.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_init
     * @since windows6.0.6000
     */
    static ldap_init(HostName, PortNumber) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        DllCall("WLDAP32.dll\ldap_init", "ptr", HostName, "uint", PortNumber, "CDecl ")
    }

    /**
     * The ldap_sslinit function (winldap.h) initializes a Secure Sockets Layer (SSL) session with an LDAP server.
     * @remarks
     * Call <b>ldap_sslinit</b> to create a connection block to a secured LDAP server. The <i>HostName</i> parameter can be <b>NULL</b> in which case the run time attempts to find the "default" LDAP server. The hosts are tried in the order listed, stopping with the first one to which a successful connection is made.
     * 
     * If the <i>HostName</i> was set to either <b>NULL</b> or the domain name, automatic reconnect applies. If the connected DC stops functioning for some reason during the connection's lifetime, LDAP will automatically reconnect to another DC in the specified domain. This behavior can be toggled off or on using the <b>LDAP_OPT_AUTO_RECONNECT</b> session option, which is on by default.
     * 
     * If a Global Catalog port number is passed to <b>ldap_sslinit</b> as one of the arguments, then the <i>HostName</i> passed for that port number must be the name of the forest for the underlying call to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to correctly find the GC in the enterprise.
     * 
     * The function allocates an LDAP structure to maintain state information for the session, and returns a handle to this structure. You pass this handle to subsequent LDAP function calls during the course of the session.
     * 
     * Multithreading: Calls to <b>ldap_sslinit</b> are thread-safe.
     * 
     * Microsoft implements security features, like SSL, through its SSPI capabilities.
     * @param {Pointer<PSTR>} HostName A pointer to a null-terminated string that contains a space-separated list of host names or dotted strings representing the IP address of hosts running an LDAP server to which to connect. Each host name in the list can include an optional port number which is separated from the host itself with a colon (:) character.
     * @param {Integer} PortNumber Contains the TCP port number to which to connect. Set to <b>LDAP_SSL_PORT</b> to obtain the default port, 636. This parameter is ignored if a host name includes a port number.
     * @param {Integer} secure If nonzero, the function uses SSL encryption. If the value is 0, the function establishes a plain TCP connection and uses clear text (no encryption).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_sslinit
     * @since windows6.0.6000
     */
    static ldap_sslinit(HostName, PortNumber, secure) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        DllCall("WLDAP32.dll\ldap_sslinit", "ptr", HostName, "uint", PortNumber, "int", secure, "CDecl ")
    }

    /**
     * The cldap_openW (Unicode) function (winldap.h) establishes a session with an LDAP server over a connectionless User Datagram Protocol (UDP) service.
     * @remarks
     * The <b>cldap_open</b> function, unlike 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>, creates a connection block for UDP-based connectionless LDAP services. No TCP session is maintained. Like <b>ldap_open</b>, <b>cldap_open</b> allocates an LDAP structure to maintain state data for the session, and then attempts to make the connection before returning to the caller. The call returns a session handle, which you pass to subsequent LDAP function calls in the course of the session. When finished with the session, always free the allocated session handle by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a>.
     * 
     * Using LDAP over UDP does not support binding and does not support TLS (SSL) or SASL.
     * 
     * Multithreading: Calls to <b>cldap_open</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When using <b>cldap_open</b>, the connection is opened by an anonymous user.  The only available operations are those that an anonymous user can run.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines cldap_open as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} HostName A pointer to a null-terminated string that contains a list of host names or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made.
     * @param {Integer} PortNumber The port number to be used. If no port number is specified, the default is port 389, which is defined as LDAP_PORT. If  port numbers are included in the <i>HostName</i> parameter, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-cldap_openw
     * @since windows6.0.6000
     */
    static cldap_openW(HostName, PortNumber) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        A_LastError := 0

        DllCall("WLDAP32.dll\cldap_openW", "ptr", HostName, "uint", PortNumber, "CDecl ")
        if(A_LastError)
            throw OSError()

    }

    /**
     * Establishes a session with an LDAP server over a connectionless User Datagram Protocol (UDP) service. (cldap_openA)
     * @remarks
     * The <b>cldap_open</b> function, unlike 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>, creates a connection block for UDP-based connectionless LDAP services. No TCP session is maintained. Like <b>ldap_open</b>, <b>cldap_open</b> allocates an LDAP structure to maintain state data for the session, and then attempts to make the connection before returning to the caller. The call returns a session handle, which you pass to subsequent LDAP function calls in the course of the session. When finished with the session, always free the allocated session handle by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a>.
     * 
     * Using LDAP over UDP does not support binding and does not support TLS (SSL) or SASL.
     * 
     * Multithreading: Calls to <b>cldap_open</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When using <b>cldap_open</b>, the connection is opened by an anonymous user.  The only available operations are those that an anonymous user can run.</div>
     * <div> </div>
     * @param {Pointer<PSTR>} HostName A pointer to a null-terminated string that contains a list of host names or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made.
     * @param {Integer} PortNumber The port number to be used. If no port number is specified, the default is port 389, which is defined as LDAP_PORT. If  port numbers are included in the <i>HostName</i> parameter, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-cldap_opena
     * @since windows6.0.6000
     */
    static cldap_openA(HostName, PortNumber) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        A_LastError := 0

        DllCall("WLDAP32.dll\cldap_openA", "ptr", HostName, "uint", PortNumber, "CDecl ")
        if(A_LastError)
            throw OSError()

    }

    /**
     * The cldap_open function (winldap.h) establishes a session with an LDAP server over a connectionless User Datagram Protocol (UDP) service.
     * @remarks
     * The <b>cldap_open</b> function, unlike 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>, creates a connection block for UDP-based connectionless LDAP services. No TCP session is maintained. Like <b>ldap_open</b>, <b>cldap_open</b> allocates an LDAP structure to maintain state data for the session, and then attempts to make the connection before returning to the caller. The call returns a session handle, which you pass to subsequent LDAP function calls in the course of the session. When finished with the session, always free the allocated session handle by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a>.
     * 
     * Using LDAP over UDP does not support binding and does not support TLS (SSL) or SASL.
     * 
     * Multithreading: Calls to <b>cldap_open</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When using <b>cldap_open</b>, the connection is opened by an anonymous user.  The only available operations are those that an anonymous user can run.</div>
     * <div> </div>
     * @param {Pointer<PSTR>} HostName A pointer to a null-terminated string that contains a list of host names or dotted strings that represent the IP address of LDAP server hosts. Use a single space to separate the host names in the list. Each host name in the list may be followed by a port number. The optional port number is separated from the host itself with a colon (:). The LDAP run time attempts connection with the hosts in the order listed, stopping when a successful connection is made.
     * @param {Integer} PortNumber The port number to be used. If no port number is specified, the default is port 389, which is defined as LDAP_PORT. If  port numbers are included in the <i>HostName</i> parameter, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-cldap_open
     * @since windows6.0.6000
     */
    static cldap_open(HostName, PortNumber) {
        HostName := HostName is String? StrPtr(HostName) : HostName

        A_LastError := 0

        DllCall("WLDAP32.dll\cldap_open", "ptr", HostName, "uint", PortNumber, "CDecl ")
        if(A_LastError)
            throw OSError()

    }

    /**
     * The ldap_unbind function frees resources associated with an LDAP session.
     * @remarks
     * Call <b>ldap_unbind</b> to unbind from the directory, close the connection, and dispose of the session handle. Call this function when you have finished with an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> connection structure, even if you have not called 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> when opening the connection. Ensure that you do not inadvertently call this function more than once on a session handle because doing so can free resources that you did not intend to release.
     * 
     * The <b>ldap_unbind</b> function is for the asynchronous set of APIs, but it completes synchronously. There is no server response to an unbind operation.
     * 
     * Multithreading: Calls to <b>ldap_unbind</b> are safe, but you cannot use the session handle to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> structure after it has been freed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_unbind
     * @since windows6.0.6000
     */
    static ldap_unbind(ld) {
        result := DllCall("WLDAP32.dll\ldap_unbind", "ptr", ld, "CDecl uint")
        return result
    }

    /**
     * The ldap_unbind_s function synchronously frees resources associated with an LDAP session.
     * @remarks
     * Call <b>ldap_unbind_s</b> to unbind from the directory, close the connection, and dispose of the session handle.  Call this function when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> connection structure is no longer required, even if you have not called 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> when opening the connection. Ensure that you do not inadvertently call this function more than once on a session handle because doing so can free resources that you did not intend to release.
     * 
     * Both 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> and <b>ldap_unbind_s</b> work synchronously. There is no server response to an unbind operation.
     * 
     * Multithreading: Calls to <b>ldap_unbind_s</b> are safe except that you cannot use the session handle to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> structure after it has been freed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_unbind_s
     * @since windows6.0.6000
     */
    static ldap_unbind_s(ld) {
        result := DllCall("WLDAP32.dll\ldap_unbind_s", "ptr", ld, "CDecl uint")
        return result
    }

    /**
     * The ldap_get_option function (winldap.h) retrieves the current values of session-wide parameters.
     * @remarks
     * For more information and a description of optional settings that apply to an LDAP session, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. The <i>outvalue</i> value returns a pointer to an allocated block of memory of the type listed in the <b>Session Options</b> table; this memory should be freed using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> when the data is no longer required, unless it is explicitly mentioned in the <b>Session Options</b> table not to free the returned memory.
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">LDAP_OPT_ERROR_STRING</a> returns a pointer to an internal static string table, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> should not be called when using this session option.</div>
     * <div> </div>
     * Multithreading: The <b>ldap_get_option</b> function is thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} option The name of the option accessed. For more information and  a list of allowable options and their values, see the following Remarks section.
     * @param {Pointer<Void>} outvalue The address of the option value. The actual type of this parameter depends on the setting of the option parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_option
     * @since windows6.0.6000
     */
    static ldap_get_option(ld, option, outvalue) {
        result := DllCall("WLDAP32.dll\ldap_get_option", "ptr", ld, "int", option, "ptr", outvalue, "CDecl uint")
        return result
    }

    /**
     * The ldap_get_optionW (Unicode) function (winldap.h) retrieves the current values of session-wide parameters.
     * @remarks
     * For more information and a description of optional settings that apply to an LDAP session, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. The <i>outvalue</i> value returns a pointer to an allocated block of memory of the type listed in the <b>Session Options</b> table; this memory should be freed using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> when the data is no longer required, unless it is explicitly mentioned in the <b>Session Options</b> table not to free the returned memory.
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">LDAP_OPT_ERROR_STRING</a> returns a pointer to an internal static string table, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> should not be called when using this session option.</div>
     * <div> </div>
     * Multithreading: The <b>ldap_get_option</b> function is thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_get_option as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} option The name of the option accessed. For more information and  a list of allowable options and their values, see the following Remarks section.
     * @param {Pointer<Void>} outvalue The address of the option value. The actual type of this parameter depends on the setting of the option parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_optionw
     * @since windows6.0.6000
     */
    static ldap_get_optionW(ld, option, outvalue) {
        result := DllCall("WLDAP32.dll\ldap_get_optionW", "ptr", ld, "int", option, "ptr", outvalue, "CDecl uint")
        return result
    }

    /**
     * The ldap_set_option function (winldap.h) sets options on connection blocks.
     * @remarks
     * Call <b>ldap_set_option</b> to access the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> structure that represents an LDAP session. Do not attempt to modify the LDAP data structure directly.
     * 
     * For more information and  a description of optional settings that apply to an LDAP session, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. For more information about flags, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a>.
     * 
     * It is now possible to digitally sign or encrypt all of your LDAP traffic to and from a Windows LDAP server using the Kerberos authentication protocol. This new feature provides integrity and confidentiality required by some applications. Be aware that using Secure Sockets Layer (SSL) will give you the same benefits, but requires extensive certificate enrollments for the server and, sometimes, for the client.
     * 
     * To enable signing and sealing, you have to turn on one of the following options prior to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind_s">ldap_bind_s</a> with <b>LDAP_AUTH_NEGOTIATE</b> for the bind method.
     * 
     * 
     * ```cpp
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} option The name of the option set.
     * @param {Pointer<Void>} invalue A pointer to the value that the option is to be given. The actual type of this parameter depends on the setting of the option parameter. The constants LDAP_OPT_ON and LDAP_OPT_OFF can be given for options that have on or off settings.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_set_option
     * @since windows6.0.6000
     */
    static ldap_set_option(ld, option, invalue) {
        result := DllCall("WLDAP32.dll\ldap_set_option", "ptr", ld, "int", option, "ptr", invalue, "CDecl uint")
        return result
    }

    /**
     * The ldap_set_optionW (Unicode) function (winldap.h) sets options on connection blocks.
     * @remarks
     * Call <b>ldap_set_option</b> to access the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> structure that represents an LDAP session. Do not attempt to modify the LDAP data structure directly.
     * 
     * For more information and  a description of optional settings that apply to an LDAP session, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. For more information about flags, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a>.
     * 
     * It is now possible to digitally sign or encrypt all of your LDAP traffic to and from a Windows LDAP server using the Kerberos authentication protocol. This new feature provides integrity and confidentiality required by some applications. Be aware that using Secure Sockets Layer (SSL) will give you the same benefits, but requires extensive certificate enrollments for the server and, sometimes, for the client.
     * 
     * To enable signing and sealing, you have to turn on one of the following options prior to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind_s">ldap_bind_s</a> with <b>LDAP_AUTH_NEGOTIATE</b> for the bind method.
     * 
     * 
     * ```cpp
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} option The name of the option set.
     * @param {Pointer<Void>} invalue A pointer to the value that the option is to be given. The actual type of this parameter depends on the setting of the option parameter. The constants LDAP_OPT_ON and LDAP_OPT_OFF can be given for options that have on or off settings.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_set_optionw
     * @since windows6.0.6000
     */
    static ldap_set_optionW(ld, option, invalue) {
        result := DllCall("WLDAP32.dll\ldap_set_optionW", "ptr", ld, "int", option, "ptr", invalue, "CDecl uint")
        return result
    }

    /**
     * The ldap_simple_bindW (Unicode) function (winldap.h) asynchronously authenticates a client to a server, using a plaintext password.
     * @remarks
     * The <b>ldap_simple_bind</b> function initiates a simple asynchronous bind operation to authenticate a client to an LDAP server. Subsequent bind calls can be used to reauthenticate using the same connection.
     * 
     * To authenticate as a specific user, provide both the name of the entry (user) and the password for that entry. To authenticate an anonymous user, when no access permissions are required, pass <b>NULL</b> to both the <i>dn</i> and <i>passwd</i> parameters.
     * 
     * As an asynchronous function, <b>ldap_simple_bind</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous bind operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>. Be aware that if an LDAP 2 server is contacted, do not attempt other operations over the connection until the bind call has successfully completed.
     * 
     * To return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind_s">ldap_simple_bind_s</a>.
     * 
     * Multithreading: Bind calls are not safe because they apply to the connection as a whole. Use caution if threads share connections and try to thread binds with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, terminate the session by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_simple_bind</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * 
     * The <b>ldap_simple_bind</b> function is designed to bind to the local domain. The function cannot be used for cross forest authentication.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_simple_bind as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {Pointer<PWSTR>} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, it returns the message ID of the operation initiated.
     * 
     * If the function fails, it returns -1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_simple_bindw
     * @since windows6.0.6000
     */
    static ldap_simple_bindW(ld, dn, passwd) {
        dn := dn is String? StrPtr(dn) : dn
        passwd := passwd is String? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bindW", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * Asynchronously authenticates a client to a server, using a plaintext password. (ldap_simple_bindA)
     * @remarks
     * The <b>ldap_simple_bind</b> function initiates a simple asynchronous bind operation to authenticate a client to an LDAP server. Subsequent bind calls can be used to reauthenticate using the same connection.
     * 
     * To authenticate as a specific user, provide both the name of the entry (user) and the password for that entry. To authenticate an anonymous user, when no access permissions are required, pass <b>NULL</b> to both the <i>dn</i> and <i>passwd</i> parameters.
     * 
     * As an asynchronous function, <b>ldap_simple_bind</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous bind operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>. Be aware that if an LDAP 2 server is contacted, do not attempt other operations over the connection until the bind call has successfully completed.
     * 
     * To return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind_s">ldap_simple_bind_s</a>.
     * 
     * Multithreading: Bind calls are not safe because they apply to the connection as a whole. Use caution if threads share connections and try to thread binds with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, terminate the session by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_simple_bind</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * 
     * The <b>ldap_simple_bind</b> function is designed to bind to the local domain. The function cannot be used for cross forest authentication.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {Pointer<PSTR>} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, it returns the message ID of the operation initiated.
     * 
     * If the function fails, it returns -1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_simple_binda
     * @since windows6.0.6000
     */
    static ldap_simple_bindA(ld, dn, passwd) {
        dn := dn is String? StrPtr(dn) : dn
        passwd := passwd is String? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bindA", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * The ldap_simple_bind_sW (Unicode) function (winldap.h) synchronously authenticates a client to a server, using a plaintext password.
     * @remarks
     * The <b>ldap_simple_bind_s</b> function initiates a simple synchronous bind operation to authenticate a client to an LDAP server. Subsequent bind calls can be used to reauthenticate using the same connection.
     * 
     * Upon completion of the bind operation, <b>ldap_simple_bind_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> if you prefer to have the operation carried out asynchronously. Be aware that if an LDAP 2 server is contacted, do not attempt other operations over the connection until the bind call has completed successfully.
     * 
     * Multithreading: Bind calls are unsafe because they apply to the connection as a whole. Use caution if threads share connections, and try to thread binds with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, terminate the session by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_simple_bind_s</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_simple_bind_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {Pointer<PWSTR>} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_simple_bind_sw
     * @since windows6.0.6000
     */
    static ldap_simple_bind_sW(ld, dn, passwd) {
        dn := dn is String? StrPtr(dn) : dn
        passwd := passwd is String? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bind_sW", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * The ldap_simple_bind_s function synchronously authenticates a client to a server, using a plaintext password. (ldap_simple_bind_sA)
     * @remarks
     * The <b>ldap_simple_bind_s</b> function initiates a simple synchronous bind operation to authenticate a client to an LDAP server. Subsequent bind calls can be used to reauthenticate using the same connection.
     * 
     * Upon completion of the bind operation, <b>ldap_simple_bind_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> if you prefer to have the operation carried out asynchronously. Be aware that if an LDAP 2 server is contacted, do not attempt other operations over the connection until the bind call has completed successfully.
     * 
     * Multithreading: Bind calls are unsafe because they apply to the connection as a whole. Use caution if threads share connections, and try to thread binds with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, terminate the session by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_simple_bind_s</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {Pointer<PSTR>} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_simple_bind_sa
     * @since windows6.0.6000
     */
    static ldap_simple_bind_sA(ld, dn, passwd) {
        dn := dn is String? StrPtr(dn) : dn
        passwd := passwd is String? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bind_sA", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * the ldap_bindW (Unicode) function (winldap.h) asynchronously authenticates a client with the LDAP server.
     * @remarks
     * This implementation of <b>ldap_bind</b> supports the following authentication method.
     * 
     * <table>
     * <tr>
     * <th>Authentication method</th>
     * <th>Description</th>
     * <th>Credential</th>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SIMPLE</b></td>
     * <td>Authentication with a plaintext password.</td>
     * <td>A string that contains the user password.</td>
     * </tr>
     * </table>
     *  
     * 
     * <b>LDAP_AUTH_SIMPLE</b> is the only authentication method compatible with the asynchronous version of binding; <b>ldap_bind</b>. Using any other authentication method with <b>ldap_bind</b> will fail and return <b>LDAP_PARAM_ERROR</b>. Calling <b>ldap_bind</b> with the <b>LDAP_AUTH_SIMPLE</b> method is equivalent to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a>. All other authentication methods require synchronous binding as provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind_s">ldap_bind_s</a>.
     * 
     * Be aware that LDAP 2 servers require an application to bind before attempting any other operations that require authentication.
     * 
     * Multithreading: Bind calls are not safe because they apply to the connection as a whole. Use caution if threads share connections and, when possible, thread the bind operations with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified by using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, terminate the session by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_bind</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_bind as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry used to bind.
     * @param {Pointer<PWSTR>} cred A pointer to a null-terminated string that contains the credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the setting of the method parameter. For more information, see the Remarks section.
     * @param {Integer} method The authentication method to use.
     * @returns {Integer} If the function succeeds, the return value is the message ID of the initiated operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_bindw
     * @since windows6.0.6000
     */
    static ldap_bindW(ld, dn, cred, method) {
        dn := dn is String? StrPtr(dn) : dn
        cred := cred is String? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bindW", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * Asynchronously authenticates a client with the LDAP server. (ldap_bindA)
     * @remarks
     * This implementation of <b>ldap_bind</b> supports the following authentication method.
     * 
     * <table>
     * <tr>
     * <th>Authentication method</th>
     * <th>Description</th>
     * <th>Credential</th>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SIMPLE</b></td>
     * <td>Authentication with a plaintext password.</td>
     * <td>A string that contains the user password.</td>
     * </tr>
     * </table>
     *  
     * 
     * <b>LDAP_AUTH_SIMPLE</b> is the only authentication method compatible with the asynchronous version of binding; <b>ldap_bind</b>. Using any other authentication method with <b>ldap_bind</b> will fail and return <b>LDAP_PARAM_ERROR</b>. Calling <b>ldap_bind</b> with the <b>LDAP_AUTH_SIMPLE</b> method is equivalent to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a>. All other authentication methods require synchronous binding as provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind_s">ldap_bind_s</a>.
     * 
     * Be aware that LDAP 2 servers require an application to bind before attempting any other operations that require authentication.
     * 
     * Multithreading: Bind calls are not safe because they apply to the connection as a whole. Use caution if threads share connections and, when possible, thread the bind operations with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified by using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, terminate the session by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_bind</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry used to bind.
     * @param {Pointer<PSTR>} cred A pointer to a null-terminated string that contains the credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the setting of the method parameter. For more information, see the Remarks section.
     * @param {Integer} method The authentication method to use.
     * @returns {Integer} If the function succeeds, the return value is the message ID of the initiated operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_binda
     * @since windows6.0.6000
     */
    static ldap_bindA(ld, dn, cred, method) {
        dn := dn is String? StrPtr(dn) : dn
        cred := cred is String? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bindA", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * The ldap_bind_sW (Unicode) function (winldap.h) synchronously authenticates a client to the LDAP server.
     * @remarks
     * The introduction of User Account Control in Windows Server 2008 and Windows Vista has a very important consequence with regard to making modifications or additions in LDAP.  When a user is logged on to a DC with a restricted UAC Administrator token and using <b>NULL</b> credentials, any modification or addition to the directory, or any schema change operation, will fail. This includes DirSync searches, retrieving the SACL from an object's <a href="https://docs.microsoft.com/windows/desktop/ADSchema/a-ntsecuritydescriptor">ntSecurityDescriptor</a> attribute when using SecurityDescriptorFlags, and many other operations.
     * 
     * These will all fail with insufficient access rights.
     * 
     * If User Account Control is in effect when an administrator logs on to a DC, the administrator will get a restricted token in the logon session. If he or she then uses <b>ldap_bind_s</b> with <b>NULL</b> credentials, then operations that make modifications or additions will fail.
     * 
     * The implementation of <b>ldap_bind_s</b> supports the authentication methods listed in the following table. Calling <b>ldap_bind_s</b> with the LDAP_AUTH_SIMPLE option is equivalent to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind_s">ldap_simple_bind_s</a>.
     * 
     * <table>
     * <tr>
     * <th>Method</th>
     * <th>Description</th>
     * <th>Credential</th>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SIMPLE</b></td>
     * <td>
     * Authentication with a plaintext password.
     * 
     * </td>
     * <td>
     * A string that contains the user password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_DIGEST</b></td>
     * <td>
     * Digest authentication package.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_DPA</b></td>
     * <td>
     * Distributed password authentication. Used by Microsoft Membership System.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_MSN</b></td>
     * <td>
     * Microsoft Network Authentication Service.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_NEGOTIATE</b></td>
     * <td>
     * Generic security services (GSS) (Snego). Does not provide authentication, but instead chooses the most appropriate authentication method from a list of available services and passes all authentication data to that service.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_NTLM</b></td>
     * <td>
     * NT LAN Manager
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SICILY</b></td>
     * <td>
     * Covers package negotiation to MSN servers.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SSPI</b></td>
     * <td>
     * Obsolete. Included for backward compatibility. Using this constant selects GSS (Snego) negotiation service.
     * 
     * </td>
     * <td>
     * Same as <b>LDAP_AUTH_NEGOTIATE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For asynchronous bind authentication, use <b>LDAP_AUTH_SIMPLE</b> with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * 
     * The bind operation identifies a client to the directory server by providing a distinguished name and some type of authentication credential, such as a password. The exact credentials are dependent on the authentication method used. If you pass in <b>NULL</b> for the credentials with <b>ldap_bind_s()</b> (non-simple), the current user or service credentials will be used. If a simple bind method (as in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind_s">ldap_simple_bind_s</a>) is specified, it is equivalent to a <b>NULL</b> plaintext password. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * 
     * Be aware that LDAP 2 servers require an application to bind before attempting other operations that require authentication.
     * 
     * Multithreading: Bind calls are unsafe because they apply to the connection as a whole. Use caution if threads share connections and try to thread the bind operations with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, the session must be terminated by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_bind_s</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_bind_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn Pointer to a null-terminated string that contains the distinguished name of the entry used to bind. This can be a DN, a UPN, a WinNT style user name, or other name that the directory server will accept as an identifier.
     * @param {Pointer<PWSTR>} cred Pointer to a null-terminated string that contains the credentials with which to authenticate. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depends on the setting of the <i>method</i> parameter. For more information, see Remarks.
     * @param {Integer} method Indicates the authentication method to use.  For more information and  a listing of valid asynchronous authentication methods, see the Remarks section. For more information and a description of the valid asynchronous authentication method, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_bind_sw
     * @since windows6.0.6000
     */
    static ldap_bind_sW(ld, dn, cred, method) {
        dn := dn is String? StrPtr(dn) : dn
        cred := cred is String? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bind_sW", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * Synchronously authenticates a client to the LDAP server. (ldap_bind_sA)
     * @remarks
     * The introduction of User Account Control in Windows Server 2008 and Windows Vista has a very important consequence with regard to making modifications or additions in LDAP.  When a user is logged on to a DC with a restricted UAC Administrator token and using <b>NULL</b> credentials, any modification or addition to the directory, or any schema change operation, will fail. This includes DirSync searches, retrieving the SACL from an object's <a href="https://docs.microsoft.com/windows/desktop/ADSchema/a-ntsecuritydescriptor">ntSecurityDescriptor</a> attribute when using SecurityDescriptorFlags, and many other operations.
     * 
     * These will all fail with insufficient access rights.
     * 
     * If User Account Control is in effect when an administrator logs on to a DC, the administrator will get a restricted token in the logon session. If he or she then uses <b>ldap_bind_s</b> with <b>NULL</b> credentials, then operations that make modifications or additions will fail.
     * 
     * The implementation of <b>ldap_bind_s</b> supports the authentication methods listed in the following table. Calling <b>ldap_bind_s</b> with the LDAP_AUTH_SIMPLE option is equivalent to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind_s">ldap_simple_bind_s</a>.
     * 
     * <table>
     * <tr>
     * <th>Method</th>
     * <th>Description</th>
     * <th>Credential</th>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SIMPLE</b></td>
     * <td>
     * Authentication with a plaintext password.
     * 
     * </td>
     * <td>
     * A string that contains the user password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_DIGEST</b></td>
     * <td>
     * Digest authentication package.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_DPA</b></td>
     * <td>
     * Distributed password authentication. Used by Microsoft Membership System.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_MSN</b></td>
     * <td>
     * Microsoft Network Authentication Service.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_NEGOTIATE</b></td>
     * <td>
     * Generic security services (GSS) (Snego). Does not provide authentication, but instead chooses the most appropriate authentication method from a list of available services and passes all authentication data to that service.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_NTLM</b></td>
     * <td>
     * NT LAN Manager
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SICILY</b></td>
     * <td>
     * Covers package negotiation to MSN servers.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SSPI</b></td>
     * <td>
     * Obsolete. Included for backward compatibility. Using this constant selects GSS (Snego) negotiation service.
     * 
     * </td>
     * <td>
     * Same as <b>LDAP_AUTH_NEGOTIATE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For asynchronous bind authentication, use <b>LDAP_AUTH_SIMPLE</b> with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * 
     * The bind operation identifies a client to the directory server by providing a distinguished name and some type of authentication credential, such as a password. The exact credentials are dependent on the authentication method used. If you pass in <b>NULL</b> for the credentials with <b>ldap_bind_s()</b> (non-simple), the current user or service credentials will be used. If a simple bind method (as in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind_s">ldap_simple_bind_s</a>) is specified, it is equivalent to a <b>NULL</b> plaintext password. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * 
     * Be aware that LDAP 2 servers require an application to bind before attempting other operations that require authentication.
     * 
     * Multithreading: Bind calls are unsafe because they apply to the connection as a whole. Use caution if threads share connections and try to thread the bind operations with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, the session must be terminated by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_bind_s</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn Pointer to a null-terminated string that contains the distinguished name of the entry used to bind. This can be a DN, a UPN, a WinNT style user name, or other name that the directory server will accept as an identifier.
     * @param {Pointer<PSTR>} cred Pointer to a null-terminated string that contains the credentials with which to authenticate. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depends on the setting of the <i>method</i> parameter. For more information, see Remarks.
     * @param {Integer} method Indicates the authentication method to use.  For more information and  a listing of valid asynchronous authentication methods, see the Remarks section. For more information and a description of the valid asynchronous authentication method, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_bind_sa
     * @since windows6.0.6000
     */
    static ldap_bind_sA(ld, dn, cred, method) {
        dn := dn is String? StrPtr(dn) : dn
        cred := cred is String? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bind_sA", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * The ldap_sasl_bind is an asynchronous function that authenticates a client to the LDAP server using SASL. (ANSI)
     * @remarks
     * The <b>ldap_sasl_bind</b> routine binds to an LDAP server using the Simple Authentication and Security Layer (SASL) protocol. The bind operation identifies a client to the directory server by providing a distinguished name and some type of authentication credentials. The authentication method being used determines the particular type of credential, and is specified by the <i>AuthMechanism</i> argument. This is passed as a string in the form of "<b>GSSAPI</b>", "<b>GSS-SPNEGO</b>", "<b>DIGEST-MD5</b>", and so on. This function can be used to pass arbitrary credentials to the server, so the application must be ready to interpret the response sent back from the server.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_sasl_bind as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistName The distinguished name of the entry used to bind.
     * @param {Pointer<PSTR>} AuthMechanism Indicates the authentication method to use.
     * @param {Pointer<LDAP_BERVAL>} cred The credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the value of the <i>AuthMechanism</i> argument passed. For more information, see Remarks.
     * @param {Pointer<LDAPControlA>} ServerCtrls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientCtrls A list of LDAP client controls.
     * @param {Pointer<Int32>} MessageNumber The message ID for the bind operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_sasl_binda
     * @since windows6.0.6000
     */
    static ldap_sasl_bindA(ExternalHandle, DistName, AuthMechanism, cred, ServerCtrls, ClientCtrls, MessageNumber) {
        DistName := DistName is String? StrPtr(DistName) : DistName
        AuthMechanism := AuthMechanism is String? StrPtr(AuthMechanism) : AuthMechanism

        DllCall("WLDAP32.dll\ldap_sasl_bindA", "ptr", ExternalHandle, "ptr", DistName, "ptr", AuthMechanism, "ptr", cred, "ptr", ServerCtrls, "ptr", ClientCtrls, "ptr", MessageNumber, "CDecl ")
    }

    /**
     * The ldap_sasl_bind is an asynchronous function that authenticates a client to the LDAP server using SASL. (Unicode)
     * @remarks
     * The <b>ldap_sasl_bind</b> routine binds to an LDAP server using the Simple Authentication and Security Layer (SASL) protocol. The bind operation identifies a client to the directory server by providing a distinguished name and some type of authentication credentials. The authentication method being used determines the particular type of credential, and is specified by the <i>AuthMechanism</i> argument. This is passed as a string in the form of "<b>GSSAPI</b>", "<b>GSS-SPNEGO</b>", "<b>DIGEST-MD5</b>", and so on. This function can be used to pass arbitrary credentials to the server, so the application must be ready to interpret the response sent back from the server.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_sasl_bind as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PWSTR>} DistName The distinguished name of the entry used to bind.
     * @param {Pointer<PWSTR>} AuthMechanism Indicates the authentication method to use.
     * @param {Pointer<LDAP_BERVAL>} cred The credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the value of the <i>AuthMechanism</i> argument passed. For more information, see Remarks.
     * @param {Pointer<LDAPControlW>} ServerCtrls A list of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientCtrls A list of LDAP client controls.
     * @param {Pointer<Int32>} MessageNumber The message ID for the bind operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_sasl_bindw
     * @since windows6.0.6000
     */
    static ldap_sasl_bindW(ExternalHandle, DistName, AuthMechanism, cred, ServerCtrls, ClientCtrls, MessageNumber) {
        DistName := DistName is String? StrPtr(DistName) : DistName
        AuthMechanism := AuthMechanism is String? StrPtr(AuthMechanism) : AuthMechanism

        DllCall("WLDAP32.dll\ldap_sasl_bindW", "ptr", ExternalHandle, "ptr", DistName, "ptr", AuthMechanism, "ptr", cred, "ptr", ServerCtrls, "ptr", ClientCtrls, "ptr", MessageNumber, "CDecl ")
    }

    /**
     * The ldap_sasl_bind_s function is a synchronous function that authenticates a client to the LDAP server using SASL. (ANSI)
     * @remarks
     * The <b>ldap_sasl_bind_s</b> function binds to an LDAP server using the Simple Authentication and Security Layer (SASL) protocol. The bind operation identifies a client to the directory server by providing a distinguished name and some type of authentication credentials. The authentication method being used determines the particular type of credential, and is specified by the <i>AuthMechanism</i> argument. This is passed as a string in the form of "<b>GSSAPI</b>", "<b>GSS-SPNEGO</b>", "<b>DIGEST-MD5</b>", and so on. This function can be used to pass arbitrary credentials to the server, so the application must be ready to interpret the response sent back from the server.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_sasl_bind_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistName The distinguished name of the entry used to bind.
     * @param {Pointer<PSTR>} AuthMechanism Indicates the authentication method to use.
     * @param {Pointer<LDAP_BERVAL>} cred The credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the value of the <i>AuthMechanism</i> argument passed. For more information, see Remarks.
     * @param {Pointer<LDAPControlA>} ServerCtrls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientCtrls A list of LDAP client controls.
     * @param {Pointer<LDAP_BERVAL>} ServerData Authentication data returned by the server in response to the bind request.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_sasl_bind_sa
     * @since windows6.0.6000
     */
    static ldap_sasl_bind_sA(ExternalHandle, DistName, AuthMechanism, cred, ServerCtrls, ClientCtrls, ServerData) {
        DistName := DistName is String? StrPtr(DistName) : DistName
        AuthMechanism := AuthMechanism is String? StrPtr(AuthMechanism) : AuthMechanism

        DllCall("WLDAP32.dll\ldap_sasl_bind_sA", "ptr", ExternalHandle, "ptr", DistName, "ptr", AuthMechanism, "ptr", cred, "ptr", ServerCtrls, "ptr", ClientCtrls, "ptr", ServerData, "CDecl ")
    }

    /**
     * The ldap_sasl_bind_s function is a synchronous function that authenticates a client to the LDAP server using SASL. (Unicode)
     * @remarks
     * The <b>ldap_sasl_bind_s</b> function binds to an LDAP server using the Simple Authentication and Security Layer (SASL) protocol. The bind operation identifies a client to the directory server by providing a distinguished name and some type of authentication credentials. The authentication method being used determines the particular type of credential, and is specified by the <i>AuthMechanism</i> argument. This is passed as a string in the form of "<b>GSSAPI</b>", "<b>GSS-SPNEGO</b>", "<b>DIGEST-MD5</b>", and so on. This function can be used to pass arbitrary credentials to the server, so the application must be ready to interpret the response sent back from the server.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_sasl_bind_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PWSTR>} DistName The distinguished name of the entry used to bind.
     * @param {Pointer<PWSTR>} AuthMechanism Indicates the authentication method to use.
     * @param {Pointer<LDAP_BERVAL>} cred The credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the value of the <i>AuthMechanism</i> argument passed. For more information, see Remarks.
     * @param {Pointer<LDAPControlW>} ServerCtrls A list of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientCtrls A list of LDAP client controls.
     * @param {Pointer<LDAP_BERVAL>} ServerData Authentication data returned by the server in response to the bind request.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_sasl_bind_sw
     * @since windows6.0.6000
     */
    static ldap_sasl_bind_sW(ExternalHandle, DistName, AuthMechanism, cred, ServerCtrls, ClientCtrls, ServerData) {
        DistName := DistName is String? StrPtr(DistName) : DistName
        AuthMechanism := AuthMechanism is String? StrPtr(AuthMechanism) : AuthMechanism

        DllCall("WLDAP32.dll\ldap_sasl_bind_sW", "ptr", ExternalHandle, "ptr", DistName, "ptr", AuthMechanism, "ptr", cred, "ptr", ServerCtrls, "ptr", ClientCtrls, "ptr", ServerData, "CDecl ")
    }

    /**
     * The ldap_simple_bind function (winldap.h) asynchronously authenticates a client to a server, using a plaintext password.
     * @remarks
     * The <b>ldap_simple_bind</b> function initiates a simple asynchronous bind operation to authenticate a client to an LDAP server. Subsequent bind calls can be used to reauthenticate using the same connection.
     * 
     * To authenticate as a specific user, provide both the name of the entry (user) and the password for that entry. To authenticate an anonymous user, when no access permissions are required, pass <b>NULL</b> to both the <i>dn</i> and <i>passwd</i> parameters.
     * 
     * As an asynchronous function, <b>ldap_simple_bind</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous bind operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>. Be aware that if an LDAP 2 server is contacted, do not attempt other operations over the connection until the bind call has successfully completed.
     * 
     * To return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind_s">ldap_simple_bind_s</a>.
     * 
     * Multithreading: Bind calls are not safe because they apply to the connection as a whole. Use caution if threads share connections and try to thread binds with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, terminate the session by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_simple_bind</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * 
     * The <b>ldap_simple_bind</b> function is designed to bind to the local domain. The function cannot be used for cross forest authentication.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {Pointer<PSTR>} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, it returns the message ID of the operation initiated.
     * 
     * If the function fails, it returns -1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_simple_bind
     * @since windows6.0.6000
     */
    static ldap_simple_bind(ld, dn, passwd) {
        dn := dn is String? StrPtr(dn) : dn
        passwd := passwd is String? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bind", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * The ldap_simple_bind_s function (winldap.h) synchronously authenticates a client to a server, using a plaintext password.
     * @remarks
     * The <b>ldap_simple_bind_s</b> function initiates a simple synchronous bind operation to authenticate a client to an LDAP server. Subsequent bind calls can be used to reauthenticate using the same connection.
     * 
     * Upon completion of the bind operation, <b>ldap_simple_bind_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> if you prefer to have the operation carried out asynchronously. Be aware that if an LDAP 2 server is contacted, do not attempt other operations over the connection until the bind call has completed successfully.
     * 
     * Multithreading: Bind calls are unsafe because they apply to the connection as a whole. Use caution if threads share connections, and try to thread binds with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, terminate the session by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_simple_bind_s</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn The name of the user to bind as. The bind operation uses the <i>dn</i> and <i>passwd</i> parameters to authenticate the user.
     * @param {Pointer<PSTR>} passwd The password of the user specified in the <i>dn</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_simple_bind_s
     * @since windows6.0.6000
     */
    static ldap_simple_bind_s(ld, dn, passwd) {
        dn := dn is String? StrPtr(dn) : dn
        passwd := passwd is String? StrPtr(passwd) : passwd

        result := DllCall("WLDAP32.dll\ldap_simple_bind_s", "ptr", ld, "ptr", dn, "ptr", passwd, "CDecl uint")
        return result
    }

    /**
     * The ldap_bind function (winldap.h) asynchronously authenticates a client with the LDAP server.
     * @remarks
     * This implementation of <b>ldap_bind</b> supports the following authentication method.
     * 
     * <table>
     * <tr>
     * <th>Authentication method</th>
     * <th>Description</th>
     * <th>Credential</th>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SIMPLE</b></td>
     * <td>Authentication with a plaintext password.</td>
     * <td>A string that contains the user password.</td>
     * </tr>
     * </table>
     *  
     * 
     * <b>LDAP_AUTH_SIMPLE</b> is the only authentication method compatible with the asynchronous version of binding; <b>ldap_bind</b>. Using any other authentication method with <b>ldap_bind</b> will fail and return <b>LDAP_PARAM_ERROR</b>. Calling <b>ldap_bind</b> with the <b>LDAP_AUTH_SIMPLE</b> method is equivalent to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a>. All other authentication methods require synchronous binding as provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind_s">ldap_bind_s</a>.
     * 
     * Be aware that LDAP 2 servers require an application to bind before attempting any other operations that require authentication.
     * 
     * Multithreading: Bind calls are not safe because they apply to the connection as a whole. Use caution if threads share connections and, when possible, thread the bind operations with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified by using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, terminate the session by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_bind</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry used to bind.
     * @param {Pointer<PSTR>} cred A pointer to a null-terminated string that contains the credentials to use for authentication. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depend on the setting of the method parameter. For more information, see the Remarks section.
     * @param {Integer} method The authentication method to use.
     * @returns {Integer} If the function succeeds, the return value is the message ID of the initiated operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_bind
     * @since windows6.0.6000
     */
    static ldap_bind(ld, dn, cred, method) {
        dn := dn is String? StrPtr(dn) : dn
        cred := cred is String? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bind", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * The ldap_bind_s function (winldap.h) synchronously authenticates a client to the LDAP server.
     * @remarks
     * The introduction of User Account Control in Windows Server 2008 and Windows Vista has a very important consequence with regard to making modifications or additions in LDAP.  When a user is logged on to a DC with a restricted UAC Administrator token and using <b>NULL</b> credentials, any modification or addition to the directory, or any schema change operation, will fail. This includes DirSync searches, retrieving the SACL from an object's <a href="https://docs.microsoft.com/windows/desktop/ADSchema/a-ntsecuritydescriptor">ntSecurityDescriptor</a> attribute when using SecurityDescriptorFlags, and many other operations.
     * 
     * These will all fail with insufficient access rights.
     * 
     * If User Account Control is in effect when an administrator logs on to a DC, the administrator will get a restricted token in the logon session. If he or she then uses <b>ldap_bind_s</b> with <b>NULL</b> credentials, then operations that make modifications or additions will fail.
     * 
     * The implementation of <b>ldap_bind_s</b> supports the authentication methods listed in the following table. Calling <b>ldap_bind_s</b> with the LDAP_AUTH_SIMPLE option is equivalent to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind_s">ldap_simple_bind_s</a>.
     * 
     * <table>
     * <tr>
     * <th>Method</th>
     * <th>Description</th>
     * <th>Credential</th>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SIMPLE</b></td>
     * <td>
     * Authentication with a plaintext password.
     * 
     * </td>
     * <td>
     * A string that contains the user password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_DIGEST</b></td>
     * <td>
     * Digest authentication package.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_DPA</b></td>
     * <td>
     * Distributed password authentication. Used by Microsoft Membership System.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_MSN</b></td>
     * <td>
     * Microsoft Network Authentication Service.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_NEGOTIATE</b></td>
     * <td>
     * Generic security services (GSS) (Snego). Does not provide authentication, but instead chooses the most appropriate authentication method from a list of available services and passes all authentication data to that service.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_NTLM</b></td>
     * <td>
     * NT LAN Manager
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SICILY</b></td>
     * <td>
     * Covers package negotiation to MSN servers.
     * 
     * </td>
     * <td>
     * To log in as the current user, set the <i>dn</i> and <i>cred</i> parameters to <b>NULL</b>. To log in as another user, set the <i>dn</i> parameter to <b>NULL</b> and the <i>cred</i> parameter to  a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure with the appropriate user name, domain name, and password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>LDAP_AUTH_SSPI</b></td>
     * <td>
     * Obsolete. Included for backward compatibility. Using this constant selects GSS (Snego) negotiation service.
     * 
     * </td>
     * <td>
     * Same as <b>LDAP_AUTH_NEGOTIATE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For asynchronous bind authentication, use <b>LDAP_AUTH_SIMPLE</b> with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * 
     * The bind operation identifies a client to the directory server by providing a distinguished name and some type of authentication credential, such as a password. The exact credentials are dependent on the authentication method used. If you pass in <b>NULL</b> for the credentials with <b>ldap_bind_s()</b> (non-simple), the current user or service credentials will be used. If a simple bind method (as in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind_s">ldap_simple_bind_s</a>) is specified, it is equivalent to a <b>NULL</b> plaintext password. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * 
     * Be aware that LDAP 2 servers require an application to bind before attempting other operations that require authentication.
     * 
     * Multithreading: Bind calls are unsafe because they apply to the connection as a whole. Use caution if threads share connections and try to thread the bind operations with other operations.
     * 
     * <div class="alert"><b>Note</b>  The Microsoft LDAP client uses a default timeout value of 120 seconds (2 minutes) for each bind-response roundtrip. This timeout value can be changed using the <b>LDAP_OPT_TIMELIMIT</b> session option. Other operations do not have a timeout unless specified using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a>.</div>
     * <div> </div>
     * When all of the operations on the session handle are completed, the session must be terminated by passing the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> function.  Also, if the <b>ldap_bind_s</b> call fails, the session handle should be freed with a call to  <b>ldap_unbind</b> when no longer required for error recovery.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn Pointer to a null-terminated string that contains the distinguished name of the entry used to bind. This can be a DN, a UPN, a WinNT style user name, or other name that the directory server will accept as an identifier.
     * @param {Pointer<PSTR>} cred Pointer to a null-terminated string that contains the credentials with which to authenticate. Arbitrary credentials can be passed using this parameter. The format and content of the credentials depends on the setting of the <i>method</i> parameter. For more information, see Remarks.
     * @param {Integer} method Indicates the authentication method to use.  For more information and  a listing of valid asynchronous authentication methods, see the Remarks section. For more information and a description of the valid asynchronous authentication method, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_bind_s
     * @since windows6.0.6000
     */
    static ldap_bind_s(ld, dn, cred, method) {
        dn := dn is String? StrPtr(dn) : dn
        cred := cred is String? StrPtr(cred) : cred

        result := DllCall("WLDAP32.dll\ldap_bind_s", "ptr", ld, "ptr", dn, "ptr", cred, "uint", method, "CDecl uint")
        return result
    }

    /**
     * The ldap_searchW (Unicode) function (winldap.h) searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @remarks
     * The <b>ldap_search</b> function initiates an asynchronous search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the LDAP_OPT_SIZELIMIT, LDAP_OPT_TIMELIMIT, and LDAP_OPT_DEREF options that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>.
     * 
     * As an asynchronous function, <b>ldap_search</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous search operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_s">ldap_search_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext_s">ldap_search_ext_s</a> to implement support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_search</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_search as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld A session handle.
     * @param {Pointer<PWSTR>} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PWSTR>} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<UInt16>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @returns {Integer} If the function succeeds, it returns the message ID of the search operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_searchw
     * @since windows6.0.6000
     */
    static ldap_searchW(ld, base, scope, filter, attrs, attrsonly) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_searchW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "CDecl uint")
        return result
    }

    /**
     * Searches the LDAP directory and returns a requested set of attributes for each matched entry. (ldap_searchA)
     * @remarks
     * The <b>ldap_search</b> function initiates an asynchronous search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the LDAP_OPT_SIZELIMIT, LDAP_OPT_TIMELIMIT, and LDAP_OPT_DEREF options that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>.
     * 
     * As an asynchronous function, <b>ldap_search</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous search operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_s">ldap_search_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext_s">ldap_search_ext_s</a> to implement support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_search</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld A session handle.
     * @param {Pointer<PSTR>} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @returns {Integer} If the function succeeds, it returns the message ID of the search operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_searcha
     * @since windows6.0.6000
     */
    static ldap_searchA(ld, base, scope, filter, attrs, attrsonly) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_searchA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_sW (Unicode) function (winldap.h) synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @remarks
     * The <b>ldap_search_s</b> function initiates a synchronous search.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_SIZELIMIT</b>, <b>LDAP_OPT_TIMELIMIT</b>, and <b>LDAP_OPT_DEREF</b> options that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>.
     * 
     * Upon completion of the search operation, <b>ldap_search_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a> to have the operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_search_s</b> are thread-safe.
     * 
     * The following code example shows how to free <i>pMsg</i> in the event that <b>ldap_search_s</b> fails.
     * 
     * 
     * ```cpp
     * // Initialize return value to NULL.
     * LDAPMessage *pMsg = NULL;
     * 
     * // Perform the search request.
     * dwErr = ldap_search_s (i_pldap,
     *         i_lpszBase,
     *         i_ulScope,
     *         i_lpszSearchFilter,
     *         lpszAttributes,
     *         0,
     *         &pMsg
     *         );
     * 
     * // Cleanup calling parameters.
     * if (lpszAttributes != NULL)
     *     delete [] lpszAttributes;
     * 
     * // Convert error code and cleanup pMsg, if necessary.
     * if (dwErr != LDAP_SUCCESS)
     * {
     *     DebugOutLDAPError(i_pldap, dwErr, _T("ldap_search_s"));
     *     hr = HRESULT_FROM_WIN32(dwErr);
     * 
     *     // Be aware that pMsg can contain valid data, even if the
     *     // call to ldap_search_s returned an error code.  
     *     // This can be caused by the server returning codes,
     *     // such as LDAP_RESULTS_TOO_LARGE or other codes,
     *     // that indicate that the search returned partial
     *     // results. The user code can handle these cases
     *     // if required, this example just frees pMsg on any 
     *     // error code.
     * 
     *     if (pMsg != NULL)
     *       ldap_msgfree(pMsg);
     * }
     * 
     * else
     * {
     *     // Process the search results.
     *     ...
     *     // Free the results when no longer required.
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * }
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_search_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PWSTR>} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PWSTR>} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<UInt16>} attrs A null-terminated array of null-terminated strings indicating the attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAPMessage>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free results returned with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> when they are no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails it returns an error code, however <b>ldap_search_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_sw
     * @since windows6.0.6000
     */
    static ldap_search_sW(ld, base, scope, filter, attrs, attrsonly, res) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_sW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_s function synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry. (ldap_search_sA)
     * @remarks
     * The <b>ldap_search_s</b> function initiates a synchronous search.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_SIZELIMIT</b>, <b>LDAP_OPT_TIMELIMIT</b>, and <b>LDAP_OPT_DEREF</b> options that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>.
     * 
     * Upon completion of the search operation, <b>ldap_search_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a> to have the operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_search_s</b> are thread-safe.
     * 
     * The following code example shows how to free <i>pMsg</i> in the event that <b>ldap_search_s</b> fails.
     * 
     * 
     * ```cpp
     * // Initialize return value to NULL.
     * LDAPMessage *pMsg = NULL;
     * 
     * // Perform the search request.
     * dwErr = ldap_search_s (i_pldap,
     *         i_lpszBase,
     *         i_ulScope,
     *         i_lpszSearchFilter,
     *         lpszAttributes,
     *         0,
     *         &pMsg
     *         );
     * 
     * // Cleanup calling parameters.
     * if (lpszAttributes != NULL)
     *     delete [] lpszAttributes;
     * 
     * // Convert error code and cleanup pMsg, if necessary.
     * if (dwErr != LDAP_SUCCESS)
     * {
     *     DebugOutLDAPError(i_pldap, dwErr, _T("ldap_search_s"));
     *     hr = HRESULT_FROM_WIN32(dwErr);
     * 
     *     // Be aware that pMsg can contain valid data, even if the
     *     // call to ldap_search_s returned an error code.  
     *     // This can be caused by the server returning codes,
     *     // such as LDAP_RESULTS_TOO_LARGE or other codes,
     *     // that indicate that the search returned partial
     *     // results. The user code can handle these cases
     *     // if required, this example just frees pMsg on any 
     *     // error code.
     * 
     *     if (pMsg != NULL)
     *       ldap_msgfree(pMsg);
     * }
     * 
     * else
     * {
     *     // Process the search results.
     *     ...
     *     // Free the results when no longer required.
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * }
     * ```
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PSTR>} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of null-terminated strings indicating the attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAPMessage>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free results returned with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> when they are no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails it returns an error code, however <b>ldap_search_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_sa
     * @since windows6.0.6000
     */
    static ldap_search_sA(ld, base, scope, filter, attrs, attrsonly, res) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_sA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_stW (Unicode) function (winldap.h) synchronously searches the LDAP directory and returns a requested set of attributes for each entry matched.
     * @remarks
     * The <b>ldap_search_st</b> function initiates a synchronous search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_SIZELIMIT</b> and <b>LDAP_OPT_DEREF</b> options that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. The <i>timeout</i> parameter in <b>ldap_search_st</b> overrides the <b>LDAP_OPT_TIMELIMIT</b>.
     * 
     * Upon completion of the search operation, <b>ldap_search_st</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> to have the operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_search_st</b> are thread-safe.
     * 
     * The following code example shows how to free <i>pMsg</i> if <b>ldap_search_st</b> fails.
     * 
     * 
     * ```cpp
     * // Initialize return value to NULL.
     * LDAPMessage *pMsg = NULL;
     * 
     * // Perform the search request.
     * dwErr = ldap_search_st (i_pldap,
     *         i_lpszBase,
     *         i_ulScope,
     *         i_lpszSearchFilter,
     *         lpszAttributes,
     *         0,
     *         lpsTimeout,
     *         &pMsg
     *         );
     * 
     * // Cleanup calling parameters.
     * if (lpszAttributes != NULL)
     *     delete [] lpszAttributes;
     * 
     * // Convert error code and cleanup pMsg if necessary.
     * if (dwErr != LDAP_SUCCESS)
     * {
     *     DebugOutLDAPError(i_pldap, dwErr, _T("ldap_search_st"));
     *     hr = HRESULT_FROM_WIN32(dwErr);
     * 
     *     // Be aware that pMsg can contain valid data, even if the
     *     // call to ldap_search_st returned an error code.  
     *     // This can be caused by the server returning codes,
     *     // such as LDAP_RESULTS_TOO_LARGE or other codes,
     *     // that indicate that the search returned partial
     *     // results. The user code can handle these cases
     *     // if required, this example just frees pMsg on any 
     *     // error code.
     * 
     *     if (pMsg != NULL)
     *       ldap_msgfree(pMsg);
     * }
     * 
     * else
     * {
     *     // Process the search results.
     *     ...
     *     // Free the results when complete.
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * }
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_search_st as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PWSTR>} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PWSTR>} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<UInt16>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that must be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAP_TIMEVAL>} timeout The local search time-out value, in seconds.
     * @param {Pointer<LDAPMessage>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Any results returned must be freed with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> when  no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_st</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_stw
     * @since windows6.0.6000
     */
    static ldap_search_stW(ld, base, scope, filter, attrs, attrsonly, timeout, res) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_stW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", timeout, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_st function synchronously searches the LDAP directory and returns a requested set of attributes for each entry matched. An additional parameter specifies a local time-out for the search. (ldap_search_stA)
     * @remarks
     * The <b>ldap_search_st</b> function initiates a synchronous search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_SIZELIMIT</b> and <b>LDAP_OPT_DEREF</b> options that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. The <i>timeout</i> parameter in <b>ldap_search_st</b> overrides the <b>LDAP_OPT_TIMELIMIT</b>.
     * 
     * Upon completion of the search operation, <b>ldap_search_st</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> to have the operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_search_st</b> are thread-safe.
     * 
     * The following code example shows how to free <i>pMsg</i> if <b>ldap_search_st</b> fails.
     * 
     * 
     * ```cpp
     * // Initialize return value to NULL.
     * LDAPMessage *pMsg = NULL;
     * 
     * // Perform the search request.
     * dwErr = ldap_search_st (i_pldap,
     *         i_lpszBase,
     *         i_ulScope,
     *         i_lpszSearchFilter,
     *         lpszAttributes,
     *         0,
     *         lpsTimeout,
     *         &pMsg
     *         );
     * 
     * // Cleanup calling parameters.
     * if (lpszAttributes != NULL)
     *     delete [] lpszAttributes;
     * 
     * // Convert error code and cleanup pMsg if necessary.
     * if (dwErr != LDAP_SUCCESS)
     * {
     *     DebugOutLDAPError(i_pldap, dwErr, _T("ldap_search_st"));
     *     hr = HRESULT_FROM_WIN32(dwErr);
     * 
     *     // Be aware that pMsg can contain valid data, even if the
     *     // call to ldap_search_st returned an error code.  
     *     // This can be caused by the server returning codes,
     *     // such as LDAP_RESULTS_TOO_LARGE or other codes,
     *     // that indicate that the search returned partial
     *     // results. The user code can handle these cases
     *     // if required, this example just frees pMsg on any 
     *     // error code.
     * 
     *     if (pMsg != NULL)
     *       ldap_msgfree(pMsg);
     * }
     * 
     * else
     * {
     *     // Process the search results.
     *     ...
     *     // Free the results when complete.
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * }
     * ```
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PSTR>} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that must be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAP_TIMEVAL>} timeout The local search time-out value, in seconds.
     * @param {Pointer<LDAPMessage>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Any results returned must be freed with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> when  no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_st</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_sta
     * @since windows6.0.6000
     */
    static ldap_search_stA(ld, base, scope, filter, attrs, attrsonly, timeout, res) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_stA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", timeout, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_extW (Unicode) function (winldap.h) searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @remarks
     * The <b>ldap_search_ext</b> function initiates an asynchronous search operation. The parameters and effects of <b>ldap_search_ext</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a>. The extended function includes additional parameters to support client and server controls and thread safety, and to specify size and time limits for each search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_DEREF</b> option that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. Two other session options, <b>LDAP_OPT_SIZELIMIT</b> and <b>LDAP_OPT_TIMELIMIT</b>, are ignored in favor of the <i>SizeLimit</i> and <i>TimeLimit</i> parameters in this function.
     * 
     * If the operation succeeds, <b>ldap_search_ext</b> passes the message ID to the caller as a parameter when the operation returns successfully. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation.
     * 
     * An LDAP client application that must control the rate at which results are returned may specify the search request to provide a paged results control with size set to the desired page size and cookie set to the zero-length string. The page size specified may be greater than zero and less than the <i>SizeLimit</i> value specified in the search request.
     * 
     * If the page size is greater than or equal to the <i>SizeLimit</i> value option described in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>, the server should ignore the control because the request can be satisfied in a single page. If the server does not support this control, the server must return an error of unsupported Critical Extension if the client requested it as critical, otherwise the server should ignore the control. The remainder of this section assumes the server does not ignore the client's paged results control.
     * 
     * The client sends the server a search request with the simple paged results control, along with an empty previous enumeration key, also known as a "cookie," and the initial page size. The server then returns the number of entries specified by the page size and also returns a cookie issued on the next client request to get the next page of results. The client then issues a search, with the cookie included, optionally resetting the page size. The server then responds by returning the results, up to the specified number of entries. To instruct the function to return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext_s">ldap_search_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_search_ext</b> are thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_search_ext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PWSTR>} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<UInt16>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. To retrieve all available attributes, pass <b>NULL</b>.
     * @param {Integer} attrsonly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<LDAPControlW>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientControls A list of client controls.
     * @param {Integer} TimeLimit Specifies both the local search time-out value in seconds and the operation time limit sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<UInt32>} MessageNumber The request  message ID.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_extw
     * @since windows6.0.6000
     */
    static ldap_search_extW(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, TimeLimit, SizeLimit, MessageNumber) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_extW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", ServerControls, "ptr", ClientControls, "uint", TimeLimit, "uint", SizeLimit, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Searches the LDAP directory and returns a requested set of attributes for each matched entry. (ldap_search_extA)
     * @remarks
     * The <b>ldap_search_ext</b> function initiates an asynchronous search operation. The parameters and effects of <b>ldap_search_ext</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a>. The extended function includes additional parameters to support client and server controls and thread safety, and to specify size and time limits for each search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_DEREF</b> option that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. Two other session options, <b>LDAP_OPT_SIZELIMIT</b> and <b>LDAP_OPT_TIMELIMIT</b>, are ignored in favor of the <i>SizeLimit</i> and <i>TimeLimit</i> parameters in this function.
     * 
     * If the operation succeeds, <b>ldap_search_ext</b> passes the message ID to the caller as a parameter when the operation returns successfully. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation.
     * 
     * An LDAP client application that must control the rate at which results are returned may specify the search request to provide a paged results control with size set to the desired page size and cookie set to the zero-length string. The page size specified may be greater than zero and less than the <i>SizeLimit</i> value specified in the search request.
     * 
     * If the page size is greater than or equal to the <i>SizeLimit</i> value option described in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>, the server should ignore the control because the request can be satisfied in a single page. If the server does not support this control, the server must return an error of unsupported Critical Extension if the client requested it as critical, otherwise the server should ignore the control. The remainder of this section assumes the server does not ignore the client's paged results control.
     * 
     * The client sends the server a search request with the simple paged results control, along with an empty previous enumeration key, also known as a "cookie," and the initial page size. The server then returns the number of entries specified by the page size and also returns a cookie issued on the next client request to get the next page of results. The client then issues a search, with the cookie included, optionally resetting the page size. The server then responds by returning the results, up to the specified number of entries. To instruct the function to return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext_s">ldap_search_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_search_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. To retrieve all available attributes, pass <b>NULL</b>.
     * @param {Integer} attrsonly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @param {Integer} TimeLimit Specifies both the local search time-out value in seconds and the operation time limit sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<UInt32>} MessageNumber The request  message ID.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_exta
     * @since windows6.0.6000
     */
    static ldap_search_extA(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, TimeLimit, SizeLimit, MessageNumber) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_extA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", ServerControls, "ptr", ClientControls, "uint", TimeLimit, "uint", SizeLimit, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_ext_sW (Unicode) function (winldap.h) synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @remarks
     * The 
     * <b>ldap_search_ext_s</b> function initiates a synchronous search operation. The parameters and effects of <b>ldap_search_ext_s</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_s">ldap_search_s</a>. The extended routine includes additional parameters to support client and server controls, and to specify size and time limits for each search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_DEREF</b> option that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. Two other search options, <b>LDAP_OPT_SIZELIMIT</b> and <b>LDAP_OPT_TIMELIMIT</b>, are ignored in favor of the <i>SizeLimit</i> and <i>TimeLimit</i> option parameters in this function.
     * 
     * Upon completion of the search operation, <b>ldap_search_ext_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> to have the operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_search_ext_s</b> are thread-safe.
     * 
     * The following code example shows how to free <i>pMsg</i> in the event that <b>ldap_search_ext_s</b> fails.
     * 
     * 
     * ```cpp
     * // Initialize return value to NULL.
     * LDAPMessage *pMsg = NULL;
     * 
     * // Perform the search request.
     * dwErr = ldap_search_ext_s (i_pldap,
     *         i_lpszBase,
     *         i_ulScope,
     *         i_lpszSearchFilter,
     *         lpszAttributes,
     *         0,
     *         pServerControls,
     *         pClientControls,
     *         lpsTimeout,
     *         0,
     *         &pMsg
     *         );
     * 
     * // Cleanup calling parameters.
     * if (lpszAttributes != NULL)
     *     delete [] lpszAttributes;
     * 
     * // Convert error code and cleanup pMsg if necessary.
     * if (dwErr != LDAP_SUCCESS)
     * {
     *     DebugOutLDAPError(i_pldap, dwErr, _T("ldap_search_ext_s"));
     *     hr = HRESULT_FROM_WIN32(dwErr);
     * 
     *     // Be aware that pMsg can contain valid data, even if
     *     // the call to ldap_search_ext_s returned an error code.
     *     // This can be caused by the server returning codes
     *     // such as LDAP_RESULTS_TOO_LARGE or other codes
     *     // that indicate that the search returned partial
     *     // results. The user code can handle these cases
     *     // if required, this example frees pMsg on any 
     *     // error code.
     * 
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * }
     * 
     * else
     * {
     *     // Process the search results.
     *     ...
     *     // Free the results when complete.
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * 
     * }
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_search_ext_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PWSTR>} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PWSTR>} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<UInt16>} attrs A null-terminated array of pointers to null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAPControlW>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientControls A list of client controls.
     * @param {Pointer<LDAP_TIMEVAL>} timeout Specifies both the local search time-out value, in seconds, and the operation time limit that is sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<LDAPMessage>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free returned results with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> when no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_ext_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code will allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_ext_sw
     * @since windows6.0.6000
     */
    static ldap_search_ext_sW(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, timeout, SizeLimit, res) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_ext_sW", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", ServerControls, "ptr", ClientControls, "ptr", timeout, "uint", SizeLimit, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * Synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry. (ldap_search_ext_sA)
     * @remarks
     * The 
     * <b>ldap_search_ext_s</b> function initiates a synchronous search operation. The parameters and effects of <b>ldap_search_ext_s</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_s">ldap_search_s</a>. The extended routine includes additional parameters to support client and server controls, and to specify size and time limits for each search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_DEREF</b> option that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. Two other search options, <b>LDAP_OPT_SIZELIMIT</b> and <b>LDAP_OPT_TIMELIMIT</b>, are ignored in favor of the <i>SizeLimit</i> and <i>TimeLimit</i> option parameters in this function.
     * 
     * Upon completion of the search operation, <b>ldap_search_ext_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> to have the operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_search_ext_s</b> are thread-safe.
     * 
     * The following code example shows how to free <i>pMsg</i> in the event that <b>ldap_search_ext_s</b> fails.
     * 
     * 
     * ```cpp
     * // Initialize return value to NULL.
     * LDAPMessage *pMsg = NULL;
     * 
     * // Perform the search request.
     * dwErr = ldap_search_ext_s (i_pldap,
     *         i_lpszBase,
     *         i_ulScope,
     *         i_lpszSearchFilter,
     *         lpszAttributes,
     *         0,
     *         pServerControls,
     *         pClientControls,
     *         lpsTimeout,
     *         0,
     *         &pMsg
     *         );
     * 
     * // Cleanup calling parameters.
     * if (lpszAttributes != NULL)
     *     delete [] lpszAttributes;
     * 
     * // Convert error code and cleanup pMsg if necessary.
     * if (dwErr != LDAP_SUCCESS)
     * {
     *     DebugOutLDAPError(i_pldap, dwErr, _T("ldap_search_ext_s"));
     *     hr = HRESULT_FROM_WIN32(dwErr);
     * 
     *     // Be aware that pMsg can contain valid data, even if
     *     // the call to ldap_search_ext_s returned an error code.
     *     // This can be caused by the server returning codes
     *     // such as LDAP_RESULTS_TOO_LARGE or other codes
     *     // that indicate that the search returned partial
     *     // results. The user code can handle these cases
     *     // if required, this example frees pMsg on any 
     *     // error code.
     * 
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * }
     * 
     * else
     * {
     *     // Process the search results.
     *     ...
     *     // Free the results when complete.
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * 
     * }
     * ```
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PSTR>} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of pointers to null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @param {Pointer<LDAP_TIMEVAL>} timeout Specifies both the local search time-out value, in seconds, and the operation time limit that is sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<LDAPMessage>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free returned results with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> when no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_ext_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code will allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_ext_sa
     * @since windows6.0.6000
     */
    static ldap_search_ext_sA(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, timeout, SizeLimit, res) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_ext_sA", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", ServerControls, "ptr", ClientControls, "ptr", timeout, "uint", SizeLimit, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search function (winldap.h) searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @remarks
     * The <b>ldap_search</b> function initiates an asynchronous search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the LDAP_OPT_SIZELIMIT, LDAP_OPT_TIMELIMIT, and LDAP_OPT_DEREF options that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>.
     * 
     * As an asynchronous function, <b>ldap_search</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous search operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_s">ldap_search_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext_s">ldap_search_ext_s</a> to implement support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_search</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld A session handle.
     * @param {Pointer<PSTR>} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @returns {Integer} If the function succeeds, it returns the message ID of the search operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search
     * @since windows6.0.6000
     */
    static ldap_search(ld, base, scope, filter, attrs, attrsonly) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_s function (winldap.h) synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @remarks
     * The <b>ldap_search_s</b> function initiates a synchronous search.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_SIZELIMIT</b>, <b>LDAP_OPT_TIMELIMIT</b>, and <b>LDAP_OPT_DEREF</b> options that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>.
     * 
     * Upon completion of the search operation, <b>ldap_search_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a> to have the operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_search_s</b> are thread-safe.
     * 
     * The following code example shows how to free <i>pMsg</i> in the event that <b>ldap_search_s</b> fails.
     * 
     * 
     * ```cpp
     * // Initialize return value to NULL.
     * LDAPMessage *pMsg = NULL;
     * 
     * // Perform the search request.
     * dwErr = ldap_search_s (i_pldap,
     *         i_lpszBase,
     *         i_ulScope,
     *         i_lpszSearchFilter,
     *         lpszAttributes,
     *         0,
     *         &pMsg
     *         );
     * 
     * // Cleanup calling parameters.
     * if (lpszAttributes != NULL)
     *     delete [] lpszAttributes;
     * 
     * // Convert error code and cleanup pMsg, if necessary.
     * if (dwErr != LDAP_SUCCESS)
     * {
     *     DebugOutLDAPError(i_pldap, dwErr, _T("ldap_search_s"));
     *     hr = HRESULT_FROM_WIN32(dwErr);
     * 
     *     // Be aware that pMsg can contain valid data, even if the
     *     // call to ldap_search_s returned an error code.  
     *     // This can be caused by the server returning codes,
     *     // such as LDAP_RESULTS_TOO_LARGE or other codes,
     *     // that indicate that the search returned partial
     *     // results. The user code can handle these cases
     *     // if required, this example just frees pMsg on any 
     *     // error code.
     * 
     *     if (pMsg != NULL)
     *       ldap_msgfree(pMsg);
     * }
     * 
     * else
     * {
     *     // Process the search results.
     *     ...
     *     // Free the results when no longer required.
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * }
     * ```
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PSTR>} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of null-terminated strings indicating the attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAPMessage>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free results returned with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> when they are no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails it returns an error code, however <b>ldap_search_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_s
     * @since windows6.0.6000
     */
    static ldap_search_s(ld, base, scope, filter, attrs, attrsonly, res) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_s", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_st function (winldap.h) synchronously searches the LDAP directory and returns a requested set of attributes for each entry matched.
     * @remarks
     * The <b>ldap_search_st</b> function initiates a synchronous search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_SIZELIMIT</b> and <b>LDAP_OPT_DEREF</b> options that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. The <i>timeout</i> parameter in <b>ldap_search_st</b> overrides the <b>LDAP_OPT_TIMELIMIT</b>.
     * 
     * Upon completion of the search operation, <b>ldap_search_st</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> to have the operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_search_st</b> are thread-safe.
     * 
     * The following code example shows how to free <i>pMsg</i> if <b>ldap_search_st</b> fails.
     * 
     * 
     * ```cpp
     * // Initialize return value to NULL.
     * LDAPMessage *pMsg = NULL;
     * 
     * // Perform the search request.
     * dwErr = ldap_search_st (i_pldap,
     *         i_lpszBase,
     *         i_ulScope,
     *         i_lpszSearchFilter,
     *         lpszAttributes,
     *         0,
     *         lpsTimeout,
     *         &pMsg
     *         );
     * 
     * // Cleanup calling parameters.
     * if (lpszAttributes != NULL)
     *     delete [] lpszAttributes;
     * 
     * // Convert error code and cleanup pMsg if necessary.
     * if (dwErr != LDAP_SUCCESS)
     * {
     *     DebugOutLDAPError(i_pldap, dwErr, _T("ldap_search_st"));
     *     hr = HRESULT_FROM_WIN32(dwErr);
     * 
     *     // Be aware that pMsg can contain valid data, even if the
     *     // call to ldap_search_st returned an error code.  
     *     // This can be caused by the server returning codes,
     *     // such as LDAP_RESULTS_TOO_LARGE or other codes,
     *     // that indicate that the search returned partial
     *     // results. The user code can handle these cases
     *     // if required, this example just frees pMsg on any 
     *     // error code.
     * 
     *     if (pMsg != NULL)
     *       ldap_msgfree(pMsg);
     * }
     * 
     * else
     * {
     *     // Process the search results.
     *     ...
     *     // Free the results when complete.
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * }
     * ```
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PSTR>} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that must be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAP_TIMEVAL>} timeout The local search time-out value, in seconds.
     * @param {Pointer<LDAPMessage>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Any results returned must be freed with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> when  no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_st</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_st
     * @since windows6.0.6000
     */
    static ldap_search_st(ld, base, scope, filter, attrs, attrsonly, timeout, res) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_st", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", timeout, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_ext function (winldap.h) searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @remarks
     * The <b>ldap_search_ext</b> function initiates an asynchronous search operation. The parameters and effects of <b>ldap_search_ext</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a>. The extended function includes additional parameters to support client and server controls and thread safety, and to specify size and time limits for each search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_DEREF</b> option that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. Two other session options, <b>LDAP_OPT_SIZELIMIT</b> and <b>LDAP_OPT_TIMELIMIT</b>, are ignored in favor of the <i>SizeLimit</i> and <i>TimeLimit</i> parameters in this function.
     * 
     * If the operation succeeds, <b>ldap_search_ext</b> passes the message ID to the caller as a parameter when the operation returns successfully. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation.
     * 
     * An LDAP client application that must control the rate at which results are returned may specify the search request to provide a paged results control with size set to the desired page size and cookie set to the zero-length string. The page size specified may be greater than zero and less than the <i>SizeLimit</i> value specified in the search request.
     * 
     * If the page size is greater than or equal to the <i>SizeLimit</i> value option described in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>, the server should ignore the control because the request can be satisfied in a single page. If the server does not support this control, the server must return an error of unsupported Critical Extension if the client requested it as critical, otherwise the server should ignore the control. The remainder of this section assumes the server does not ignore the client's paged results control.
     * 
     * The client sends the server a search request with the simple paged results control, along with an empty previous enumeration key, also known as a "cookie," and the initial page size. The server then returns the number of entries specified by the page size and also returns a cookie issued on the next client request to get the next page of results. The client then issues a search, with the cookie included, optionally resetting the page size. The server then responds by returning the results, up to the specified number of entries. To instruct the function to return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext_s">ldap_search_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_search_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} base A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of null-terminated strings that indicate which attributes to return for each matching entry. To retrieve all available attributes, pass <b>NULL</b>.
     * @param {Integer} attrsonly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @param {Integer} TimeLimit Specifies both the local search time-out value in seconds and the operation time limit sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<UInt32>} MessageNumber The request  message ID.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_ext
     * @since windows6.0.6000
     */
    static ldap_search_ext(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, TimeLimit, SizeLimit, MessageNumber) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_ext", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", ServerControls, "ptr", ClientControls, "uint", TimeLimit, "uint", SizeLimit, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_ext_s function (winldap.h) synchronously searches the LDAP directory and returns a requested set of attributes for each matched entry.
     * @remarks
     * The 
     * <b>ldap_search_ext_s</b> function initiates a synchronous search operation. The parameters and effects of <b>ldap_search_ext_s</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_s">ldap_search_s</a>. The extended routine includes additional parameters to support client and server controls, and to specify size and time limits for each search operation.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> function with the <i>ld</i> session handle to set the <b>LDAP_OPT_DEREF</b> option that determine how the search is performed. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>. Two other search options, <b>LDAP_OPT_SIZELIMIT</b> and <b>LDAP_OPT_TIMELIMIT</b>, are ignored in favor of the <i>SizeLimit</i> and <i>TimeLimit</i> option parameters in this function.
     * 
     * Upon completion of the search operation, <b>ldap_search_ext_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> to have the operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_search_ext_s</b> are thread-safe.
     * 
     * The following code example shows how to free <i>pMsg</i> in the event that <b>ldap_search_ext_s</b> fails.
     * 
     * 
     * ```cpp
     * // Initialize return value to NULL.
     * LDAPMessage *pMsg = NULL;
     * 
     * // Perform the search request.
     * dwErr = ldap_search_ext_s (i_pldap,
     *         i_lpszBase,
     *         i_ulScope,
     *         i_lpszSearchFilter,
     *         lpszAttributes,
     *         0,
     *         pServerControls,
     *         pClientControls,
     *         lpsTimeout,
     *         0,
     *         &pMsg
     *         );
     * 
     * // Cleanup calling parameters.
     * if (lpszAttributes != NULL)
     *     delete [] lpszAttributes;
     * 
     * // Convert error code and cleanup pMsg if necessary.
     * if (dwErr != LDAP_SUCCESS)
     * {
     *     DebugOutLDAPError(i_pldap, dwErr, _T("ldap_search_ext_s"));
     *     hr = HRESULT_FROM_WIN32(dwErr);
     * 
     *     // Be aware that pMsg can contain valid data, even if
     *     // the call to ldap_search_ext_s returned an error code.
     *     // This can be caused by the server returning codes
     *     // such as LDAP_RESULTS_TOO_LARGE or other codes
     *     // that indicate that the search returned partial
     *     // results. The user code can handle these cases
     *     // if required, this example frees pMsg on any 
     *     // error code.
     * 
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * }
     * 
     * else
     * {
     *     // Process the search results.
     *     ...
     *     // Free the results when complete.
     *     if (pMsg != NULL) ldap_msgfree(pMsg);
     * 
     * }
     * ```
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PSTR>} base Pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} scope 
     * @param {Pointer<PSTR>} filter Pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} attrs A null-terminated array of pointers to null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} attrsonly Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are required.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @param {Pointer<LDAP_TIMEVAL>} timeout Specifies both the local search time-out value, in seconds, and the operation time limit that is sent to the server within the search request.
     * @param {Integer} SizeLimit A limit on the number of entries to return from the search. A value of zero indicates no limit.
     * @param {Pointer<LDAPMessage>} res Contains the results of the search upon completion of the call. Can also contain partial results or extended data when the function call fails with an error code. Free returned results with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> when no longer required by the application.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code, however <b>ldap_search_ext_s</b> can fail and can still allocate <i>pMsg</i>. For example, both <b>LDAP_PARTIAL_RESULTS</b> and <b>LDAP_REFERRAL</b> error code will allocate <i>pMsg</i>. For more information, see the following code example. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_ext_s
     * @since windows6.0.6000
     */
    static ldap_search_ext_s(ld, base, scope, filter, attrs, attrsonly, ServerControls, ClientControls, timeout, SizeLimit, res) {
        base := base is String? StrPtr(base) : base
        filter := filter is String? StrPtr(filter) : filter

        result := DllCall("WLDAP32.dll\ldap_search_ext_s", "ptr", ld, "ptr", base, "uint", scope, "ptr", filter, "ptr", attrs, "uint", attrsonly, "ptr", ServerControls, "ptr", ClientControls, "ptr", timeout, "uint", SizeLimit, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_check_filter function is used to verify filter syntax. (Unicode)
     * @remarks
     * Use <b>ldap_check_filter</b> to verify the syntax of a search filter before initiating a search. This syntax check does not perform a full verification of the search filter syntax against RFC 2254 rules. Rather, it verifies that the filter meets the minimum syntactic requirements for encoding required by the wldap32 search-filter-encoding routines. As a result, a search filter can pass an <b>ldap_check_filter</b> operation, and can be encoded by wldap32, but the server may still detect a RFC 2254 compliance violation and reject the search filter.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_check_filter as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} SearchFilter A pointer to a wide, null-terminated string that contains the name of the filter to check.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_check_filterw
     * @since windows6.0.6000
     */
    static ldap_check_filterW(ld, SearchFilter) {
        SearchFilter := SearchFilter is String? StrPtr(SearchFilter) : SearchFilter

        result := DllCall("WLDAP32.dll\ldap_check_filterW", "ptr", ld, "ptr", SearchFilter, "CDecl uint")
        return result
    }

    /**
     * The ldap_check_filter function is used to verify filter syntax. (ANSI)
     * @remarks
     * Use <b>ldap_check_filter</b> to verify the syntax of a search filter before initiating a search. This syntax check does not perform a full verification of the search filter syntax against RFC 2254 rules. Rather, it verifies that the filter meets the minimum syntactic requirements for encoding required by the wldap32 search-filter-encoding routines. As a result, a search filter can pass an <b>ldap_check_filter</b> operation, and can be encoded by wldap32, but the server may still detect a RFC 2254 compliance violation and reject the search filter.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_check_filter as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} SearchFilter A pointer to a wide, null-terminated string that contains the name of the filter to check.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_check_filtera
     * @since windows6.0.6000
     */
    static ldap_check_filterA(ld, SearchFilter) {
        SearchFilter := SearchFilter is String? StrPtr(SearchFilter) : SearchFilter

        result := DllCall("WLDAP32.dll\ldap_check_filterA", "ptr", ld, "ptr", SearchFilter, "CDecl uint")
        return result
    }

    /**
     * The ldap_modifyW (Unicode) function (winldap.h) initiates an asynchronous operation to modify an existing entry.
     * @remarks
     * The <b>ldap_modify</b> function initiates an asynchronous operation to modify an existing entry. If values are being added to or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, and no values remain, the function removes the attribute. All modifications are performed in the order in which they are listed.
     * 
     * As an asynchronous function, <b>ldap_modify</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * If you prefer to have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_s">ldap_modify_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_ext">ldap_modify_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_ext_s">ldap_modify_ext_s</a> if you need support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_modify</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_modify as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModW>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modifyw
     * @since windows6.0.6000
     */
    static ldap_modifyW(ld, dn, mods) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modifyW", "ptr", ld, "ptr", dn, "ptr", mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify function changes an existing entry. (ldap_modifyA)
     * @remarks
     * The <b>ldap_modify</b> function initiates an asynchronous operation to modify an existing entry. If values are being added to or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, and no values remain, the function removes the attribute. All modifications are performed in the order in which they are listed.
     * 
     * As an asynchronous function, <b>ldap_modify</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * If you prefer to have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_s">ldap_modify_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_ext">ldap_modify_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_ext_s">ldap_modify_ext_s</a> if you need support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_modify</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModA>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modifya
     * @since windows6.0.6000
     */
    static ldap_modifyA(ld, dn, mods) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modifyA", "ptr", ld, "ptr", dn, "ptr", mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_sW (Unicode) function (winldap.h) initiates an asynchronous operation to modify an existing entry.
     * @remarks
     * The <b>ldap_modify_s</b> function initiates a synchronous operation to modify an existing entry. If values are being added to or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, the function removes the attribute if no values remain. All modifications are performed in the order in which they are listed.
     * 
     * Multithreading: Calls to <b>ldap_modify_s</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_modify_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModW>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify_sw
     * @since windows6.0.6000
     */
    static ldap_modify_sW(ld, dn, mods) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify_sW", "ptr", ld, "ptr", dn, "ptr", mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_s function changes an existing entry. (ldap_modify_sA)
     * @remarks
     * The <b>ldap_modify_s</b> function initiates a synchronous operation to modify an existing entry. If values are being added to or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, the function removes the attribute if no values remain. All modifications are performed in the order in which they are listed.
     * 
     * Multithreading: Calls to <b>ldap_modify_s</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModA>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify_sa
     * @since windows6.0.6000
     */
    static ldap_modify_sA(ld, dn, mods) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify_sA", "ptr", ld, "ptr", dn, "ptr", mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_extW (Unicode) function (winldap.h) initiates an asynchronous operation to modify an existing entry.
     * @remarks
     * The <b>ldap_modify_ext</b> function initiates an asynchronous operation to modify an existing entry. If values are being added or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, and no values remain, the function removes the attribute. All modifications are performed in the order in which they are listed.
     * 
     * The parameters and effects of <b>ldap_modify_ext</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify">ldap_modify</a>. The extended routine includes additional parameters to support client and server controls, and thread safety.
     * 
     * If successful, <b>ldap_modify_ext</b> passes back the message ID for the operation in the <i>MessageNumber</i> parameter. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to obtain the result of the operation. If you prefer to have the function return the result directly, use the synchronous extended function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_ext_s">ldap_modify_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_modify_ext</b> are thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_modify_ext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModW>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<LDAPControlW>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientControls A list of client controls
     * @param {Pointer<UInt32>} MessageNumber This result parameter is set to the message ID of the request if the call succeeds.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify_extw
     * @since windows6.0.6000
     */
    static ldap_modify_extW(ld, dn, mods, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify_extW", "ptr", ld, "ptr", dn, "ptr", mods, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext function changes an existing entry. (ldap_modify_extA)
     * @remarks
     * The <b>ldap_modify_ext</b> function initiates an asynchronous operation to modify an existing entry. If values are being added or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, and no values remain, the function removes the attribute. All modifications are performed in the order in which they are listed.
     * 
     * The parameters and effects of <b>ldap_modify_ext</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify">ldap_modify</a>. The extended routine includes additional parameters to support client and server controls, and thread safety.
     * 
     * If successful, <b>ldap_modify_ext</b> passes back the message ID for the operation in the <i>MessageNumber</i> parameter. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to obtain the result of the operation. If you prefer to have the function return the result directly, use the synchronous extended function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_ext_s">ldap_modify_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_modify_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModA>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls
     * @param {Pointer<UInt32>} MessageNumber This result parameter is set to the message ID of the request if the call succeeds.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify_exta
     * @since windows6.0.6000
     */
    static ldap_modify_extA(ld, dn, mods, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify_extA", "ptr", ld, "ptr", dn, "ptr", mods, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext_sW (Unicode) function (winldap.h) initiates an asynchronous operation to modify an existing entry.
     * @remarks
     * The <b>ldap_modify_ext_s</b> function initiates a synchronous operation to modify an existing entry. If values are being added or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, and no values remain, the function removes the attribute. All modifications are performed in the order in which they are listed.
     * 
     * The parameters and effects of <b>ldap_modify_ext_s</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_s">ldap_modify_s</a>. The extended routine includes additional parameters to support client and server controls.
     * 
     * Multithreading: Calls to <b>ldap_modify_ext_s</b> are thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_modify_ext_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModW>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<LDAPControlW>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify_ext_sw
     * @since windows6.0.6000
     */
    static ldap_modify_ext_sW(ld, dn, mods, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify_ext_sW", "ptr", ld, "ptr", dn, "ptr", mods, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext_s function changes an existing entry. (ldap_modify_ext_sA)
     * @remarks
     * The <b>ldap_modify_ext_s</b> function initiates a synchronous operation to modify an existing entry. If values are being added or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, and no values remain, the function removes the attribute. All modifications are performed in the order in which they are listed.
     * 
     * The parameters and effects of <b>ldap_modify_ext_s</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_s">ldap_modify_s</a>. The extended routine includes additional parameters to support client and server controls.
     * 
     * Multithreading: Calls to <b>ldap_modify_ext_s</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModA>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify_ext_sa
     * @since windows6.0.6000
     */
    static ldap_modify_ext_sA(ld, dn, mods, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify_ext_sA", "ptr", ld, "ptr", dn, "ptr", mods, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify function (winldap.h) initiates an asynchronous operation to modify an existing entry.
     * @remarks
     * The <b>ldap_modify</b> function initiates an asynchronous operation to modify an existing entry. If values are being added to or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, and no values remain, the function removes the attribute. All modifications are performed in the order in which they are listed.
     * 
     * As an asynchronous function, <b>ldap_modify</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * If you prefer to have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_s">ldap_modify_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_ext">ldap_modify_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_ext_s">ldap_modify_ext_s</a> if you need support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_modify</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModA>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify
     * @since windows6.0.6000
     */
    static ldap_modify(ld, dn, mods) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify", "ptr", ld, "ptr", dn, "ptr", mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_s function (winldap.h) initiates an asynchronous operation to modify an existing entry.
     * @remarks
     * The <b>ldap_modify_s</b> function initiates a synchronous operation to modify an existing entry. If values are being added to or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, the function removes the attribute if no values remain. All modifications are performed in the order in which they are listed.
     * 
     * Multithreading: Calls to <b>ldap_modify_s</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModA>} mods A null-terminated array of modifications to make to the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify_s
     * @since windows6.0.6000
     */
    static ldap_modify_s(ld, dn, mods) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify_s", "ptr", ld, "ptr", dn, "ptr", mods, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext function changes an existing entry. (ldap_modify_extW)
     * @remarks
     * The <b>ldap_modify_ext</b> function initiates an asynchronous operation to modify an existing entry. If values are being added or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, and no values remain, the function removes the attribute. All modifications are performed in the order in which they are listed.
     * 
     * The parameters and effects of <b>ldap_modify_ext</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify">ldap_modify</a>. The extended routine includes additional parameters to support client and server controls, and thread safety.
     * 
     * If successful, <b>ldap_modify_ext</b> passes back the message ID for the operation in the <i>MessageNumber</i> parameter. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to obtain the result of the operation. If you prefer to have the function return the result directly, use the synchronous extended function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_ext_s">ldap_modify_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_modify_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModA>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls
     * @param {Pointer<UInt32>} MessageNumber This result parameter is set to the message ID of the request if the call succeeds.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify_ext
     * @since windows6.0.6000
     */
    static ldap_modify_ext(ld, dn, mods, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify_ext", "ptr", ld, "ptr", dn, "ptr", mods, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_modify_ext_s function (winldap.h) initiates an asynchronous operation to modify an existing entry.
     * @remarks
     * The <b>ldap_modify_ext_s</b> function initiates a synchronous operation to modify an existing entry. If values are being added or replaced in the entry, the function creates the attribute, if necessary. If values are being deleted, and no values remain, the function removes the attribute. All modifications are performed in the order in which they are listed.
     * 
     * The parameters and effects of <b>ldap_modify_ext_s</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify_s">ldap_modify_s</a>. The extended routine includes additional parameters to support client and server controls.
     * 
     * Multithreading: Calls to <b>ldap_modify_ext_s</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the name of the entry to modify.
     * @param {Pointer<LDAPModA>} mods A null-terminated array of modifications to make to the entry.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modify_ext_s
     * @since windows6.0.6000
     */
    static ldap_modify_ext_s(ld, dn, mods, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_modify_ext_s", "ptr", ld, "ptr", dn, "ptr", mods, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2W (Unicode) function (winldap.h) changes the relative distinguished name of an LDAP entry.
     * @remarks
     * Use the <b>ldap_modrdn2</b> function, or its synchronous equivalent, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2_s">ldap_modrdn2_s</a>, to change the name of an LDAP entry.
     * 
     * As an asynchronous function, <b>ldap_modrdn2</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous add operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * Be aware  that the various <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a> functions enable you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation, which enables more general name-change access. This functionality is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are recommended, instead of the <b>ldap_modrdn2</b> function, to change an entry name.
     * 
     * Multithreading: Calls to <b>ldap_modrdn2</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_modrdn2 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PWSTR>} DistinguishedName A null-terminated string that contains the distinguished name to change.
     * @param {Pointer<PWSTR>} NewDistinguishedName A null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn2w
     * @since windows6.0.6000
     */
    static ldap_modrdn2W(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2W", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2 function changes the relative distinguished name of an LDAP entry. (ldap_modrdn2A)
     * @remarks
     * Use the <b>ldap_modrdn2</b> function, or its synchronous equivalent, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2_s">ldap_modrdn2_s</a>, to change the name of an LDAP entry.
     * 
     * As an asynchronous function, <b>ldap_modrdn2</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous add operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * Be aware  that the various <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a> functions enable you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation, which enables more general name-change access. This functionality is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are recommended, instead of the <b>ldap_modrdn2</b> function, to change an entry name.
     * 
     * Multithreading: Calls to <b>ldap_modrdn2</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A null-terminated string that contains the distinguished name to change.
     * @param {Pointer<PSTR>} NewDistinguishedName A null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn2a
     * @since windows6.0.6000
     */
    static ldap_modrdn2A(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2A", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdnW (Unicode) function (winldap.h) changes the relative distinguished name of an LDAP entry.
     * @remarks
     * Use the <b>ldap_modrdn</b> function, or its synchronous equivalent, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn_s">ldap_modrdn_s</a>, to change the name of an LDAP entry. LDAP 2 supports additional features through 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2">ldap_modrdn2</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2_s">ldap_modrdn2_s</a>.
     * 
     * As an asynchronous function, <b>ldap_modrdn</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous add operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * Be aware that the various <b>ldap_modrdn</b> functions allow you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation that allows more general name change access. This feature is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are  recommended, instead of the <b>ldap_modrdn</b> function, to change an entry name.
     * 
     * Multithreading: Calls to <b>ldap_modrdn</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations. <b>ldap_modrdn</b> is obsolete and provided solely for compatibility with LDAP 1 implementations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_modrdn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PWSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {Pointer<PWSTR>} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdnw
     * @since windows6.0.6000
     */
    static ldap_modrdnW(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdnW", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn function changes the relative distinguished name of an LDAP entry. (ldap_modrdnA)
     * @remarks
     * Use the <b>ldap_modrdn</b> function, or its synchronous equivalent, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn_s">ldap_modrdn_s</a>, to change the name of an LDAP entry. LDAP 2 supports additional features through 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2">ldap_modrdn2</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2_s">ldap_modrdn2_s</a>.
     * 
     * As an asynchronous function, <b>ldap_modrdn</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous add operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * Be aware that the various <b>ldap_modrdn</b> functions allow you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation that allows more general name change access. This feature is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are  recommended, instead of the <b>ldap_modrdn</b> function, to change an entry name.
     * 
     * Multithreading: Calls to <b>ldap_modrdn</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations. <b>ldap_modrdn</b> is obsolete and provided solely for compatibility with LDAP 1 implementations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {Pointer<PSTR>} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdna
     * @since windows6.0.6000
     */
    static ldap_modrdnA(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdnA", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2_sW (Unicode) function (winldap.h) changes the relative distinguished name of an LDAP entry.
     * @remarks
     * Be aware that the various <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a> functions allow you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation that allows access to name-change functions. This feature is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are recommended, rather than the <b>ldap_modrdn2_s</b> function, to change an entry name.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting any other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_modrdn2_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PWSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name to change.
     * @param {Pointer<PWSTR>} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn2_sw
     * @since windows6.0.6000
     */
    static ldap_modrdn2_sW(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2_sW", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2_s function changes the relative distinguished name of an LDAP entry. (ldap_modrdn2_sA)
     * @remarks
     * Be aware that the various <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a> functions allow you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation that allows access to name-change functions. This feature is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are recommended, rather than the <b>ldap_modrdn2_s</b> function, to change an entry name.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name to change.
     * @param {Pointer<PSTR>} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn2_sa
     * @since windows6.0.6000
     */
    static ldap_modrdn2_sA(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2_sA", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn_sW (Unicode) function (winldap.h) changes the relative distinguished name of an LDAP entry.
     * @remarks
     * Use the <b>ldap_modrdn_s</b> function, or its asynchronous equivalent, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a>, to change the name of an LDAP entry. This function provides compatibility with LDAP 1. Otherwise, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2">ldap_modrdn2</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2_s">ldap_modrdn2_s</a>.
     * 
     * Be aware that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a> functions enable you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation that allows more general name change access. This feature is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are  recommended, instead of the <b>ldap_modrdn_s</b> function, to change an entry name.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_modrdn_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PWSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {Pointer<PWSTR>} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn_sw
     * @since windows6.0.6000
     */
    static ldap_modrdn_sW(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn_sW", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * Changes the relative distinguished name of an LDAP entry. (ldap_modrdn_sA)
     * @remarks
     * Use the <b>ldap_modrdn_s</b> function, or its asynchronous equivalent, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a>, to change the name of an LDAP entry. This function provides compatibility with LDAP 1. Otherwise, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2">ldap_modrdn2</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2_s">ldap_modrdn2_s</a>.
     * 
     * Be aware that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a> functions enable you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation that allows more general name change access. This feature is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are  recommended, instead of the <b>ldap_modrdn_s</b> function, to change an entry name.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {Pointer<PSTR>} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn_sa
     * @since windows6.0.6000
     */
    static ldap_modrdn_sA(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn_sA", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2 function (winldap.h) changes the relative distinguished name of an LDAP entry.
     * @remarks
     * Use the <b>ldap_modrdn2</b> function, or its synchronous equivalent, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2_s">ldap_modrdn2_s</a>, to change the name of an LDAP entry.
     * 
     * As an asynchronous function, <b>ldap_modrdn2</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous add operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * Be aware  that the various <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a> functions enable you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation, which enables more general name-change access. This functionality is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are recommended, instead of the <b>ldap_modrdn2</b> function, to change an entry name.
     * 
     * Multithreading: Calls to <b>ldap_modrdn2</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A null-terminated string that contains the distinguished name to change.
     * @param {Pointer<PSTR>} NewDistinguishedName A null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn2
     * @since windows6.0.6000
     */
    static ldap_modrdn2(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn function (winldap.h) changes the relative distinguished name of an LDAP entry.
     * @remarks
     * Use the <b>ldap_modrdn</b> function, or its synchronous equivalent, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn_s">ldap_modrdn_s</a>, to change the name of an LDAP entry. LDAP 2 supports additional features through 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2">ldap_modrdn2</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2_s">ldap_modrdn2_s</a>.
     * 
     * As an asynchronous function, <b>ldap_modrdn</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous add operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * Be aware that the various <b>ldap_modrdn</b> functions allow you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation that allows more general name change access. This feature is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are  recommended, instead of the <b>ldap_modrdn</b> function, to change an entry name.
     * 
     * Multithreading: Calls to <b>ldap_modrdn</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations. <b>ldap_modrdn</b> is obsolete and provided solely for compatibility with LDAP 1 implementations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {Pointer<PSTR>} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, it returns the message ID of the modify operation.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn
     * @since windows6.0.6000
     */
    static ldap_modrdn(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn2_s function (winldap.h) changes the relative distinguished name of an LDAP entry.
     * @remarks
     * Be aware that the various <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a> functions allow you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation that allows access to name-change functions. This feature is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are recommended, rather than the <b>ldap_modrdn2_s</b> function, to change an entry name.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name to change.
     * @param {Pointer<PSTR>} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn2_s
     * @since windows6.0.6000
     */
    static ldap_modrdn2_s(ExternalHandle, DistinguishedName, NewDistinguishedName, DeleteOldRdn) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn2_s", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "int", DeleteOldRdn, "CDecl uint")
        return result
    }

    /**
     * The ldap_modrdn_s function (winldap.h) changes the relative distinguished name of an LDAP entry.
     * @remarks
     * Use the <b>ldap_modrdn_s</b> function, or its asynchronous equivalent, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a>, to change the name of an LDAP entry. This function provides compatibility with LDAP 1. Otherwise, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2">ldap_modrdn2</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn2_s">ldap_modrdn2_s</a>.
     * 
     * Be aware that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modrdn">ldap_modrdn</a> functions enable you to change only the relative distinguished name, which is the least significant component of the object's distinguished name. Effective with version 3, LDAP provides the Modify Distinguished Name protocol operation that allows more general name change access. This feature is available by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext">ldap_rename_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_rename_ext_s">ldap_rename_ext_s</a>. These functions are  recommended, instead of the <b>ldap_modrdn_s</b> function, to change an entry name.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry to be changed.
     * @param {Pointer<PSTR>} NewDistinguishedName A pointer to a null-terminated string that contains the new relative distinguished name to give the entry.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_modrdn_s
     * @since windows6.0.6000
     */
    static ldap_modrdn_s(ExternalHandle, DistinguishedName, NewDistinguishedName) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        NewDistinguishedName := NewDistinguishedName is String? StrPtr(NewDistinguishedName) : NewDistinguishedName

        result := DllCall("WLDAP32.dll\ldap_modrdn_s", "ptr", ExternalHandle, "ptr", DistinguishedName, "ptr", NewDistinguishedName, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_extW (Unicode) function (winldap.h) starts an asynchronous operation that changes the distinguished name of an entry in the directory.
     * @remarks
     * This function provides extended renaming operations. For example, you can pass controls that separate the parent from the relative distinguished name, for clarity.
     * 
     * Multithreading: Calls to <b>ldap_rename_ext</b> are thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_rename_ext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {Pointer<PWSTR>} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name for the entry.
     * @param {Pointer<PWSTR>} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<LDAPControlW>} ServerControls List of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientControls List of client controls.
     * @param {Pointer<UInt32>} MessageNumber Pointer to a variable that receives the message identifier for this asynchronous operation. Use this identifier with the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> function to retrieve the results of the operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_rename_extw
     * @since windows6.0.6000
     */
    static ldap_rename_extW(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn
        NewRDN := NewRDN is String? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String? StrPtr(NewParent) : NewParent

        result := DllCall("WLDAP32.dll\ldap_rename_extW", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext function starts an asynchronous operation that changes the distinguished name of an entry in the directory. This function is available effective with LDAP 3. (ldap_rename_extA)
     * @remarks
     * This function provides extended renaming operations. For example, you can pass controls that separate the parent from the relative distinguished name, for clarity.
     * 
     * Multithreading: Calls to <b>ldap_rename_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {Pointer<PSTR>} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name for the entry.
     * @param {Pointer<PSTR>} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<LDAPControlA>} ServerControls List of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls List of client controls.
     * @param {Pointer<UInt32>} MessageNumber Pointer to a variable that receives the message identifier for this asynchronous operation. Use this identifier with the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> function to retrieve the results of the operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_rename_exta
     * @since windows6.0.6000
     */
    static ldap_rename_extA(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn
        NewRDN := NewRDN is String? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String? StrPtr(NewParent) : NewParent

        result := DllCall("WLDAP32.dll\ldap_rename_extA", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext_sW (Unicode) function (winldap.h) is a synchronous operation that changes the distinguished name of an entry in the directory.
     * @remarks
     * Multithreading: Calls to <b>ldap_rename_ext_s</b> are thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_rename_ext_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {Pointer<PWSTR>} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name.
     * @param {Pointer<PWSTR>} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<LDAPControlW>} ServerControls List of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientControls List of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_rename_ext_sw
     * @since windows6.0.6000
     */
    static ldap_rename_ext_sW(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn
        NewRDN := NewRDN is String? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String? StrPtr(NewParent) : NewParent

        result := DllCall("WLDAP32.dll\ldap_rename_ext_sW", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext_s function is a synchronous operation that changes the distinguished name of an entry in the directory. This function is available effective with LDAP 3. (ldap_rename_ext_sA)
     * @remarks
     * Multithreading: Calls to <b>ldap_rename_ext_s</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {Pointer<PSTR>} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name.
     * @param {Pointer<PSTR>} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<LDAPControlA>} ServerControls List of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls List of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_rename_ext_sa
     * @since windows6.0.6000
     */
    static ldap_rename_ext_sA(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn
        NewRDN := NewRDN is String? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String? StrPtr(NewParent) : NewParent

        result := DllCall("WLDAP32.dll\ldap_rename_ext_sA", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext function (winldap.h) starts an asynchronous operation that changes the distinguished name of an entry in the directory.
     * @remarks
     * This function provides extended renaming operations. For example, you can pass controls that separate the parent from the relative distinguished name, for clarity.
     * 
     * Multithreading: Calls to <b>ldap_rename_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {Pointer<PSTR>} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name for the entry.
     * @param {Pointer<PSTR>} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<LDAPControlA>} ServerControls List of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls List of client controls.
     * @param {Pointer<UInt32>} MessageNumber Pointer to a variable that receives the message identifier for this asynchronous operation. Use this identifier with the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> function to retrieve the results of the operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_rename_ext
     * @since windows6.0.6000
     */
    static ldap_rename_ext(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn
        NewRDN := NewRDN is String? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String? StrPtr(NewParent) : NewParent

        result := DllCall("WLDAP32.dll\ldap_rename_ext", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_rename_ext_s function (winldap.h) is a synchronous operation that changes the distinguished name of an entry in the directory.
     * @remarks
     * Multithreading: Calls to <b>ldap_rename_ext_s</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a wide, null-terminated string that contains the distinguished name of the entry to be renamed.
     * @param {Pointer<PSTR>} NewRDN A pointer to a wide, null-terminated string that contains the new relative distinguished name.
     * @param {Pointer<PSTR>} NewParent A pointer to a wide, null-terminated string that contains the distinguished name of the new parent for this entry. This parameter enables you to move the entry to a new parent container.
     * @param {Integer} DeleteOldRdn <b>TRUE</b> if the old relative distinguished name should be deleted; <b>FALSE</b> if the old relative distinguished name should be retained.
     * @param {Pointer<LDAPControlA>} ServerControls List of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls List of client controls.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_rename_ext_s
     * @since windows6.0.6000
     */
    static ldap_rename_ext_s(ld, dn, NewRDN, NewParent, DeleteOldRdn, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn
        NewRDN := NewRDN is String? StrPtr(NewRDN) : NewRDN
        NewParent := NewParent is String? StrPtr(NewParent) : NewParent

        result := DllCall("WLDAP32.dll\ldap_rename_ext_s", "ptr", ld, "ptr", dn, "ptr", NewRDN, "ptr", NewParent, "int", DeleteOldRdn, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_addW (Unicode) function (winldap.h) initiates an asynchronous add operation to a directory tree.
     * @remarks
     * Before calling <b>ldap_add</b>, create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> member of each structure to LDAP_MOD_ADD, and set the <b>mod_type</b> and <b>mod_vals</b> members as appropriate for your entry.
     * 
     * As an asynchronous function, <b>ldap_add</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous add operation before it has been completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the results returned directly, use the synchronous function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_s">ldap_add_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext">ldap_add_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext_s">ldap_add_ext_s</a> to enable support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_add</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_add as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModW>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute.
     * @returns {Integer} If the function succeeds, the message ID of the add operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve the error data, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_addw
     * @since windows6.0.6000
     */
    static ldap_addW(ld, dn, attrs) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_addW", "ptr", ld, "ptr", dn, "ptr", attrs, "CDecl uint")
        return result
    }

    /**
     * Initiates an asynchronous add operation to a directory tree. (ldap_addA)
     * @remarks
     * Before calling <b>ldap_add</b>, create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> member of each structure to LDAP_MOD_ADD, and set the <b>mod_type</b> and <b>mod_vals</b> members as appropriate for your entry.
     * 
     * As an asynchronous function, <b>ldap_add</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous add operation before it has been completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the results returned directly, use the synchronous function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_s">ldap_add_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext">ldap_add_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext_s">ldap_add_ext_s</a> to enable support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_add</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModA>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute.
     * @returns {Integer} If the function succeeds, the message ID of the add operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve the error data, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_adda
     * @since windows6.0.6000
     */
    static ldap_addA(ld, dn, attrs) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_addA", "ptr", ld, "ptr", dn, "ptr", attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_sW (Unicode) function (winldap.h) initiates a synchronous add operation that adds an entry to a tree.
     * @remarks
     * Before calling <b>ldap_add_s</b>. you must create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> member of each structure to LDAP_MOD_ADD, and set the <b>mod_type</b> and <b>mod_vals</b> members as appropriate for your entry. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/modifying-a-directory-entry">Modifying a Directory Entry</a> for more information.
     * 
     * Upon completion of the add operation, <b>ldap_add_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add">ldap_add</a> if you prefer to have the operation carried out asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_add_s</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_add_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModW>} attrs A null-terminated array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. See Remarks for more information.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add_sw
     * @since windows6.0.6000
     */
    static ldap_add_sW(ld, dn, attrs) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add_sW", "ptr", ld, "ptr", dn, "ptr", attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_s function initiates a synchronous add operation that adds an entry to a tree. The parent of the entry being added must already exist or the parent must be empty (equal to the root distinguished name) for an add operation to succeed. (ldap_add_sA)
     * @remarks
     * Before calling <b>ldap_add_s</b>. you must create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> member of each structure to LDAP_MOD_ADD, and set the <b>mod_type</b> and <b>mod_vals</b> members as appropriate for your entry. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/modifying-a-directory-entry">Modifying a Directory Entry</a> for more information.
     * 
     * Upon completion of the add operation, <b>ldap_add_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add">ldap_add</a> if you prefer to have the operation carried out asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_add_s</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModA>} attrs A null-terminated array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. See Remarks for more information.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add_sa
     * @since windows6.0.6000
     */
    static ldap_add_sA(ld, dn, attrs) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add_sA", "ptr", ld, "ptr", dn, "ptr", attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_extW (Unicode) function (winldap.h) initiates an asynchronous add operation to a tree.
     * @remarks
     * The parameters and effects of <b>ldap_add_ext</b> includes those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add">ldap_add</a>. The extended routine includes additional parameters to support client and server controls and thread safety.
     * 
     * Before calling <b>ldap_add_ext</b>, create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> field of each structure to <b>LDAP_MOD_ADD</b>, and set the <b>mod_type</b> and <b>mod_vals</b> fields as appropriate for your entry.
     * 
     * If the operation succeeds, <b>ldap_add_ext</b> passes the message ID to the caller as a parameter. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation.
     * 
     * To have the results returned directly, use the synchronous function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext_s">ldap_add_ext_s</a>.
     * 
     * Multithreaded: Calls to <b>ldap_add_ext</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * <i>ServerControls</i> and <i>ClientControls</i> are optional and should be set to <b>NULL</b> if not used.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_add_ext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModW>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the Remarks section.
     * @param {Pointer<LDAPControlW>} ServerControls List of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientControls List of client controls.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/functions">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add_extw
     * @since windows6.0.6000
     */
    static ldap_add_extW(ld, dn, attrs, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add_extW", "ptr", ld, "ptr", dn, "ptr", attrs, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext function initiates an asynchronous add operation to a tree. The parent of the entry added must exist, or the parent must be empty (equal to the distinguished name of the root) for an add operation to succeed. (ldap_add_extA)
     * @remarks
     * The parameters and effects of <b>ldap_add_ext</b> includes those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add">ldap_add</a>. The extended routine includes additional parameters to support client and server controls and thread safety.
     * 
     * Before calling <b>ldap_add_ext</b>, create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> field of each structure to <b>LDAP_MOD_ADD</b>, and set the <b>mod_type</b> and <b>mod_vals</b> fields as appropriate for your entry.
     * 
     * If the operation succeeds, <b>ldap_add_ext</b> passes the message ID to the caller as a parameter. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation.
     * 
     * To have the results returned directly, use the synchronous function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext_s">ldap_add_ext_s</a>.
     * 
     * Multithreaded: Calls to <b>ldap_add_ext</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * <i>ServerControls</i> and <i>ClientControls</i> are optional and should be set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModA>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the Remarks section.
     * @param {Pointer<LDAPControlA>} ServerControls List of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls List of client controls.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/functions">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add_exta
     * @since windows6.0.6000
     */
    static ldap_add_extA(ld, dn, attrs, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add_extA", "ptr", ld, "ptr", dn, "ptr", attrs, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext_sW (Unicode) function (winldap.h) initiates a synchronous add operation to a tree.
     * @remarks
     * The parameters and effects of <b>ldap_add_ext_s</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_s">ldap_add_s</a>. The extended routine includes additional parameters to support client and server controls.
     * 
     * Before calling <b>ldap_add_ext_s</b>, create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> member of the each structure to <b>LDAP_MOD_ADD</b>, and set the <b>mod_type</b> and <b>mod_vals</b> members as appropriate for your entry.
     * 
     * Upon completion of the add operation, <b>ldap_add_ext_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext">ldap_add_ext</a> if you prefer to have the operation completed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_add_ext_s</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * <i>ServerControls</i> and <i>ClientControls</i> are optional and should be set to <b>NULL</b> if not used.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_add_ext_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModW>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the  Remarks section.
     * @param {Pointer<LDAPControlW>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add_ext_sw
     * @since windows6.0.6000
     */
    static ldap_add_ext_sW(ld, dn, attrs, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add_ext_sW", "ptr", ld, "ptr", dn, "ptr", attrs, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext_s function initiates a synchronous add operation to a tree. For an add operation to succeed, the parent of the entry added must exist, or the parent must be empty (equal to the distinguished name of the root). (ldap_add_ext_sA)
     * @remarks
     * The parameters and effects of <b>ldap_add_ext_s</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_s">ldap_add_s</a>. The extended routine includes additional parameters to support client and server controls.
     * 
     * Before calling <b>ldap_add_ext_s</b>, create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> member of the each structure to <b>LDAP_MOD_ADD</b>, and set the <b>mod_type</b> and <b>mod_vals</b> members as appropriate for your entry.
     * 
     * Upon completion of the add operation, <b>ldap_add_ext_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext">ldap_add_ext</a> if you prefer to have the operation completed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_add_ext_s</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * <i>ServerControls</i> and <i>ClientControls</i> are optional and should be set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModA>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the  Remarks section.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add_ext_sa
     * @since windows6.0.6000
     */
    static ldap_add_ext_sA(ld, dn, attrs, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add_ext_sA", "ptr", ld, "ptr", dn, "ptr", attrs, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_add function (winldap.h) initiates an asynchronous add operation to a directory tree.
     * @remarks
     * Before calling <b>ldap_add</b>, create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> member of each structure to LDAP_MOD_ADD, and set the <b>mod_type</b> and <b>mod_vals</b> members as appropriate for your entry.
     * 
     * As an asynchronous function, <b>ldap_add</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous add operation before it has been completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the results returned directly, use the synchronous function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_s">ldap_add_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext">ldap_add_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext_s">ldap_add_ext_s</a> to enable support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_add</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModA>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute.
     * @returns {Integer} If the function succeeds, the message ID of the add operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve the error data, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add
     * @since windows6.0.6000
     */
    static ldap_add(ld, dn, attrs) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add", "ptr", ld, "ptr", dn, "ptr", attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_s function (winldap.h) initiates a synchronous add operation that adds an entry to a tree.
     * @remarks
     * Before calling <b>ldap_add_s</b>. you must create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> member of each structure to LDAP_MOD_ADD, and set the <b>mod_type</b> and <b>mod_vals</b> members as appropriate for your entry. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/modifying-a-directory-entry">Modifying a Directory Entry</a> for more information.
     * 
     * Upon completion of the add operation, <b>ldap_add_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add">ldap_add</a> if you prefer to have the operation carried out asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_add_s</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModA>} attrs A null-terminated array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. See Remarks for more information.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add_s
     * @since windows6.0.6000
     */
    static ldap_add_s(ld, dn, attrs) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add_s", "ptr", ld, "ptr", dn, "ptr", attrs, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext (winldap.h) function initiates an asynchronous add operation to a tree.
     * @remarks
     * The parameters and effects of <b>ldap_add_ext</b> includes those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add">ldap_add</a>. The extended routine includes additional parameters to support client and server controls and thread safety.
     * 
     * Before calling <b>ldap_add_ext</b>, create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> field of each structure to <b>LDAP_MOD_ADD</b>, and set the <b>mod_type</b> and <b>mod_vals</b> fields as appropriate for your entry.
     * 
     * If the operation succeeds, <b>ldap_add_ext</b> passes the message ID to the caller as a parameter. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation.
     * 
     * To have the results returned directly, use the synchronous function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext_s">ldap_add_ext_s</a>.
     * 
     * Multithreaded: Calls to <b>ldap_add_ext</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * <i>ServerControls</i> and <i>ClientControls</i> are optional and should be set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModA>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the Remarks section.
     * @param {Pointer<LDAPControlA>} ServerControls List of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls List of client controls.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/functions">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add_ext
     * @since windows6.0.6000
     */
    static ldap_add_ext(ld, dn, attrs, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add_ext", "ptr", ld, "ptr", dn, "ptr", attrs, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_add_ext_s function (winldap.h) initiates a synchronous add operation to a tree.
     * @remarks
     * The parameters and effects of <b>ldap_add_ext_s</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_s">ldap_add_s</a>. The extended routine includes additional parameters to support client and server controls.
     * 
     * Before calling <b>ldap_add_ext_s</b>, create an entry by specifying its attributes in 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Set the <b>mod_op</b> member of the each structure to <b>LDAP_MOD_ADD</b>, and set the <b>mod_type</b> and <b>mod_vals</b> members as appropriate for your entry.
     * 
     * Upon completion of the add operation, <b>ldap_add_ext_s</b> returns to the caller. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_add_ext">ldap_add_ext</a> if you prefer to have the operation completed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_add_ext_s</b> are thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * <i>ServerControls</i> and <i>ClientControls</i> are optional and should be set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to add.
     * @param {Pointer<LDAPModA>} attrs An array of pointers to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapmoda">LDAPMod</a> structures. Each structure specifies a single attribute. For more information, see the  Remarks section.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_add_ext_s
     * @since windows6.0.6000
     */
    static ldap_add_ext_s(ld, dn, attrs, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_add_ext_s", "ptr", ld, "ptr", dn, "ptr", attrs, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_compareW (Unicode) function (winldap.h) determines whether an attribute for a given entry holds a known value.
     * @remarks
     * The <b>ldap_compare</b> function initiates an asynchronous compare operation, comparing the value of an attribute to a known string value. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext">ldap_compare_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a> to compare binary values. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_s">ldap_compare_s</a> or <b>ldap_compare_ext_s</b> to perform a synchronous compare operation.
     * 
     * As an asynchronous function, <b>ldap_compare</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous operation before it has been completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_s">ldap_compare_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext">ldap_compare_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a> to enable support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_compare</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to get the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_compare as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {Pointer<PWSTR>} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PWSTR>} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute value.
     * @returns {Integer} If the function succeeds, the message ID of the compare operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure. This error can then be retrieved using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_comparew
     * @since windows6.0.6000
     */
    static ldap_compareW(ld, dn, attr, value) {
        dn := dn is String? StrPtr(dn) : dn
        attr := attr is String? StrPtr(attr) : attr
        value := value is String? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compareW", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare function to determine whether an attribute for a given entry holds a known value. (ldap_compareA)
     * @remarks
     * The <b>ldap_compare</b> function initiates an asynchronous compare operation, comparing the value of an attribute to a known string value. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext">ldap_compare_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a> to compare binary values. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_s">ldap_compare_s</a> or <b>ldap_compare_ext_s</b> to perform a synchronous compare operation.
     * 
     * As an asynchronous function, <b>ldap_compare</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous operation before it has been completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_s">ldap_compare_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext">ldap_compare_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a> to enable support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_compare</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to get the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {Pointer<PSTR>} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PSTR>} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute value.
     * @returns {Integer} If the function succeeds, the message ID of the compare operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure. This error can then be retrieved using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_comparea
     * @since windows6.0.6000
     */
    static ldap_compareA(ld, dn, attr, value) {
        dn := dn is String? StrPtr(dn) : dn
        attr := attr is String? StrPtr(attr) : attr
        value := value is String? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compareA", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * The ldap_compare_sW (Unicode) function (winldap.h) determines whether an attribute for a given entry holds a known value.
     * @remarks
     * The <b>ldap_compare_s</b> function initiates a synchronous 
     *     compare operation, comparing the value of an attribute to a known string value. Use 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a> if you need to compare binary 
     *     values. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare">ldap_compare</a> or 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext">ldap_compare_ext</a> to carry out an asynchronous compare 
     *     operation.
     * 
     * Multithreading: Calls to <b>ldap_compare_s</b> are 
     *     thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any 
     *     other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_compare_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {Pointer<PWSTR>} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PWSTR>} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute 
     *       value.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, the return value is 
     *        <b>LDAP_COMPARE_TRUE</b>. If the values do not match, the return value is 
     *        <b>LDAP_COMPARE_FALSE</b>.
     * 
     * If the function fails, it returns an error code. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare_sw
     * @since windows6.0.6000
     */
    static ldap_compare_sW(ld, dn, attr, value) {
        dn := dn is String? StrPtr(dn) : dn
        attr := attr is String? StrPtr(attr) : attr
        value := value is String? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compare_sW", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_s function to determine whether an attribute for a given entry holds a known value. (ldap_compare_sA)
     * @remarks
     * The <b>ldap_compare_s</b> function initiates a synchronous 
     *     compare operation, comparing the value of an attribute to a known string value. Use 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a> if you need to compare binary 
     *     values. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare">ldap_compare</a> or 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext">ldap_compare_ext</a> to carry out an asynchronous compare 
     *     operation.
     * 
     * Multithreading: Calls to <b>ldap_compare_s</b> are 
     *     thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any 
     *     other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {Pointer<PSTR>} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PSTR>} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute 
     *       value.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, the return value is 
     *        <b>LDAP_COMPARE_TRUE</b>. If the values do not match, the return value is 
     *        <b>LDAP_COMPARE_FALSE</b>.
     * 
     * If the function fails, it returns an error code. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare_sa
     * @since windows6.0.6000
     */
    static ldap_compare_sA(ld, dn, attr, value) {
        dn := dn is String? StrPtr(dn) : dn
        attr := attr is String? StrPtr(attr) : attr
        value := value is String? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compare_sA", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * The ldap_compare function (winldap.h) determines whether an attribute for a given entry holds a known value.
     * @remarks
     * The <b>ldap_compare</b> function initiates an asynchronous compare operation, comparing the value of an attribute to a known string value. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext">ldap_compare_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a> to compare binary values. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_s">ldap_compare_s</a> or <b>ldap_compare_ext_s</b> to perform a synchronous compare operation.
     * 
     * As an asynchronous function, <b>ldap_compare</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous operation before it has been completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_s">ldap_compare_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext">ldap_compare_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a> to enable support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_compare</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to get the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {Pointer<PSTR>} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PSTR>} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute value.
     * @returns {Integer} If the function succeeds, the message ID of the compare operation is returned.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP structure. This error can then be retrieved using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare
     * @since windows6.0.6000
     */
    static ldap_compare(ld, dn, attr, value) {
        dn := dn is String? StrPtr(dn) : dn
        attr := attr is String? StrPtr(attr) : attr
        value := value is String? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compare", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * The ldap_compare_s function (winldap.h) determines whether an attribute for a given entry holds a known value.
     * @remarks
     * The <b>ldap_compare_s</b> function initiates a synchronous 
     *     compare operation, comparing the value of an attribute to a known string value. Use 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a> if you need to compare binary 
     *     values. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare">ldap_compare</a> or 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext">ldap_compare_ext</a> to carry out an asynchronous compare 
     *     operation.
     * 
     * Multithreading: Calls to <b>ldap_compare_s</b> are 
     *     thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation (by calling one of the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines) before attempting any 
     *     other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry.
     * @param {Pointer<PSTR>} attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PSTR>} value A pointer to a null-terminated string that contains the string attribute value to compare to the attribute 
     *       value.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, the return value is 
     *        <b>LDAP_COMPARE_TRUE</b>. If the values do not match, the return value is 
     *        <b>LDAP_COMPARE_FALSE</b>.
     * 
     * If the function fails, it returns an error code. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare_s
     * @since windows6.0.6000
     */
    static ldap_compare_s(ld, dn, attr, value) {
        dn := dn is String? StrPtr(dn) : dn
        attr := attr is String? StrPtr(attr) : attr
        value := value is String? StrPtr(value) : value

        result := DllCall("WLDAP32.dll\ldap_compare_s", "ptr", ld, "ptr", dn, "ptr", attr, "ptr", value, "CDecl uint")
        return result
    }

    /**
     * The ldap_compare_extW (Unicode) function (winldap.h) determines if an attribute, for a given entry, holds a known value.
     * @remarks
     * The <b>ldap_compare_ext</b> function initiates an asynchronous compare operation, comparing the value of an attribute to a known value. The parameters and effects of <b>ldap_compare_ext</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare">ldap_compare</a>. The extended routine includes additional parameters to support client and server controls, comparison of binary values, and thread safety.
     * 
     * Use the <i>Value</i> parameter for comparing string values or use the <i>Data</i> parameter for comparing raw binary data. Set the unused parameter to <b>NULL</b>. If neither parameter is <b>NULL</b>, the compare operation will use the value in the <i>Data</i> parameter.
     * 
     * If successful, <b>ldap_compare_ext</b> passes back the message ID for the operation in the <i>MessageNumber</i> parameter. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to obtain the result of the compare. To have the function return the compare result directly, use the synchronous extended compare function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_compare_ext</b> are thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_compare_ext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {Pointer<PWSTR>} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PWSTR>} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value.
     * @param {Pointer<LDAPControlW>} ServerControls Optional. A list of LDAP server controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlW>} ClientControls Optional. A list of client controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the compare operation.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare_extw
     * @since windows6.0.6000
     */
    static ldap_compare_extW(ld, dn, Attr, Value, Data, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn
        Attr := Attr is String? StrPtr(Attr) : Attr
        Value := Value is String? StrPtr(Value) : Value

        result := DllCall("WLDAP32.dll\ldap_compare_extW", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_ext function to determine if an attribute, for a given entry, holds a known value. (ldap_compare_extA)
     * @remarks
     * The <b>ldap_compare_ext</b> function initiates an asynchronous compare operation, comparing the value of an attribute to a known value. The parameters and effects of <b>ldap_compare_ext</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare">ldap_compare</a>. The extended routine includes additional parameters to support client and server controls, comparison of binary values, and thread safety.
     * 
     * Use the <i>Value</i> parameter for comparing string values or use the <i>Data</i> parameter for comparing raw binary data. Set the unused parameter to <b>NULL</b>. If neither parameter is <b>NULL</b>, the compare operation will use the value in the <i>Data</i> parameter.
     * 
     * If successful, <b>ldap_compare_ext</b> passes back the message ID for the operation in the <i>MessageNumber</i> parameter. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to obtain the result of the compare. To have the function return the compare result directly, use the synchronous extended compare function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_compare_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {Pointer<PSTR>} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PSTR>} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. A list of LDAP server controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. A list of client controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the compare operation.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare_exta
     * @since windows6.0.6000
     */
    static ldap_compare_extA(ld, dn, Attr, Value, Data, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn
        Attr := Attr is String? StrPtr(Attr) : Attr
        Value := Value is String? StrPtr(Value) : Value

        result := DllCall("WLDAP32.dll\ldap_compare_extA", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_compare_ext_sW (Unicode) function (winldap.h) determines if an attribute, for a given entry, holds a known value.
     * @remarks
     * The <b>ldap_compare_ext_s</b> function initiates a synchronous compare operation, comparing the value of an attribute to a known value. The parameters and effects of <b>ldap_compare_ext_s</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_s">ldap_compare_s</a>. The extended routine includes additional parameters to support client and server controls, and comparison of binary values.
     * 
     * Use the <i>Value</i> parameter for comparing string values or use the <i>Data</i> parameter for comparing raw binary data. Set the unused parameter to <b>NULL</b>. If neither parameter is <b>NULL</b>, the compare operation will use the value in the <i>Data</i> parameter.
     * 
     * Multithreading: Calls to <b>ldap_compare_ext_s</b> are thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_compare_ext_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {Pointer<PWSTR>} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PWSTR>} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlW>} ServerControls Optional. A list of LDAP server controls. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlW>} ClientControls Optional. A list of LDAP client controls. Set to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, <b>LDAP_COMPARE_TRUE</b> is returned; if the values do not match, <b>LDAP_COMPARE_FALSE</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare_ext_sw
     * @since windows6.0.6000
     */
    static ldap_compare_ext_sW(ld, dn, Attr, Value, Data, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn
        Attr := Attr is String? StrPtr(Attr) : Attr
        Value := Value is String? StrPtr(Value) : Value

        result := DllCall("WLDAP32.dll\ldap_compare_ext_sW", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_compare_ext_s function to determine if an attribute, for a given entry, holds a known value. (ldap_compare_ext_sA)
     * @remarks
     * The <b>ldap_compare_ext_s</b> function initiates a synchronous compare operation, comparing the value of an attribute to a known value. The parameters and effects of <b>ldap_compare_ext_s</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_s">ldap_compare_s</a>. The extended routine includes additional parameters to support client and server controls, and comparison of binary values.
     * 
     * Use the <i>Value</i> parameter for comparing string values or use the <i>Data</i> parameter for comparing raw binary data. Set the unused parameter to <b>NULL</b>. If neither parameter is <b>NULL</b>, the compare operation will use the value in the <i>Data</i> parameter.
     * 
     * Multithreading: Calls to <b>ldap_compare_ext_s</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {Pointer<PSTR>} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PSTR>} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. A list of LDAP server controls. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. A list of LDAP client controls. Set to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, <b>LDAP_COMPARE_TRUE</b> is returned; if the values do not match, <b>LDAP_COMPARE_FALSE</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare_ext_sa
     * @since windows6.0.6000
     */
    static ldap_compare_ext_sA(ld, dn, Attr, Value, Data, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn
        Attr := Attr is String? StrPtr(Attr) : Attr
        Value := Value is String? StrPtr(Value) : Value

        result := DllCall("WLDAP32.dll\ldap_compare_ext_sA", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_compare_ext function (winldap.h) determines if an attribute, for a given entry, holds a known value.
     * @remarks
     * The <b>ldap_compare_ext</b> function initiates an asynchronous compare operation, comparing the value of an attribute to a known value. The parameters and effects of <b>ldap_compare_ext</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare">ldap_compare</a>. The extended routine includes additional parameters to support client and server controls, comparison of binary values, and thread safety.
     * 
     * Use the <i>Value</i> parameter for comparing string values or use the <i>Data</i> parameter for comparing raw binary data. Set the unused parameter to <b>NULL</b>. If neither parameter is <b>NULL</b>, the compare operation will use the value in the <i>Data</i> parameter.
     * 
     * If successful, <b>ldap_compare_ext</b> passes back the message ID for the operation in the <i>MessageNumber</i> parameter. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to obtain the result of the compare. To have the function return the compare result directly, use the synchronous extended compare function 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_ext_s">ldap_compare_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_compare_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {Pointer<PSTR>} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PSTR>} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. A list of LDAP server controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. A list of client controls. This parameter should be set to <b>NULL</b> if not used.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the compare operation.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare_ext
     * @since windows6.0.6000
     */
    static ldap_compare_ext(ld, dn, Attr, Value, Data, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn
        Attr := Attr is String? StrPtr(Attr) : Attr
        Value := Value is String? StrPtr(Value) : Value

        result := DllCall("WLDAP32.dll\ldap_compare_ext", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_compare_ext_s function (winldap.h) determines if an attribute, for a given entry, holds a known value.
     * @remarks
     * The <b>ldap_compare_ext_s</b> function initiates a synchronous compare operation, comparing the value of an attribute to a known value. The parameters and effects of <b>ldap_compare_ext_s</b> subsume those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_compare_s">ldap_compare_s</a>. The extended routine includes additional parameters to support client and server controls, and comparison of binary values.
     * 
     * Use the <i>Value</i> parameter for comparing string values or use the <i>Data</i> parameter for comparing raw binary data. Set the unused parameter to <b>NULL</b>. If neither parameter is <b>NULL</b>, the compare operation will use the value in the <i>Data</i> parameter.
     * 
     * Multithreading: Calls to <b>ldap_compare_ext_s</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to compare.
     * @param {Pointer<PSTR>} Attr A pointer to a null-terminated string that contains the attribute to compare.
     * @param {Pointer<PSTR>} Value A pointer to a null-terminated string that contains the string attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP_BERVAL>} Data The 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> attribute value to be compared to the attribute value. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. A list of LDAP server controls. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. A list of LDAP client controls. Set to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, and the attribute and known values match, <b>LDAP_COMPARE_TRUE</b> is returned; if the values do not match, <b>LDAP_COMPARE_FALSE</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_compare_ext_s
     * @since windows6.0.6000
     */
    static ldap_compare_ext_s(ld, dn, Attr, Value, Data, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn
        Attr := Attr is String? StrPtr(Attr) : Attr
        Value := Value is String? StrPtr(Value) : Value

        result := DllCall("WLDAP32.dll\ldap_compare_ext_s", "ptr", ld, "ptr", dn, "ptr", Attr, "ptr", Value, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_deleteW (Unicode) function (winldap.h) deletes an entry from the directory tree.
     * @remarks
     * Call <b>ldap_delete</b> to remove a leaf entry from the directory tree. Be aware that LDAP does not support deletion of entire subtrees in a single operation. As an asynchronous function, <b>ldap_delete</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous delete operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_s">ldap_delete_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext">ldap_delete_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext_s">ldap_delete_ext_s</a> to enable support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_delete</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting any other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_delete as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, it returns the message ID of the delete operation.
     * 
     * If the function fails, the return value is –1 and the function sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve this value, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_deletew
     * @since windows6.0.6000
     */
    static ldap_deleteW(ld, dn) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_deleteW", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete function deletes an entry from the directory tree. (ldap_deleteA)
     * @remarks
     * Call <b>ldap_delete</b> to remove a leaf entry from the directory tree. Be aware that LDAP does not support deletion of entire subtrees in a single operation. As an asynchronous function, <b>ldap_delete</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous delete operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_s">ldap_delete_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext">ldap_delete_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext_s">ldap_delete_ext_s</a> to enable support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_delete</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, it returns the message ID of the delete operation.
     * 
     * If the function fails, the return value is –1 and the function sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve this value, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_deletea
     * @since windows6.0.6000
     */
    static ldap_deleteA(ld, dn) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_deleteA", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_sW (Unicode) function (winldap.h) is a synchronous operation that removes a leaf entry from the directory tree.
     * @remarks
     * Call <b>ldap_delete_s</b> to remove a leaf entry from the directory tree. Be aware that LDAP does not support deletion of entire subtrees in a single operation. As a synchronous operation, <b>ldap_delete_s</b> does not return until the operation is compete. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete">ldap_delete</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext">ldap_delete_ext</a> to perform the delete operation asynchronously.
     * 
     * Multithreading: The <b>ldap_delete_s</b> function is thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting any other operations.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_delete_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete_sw
     * @since windows6.0.6000
     */
    static ldap_delete_sW(ld, dn) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_sW", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_s function is a synchronous operation that removes a leaf entry from the directory tree. (ldap_delete_sA)
     * @remarks
     * Call <b>ldap_delete_s</b> to remove a leaf entry from the directory tree. Be aware that LDAP does not support deletion of entire subtrees in a single operation. As a synchronous operation, <b>ldap_delete_s</b> does not return until the operation is compete. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete">ldap_delete</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext">ldap_delete_ext</a> to perform the delete operation asynchronously.
     * 
     * Multithreading: The <b>ldap_delete_s</b> function is thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete_sa
     * @since windows6.0.6000
     */
    static ldap_delete_sA(ld, dn) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_sA", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_extW (Unicode) function (winldap.h) is an extended routine that removes a leaf entry from the directory tree.
     * @remarks
     * The <b>ldap_delete_ext</b> function removes a leaf entry from the directory tree. LDAP does not support deletion of entire subtrees in a single operation, however there is an extended control, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-server-tree-delete-oid">LDAP_SERVER_TREE_DELETE_OID</a>, used to perform this operation.
     * 
     * The parameters and effects of <b>ldap_delete_ext</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete">ldap_delete</a>. The extended routine includes parameters to support client and server controls and thread safety.
     * 
     * If the operation succeeds, <b>ldap_delete_ext</b> passes the message ID to the caller as a parameter when the operation returns successfully. To get the result of the operation, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext_s">ldap_delete_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_delete_ext</b> are thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_delete_ext as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<LDAPControlW>} ServerControls Optional. List of LDAP server controls. If not used, set this parameter to NULL.
     * @param {Pointer<LDAPControlW>} ClientControls Optional. List of client controls. If not used, set this parameter to <b>NULL</b>.
     * @param {Pointer<UInt32>} MessageNumber Message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete_extw
     * @since windows6.0.6000
     */
    static ldap_delete_extW(ld, dn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_extW", "ptr", ld, "ptr", dn, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext function is an extended routine that removes a leaf entry from the directory tree. (ldap_delete_extA)
     * @remarks
     * The <b>ldap_delete_ext</b> function removes a leaf entry from the directory tree. LDAP does not support deletion of entire subtrees in a single operation, however there is an extended control, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-server-tree-delete-oid">LDAP_SERVER_TREE_DELETE_OID</a>, used to perform this operation.
     * 
     * The parameters and effects of <b>ldap_delete_ext</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete">ldap_delete</a>. The extended routine includes parameters to support client and server controls and thread safety.
     * 
     * If the operation succeeds, <b>ldap_delete_ext</b> passes the message ID to the caller as a parameter when the operation returns successfully. To get the result of the operation, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext_s">ldap_delete_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_delete_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. List of LDAP server controls. If not used, set this parameter to NULL.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. List of client controls. If not used, set this parameter to <b>NULL</b>.
     * @param {Pointer<UInt32>} MessageNumber Message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete_exta
     * @since windows6.0.6000
     */
    static ldap_delete_extA(ld, dn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_extA", "ptr", ld, "ptr", dn, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext_sW (Unicode) function (winldap.h) is an extended routine that performs a synchronous operation to remove a leaf entry from the directory tree.
     * @remarks
     * Call <b>ldap_delete_ext_s</b> to remove a leaf entry from the directory tree. LDAP does not support deletion of entire subtrees in a single operation, however there is an extended control, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-server-tree-delete-oid">LDAP_SERVER_TREE_DELETE_OID</a>, that does provide this. The parameters and effects of <b>ldap_delete_ext_s</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_s">ldap_delete_s</a>. The extended routine includes additional parameters to support client and server controls and thread safety.
     * 
     * As a synchronous function, <b>ldap_delete_ext_s</b> returns when the delete operation is complete. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete">ldap_delete</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext">ldap_delete_ext</a> to have the delete operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_delete_ext_s</b> are thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_delete_ext_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<LDAPControlW>} ServerControls Optional. List of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlW>} ClientControls Optional. List of client controls. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete_ext_sw
     * @since windows6.0.6000
     */
    static ldap_delete_ext_sW(ld, dn, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_ext_sW", "ptr", ld, "ptr", dn, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext_s function is an extended routine that performs a synchronous operation to remove a leaf entry from the directory tree. (ldap_delete_ext_sA)
     * @remarks
     * Call <b>ldap_delete_ext_s</b> to remove a leaf entry from the directory tree. LDAP does not support deletion of entire subtrees in a single operation, however there is an extended control, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-server-tree-delete-oid">LDAP_SERVER_TREE_DELETE_OID</a>, that does provide this. The parameters and effects of <b>ldap_delete_ext_s</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_s">ldap_delete_s</a>. The extended routine includes additional parameters to support client and server controls and thread safety.
     * 
     * As a synchronous function, <b>ldap_delete_ext_s</b> returns when the delete operation is complete. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete">ldap_delete</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext">ldap_delete_ext</a> to have the delete operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_delete_ext_s</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. List of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. List of client controls. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete_ext_sa
     * @since windows6.0.6000
     */
    static ldap_delete_ext_sA(ld, dn, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_ext_sA", "ptr", ld, "ptr", dn, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete function (winldap.h) deletes an entry from the directory tree.
     * @remarks
     * Call <b>ldap_delete</b> to remove a leaf entry from the directory tree. Be aware that LDAP does not support deletion of entire subtrees in a single operation. As an asynchronous function, <b>ldap_delete</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous delete operation before it has completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_s">ldap_delete_s</a>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext">ldap_delete_ext</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext_s">ldap_delete_ext_s</a> to enable support for LDAP 3 server and client controls.
     * 
     * Multithreading: Calls to <b>ldap_delete</b> are thread-safe, provided that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> is used to retrieve the actual session error code when the function call returns the -1 failure code.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, it returns the message ID of the delete operation.
     * 
     * If the function fails, the return value is –1 and the function sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure. To retrieve this value, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete
     * @since windows6.0.6000
     */
    static ldap_delete(ld, dn) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_s function (winldap.h) is a synchronous operation that removes a leaf entry from the directory tree.
     * @remarks
     * Call <b>ldap_delete_s</b> to remove a leaf entry from the directory tree. Be aware that LDAP does not support deletion of entire subtrees in a single operation. As a synchronous operation, <b>ldap_delete_s</b> does not return until the operation is compete. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete">ldap_delete</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext">ldap_delete_ext</a> to perform the delete operation asynchronously.
     * 
     * Multithreading: The <b>ldap_delete_s</b> function is thread-safe.
     * 
     * <div class="alert"><b>Note</b>  When connecting to an LDAP 2 server, the application must perform a bind operation, by calling one of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_bind">ldap_bind</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_simple_bind">ldap_simple_bind</a> routines, before attempting any other operations.</div>
     * <div> </div>
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete_s
     * @since windows6.0.6000
     */
    static ldap_delete_s(ld, dn) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_s", "ptr", ld, "ptr", dn, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext function (winldap.h) is an extended routine that removes a leaf entry from the directory tree.
     * @remarks
     * The <b>ldap_delete_ext</b> function removes a leaf entry from the directory tree. LDAP does not support deletion of entire subtrees in a single operation, however there is an extended control, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-server-tree-delete-oid">LDAP_SERVER_TREE_DELETE_OID</a>, used to perform this operation.
     * 
     * The parameters and effects of <b>ldap_delete_ext</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete">ldap_delete</a>. The extended routine includes parameters to support client and server controls and thread safety.
     * 
     * If the operation succeeds, <b>ldap_delete_ext</b> passes the message ID to the caller as a parameter when the operation returns successfully. To get the result of the operation, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID.
     * 
     * To have the function return the results directly, use the synchronous routine 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext_s">ldap_delete_ext_s</a>.
     * 
     * Multithreading: Calls to <b>ldap_delete_ext</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. List of LDAP server controls. If not used, set this parameter to NULL.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. List of client controls. If not used, set this parameter to <b>NULL</b>.
     * @param {Pointer<UInt32>} MessageNumber Message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete_ext
     * @since windows6.0.6000
     */
    static ldap_delete_ext(ld, dn, ServerControls, ClientControls, MessageNumber) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_ext", "ptr", ld, "ptr", dn, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_delete_ext_s function (winldap.h) is an extended routine that performs a synchronous operation to remove a leaf entry from the directory tree.
     * @remarks
     * Call <b>ldap_delete_ext_s</b> to remove a leaf entry from the directory tree. LDAP does not support deletion of entire subtrees in a single operation, however there is an extended control, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-server-tree-delete-oid">LDAP_SERVER_TREE_DELETE_OID</a>, that does provide this. The parameters and effects of <b>ldap_delete_ext_s</b> include those of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_s">ldap_delete_s</a>. The extended routine includes additional parameters to support client and server controls and thread safety.
     * 
     * As a synchronous function, <b>ldap_delete_ext_s</b> returns when the delete operation is complete. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete">ldap_delete</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_delete_ext">ldap_delete_ext</a> to have the delete operation performed asynchronously.
     * 
     * Multithreading: Calls to <b>ldap_delete_ext_s</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name of the entry to delete.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. List of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. List of client controls. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_delete_ext_s
     * @since windows6.0.6000
     */
    static ldap_delete_ext_s(ld, dn, ServerControls, ClientControls) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_delete_ext_s", "ptr", ld, "ptr", dn, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * A client calls ldap_abandon to cancel an in-process asynchronous LDAP call.
     * @remarks
     * The <b>ldap_abandon</b> function first verifies that the operation has been completed. If it has, the message ID is deleted; otherwise, the call goes to the server to cancel the operation. Be aware that a successful call to <b>ldap_abandon</b> destroys the message ID. Therefore, you cannot call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> to obtain results with that message ID, even if the server completed the operation.
     * 
     * There is no server response to <b>ldap_abandon</b>; thus, there is no guarantee that the call reached the server.
     * 
     * Multithreading: Calls to <b>ldap_abandon</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} msgid The message ID of the call to be canceled. Asynchronous functions, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search">ldap_search</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_modify">ldap_modify</a>,  return this message ID when they initiate an operation.
     * @returns {Integer} If the function succeeds, that is, if the cancel operation is successful, the return value is zero.
     * 
     * If the function fails, the return value is –1.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_abandon
     * @since windows6.0.6000
     */
    static ldap_abandon(ld, msgid) {
        result := DllCall("WLDAP32.dll\ldap_abandon", "ptr", ld, "uint", msgid, "CDecl uint")
        return result
    }

    /**
     * Obtains the result of an asynchronous operation.
     * @remarks
     * The <b>ldap_result</b> function retrieves the result of a previous, asynchronously initiated operation. Be aware that, depending on the way it is called, <b>ldap_result</b> may actually return a list or "chain" of messages.
     * 
     * For connectionless LDAP, you must pass both an LDAP connection handle and a message ID to ensure that you get the correct results. The LDAP run time continues to send the request until it receives a response.
     * 
     * Multithreading: Calls to <b>ldap_result</b> are thread safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} msgid The message ID of the operation, or the constant LDAP_RES_ANY if any result is required.
     * @param {Integer} all Specifies how many messages are retrieved in a single call to <b>ldap_result</b>. This parameter only has meaning for search results. Pass the constant LDAP_MSG_ONE (0x00) to retrieve one message at a time. Pass LDAP_MSG_ALL (0x01) to request that all results of a search be received before returning all results in a single chain. Pass LDAP_MSG_RECEIVED (0x02) to indicate that all results retrieved so far should be returned in the result chain.
     * @param {Pointer<LDAP_TIMEVAL>} timeout A timeout that specifies how long, in seconds, to wait for results to be returned. A <b>NULL</b> value causes <b>ldap_result</b> to block until results are available. A timeout value of zero seconds specifies a polling behavior.
     * @param {Pointer<LDAPMessage>} res Contains the result(s) of the operation. Any results returned should be freed with a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> once they are no longer required by the application.
     * @returns {Integer} If the function succeeds, it returns one of the following values to indicate the type of the first result in the <i>res</i> parameter. If the time-out expires, the function returns 0.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_result
     * @since windows6.0.6000
     */
    static ldap_result(ld, msgid, all, timeout, res) {
        result := DllCall("WLDAP32.dll\ldap_result", "ptr", ld, "uint", msgid, "uint", all, "ptr", timeout, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_msgfree function frees the results obtained from a previous call to ldap_result, or to one of the synchronous search routines.
     * @remarks
     * Call <b>ldap_msgfree</b> to free the result structure pointed to by the <i>res</i> parameter.
     * @param {Pointer<LDAPMessage>} res The result, or chain of results, to free.
     * @returns {Integer} Returns <b>LDAP_SUCCESS</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_msgfree
     * @since windows6.0.6000
     */
    static ldap_msgfree(res) {
        result := DllCall("WLDAP32.dll\ldap_msgfree", "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_result2error function parses a message and returns the error code.
     * @remarks
     * Multithreading: Calls to <b>ldap_result2error</b> are thread-safe.
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
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_result2error
     * @since windows6.0.6000
     */
    static ldap_result2error(ld, res, freeit) {
        result := DllCall("WLDAP32.dll\ldap_result2error", "ptr", ld, "ptr", res, "uint", freeit, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_resultW (Unicode) function (winldap.h) parses responses from the server and returns the appropriate fields.
     * @remarks
     * The <b>ldap_parse_result</b> function traverses a chain of server responses looking for result messages to parse. Use this function if you want to access the referrals, matching distinguished names, or server controls returned. The function skips over messages of type <b>LDAP_RES_SEARCH_ENTRY</b> and <b>LDAP_RES_SEARCH_REFERENCE</b>.
     * 
     * When they are no longer needed, free the <i>ErrorMessage</i> and <i>MatchedDNs</i> strings by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. Free the <i>Referrals</i> array by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>. Free the <i>ServerControls</i> by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_controls_free">ldap_controls_free</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_parse_result as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage The result of an LDAP operation as returned by one of the synchronous operation calls or by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> for an asynchronous operation.
     * @param {Pointer<UInt32>} ReturnCode Indicates the outcome of the server operation that generated the original result message. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PWSTR>} MatchedDNs A pointer to a wide, null-terminated string. In the case of a return of <b>LDAP_NO_SUCH_OBJECT</b>, this result parameter is filled in with a distinguished name indicating how much of the name in the request was recognized. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PWSTR>} ErrorMessage A pointer to a wide, null-terminated string that contains the contents of the error message field from the <i>ResultMessage</i> parameter. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<UInt16>} Referrals A pointer to a wide, null-terminated string that contains the contents of the referrals field from the <i>ResultMessage</i> parameter, indicating zero or more alternate LDAP servers where the request should be retried. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<LDAPControlW>} ServerControls This result parameter is filled in with an allocated array of controls copied from the <i>ResultMessage</i> parameter.
     * @param {Integer} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_resultw
     * @since windows6.0.6000
     */
    static ldap_parse_resultW(Connection, ResultMessage, ReturnCode, MatchedDNs, ErrorMessage, Referrals, ServerControls, Freeit) {
        MatchedDNs := MatchedDNs is String? StrPtr(MatchedDNs) : MatchedDNs
        ErrorMessage := ErrorMessage is String? StrPtr(ErrorMessage) : ErrorMessage

        result := DllCall("WLDAP32.dll\ldap_parse_resultW", "ptr", Connection, "ptr", ResultMessage, "ptr", ReturnCode, "ptr", MatchedDNs, "ptr", ErrorMessage, "ptr", Referrals, "ptr", ServerControls, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_result function parses responses from the server and returns the appropriate fields. (ldap_parse_resultA)
     * @remarks
     * The <b>ldap_parse_result</b> function traverses a chain of server responses looking for result messages to parse. Use this function if you want to access the referrals, matching distinguished names, or server controls returned. The function skips over messages of type <b>LDAP_RES_SEARCH_ENTRY</b> and <b>LDAP_RES_SEARCH_REFERENCE</b>.
     * 
     * When they are no longer needed, free the <i>ErrorMessage</i> and <i>MatchedDNs</i> strings by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. Free the <i>Referrals</i> array by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>. Free the <i>ServerControls</i> by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_controls_free">ldap_controls_free</a>.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage The result of an LDAP operation as returned by one of the synchronous operation calls or by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> for an asynchronous operation.
     * @param {Pointer<UInt32>} ReturnCode Indicates the outcome of the server operation that generated the original result message. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PSTR>} MatchedDNs A pointer to a wide, null-terminated string. In the case of a return of <b>LDAP_NO_SUCH_OBJECT</b>, this result parameter is filled in with a distinguished name indicating how much of the name in the request was recognized. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PSTR>} ErrorMessage A pointer to a wide, null-terminated string that contains the contents of the error message field from the <i>ResultMessage</i> parameter. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<SByte>} Referrals A pointer to a wide, null-terminated string that contains the contents of the referrals field from the <i>ResultMessage</i> parameter, indicating zero or more alternate LDAP servers where the request should be retried. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<LDAPControlA>} ServerControls This result parameter is filled in with an allocated array of controls copied from the <i>ResultMessage</i> parameter.
     * @param {Integer} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_resulta
     * @since windows6.0.6000
     */
    static ldap_parse_resultA(Connection, ResultMessage, ReturnCode, MatchedDNs, ErrorMessage, Referrals, ServerControls, Freeit) {
        MatchedDNs := MatchedDNs is String? StrPtr(MatchedDNs) : MatchedDNs
        ErrorMessage := ErrorMessage is String? StrPtr(ErrorMessage) : ErrorMessage

        result := DllCall("WLDAP32.dll\ldap_parse_resultA", "ptr", Connection, "ptr", ResultMessage, "ptr", ReturnCode, "ptr", MatchedDNs, "ptr", ErrorMessage, "ptr", Referrals, "ptr", ServerControls, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_extended_result parses the results of an LDAP extended operation. (ANSI)
     * @remarks
     * When a server processes an extended operation request generated by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_extended_operation">ldap_extended_operation</a>, it returns an LDAP message along with an <b>LDAP_RES_EXTENDED</b> return code. Use <b>ldap_parse_extended_result</b> to parse this result message, which returns both the text OID of the originating message in <i>ResultOID</i> and any arbitrary data generated by the extended operation in <i>ResultData</i>.
     * 
     * When they are no longer needed, free the <i>ResultOID</i> string and the <i>ResultData</i> buffer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_parse_extended_result as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> in response to an extended operation request.
     * @param {Pointer<PSTR>} ResultOID A pointer to a null-terminated string that contains the dotted object identifier (OID) text string of the server's response message.  This is normally the same OID as the one naming the request that was originally passed to the server by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_extended_operation">ldap_extended_operation</a>.
     * @param {Pointer<LDAP_BERVAL>} ResultData The arbitrary data returned by the extended operation (if <b>NULL</b>, no data is returned by the server).
     * @param {Integer} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_extended_resulta
     * @since windows6.0.6000
     */
    static ldap_parse_extended_resultA(Connection, ResultMessage, ResultOID, ResultData, Freeit) {
        ResultOID := ResultOID is String? StrPtr(ResultOID) : ResultOID

        result := DllCall("WLDAP32.dll\ldap_parse_extended_resultA", "ptr", Connection, "ptr", ResultMessage, "ptr", ResultOID, "ptr", ResultData, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_extended_result parses the results of an LDAP extended operation. (Unicode)
     * @remarks
     * When a server processes an extended operation request generated by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_extended_operation">ldap_extended_operation</a>, it returns an LDAP message along with an <b>LDAP_RES_EXTENDED</b> return code. Use <b>ldap_parse_extended_result</b> to parse this result message, which returns both the text OID of the originating message in <i>ResultOID</i> and any arbitrary data generated by the extended operation in <i>ResultData</i>.
     * 
     * When they are no longer needed, free the <i>ResultOID</i> string and the <i>ResultData</i> buffer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_parse_extended_result as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> in response to an extended operation request.
     * @param {Pointer<PWSTR>} ResultOID A pointer to a null-terminated string that contains the dotted object identifier (OID) text string of the server's response message.  This is normally the same OID as the one naming the request that was originally passed to the server by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_extended_operation">ldap_extended_operation</a>.
     * @param {Pointer<LDAP_BERVAL>} ResultData The arbitrary data returned by the extended operation (if <b>NULL</b>, no data is returned by the server).
     * @param {Integer} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_extended_resultw
     * @since windows6.0.6000
     */
    static ldap_parse_extended_resultW(Connection, ResultMessage, ResultOID, ResultData, Freeit) {
        ResultOID := ResultOID is String? StrPtr(ResultOID) : ResultOID

        result := DllCall("WLDAP32.dll\ldap_parse_extended_resultW", "ptr", Connection, "ptr", ResultMessage, "ptr", ResultOID, "ptr", ResultData, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * Frees an array of LDAPControl structures. (ldap_controls_freeA)
     * @remarks
     * Use this function to free an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> 
     *      structures previously allocated by LDAP function calls, such as the array returned by 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * 
     * <div class="alert"><b>Note</b>  This function should only be used to free controls created internally by LDAP API functions. It is not used 
     *      to free memory that is explicitly allocated by the user application.</div>
     * <div> </div>
     * @param {Pointer<LDAPControlA>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_controls_freea
     * @since windows6.0.6000
     */
    static ldap_controls_freeA(Controls) {
        result := DllCall("WLDAP32.dll\ldap_controls_freeA", "ptr", Controls, "CDecl uint")
        return result
    }

    /**
     * The ldap_control_free function frees an LDAPControl structure. (ldap_control_freeA)
     * @remarks
     * Use this function to free an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure 
     *      previously allocated by an LDAP function call, such as one allocated by a call to 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_page_control">ldap_create_page_control</a> or 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_vlv_controla">ldap_create_vlv_control</a>.
     * 
     * <div class="alert"><b>Note</b>  This function should only be used to free a control created internally by LDAP API functions. It is not used 
     *      to free memory that is explicitly allocated by the user program.</div>
     * <div> </div>
     * @param {Pointer<LDAPControlA>} Controls TBD
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_control_freea
     * @since windows6.0.6000
     */
    static ldap_control_freeA(Controls) {
        result := DllCall("WLDAP32.dll\ldap_control_freeA", "ptr", Controls, "CDecl uint")
        return result
    }

    /**
     * The ldap_controls_freeW (Unicode) function (winldap.h) frees an array of LDAPControl structures.
     * @remarks
     * Use this function to free an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> 
     *      structures previously allocated by LDAP function calls, such as the array returned by 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * 
     * <div class="alert"><b>Note</b>  This function should only be used to free controls created internally by LDAP API functions. It is not used 
     *      to free memory that is explicitly allocated by the user application.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_controls_free as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAPControlW>} Control TBD
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_controls_freew
     * @since windows6.0.6000
     */
    static ldap_controls_freeW(Control) {
        result := DllCall("WLDAP32.dll\ldap_controls_freeW", "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_control_freeW (Unicode) function (winldap.h) frees an LDAPControl structure.
     * @remarks
     * Use this function to free an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure 
     *      previously allocated by an LDAP function call, such as one allocated by a call to 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_page_control">ldap_create_page_control</a> or 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_vlv_controla">ldap_create_vlv_control</a>.
     * 
     * <div class="alert"><b>Note</b>  This function should only be used to free a control created internally by LDAP API functions. It is not used 
     *      to free memory that is explicitly allocated by the user program.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_control_free as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAPControlW>} Control The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_control_freew
     * @since windows6.0.6000
     */
    static ldap_control_freeW(Control) {
        result := DllCall("WLDAP32.dll\ldap_control_freeW", "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_free_controlsW (Unicode) function (winldap.h) is an obsolete function which frees an array of LDAPControl structures.
     * @remarks
     * > [!NOTE]
     * > The winldap.h header defines ldap_free_controls as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAPControlW>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_free_controlsw
     * @since windows6.0.6000
     */
    static ldap_free_controlsW(Controls) {
        result := DllCall("WLDAP32.dll\ldap_free_controlsW", "ptr", Controls, "CDecl uint")
        return result
    }

    /**
     * Obsolete function which frees an array of LDAPControl structures. (ldap_free_controlsA)
     * @param {Pointer<LDAPControlA>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_free_controlsa
     * @since windows6.0.6000
     */
    static ldap_free_controlsA(Controls) {
        result := DllCall("WLDAP32.dll\ldap_free_controlsA", "ptr", Controls, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_result function (winldap.h) parses responses from the server and returns the appropriate fields.
     * @remarks
     * The <b>ldap_parse_result</b> function traverses a chain of server responses looking for result messages to parse. Use this function if you want to access the referrals, matching distinguished names, or server controls returned. The function skips over messages of type <b>LDAP_RES_SEARCH_ENTRY</b> and <b>LDAP_RES_SEARCH_REFERENCE</b>.
     * 
     * When they are no longer needed, free the <i>ErrorMessage</i> and <i>MatchedDNs</i> strings by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. Free the <i>Referrals</i> array by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>. Free the <i>ServerControls</i> by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_controls_free">ldap_controls_free</a>.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage The result of an LDAP operation as returned by one of the synchronous operation calls or by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> for an asynchronous operation.
     * @param {Pointer<UInt32>} ReturnCode Indicates the outcome of the server operation that generated the original result message. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PSTR>} MatchedDNs A pointer to a wide, null-terminated string. In the case of a return of <b>LDAP_NO_SUCH_OBJECT</b>, this result parameter is filled in with a distinguished name indicating how much of the name in the request was recognized. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PSTR>} ErrorMessage A pointer to a wide, null-terminated string that contains the contents of the error message field from the <i>ResultMessage</i> parameter. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<PSTR>} Referrals A pointer to a wide, null-terminated string that contains the contents of the referrals field from the <i>ResultMessage</i> parameter, indicating zero or more alternate LDAP servers where the request should be retried. Pass <b>NULL</b> to ignore this field.
     * @param {Pointer<LDAPControlA>} ServerControls This result parameter is filled in with an allocated array of controls copied from the <i>ResultMessage</i> parameter.
     * @param {Integer} Freeit Determines whether the <i>ResultMessage</i> parameter is freed. You can pass any nonzero value to the <i>Freeit</i> parameter to free the <i>ResultMessage</i> pointer when it is no longer needed, or you can call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a> to free the result later.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_result
     * @since windows6.0.6000
     */
    static ldap_parse_result(Connection, ResultMessage, ReturnCode, MatchedDNs, ErrorMessage, Referrals, ServerControls, Freeit) {
        MatchedDNs := MatchedDNs is String? StrPtr(MatchedDNs) : MatchedDNs
        ErrorMessage := ErrorMessage is String? StrPtr(ErrorMessage) : ErrorMessage
        Referrals := Referrals is String? StrPtr(Referrals) : Referrals

        result := DllCall("WLDAP32.dll\ldap_parse_result", "ptr", Connection, "ptr", ResultMessage, "ptr", ReturnCode, "ptr", MatchedDNs, "ptr", ErrorMessage, "ptr", Referrals, "ptr", ServerControls, "char", Freeit, "CDecl uint")
        return result
    }

    /**
     * The ldap_controls_free function (winldap.h) frees an array of LDAPControl structures.
     * @remarks
     * Use this function to free an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> 
     *      structures previously allocated by LDAP function calls, such as the array returned by 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * 
     * <div class="alert"><b>Note</b>  This function should only be used to free controls created internally by LDAP API functions. It is not used 
     *      to free memory that is explicitly allocated by the user application.</div>
     * <div> </div>
     * @param {Pointer<LDAPControlA>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_controls_free
     * @since windows6.0.6000
     */
    static ldap_controls_free(Controls) {
        result := DllCall("WLDAP32.dll\ldap_controls_free", "ptr", Controls, "CDecl uint")
        return result
    }

    /**
     * The ldap_control_free function (winldap.h) frees an LDAPControl structure.
     * @remarks
     * Use this function to free an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure 
     *      previously allocated by an LDAP function call, such as one allocated by a call to 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_page_control">ldap_create_page_control</a> or 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_vlv_controla">ldap_create_vlv_control</a>.
     * 
     * <div class="alert"><b>Note</b>  This function should only be used to free a control created internally by LDAP API functions. It is not used 
     *      to free memory that is explicitly allocated by the user program.</div>
     * <div> </div>
     * @param {Pointer<LDAPControlA>} Control The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_control_free
     * @since windows6.0.6000
     */
    static ldap_control_free(Control) {
        result := DllCall("WLDAP32.dll\ldap_control_free", "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_free_controls function (winldap.h) is an obsolete function which frees an array of LDAPControl structures.
     * @param {Pointer<LDAPControlA>} Controls The array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures to free.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_free_controls
     * @since windows6.0.6000
     */
    static ldap_free_controls(Controls) {
        result := DllCall("WLDAP32.dll\ldap_free_controls", "ptr", Controls, "CDecl uint")
        return result
    }

    /**
     * The ldap_err2stringW (Unicode) function (winldap.h) converts a numeric LDAP error code into a null-terminated character string that describes the error.
     * @remarks
     * Call <b>ldap_err2string</b> to convert any  numeric LDAP error code into an informative, null-terminated character string message that describes the error. Be aware that some of the asynchronous calls return -1. In this case, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> to retrieve the LDAP error code, and then use <b>ldap_err2string</b> on that value.
     * 
     * The return value is a static pointer to the character string. Do not free this string.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_err2string as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} err An LDAP error code as returned by another LDAP function.
     * @returns {Pointer<PWSTR>} If the function succeeds, a pointer to a null-terminated character string that describes the error, is returned.
     * 
     * If the function fails, a pointer to <b>NULL</b> is returned.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_err2stringw
     * @since windows6.0.6000
     */
    static ldap_err2stringW(err) {
        result := DllCall("WLDAP32.dll\ldap_err2stringW", "uint", err, "CDecl ptr")
        return result
    }

    /**
     * Converts a numeric LDAP error code into a null-terminated character string that describes the error. (ldap_err2stringA)
     * @remarks
     * Call <b>ldap_err2string</b> to convert any  numeric LDAP error code into an informative, null-terminated character string message that describes the error. Be aware that some of the asynchronous calls return -1. In this case, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> to retrieve the LDAP error code, and then use <b>ldap_err2string</b> on that value.
     * 
     * The return value is a static pointer to the character string. Do not free this string.
     * @param {Integer} err An LDAP error code as returned by another LDAP function.
     * @returns {Pointer<PSTR>} If the function succeeds, a pointer to a null-terminated character string that describes the error, is returned.
     * 
     * If the function fails, a pointer to <b>NULL</b> is returned.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_err2stringa
     * @since windows6.0.6000
     */
    static ldap_err2stringA(err) {
        result := DllCall("WLDAP32.dll\ldap_err2stringA", "uint", err, "CDecl ptr")
        return result
    }

    /**
     * The ldap_err2string function (winldap.h) converts a numeric LDAP error code into a null-terminated character string that describes the error.
     * @remarks
     * Call <b>ldap_err2string</b> to convert any  numeric LDAP error code into an informative, null-terminated character string message that describes the error. Be aware that some of the asynchronous calls return -1. In this case, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> to retrieve the LDAP error code, and then use <b>ldap_err2string</b> on that value.
     * 
     * The return value is a static pointer to the character string. Do not free this string.
     * @param {Integer} err An LDAP error code as returned by another LDAP function.
     * @returns {Pointer<PSTR>} If the function succeeds, a pointer to a null-terminated character string that describes the error, is returned.
     * 
     * If the function fails, a pointer to <b>NULL</b> is returned.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_err2string
     * @since windows6.0.6000
     */
    static ldap_err2string(err) {
        result := DllCall("WLDAP32.dll\ldap_err2string", "uint", err, "CDecl ptr")
        return result
    }

    /**
     * Obsolete function. It exists only for compatibility.
     * @param {Pointer<LDAP>} ld Session handle.
     * @param {Pointer<PSTR>} msg A message.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_perror
     * @since windows6.0.6000
     */
    static ldap_perror(ld, msg) {
        msg := msg is String? StrPtr(msg) : msg

        DllCall("WLDAP32.dll\ldap_perror", "ptr", ld, "ptr", msg, "CDecl ")
    }

    /**
     * The ldap_first_entry function returns the first entry of a message.
     * @remarks
     * Use <b>ldap_first_entry</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a> to step through and retrieve the list of entries from a search result chain.
     * 
     * You do not have to explicitly free the returned entry as it is freed when the message itself is freed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} res The search result, as obtained by a call to one of the synchronous search routines or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_first_entry
     * @since windows6.0.6000
     */
    static ldap_first_entry(ld, res) {
        DllCall("WLDAP32.dll\ldap_first_entry", "ptr", ld, "ptr", res, "CDecl ")
    }

    /**
     * The ldap_next_entry function retrieves an entry from a search result chain.
     * @remarks
     * Use <b>ldap_next_entry</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> to step through and retrieve the list of entries from a search result chain.
     * 
     * You are not required to explicitly free the returned entry because it is freed when the message itself is freed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry returned by a previous call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or <b>ldap_next_entry</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_next_entry
     * @since windows6.0.6000
     */
    static ldap_next_entry(ld, entry) {
        DllCall("WLDAP32.dll\ldap_next_entry", "ptr", ld, "ptr", entry, "CDecl ")
    }

    /**
     * The ldap_count_entries function counts the number of search entries that a server returned.
     * @remarks
     * The <b>ldap_count_entries</b> function returns the number of entries contained, or remaining in a chain of entries. Call the function with the return value from 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_reference">ldap_first_reference</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_reference">ldap_next_reference</a>, or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} res The search result obtained by a call to one of the synchronous search routines or to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @returns {Integer} If the function succeeds, it returns the number of entries.
     * 
     * If the function fails, the return value is –1 and the function sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_count_entries
     * @since windows6.0.6000
     */
    static ldap_count_entries(ld, res) {
        result := DllCall("WLDAP32.dll\ldap_count_entries", "ptr", ld, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_first_attributeW (Unicode) function (winldap.h) returns the first attribute.
     * @remarks
     * Use 
     * <b>ldap_first_attribute</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> to step through the list of attribute types returned with an entry. You can then pass these attribute names in a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a> to retrieve their associated values.
     * 
     * A call to 
     * <b>ldap_first_attribute</b> allocates, and returns through the <i>ptr</i> parameter, a pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. Pass this pointer to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> to track the current position in the list of attributes. When you have finished stepping through a list of attributes and <i>ptr</i> is non-<b>NULL</b>, free the pointer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_free">ber_free</a>( ptr, 0 ). Be aware that you must pass the second parameter as 0 (zero) in this call.
     * 
     * Both 
     * <b>ldap_first_attribute</b> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> return a pointer to an allocated buffer containing the current attribute name. Free this buffer, when no longer required, by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. Because this buffer is overwritten on the next call to either 
     * <b>ldap_first_attribute</b> or  
     * <b>ldap_next_attribute</b>, the user should make a copy of the attribute name if it must be preserved for processing.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_first_attribute as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<PSTR>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {Pointer<PWSTR>} A pointer to a null-terminated string. If the function succeeds, it returns a pointer to an allocated buffer that contains the current attribute name. When there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_first_attributew
     * @since windows6.0.6000
     */
    static ldap_first_attributeW(ld, entry, ptr) {
        ptr := ptr is String? StrPtr(ptr) : ptr

        result := DllCall("WLDAP32.dll\ldap_first_attributeW", "ptr", ld, "ptr", entry, "ptr", ptr, "CDecl ptr")
        return result
    }

    /**
     * Returns the first attribute. (ldap_first_attributeA)
     * @remarks
     * Use 
     * <b>ldap_first_attribute</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> to step through the list of attribute types returned with an entry. You can then pass these attribute names in a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a> to retrieve their associated values.
     * 
     * A call to 
     * <b>ldap_first_attribute</b> allocates, and returns through the <i>ptr</i> parameter, a pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. Pass this pointer to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> to track the current position in the list of attributes. When you have finished stepping through a list of attributes and <i>ptr</i> is non-<b>NULL</b>, free the pointer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_free">ber_free</a>( ptr, 0 ). Be aware that you must pass the second parameter as 0 (zero) in this call.
     * 
     * Both 
     * <b>ldap_first_attribute</b> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> return a pointer to an allocated buffer containing the current attribute name. Free this buffer, when no longer required, by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. Because this buffer is overwritten on the next call to either 
     * <b>ldap_first_attribute</b> or  
     * <b>ldap_next_attribute</b>, the user should make a copy of the attribute name if it must be preserved for processing.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<PSTR>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {Pointer<PSTR>} A pointer to a null-terminated string. If the function succeeds, it returns a pointer to an allocated buffer that contains the current attribute name. When there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_first_attributea
     * @since windows6.0.6000
     */
    static ldap_first_attributeA(ld, entry, ptr) {
        ptr := ptr is String? StrPtr(ptr) : ptr

        result := DllCall("WLDAP32.dll\ldap_first_attributeA", "ptr", ld, "ptr", entry, "ptr", ptr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_first_attribute function (winldap.h) returns the first attribute.
     * @remarks
     * Use 
     * <b>ldap_first_attribute</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> to step through the list of attribute types returned with an entry. You can then pass these attribute names in a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a> to retrieve their associated values.
     * 
     * A call to 
     * <b>ldap_first_attribute</b> allocates, and returns through the <i>ptr</i> parameter, a pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. Pass this pointer to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> to track the current position in the list of attributes. When you have finished stepping through a list of attributes and <i>ptr</i> is non-<b>NULL</b>, free the pointer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_free">ber_free</a>( ptr, 0 ). Be aware that you must pass the second parameter as 0 (zero) in this call.
     * 
     * Both 
     * <b>ldap_first_attribute</b> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> return a pointer to an allocated buffer containing the current attribute name. Free this buffer, when no longer required, by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. Because this buffer is overwritten on the next call to either 
     * <b>ldap_first_attribute</b> or  
     * <b>ldap_next_attribute</b>, the user should make a copy of the attribute name if it must be preserved for processing.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<PSTR>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {Pointer<PSTR>} A pointer to a null-terminated string. If the function succeeds, it returns a pointer to an allocated buffer that contains the current attribute name. When there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_first_attribute
     * @since windows6.0.6000
     */
    static ldap_first_attribute(ld, entry, ptr) {
        ptr := ptr is String? StrPtr(ptr) : ptr

        result := DllCall("WLDAP32.dll\ldap_first_attribute", "ptr", ld, "ptr", entry, "ptr", ptr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_next_attributeW (Unicode) function (winldap.h) returns the next attribute.
     * @remarks
     * Use 
     * <b>ldap_next_attribute</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a> to step through the list of attribute types returned with an entry. You can then pass these attribute names in a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a> to retrieve their associated values.
     * 
     * A call to 
     * <b>ldap_next_attribute</b> returns, through the <i>ptr</i> parameter, a pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. Pass this pointer to the next call to 
     * <b>ldap_next_attribute</b> to track the current position in the list of attributes. When you have finished stepping through a list of attributes, and <i>ptr</i> is non-<b>NULL</b>, free the pointer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_free">ber_free</a> (ptr, 0). Be aware that you must pass the second parameter as 0 (zero) in this call.
     * 
     * The 
     * <b>ldap_next_attribute</b> function returns a pointer to an internally  allocated buffer that contains the current attribute name. Free this buffer, when no longer required, by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. Because this buffer is overwritten on the next call to either 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a> or 
     * <b>ldap_next_attribute</b>, the user should make a copy of the attribute name if it must be preserved for processing.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_next_attribute as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<PSTR>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {Pointer<PWSTR>} If the function succeeds, it returns a pointer to a null-terminated string that contains the current attribute name. If there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_next_attributew
     * @since windows6.0.6000
     */
    static ldap_next_attributeW(ld, entry, ptr) {
        ptr := ptr is String? StrPtr(ptr) : ptr

        result := DllCall("WLDAP32.dll\ldap_next_attributeW", "ptr", ld, "ptr", entry, "ptr", ptr, "CDecl ptr")
        return result
    }

    /**
     * Returns the next attribute. (ldap_next_attributeA)
     * @remarks
     * Use 
     * <b>ldap_next_attribute</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a> to step through the list of attribute types returned with an entry. You can then pass these attribute names in a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a> to retrieve their associated values.
     * 
     * A call to 
     * <b>ldap_next_attribute</b> returns, through the <i>ptr</i> parameter, a pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. Pass this pointer to the next call to 
     * <b>ldap_next_attribute</b> to track the current position in the list of attributes. When you have finished stepping through a list of attributes, and <i>ptr</i> is non-<b>NULL</b>, free the pointer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_free">ber_free</a> (ptr, 0). Be aware that you must pass the second parameter as 0 (zero) in this call.
     * 
     * The 
     * <b>ldap_next_attribute</b> function returns a pointer to an internally  allocated buffer that contains the current attribute name. Free this buffer, when no longer required, by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. Because this buffer is overwritten on the next call to either 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a> or 
     * <b>ldap_next_attribute</b>, the user should make a copy of the attribute name if it must be preserved for processing.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<PSTR>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a pointer to a null-terminated string that contains the current attribute name. If there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_next_attributea
     * @since windows6.0.6000
     */
    static ldap_next_attributeA(ld, entry, ptr) {
        ptr := ptr is String? StrPtr(ptr) : ptr

        result := DllCall("WLDAP32.dll\ldap_next_attributeA", "ptr", ld, "ptr", entry, "ptr", ptr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_next_attribute function (winldap.h) returns the next attribute.
     * @remarks
     * Use 
     * <b>ldap_next_attribute</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a> to step through the list of attribute types returned with an entry. You can then pass these attribute names in a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a> to retrieve their associated values.
     * 
     * A call to 
     * <b>ldap_next_attribute</b> returns, through the <i>ptr</i> parameter, a pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. Pass this pointer to the next call to 
     * <b>ldap_next_attribute</b> to track the current position in the list of attributes. When you have finished stepping through a list of attributes, and <i>ptr</i> is non-<b>NULL</b>, free the pointer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_free">ber_free</a> (ptr, 0). Be aware that you must pass the second parameter as 0 (zero) in this call.
     * 
     * The 
     * <b>ldap_next_attribute</b> function returns a pointer to an internally  allocated buffer that contains the current attribute name. Free this buffer, when no longer required, by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. Because this buffer is overwritten on the next call to either 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a> or 
     * <b>ldap_next_attribute</b>, the user should make a copy of the attribute name if it must be preserved for processing.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose attributes are to be stepped through, as returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>.
     * @param {Pointer<PSTR>} ptr The address of a pointer used internally to track the current position in the entry.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a pointer to a null-terminated string that contains the current attribute name. If there are no more attributes to step through, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameter in the LDAP data structure to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_next_attribute
     * @since windows6.0.6000
     */
    static ldap_next_attribute(ld, entry, ptr) {
        ptr := ptr is String? StrPtr(ptr) : ptr

        result := DllCall("WLDAP32.dll\ldap_next_attribute", "ptr", ld, "ptr", entry, "ptr", ptr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_valuesW (Unicode) function (winldap.h) retrieves the list of values of a given attribute.
     * @remarks
     * Use <b>ldap_get_values</b> when parsing a search response to obtain the value or values of an attribute. Use this function only when the attribute contains null-terminated character strings; for binary data, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values_len">ldap_get_values_len</a> instead.
     * 
     * The entry is obtained by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>. The attribute should be one returned by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a>, or a caller-supplied string (for example, "mail").
     * 
     * Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a> to get the count of values in the returned list.
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a> to release the returned value when it is no longer required.
     * 
     * Certain LDAP servers place limits on the number of attribute string values that are returned in a single call.  For more information about using range retrieval specifiers, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/searching-using-range-retrieval">Searching Using Range Retrieval</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_get_values as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry from which to retrieve values.
     * @param {Pointer<PWSTR>} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<PWSTR>} If the function succeeds, it returns a null-terminated list of pointers to values. If no attribute values were found, it usually returns <b>NULL</b>. But in some cases it may return a list one pointer that is <b>NULL</b>. Always make sure to use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a> to get the count of values in the returned list, as noted in Remarks. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_valuesw
     * @since windows6.0.6000
     */
    static ldap_get_valuesW(ld, entry, attr) {
        attr := attr is String? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_valuesW", "ptr", ld, "ptr", entry, "ptr", attr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_values function retrieves the list of values of a given attribute. (ldap_get_valuesA)
     * @remarks
     * Use <b>ldap_get_values</b> when parsing a search response to obtain the value or values of an attribute. Use this function only when the attribute contains null-terminated character strings; for binary data, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values_len">ldap_get_values_len</a> instead.
     * 
     * The entry is obtained by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>. The attribute should be one returned by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a>, or a caller-supplied string (for example, "mail").
     * 
     * Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a> to get the count of values in the returned list.
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a> to release the returned value when it is no longer required.
     * 
     * Certain LDAP servers place limits on the number of attribute string values that are returned in a single call.  For more information about using range retrieval specifiers, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/searching-using-range-retrieval">Searching Using Range Retrieval</a>.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry from which to retrieve values.
     * @param {Pointer<PSTR>} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a null-terminated list of pointers to values. If no attribute values were found, it usually returns <b>NULL</b>. But in some cases it may return a list one pointer that is <b>NULL</b>. Always make sure to use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a> to get the count of values in the returned list, as noted in Remarks. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_valuesa
     * @since windows6.0.6000
     */
    static ldap_get_valuesA(ld, entry, attr) {
        attr := attr is String? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_valuesA", "ptr", ld, "ptr", entry, "ptr", attr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_values function (winldap.h) retrieves the list of values of a given attribute.
     * @remarks
     * Use <b>ldap_get_values</b> when parsing a search response to obtain the value or values of an attribute. Use this function only when the attribute contains null-terminated character strings; for binary data, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values_len">ldap_get_values_len</a> instead.
     * 
     * The entry is obtained by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>. The attribute should be one returned by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a>, or a caller-supplied string (for example, "mail").
     * 
     * Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a> to get the count of values in the returned list.
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a> to release the returned value when it is no longer required.
     * 
     * Certain LDAP servers place limits on the number of attribute string values that are returned in a single call.  For more information about using range retrieval specifiers, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/searching-using-range-retrieval">Searching Using Range Retrieval</a>.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry from which to retrieve values.
     * @param {Pointer<PSTR>} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a null-terminated list of pointers to values. If no attribute values were found, it usually returns <b>NULL</b>. But in some cases it may return a list one pointer that is <b>NULL</b>. Always make sure to use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a> to get the count of values in the returned list, as noted in Remarks. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_values
     * @since windows6.0.6000
     */
    static ldap_get_values(ld, entry, attr) {
        attr := attr is String? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_values", "ptr", ld, "ptr", entry, "ptr", attr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_values_lenW (Unicode) function (winldap.h) retrieves the list of values for a given attribute.
     * @remarks
     * Use <b>ldap_get_values_len</b> when parsing a search response to obtain the value or values of an attribute. Use this function when the attribute contains binary data; for attributes whose values are null-terminated character strings, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * 
     * The entry is obtained by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>. The attribute should be one returned by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a>, or a caller-supplied string (for example, "mail").
     * 
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free_len">ldap_value_free_len</a> to release the returned value when it is no longer required.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_get_values_len as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPMessage>} Message Handle to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure.
     * @param {Pointer<PWSTR>} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<LDAP_BERVAL>} If the function succeeds, it returns a null-terminated list of pointers to 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures that contain the values of the specified attribute. If no attribute values were found, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_values_lenw
     * @since windows6.0.6000
     */
    static ldap_get_values_lenW(ExternalHandle, Message, attr) {
        attr := attr is String? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_values_lenW", "ptr", ExternalHandle, "ptr", Message, "ptr", attr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_values_len function retrieves the list of values for a given attribute. (ldap_get_values_lenA)
     * @remarks
     * Use <b>ldap_get_values_len</b> when parsing a search response to obtain the value or values of an attribute. Use this function when the attribute contains binary data; for attributes whose values are null-terminated character strings, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * 
     * The entry is obtained by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>. The attribute should be one returned by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a>, or a caller-supplied string (for example, "mail").
     * 
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free_len">ldap_value_free_len</a> to release the returned value when it is no longer required.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPMessage>} Message Handle to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure.
     * @param {Pointer<PSTR>} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<LDAP_BERVAL>} If the function succeeds, it returns a null-terminated list of pointers to 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures that contain the values of the specified attribute. If no attribute values were found, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_values_lena
     * @since windows6.0.6000
     */
    static ldap_get_values_lenA(ExternalHandle, Message, attr) {
        attr := attr is String? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_values_lenA", "ptr", ExternalHandle, "ptr", Message, "ptr", attr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_values_len function (winldap.h) retrieves the list of values for a given attribute.
     * @remarks
     * Use <b>ldap_get_values_len</b> when parsing a search response to obtain the value or values of an attribute. Use this function when the attribute contains binary data; for attributes whose values are null-terminated character strings, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * 
     * The entry is obtained by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a> or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>. The attribute should be one returned by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a>, or a caller-supplied string (for example, "mail").
     * 
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free_len">ldap_value_free_len</a> to release the returned value when it is no longer required.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPMessage>} Message Handle to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure.
     * @param {Pointer<PSTR>} attr A pointer to a null-terminated string that contains the attribute whose values are to be retrieved.
     * @returns {Pointer<LDAP_BERVAL>} If the function succeeds, it returns a null-terminated list of pointers to 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures that contain the values of the specified attribute. If no attribute values were found, it returns <b>NULL</b>. The session error parameter in the LDAP data structure is set to 0 in either case.
     * 
     * If the function fails, it returns <b>NULL</b> and the session error parameter in the LDAP data structure is set to the LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_values_len
     * @since windows6.0.6000
     */
    static ldap_get_values_len(ExternalHandle, Message, attr) {
        attr := attr is String? StrPtr(attr) : attr

        result := DllCall("WLDAP32.dll\ldap_get_values_len", "ptr", ExternalHandle, "ptr", Message, "ptr", attr, "CDecl ptr")
        return result
    }

    /**
     * The ldap_count_valuesW (Unicode) function (winldap.h) counts the number of values in a list.
     * @remarks
     * The <b>ldap_count_values</b> function returns the number of values in an array of strings. To count binary values in an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values_len">ldap_count_values_len</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_count_values as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} vals An array of null-terminated strings (values) returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * @returns {Integer} This function returns the number of values in the array. There is no error return.
     * 
     * If a <b>NULL</b> pointer is passed as the argument, 0 is returned. If an invalid argument is passed, the value returned is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_count_valuesw
     * @since windows6.0.6000
     */
    static ldap_count_valuesW(vals) {
        vals := vals is String? StrPtr(vals) : vals

        result := DllCall("WLDAP32.dll\ldap_count_valuesW", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_count_values function counts the number of values in a list. (ldap_count_valuesA)
     * @remarks
     * The <b>ldap_count_values</b> function returns the number of values in an array of strings. To count binary values in an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values_len">ldap_count_values_len</a>.
     * @param {Pointer<PSTR>} vals An array of null-terminated strings (values) returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * @returns {Integer} This function returns the number of values in the array. There is no error return.
     * 
     * If a <b>NULL</b> pointer is passed as the argument, 0 is returned. If an invalid argument is passed, the value returned is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_count_valuesa
     * @since windows6.0.6000
     */
    static ldap_count_valuesA(vals) {
        vals := vals is String? StrPtr(vals) : vals

        result := DllCall("WLDAP32.dll\ldap_count_valuesA", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_count_values function (winldap.h) counts the number of values in a list.
     * @remarks
     * The <b>ldap_count_values</b> function returns the number of values in an array of strings. To count binary values in an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values_len">ldap_count_values_len</a>.
     * @param {Pointer<PSTR>} vals An array of null-terminated strings (values) returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * @returns {Integer} This function returns the number of values in the array. There is no error return.
     * 
     * If a <b>NULL</b> pointer is passed as the argument, 0 is returned. If an invalid argument is passed, the value returned is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_count_values
     * @since windows6.0.6000
     */
    static ldap_count_values(vals) {
        vals := vals is String? StrPtr(vals) : vals

        result := DllCall("WLDAP32.dll\ldap_count_values", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * Counts the number of values in a list.
     * @remarks
     * The <b>ldap_count_values_len</b> function returns the number of binary values in an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures. To count the values in an array of null-terminated character strings, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_count_values">ldap_count_values</a>.
     * @param {Pointer<LDAP_BERVAL>} vals An array of values returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values_len">ldap_get_values_len</a>.
     * @returns {Integer} This function returns the number of values in the array. There is no error return.
     * 
     * If a <b>NULL</b> pointer is passed as the argument, 0 is returned. If an invalid argument is passed, the value returned is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_count_values_len
     * @since windows6.0.6000
     */
    static ldap_count_values_len(vals) {
        result := DllCall("WLDAP32.dll\ldap_count_values_len", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_value_freeW (Unicode) function (winldap.h) frees a structure returned by ldap_get_values.
     * @remarks
     * Call <b>ldap_value_free</b> to free a structure returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_value_free as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} vals The structure to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_value_freew
     * @since windows6.0.6000
     */
    static ldap_value_freeW(vals) {
        vals := vals is String? StrPtr(vals) : vals

        result := DllCall("WLDAP32.dll\ldap_value_freeW", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * Frees a structure returned by ldap_get_values. (ldap_value_freeA)
     * @remarks
     * Call <b>ldap_value_free</b> to free a structure returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * @param {Pointer<PSTR>} vals The structure to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_value_freea
     * @since windows6.0.6000
     */
    static ldap_value_freeA(vals) {
        vals := vals is String? StrPtr(vals) : vals

        result := DllCall("WLDAP32.dll\ldap_value_freeA", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_value_free function (winldap.h) frees a structure returned by ldap_get_values.
     * @remarks
     * Call <b>ldap_value_free</b> to free a structure returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>.
     * @param {Pointer<PSTR>} vals The structure to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_value_free
     * @since windows6.0.6000
     */
    static ldap_value_free(vals) {
        vals := vals is String? StrPtr(vals) : vals

        result := DllCall("WLDAP32.dll\ldap_value_free", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_value_free_len frees berval structures that were returned by ldap_get_values_len.
     * @remarks
     * Call <b>ldap_value_free_len</b> to free <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values_len">ldap_get_values_len</a>.
     * @param {Pointer<LDAP_BERVAL>} vals The structure to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_value_free_len
     * @since windows6.0.6000
     */
    static ldap_value_free_len(vals) {
        result := DllCall("WLDAP32.dll\ldap_value_free_len", "ptr", vals, "CDecl uint")
        return result
    }

    /**
     * The ldap_get_dnW (Unicode) function (winldap.h) retrieves the distinguished name for a given entry.
     * @remarks
     * The <b>ldap_get_dn</b> function retrieves the distinguished name for an entry that was returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a>, or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>. When the returned name is no longer needed, free the string by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_get_dn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose distinguished name is to be retrieved.
     * @returns {Pointer<PWSTR>} If the function succeeds, it returns the distinguished name as a pointer to a null-terminated character string.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_dnw
     * @since windows6.0.6000
     */
    static ldap_get_dnW(ld, entry) {
        result := DllCall("WLDAP32.dll\ldap_get_dnW", "ptr", ld, "ptr", entry, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_dn function retrieves the distinguished name for a given entry. (ldap_get_dnA)
     * @remarks
     * The <b>ldap_get_dn</b> function retrieves the distinguished name for an entry that was returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a>, or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>. When the returned name is no longer needed, free the string by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose distinguished name is to be retrieved.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns the distinguished name as a pointer to a null-terminated character string.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_dna
     * @since windows6.0.6000
     */
    static ldap_get_dnA(ld, entry) {
        result := DllCall("WLDAP32.dll\ldap_get_dnA", "ptr", ld, "ptr", entry, "CDecl ptr")
        return result
    }

    /**
     * The ldap_get_dn function (winldap.h) retrieves the distinguished name for a given entry.
     * @remarks
     * The <b>ldap_get_dn</b> function retrieves the distinguished name for an entry that was returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a>, or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>. When the returned name is no longer needed, free the string by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry whose distinguished name is to be retrieved.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns the distinguished name as a pointer to a null-terminated character string.
     * 
     * If the function fails, it returns <b>NULL</b> and sets the session error parameters in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_dn
     * @since windows6.0.6000
     */
    static ldap_get_dn(ld, entry) {
        result := DllCall("WLDAP32.dll\ldap_get_dn", "ptr", ld, "ptr", entry, "CDecl ptr")
        return result
    }

    /**
     * The ldap_explode_dnW (Unicode) function (winldap.h) breaks up an entry name into its component parts.
     * @remarks
     * Call <b>ldap_explode_dn</b> to separate a distinguished name into its component parts. Set the <i>notypes</i> parameter to a nonzero value to remove type information, such as "cn=" from the components. The components of the relative distinguished name are returned in a character array. Free this array when it is no longer needed by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * 
     * Calling <b>ldap_explode_dn</b> with a pointer to a constant string will cause the function to fail.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_explode_dn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name to explode.  The string that this pointer refers to cannot be a constant string.
     * @param {Integer} notypes Indicates whether the type information components should be removed.
     * @returns {Pointer<PWSTR>} If the function succeeds, it returns a null-terminated character array containing the relative distinguished name components of the distinguished name supplied.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_explode_dnw
     * @since windows6.0.6000
     */
    static ldap_explode_dnW(dn, notypes) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_explode_dnW", "ptr", dn, "uint", notypes, "CDecl ptr")
        return result
    }

    /**
     * The ldap_explode_dn function breaks up an entry name into its component parts. (ldap_explode_dnA)
     * @remarks
     * Call <b>ldap_explode_dn</b> to separate a distinguished name into its component parts. Set the <i>notypes</i> parameter to a nonzero value to remove type information, such as "cn=" from the components. The components of the relative distinguished name are returned in a character array. Free this array when it is no longer needed by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * 
     * Calling <b>ldap_explode_dn</b> with a pointer to a constant string will cause the function to fail.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name to explode.  The string that this pointer refers to cannot be a constant string.
     * @param {Integer} notypes Indicates whether the type information components should be removed.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a null-terminated character array containing the relative distinguished name components of the distinguished name supplied.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_explode_dna
     * @since windows6.0.6000
     */
    static ldap_explode_dnA(dn, notypes) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_explode_dnA", "ptr", dn, "uint", notypes, "CDecl ptr")
        return result
    }

    /**
     * The ldap_explode_dn function (winldap.h) breaks up an entry name into its component parts.
     * @remarks
     * Call <b>ldap_explode_dn</b> to separate a distinguished name into its component parts. Set the <i>notypes</i> parameter to a nonzero value to remove type information, such as "cn=" from the components. The components of the relative distinguished name are returned in a character array. Free this array when it is no longer needed by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * 
     * Calling <b>ldap_explode_dn</b> with a pointer to a constant string will cause the function to fail.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name to explode.  The string that this pointer refers to cannot be a constant string.
     * @param {Integer} notypes Indicates whether the type information components should be removed.
     * @returns {Pointer<PSTR>} If the function succeeds, it returns a null-terminated character array containing the relative distinguished name components of the distinguished name supplied.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_explode_dn
     * @since windows6.0.6000
     */
    static ldap_explode_dn(dn, notypes) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_explode_dn", "ptr", dn, "uint", notypes, "CDecl ptr")
        return result
    }

    /**
     * The ldap_dn2ufnW (Unicode) function (winldap.h) converts a distinguished name to a user-friendly format.
     * @remarks
     * When given an entry distinguished name, <b>ldap_dn2ufn</b> returns a null-terminated character string that contains the entry name in a user-friendly format. The composition of the user-friendly format is based on the format described in RFC 1781, and depends upon the directory service implementation and the type of entry. The return value remains in memory-allocated space until you call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_dn2ufn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} dn A pointer to a null-terminated string that contains the distinguished name to convert.
     * @returns {Pointer<PWSTR>} If the function is successful, the user-friendly name is returned as a pointer to a null-terminated character string.
     * 
     * If the function fails, <b>NULL</b> is returned.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_dn2ufnw
     * @since windows6.0.6000
     */
    static ldap_dn2ufnW(dn) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_dn2ufnW", "ptr", dn, "CDecl ptr")
        return result
    }

    /**
     * Converts a distinguished name to a user-friendly format. (ldap_dn2ufnA)
     * @remarks
     * When given an entry distinguished name, <b>ldap_dn2ufn</b> returns a null-terminated character string that contains the entry name in a user-friendly format. The composition of the user-friendly format is based on the format described in RFC 1781, and depends upon the directory service implementation and the type of entry. The return value remains in memory-allocated space until you call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name to convert.
     * @returns {Pointer<PSTR>} If the function is successful, the user-friendly name is returned as a pointer to a null-terminated character string.
     * 
     * If the function fails, <b>NULL</b> is returned.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_dn2ufna
     * @since windows6.0.6000
     */
    static ldap_dn2ufnA(dn) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_dn2ufnA", "ptr", dn, "CDecl ptr")
        return result
    }

    /**
     * The ldap_dn2ufn function (winldap.h) converts a distinguished name to a user-friendly format.
     * @remarks
     * When given an entry distinguished name, <b>ldap_dn2ufn</b> returns a null-terminated character string that contains the entry name in a user-friendly format. The composition of the user-friendly format is based on the format described in RFC 1781, and depends upon the directory service implementation and the type of entry. The return value remains in memory-allocated space until you call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @param {Pointer<PSTR>} dn A pointer to a null-terminated string that contains the distinguished name to convert.
     * @returns {Pointer<PSTR>} If the function is successful, the user-friendly name is returned as a pointer to a null-terminated character string.
     * 
     * If the function fails, <b>NULL</b> is returned.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_dn2ufn
     * @since windows6.0.6000
     */
    static ldap_dn2ufn(dn) {
        dn := dn is String? StrPtr(dn) : dn

        result := DllCall("WLDAP32.dll\ldap_dn2ufn", "ptr", dn, "CDecl ptr")
        return result
    }

    /**
     * The ldap_memfreeW (Unicode) function (winldap.h) frees memory allocated from the LDAP heap.
     * @remarks
     * Call <b>ldap_memfree</b> to free strings, such as the attribute names returned by <b>ldap_*_attribute</b>, or distinguished names returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_dn">ldap_get_dn</a>. Do not free the static buffers used by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>, and others.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_memfree as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} Block A pointer to a null-terminated string that contains a pointer to memory allocated by the LDAP library.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_memfreew
     * @since windows6.0.6000
     */
    static ldap_memfreeW(Block) {
        Block := Block is String? StrPtr(Block) : Block

        DllCall("WLDAP32.dll\ldap_memfreeW", "ptr", Block, "CDecl ")
    }

    /**
     * Frees memory allocated from the LDAP heap. (ldap_memfreeA)
     * @remarks
     * Call <b>ldap_memfree</b> to free strings, such as the attribute names returned by <b>ldap_*_attribute</b>, or distinguished names returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_dn">ldap_get_dn</a>. Do not free the static buffers used by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>, and others.
     * @param {Pointer<PSTR>} Block A pointer to a null-terminated string that contains a pointer to memory allocated by the LDAP library.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_memfreea
     * @since windows6.0.6000
     */
    static ldap_memfreeA(Block) {
        Block := Block is String? StrPtr(Block) : Block

        DllCall("WLDAP32.dll\ldap_memfreeA", "ptr", Block, "CDecl ")
    }

    /**
     * The ber_bvfree function (winldap.h) frees a berval structure, which represents arbitrary binary data that is encoded according to Basic Encoding Rules (BER).
     * @remarks
     * Applications should not call this function to free <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures that they themselves have allocated.
     * @param {Pointer<LDAP_BERVAL>} bv TBD
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ber_bvfree
     * @since windows6.0.6000
     */
    static ber_bvfree(bv) {
        DllCall("WLDAP32.dll\ber_bvfree", "ptr", bv, "CDecl ")
    }

    /**
     * The ldap_memfree function (winldap.h) frees memory allocated from the LDAP heap.
     * @remarks
     * Call <b>ldap_memfree</b> to free strings, such as the attribute names returned by <b>ldap_*_attribute</b>, or distinguished names returned by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_dn">ldap_get_dn</a>. Do not free the static buffers used by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_values">ldap_get_values</a>, and others.
     * @param {Pointer<PSTR>} Block A pointer to a null-terminated string that contains a pointer to memory allocated by the LDAP library.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_memfree
     * @since windows6.0.6000
     */
    static ldap_memfree(Block) {
        Block := Block is String? StrPtr(Block) : Block

        DllCall("WLDAP32.dll\ldap_memfree", "ptr", Block, "CDecl ")
    }

    /**
     * The ldap_ufn2dnW (Unicode) function (winldap.h) converts a user friendly name to a distinguished name.
     * @remarks
     * The <b>ldap_ufn2dn</b> function attempts to normalize a user-specified name to a distinguished name. For example, consider an LDAP directory format for a common name of <i>LastName</i><b>, </b><i>FirstName</i>. Given a directory name of "Jeff Smith," <b>ldap_ufn2dn</b> will attempt to normalize this to "Smith, Jeff." The function follows RFC 1781; add CN= if not present, add OU= if none present, and so on. If it runs into any errors while normalizing, the function returns a copy of what was passed. It then allocates the output string from the LDAP memory pool.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_ufn2dn as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} ufn Pointer to a null-terminated string that contains the user-friendly name to convert.
     * @param {Pointer<PWSTR>} pDn Pointer to a variable that receives a pointer to a null-terminated string that contains the resulting distinguished name.
     * 
     * If the <i>pDn</i> parameter returns non-<b>NULL</b>, free it with a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_ufn2dnw
     * @since windows6.0.6000
     */
    static ldap_ufn2dnW(ufn, pDn) {
        ufn := ufn is String? StrPtr(ufn) : ufn
        pDn := pDn is String? StrPtr(pDn) : pDn

        result := DllCall("WLDAP32.dll\ldap_ufn2dnW", "ptr", ufn, "ptr", pDn, "CDecl uint")
        return result
    }

    /**
     * Converts a user-friendly name to a distinguished name. (ldap_ufn2dnA)
     * @remarks
     * The <b>ldap_ufn2dn</b> function attempts to normalize a user-specified name to a distinguished name. For example, consider an LDAP directory format for a common name of <i>LastName</i><b>, </b><i>FirstName</i>. Given a directory name of "Jeff Smith," <b>ldap_ufn2dn</b> will attempt to normalize this to "Smith, Jeff." The function follows RFC 1781; add CN= if not present, add OU= if none present, and so on. If it runs into any errors while normalizing, the function returns a copy of what was passed. It then allocates the output string from the LDAP memory pool.
     * @param {Pointer<PSTR>} ufn Pointer to a null-terminated string that contains the user-friendly name to convert.
     * @param {Pointer<PSTR>} pDn Pointer to a variable that receives a pointer to a null-terminated string that contains the resulting distinguished name.
     * 
     * If the <i>pDn</i> parameter returns non-<b>NULL</b>, free it with a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_ufn2dna
     * @since windows6.0.6000
     */
    static ldap_ufn2dnA(ufn, pDn) {
        ufn := ufn is String? StrPtr(ufn) : ufn
        pDn := pDn is String? StrPtr(pDn) : pDn

        result := DllCall("WLDAP32.dll\ldap_ufn2dnA", "ptr", ufn, "ptr", pDn, "CDecl uint")
        return result
    }

    /**
     * The ldap_ufn2dn function (winldap.h) converts a user friendly name to a distinguished name.
     * @remarks
     * The <b>ldap_ufn2dn</b> function attempts to normalize a user-specified name to a distinguished name. For example, consider an LDAP directory format for a common name of <i>LastName</i><b>, </b><i>FirstName</i>. Given a directory name of "Jeff Smith," <b>ldap_ufn2dn</b> will attempt to normalize this to "Smith, Jeff." The function follows RFC 1781; add CN= if not present, add OU= if none present, and so on. If it runs into any errors while normalizing, the function returns a copy of what was passed. It then allocates the output string from the LDAP memory pool.
     * @param {Pointer<PSTR>} ufn Pointer to a null-terminated string that contains the user-friendly name to convert.
     * @param {Pointer<PSTR>} pDn Pointer to a variable that receives a pointer to a null-terminated string that contains the resulting distinguished name.
     * 
     * If the <i>pDn</i> parameter returns non-<b>NULL</b>, free it with a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_ufn2dn
     * @since windows6.0.6000
     */
    static ldap_ufn2dn(ufn, pDn) {
        ufn := ufn is String? StrPtr(ufn) : ufn
        pDn := pDn is String? StrPtr(pDn) : pDn

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
     * @remarks
     * <div class="alert"><b>Warning</b>  The <b>ldap_cleanup</b> function may cause 
     *     unpredictable behavior at the DLL unload time.  Use is not recommended and is at your own risk.</div>
     * <div> </div>
     * @param {Pointer<HANDLE>} hInstance This parameter is ignored.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_cleanup
     * @since windows6.0.6000
     */
    static ldap_cleanup(hInstance) {
        result := DllCall("WLDAP32.dll\ldap_cleanup", "ptr", hInstance, "CDecl uint")
        return result
    }

    /**
     * The ldap_escape_filter_elementW (Unicode) function (winldap.h) converts a filter element to a null-terminated character string that can be passed safely in a search filter.
     * @remarks
     * The <b>ldap_escape_filter_element</b> function allows you to use raw binary data in search filters. For example, you can use this function to specify a certificate or a JPEG image as the attribute to match.
     * 
     * Call <b>ldap_escape_filter_element</b> with the <i>sourceFilterElement</i> parameter pointing to raw data and <i>sourceLength</i> set appropriately to the length of data. If the <i>destFilterElement</i> parameter is <b>NULL</b>, then the return value is the length required for the output buffer. If <i>destFilterElement</i> is not <b>NULL</b>, then the function copies the source into the destination buffer and ensures that it is of a safe format. Then insert the destination buffer into your search filter after the "attributetype=" filter element.
     * 
     * <div class="alert"><b>Note</b>  Do not call <b>ldap_escape_filter_element</b> for attribute values that are strings, as the run time does not perform any conversion from UTF-8 format. Use this function only for attribute elements that are raw binary data.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_escape_filter_element as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} sourceFilterElement A pointer to a null-terminated string that contains the filter element to convert.
     * @param {Integer} sourceLength The length, in bytes, of the source filter element.
     * @param {Pointer<PWSTR>} destFilterElement A pointer to a null-terminated character string.
     * @param {Integer} destLength The length, in bytes, of the <i>destFilterElement</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_escape_filter_elementw
     * @since windows6.0.6000
     */
    static ldap_escape_filter_elementW(sourceFilterElement, sourceLength, destFilterElement, destLength) {
        sourceFilterElement := sourceFilterElement is String? StrPtr(sourceFilterElement) : sourceFilterElement
        destFilterElement := destFilterElement is String? StrPtr(destFilterElement) : destFilterElement

        result := DllCall("WLDAP32.dll\ldap_escape_filter_elementW", "ptr", sourceFilterElement, "uint", sourceLength, "ptr", destFilterElement, "uint", destLength, "CDecl uint")
        return result
    }

    /**
     * The ldap_escape_filter_element function converts a filter element to a null-terminated character string that can be passed safely in a search filter. (ldap_escape_filter_elementA)
     * @remarks
     * The <b>ldap_escape_filter_element</b> function allows you to use raw binary data in search filters. For example, you can use this function to specify a certificate or a JPEG image as the attribute to match.
     * 
     * Call <b>ldap_escape_filter_element</b> with the <i>sourceFilterElement</i> parameter pointing to raw data and <i>sourceLength</i> set appropriately to the length of data. If the <i>destFilterElement</i> parameter is <b>NULL</b>, then the return value is the length required for the output buffer. If <i>destFilterElement</i> is not <b>NULL</b>, then the function copies the source into the destination buffer and ensures that it is of a safe format. Then insert the destination buffer into your search filter after the "attributetype=" filter element.
     * 
     * <div class="alert"><b>Note</b>  Do not call <b>ldap_escape_filter_element</b> for attribute values that are strings, as the run time does not perform any conversion from UTF-8 format. Use this function only for attribute elements that are raw binary data.</div>
     * <div> </div>
     * @param {Pointer<PSTR>} sourceFilterElement A pointer to a null-terminated string that contains the filter element to convert.
     * @param {Integer} sourceLength The length, in bytes, of the source filter element.
     * @param {Pointer<PSTR>} destFilterElement A pointer to a null-terminated character string.
     * @param {Integer} destLength The length, in bytes, of the <i>destFilterElement</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_escape_filter_elementa
     * @since windows6.0.6000
     */
    static ldap_escape_filter_elementA(sourceFilterElement, sourceLength, destFilterElement, destLength) {
        sourceFilterElement := sourceFilterElement is String? StrPtr(sourceFilterElement) : sourceFilterElement
        destFilterElement := destFilterElement is String? StrPtr(destFilterElement) : destFilterElement

        result := DllCall("WLDAP32.dll\ldap_escape_filter_elementA", "ptr", sourceFilterElement, "uint", sourceLength, "ptr", destFilterElement, "uint", destLength, "CDecl uint")
        return result
    }

    /**
     * The ldap_escape_filter_element function (winldap.h) converts a filter element to a null-terminated character string that can be passed safely in a search filter.
     * @remarks
     * The <b>ldap_escape_filter_element</b> function allows you to use raw binary data in search filters. For example, you can use this function to specify a certificate or a JPEG image as the attribute to match.
     * 
     * Call <b>ldap_escape_filter_element</b> with the <i>sourceFilterElement</i> parameter pointing to raw data and <i>sourceLength</i> set appropriately to the length of data. If the <i>destFilterElement</i> parameter is <b>NULL</b>, then the return value is the length required for the output buffer. If <i>destFilterElement</i> is not <b>NULL</b>, then the function copies the source into the destination buffer and ensures that it is of a safe format. Then insert the destination buffer into your search filter after the "attributetype=" filter element.
     * 
     * <div class="alert"><b>Note</b>  Do not call <b>ldap_escape_filter_element</b> for attribute values that are strings, as the run time does not perform any conversion from UTF-8 format. Use this function only for attribute elements that are raw binary data.</div>
     * <div> </div>
     * @param {Pointer<PSTR>} sourceFilterElement A pointer to a null-terminated string that contains the filter element to convert.
     * @param {Integer} sourceLength The length, in bytes, of the source filter element.
     * @param {Pointer<PSTR>} destFilterElement A pointer to a null-terminated character string.
     * @param {Integer} destLength The length, in bytes, of the <i>destFilterElement</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_escape_filter_element
     * @since windows6.0.6000
     */
    static ldap_escape_filter_element(sourceFilterElement, sourceLength, destFilterElement, destLength) {
        sourceFilterElement := sourceFilterElement is String? StrPtr(sourceFilterElement) : sourceFilterElement
        destFilterElement := destFilterElement is String? StrPtr(destFilterElement) : destFilterElement

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
     * @param {Pointer<PSTR>} lpSrcStr A pointer to a null-terminated UTF-8 string to convert.
     * @param {Integer} cchSrc An integer that specifies the size, in characters, of the <i>lpSrcStr</i> string.
     * @param {Pointer<PWSTR>} lpDestStr A pointer to a buffer that receives the converted Unicode string, without a null terminator.
     * @param {Integer} cchDest An integer that specifies the size, in characters, of the <i>lpDestStr</i> buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldaputf8tounicode
     * @since windows6.0.6000
     */
    static LdapUTF8ToUnicode(lpSrcStr, cchSrc, lpDestStr, cchDest) {
        lpSrcStr := lpSrcStr is String? StrPtr(lpSrcStr) : lpSrcStr
        lpDestStr := lpDestStr is String? StrPtr(lpDestStr) : lpDestStr

        A_LastError := 0

        DllCall("WLDAP32.dll\LdapUTF8ToUnicode", "ptr", lpSrcStr, "int", cchSrc, "ptr", lpDestStr, "int", cchDest, "CDecl ")
        if(A_LastError)
            throw OSError()

    }

    /**
     * Converts Unicode strings to UTF-8.
     * @param {Pointer<PWSTR>} lpSrcStr A pointer to a null-terminated Unicode string to convert.
     * @param {Integer} cchSrc An integer that specifies the size, in characters, of the <i>lpSrcStr</i> string.
     * @param {Pointer<PSTR>} lpDestStr A pointer to a buffer that receives the converted UTF-8 character string, without a null terminator.
     * @param {Integer} cchDest An integer that specifies the size, in characters, of the <i>lpDestStr</i> buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldapunicodetoutf8
     * @since windows6.0.6000
     */
    static LdapUnicodeToUTF8(lpSrcStr, cchSrc, lpDestStr, cchDest) {
        lpSrcStr := lpSrcStr is String? StrPtr(lpSrcStr) : lpSrcStr
        lpDestStr := lpDestStr is String? StrPtr(lpDestStr) : lpDestStr

        A_LastError := 0

        DllCall("WLDAP32.dll\LdapUnicodeToUTF8", "ptr", lpSrcStr, "int", cchSrc, "ptr", lpDestStr, "int", cchDest, "CDecl ")
        if(A_LastError)
            throw OSError()

    }

    /**
     * The ldap_create_sort_control function is used to format a list of sort keys into a search control. Support for controls is available effective with LDAP 3, but whether the sort control is supported or not is dependent on the particular server. (ldap_create_sort_controlA)
     * @remarks
     * The <b>ldap_create_sort_control</b> function creates a basic sort control. Such a control is useful when the LDAP client has limited functionality and cannot sort results, yet needs them sorted.
     * 
     * The sort controls allow a server to return a result code for the sorting of the results that is independent of the result code returned for the search operation.
     * 
     * This function creates the control — it does not verify that  the server supports it, and consequently, does not return LDAP_UNAVAILABLE_CRIT_EXTENSION if the server does not support the control. However, it can return other standard LDAP return values, such as LDAP_NO_MEMORY or LDAP_PARAM_ERROR.
     * 
     * To free the control when it is no longer required, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_control_free">ldap_control_free</a>.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPSortKeyA>} SortKeys Pointer to an array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures. Each structure in the array specifies the name of an attribute to use as a sort key, the matching rule for that key, and whether the sort order is ascending or descending.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search. 0 ==&gt; FALSE, !0 ==&gt; TRUE.
     * @param {Pointer<LDAPControlA>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_create_sort_controla
     * @since windows6.0.6000
     */
    static ldap_create_sort_controlA(ExternalHandle, SortKeys, IsCritical, Control) {
        result := DllCall("WLDAP32.dll\ldap_create_sort_controlA", "ptr", ExternalHandle, "ptr", SortKeys, "char", IsCritical, "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_create_sort_controlW (Unicode) function (winldap.h) is used to format a list of sort keys into a search control.
     * @remarks
     * The <b>ldap_create_sort_control</b> function creates a basic sort control. Such a control is useful when the LDAP client has limited functionality and cannot sort results, yet needs them sorted.
     * 
     * The sort controls allow a server to return a result code for the sorting of the results that is independent of the result code returned for the search operation.
     * 
     * This function creates the control — it does not verify that  the server supports it, and consequently, does not return LDAP_UNAVAILABLE_CRIT_EXTENSION if the server does not support the control. However, it can return other standard LDAP return values, such as LDAP_NO_MEMORY or LDAP_PARAM_ERROR.
     * 
     * To free the control when it is no longer required, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_control_free">ldap_control_free</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_create_sort_control as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPSortKeyW>} SortKeys Pointer to an array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures. Each structure in the array specifies the name of an attribute to use as a sort key, the matching rule for that key, and whether the sort order is ascending or descending.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search. 0 ==&gt; FALSE, !0 ==&gt; TRUE.
     * @param {Pointer<LDAPControlW>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_create_sort_controlw
     * @since windows6.0.6000
     */
    static ldap_create_sort_controlW(ExternalHandle, SortKeys, IsCritical, Control) {
        result := DllCall("WLDAP32.dll\ldap_create_sort_controlW", "ptr", ExternalHandle, "ptr", SortKeys, "char", IsCritical, "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_sort_control function parses the sort control returned by the server. (ldap_parse_sort_controlA)
     * @remarks
     * When the server returns the results, it returns a control in the SearchResultDone message. Call <b>ldap_parse_sort_control</b> to parse this sort control.
     * 
     * If the sort operation failed, the server may return the name of the attribute that caused the failure. In this case, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> to free the attribute value
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPControlA>} Control The control returned from the server, as obtained from a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<UInt32>} Result The result code.
     * @param {Pointer<PSTR>} Attribute A pointer to a null-terminated string that contains the name of the attribute that caused the operation to fail.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_sort_controla
     * @since windows6.0.6000
     */
    static ldap_parse_sort_controlA(ExternalHandle, Control, Result, Attribute) {
        Attribute := Attribute is String? StrPtr(Attribute) : Attribute

        result := DllCall("WLDAP32.dll\ldap_parse_sort_controlA", "ptr", ExternalHandle, "ptr", Control, "ptr", Result, "ptr", Attribute, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_sort_controlW (Unicode) function (winldap.h) parses the sort control returned by the server.
     * @remarks
     * When the server returns the results, it returns a control in the SearchResultDone message. Call <b>ldap_parse_sort_control</b> to parse this sort control.
     * 
     * If the sort operation failed, the server may return the name of the attribute that caused the failure. In this case, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> to free the attribute value
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_parse_sort_control as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPControlW>} Control The control returned from the server, as obtained from a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<UInt32>} Result The result code.
     * @param {Pointer<PWSTR>} Attribute A pointer to a null-terminated string that contains the name of the attribute that caused the operation to fail.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_sort_controlw
     * @since windows6.0.6000
     */
    static ldap_parse_sort_controlW(ExternalHandle, Control, Result, Attribute) {
        Attribute := Attribute is String? StrPtr(Attribute) : Attribute

        result := DllCall("WLDAP32.dll\ldap_parse_sort_controlW", "ptr", ExternalHandle, "ptr", Control, "ptr", Result, "ptr", Attribute, "CDecl uint")
        return result
    }

    /**
     * The ldap_create_sort_control function (winldap.h) is used to format a list of sort keys into a search control.
     * @remarks
     * The <b>ldap_create_sort_control</b> function creates a basic sort control. Such a control is useful when the LDAP client has limited functionality and cannot sort results, yet needs them sorted.
     * 
     * The sort controls allow a server to return a result code for the sorting of the results that is independent of the result code returned for the search operation.
     * 
     * This function creates the control — it does not verify that  the server supports it, and consequently, does not return LDAP_UNAVAILABLE_CRIT_EXTENSION if the server does not support the control. However, it can return other standard LDAP return values, such as LDAP_NO_MEMORY or LDAP_PARAM_ERROR.
     * 
     * To free the control when it is no longer required, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_control_free">ldap_control_free</a>.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPSortKeyA>} SortKeys Pointer to an array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures. Each structure in the array specifies the name of an attribute to use as a sort key, the matching rule for that key, and whether the sort order is ascending or descending.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search. 0 ==&gt; FALSE, !0 ==&gt; TRUE.
     * @param {Pointer<LDAPControlA>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_create_sort_control
     * @since windows6.0.6000
     */
    static ldap_create_sort_control(ExternalHandle, SortKeys, IsCritical, Control) {
        result := DllCall("WLDAP32.dll\ldap_create_sort_control", "ptr", ExternalHandle, "ptr", SortKeys, "char", IsCritical, "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_sort_control function (winldap.h) parses the sort control returned by the server.
     * @remarks
     * When the server returns the results, it returns a control in the SearchResultDone message. Call <b>ldap_parse_sort_control</b> to parse this sort control.
     * 
     * If the sort operation failed, the server may return the name of the attribute that caused the failure. In this case, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> to free the attribute value
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPControlA>} Control The control returned from the server, as obtained from a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<UInt32>} Result The result code.
     * @param {Pointer<PSTR>} Attribute A pointer to a null-terminated string that contains the name of the attribute that caused the operation to fail.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_sort_control
     * @since windows6.0.6000
     */
    static ldap_parse_sort_control(ExternalHandle, Control, Result, Attribute) {
        Attribute := Attribute is String? StrPtr(Attribute) : Attribute

        result := DllCall("WLDAP32.dll\ldap_parse_sort_control", "ptr", ExternalHandle, "ptr", Control, "ptr", Result, "ptr", Attribute, "CDecl uint")
        return result
    }

    /**
     * The ldap_encode_sort_controlW (Unicode) function formats a list of sort keys into a search control. This function is obsolete, use the ldap_create_sort_controlW (Unicode) function instead.
     * @remarks
     * > [!NOTE]
     * > The winldap.h header defines ldap_encode_sort_control as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPSortKeyW>} SortKeys A list of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures.
     * @param {Pointer<LDAPControlW>} Control Pointer to the new control.
     * @param {Integer} Criticality Notifies the server whether this control is critical to the search.
     * @returns {Integer} If the call completed successfully, <b>LDAP_SUCCESS</b> is returned. Other standard LDAP return values, such as <b>LDAP_NO_MEMORY</b> or <b>LDAP_PARAM_ERROR</b>, may also be returned.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_encode_sort_controlw
     * @since windows6.0.6000
     */
    static ldap_encode_sort_controlW(ExternalHandle, SortKeys, Control, Criticality) {
        result := DllCall("WLDAP32.dll\ldap_encode_sort_controlW", "ptr", ExternalHandle, "ptr", SortKeys, "ptr", Control, "char", Criticality, "CDecl uint")
        return result
    }

    /**
     * The ldap_encode_sort_control function formats a list of sort keys into a search control. This function is obsolete. Instead, use ldap_create_sort_control. (ldap_encode_sort_controlA)
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPSortKeyA>} SortKeys A list of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structures.
     * @param {Pointer<LDAPControlA>} Control Pointer to the new control.
     * @param {Integer} Criticality Notifies the server whether this control is critical to the search.
     * @returns {Integer} If the call completed successfully, <b>LDAP_SUCCESS</b> is returned. Other standard LDAP return values, such as <b>LDAP_NO_MEMORY</b> or <b>LDAP_PARAM_ERROR</b>, may also be returned.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_encode_sort_controla
     * @since windows6.0.6000
     */
    static ldap_encode_sort_controlA(ExternalHandle, SortKeys, Control, Criticality) {
        result := DllCall("WLDAP32.dll\ldap_encode_sort_controlA", "ptr", ExternalHandle, "ptr", SortKeys, "ptr", Control, "char", Criticality, "CDecl uint")
        return result
    }

    /**
     * The ldap_create_page_controlW (Unicode) function (winldap.h) creates a basic control for paging results.
     * @remarks
     * The <b>ldap_create_page_control</b> function creates a simple paged-results control. The control enables the client to specify the rate at which an LDAP server returns the results of a search operation. This is useful when the client has limited resources and may not be able to process the entire result set from a given LDAP query, or when the client/server connection is slow.
     * 
     * To create the paged-results control, specify the number of entries to be returned in a single page. To return results normally, even if it cannot support this control, set the <i>IsCritical</i> parameter to <b>FALSE</b>.
     * 
     * This function creates the control - it does not verify that the server supports it, and consequently, does not return <b>LDAP_UNAVAILABLE_CRIT_EXTENSION</b> if the server does not support the control. However, it can return other standard LDAP return values, such as <b>LDAP_NO_MEMORY</b> or <b>LDAP_PARAM_ERROR</b>.
     * 
     * When <b>ldap_create_page_control</b> returns successfully, include the newly created control to the list of server controls in a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> or to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext_s">ldap_search_ext_s</a>. When the server returns the first page of results, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> to retrieve the first page of results.
     * 
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_control_free">ldap_control_free</a> when the control is no longer required.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_create_page_control as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Integer} PageSize The number of entries to return in each page.
     * @param {Pointer<LDAP_BERVAL>} Cookie Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure that the server uses to determine its location in the result set. This is an opaque structure that you should not access directly. Set to <b>NULL</b> for the first call to <b>ldap_create_page_control</b>.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search.
     * @param {Pointer<LDAPControlW>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_create_page_controlw
     * @since windows6.0.6000
     */
    static ldap_create_page_controlW(ExternalHandle, PageSize, Cookie, IsCritical, Control) {
        result := DllCall("WLDAP32.dll\ldap_create_page_controlW", "ptr", ExternalHandle, "uint", PageSize, "ptr", Cookie, "char", IsCritical, "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * Use the ldap_create_page_control function to create a basic control for paging results. Support for controls is available effective with LDAP 3, but whether the page control is supported or not is dependent on the particular server. (ldap_create_page_controlA)
     * @remarks
     * The <b>ldap_create_page_control</b> function creates a simple paged-results control. The control enables the client to specify the rate at which an LDAP server returns the results of a search operation. This is useful when the client has limited resources and may not be able to process the entire result set from a given LDAP query, or when the client/server connection is slow.
     * 
     * To create the paged-results control, specify the number of entries to be returned in a single page. To return results normally, even if it cannot support this control, set the <i>IsCritical</i> parameter to <b>FALSE</b>.
     * 
     * This function creates the control - it does not verify that the server supports it, and consequently, does not return <b>LDAP_UNAVAILABLE_CRIT_EXTENSION</b> if the server does not support the control. However, it can return other standard LDAP return values, such as <b>LDAP_NO_MEMORY</b> or <b>LDAP_PARAM_ERROR</b>.
     * 
     * When <b>ldap_create_page_control</b> returns successfully, include the newly created control to the list of server controls in a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> or to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext_s">ldap_search_ext_s</a>. When the server returns the first page of results, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> to retrieve the first page of results.
     * 
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_control_free">ldap_control_free</a> when the control is no longer required.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Integer} PageSize The number of entries to return in each page.
     * @param {Pointer<LDAP_BERVAL>} Cookie Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure that the server uses to determine its location in the result set. This is an opaque structure that you should not access directly. Set to <b>NULL</b> for the first call to <b>ldap_create_page_control</b>.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search.
     * @param {Pointer<LDAPControlA>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_create_page_controla
     * @since windows6.0.6000
     */
    static ldap_create_page_controlA(ExternalHandle, PageSize, Cookie, IsCritical, Control) {
        result := DllCall("WLDAP32.dll\ldap_create_page_controlA", "ptr", ExternalHandle, "uint", PageSize, "ptr", Cookie, "char", IsCritical, "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_page_controlW (Unicode) function (winldap.h) parses the results of a search into pages.
     * @remarks
     * Use <b>ldap_parse_page_control</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_page_control">ldap_create_page_control</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> to implement the simple paging of results by means of controls. After calling <b>ldap_parse_page_control</b> to retrieve the server controls and extract the cookie from the search result, call <b>ldap_parse_result</b> to parse the results. Then use the cookie to call <b>ldap_create_page_control</b> to retrieve the next page of results.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_parse_page_control as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPControlW>} ServerControls An array of controls that includes a page control. The page control contains the cookie and total count fields returned by the server.
     * @param {Pointer<UInt32>} TotalCount A pointer to the total count of entries returned in this page (optional).
     * @param {Pointer<LDAP_BERVAL>} Cookie An opaque cookie, used by the server to determine its location in the result set. Use ber_bvfree to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_page_controlw
     * @since windows6.0.6000
     */
    static ldap_parse_page_controlW(ExternalHandle, ServerControls, TotalCount, Cookie) {
        result := DllCall("WLDAP32.dll\ldap_parse_page_controlW", "ptr", ExternalHandle, "ptr", ServerControls, "ptr", TotalCount, "ptr", Cookie, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_page_control parses the results of a search into pages. (ldap_parse_page_controlA)
     * @remarks
     * Use <b>ldap_parse_page_control</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_page_control">ldap_create_page_control</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> to implement the simple paging of results by means of controls. After calling <b>ldap_parse_page_control</b> to retrieve the server controls and extract the cookie from the search result, call <b>ldap_parse_result</b> to parse the results. Then use the cookie to call <b>ldap_create_page_control</b> to retrieve the next page of results.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPControlA>} ServerControls An array of controls that includes a page control. The page control contains the cookie and total count fields returned by the server.
     * @param {Pointer<UInt32>} TotalCount A pointer to the total count of entries returned in this page (optional).
     * @param {Pointer<LDAP_BERVAL>} Cookie An opaque cookie, used by the server to determine its location in the result set. Use ber_bvfree to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_page_controla
     * @since windows6.0.6000
     */
    static ldap_parse_page_controlA(ExternalHandle, ServerControls, TotalCount, Cookie) {
        result := DllCall("WLDAP32.dll\ldap_parse_page_controlA", "ptr", ExternalHandle, "ptr", ServerControls, "ptr", TotalCount, "ptr", Cookie, "CDecl uint")
        return result
    }

    /**
     * The ldap_create_page_control function (winldap.h) creates a basic control for paging results.
     * @remarks
     * The <b>ldap_create_page_control</b> function creates a simple paged-results control. The control enables the client to specify the rate at which an LDAP server returns the results of a search operation. This is useful when the client has limited resources and may not be able to process the entire result set from a given LDAP query, or when the client/server connection is slow.
     * 
     * To create the paged-results control, specify the number of entries to be returned in a single page. To return results normally, even if it cannot support this control, set the <i>IsCritical</i> parameter to <b>FALSE</b>.
     * 
     * This function creates the control - it does not verify that the server supports it, and consequently, does not return <b>LDAP_UNAVAILABLE_CRIT_EXTENSION</b> if the server does not support the control. However, it can return other standard LDAP return values, such as <b>LDAP_NO_MEMORY</b> or <b>LDAP_PARAM_ERROR</b>.
     * 
     * When <b>ldap_create_page_control</b> returns successfully, include the newly created control to the list of server controls in a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext">ldap_search_ext</a> or to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_ext_s">ldap_search_ext_s</a>. When the server returns the first page of results, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> to retrieve the first page of results.
     * 
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_control_free">ldap_control_free</a> when the control is no longer required.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Integer} PageSize The number of entries to return in each page.
     * @param {Pointer<LDAP_BERVAL>} Cookie Pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure that the server uses to determine its location in the result set. This is an opaque structure that you should not access directly. Set to <b>NULL</b> for the first call to <b>ldap_create_page_control</b>.
     * @param {Integer} IsCritical Notifies the server whether this control is critical to the search.
     * @param {Pointer<LDAPControlA>} Control Pointer to the newly created control.
     * @returns {Integer} This function returns WINLDAPAPI ULONG LDAPAPI.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_create_page_control
     * @since windows6.0.6000
     */
    static ldap_create_page_control(ExternalHandle, PageSize, Cookie, IsCritical, Control) {
        result := DllCall("WLDAP32.dll\ldap_create_page_control", "ptr", ExternalHandle, "uint", PageSize, "ptr", Cookie, "char", IsCritical, "ptr", Control, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_page_control function (winldap.h) parses the results of a search into pages.
     * @remarks
     * Use <b>ldap_parse_page_control</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_create_page_control">ldap_create_page_control</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> to implement the simple paging of results by means of controls. After calling <b>ldap_parse_page_control</b> to retrieve the server controls and extract the cookie from the search result, call <b>ldap_parse_result</b> to parse the results. Then use the cookie to call <b>ldap_create_page_control</b> to retrieve the next page of results.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<LDAPControlA>} ServerControls An array of controls that includes a page control. The page control contains the cookie and total count fields returned by the server.
     * @param {Pointer<UInt32>} TotalCount A pointer to the total count of entries returned in this page (optional).
     * @param {Pointer<LDAP_BERVAL>} Cookie An opaque cookie, used by the server to determine its location in the result set. Use ber_bvfree to free.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_page_control
     * @since windows6.0.6000
     */
    static ldap_parse_page_control(ExternalHandle, ServerControls, TotalCount, Cookie) {
        result := DllCall("WLDAP32.dll\ldap_parse_page_control", "ptr", ExternalHandle, "ptr", ServerControls, "ptr", TotalCount, "ptr", Cookie, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_init_pageW (Unicode) function (winldap.h) initializes a search block for a simple paged-results search.
     * @remarks
     * The 
     * <b>ldap_search_init_page</b> function creates an LDAPSearch structure for managing paged searches and returns a handle to the structure. The 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page">ldap_get_next_page</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page_s">ldap_get_next_page_s</a>, and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_paged_count">ldap_get_paged_count</a> functions require this search handle as a parameter. When the paged search is completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_abandon_page">ldap_search_abandon_page</a> to free this structure and its handle.
     * 
     * To determine whether a server supports paged-results searches, check the supportedControl property off of the root for an object identifier (OID) of 1.2.840.113556.1.4.319.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_search_init_page as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PWSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} ScopeOfSearch 
     * @param {Pointer<PWSTR>} SearchFilter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<UInt16>} AttributeList A null-terminated array of null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} AttributesOnly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<LDAPControlW>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlW>} ClientControls A list of client controls.
     * @param {Integer} PageTimeLimit The time value, in seconds, that the client will wait for the server to return a page.
     * @param {Integer} TotalSizeLimit The maximum number of entries the client will accept.  The <i>TotalSizeLimit</i> value affects only the individual pages within the paged search (not the overall paged search).  So if <i>TotalSizeLimit</i> is greater than page size, then <i>TotalSizeLimit</i> will have no effect.
     * @param {Pointer<LDAPSortKeyW>} SortKeys A pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure, which specifies the attribute type, the ordering rule, and the direction for the search.
     * @returns {Pointer} If the function succeeds, it returns a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366129(v=vs.85)">LDAPSearch</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_abandon_page">ldap_search_abandon_page</a> to free the returned structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_init_pagew
     * @since windows6.0.6000
     */
    static ldap_search_init_pageW(ExternalHandle, DistinguishedName, ScopeOfSearch, SearchFilter, AttributeList, AttributesOnly, ServerControls, ClientControls, PageTimeLimit, TotalSizeLimit, SortKeys) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        SearchFilter := SearchFilter is String? StrPtr(SearchFilter) : SearchFilter

        A_LastError := 0

        result := DllCall("WLDAP32.dll\ldap_search_init_pageW", "ptr", ExternalHandle, "ptr", DistinguishedName, "uint", ScopeOfSearch, "ptr", SearchFilter, "ptr", AttributeList, "uint", AttributesOnly, "ptr", ServerControls, "ptr", ClientControls, "uint", PageTimeLimit, "uint", TotalSizeLimit, "ptr", SortKeys, "CDecl ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes a search block for a simple paged-results search. (ldap_search_init_pageA)
     * @remarks
     * The 
     * <b>ldap_search_init_page</b> function creates an LDAPSearch structure for managing paged searches and returns a handle to the structure. The 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page">ldap_get_next_page</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page_s">ldap_get_next_page_s</a>, and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_paged_count">ldap_get_paged_count</a> functions require this search handle as a parameter. When the paged search is completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_abandon_page">ldap_search_abandon_page</a> to free this structure and its handle.
     * 
     * To determine whether a server supports paged-results searches, check the supportedControl property off of the root for an object identifier (OID) of 1.2.840.113556.1.4.319.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} ScopeOfSearch 
     * @param {Pointer<PSTR>} SearchFilter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} AttributeList A null-terminated array of null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} AttributesOnly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @param {Integer} PageTimeLimit The time value, in seconds, that the client will wait for the server to return a page.
     * @param {Integer} TotalSizeLimit The maximum number of entries the client will accept.  The <i>TotalSizeLimit</i> value affects only the individual pages within the paged search (not the overall paged search).  So if <i>TotalSizeLimit</i> is greater than page size, then <i>TotalSizeLimit</i> will have no effect.
     * @param {Pointer<LDAPSortKeyA>} SortKeys A pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure, which specifies the attribute type, the ordering rule, and the direction for the search.
     * @returns {Pointer} If the function succeeds, it returns a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366129(v=vs.85)">LDAPSearch</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_abandon_page">ldap_search_abandon_page</a> to free the returned structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_init_pagea
     * @since windows6.0.6000
     */
    static ldap_search_init_pageA(ExternalHandle, DistinguishedName, ScopeOfSearch, SearchFilter, AttributeList, AttributesOnly, ServerControls, ClientControls, PageTimeLimit, TotalSizeLimit, SortKeys) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        SearchFilter := SearchFilter is String? StrPtr(SearchFilter) : SearchFilter

        A_LastError := 0

        result := DllCall("WLDAP32.dll\ldap_search_init_pageA", "ptr", ExternalHandle, "ptr", DistinguishedName, "uint", ScopeOfSearch, "ptr", SearchFilter, "ptr", AttributeList, "uint", AttributesOnly, "ptr", ServerControls, "ptr", ClientControls, "uint", PageTimeLimit, "uint", TotalSizeLimit, "ptr", SortKeys, "CDecl ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The ldap_search_init_page function (winldap.h) initializes a search block for a simple paged-results search.
     * @remarks
     * The 
     * <b>ldap_search_init_page</b> function creates an LDAPSearch structure for managing paged searches and returns a handle to the structure. The 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page">ldap_get_next_page</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page_s">ldap_get_next_page_s</a>, and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_paged_count">ldap_get_paged_count</a> functions require this search handle as a parameter. When the paged search is completed, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_abandon_page">ldap_search_abandon_page</a> to free this structure and its handle.
     * 
     * To determine whether a server supports paged-results searches, check the supportedControl property off of the root for an object identifier (OID) of 1.2.840.113556.1.4.319.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} DistinguishedName A pointer to a null-terminated string that contains the distinguished name of the entry at which to start the search.
     * @param {Integer} ScopeOfSearch 
     * @param {Pointer<PSTR>} SearchFilter A pointer to a null-terminated string that specifies the search filter. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/search-filter-syntax">Search Filter Syntax</a>.
     * @param {Pointer<SByte>} AttributeList A null-terminated array of null-terminated strings indicating which attributes to return for each matching entry. Pass <b>NULL</b> to retrieve all available attributes.
     * @param {Integer} AttributesOnly A Boolean value that should be zero if both attribute types and values are to be returned, nonzero if only types are to be returned.
     * @param {Pointer<LDAPControlA>} ServerControls A list of LDAP server controls.
     * @param {Pointer<LDAPControlA>} ClientControls A list of client controls.
     * @param {Integer} PageTimeLimit The time value, in seconds, that the client will wait for the server to return a page.
     * @param {Integer} TotalSizeLimit The maximum number of entries the client will accept.  The <i>TotalSizeLimit</i> value affects only the individual pages within the paged search (not the overall paged search).  So if <i>TotalSizeLimit</i> is greater than page size, then <i>TotalSizeLimit</i> will have no effect.
     * @param {Pointer<LDAPSortKeyA>} SortKeys A pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapsortkeya">LDAPSortKey</a> structure, which specifies the attribute type, the ordering rule, and the direction for the search.
     * @returns {Pointer} If the function succeeds, it returns a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366129(v=vs.85)">LDAPSearch</a> structure.
     * 
     * If the function fails, the return value is <b>NULL</b>. Use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldapgetlasterror">LdapGetLastError</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to retrieve the error code.
     * 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_abandon_page">ldap_search_abandon_page</a> to free the returned structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_init_page
     * @since windows6.0.6000
     */
    static ldap_search_init_page(ExternalHandle, DistinguishedName, ScopeOfSearch, SearchFilter, AttributeList, AttributesOnly, ServerControls, ClientControls, PageTimeLimit, TotalSizeLimit, SortKeys) {
        DistinguishedName := DistinguishedName is String? StrPtr(DistinguishedName) : DistinguishedName
        SearchFilter := SearchFilter is String? StrPtr(SearchFilter) : SearchFilter

        A_LastError := 0

        result := DllCall("WLDAP32.dll\ldap_search_init_page", "ptr", ExternalHandle, "ptr", DistinguishedName, "uint", ScopeOfSearch, "ptr", SearchFilter, "ptr", AttributeList, "uint", AttributesOnly, "ptr", ServerControls, "ptr", ClientControls, "uint", PageTimeLimit, "uint", TotalSizeLimit, "ptr", SortKeys, "CDecl ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the next page in a sequence of asynchronous paged search results.
     * @remarks
     * The <b>ldap_get_next_page</b> function is part of the interface for simple, asynchronous paging of search results. Use the search handle returned from an initial call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_init_page">ldap_search_init_page</a> and specify, in the <i>PageSize</i> parameter, the number of entries to be returned in a page. Set <i>PageSize</i> to zero to abandon a search.
     * 
     * Be aware that after each call to <b>ldap_get_next_page</b>, you must call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_paged_count">ldap_get_paged_count</a> for each set of results returned from the server using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>. This enables the LDAP run time to save the cookie that the server passed back to maintain the search state. Other than calling <b>ldap_get_paged_count</b>, the results returned from <b>ldap_get_next_page</b> can be handled as any other search result, and must be freed when complete by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>.
     * 
     * When parsing the results set, be aware that it is possible for the server to return an empty page of results and yet still respond with an <b>LDAP_SUCCESS</b> return value. This indicates that the server was unable to retrieve a page of results, due to a timeout or other reason,  but has not finished the search request. The proper behavior, in this instance, is to continue to call <b>ldap_get_next_page</b> until either another page of results are successfully retrieved, an error code is returned, or <b>LDAP_NO_RESULTS_RETURNED</b> is returned to indicate that the search is complete.
     * 
     * If you prefer to retrieve paged search results synchronously, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page_s">ldap_get_next_page_s</a>.
     * @param {Pointer<LDAP>} ExternalHandle Session handle.
     * @param {Pointer} SearchHandle Search block handle.
     * @param {Integer} PageSize The number of entries to return in a single page.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code return value. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_next_page
     * @since windows6.0.6000
     */
    static ldap_get_next_page(ExternalHandle, SearchHandle, PageSize, MessageNumber) {
        result := DllCall("WLDAP32.dll\ldap_get_next_page", "ptr", ExternalHandle, "ptr", SearchHandle, "uint", PageSize, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Returns the next page in a sequence of synchronous paged search results.
     * @remarks
     * The <b>ldap_get_next_page_s</b> function is part of the interface for simple, synchronous paging of search results. Use the search handle returned from an initial call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_init_page">ldap_search_init_page</a> and specify, in the <i>PageSize</i> parameter, the number of entries to be returned in a page. Set <i>PageSize</i> to zero to quit a search.
     * 
     * The results returned from <b>ldap_get_next_page_s</b> can be handled as any other search result, and should be freed, when finished, by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>.
     * 
     * When parsing the results set, it is possible for the server to return an empty page of results and yet still respond with an <b>LDAP_SUCCESS</b> return code. This indicates that the server was unable to retrieve a page of results, due to a timeout or other reason,  but has not completed  the search request. The proper behavior in this instance is to continue to call <b>ldap_get_next_page_s</b> until either another page of results are successfully retrieved, an error code is returned, or <b>LDAP_NO_RESULTS_RETURNED</b> is returned to indicate the search is complete.
     * 
     * To retrieve paged search result asynchronously, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page">ldap_get_next_page</a>.
     * 
     * If <b>ldap_get_next_page_s</b> is used, it is not required that 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_paged_count">ldap_get_paged_count</a> is called to record the number of paged results returned by a server.
     * @param {Pointer<LDAP>} ExternalHandle Session handle.
     * @param {Pointer} SearchHandle Search block handle.
     * @param {Pointer<LDAP_TIMEVAL>} timeout The time value, in seconds, that the client will wait for the call to return.
     * @param {Integer} PageSize The number of entries to return in a single page.
     * @param {Pointer<UInt32>} TotalCount The server estimate of the total number of entries in the entire result set. A value of zero indicates that the server cannot provide an estimate.
     * @param {Pointer<LDAPMessage>} Results A pointer to the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure that contains the results.
     * @returns {Integer} If the server returns a null cookie (non-continuation), the value is <b>LDAP_NO_RESULTS_RETURNED</b>. Otherwise, the client signals a continuation (more data available) by returning <b>LDAP_SUCCESS</b>.
     * 
     * If the function otherwise fails, it returns the error code return value related to the failure. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_next_page_s
     * @since windows6.0.6000
     */
    static ldap_get_next_page_s(ExternalHandle, SearchHandle, timeout, PageSize, TotalCount, Results) {
        result := DllCall("WLDAP32.dll\ldap_get_next_page_s", "ptr", ExternalHandle, "ptr", SearchHandle, "ptr", timeout, "uint", PageSize, "ptr", TotalCount, "ptr", Results, "CDecl uint")
        return result
    }

    /**
     * Records the number of paged results that the server has returned for a search.
     * @remarks
     * Call <b>ldap_get_paged_count</b> for each  result set received after calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page">ldap_get_next_page</a>. This allows the LDAP runtime to save from the cookie that the server uses to track  the search.
     * 
     * If you call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_next_page_s">ldap_get_next_page_s</a>, a call to <b>ldap_get_paged_count</b> is not required.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer} SearchBlock Handle to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366129(v=vs.85)">LDAPSearch</a> structure.
     * @param {Pointer<UInt32>} TotalCount The total pages in the search results.
     * @param {Pointer<LDAPMessage>} Results A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure that contains the results of the operation.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_get_paged_count
     * @since windows6.0.6000
     */
    static ldap_get_paged_count(ExternalHandle, SearchBlock, TotalCount, Results) {
        result := DllCall("WLDAP32.dll\ldap_get_paged_count", "ptr", ExternalHandle, "ptr", SearchBlock, "ptr", TotalCount, "ptr", Results, "CDecl uint")
        return result
    }

    /**
     * The ldap_search_abandon_page function terminates a paged-results search.
     * @remarks
     * Call <b>ldap_search_abandon_page</b> after a search has completed (when the server returns <b>LDAP_NO_RESULTS_RETURNED</b>) to perform necessary cleanup. You can also use this function to abandon a search at any time after the search block has been allocated.
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer} SearchBlock A handle to the search block for the current search.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_search_abandon_page
     * @since windows6.0.6000
     */
    static ldap_search_abandon_page(ExternalHandle, SearchBlock) {
        result := DllCall("WLDAP32.dll\ldap_search_abandon_page", "ptr", ExternalHandle, "ptr", SearchBlock, "CDecl uint")
        return result
    }

    /**
     * The ldap_create_vlv_control function is used to create the request control (LDAP_CONTROL_VLVREQUEST) on the server. (Unicode)
     * @remarks
     * When a VLV search is conducted, the client must use this function to create a new VLV control that can be included in the search request sent to the server. The server will assign a contextID for this VLV search, passed to the client. When the VLV search is completed, you should use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_control_free">ldap_control_free</a> to free the control returned by <b>ldap_create_vlv_control</b>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_controls_free">ldap_controls_free</a> to free the  array of controls, including the VLV response control, returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * 
     * For more information, and  a code example for this function, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/example-code-for-using-ldap-vlv">Example Code for Using LDAP VLV</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_create_vlv_control as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle An LDAP session handle, as obtained from a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a>.
     * @param {Pointer<LDAPVLVInfo>} VlvInfo The address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapvlvinfo">LDAPVLVInfo</a> structure whose contents are used to construct the value of the control created.
     * @param {Integer} IsCritical If this value is not zero, the control created will have its criticality set to <b>TRUE</b>.
     * @param {Pointer<LDAPControlW>} Control A result parameter assigned the address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure that contains the request control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvrequest">LDAP_CONTROL_VLVREQUEST</a>) created by this function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_create_vlv_controlw
     * @since windows6.0.6000
     */
    static ldap_create_vlv_controlW(ExternalHandle, VlvInfo, IsCritical, Control) {
        DllCall("WLDAP32.dll\ldap_create_vlv_controlW", "ptr", ExternalHandle, "ptr", VlvInfo, "char", IsCritical, "ptr", Control, "CDecl ")
    }

    /**
     * The ldap_create_vlv_control function is used to create the request control (LDAP_CONTROL_VLVREQUEST) on the server. (ANSI)
     * @remarks
     * When a VLV search is conducted, the client must use this function to create a new VLV control that can be included in the search request sent to the server. The server will assign a contextID for this VLV search, passed to the client. When the VLV search is completed, you should use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_control_free">ldap_control_free</a> to free the control returned by <b>ldap_create_vlv_control</b>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_controls_free">ldap_controls_free</a> to free the  array of controls, including the VLV response control, returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * 
     * For more information, and  a code example for this function, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/example-code-for-using-ldap-vlv">Example Code for Using LDAP VLV</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_create_vlv_control as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle An LDAP session handle, as obtained from a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a>.
     * @param {Pointer<LDAPVLVInfo>} VlvInfo The address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapvlvinfo">LDAPVLVInfo</a> structure whose contents are used to construct the value of the control created.
     * @param {Integer} IsCritical If this value is not zero, the control created will have its criticality set to <b>TRUE</b>.
     * @param {Pointer<LDAPControlA>} Control A result parameter assigned the address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structure that contains the request control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvrequest">LDAP_CONTROL_VLVREQUEST</a>) created by this function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_create_vlv_controla
     * @since windows6.0.6000
     */
    static ldap_create_vlv_controlA(ExternalHandle, VlvInfo, IsCritical, Control) {
        DllCall("WLDAP32.dll\ldap_create_vlv_controlA", "ptr", ExternalHandle, "ptr", VlvInfo, "char", IsCritical, "ptr", Control, "CDecl ")
    }

    /**
     * Used to find and parse VLV search results. (Unicode)
     * @remarks
     * This control parses the search results returned by the server in the response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). A context identifier is passed from the server to the client to identify the control, which must be freed at the end of the session by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_bvfree">ber_bvfree</a>.
     * 
     * For more information and a code example, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/example-code-for-using-ldap-vlv">Example Code for Using LDAP VLV</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_parse_vlv_control as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The LDAP session handle.
     * @param {Pointer<LDAPControlW>} Control The address of a NULL-terminated array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures, typically obtained by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<UInt32>} TargetPos The numeric position of the target entry in the result set list, as provided by the targetPosition element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the target position is not returned.
     * @param {Pointer<UInt32>} ListCount The server estimate of the number of entries in the list as provided by the contentCount element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the size is not returned.
     * @param {Pointer<LDAP_BERVAL>} Context The server-generated context identifier. If the server does not return a context identifier, this parameter will be set to <b>NULL</b>. If <b>NULL</b> is passed for contextp, the context identifier is not returned.
     * @param {Pointer<Int32>} ErrCode The VLV result code, as provided by the virtualListViewResult element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the result code is not returned.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_vlv_controlw
     * @since windows6.0.6000
     */
    static ldap_parse_vlv_controlW(ExternalHandle, Control, TargetPos, ListCount, Context, ErrCode) {
        DllCall("WLDAP32.dll\ldap_parse_vlv_controlW", "ptr", ExternalHandle, "ptr", Control, "ptr", TargetPos, "ptr", ListCount, "ptr", Context, "ptr", ErrCode, "CDecl ")
    }

    /**
     * Used to find and parse VLV search results. (ANSI)
     * @remarks
     * This control parses the search results returned by the server in the response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). A context identifier is passed from the server to the client to identify the control, which must be freed at the end of the session by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_bvfree">ber_bvfree</a>.
     * 
     * For more information and a code example, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/example-code-for-using-ldap-vlv">Example Code for Using LDAP VLV</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_parse_vlv_control as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The LDAP session handle.
     * @param {Pointer<LDAPControlA>} Control The address of a NULL-terminated array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures, typically obtained by a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * @param {Pointer<UInt32>} TargetPos The numeric position of the target entry in the result set list, as provided by the targetPosition element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the target position is not returned.
     * @param {Pointer<UInt32>} ListCount The server estimate of the number of entries in the list as provided by the contentCount element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the size is not returned.
     * @param {Pointer<LDAP_BERVAL>} Context The server-generated context identifier. If the server does not return a context identifier, this parameter will be set to <b>NULL</b>. If <b>NULL</b> is passed for contextp, the context identifier is not returned.
     * @param {Pointer<Int32>} ErrCode The VLV result code, as provided by the virtualListViewResult element of the BER-encoded response control (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/ldap-control-vlvresponse">LDAP_CONTROL_VLVRESPONSE</a>). If this parameter is <b>NULL</b>, the result code is not returned.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_vlv_controla
     * @since windows6.0.6000
     */
    static ldap_parse_vlv_controlA(ExternalHandle, Control, TargetPos, ListCount, Context, ErrCode) {
        DllCall("WLDAP32.dll\ldap_parse_vlv_controlA", "ptr", ExternalHandle, "ptr", Control, "ptr", TargetPos, "ptr", ListCount, "ptr", Context, "ptr", ErrCode, "CDecl ")
    }

    /**
     * Used in an active LDAP session to begin using TLS encryption. (Unicode)
     * @remarks
     * The <b>ldap_start_tls_s</b> function is called on an existing LDAP session to initiate the use of  TLS (SSL) encryption. The connection must not already have TLS (SSL) encryption enabled, and neither signing nor sealing can already be enabled. Also, a bind cannot be currently in progress on the connection, nor can there be any outstanding LDAP requests on the connection. If these conditions are not met, <b>LDAP_UNWILLING_TO_PERFORM</b> is returned. If these conditions are met, the function will send the appropriate extended operation to the server to initiate TLS (SSL), and then negotiate the encryption with the server. If the server rejects the extended operation, <b>LDAP_OTHER</b> will be returned, and the <i>ServerReturnValue</i> should be checked to retrieve the server error code.
     * 
     * It is possible that the server will return a referral in response to this call. For security reasons, the referral will not be automatically chased. A pointer to the referral message is returned in the <i>result</i> parameter.
     * 
     * 
     * After <b>ldap_start_tls_s</b> is called, automatic referral chasing and autoreconnect are disabled on the connection. They will be restored to their previous settings upon successful completion of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_stop_tls_s">ldap_stop_tls_s</a> operation.
     * 
     * This function has a default timeout of about thirty seconds. That timeout is used in waiting for responses from the server for the Start TLS extended operation and during the TLS (SSL) negotiation.
     * 
     * For more information about start-stop TLS encryption, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/using-start-stop-tls-encryption">Using Start-Stop TLS Encryption</a>.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_start_tls_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle A pointer to an <b>LDAP</b> structure that represents the current session.
     * @param {Pointer<UInt32>} ServerReturnValue Optional. A pointer to a <b>ULONG</b> that may contain a server error code. This parameter should be consulted if <b>LDAP_OTHER</b> is returned in the return value.  Pass in <b>NULL</b> if you do not wish to use it.
     * @param {Pointer<LDAPMessage>} result Optional. A pointer to a pointer for an <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a>  structure that may contain a server referral message.  Pass in <b>NULL</b> if you do not wish to use it.
     * @param {Pointer<LDAPControlW>} ServerControls Optional. A NULL-terminated array of pointers to  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures that represent server controls.  Pass in <b>NULL</b> if you do not want to specify server  controls.
     * @param {Pointer<LDAPControlW>} ClientControls Optional. A NULL-terminated array of pointers to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures that represent client controls.  Pass in <b>NULL</b> if you do not want to specify client controls.
     * @returns {Integer} If the function call succeeds, <b>LDAP_SUCCESS</b> is returned. <b>LDAP_UNWILLING_TO_PERFORM</b> is returned if a TLD/SSL session is already in progress, or if a bind is currently in progress, or if there is an outstanding LDAP request on the connection. If the server rejects the extended operation, <b>LDAP_OTHER</b> is returned and the <i>ServerReturnValue</i> parameter should be checked for the server error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_start_tls_sw
     * @since windows6.0.6000
     */
    static ldap_start_tls_sW(ExternalHandle, ServerReturnValue, result, ServerControls, ClientControls) {
        result := DllCall("WLDAP32.dll\ldap_start_tls_sW", "ptr", ExternalHandle, "ptr", ServerReturnValue, "ptr", result, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * Used in an active LDAP session to begin using TLS encryption. (ANSI)
     * @remarks
     * The <b>ldap_start_tls_s</b> function is called on an existing LDAP session to initiate the use of  TLS (SSL) encryption. The connection must not already have TLS (SSL) encryption enabled, and neither signing nor sealing can already be enabled. Also, a bind cannot be currently in progress on the connection, nor can there be any outstanding LDAP requests on the connection. If these conditions are not met, <b>LDAP_UNWILLING_TO_PERFORM</b> is returned. If these conditions are met, the function will send the appropriate extended operation to the server to initiate TLS (SSL), and then negotiate the encryption with the server. If the server rejects the extended operation, <b>LDAP_OTHER</b> will be returned, and the <i>ServerReturnValue</i> should be checked to retrieve the server error code.
     * 
     * It is possible that the server will return a referral in response to this call. For security reasons, the referral will not be automatically chased. A pointer to the referral message is returned in the <i>result</i> parameter.
     * 
     * After <b>ldap_start_tls_s</b> is called, automatic referral chasing and autoreconnect are disabled on the connection. They will be restored to their previous settings upon successful completion of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_stop_tls_s">ldap_stop_tls_s</a> operation.
     * 
     * This function has a default timeout of about thirty seconds. That timeout is used in waiting for responses from the server for the Start TLS extended operation and during the TLS (SSL) negotiation.
     * 
     * For more information about start-stop TLS encryption, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/using-start-stop-tls-encryption">Using Start-Stop TLS Encryption</a>.
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_start_tls_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle A pointer to an <b>LDAP</b> structure that represents the current session.
     * @param {Pointer<UInt32>} ServerReturnValue Optional. A pointer to a <b>ULONG</b> that may contain a server error code. This parameter should be consulted if <b>LDAP_OTHER</b> is returned in the return value.  Pass in <b>NULL</b> if you do not wish to use it.
     * @param {Pointer<LDAPMessage>} result Optional. A pointer to a pointer for an <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a>  structure that may contain a server referral message.  Pass in <b>NULL</b> if you do not wish to use it.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. A NULL-terminated array of pointers to  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures that represent server controls.  Pass in <b>NULL</b> if you do not want to specify server  controls.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. A NULL-terminated array of pointers to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldapcontrola">LDAPControl</a> structures that represent client controls.  Pass in <b>NULL</b> if you do not want to specify client controls.
     * @returns {Integer} If the function call succeeds, <b>LDAP_SUCCESS</b> is returned. <b>LDAP_UNWILLING_TO_PERFORM</b> is returned if a TLD/SSL session is already in progress, or if a bind is currently in progress, or if there is an outstanding LDAP request on the connection. If the server rejects the extended operation, <b>LDAP_OTHER</b> is returned and the <i>ServerReturnValue</i> parameter should be checked for the server error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_start_tls_sa
     * @since windows6.0.6000
     */
    static ldap_start_tls_sA(ExternalHandle, ServerReturnValue, result, ServerControls, ClientControls) {
        result := DllCall("WLDAP32.dll\ldap_start_tls_sA", "ptr", ExternalHandle, "ptr", ServerReturnValue, "ptr", result, "ptr", ServerControls, "ptr", ClientControls, "CDecl uint")
        return result
    }

    /**
     * Stops the encryption operation started by a call to ldap_start_tls_s.
     * @remarks
     * The <b>ldap_stop_tls_s</b> function should only be called on a connection for which TLS (SSL) was established by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_start_tls_sa">ldap_start_tls_s</a>. It should not be called on a TLS (SSL) connection established by some other function, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_sslinit">ldap_sslinit</a>. Any outstanding requests on the connection will be abandoned before TLS encryption is terminated. If this function fails, that is, returns <b>FALSE</b>, close the connection by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind_s">ldap_unbind_s</a> because the connection can be left in an indeterminate state.
     * @param {Pointer<LDAP>} ExternalHandle A pointer to an <b>LDAP</b> structure that represents the current session.
     * @returns {Integer} Returns <b>TRUE</b> if the function call succeeds. Returns <b>FALSE</b> if a bind is currently in progress on the connection, if the connection is not actively connected to the server, or if TLS (SSL) negotiation is in progress on the connection.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_stop_tls_s
     * @since windows6.0.6000
     */
    static ldap_stop_tls_s(ExternalHandle) {
        result := DllCall("WLDAP32.dll\ldap_stop_tls_s", "ptr", ExternalHandle, "CDecl char")
        return result
    }

    /**
     * Returns the first reference from a message.
     * @remarks
     * Use <b>ldap_first_reference</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_reference">ldap_next_reference</a> to step through and retrieve a list of continuation references from a search result chain.
     * 
     * The function returns subordinate referrals (references) that are returned in search responses. A subordinate referral is one in which the server has returned some data and the referral has been passed to other naming contexts below the current level in the tree. To step through external references in which the naming context does not reside on the server, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> instead.
     * 
     * You do not have to explicitly free the returned reference as it is freed when the message itself is freed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} res The search result, as obtained by a call to one of the synchronous search routines or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_first_reference
     * @since windows6.0.6000
     */
    static ldap_first_reference(ld, res) {
        DllCall("WLDAP32.dll\ldap_first_reference", "ptr", ld, "ptr", res, "CDecl ")
    }

    /**
     * Retrieves a reference from a search result chain.
     * @remarks
     * Use <b>ldap_next_reference</b> in conjunction with 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_reference">ldap_first_reference</a> to step through and retrieve a list of continuation references from a search result chain.
     * 
     * The function returns subordinate referrals (references) that are returned in search responses. A subordinate referral is one in which the server has returned some data and the referral has been passed to other naming contexts below the current level in the tree. To step through external references in which the naming context does not reside on the server, use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a>.
     * 
     * You are not required to explicitly free the returned reference, as it is freed when the message itself is freed.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} entry The entry returned by a previous call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_reference">ldap_first_reference</a> or <b>ldap_next_reference</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_next_reference
     * @since windows6.0.6000
     */
    static ldap_next_reference(ld, entry) {
        DllCall("WLDAP32.dll\ldap_next_reference", "ptr", ld, "ptr", entry, "CDecl ")
    }

    /**
     * The ldap_count_references function counts the number of subordinate references that were returned by the server in a response to a search request.
     * @remarks
     * The <b>ldap_count_references</b> function returns the number of references contained in a chain of search results. It can also be used to count the number of references that remain in a chain. Call the function with the return value from 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_entry">ldap_first_entry</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_entry">ldap_next_entry</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_reference">ldap_first_reference</a>, 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_reference">ldap_next_reference</a>, or 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<LDAPMessage>} res The search result obtained by a call to one of the synchronous search routines or to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a>.
     * @returns {Integer} If the function succeeds, it returns the number of references.
     * 
     * If the function fails, it returns –1 and sets the session error parameters in the LDAP data structure.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_count_references
     * @since windows6.0.6000
     */
    static ldap_count_references(ld, res) {
        result := DllCall("WLDAP32.dll\ldap_count_references", "ptr", ld, "ptr", res, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_referenceW (Unicode) function (winldap.h) returns a list of subordinate referrals in a search response message.
     * @remarks
     * The <b>ldap_parse_reference</b> function returns a list of referrals in the form of URLs. Call this function if a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> indicates that there are referrals.
     * 
     * When it is no longer needed, free the <i>Referrals</i> pointer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_parse_reference as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure containing the search response.
     * @param {Pointer<PWSTR>} Referrals A pointer to the list of subordinate referrals. Free with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_referencew
     * @since windows6.0.6000
     */
    static ldap_parse_referenceW(Connection, ResultMessage, Referrals) {
        Referrals := Referrals is String? StrPtr(Referrals) : Referrals

        result := DllCall("WLDAP32.dll\ldap_parse_referenceW", "ptr", Connection, "ptr", ResultMessage, "ptr", Referrals, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_reference function returns a list of subordinate referrals in a search response message. (ldap_parse_referenceA)
     * @remarks
     * The <b>ldap_parse_reference</b> function returns a list of referrals in the form of URLs. Call this function if a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> indicates that there are referrals.
     * 
     * When it is no longer needed, free the <i>Referrals</i> pointer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure containing the search response.
     * @param {Pointer<PSTR>} Referrals A pointer to the list of subordinate referrals. Free with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_referencea
     * @since windows6.0.6000
     */
    static ldap_parse_referenceA(Connection, ResultMessage, Referrals) {
        Referrals := Referrals is String? StrPtr(Referrals) : Referrals

        result := DllCall("WLDAP32.dll\ldap_parse_referenceA", "ptr", Connection, "ptr", ResultMessage, "ptr", Referrals, "CDecl uint")
        return result
    }

    /**
     * The ldap_parse_reference function (winldap.h) returns a list of subordinate referrals in a search response message.
     * @remarks
     * The <b>ldap_parse_reference</b> function returns a list of referrals in the form of URLs. Call this function if a call to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_parse_result">ldap_parse_result</a> indicates that there are referrals.
     * 
     * When it is no longer needed, free the <i>Referrals</i> pointer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * @param {Pointer<LDAP>} Connection The session handle.
     * @param {Pointer<LDAPMessage>} ResultMessage A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> structure containing the search response.
     * @param {Pointer<PSTR>} Referrals A pointer to the list of subordinate referrals. Free with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_value_free">ldap_value_free</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_parse_reference
     * @since windows6.0.6000
     */
    static ldap_parse_reference(Connection, ResultMessage, Referrals) {
        Referrals := Referrals is String? StrPtr(Referrals) : Referrals

        result := DllCall("WLDAP32.dll\ldap_parse_reference", "ptr", Connection, "ptr", ResultMessage, "ptr", Referrals, "CDecl uint")
        return result
    }

    /**
     * The ldap_extended_operationW (Unicode) function (winldap.h) enables you to pass extended LDAP operations to the server.
     * @remarks
     * The <b>ldap_extended_operation</b> function enables a client to send an extended request (free for all) to an LDAP 3 (or later) server. The functionality is open and the client request can be for any operation.
     * 
     * As an asynchronous function, <b>ldap_extended_operation</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous operation, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * Because of the open nature of the request, the client must call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_close_extended_op">ldap_close_extended_op</a> to terminate the request.
     * 
     * Multithreading: The <b>ldap_extended_operation</b> function is thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_extended_operation as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PWSTR>} Oid A pointer to a null-terminated string that contains the dotted object identifier  text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<LDAPControlW>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<LDAPControlW>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_extended_operationw
     * @since windows6.0.6000
     */
    static ldap_extended_operationW(ld, Oid, Data, ServerControls, ClientControls, MessageNumber) {
        Oid := Oid is String? StrPtr(Oid) : Oid

        result := DllCall("WLDAP32.dll\ldap_extended_operationW", "ptr", ld, "ptr", Oid, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_extended_operation function enables you to pass extended LDAP operations to the server. (ldap_extended_operationA)
     * @remarks
     * The <b>ldap_extended_operation</b> function enables a client to send an extended request (free for all) to an LDAP 3 (or later) server. The functionality is open and the client request can be for any operation.
     * 
     * As an asynchronous function, <b>ldap_extended_operation</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous operation, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * Because of the open nature of the request, the client must call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_close_extended_op">ldap_close_extended_op</a> to terminate the request.
     * 
     * Multithreading: The <b>ldap_extended_operation</b> function is thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} Oid A pointer to a null-terminated string that contains the dotted object identifier  text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_extended_operationa
     * @since windows6.0.6000
     */
    static ldap_extended_operationA(ld, Oid, Data, ServerControls, ClientControls, MessageNumber) {
        Oid := Oid is String? StrPtr(Oid) : Oid

        result := DllCall("WLDAP32.dll\ldap_extended_operationA", "ptr", ld, "ptr", Oid, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * Used to pass extended LDAP operations to the server. (ANSI)
     * @remarks
     * The <b>ldap_extended_operation_s</b> function enables a client to send an extended request (free for all) to an LDAP 3 (or later) server. The functionality is open and the client request can be for any operation.
     * 
     * As a synchronous function, <b>ldap_extended_operation_s</b> returns any response data in the <i>ReturnedOid</i> and <i>ReturnedData</i> fields. When no longer required, free the <i>ReturnedOid</i> string and the <i>ReturnedData</i> buffer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.  Because <i>ReturnedData</i> is not a <b>PCHAR</b> data type, it must be explicitly cast when used as an argument of <b>ldap_memfree</b>, such as:
     * 
     * 
     * ```cpp
     * struct berval *pBV;
     * ldap_extended_operation_s(......., &pBV);
     * ... 
     * ldap_memfree( (PCHAR) pBV);
     * ```
     * 
     * 
     * Multithreading: The <b>ldap_extended_operation_s</b> function is thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_extended_operation_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PSTR>} Oid A pointer to a null-terminated string that contains the dotted object identifier (OID) text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<PSTR>} ReturnedOid Optional. A pointer to a null-terminated string that contains the dotted OID text string of the server response message.  This is normally the same OID  as that which names the request passed to the server in the <i>Oid</i> parameter. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP_BERVAL>} ReturnedData Optional. The arbitrary data returned by the extended operation. If <b>NULL</b>, no data is returned by the server. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_extended_operation_sa
     * @since windows6.0.6000
     */
    static ldap_extended_operation_sA(ExternalHandle, Oid, Data, ServerControls, ClientControls, ReturnedOid, ReturnedData) {
        Oid := Oid is String? StrPtr(Oid) : Oid
        ReturnedOid := ReturnedOid is String? StrPtr(ReturnedOid) : ReturnedOid

        result := DllCall("WLDAP32.dll\ldap_extended_operation_sA", "ptr", ExternalHandle, "ptr", Oid, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "ptr", ReturnedOid, "ptr", ReturnedData, "CDecl uint")
        return result
    }

    /**
     * Used to pass extended LDAP operations to the server. (Unicode)
     * @remarks
     * The <b>ldap_extended_operation_s</b> function enables a client to send an extended request (free for all) to an LDAP 3 (or later) server. The functionality is open and the client request can be for any operation.
     * 
     * As a synchronous function, <b>ldap_extended_operation_s</b> returns any response data in the <i>ReturnedOid</i> and <i>ReturnedData</i> fields. When no longer required, free the <i>ReturnedOid</i> string and the <i>ReturnedData</i> buffer by calling 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>.  Because <i>ReturnedData</i> is not a <b>PCHAR</b> data type, it must be explicitly cast when used as an argument of <b>ldap_memfree</b>, such as:
     * 
     * 
     * ```cpp
     * struct berval *pBV;
     * ldap_extended_operation_s(......., &pBV);
     * ... 
     * ldap_memfree( (PCHAR) pBV);
     * ```
     * 
     * 
     * Multithreading: The <b>ldap_extended_operation_s</b> function is thread-safe.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winldap.h header defines ldap_extended_operation_s as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LDAP>} ExternalHandle The session handle.
     * @param {Pointer<PWSTR>} Oid A pointer to a null-terminated string that contains the dotted object identifier (OID) text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<LDAPControlW>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<LDAPControlW>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b> if not used.
     * @param {Pointer<PWSTR>} ReturnedOid Optional. A pointer to a null-terminated string that contains the dotted OID text string of the server response message.  This is normally the same OID  as that which names the request passed to the server in the <i>Oid</i> parameter. Set to <b>NULL</b> if not used.
     * @param {Pointer<LDAP_BERVAL>} ReturnedData Optional. The arbitrary data returned by the extended operation. If <b>NULL</b>, no data is returned by the server. Set this parameter to <b>NULL</b> if not used.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_extended_operation_sw
     * @since windows6.0.6000
     */
    static ldap_extended_operation_sW(ExternalHandle, Oid, Data, ServerControls, ClientControls, ReturnedOid, ReturnedData) {
        Oid := Oid is String? StrPtr(Oid) : Oid
        ReturnedOid := ReturnedOid is String? StrPtr(ReturnedOid) : ReturnedOid

        result := DllCall("WLDAP32.dll\ldap_extended_operation_sW", "ptr", ExternalHandle, "ptr", Oid, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "ptr", ReturnedOid, "ptr", ReturnedData, "CDecl uint")
        return result
    }

    /**
     * The ldap_extended_operation function (winldap.h) enables you to pass extended LDAP operations to the server.
     * @remarks
     * The <b>ldap_extended_operation</b> function enables a client to send an extended request (free for all) to an LDAP 3 (or later) server. The functionality is open and the client request can be for any operation.
     * 
     * As an asynchronous function, <b>ldap_extended_operation</b> returns a message ID for the operation. Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> with the message ID to get the result of the operation. To cancel an asynchronous operation, call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_abandon">ldap_abandon</a>.
     * 
     * Because of the open nature of the request, the client must call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_close_extended_op">ldap_close_extended_op</a> to terminate the request.
     * 
     * Multithreading: The <b>ldap_extended_operation</b> function is thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Pointer<PSTR>} Oid A pointer to a null-terminated string that contains the dotted object identifier  text string that names the request.
     * @param {Pointer<LDAP_BERVAL>} Data The arbitrary data required by the operation. If <b>NULL</b>, no data is sent to the server.
     * @param {Pointer<LDAPControlA>} ServerControls Optional. A list of LDAP server controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<LDAPControlA>} ClientControls Optional. A list of client controls. Set this parameter to <b>NULL</b>, if not used.
     * @param {Pointer<UInt32>} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, <b>LDAP_SUCCESS</b> is returned.
     * 
     * If the function fails, an error code is returned. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_extended_operation
     * @since windows6.0.6000
     */
    static ldap_extended_operation(ld, Oid, Data, ServerControls, ClientControls, MessageNumber) {
        Oid := Oid is String? StrPtr(Oid) : Oid

        result := DllCall("WLDAP32.dll\ldap_extended_operation", "ptr", ld, "ptr", Oid, "ptr", Data, "ptr", ServerControls, "ptr", ClientControls, "ptr", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The ldap_close_extended_op function ends a request that was made by calling ldap_extended_operation.
     * @remarks
     * After sending an extended request, or a series of such requests, to an LDAP server, call <b>ldap_close_extended_op</b> to notify the server that the client has finished making requests. Be aware that these extended operation functions are available only with LDAP, version 3 or later. These functions allow a client to send a "free-for-all" request, for any sort of data or action, to an LDAP 3 server.
     * 
     * Multithreading: Calls to <b>ldap_close_extended_op</b> are thread-safe.
     * @param {Pointer<LDAP>} ld The session handle.
     * @param {Integer} MessageNumber The message ID for the request.
     * @returns {Integer} If the function succeeds, the return value is <b>LDAP_SUCCESS</b>.
     * 
     * If the function fails, it returns an error code. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_close_extended_op
     * @since windows6.0.6000
     */
    static ldap_close_extended_op(ld, MessageNumber) {
        result := DllCall("WLDAP32.dll\ldap_close_extended_op", "ptr", ld, "uint", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The LdapGetLastError function retrieves the last error code returned by an LDAP call.
     * @remarks
     * The <b>LdapGetLastError</b> function returns the LDAP error code for the last LDAP operation on the thread that is calling it. See 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/return-values">Return Values</a> for a list of possible error codes.
     * 
     * Multithreading: The <b>LdapGetLastError</b> function is thread-safe.
     * @returns {Integer} An LDAP error code.
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldapgetlasterror
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
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldapmaperrortowin32
     * @since windows6.0.6000
     */
    static LdapMapErrorToWin32(LdapError) {
        result := DllCall("WLDAP32.dll\LdapMapErrorToWin32", "uint", LdapError, "CDecl uint")
        return result
    }

    /**
     * Returns the LDAP session handle (connection pointer) for a particular message.
     * @remarks
     * This function is used to identify the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle associated with the specified <b>LDAP</b> message. It returns a valid <b>LDAP</b> session handle only if one of the following  conditions are met:
     * 
     * <ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldapmessage">LDAPMessage</a> originated from the same <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle passed to the function in the <i>PrimaryConn</i> parameter.</li>
     * 
     * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">LDAP_OPT_REF_DEREF_CONN_PER_MSG</a> session option was previously enabled on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session associated with the message.</li>
     * </ul>
     * If neither of these conditions are met, the function returns a <b>NULL</b> session handle.
     * @param {Pointer<LDAP>} PrimaryConn A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> session handle of the message, if known. If the <b>LDAP</b> session handle for the message is unknown, then <b>NULL</b> may be passed for this parameter provided that the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">LDAP_OPT_REF_DEREF_CONN_PER_MSG</a> session option had been previously set for the message session.
     * @param {Pointer<LDAPMessage>} res The <b>LDAP</b> message queried.  If <b>NULL</b> is passed for this parameter, then the function will respond with a <b>NULL</b> return value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winldap/nf-winldap-ldap_conn_from_msg
     * @since windows6.0.6000
     */
    static ldap_conn_from_msg(PrimaryConn, res) {
        DllCall("WLDAP32.dll\ldap_conn_from_msg", "ptr", PrimaryConn, "ptr", res, "CDecl ")
    }

    /**
     * The ber_init function allocates a new BerElement structure containing the data taken from the supplied berval structure.
     * @remarks
     * Call 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_free">ber_free</a> to free a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure allocated with this function.
     * @param {Pointer<LDAP_BERVAL>} pBerVal Pointer to the source <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_init
     * @since windows6.0.6000
     */
    static ber_init(pBerVal) {
        DllCall("WLDAP32.dll\ber_init", "ptr", pBerVal, "CDecl ")
    }

    /**
     * The ber_free function frees a BerElement structure that was previously allocated with ber_alloc_t, ber_init, or the ldap_first_attribute/ ldap_next_attribute search functions.
     * @param {Pointer<PSTR>} pBerElement Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure to be deallocated.
     * @param {Integer} fbuf Must be set to 0 if freeing structures allocated by 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a>/
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a>, otherwise it must be set to 1.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_free
     * @since windows6.0.6000
     */
    static ber_free(pBerElement, fbuf) {
        pBerElement := pBerElement is String? StrPtr(pBerElement) : pBerElement

        DllCall("WLDAP32.dll\ber_free", "ptr", pBerElement, "int", fbuf, "CDecl ")
    }

    /**
     * The ber_bvecfree function frees an array of berval structures.
     * @remarks
     * Use this function only to free an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_scanf">ber_scanf</a> with the <b>V</b> character included in the format string.
     * 
     * An application should not call this function to free a <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures that it has allocated.
     * @param {Pointer<LDAP_BERVAL>} pBerVal Pointer to a NULL-terminated array of <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structures to be deallocated.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_bvecfree
     * @since windows6.0.6000
     */
    static ber_bvecfree(pBerVal) {
        DllCall("WLDAP32.dll\ber_bvecfree", "ptr", pBerVal, "CDecl ")
    }

    /**
     * The ber_bvdup function creates a copy of the supplied berval structure.
     * @remarks
     * The allocated <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> should be freed with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_bvfree">ber_bvfree</a>.
     * @param {Pointer<LDAP_BERVAL>} pBerVal Pointer to the source <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure.
     * @returns {Pointer<LDAP_BERVAL>} If the function succeeds, the return value is a pointer to the newly allocated <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure.
     * 
     * If the function fails, it returns a <b>NULL</b> pointer.
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_bvdup
     * @since windows6.0.6000
     */
    static ber_bvdup(pBerVal) {
        result := DllCall("WLDAP32.dll\ber_bvdup", "ptr", pBerVal, "CDecl ptr")
        return result
    }

    /**
     * Allocates and constructs a new BerElement structure.
     * @remarks
     * The <b>LBER_USE_DER</b> option does not cause values of sets to be rearranged in tag and byte order or default values to be removed, so these functions are not sufficient for generating DER output as defined in X.509 and X.680. If the caller handles ordering values of sets correctly and removing default values, DER output as defined in X.509 and X.680 can be produced.
     * 
     * The allocated <b>BerElement</b> should be freed with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_free">ber_free</a>.
     * @param {Integer} options A bitwise OR of the options used to generate the encoding or decoding of the <b>BerElement</b>. The <b>LBER_USE_DER</b> flag (0x01) should always be specified, which causes the element lengths to be encoded in the minimum number of octets.
     * 
     * Unrecognized option bits are ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_alloc_t
     * @since windows6.0.6000
     */
    static ber_alloc_t(options) {
        DllCall("WLDAP32.dll\ber_alloc_t", "int", options, "CDecl ")
    }

    /**
     * The ber_skip_tag function skips the current tag and returns the tag of the next element in the supplied BerElement structure.
     * @remarks
     * This function is similar to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_peek_tag">ber_peek_tag</a>, except that the state pointer, in the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> argument, is advanced past the first tag and length, and is pointed to the value part of the next element. This routine should only be used with constructed types and situations when a BER encoding is used as the value of an OCTET STRING.
     * @param {Pointer<PSTR>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<UInt32>} pLen Returns the length of the skipped element.
     * @returns {Integer} Returns the tag of the next element in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. LBER_DEFAULT is returned if there is no further data to read.
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_skip_tag
     * @since windows6.0.6000
     */
    static ber_skip_tag(pBerElement, pLen) {
        pBerElement := pBerElement is String? StrPtr(pBerElement) : pBerElement

        result := DllCall("WLDAP32.dll\ber_skip_tag", "ptr", pBerElement, "ptr", pLen, "CDecl uint")
        return result
    }

    /**
     * Returns the tag of the next element to be parsed in the supplied BerElement structure.
     * @remarks
     * The decoding position within the <i>pBerElement</i> parameter is unchanged by this call; that is, the fact that <b>ber_peek_tag</b> has been called does not affect future use of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<PSTR>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<UInt32>} pLen Returns the length of the next element to be parsed.
     * @returns {Integer} Returns the tag of the next element to be read in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. LBER_DEFAULT is returned if there is no further data to be read.
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_peek_tag
     * @since windows6.0.6000
     */
    static ber_peek_tag(pBerElement, pLen) {
        pBerElement := pBerElement is String? StrPtr(pBerElement) : pBerElement

        result := DllCall("WLDAP32.dll\ber_peek_tag", "ptr", pBerElement, "ptr", pLen, "CDecl uint")
        return result
    }

    /**
     * The ber_first_element function is used to begin the traversal of a SET, SET OF, SEQUENCE or SEQUENCE OF data value stored in the supplied BerElement structure. It returns the tag and length of the first element.
     * @remarks
     * The <i>pLen</i> and <i>ppOpaque</i> values returned by the function are internal parsing state values, and should not be used by applications other than as arguments to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_next_element">ber_next_element</a>.
     * @param {Pointer<PSTR>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<UInt32>} pLen Returns the length of the next element to be parsed.
     * @param {Pointer<SByte>} ppOpaque Returns a pointer to a cookie that is passed to subsequent calls of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_next_element">ber_next_element</a> function.
     * @returns {Integer} Returns the tag of the next element to be read in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. LBER_DEFAULT is returned if there is no further data to be read.
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_first_element
     * @since windows6.0.6000
     */
    static ber_first_element(pBerElement, pLen, ppOpaque) {
        pBerElement := pBerElement is String? StrPtr(pBerElement) : pBerElement

        result := DllCall("WLDAP32.dll\ber_first_element", "ptr", pBerElement, "ptr", pLen, "ptr", ppOpaque, "CDecl uint")
        return result
    }

    /**
     * The ber_next_element function is used along with ber_first_element to traverse a SET, SET OF, SEQUENCE or SEQUENCE OF data value stored in the supplied BerElement structure. It returns the tag and length of the next element in the constructed type.
     * @remarks
     * The <i>pLen</i> and <i>opaque</i> pointer values returned by the function are internal parsing state values, and should not be used by applications other than as arguments to subsequent calls of this function.
     * @param {Pointer<PSTR>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<UInt32>} pLen Returns the length of the next element to be parsed.
     * @param {Pointer<PSTR>} opaque An opaque cookie used internally that was returned by the initial call to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_first_element">ber_first_element</a> function.
     * @returns {Integer} Returns the tag of the next element to be read in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure. LBER_DEFAULT is returned if there is no further data to be read.
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_next_element
     * @since windows6.0.6000
     */
    static ber_next_element(pBerElement, pLen, opaque) {
        pBerElement := pBerElement is String? StrPtr(pBerElement) : pBerElement
        opaque := opaque is String? StrPtr(opaque) : opaque

        result := DllCall("WLDAP32.dll\ber_next_element", "ptr", pBerElement, "ptr", pLen, "ptr", opaque, "CDecl uint")
        return result
    }

    /**
     * The ber_flatten function allocates a new berval structure containing the data taken from the supplied BerElement structure.
     * @remarks
     * The use of <b>ber_flatten</b> on a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> in which all <b>{</b> and <b>}</b> format modifiers have not been properly matched will cause the function to return an error.
     * @param {Pointer<PSTR>} pBerElement Pointer to the source <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<LDAP_BERVAL>} pBerVal Pointer to the newly allocated <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval</a> structure, which should be freed using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_bvfree">ber_bvfree</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_flatten
     * @since windows6.0.6000
     */
    static ber_flatten(pBerElement, pBerVal) {
        pBerElement := pBerElement is String? StrPtr(pBerElement) : pBerElement

        DllCall("WLDAP32.dll\ber_flatten", "ptr", pBerElement, "ptr", pBerVal, "CDecl ")
    }

    /**
     * Used to encode a BER element and is similar to sprintf_s.
     * @remarks
     * The format string can contain format characters listed in the following table.
     * 
     * <table>
     * <tr>
     * <th> Character</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>t</b></td>
     * <td><b>Tag</b>. The next argument is a <b>ber_tag_t</b> that specifies the tag to override the next element written to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a>. This works across calls.</td>
     * </tr>
     * <tr>
     * <td><b>b</b></td>
     * <td><b>Boolean</b>. The next argument is an <b>ber_int_t</b>, that contains either 0 for <b>FALSE</b> or 1 for <b>TRUE</b>. A Boolean element is output. If this format character is not preceded by the <b>t</b> format modifier, the tag 0x01U is used for the element.</td>
     * </tr>
     * <tr>
     * <td><b>e</b></td>
     * <td><b>Enumerated</b>. The next argument is a <b>ber_int_t</b>, that contains the enumerated value. An enumerated element is output. If this format character is not preceded by the <b>t</b> format modifier, the tag 0x0AU is used for the element.</td>
     * </tr>
     * <tr>
     * <td><b>i</b></td>
     * <td><b>Integer</b>. The next argument is a <b>ber_int_t</b>, that contains the integer value. An integer element is output. If this format character is not preceded by the <b>t</b> format modifier, the tag 0x02U is used for the element.</td>
     * </tr>
     * <tr>
     * <td><b>n</b></td>
     * <td><b>Null</b>. No argument is required. An ASN.1 NULL element is output. If this format character is not preceded by the <b>t</b> format modifier, the tag 0x05U is used for the element.</td>
     * </tr>
     * <tr>
     * <td><b>o</b></td>
     * <td><b>Octet string</b>. The next two arguments are a <b>char*</b>, followed by a <b>ber_len_t</b> with the length of the string. The string may contain <b>NULL</b> bytes and do not have to be zero-terminated. An octet string element is output and no character format conversions on the string data is performed. Passing a <b>NULL</b> pointer followed by a length of 0 is acceptable if a <b>NULL</b> octet string element is required. If this format character is not preceded by the <b>t</b> format modifier, the tag 0x04U is used for the element.</td>
     * </tr>
     * <tr>
     * <td><b>s</b></td>
     * <td><b>Octet string</b>. The next argument is a <b>char*</b> pointing to a zero-terminated ANSI character string.     The ANSI string characters are converted to UTF-8 format and an octet string element is output, which does not include the trailing '\0' (null) byte.  Passing a <b>NULL</b> pointer is acceptable if a <b>NULL</b> octet string element is required. If this format character is not preceded by the <b>t</b> format modifier, the tag 0x04U is used for the element.</td>
     * </tr>
     * <tr>
     * <td><b>v</b></td>
     * <td><b>Several octet strings</b>. The next argument is a <b>char**</b>, an array of <b>char*</b> pointers to zero-terminated ANSI strings. The last element in the array must be a <b>NULL</b> pointer. The octet strings do not include the trailing '\0' (null) byte. Be aware that a construct like <b>{</b><b>v</b><b>}</b> is used to get an actual SEQUENCE OF octet strings. The <b>t</b> format modifier cannot be used with this format character.</td>
     * </tr>
     * <tr>
     * <td><b>V</b></td>
     * <td><b>Several octet strings</b>. A NULL-terminated array of <a href="https://docs.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_berval">berval*</a> is supplied. Be aware that a construct like <b>{</b><b>v</b><b>}</b> is used to get an actual SEQUENCE OF octet strings. The <b>t</b> format modifier cannot be used with this format character.</td>
     * </tr>
     * <tr>
     * <td><b>X</b></td>
     * <td><b>Bitstring</b>. The next two arguments are a <b>char*</b> pointer to the start of the bitstring, followed by a <b>ber_len_t</b> that contains the number of bits in the bitstring. A bitstring element is output. If this format character is not preceded by the <b>t</b> format modifier, the tag 0x03U is used for the element.</td>
     * </tr>
     * <tr>
     * <td><b>{</b></td>
     * <td><b>Begin sequence</b>. No argument is required. If this format character is not preceded by the <b>t</b> format modifier, the tag 0x30U is used.</td>
     * </tr>
     * <tr>
     * <td><b>}</b></td>
     * <td><b>End sequence</b>. No argument is required. The <b>t</b> format modifier cannot be used with this format character.</td>
     * </tr>
     * <tr>
     * <td><b>[</b></td>
     * <td><b>Begin set</b>. No argument is required. If this format character is not preceded by the <b>t</b> format modifier, the tag 0x31U is used.</td>
     * </tr>
     * <tr>
     * <td><b>]</b></td>
     * <td><b>End set</b>. No argument is required. The <b>t</b> format modifier cannot be used with this format character.</td>
     * </tr>
     * </table>
     *  
     * 
     * Each left brace (<b>{</b>) character must be paired with a right brace (<b>}</b>) character later in the format string, or in the format string of a subsequent call to <b>ber_printf</b> for that specific <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a>. The same applies to the left bracket ([) character and right bracket (]) characters.
     * @param {Pointer<PSTR>} pBerElement A pointer to the encoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<PSTR>} fmt An encoding format string. For more information, see Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_printf
     * @since windows6.0.6000
     */
    static ber_printf(pBerElement, fmt) {
        pBerElement := pBerElement is String? StrPtr(pBerElement) : pBerElement
        fmt := fmt is String? StrPtr(fmt) : fmt

        DllCall("WLDAP32.dll\ber_printf", "ptr", pBerElement, "ptr", fmt, "CDecl ")
    }

    /**
     * The ber_scanf function decodes a BER element in a similar manner as sscanf_s.
     * @remarks
     * The function interprets the bytes according to the format string <i>fmt</i>, and stores the results in its additional arguments. The format string contains conversion specifications used to direct the interpretation of the BER element. The format string can contain characters listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Character</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>a</b></td>
     * <td><b>Octet string</b>. A <b>char**</b> argument must be supplied. Memory is allocated, filled with the contents of the octet string, zero-terminated, and the pointer to the string is stored in the argument. The returned value should be freed using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a>. The tag of the element must indicate the primitive form (constructed strings are not supported), but is otherwise ignored and discarded during the decoding. This format cannot be used with octet strings which could contain null bytes.</td>
     * </tr>
     * <tr>
     * <td><b>O</b></td>
     * <td><b>Octet string</b>. A <b>berval**</b> argument must be supplied, which upon return points to an allocated <b>berval</b> that contains the octet string and its length. 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_bvfree">ber_bvfree</a> should be called to free the allocated memory. The tag of the element must indicate the primitive form (constructed strings are not supported), but is otherwise ignored during the decoding.</td>
     * </tr>
     * <tr>
     * <td><b>b</b></td>
     * <td><b>Boolean</b>. A pointer to a <b>ber_int_t</b> must be supplied. The <b>ber_int_t</b> value stored will be 0 for FALSE or nonzero for TRUE. The tag of the element must indicate the primitive form, but is otherwise ignored during the decoding.</td>
     * </tr>
     * <tr>
     * <td><b>e</b></td>
     * <td><b>Enumerated</b>. A pointer to a <b>ber_int_t</b> must be supplied. The tag of the element must indicate the primitive form but is otherwise ignored during the decoding. <b>ber_scanf</b> will return an error if the value of the enumerated value cannot be stored in a <b>ber_int_t</b>.</td>
     * </tr>
     * <tr>
     * <td><b>i</b></td>
     * <td><b>Integer</b>. A pointer to a <b>ber_int_t</b> must be supplied. The tag of the element must indicate the primitive form, but is otherwise ignored during decoding. <b>ber_scanf</b> will return an error if the integer cannot be stored in a <b>ber_int_t</b>.</td>
     * </tr>
     * <tr>
     * <td><b>B</b></td>
     * <td><b>Bitstring</b>. A <b>char**</b> argument must be supplied which will point to the allocated bits, followed by a <b>ber_len_t</b> * argument, which will point to the length (in bits) of the bitstring returned. 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> should be called to free the bitstring. The tag of the element must indicate the primitive form (constructed bitstrings are not supported), but is otherwise ignored during the decoding.</td>
     * </tr>
     * <tr>
     * <td><b>n</b></td>
     * <td><b>Null</b>. No argument is required. The element is verified to have a zero-length value and is skipped. The tag is ignored.</td>
     * </tr>
     * <tr>
     * <td><b>t</b></td>
     * <td><b>Tag</b>. A pointer to a <b>ber_tag_t</b> must be supplied. The <b>ber_tag_t</b> value stored will be the tag of the next element in the <i>pBerElement</i>, represented so it can be written using the <b>t</b> format of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_printf">ber_printf</a>. The decoding position within the <i>pBerElement</i> argument is unchanged by this.</td>
     * </tr>
     * <tr>
     * <td><b>v</b></td>
     * <td><b>Several octet strings</b>. A <b>char***</b> argument must be supplied, which upon return points to an allocated null-terminated array of char *'s that contain the octet strings. <b>NULL</b> is stored if the sequence is empty. 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_memfree">ldap_memfree</a> should be called to free each element of the array and the array itself. The tag of the sequence and of the octet strings are ignored.</td>
     * </tr>
     * <tr>
     * <td><b>V</b></td>
     * <td><b>Several octet strings</b> (which could contain null bytes). A <b>berval***</b> must be supplied, which upon return points to an allocated NULL-terminated array of <b>berval*</b>'s containing the octet strings and their lengths. <b>NULL</b> is stored if the sequence is empty. 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_bvecfree">ber_bvecfree</a> can be called to free the allocated memory. The tag of the sequence and of the octet strings are ignored.</td>
     * </tr>
     * <tr>
     * <td><b>x</b></td>
     * <td><b>Skip element</b>. The next element is skipped. No argument is required.</td>
     * </tr>
     * <tr>
     * <td><b>{</b></td>
     * <td><b>Begin sequence</b>. No argument is required. The initial sequence tag and length are skipped.</td>
     * </tr>
     * <tr>
     * <td><b>}</b></td>
     * <td><b>End sequence</b>. No argument is required.</td>
     * </tr>
     * <tr>
     * <td><b>[</b></td>
     * <td><b>Begin set</b>. No argument is required. The initial set tag and length are skipped.</td>
     * </tr>
     * <tr>
     * <td><b>]</b></td>
     * <td><b>End set</b>. No argument is required.</td>
     * </tr>
     * </table>
     * @param {Pointer<PSTR>} pBerElement Pointer to the decoded <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-berelement">BerElement</a> structure.
     * @param {Pointer<PSTR>} fmt Encoding format string. For more information, see Remarks section.
     * @returns {Integer} On error, the function returns LBER_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/winber/nf-winber-ber_scanf
     * @since windows6.0.6000
     */
    static ber_scanf(pBerElement, fmt) {
        pBerElement := pBerElement is String? StrPtr(pBerElement) : pBerElement
        fmt := fmt is String? StrPtr(fmt) : fmt

        result := DllCall("WLDAP32.dll\ber_scanf", "ptr", pBerElement, "ptr", fmt, "CDecl uint")
        return result
    }

;@endregion Methods
}
