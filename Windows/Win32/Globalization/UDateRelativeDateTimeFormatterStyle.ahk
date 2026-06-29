#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDateRelativeDateTimeFormatterStyle {
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
    static UDAT_STYLE_LONG => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STYLE_SHORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STYLE_NARROW => 2
}
