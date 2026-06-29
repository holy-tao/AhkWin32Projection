#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleHyphens {
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
    static styleHyphensNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleHyphensManual => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleHyphensAuto => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleHyphensNotSet => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleHyphens_Max => 2147483647
}
