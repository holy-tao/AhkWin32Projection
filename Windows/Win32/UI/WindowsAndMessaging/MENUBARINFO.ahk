#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

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
                this.__rcBar := RECT(this.ptr + 8)
            return this.__rcBar
        }
    }

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu bar or popup menu.
     * @type {Pointer<HMENU>}
     */
    hMenu {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the submenu.
     * @type {Pointer<HWND>}
     */
    hwndMenu {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
