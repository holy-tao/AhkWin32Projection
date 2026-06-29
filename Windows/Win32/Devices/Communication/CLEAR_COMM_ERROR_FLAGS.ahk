#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct CLEAR_COMM_ERROR_FLAGS {
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
    static CE_BREAK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CE_FRAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CE_OVERRUN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CE_RXOVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CE_RXPARITY => 4
}
