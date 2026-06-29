#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlEndPoints {
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
    static htmlEndPointsStartToStart => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlEndPointsStartToEnd => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlEndPointsEndToStart => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlEndPointsEndToEnd => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlEndPoints_Max => 2147483647
}
