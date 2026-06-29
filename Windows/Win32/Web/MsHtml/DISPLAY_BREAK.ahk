#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct DISPLAY_BREAK {
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
    static DISPLAY_BREAK_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_BREAK_Block => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_BREAK_Break => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAY_BREAK_Max => 2147483647
}
