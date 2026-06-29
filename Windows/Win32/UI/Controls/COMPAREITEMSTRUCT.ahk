#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRAWITEMSTRUCT_CTL_TYPE.ahk" { DRAWITEMSTRUCT_CTL_TYPE }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Supplies the identifiers and application-supplied data for two items in a sorted, owner-drawn list box or combo box.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-compareitemstruct
 * @namespace Windows.Win32.UI.Controls
 */
export default struct COMPAREITEMSTRUCT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An ODT_LISTBOX (owner-drawn list box) or ODT_COMBOBOX (an owner-drawn combo box).
     */
    CtlType : DRAWITEMSTRUCT_CTL_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The identifier of the list box or combo box.
     */
    CtlID : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the control.
     */
    hwndItem : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the first item in the list box or combo box being compared. This member will be –1 if the item has not been inserted or when searching for a potential item in the list box or combo box.
     */
    itemID1 : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG_PTR</a></b>
     * 
     * Application-supplied data for the first item being compared. (This value was passed as the <i>lParam</i> parameter of the message that added the item to the list box or combo box.)
     */
    itemData1 : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the second item in the list box or combo box being compared.
     */
    itemID2 : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG_PTR</a></b>
     * 
     * Application-supplied data for the second item being compared. This value was passed as the 
     * 					<i>lParam</i> parameter of the message that added the item to the list box or combo box. This member will be 
     * 					–1 if the item has not been inserted or when searching for a potential item in the list box or combo box.
     */
    itemData2 : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The locale identifier. To create a locale identifier, use the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-makelcid">MAKELCID</a> macro.
     */
    dwLocaleId : UInt32

}
