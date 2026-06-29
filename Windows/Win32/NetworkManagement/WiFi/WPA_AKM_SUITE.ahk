#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WPA_AKM_SUITE {
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
    static wpa_akm_none => 15880192

    /**
     * @type {Integer (Int32)}
     */
    static wpa_akm_1x => 32657408

    /**
     * @type {Integer (Int32)}
     */
    static wpa_akm_psk => 49434624

    /**
     * @type {Integer (Int32)}
     */
    static wpa_akm_max => 49434624
}
