#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WMIQ_RPNF_FEATURE extends Win32Enum {

    /**
     * Native name: WMIQ_RPNF_WHERE_CLAUSE_PRESENT
     * @type {Integer (Int32)}
     */
    static WHERE_CLAUSE_PRESENT => 1

    /**
     * Native name: WMIQ_RPNF_QUERY_IS_CONJUNCTIVE
     * @type {Integer (Int32)}
     */
    static QUERY_IS_CONJUNCTIVE => 2

    /**
     * Native name: WMIQ_RPNF_QUERY_IS_DISJUNCTIVE
     * @type {Integer (Int32)}
     */
    static QUERY_IS_DISJUNCTIVE => 4

    /**
     * Native name: WMIQ_RPNF_PROJECTION
     * @type {Integer (Int32)}
     */
    static PROJECTION => 8

    /**
     * Native name: WMIQ_RPNF_FEATURE_SELECT_STAR
     * @type {Integer (Int32)}
     */
    static SELECT_STAR => 16

    /**
     * Native name: WMIQ_RPNF_EQUALITY_TESTS_ONLY
     * @type {Integer (Int32)}
     */
    static EQUALITY_TESTS_ONLY => 32

    /**
     * Native name: WMIQ_RPNF_COUNT_STAR
     * @type {Integer (Int32)}
     */
    static COUNT_STAR => 64

    /**
     * Native name: WMIQ_RPNF_QUALIFIED_NAMES_USED
     * @type {Integer (Int32)}
     */
    static QUALIFIED_NAMES_USED => 128

    /**
     * Native name: WMIQ_RPNF_SYSPROP_CLASS_USED
     * @type {Integer (Int32)}
     */
    static SYSPROP_CLASS_USED => 256

    /**
     * Native name: WMIQ_RPNF_PROP_TO_PROP_TESTS
     * @type {Integer (Int32)}
     */
    static PROP_TO_PROP_TESTS => 512

    /**
     * Native name: WMIQ_RPNF_ORDER_BY
     * @type {Integer (Int32)}
     */
    static ORDER_BY => 1024

    /**
     * Native name: WMIQ_RPNF_ISA_USED
     * @type {Integer (Int32)}
     */
    static ISA_USED => 2048

    /**
     * Native name: WMIQ_RPNF_GROUP_BY_HAVING
     * @type {Integer (Int32)}
     */
    static GROUP_BY_HAVING => 4096

    /**
     * Native name: WMIQ_RPNF_ARRAY_ACCESS_USED
     * @type {Integer (Int32)}
     */
    static ARRAY_ACCESS_USED => 8192
}
