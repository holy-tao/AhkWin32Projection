#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlMediaNetworkState {
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
    static htmlMediaNetworkStateEmpty => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaNetworkStateIdle => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaNetworkStateLoading => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaNetworkStateNoSource => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaNetworkState_Max => 2147483647
}
