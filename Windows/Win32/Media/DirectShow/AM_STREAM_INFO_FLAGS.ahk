#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_STREAM_INFO_FLAGS enumeration defines flags that indicate a pin's stream-control status.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-am_stream_info_flags
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_STREAM_INFO_FLAGS extends Win32Enum {

    /**
     * Indicates that the pin's start time is set.
     * Native name: AM_STREAM_INFO_START_DEFINED
     * @type {Integer (Int32)}
     */
    static START_DEFINED => 1

    /**
     * Indicates that the pin's stop time is been set.
     * Native name: AM_STREAM_INFO_STOP_DEFINED
     * @type {Integer (Int32)}
     */
    static STOP_DEFINED => 2

    /**
     * Indicates that the pin is currently discarding data.
     * Native name: AM_STREAM_INFO_DISCARDING
     * @type {Integer (Int32)}
     */
    static DISCARDING => 4

    /**
     * Indicates that the pin will send one extra sample after it reaches the stop time.
     * Native name: AM_STREAM_INFO_STOP_SEND_EXTRA
     * @type {Integer (Int32)}
     */
    static STOP_SEND_EXTRA => 16
}
