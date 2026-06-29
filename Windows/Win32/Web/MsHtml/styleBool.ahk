#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleBool {
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
    static styleBoolFalse => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBoolTrue => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBool_Max => 2147483647
}
