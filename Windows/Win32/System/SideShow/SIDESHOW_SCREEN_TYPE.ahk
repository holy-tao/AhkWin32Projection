#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 */
class SIDESHOW_SCREEN_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SIDESHOW_SCREEN_TYPE_BITMAP => 0

    /**
     * @type {Integer (Int32)}
     */
    static SIDESHOW_SCREEN_TYPE_TEXT => 1
}
