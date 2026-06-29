#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct sandboxAllow {
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
    static sandboxAllowScripts => 0

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllowSameOrigin => 1

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllowTopNavigation => 2

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllowForms => 3

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllowPopups => 4

    /**
     * @type {Integer (Int32)}
     */
    static sandboxAllow_Max => 2147483647
}
