#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DOT11_RADIO_STATE enumeration specifies an 802.11 radio state.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-dot11_radio_state~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_RADIO_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The radio state is unknown.
     * @type {Integer (Int32)}
     */
    static dot11_radio_state_unknown => 0

    /**
     * The radio is on.
     * @type {Integer (Int32)}
     */
    static dot11_radio_state_on => 1

    /**
     * The radio is off.
     * @type {Integer (Int32)}
     */
    static dot11_radio_state_off => 2
}
