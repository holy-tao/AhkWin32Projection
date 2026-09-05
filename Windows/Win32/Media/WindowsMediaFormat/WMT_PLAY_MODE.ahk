#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_PLAY_MODE enumeration type defines the playback options of the reader.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_play_mode
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WMT_PLAY_MODE extends Win32Enum {

    /**
     * The reader will select the most appropriate play mode based on the location of the content.
     * Native name: WMT_PLAY_MODE_AUTOSELECT
     * @type {Integer (Int32)}
     */
    static AUTOSELECT => 0

    /**
     * The reader will read files from a local storage location.
     * Native name: WMT_PLAY_MODE_LOCAL
     * @type {Integer (Int32)}
     */
    static LOCAL => 1

    /**
     * The reader will download files from network locations.
     * Native name: WMT_PLAY_MODE_DOWNLOAD
     * @type {Integer (Int32)}
     */
    static DOWNLOAD => 2

    /**
     * The reader will stream files from network locations.
     * Native name: WMT_PLAY_MODE_STREAMING
     * @type {Integer (Int32)}
     */
    static STREAMING => 3
}
