#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct CREATE_FONT_PACKAGE_SUBSET_ENCODING {
    value : Int16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int16)}
     */
    static TTFCFP_STD_MAC_CHAR_SET => 0

    /**
     * @type {Integer (Int16)}
     */
    static TTFCFP_SYMBOL_CHAR_SET => 0

    /**
     * @type {Integer (Int16)}
     */
    static TTFCFP_UNICODE_CHAR_SET => 1
}
