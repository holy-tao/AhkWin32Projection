#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_OFFSET_FORMAT enumeration type defines the types of offsets used in this SDK.
 * @remarks
 * <b>WMT_OFFSET_FORMAT</b> is used as an input parameter to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced3-startatposition">IWMReaderAdvanced3::StartAtPosition</a>. The value passed specifies whether the reader should begin playback at a specified presentation time, frame number, or offset into a playlist.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_offset_format
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WMT_OFFSET_FORMAT extends Win32Enum {

    /**
     * An offset into a file is specified by presentation time in 100-nanosecond units.
     * Native name: WMT_OFFSET_FORMAT_100NS
     * @type {Integer (Int32)}
     */
    static 100NS => 0

    /**
     * An offset into a file is specified by frame number.
     * Native name: WMT_OFFSET_FORMAT_FRAME_NUMBERS
     * @type {Integer (Int32)}
     */
    static FRAME_NUMBERS => 1

    /**
     * An offset of playlist entries.
     * Native name: WMT_OFFSET_FORMAT_PLAYLIST_OFFSET
     * @type {Integer (Int32)}
     */
    static PLAYLIST_OFFSET => 2

    /**
     * An offset into a file is specified by presentation time as identified by SMTPE time codes.
     * Native name: WMT_OFFSET_FORMAT_TIMECODE
     * @type {Integer (Int32)}
     */
    static TIMECODE => 3

    /**
     * Used to specify approximate seeking. This type of offset seeks to the closest key frame prior to the time specified.
     * Native name: WMT_OFFSET_FORMAT_100NS_APPROXIMATE
     * @type {Integer (Int32)}
     */
    static 100NS_APPROXIMATE => 4
}
