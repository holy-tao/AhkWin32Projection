#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes a DVD stream type (video, audio, or subpicture).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-am_dvd_stream_flags
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_DVD_STREAM_FLAGS extends Win32Enum {

    /**
     * DVD video stream.
     * Native name: AM_DVD_STREAM_VIDEO
     * @type {Integer (Int32)}
     */
    static VIDEO => 1

    /**
     * DVD audio stream.
     * Native name: AM_DVD_STREAM_AUDIO
     * @type {Integer (Int32)}
     */
    static AUDIO => 2

    /**
     * DVD subpicture stream.
     * Native name: AM_DVD_STREAM_SUBPIC
     * @type {Integer (Int32)}
     */
    static SUBPIC => 4
}
