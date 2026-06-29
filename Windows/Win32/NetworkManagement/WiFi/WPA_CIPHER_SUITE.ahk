#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WPA_CIPHER_SUITE {
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
    static wpa_cipher_none => 15880192

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_wep40 => 32657408

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_tkip => 49434624

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_ccmp_128 => 82989056

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_wep104 => 99766272

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_bip_cmac_128 => 116543488

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_max => 116543488
}
