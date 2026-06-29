#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncH263VProfile {
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
    static eAVEncH263VProfile_Base => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_CompatibilityV2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_CompatibilityV1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_WirelessV2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_WirelessV3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_HighCompression => 5

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_Internet => 6

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_Interlace => 7

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_HighLatency => 8
}
