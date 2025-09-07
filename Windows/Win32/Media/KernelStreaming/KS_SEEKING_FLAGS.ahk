#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_SEEKING_FLAGS{

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
