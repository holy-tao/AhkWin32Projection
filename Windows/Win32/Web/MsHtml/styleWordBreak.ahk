#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleWordBreak {
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
    static styleWordBreakNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWordBreakNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWordBreakBreakAll => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWordBreakKeepAll => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleWordBreak_Max => 2147483647
}
