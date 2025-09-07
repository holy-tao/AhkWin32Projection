#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_SAMPLE_PROPERTY_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static AM_SAMPLE_SPLICEPOINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_SAMPLE_PREROLL => 2

    /**
     * @type {Integer (Int32)}
     */
    static AM_SAMPLE_DATADISCONTINUITY => 4

    /**
     * @type {Integer (Int32)}
     */
    static AM_SAMPLE_TYPECHANGED => 8

    /**
     * @type {Integer (Int32)}
     */
    static AM_SAMPLE_TIMEVALID => 16

    /**
     * @type {Integer (Int32)}
     */
    static AM_SAMPLE_TIMEDISCONTINUITY => 64

    /**
     * @type {Integer (Int32)}
     */
    static AM_SAMPLE_FLUSH_ON_PAUSE => 128

    /**
     * @type {Integer (Int32)}
     */
    static AM_SAMPLE_STOPVALID => 256

    /**
     * @type {Integer (Int32)}
     */
    static AM_SAMPLE_ENDOFSTREAM => 512

    /**
     * @type {Integer (Int32)}
     */
    static AM_STREAM_MEDIA => 0

    /**
     * @type {Integer (Int32)}
     */
    static AM_STREAM_CONTROL => 1
}
