#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_SEEKING_FLAGS {
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
    static KS_SEEKING_NoPositioning => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_AbsolutePositioning => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_RelativePositioning => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_IncrementalPositioning => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_PositioningBitsMask => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_SeekToKeyFrame => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_SEEKING_ReturnTime => 8
}
