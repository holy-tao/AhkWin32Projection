#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UColReorderCode {
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
    static UCOL_REORDER_CODE_DEFAULT => -1

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_NONE => 103

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_OTHERS => 103

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_SPACE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_FIRST => 4096

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_PUNCTUATION => 4097

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_SYMBOL => 4098

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_CURRENCY => 4099

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_DIGIT => 4100
}
