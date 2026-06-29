#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleBackgroundAttachment3 {
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
    static styleBackgroundAttachment3Fixed => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundAttachment3Scroll => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundAttachment3Local => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundAttachment3NotSet => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundAttachment3_Max => 2147483647
}
