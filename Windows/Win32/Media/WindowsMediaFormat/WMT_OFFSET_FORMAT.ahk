#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_OFFSET_FORMAT enumeration type defines the types of offsets used in this SDK.
 * @remarks
 * 
 * <b>WMT_OFFSET_FORMAT</b> is used as an input parameter to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced3-startatposition">IWMReaderAdvanced3::StartAtPosition</a>. The value passed specifies whether the reader should begin playback at a specified presentation time, frame number, or offset into a playlist.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_offset_format
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_OFFSET_FORMAT{

    /**
     * An offset into a file is specified by presentation time in 100-nanosecond units.
     * @type {Integer (Int32)}
     */
    static WMT_OFFSET_FORMAT_100NS => 0

    /**
     * An offset into a file is specified by frame number.
     * @type {Integer (Int32)}
     */
    static WMT_OFFSET_FORMAT_FRAME_NUMBERS => 1

    /**
     * An offset of playlist entries.
     * @type {Integer (Int32)}
     */
    static WMT_OFFSET_FORMAT_PLAYLIST_OFFSET => 2

    /**
     * An offset into a file is specified by presentation time as identified by SMTPE time codes.
     * @type {Integer (Int32)}
     */
    static WMT_OFFSET_FORMAT_TIMECODE => 3

    /**
     * Used to specify approximate seeking. This type of offset seeks to the closest key frame prior to the time specified.
     * @type {Integer (Int32)}
     */
    static WMT_OFFSET_FORMAT_100NS_APPROXIMATE => 4
}
