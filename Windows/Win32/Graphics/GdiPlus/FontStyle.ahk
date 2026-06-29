#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct FontStyle {
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
    static FontStyleRegular => 0

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleBold => 1

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleItalic => 2

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleBoldItalic => 3

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleUnderline => 4

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleStrikeout => 8
}
