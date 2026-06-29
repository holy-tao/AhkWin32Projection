#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleBoxSizing {
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
    static styleBoxSizingNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBoxSizingContentBox => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBoxSizingBorderBox => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBoxSizing_Max => 2147483647
}
