#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\NMCUSTOMDRAW.ahk

/**
 * Contains information specific to an NM_CUSTOMDRAW notification code sent by a tooltip control.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmttcustomdraw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTTCUSTOMDRAW extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a></b>
     * 
     * Contains general custom draw information.
     * @type {NMCUSTOMDRAW}
     */
    nmcd{
        get {
            if(!this.HasProp("__nmcd"))
                this.__nmcd := NMCUSTOMDRAW(this.ptr + 0)
            return this.__nmcd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies how tooltip text will be formatted when it is displayed. An application may change this field to alter the way text is drawn. This value is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawtext">DrawText</a> function internally. All values for the 
     * 					<i>uFormat</i> parameter of <b>DrawText</b> are valid.
     * @type {Integer}
     */
    uDrawFlags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
