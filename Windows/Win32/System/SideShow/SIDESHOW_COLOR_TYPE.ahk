#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 */
class SIDESHOW_COLOR_TYPE extends Win32Enum {

    /**
     * Native name: SIDESHOW_COLOR_TYPE_COLOR
     * @type {Integer (Int32)}
     */
    static COLOR => 0

    /**
     * Native name: SIDESHOW_COLOR_TYPE_GREYSCALE
     * @type {Integer (Int32)}
     */
    static GREYSCALE => 1

    /**
     * Native name: SIDESHOW_COLOR_TYPE_BLACK_AND_WHITE
     * @type {Integer (Int32)}
     */
    static BLACK_AND_WHITE => 2
}
