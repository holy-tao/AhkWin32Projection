#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct MODEM_STATUS_FLAGS {
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
    static MS_CTS_ON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MS_DSR_ON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MS_RING_ON => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MS_RLSD_ON => 128
}
