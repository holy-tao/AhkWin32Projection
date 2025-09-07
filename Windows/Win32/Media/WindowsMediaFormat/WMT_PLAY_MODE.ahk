#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_PLAY_MODE enumeration type defines the playback options of the reader.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_play_mode
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_PLAY_MODE{

    /**
     * The reader will select the most appropriate play mode based on the location of the content.
     * @type {Integer (Int32)}
     */
    static WMT_PLAY_MODE_AUTOSELECT => 0

    /**
     * The reader will read files from a local storage location.
     * @type {Integer (Int32)}
     */
    static WMT_PLAY_MODE_LOCAL => 1

    /**
     * The reader will download files from network locations.
     * @type {Integer (Int32)}
     */
    static WMT_PLAY_MODE_DOWNLOAD => 2

    /**
     * The reader will stream files from network locations.
     * @type {Integer (Int32)}
     */
    static WMT_PLAY_MODE_STREAMING => 3
}
