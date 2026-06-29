#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_MPEG2Profile {
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
    static KS_MPEG2Profile_Simple => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Profile_Main => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Profile_SNRScalable => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Profile_SpatiallyScalable => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Profile_High => 4
}
