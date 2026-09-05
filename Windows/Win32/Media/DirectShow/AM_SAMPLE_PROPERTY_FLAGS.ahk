#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_SAMPLE_PROPERTY_FLAGS extends Win32Enum {

    /**
     * Native name: AM_SAMPLE_SPLICEPOINT
     * @type {Integer (Int32)}
     */
    static SPLICEPOINT => 1

    /**
     * Native name: AM_SAMPLE_PREROLL
     * @type {Integer (Int32)}
     */
    static PREROLL => 2

    /**
     * Native name: AM_SAMPLE_DATADISCONTINUITY
     * @type {Integer (Int32)}
     */
    static DATADISCONTINUITY => 4

    /**
     * Native name: AM_SAMPLE_TYPECHANGED
     * @type {Integer (Int32)}
     */
    static TYPECHANGED => 8

    /**
     * Native name: AM_SAMPLE_TIMEVALID
     * @type {Integer (Int32)}
     */
    static TIMEVALID => 16

    /**
     * Native name: AM_SAMPLE_TIMEDISCONTINUITY
     * @type {Integer (Int32)}
     */
    static TIMEDISCONTINUITY => 64

    /**
     * Native name: AM_SAMPLE_FLUSH_ON_PAUSE
     * @type {Integer (Int32)}
     */
    static FLUSH_ON_PAUSE => 128

    /**
     * Native name: AM_SAMPLE_STOPVALID
     * @type {Integer (Int32)}
     */
    static STOPVALID => 256

    /**
     * Native name: AM_SAMPLE_ENDOFSTREAM
     * @type {Integer (Int32)}
     */
    static ENDOFSTREAM => 512

    /**
     * Native name: AM_STREAM_MEDIA
     * @type {Integer (Int32)}
     */
    static STREAM_MEDIA => 0

    /**
     * Native name: AM_STREAM_CONTROL
     * @type {Integer (Int32)}
     */
    static STREAM_CONTROL => 1
}
