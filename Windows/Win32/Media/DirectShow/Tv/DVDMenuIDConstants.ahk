#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The DVDMenuID constants define menu type ID numbers used to display specific menus.
 * @remarks
 * All the titles in a title set share the same Subpicture, Audio, Angle, and Chapter menus.
 * @see https://learn.microsoft.com/windows/win32/api/segment/ne-segment-dvdmenuidconstants
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class DVDMenuIDConstants extends Win32Enum {

    /**
     * Title menu, also called the Video Manager Menu.
     * Native name: dvdMenu_Title
     * @type {Integer (Int32)}
     */
    static Title => 2

    /**
     * Root menu, the menu for one video title set, which can contain one title or a group of titles.
     * Native name: dvdMenu_Root
     * @type {Integer (Int32)}
     */
    static Root => 3

    /**
     * Subpicture menu.
     * Native name: dvdMenu_Subpicture
     * @type {Integer (Int32)}
     */
    static Subpicture => 4

    /**
     * Audio menu.
     * Native name: dvdMenu_Audio
     * @type {Integer (Int32)}
     */
    static Audio => 5

    /**
     * Angle menu.
     * Native name: dvdMenu_Angle
     * @type {Integer (Int32)}
     */
    static Angle => 6

    /**
     * Chapter menu.
     * Native name: dvdMenu_Chapter
     * @type {Integer (Int32)}
     */
    static Chapter => 7
}
