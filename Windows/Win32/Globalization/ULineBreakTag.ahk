#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct ULineBreakTag {
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
    static UBRK_LINE_SOFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_LINE_SOFT_LIMIT => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_LINE_HARD => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_LINE_HARD_LIMIT => 200
}
