#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct PURGE_COMM_FLAGS {
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
    static PURGE_RXABORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PURGE_RXCLEAR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PURGE_TXABORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PURGE_TXCLEAR => 4
}
