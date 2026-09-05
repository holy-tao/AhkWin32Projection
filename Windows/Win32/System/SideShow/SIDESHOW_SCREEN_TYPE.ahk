#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 */
class SIDESHOW_SCREEN_TYPE extends Win32Enum {

    /**
     * Native name: SIDESHOW_SCREEN_TYPE_BITMAP
     * @type {Integer (Int32)}
     */
    static BITMAP => 0

    /**
     * Native name: SIDESHOW_SCREEN_TYPE_TEXT
     * @type {Integer (Int32)}
     */
    static TEXT => 1
}
