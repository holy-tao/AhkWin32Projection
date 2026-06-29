#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_POWER_MODE_REASON {
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
    static dot11_power_mode_reason_no_change => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_noncompliant_AP => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_legacy_WFD_device => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_compliant_AP => 3

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_compliant_WFD_device => 4

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_others => 5
}
