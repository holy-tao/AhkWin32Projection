#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes a DVD stream type (video, audio, or subpicture).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-am_dvd_stream_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVD_STREAM_FLAGS extends Win32Enum{

    /**
     * DVD video stream.
     * @type {Integer (Int32)}
     */
    static AM_DVD_STREAM_VIDEO => 1

    /**
     * DVD audio stream.
     * @type {Integer (Int32)}
     */
    static AM_DVD_STREAM_AUDIO => 2

    /**
     * DVD subpicture stream.
     * @type {Integer (Int32)}
     */
    static AM_DVD_STREAM_SUBPIC => 4
}
