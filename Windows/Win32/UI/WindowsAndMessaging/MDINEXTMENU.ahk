#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\HMENU.ahk" { HMENU }

/**
 * Contains information about the menu to be activated.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-mdinextmenu
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MDINEXTMENU {
    #StructPack 8

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the current menu.
     */
    hmenuIn : HMENU

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu to be activated.
     */
    hmenuNext : HMENU

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window to receive the menu notification messages.
     */
    hwndNext : HWND

}
