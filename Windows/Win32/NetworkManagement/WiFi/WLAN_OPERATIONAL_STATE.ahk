#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_OPERATIONAL_STATE {
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
    static wlan_operational_state_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static wlan_operational_state_off => 1

    /**
     * @type {Integer (Int32)}
     */
    static wlan_operational_state_on => 2

    /**
     * @type {Integer (Int32)}
     */
    static wlan_operational_state_going_off => 3

    /**
     * @type {Integer (Int32)}
     */
    static wlan_operational_state_going_on => 4
}
