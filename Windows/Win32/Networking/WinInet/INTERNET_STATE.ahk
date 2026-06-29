#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_STATE {
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
    static INTERNET_STATE_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATE_DISCONNECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATE_DISCONNECTED_BY_USER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATE_IDLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_STATE_BUSY => 512
}
