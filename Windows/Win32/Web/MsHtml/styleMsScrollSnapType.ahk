#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleMsScrollSnapType {
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
    static styleMsScrollSnapTypeNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollSnapTypeNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollSnapTypeMandatory => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollSnapTypeProximity => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollSnapType_Max => 2147483647
}
