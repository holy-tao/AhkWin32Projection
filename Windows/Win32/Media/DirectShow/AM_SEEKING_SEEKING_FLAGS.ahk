#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_SEEKING_SEEKING_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_NoPositioning => 0

    /**
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_AbsolutePositioning => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_RelativePositioning => 2

    /**
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_IncrementalPositioning => 3

    /**
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_PositioningBitsMask => 3

    /**
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_SeekToKeyFrame => 4

    /**
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_ReturnTime => 8

    /**
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_Segment => 16

    /**
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_NoFlush => 32
}
