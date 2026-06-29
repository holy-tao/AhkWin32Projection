#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_REQUEST_TYPE {
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
    static PowerRequestDisplayRequired => 0

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestSystemRequired => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestAwayModeRequired => 2

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestExecutionRequired => 3
}
