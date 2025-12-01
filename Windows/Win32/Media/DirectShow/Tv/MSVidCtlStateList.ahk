#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * This topic applies to Windows XP or later.
 * @see https://learn.microsoft.com/windows/win32/api/msvidctl/ne-msvidctl-msvidctlstatelist
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MSVidCtlStateList extends Win32Enum{

    /**
     * Indicates that there is no filter graph.
     * @type {Integer (Int32)}
     */
    static STATE_UNBUILT => -1

    /**
     * Indicates that the Video Control is stopped.
     * @type {Integer (Int32)}
     */
    static STATE_STOP => 0

    /**
     * Indicates that the Video Control is paused.
     * @type {Integer (Int32)}
     */
    static STATE_PAUSE => 1

    /**
     * Indicates that the Video Control is playing.
     * @type {Integer (Int32)}
     */
    static STATE_PLAY => 2
}
