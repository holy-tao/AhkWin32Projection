#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTREEITEM.ahk

/**
 * Contains information for identifying the &quot;hit zone&quot; for a specified part of a tree item. The structure is used with the TVM_GETITEMPARTRECT message and the TreeView_GetItemPartRect macro.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tvgetitempartrectinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TVGETITEMPARTRECTINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the parent item.
     * @type {HTREEITEM}
     */
    hti{
        get {
            if(!this.HasProp("__hti"))
                this.__hti := HTREEITEM(this.ptr + 0)
            return this.__hti
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure to receive the coordinates of the bounding rectangle. The sender of the message (the caller) is responsible for allocating this structure.
     * @type {Pointer<RECT>}
     */
    prc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>TVITEMPART</b>
     * 
     * ID of the item part. This value must be <b>TVGIPR_BUTTON</b> (0x0001).
     * @type {Integer}
     */
    partID {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
