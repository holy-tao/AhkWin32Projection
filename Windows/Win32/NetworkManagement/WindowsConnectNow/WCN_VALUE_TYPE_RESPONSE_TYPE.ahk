#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct WCN_VALUE_TYPE_RESPONSE_TYPE {
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
    static WCN_VALUE_RspT_ENROLLEE_INFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_RspT_ENROLLEE_OPEN_1X => 1

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_RspT_REGISTRAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_RspT_AP => 3
}
