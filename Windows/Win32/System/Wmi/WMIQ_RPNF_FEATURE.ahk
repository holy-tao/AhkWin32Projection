#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WMIQ_RPNF_FEATURE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_WHERE_CLAUSE_PRESENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_QUERY_IS_CONJUNCTIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_QUERY_IS_DISJUNCTIVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_PROJECTION => 8

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_FEATURE_SELECT_STAR => 16

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_EQUALITY_TESTS_ONLY => 32

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_COUNT_STAR => 64

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_QUALIFIED_NAMES_USED => 128

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_SYSPROP_CLASS_USED => 256

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_PROP_TO_PROP_TESTS => 512

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_ORDER_BY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_ISA_USED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_GROUP_BY_HAVING => 4096

    /**
     * @type {Integer (Int32)}
     */
    static WMIQ_RPNF_ARRAY_ACCESS_USED => 8192
}
