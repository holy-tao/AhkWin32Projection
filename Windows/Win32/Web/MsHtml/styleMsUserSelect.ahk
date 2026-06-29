#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsUserSelect {
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
    static styleMsUserSelectAuto => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsUserSelectText => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsUserSelectElement => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsUserSelectNone => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsUserSelectNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsUserSelect_Max => 2147483647
}
