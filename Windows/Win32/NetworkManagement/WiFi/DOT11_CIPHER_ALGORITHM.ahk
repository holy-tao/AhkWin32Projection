#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a cipher algorithm for data encryption and decryption.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-cipher-algorithm
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_CIPHER_ALGORITHM {
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
    static DOT11_CIPHER_ALGO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_WEP40 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_TKIP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_CCMP => 4

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_WEP104 => 5

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_BIP => 6

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_GCMP => 8

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_GCMP_256 => 9

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_CCMP_256 => 10

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_BIP_GMAC_128 => 11

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_BIP_GMAC_256 => 12

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_BIP_CMAC_256 => 13

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_WPA_USE_GROUP => 256

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_RSN_USE_GROUP => 256

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_WEP => 257

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_IHV_START => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_CIPHER_ALGO_IHV_END => -1
}
