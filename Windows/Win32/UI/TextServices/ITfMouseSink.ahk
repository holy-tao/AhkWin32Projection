#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfMouseSink interface is implemented by a text service to receive mouse event notifications. A mouse event sink is installed with the ITfMouseTracker::AdviseMouseSink method of one of the ITfMouseTracker interfaces.
 * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nn-msctf-itfmousesink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfMouseSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfMouseSink
     * @type {Guid}
     */
    static IID => Guid("{a1adaaa2-3a24-449d-ac96-5183e7f5c217}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnMouseEvent"]

    /**
     * ITfMouseSink::OnMouseEvent method
     * @remarks
     * The caller should translate double-click events into multiple mouse button down events. This enables a text service to detect double-click events even if the context window does not support double-clicks.
     * 
     * <i>uEdge</i> contains the offset, in characters, of the mouse position from the start of the text range. The mouse position is always rounded to the closest edge. Each edge is divided into four equal quadrants with two quadrants preceding the edge and two quadrants following the edge. <i>uQuadrant</i> contains the zero-based quadrant index of the mouse position. In the figure below, point "X" is in quadrant 2 of edge 1 and point "Y" is in quadrant 1 of edge 3.
     * 
     * <img alt="Quadrant relationship to edge of a range of text" border="border" src="./images/mousedge.gif"/>
     * @param {Integer} uEdge Contains the offset, in characters, of the mouse position from the start of the range of text. For more information, see the Remarks section.
     * @param {Integer} uQuadrant Contains the zero-based quadrant index, relative to the edge, that the mouse position lies in. For more information, see the Remarks section.
     * @param {Integer} dwBtnStatus Indicates the mouse button state at the time of the event. See the <i>wParam</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousemove">WM_MOUSEMOVE</a> message for possible values.
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the mouse event was handled. If this value receives <b>TRUE</b>, the mouse event was handled. If this value is <b>FALSE</b>, the mouse event was not handled.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfmousesink-onmouseevent
     */
    OnMouseEvent(uEdge, uQuadrant, dwBtnStatus) {
        result := ComCall(3, this, "uint", uEdge, "uint", uQuadrant, "uint", dwBtnStatus, "int*", &pfEaten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEaten
    }
}
