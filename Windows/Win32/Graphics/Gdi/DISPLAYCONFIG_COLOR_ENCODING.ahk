#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DISPLAYCONFIG_COLOR_ENCODING {
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
    static DISPLAYCONFIG_COLOR_ENCODING_RGB => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_COLOR_ENCODING_YCBCR444 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_COLOR_ENCODING_YCBCR422 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_COLOR_ENCODING_YCBCR420 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_COLOR_ENCODING_INTENSITY => 4
}
