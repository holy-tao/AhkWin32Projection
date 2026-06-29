#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlReadyState {
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
    static htmlReadyStateuninitialized => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyStateloading => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyStateloaded => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyStateinteractive => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyStatecomplete => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlReadyState_Max => 2147483647
}
