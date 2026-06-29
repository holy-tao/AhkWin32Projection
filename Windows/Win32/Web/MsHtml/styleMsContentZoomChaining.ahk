#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsContentZoomChaining {
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
    static styleMsContentZoomChainingNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomChainingNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomChainingChained => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomChaining_Max => 2147483647
}
