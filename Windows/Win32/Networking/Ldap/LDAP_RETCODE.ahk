#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class LDAP_RETCODE{

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SUCCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_OPERATIONS_ERROR => 1

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_PROTOCOL_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_TIMELIMIT_EXCEEDED => 3

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SIZELIMIT_EXCEEDED => 4

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_COMPARE_FALSE => 5

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_COMPARE_TRUE => 6

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_AUTH_METHOD_NOT_SUPPORTED => 7

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_STRONG_AUTH_REQUIRED => 8

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_REFERRAL_V2 => 9

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_PARTIAL_RESULTS => 9

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_REFERRAL => 10

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_ADMIN_LIMIT_EXCEEDED => 11

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_UNAVAILABLE_CRIT_EXTENSION => 12

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_CONFIDENTIALITY_REQUIRED => 13

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SASL_BIND_IN_PROGRESS => 14

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_NO_SUCH_ATTRIBUTE => 16

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_UNDEFINED_TYPE => 17

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_INAPPROPRIATE_MATCHING => 18

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_CONSTRAINT_VIOLATION => 19

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_ATTRIBUTE_OR_VALUE_EXISTS => 20

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_INVALID_SYNTAX => 21

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_NO_SUCH_OBJECT => 32

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_ALIAS_PROBLEM => 33

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_INVALID_DN_SYNTAX => 34

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_IS_LEAF => 35

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_ALIAS_DEREF_PROBLEM => 36

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_INAPPROPRIATE_AUTH => 48

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_INVALID_CREDENTIALS => 49

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_INSUFFICIENT_RIGHTS => 50

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_BUSY => 51

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_UNAVAILABLE => 52

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_UNWILLING_TO_PERFORM => 53

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_LOOP_DETECT => 54

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SORT_CONTROL_MISSING => 60

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_OFFSET_RANGE_ERROR => 61

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_NAMING_VIOLATION => 64

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_OBJECT_CLASS_VIOLATION => 65

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_NOT_ALLOWED_ON_NONLEAF => 66

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_NOT_ALLOWED_ON_RDN => 67

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_ALREADY_EXISTS => 68

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_NO_OBJECT_CLASS_MODS => 69

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_RESULTS_TOO_LARGE => 70

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_AFFECTS_MULTIPLE_DSAS => 71

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_VIRTUAL_LIST_VIEW_ERROR => 76

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_OTHER => 80

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_SERVER_DOWN => 81

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_LOCAL_ERROR => 82

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_ENCODING_ERROR => 83

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_DECODING_ERROR => 84

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_TIMEOUT => 85

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_AUTH_UNKNOWN => 86

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_FILTER_ERROR => 87

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_USER_CANCELLED => 88

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_PARAM_ERROR => 89

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_NO_MEMORY => 90

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_CONNECT_ERROR => 91

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_NOT_SUPPORTED => 92

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_NO_RESULTS_RETURNED => 94

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_CONTROL_NOT_FOUND => 93

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_MORE_RESULTS_TO_RETURN => 95

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_CLIENT_LOOP => 96

    /**
     * @type {Integer (Int32)}
     */
    static LDAP_REFERRAL_LIMIT_EXCEEDED => 97
}
