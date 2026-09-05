#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * This topic applies to Windows XP or later.
 * @see https://learn.microsoft.com/windows/win32/api/msvidctl/ne-msvidctl-msvidctlstatelist
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class MSVidCtlStateList extends Win32Enum {

    /**
     * Indicates that there is no filter graph.
     * Native name: STATE_UNBUILT
     * @type {Integer (Int32)}
     */
    static UNBUILT => -1

    /**
     * Indicates that the Video Control is stopped.
     * Native name: STATE_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 0

    /**
     * Indicates that the Video Control is paused.
     * Native name: STATE_PAUSE
     * @type {Integer (Int32)}
     */
    static PAUSE => 1

    /**
     * Indicates that the Video Control is playing.
     * Native name: STATE_PLAY
     * @type {Integer (Int32)}
     */
    static PLAY => 2
}
