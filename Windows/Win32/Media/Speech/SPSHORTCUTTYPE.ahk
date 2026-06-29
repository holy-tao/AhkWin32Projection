#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPSHORTCUTTYPE {
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
    static SPSHT_NotOverriden => -1

    /**
     * @type {Integer (Int32)}
     */
    static SPSHT_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPSHT_EMAIL => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SPSHT_OTHER => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_RESERVED1 => 12288

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_RESERVED2 => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_RESERVED3 => 20480

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_RESERVED4 => 61440
}
