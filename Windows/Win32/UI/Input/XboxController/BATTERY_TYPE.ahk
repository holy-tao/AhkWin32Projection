#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
export default struct BATTERY_TYPE {
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
    static BATTERY_TYPE_DISCONNECTED => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_TYPE_WIRED => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_TYPE_ALKALINE => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_TYPE_NIMH => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_TYPE_UNKNOWN => 0xFF
}
