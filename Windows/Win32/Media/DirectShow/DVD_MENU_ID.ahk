#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the DVD menu in a call to IDvdControl2::ShowMenu.
 * @remarks
 * The root menu always provides a means of getting to the subpicture, audio, angle and chapter menus if they exist.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_menu_id
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_MENU_ID extends Win32Enum{

    /**
     * Specifies the top menu in a DVD-Video volume. This menu is also known as the Title Menu or Video Manager Menu and it provides access to all VTS (Video Title Set) menus on the disc.
     * @type {Integer (Int32)}
     */
    static DVD_MENU_Title => 2

    /**
     * Specifies the root menu for a VTS.
     * @type {Integer (Int32)}
     */
    static DVD_MENU_Root => 3

    /**
     * Specifies the subpicture submenu in a VTS menu.
     * @type {Integer (Int32)}
     */
    static DVD_MENU_Subpicture => 4

    /**
     * Specifies the audio submenu in a VTS menu.
     * @type {Integer (Int32)}
     */
    static DVD_MENU_Audio => 5

    /**
     * Specifies the angle submenu in a VTS menu.
     * @type {Integer (Int32)}
     */
    static DVD_MENU_Angle => 6

    /**
     * Choose a chapter submenu in a VTS menu.
     * @type {Integer (Int32)}
     */
    static DVD_MENU_Chapter => 7
}
