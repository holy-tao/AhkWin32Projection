#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct COMMPROP_STOP_PARITY {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static STOPBITS_10 => 1

    /**
     * @type {Integer (UInt16)}
     */
    static STOPBITS_15 => 2

    /**
     * @type {Integer (UInt16)}
     */
    static STOPBITS_20 => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PARITY_NONE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static PARITY_ODD => 512

    /**
     * @type {Integer (UInt16)}
     */
    static PARITY_EVEN => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static PARITY_MARK => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static PARITY_SPACE => 4096
}
