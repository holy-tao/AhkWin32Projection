#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information on a footer in a list-view control.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_getfooterinfo">ListView_GetFooterInfo</a> macro and the <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-getfooterinfo">LVM_GETFOOTERINFO</a> message.
 * 
 * The creation of footers in list-view controls is currently not supported.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvfooterinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVFOOTERINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Set of flags that specify which members of this structure contain data to be set or which members are being requested. Currently, this value must be LVFF_ITEMCOUNT, for the <b>cItems</b> member.
     */
    mask : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Not supported. Must be set to zero.
     */
    pszText : PWSTR

    /**
     * Type: <b>int</b>
     * 
     * Not supported. Must be set to zero.
     */
    cchTextMax : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of items in the footer. When this structure is used to get information, this member will be set by the message receiver.
     */
    cItems : UInt32

}
