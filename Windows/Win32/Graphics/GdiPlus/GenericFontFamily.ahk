#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct GenericFontFamily {
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
    static GenericFontFamilySerif => 0

    /**
     * @type {Integer (Int32)}
     */
    static GenericFontFamilySansSerif => 1

    /**
     * @type {Integer (Int32)}
     */
    static GenericFontFamilyMonospace => 2
}
