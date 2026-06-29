#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_CompressionCaps {
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
    static KS_CompressionCaps_CanQuality => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_CompressionCaps_CanCrunch => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_CompressionCaps_CanKeyFrame => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_CompressionCaps_CanBFrame => 8

    /**
     * @type {Integer (Int32)}
     */
    static KS_CompressionCaps_CanWindow => 16
}
