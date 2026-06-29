#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumberGroupingStrategy {
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
    static UNUM_GROUPING_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_MIN2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_AUTO => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_ON_ALIGNED => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_GROUPING_THOUSANDS => 4
}
