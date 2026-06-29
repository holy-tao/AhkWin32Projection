#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\LIST_VIEW_GROUP_ALIGN_FLAGS.ahk" { LIST_VIEW_GROUP_ALIGN_FLAGS }
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\NMCUSTOMDRAW_DRAW_STAGE.ahk" { NMCUSTOMDRAW_DRAW_STAGE }
#Import ".\NMLVCUSTOMDRAW_ITEM_TYPE.ahk" { NMLVCUSTOMDRAW_ITEM_TYPE }
#Import ".\NMCUSTOMDRAW_DRAW_STATE_FLAGS.ahk" { NMCUSTOMDRAW_DRAW_STATE_FLAGS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NMCUSTOMDRAW.ahk" { NMCUSTOMDRAW }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Contains information specific to an NM_CUSTOMDRAW (list view) notification code sent by a list-view control.
 * @remarks
 * <div class="alert"><b>Note</b>  Comctl32.dll version 6 is not redistributable but it is included in Windows or later. To use Comctl32.dll version 6, specify it in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvcustomdraw
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLVCUSTOMDRAW {
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
     * <b>COLORREF</b> value representing the color that will be used to display text foreground in the list-view control.
     */
    clrText : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * <b>COLORREF</b> value representing the color that will be used to display text background in the list-view control. In <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0., </a> this member is ignored if the background image is set with the <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-setbkimage">LVM_SETBKIMAGE</a> message.
     */
    clrTextBk : COLORREF

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71.</a> Index of the subitem that is being drawn. If the main item is being drawn, this member will be zero.
     */
    iSubItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0. </a>
     */
    dwItemType : NMLVCUSTOMDRAW_ITEM_TYPE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a> 
     * 					<b>COLORREF</b> value representing the color that will be used to display the face of an item.
     */
    clrFace : COLORREF

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					Value of type <b>int</b> that specifies the effect that is applied to an icon, such as Glow, Shadow, or Pulse.
     */
    iIconEffect : Int32

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					Value of type <b>int</b> that specifies the phase of an icon.
     */
    iIconPhase : Int32

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					Value of type <b>int</b> that specifies the ID of the part of an item to draw.
     */
    iPartId : Int32

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					Value of type <b>int</b> that specifies the ID of the state of an item to draw.
     */
    iStateId : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>  
     * 					<b>RECT</b> that specifies the rectangle in which the text is to be drawn.
     */
    rcText : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0.</a>
     */
    uAlign : LIST_VIEW_GROUP_ALIGN_FLAGS

}
