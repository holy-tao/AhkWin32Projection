#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\HMENU.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains menu bar information.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-menubarinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUBARINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(MENUBARINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The coordinates of the menu bar, popup menu, or menu item.
     * @type {RECT}
     */
    rcBar{
        get {
            if(!this.HasProp("__rcBar"))
                this.__rcBar := RECT(8, this)
            return this.__rcBar
        }
    }

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu bar or popup menu.
     * @type {HMENU}
     */
    hMenu{
        get {
            if(!this.HasProp("__hMenu"))
                this.__hMenu := HMENU(24, this)
            return this.__hMenu
        }
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the submenu.
     * @type {HWND}
     */
    hwndMenu{
        get {
            if(!this.HasProp("__hwndMenu"))
                this.__hwndMenu := HWND(32, this)
            return this.__hwndMenu
        }
    }

    /**
     * This bitfield backs the following members:
     * - fBarFocused
     * - fFocused
     * - fUnused
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * If the menu bar or popup menu has the focus, this member is <b>TRUE</b>. Otherwise, the member is <b>FALSE</b>.
     * @type {Integer}
     */
    fBarFocused {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * If the menu item has the focus, this member is <b>TRUE</b>. Otherwise, the member is <b>FALSE</b>.
     * @type {Integer}
     */
    fFocused {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    fUnused {
        get => (this._bitfield >> 2) & 0x3FFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFF) << 2) | (this._bitfield & ~(0x3FFFFFFF << 2))
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 48
    }
}
