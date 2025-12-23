#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The DVDMenuID constants define menu type ID numbers used to display specific menus.
 * @remarks
 * All the titles in a title set share the same Subpicture, Audio, Angle, and Chapter menus.
 * @see https://learn.microsoft.com/windows/win32/api/segment/ne-segment-dvdmenuidconstants
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class DVDMenuIDConstants extends Win32Enum{

    /**
     * Title menu, also called the Video Manager Menu.
     * @type {Integer (Int32)}
     */
    static dvdMenu_Title => 2

    /**
     * Root menu, the menu for one video title set, which can contain one title or a group of titles.
     * @type {Integer (Int32)}
     */
    static dvdMenu_Root => 3

    /**
     * Subpicture menu.
     * @type {Integer (Int32)}
     */
    static dvdMenu_Subpicture => 4

    /**
     * Audio menu.
     * @type {Integer (Int32)}
     */
    static dvdMenu_Audio => 5

    /**
     * Angle menu.
     * @type {Integer (Int32)}
     */
    static dvdMenu_Angle => 6

    /**
     * Chapter menu.
     * @type {Integer (Int32)}
     */
    static dvdMenu_Chapter => 7
}
