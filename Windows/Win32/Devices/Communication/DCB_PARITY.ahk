#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct DCB_PARITY {
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
    static EVENPARITY => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static MARKPARITY => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static NOPARITY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static ODDPARITY => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static SPACEPARITY => 0x04
}
