#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\NMCUSTOMDRAW_DRAW_STAGE.ahk" { NMCUSTOMDRAW_DRAW_STAGE }
#Import ".\NMCUSTOMDRAW_DRAW_STATE_FLAGS.ahk" { NMCUSTOMDRAW_DRAW_STATE_FLAGS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NMCUSTOMDRAW.ahk" { NMCUSTOMDRAW }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Contains information specific to an NM_CUSTOMDRAW (tree view) notification code sent by a tree-view control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvcustomdraw
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTVCUSTOMDRAW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a> structure that contains general custom draw information.
     */
    nmcd : NMCUSTOMDRAW

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value representing the color that will be used to display text foreground in the tree-view control.
     */
    clrText : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value representing the color that will be used to display text background in the tree-view control.
     */
    clrTextBk : COLORREF

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. Zero-based level of the item being drawn. The root item is at level zero, a child of the root item is at level one, and so on.
     */
    iLevel : Int32

}
