#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_POWER_MODE {
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
    static dot11_power_mode_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_active => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_powersave => 2
}
