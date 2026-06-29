#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UColAttribute {
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
    static UCOL_FRENCH_COLLATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_ALTERNATE_HANDLING => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_CASE_FIRST => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_CASE_LEVEL => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_NORMALIZATION_MODE => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_DECOMPOSITION_MODE => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_STRENGTH => 5

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_NUMERIC_COLLATION => 7

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_ATTRIBUTE_COUNT => 8
}
