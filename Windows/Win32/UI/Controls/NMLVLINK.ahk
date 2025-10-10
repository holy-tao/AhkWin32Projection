#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include .\LITEM.ahk

/**
 * Contains information about an LVN_LINKCLICK notification code.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmlvlink
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLVLINK extends Win32Struct
{
    static sizeof => 4312

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains basic information about the notification code.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a> structure that contains information about the link that was clicked.
     * @type {LITEM}
     */
    link{
        get {
            if(!this.HasProp("__link"))
                this.__link := LITEM(this.ptr + 24)
            return this.__link
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Index of the item that contains the link.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 4304, "int")
        set => NumPut("int", value, this, 4304)
    }

    /**
     * Type: <b>int</b>
     * 
     * Subitem, if any. This member may be <b>NULL</b>. For a link in a group header, this is the group identifier, as set in <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvgroup">LVGROUP</a>.
     * @type {Integer}
     */
    iSubItem {
        get => NumGet(this, 4308, "int")
        set => NumPut("int", value, this, 4308)
    }
}
