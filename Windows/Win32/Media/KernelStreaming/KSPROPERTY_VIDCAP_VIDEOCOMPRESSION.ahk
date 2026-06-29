#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDCAP_VIDEOCOMPRESSION {
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
    static KSPROPERTY_VIDEOCOMPRESSION_GETINFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_KEYFRAME_RATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_PFRAMES_PER_KEYFRAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_QUALITY => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_OVERRIDE_KEYFRAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_OVERRIDE_FRAME_SIZE => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOCOMPRESSION_WINDOWSIZE => 6
}
