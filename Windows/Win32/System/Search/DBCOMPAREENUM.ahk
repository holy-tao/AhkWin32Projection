#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBCOMPAREENUM {
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
    static DBCOMPARE_LT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPARE_EQ => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPARE_GT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPARE_NE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMPARE_NOTCOMPARABLE => 4
}
