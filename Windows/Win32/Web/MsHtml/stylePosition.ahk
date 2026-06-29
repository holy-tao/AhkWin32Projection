#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct stylePosition {
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
    static stylePositionNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static stylePositionstatic => 1

    /**
     * @type {Integer (Int32)}
     */
    static stylePositionrelative => 2

    /**
     * @type {Integer (Int32)}
     */
    static stylePositionabsolute => 3

    /**
     * @type {Integer (Int32)}
     */
    static stylePositionfixed => 4

    /**
     * @type {Integer (Int32)}
     */
    static stylePositionMsPage => 5

    /**
     * @type {Integer (Int32)}
     */
    static stylePositionMsDeviceFixed => 6

    /**
     * @type {Integer (Int32)}
     */
    static stylePosition_Max => 2147483647
}
