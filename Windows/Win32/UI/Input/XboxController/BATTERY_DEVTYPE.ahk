#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
export default struct BATTERY_DEVTYPE {
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
    static BATTERY_DEVTYPE_GAMEPAD => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static BATTERY_DEVTYPE_HEADSET => 0x01
}
