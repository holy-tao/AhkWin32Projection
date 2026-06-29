#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PHONE_LAMP_MODE enum provides indicators of a phone lamp's status.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phone_lamp_mode
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONE_LAMP_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The lamp identifier has no corresponding lamp.
     * @type {Integer (Int32)}
     */
    static LM_DUMMY => 1

    /**
     * The lamp is off.
     * @type {Integer (Int32)}
     */
    static LM_OFF => 2

    /**
     * The lamp is on steadily.
     * @type {Integer (Int32)}
     */
    static LM_STEADY => 4

    /**
     * The lamp is winking, which means on and off at a normal rate.
     * @type {Integer (Int32)}
     */
    static LM_WINK => 8

    /**
     * The lamp is flashing, which means a slow on and off.
     * @type {Integer (Int32)}
     */
    static LM_FLASH => 16

    /**
     * The lamp is fluttering, which means a fast on and off.
     * @type {Integer (Int32)}
     */
    static LM_FLUTTER => 32

    /**
     * The lamp is flashing, which means superposition of a flash and flutter.
     * @type {Integer (Int32)}
     */
    static LM_BROKENFLUTTER => 64

    /**
     * The lamp mode is not known.
     * @type {Integer (Int32)}
     */
    static LM_UNKNOWN => 128
}
