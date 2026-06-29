#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct styleStrokeLinejoin {
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
    static styleStrokeLinejoinNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinejoinMiter => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinejoinRound => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinejoinBevel => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinejoin_Max => 2147483647
}
