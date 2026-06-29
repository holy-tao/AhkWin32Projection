#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_SETTING_ALTITUDE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_GROUP_POLICY => 0

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_USER => 1

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_RUNTIME_OVERRIDE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_PROVISIONING => 3

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_OEM_CUSTOMIZATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_INTERNAL_OVERRIDE => 5

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_OS_DEFAULT => 6
}
