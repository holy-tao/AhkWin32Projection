#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Ldap
 */
class LDAP_RETCODE extends Win32Enum {

    /**
     * Native name: LDAP_SUCCESS
     * @type {Integer (Int32)}
     */
    static SUCCESS => 0

    /**
     * Native name: LDAP_OPERATIONS_ERROR
     * @type {Integer (Int32)}
     */
    static OPERATIONS_ERROR => 1

    /**
     * Native name: LDAP_PROTOCOL_ERROR
     * @type {Integer (Int32)}
     */
    static PROTOCOL_ERROR => 2

    /**
     * Native name: LDAP_TIMELIMIT_EXCEEDED
     * @type {Integer (Int32)}
     */
    static TIMELIMIT_EXCEEDED => 3

    /**
     * Native name: LDAP_SIZELIMIT_EXCEEDED
     * @type {Integer (Int32)}
     */
    static SIZELIMIT_EXCEEDED => 4

    /**
     * Native name: LDAP_COMPARE_FALSE
     * @type {Integer (Int32)}
     */
    static COMPARE_FALSE => 5

    /**
     * Native name: LDAP_COMPARE_TRUE
     * @type {Integer (Int32)}
     */
    static COMPARE_TRUE => 6

    /**
     * Native name: LDAP_AUTH_METHOD_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static AUTH_METHOD_NOT_SUPPORTED => 7

    /**
     * Native name: LDAP_STRONG_AUTH_REQUIRED
     * @type {Integer (Int32)}
     */
    static STRONG_AUTH_REQUIRED => 8

    /**
     * Native name: LDAP_REFERRAL_V2
     * @type {Integer (Int32)}
     */
    static REFERRAL_V2 => 9

    /**
     * Native name: LDAP_PARTIAL_RESULTS
     * @type {Integer (Int32)}
     */
    static PARTIAL_RESULTS => 9

    /**
     * Native name: LDAP_REFERRAL
     * @type {Integer (Int32)}
     */
    static REFERRAL => 10

    /**
     * Native name: LDAP_ADMIN_LIMIT_EXCEEDED
     * @type {Integer (Int32)}
     */
    static ADMIN_LIMIT_EXCEEDED => 11

    /**
     * Native name: LDAP_UNAVAILABLE_CRIT_EXTENSION
     * @type {Integer (Int32)}
     */
    static UNAVAILABLE_CRIT_EXTENSION => 12

    /**
     * Native name: LDAP_CONFIDENTIALITY_REQUIRED
     * @type {Integer (Int32)}
     */
    static CONFIDENTIALITY_REQUIRED => 13

    /**
     * Native name: LDAP_SASL_BIND_IN_PROGRESS
     * @type {Integer (Int32)}
     */
    static SASL_BIND_IN_PROGRESS => 14

    /**
     * Native name: LDAP_NO_SUCH_ATTRIBUTE
     * @type {Integer (Int32)}
     */
    static NO_SUCH_ATTRIBUTE => 16

    /**
     * Native name: LDAP_UNDEFINED_TYPE
     * @type {Integer (Int32)}
     */
    static UNDEFINED_TYPE => 17

    /**
     * Native name: LDAP_INAPPROPRIATE_MATCHING
     * @type {Integer (Int32)}
     */
    static INAPPROPRIATE_MATCHING => 18

    /**
     * Native name: LDAP_CONSTRAINT_VIOLATION
     * @type {Integer (Int32)}
     */
    static CONSTRAINT_VIOLATION => 19

    /**
     * Native name: LDAP_ATTRIBUTE_OR_VALUE_EXISTS
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_OR_VALUE_EXISTS => 20

    /**
     * Native name: LDAP_INVALID_SYNTAX
     * @type {Integer (Int32)}
     */
    static INVALID_SYNTAX => 21

    /**
     * Native name: LDAP_NO_SUCH_OBJECT
     * @type {Integer (Int32)}
     */
    static NO_SUCH_OBJECT => 32

    /**
     * Native name: LDAP_ALIAS_PROBLEM
     * @type {Integer (Int32)}
     */
    static ALIAS_PROBLEM => 33

    /**
     * Native name: LDAP_INVALID_DN_SYNTAX
     * @type {Integer (Int32)}
     */
    static INVALID_DN_SYNTAX => 34

    /**
     * Native name: LDAP_IS_LEAF
     * @type {Integer (Int32)}
     */
    static IS_LEAF => 35

    /**
     * Native name: LDAP_ALIAS_DEREF_PROBLEM
     * @type {Integer (Int32)}
     */
    static ALIAS_DEREF_PROBLEM => 36

    /**
     * Native name: LDAP_INAPPROPRIATE_AUTH
     * @type {Integer (Int32)}
     */
    static INAPPROPRIATE_AUTH => 48

    /**
     * Native name: LDAP_INVALID_CREDENTIALS
     * @type {Integer (Int32)}
     */
    static INVALID_CREDENTIALS => 49

    /**
     * Native name: LDAP_INSUFFICIENT_RIGHTS
     * @type {Integer (Int32)}
     */
    static INSUFFICIENT_RIGHTS => 50

    /**
     * Native name: LDAP_BUSY
     * @type {Integer (Int32)}
     */
    static BUSY => 51

    /**
     * Native name: LDAP_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static UNAVAILABLE => 52

    /**
     * Native name: LDAP_UNWILLING_TO_PERFORM
     * @type {Integer (Int32)}
     */
    static UNWILLING_TO_PERFORM => 53

    /**
     * Native name: LDAP_LOOP_DETECT
     * @type {Integer (Int32)}
     */
    static LOOP_DETECT => 54

    /**
     * Native name: LDAP_SORT_CONTROL_MISSING
     * @type {Integer (Int32)}
     */
    static SORT_CONTROL_MISSING => 60

    /**
     * Native name: LDAP_OFFSET_RANGE_ERROR
     * @type {Integer (Int32)}
     */
    static OFFSET_RANGE_ERROR => 61

    /**
     * Native name: LDAP_NAMING_VIOLATION
     * @type {Integer (Int32)}
     */
    static NAMING_VIOLATION => 64

    /**
     * Native name: LDAP_OBJECT_CLASS_VIOLATION
     * @type {Integer (Int32)}
     */
    static OBJECT_CLASS_VIOLATION => 65

    /**
     * Native name: LDAP_NOT_ALLOWED_ON_NONLEAF
     * @type {Integer (Int32)}
     */
    static NOT_ALLOWED_ON_NONLEAF => 66

    /**
     * Native name: LDAP_NOT_ALLOWED_ON_RDN
     * @type {Integer (Int32)}
     */
    static NOT_ALLOWED_ON_RDN => 67

    /**
     * Native name: LDAP_ALREADY_EXISTS
     * @type {Integer (Int32)}
     */
    static ALREADY_EXISTS => 68

    /**
     * Native name: LDAP_NO_OBJECT_CLASS_MODS
     * @type {Integer (Int32)}
     */
    static NO_OBJECT_CLASS_MODS => 69

    /**
     * Native name: LDAP_RESULTS_TOO_LARGE
     * @type {Integer (Int32)}
     */
    static RESULTS_TOO_LARGE => 70

    /**
     * Native name: LDAP_AFFECTS_MULTIPLE_DSAS
     * @type {Integer (Int32)}
     */
    static AFFECTS_MULTIPLE_DSAS => 71

    /**
     * Native name: LDAP_VIRTUAL_LIST_VIEW_ERROR
     * @type {Integer (Int32)}
     */
    static VIRTUAL_LIST_VIEW_ERROR => 76

    /**
     * Native name: LDAP_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 80

    /**
     * Native name: LDAP_SERVER_DOWN
     * @type {Integer (Int32)}
     */
    static SERVER_DOWN => 81

    /**
     * Native name: LDAP_LOCAL_ERROR
     * @type {Integer (Int32)}
     */
    static LOCAL_ERROR => 82

    /**
     * Native name: LDAP_ENCODING_ERROR
     * @type {Integer (Int32)}
     */
    static ENCODING_ERROR => 83

    /**
     * Native name: LDAP_DECODING_ERROR
     * @type {Integer (Int32)}
     */
    static DECODING_ERROR => 84

    /**
     * Native name: LDAP_TIMEOUT
     * @type {Integer (Int32)}
     */
    static TIMEOUT => 85

    /**
     * Native name: LDAP_AUTH_UNKNOWN
     * @type {Integer (Int32)}
     */
    static AUTH_UNKNOWN => 86

    /**
     * Native name: LDAP_FILTER_ERROR
     * @type {Integer (Int32)}
     */
    static FILTER_ERROR => 87

    /**
     * Native name: LDAP_USER_CANCELLED
     * @type {Integer (Int32)}
     */
    static USER_CANCELLED => 88

    /**
     * Native name: LDAP_PARAM_ERROR
     * @type {Integer (Int32)}
     */
    static PARAM_ERROR => 89

    /**
     * Native name: LDAP_NO_MEMORY
     * @type {Integer (Int32)}
     */
    static NO_MEMORY => 90

    /**
     * Native name: LDAP_CONNECT_ERROR
     * @type {Integer (Int32)}
     */
    static CONNECT_ERROR => 91

    /**
     * Native name: LDAP_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 92

    /**
     * Native name: LDAP_NO_RESULTS_RETURNED
     * @type {Integer (Int32)}
     */
    static NO_RESULTS_RETURNED => 94

    /**
     * Native name: LDAP_CONTROL_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static CONTROL_NOT_FOUND => 93

    /**
     * Native name: LDAP_MORE_RESULTS_TO_RETURN
     * @type {Integer (Int32)}
     */
    static MORE_RESULTS_TO_RETURN => 95

    /**
     * Native name: LDAP_CLIENT_LOOP
     * @type {Integer (Int32)}
     */
    static CLIENT_LOOP => 96

    /**
     * Native name: LDAP_REFERRAL_LIMIT_EXCEEDED
     * @type {Integer (Int32)}
     */
    static REFERRAL_LIMIT_EXCEEDED => 97
}
