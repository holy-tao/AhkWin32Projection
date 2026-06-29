#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct INTERNAL_IF_OPER_STATUS {
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
    static IF_OPER_STATUS_NON_OPERATIONAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_UNREACHABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_DISCONNECTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_CONNECTING => 3

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_CONNECTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static IF_OPER_STATUS_OPERATIONAL => 5
}
