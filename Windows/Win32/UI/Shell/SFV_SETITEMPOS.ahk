#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Stores position information for an item. Used with message SFVM_SETITEMPOS.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-sfv_setitempos
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SFV_SETITEMPOS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>PCUITEMID_CHILD</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> for the item.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure indicating the position of the item.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(8, this)
            return this.__pt
        }
    }
}
