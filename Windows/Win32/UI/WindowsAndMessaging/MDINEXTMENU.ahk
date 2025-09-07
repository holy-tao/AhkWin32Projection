#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HMENU.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains information about the menu to be activated.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-mdinextmenu
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MDINEXTMENU extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the current menu.
     * @type {HMENU}
     */
    hmenuIn{
        get {
            if(!this.HasProp("__hmenuIn"))
                this.__hmenuIn := HMENU(this.ptr + 0)
            return this.__hmenuIn
        }
    }

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu to be activated.
     * @type {HMENU}
     */
    hmenuNext{
        get {
            if(!this.HasProp("__hmenuNext"))
                this.__hmenuNext := HMENU(this.ptr + 8)
            return this.__hmenuNext
        }
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window to receive the menu notification messages.
     * @type {HWND}
     */
    hwndNext{
        get {
            if(!this.HasProp("__hwndNext"))
                this.__hwndNext := HWND(this.ptr + 16)
            return this.__hwndNext
        }
    }
}
