#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct ACCEL_VIRT_FLAGS {
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
    static FVIRTKEY => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static FNOINVERT => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static FSHIFT => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static FCONTROL => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static FALT => 0x10
}
