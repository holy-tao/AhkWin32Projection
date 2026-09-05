#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the DVD menu in a call to IDvdControl2::ShowMenu.
 * @remarks
 * The root menu always provides a means of getting to the subpicture, audio, angle and chapter menus if they exist.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_menu_id
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_MENU_ID extends Win32Enum {

    /**
     * Specifies the top menu in a DVD-Video volume. This menu is also known as the Title Menu or Video Manager Menu and it provides access to all VTS (Video Title Set) menus on the disc.
     * Native name: DVD_MENU_Title
     * @type {Integer (Int32)}
     */
    static Title => 2

    /**
     * Specifies the root menu for a VTS.
     * Native name: DVD_MENU_Root
     * @type {Integer (Int32)}
     */
    static Root => 3

    /**
     * Specifies the subpicture submenu in a VTS menu.
     * Native name: DVD_MENU_Subpicture
     * @type {Integer (Int32)}
     */
    static Subpicture => 4

    /**
     * Specifies the audio submenu in a VTS menu.
     * Native name: DVD_MENU_Audio
     * @type {Integer (Int32)}
     */
    static Audio => 5

    /**
     * Specifies the angle submenu in a VTS menu.
     * Native name: DVD_MENU_Angle
     * @type {Integer (Int32)}
     */
    static Angle => 6

    /**
     * Choose a chapter submenu in a VTS menu.
     * Native name: DVD_MENU_Chapter
     * @type {Integer (Int32)}
     */
    static Chapter => 7
}
