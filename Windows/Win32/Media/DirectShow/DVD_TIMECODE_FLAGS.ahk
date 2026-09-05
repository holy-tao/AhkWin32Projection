#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the frame rate at which a DVD has been authored to play.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_timecode_flags
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_TIMECODE_FLAGS extends Win32Enum {

    /**
     * Disc is authored to play at 25 frames per second.
     * Native name: DVD_TC_FLAG_25fps
     * @type {Integer (Int32)}
     */
    static TC_FLAG_25fps => 1

    /**
     * Disc is authored to play at 30 frames per second.
     * Native name: DVD_TC_FLAG_30fps
     * @type {Integer (Int32)}
     */
    static TC_FLAG_30fps => 2

    /**
     * Disc is authored to play at 29.97 frames per second.
     * Native name: DVD_TC_FLAG_DropFrame
     * @type {Integer (Int32)}
     */
    static TC_FLAG_DropFrame => 4

    /**
     * Value representing the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator Filter</a> filter's best estimate of the disc's frame rate.
     * Native name: DVD_TC_FLAG_Interpolated
     * @type {Integer (Int32)}
     */
    static TC_FLAG_Interpolated => 8
}
