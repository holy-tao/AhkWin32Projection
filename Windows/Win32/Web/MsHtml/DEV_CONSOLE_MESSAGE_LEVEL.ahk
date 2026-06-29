#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct DEV_CONSOLE_MESSAGE_LEVEL {
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
    static DCML_INFORMATIONAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DCML_WARNING => 1

    /**
     * @type {Integer (Int32)}
     */
    static DCML_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEV_CONSOLE_MESSAGE_LEVEL_Max => 2147483647
}
