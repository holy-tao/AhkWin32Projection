#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleInitialString {
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
    static styleInitialStringNoInitial => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialStringNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialStringAuto => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialStringNormal => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleInitialString_Max => 2147483647
}
