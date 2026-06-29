#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct DDE_NAME_SERVICE_CMD {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_REGISTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_UNREGISTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FILTERON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_FILTEROFF => 8
}
