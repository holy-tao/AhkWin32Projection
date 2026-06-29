#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPPARTOFSPEECH {
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
    static SPPS_NotOverriden => -1

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Noun => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Verb => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Modifier => 12288

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Function => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Interjection => 20480

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_Noncontent => 24576

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_LMA => 28672

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_SuppressWord => 61440
}
