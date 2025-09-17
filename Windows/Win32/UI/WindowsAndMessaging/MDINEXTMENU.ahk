#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {Pointer<Void>}
     */
    hmenuIn {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu to be activated.
     * @type {Pointer<Void>}
     */
    hmenuNext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window to receive the menu notification messages.
     * @type {Pointer<Void>}
     */
    hwndNext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
