#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\NMCUSTOMDRAW_DRAW_STAGE.ahk" { NMCUSTOMDRAW_DRAW_STAGE }
#Import "..\..\Graphics\Gdi\HPEN.ahk" { HPEN }
#Import ".\NMCUSTOMDRAW_DRAW_STATE_FLAGS.ahk" { NMCUSTOMDRAW_DRAW_STATE_FLAGS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Graphics\Gdi\HBRUSH.ahk" { HBRUSH }
#Import ".\NMCUSTOMDRAW.ahk" { NMCUSTOMDRAW }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Contains information specific to an NM_CUSTOMDRAW notification code sent by a toolbar control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtbcustomdraw
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTBCUSTOMDRAW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a> structure that contains general custom draw information. The 
     * 					<b>uItemState</b> member of this structure can be modified so that a toolbar item will be drawn in the specified state without actually changing the item's state.
     */
    nmcd : NMCUSTOMDRAW

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBRUSH</a></b>
     * 
     * HBRUSH that the control will use when drawing the background of marked or dithered items. This member is ignored if TBCDRF_NOMARK is returned from the <a href="https://docs.microsoft.com/windows/desktop/Controls/nm-customdraw-toolbar">NM_CUSTOMDRAW</a> notification code.
     */
    hbrMonoDither : HBRUSH

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBRUSH</a></b>
     * 
     * HBRUSH that the control will use when drawing lines on the buttons.
     */
    hbrLines : HBRUSH

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HPEN</a></b>
     * 
     * HPEN that the control will use when drawing lines on the buttons.
     */
    hpenLines : HPEN

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> that represents the color that the control will use when drawing text on normal items.
     */
    clrText : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the background color that the control will use when drawing text on marked items.
     */
    clrMark : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the color that the control will use when drawing text on highlighted items.
     */
    clrTextHighlight : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the face color that the control will use when drawing buttons.
     */
    clrBtnFace : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the face color that the control will use when drawing highlighted items. An item is highlighted if it has the <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-button-states">TBSTATE_MARKED</a> style and is contained in a toolbar that has the <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">TBSTYLE_FLAT</a> style.
     */
    clrBtnHighlight : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> that represents the background color that the control will use when drawing text on hot tracked items. This member is ignored if TBCDRF_HILITEHOTTRACK is not returned from the <a href="https://docs.microsoft.com/windows/desktop/Controls/nm-customdraw-toolbar">NM_CUSTOMDRAW</a> notification code.
     */
    clrHighlightHotTrack : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that, on entry, contains the rectangle of the item's text. The 
     * 					<b>right</b> and 
     * 					<b>bottom</b> members of this structure can be modified to change the width and height, respectively, of the text rectangle of the item.
     */
    rcText : RECT

    /**
     * Type: <b>int</b>
     * 
     * Background mode that the control will use when drawing the text of a nonhighlighted item. This can be either the TRANSPARENT or OPAQUE value.
     */
    nStringBkMode : Int32

    /**
     * Type: <b>int</b>
     * 
     * Background mode that the control will use when drawing the text of a highlighted item. This can be either the TRANSPARENT or OPAQUE value.
     */
    nHLStringBkMode : Int32

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0</a> Specifies the distance between the toolbar button image and the text, in logical pixels, for toolbars that have <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">TBSTYLE_LIST</a> style set.
     * 
     * Note that Comctl32.dll version 6 is not redistributable but it is included in Windows or later. To use Comctl32.dll version 6, specify it in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
     */
    iListGap : Int32

}
