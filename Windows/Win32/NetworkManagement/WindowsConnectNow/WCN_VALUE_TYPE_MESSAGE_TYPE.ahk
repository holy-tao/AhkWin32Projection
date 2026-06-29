#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct WCN_VALUE_TYPE_MESSAGE_TYPE {
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
    static WCN_VALUE_MT_BEACON => 1

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_PROBE_REQUEST => 2

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_PROBE_RESPONSE => 3

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_M1 => 4

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_M2 => 5

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_M2D => 6

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_M3 => 7

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_M4 => 8

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_M5 => 9

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_M6 => 10

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_M7 => 11

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_M8 => 12

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_ACK => 13

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_NACK => 14

    /**
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_MT_DONE => 15
}
