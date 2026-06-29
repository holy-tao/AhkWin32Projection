#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRAWITEMSTRUCT_CTL_TYPE.ahk" { DRAWITEMSTRUCT_CTL_TYPE }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Describes a deleted list box or combo box item.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-deleteitemstruct
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DELETEITEMSTRUCT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    CtlType : DRAWITEMSTRUCT_CTL_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The identifier of the list box or combo box.
     */
    CtlID : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the item in the list box or combo box being removed.
     */
    itemID : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the control.
     */
    hwndItem : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG_PTR</a></b>
     * 
     * Application-defined data for the item. This value is passed to the control in the <i>lParam</i> parameter of the message that adds the item to the list box or combo box.
     */
    itemData : IntPtr

}
