#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_STREAM_SELECTION enumeration type defines the playback status of a stream.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_stream_selection
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_STREAM_SELECTION{

    /**
     * No samples will be delivered for the stream.
     * @type {Integer (Int32)}
     */
    static WMT_OFF => 0

    /**
     * Only samples with <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">cleanpoints</a> will be delivered for the stream.
     * @type {Integer (Int32)}
     */
    static WMT_CLEANPOINT_ONLY => 1

    /**
     * All samples will be delivered for the stream.
     * @type {Integer (Int32)}
     */
    static WMT_ON => 2
}
