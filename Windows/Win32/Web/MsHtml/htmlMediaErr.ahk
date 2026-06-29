#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlMediaErr {
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
    static htmlMediaErrAborted => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaErrNetwork => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaErrDecode => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaErrSrcNotSupported => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaErr_Max => 2147483647
}
