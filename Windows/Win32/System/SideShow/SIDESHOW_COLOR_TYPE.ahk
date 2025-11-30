#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class SIDESHOW_COLOR_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SIDESHOW_COLOR_TYPE_COLOR => 0

    /**
     * @type {Integer (Int32)}
     */
    static SIDESHOW_COLOR_TYPE_GREYSCALE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SIDESHOW_COLOR_TYPE_BLACK_AND_WHITE => 2
}
