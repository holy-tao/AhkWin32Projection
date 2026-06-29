#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LIST_ITEM_FLAGS.ahk" { LIST_ITEM_FLAGS }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\LITEM.ahk" { LITEM }
#Import ".\LIST_ITEM_STATE_FLAGS.ahk" { LIST_ITEM_STATE_FLAGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Used to get information about the link corresponding to a given location.
 * @remarks
 * To convert from screen coordinates to client coordinates, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-screentoclient">ScreenToClient</a>.
 * 
 * <div class="alert"><b>Note</b>  If the <a href="https://docs.microsoft.com/windows/desktop/Controls/lm-hittest">LM_HITTEST</a> message succeeds, the system fills in <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM.iLink</a> and <b>LITEM.szID</b>. If the <b>LM_HITTEST</b> message fails, do not assume that any information in <b>LITEM</b> is valid.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lhittestinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LHITTESTINFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * Location for the hit-test, in client coordinates (not screen coordinates).
     */
    pt : POINT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a></b>
     * 
     * Receives information about the link corresponding to <b>pt</b>.
     */
    item : LITEM

}
