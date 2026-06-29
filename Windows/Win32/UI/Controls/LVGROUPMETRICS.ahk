#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Contains information about the display of groups in a list-view control.
 * @remarks
 * The width of a border determines the margins of the area within which items are placed. The top border is highlighted when the user moves the cursor over it, and when the user clicks on this border in a list that allows multiple selection, all items in the group are selected.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvgroupmetrics
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVGROUPMETRICS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>LVGROUPMETRICS</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    mask : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the width of the left border in icon, small icon, or tile view.
     */
    Left : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the width of the top border in all group views.
     */
    Top : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the width of the right border in icon, small icon, or tile view.
     */
    Right : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the width of the bottom border in all group views.
     */
    Bottom : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the left border. Not implemented.
     */
    crLeft : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the top border. Not implemented.
     */
    crTop : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the right border. Not implemented.
     */
    crRight : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the bottom border. Not implemented.
     */
    crBottom : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the header text. Not implemented.
     */
    crHeader : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the footer text. Not implemented.
     */
    crFooter : COLORREF

}
