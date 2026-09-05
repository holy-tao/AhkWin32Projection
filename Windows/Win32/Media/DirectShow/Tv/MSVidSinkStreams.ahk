#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
 * @see https://learn.microsoft.com/windows/win32/api/segment/ne-segment-msvidsinkstreams
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class MSVidSinkStreams extends Win32Enum {

    /**
     * Native name: MSVidSink_Video
     * @type {Integer (Int32)}
     */
    static Video => 1

    /**
     * Native name: MSVidSink_Audio
     * @type {Integer (Int32)}
     */
    static Audio => 2

    /**
     * Native name: MSVidSink_Other
     * @type {Integer (Int32)}
     */
    static Other => 4
}
