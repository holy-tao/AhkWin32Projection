#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the closed captioning text background mode.
 * @see https://docs.microsoft.com/windows/win32/api//il21dec/ne-il21dec-am_line21_drawbgmode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_LINE21_DRAWBGMODE extends Win32Enum{

    /**
     * Opaque background.
     * @type {Integer (Int32)}
     */
    static AM_L21_DRAWBGMODE_Opaque => 0

    /**
     * Transparent background.
     * @type {Integer (Int32)}
     */
    static AM_L21_DRAWBGMODE_Transparent => 1
}
