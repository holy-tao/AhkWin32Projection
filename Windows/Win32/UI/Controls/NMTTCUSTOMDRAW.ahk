#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\NMCUSTOMDRAW_DRAW_STAGE.ahk" { NMCUSTOMDRAW_DRAW_STAGE }
#Import ".\NMCUSTOMDRAW_DRAW_STATE_FLAGS.ahk" { NMCUSTOMDRAW_DRAW_STATE_FLAGS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NMCUSTOMDRAW.ahk" { NMCUSTOMDRAW }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information specific to an NM_CUSTOMDRAW notification code sent by a tooltip control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmttcustomdraw
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTTCUSTOMDRAW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomdraw">NMCUSTOMDRAW</a></b>
     * 
     * Contains general custom draw information.
     */
    nmcd : NMCUSTOMDRAW

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies how tooltip text will be formatted when it is displayed. An application may change this field to alter the way text is drawn. This value is passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawtext">DrawText</a> function internally. All values for the 
     * 					<i>uFormat</i> parameter of <b>DrawText</b> are valid.
     */
    uDrawFlags : UInt32

}
