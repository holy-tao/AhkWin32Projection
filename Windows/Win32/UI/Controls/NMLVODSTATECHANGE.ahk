#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Structure that contains information for use in processing the LVN_ODSTATECHANGED notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvodstatechange
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLVODSTATECHANGE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
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
     * Type: <b>int</b>
     * 
     * Zero-based index of the first item in the range of items.
     * @type {Integer}
     */
    iFrom {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Zero-based index of the last item in the range of items.
     * @type {Integer}
     */
    iTo {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Value indicating the new state for the item or items. This member can be any valid combination of the <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-item-states">list-view item states</a>.
     * @type {Integer}
     */
    uNewState {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Value indicating the old state for the item or items. This member can be any valid combination of the <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-item-states">list-view item states</a>.
     * @type {Integer}
     */
    uOldState {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
