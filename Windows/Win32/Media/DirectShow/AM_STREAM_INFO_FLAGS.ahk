#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AM_STREAM_INFO_FLAGS enumeration defines flags that indicate a pin's stream-control status.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-am_stream_info_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_STREAM_INFO_FLAGS{

    /**
     * Indicates that the pin's start time is set.
     * @type {Integer (Int32)}
     */
    static AM_STREAM_INFO_START_DEFINED => 1

    /**
     * Indicates that the pin's stop time is been set.
     * @type {Integer (Int32)}
     */
    static AM_STREAM_INFO_STOP_DEFINED => 2

    /**
     * Indicates that the pin is currently discarding data.
     * @type {Integer (Int32)}
     */
    static AM_STREAM_INFO_DISCARDING => 4

    /**
     * Indicates that the pin will send one extra sample after it reaches the stop time.
     * @type {Integer (Int32)}
     */
    static AM_STREAM_INFO_STOP_SEND_EXTRA => 16
}
