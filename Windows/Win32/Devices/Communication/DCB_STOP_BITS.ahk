#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct DCB_STOP_BITS {
    value : UInt8

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Byte)}
     */
    static ONESTOPBIT => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static ONE5STOPBITS => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static TWOSTOPBITS => 0x02
}
