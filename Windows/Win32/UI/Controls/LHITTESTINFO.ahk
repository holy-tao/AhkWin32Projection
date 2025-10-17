#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk
#Include .\LITEM.ahk

/**
 * Used to get information about the link corresponding to a given location.
 * @remarks
 * 
  * To convert from screen coordinates to client coordinates, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-screentoclient">ScreenToClient</a>.
  * 
  * <div class="alert"><b>Note</b>  If the <a href="https://docs.microsoft.com/windows/desktop/Controls/lm-hittest">LM_HITTEST</a> message succeeds, the system fills in <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM.iLink</a> and <b>LITEM.szID</b>. If the <b>LM_HITTEST</b> message fails, do not assume that any information in <b>LITEM</b> is valid.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-lhittestinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LHITTESTINFO extends Win32Struct
{
    static sizeof => 4288

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * Location for the hit-test, in client coordinates (not screen coordinates).
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(0, this)
            return this.__pt
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a></b>
     * 
     * Receives information about the link corresponding to <b>pt</b>.
     * @type {LITEM}
     */
    item{
        get {
            if(!this.HasProp("__item"))
                this.__item := LITEM(8, this)
            return this.__item
        }
    }
}
