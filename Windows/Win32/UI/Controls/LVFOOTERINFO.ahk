#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information on a footer in a list-view control.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_getfooterinfo">ListView_GetFooterInfo</a> macro and the <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-getfooterinfo">LVM_GETFOOTERINFO</a> message.
  * 
  * The creation of footers in list-view controls is currently not supported.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvfooterinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVFOOTERINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Set of flags that specify which members of this structure contain data to be set or which members are being requested. Currently, this value must be LVFF_ITEMCOUNT, for the <b>cItems</b> member.
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Not supported. Must be set to zero.
     * @type {PWSTR}
     */
    pszText{
        get {
            if(!this.HasProp("__pszText"))
                this.__pszText := PWSTR(this.ptr + 8)
            return this.__pszText
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Not supported. Must be set to zero.
     * @type {Integer}
     */
    cchTextMax {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of items in the footer. When this structure is used to get information, this member will be set by the message receiver.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
