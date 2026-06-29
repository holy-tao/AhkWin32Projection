#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleTextJustifyTrim {
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
    static styleTextJustifyTrimNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyTrimNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyTrimPunctuation => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyTrimPunctAndKana => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTextJustifyTrim_Max => 2147483647
}
