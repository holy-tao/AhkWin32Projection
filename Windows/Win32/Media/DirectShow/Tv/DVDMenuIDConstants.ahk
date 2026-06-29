#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DVDMenuID constants define menu type ID numbers used to display specific menus.
 * @remarks
 * All the titles in a title set share the same Subpicture, Audio, Angle, and Chapter menus.
 * @see https://learn.microsoft.com/windows/win32/api/segment/ne-segment-dvdmenuidconstants
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DVDMenuIDConstants {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
