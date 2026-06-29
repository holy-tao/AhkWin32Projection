#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlCompatMode {
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
    static htmlCompatModeBackCompat => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlCompatModeCSS1Compat => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlCompatMode_Max => 2147483647
}
