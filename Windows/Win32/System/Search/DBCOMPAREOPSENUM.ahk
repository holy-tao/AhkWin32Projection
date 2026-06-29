#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBCOMPAREOPSENUM {
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
    static DBCOMPAREOPS_LT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_LE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_EQ => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_GE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_GT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_BEGINSWITH => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_CONTAINS => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_NE => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_IGNORE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_CASESENSITIVE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPAREOPS_CASEINSENSITIVE => 8192
}
