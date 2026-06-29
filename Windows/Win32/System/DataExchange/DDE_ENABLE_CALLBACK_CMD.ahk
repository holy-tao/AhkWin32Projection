#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct DDE_ENABLE_CALLBACK_CMD {
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
    static EC_ENABLEALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EC_ENABLEONE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EC_DISABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EC_QUERYWAITING => 2
}
