#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_SEEKING_SEEKING_FLAGS extends Win32Enum {

    /**
     * Native name: AM_SEEKING_NoPositioning
     * @type {Integer (Int32)}
     */
    static NoPositioning => 0

    /**
     * Native name: AM_SEEKING_AbsolutePositioning
     * @type {Integer (Int32)}
     */
    static AbsolutePositioning => 1

    /**
     * Native name: AM_SEEKING_RelativePositioning
     * @type {Integer (Int32)}
     */
    static RelativePositioning => 2

    /**
     * Native name: AM_SEEKING_IncrementalPositioning
     * @type {Integer (Int32)}
     */
    static IncrementalPositioning => 3

    /**
     * Native name: AM_SEEKING_PositioningBitsMask
     * @type {Integer (Int32)}
     */
    static PositioningBitsMask => 3

    /**
     * Native name: AM_SEEKING_SeekToKeyFrame
     * @type {Integer (Int32)}
     */
    static SeekToKeyFrame => 4

    /**
     * Native name: AM_SEEKING_ReturnTime
     * @type {Integer (Int32)}
     */
    static ReturnTime => 8

    /**
     * Native name: AM_SEEKING_Segment
     * @type {Integer (Int32)}
     */
    static Segment => 16

    /**
     * Native name: AM_SEEKING_NoFlush
     * @type {Integer (Int32)}
     */
    static NoFlush => 32
}
