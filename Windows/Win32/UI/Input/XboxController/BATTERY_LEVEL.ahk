#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
export default struct BATTERY_LEVEL {
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
    static BATTERY_LEVEL_EMPTY => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_LEVEL_LOW => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_LEVEL_MEDIUM => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_LEVEL_FULL => 0x03
}
