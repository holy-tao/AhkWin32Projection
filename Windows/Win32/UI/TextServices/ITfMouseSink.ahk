#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfMouseSink interface is implemented by a text service to receive mouse event notifications. A mouse event sink is installed with the ITfMouseTracker::AdviseMouseSink method of one of the ITfMouseTracker interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfmousesink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfMouseSink extends IUnknown {
    /**
     * The interface identifier for ITfMouseSink
     * @type {Guid}
     */
    static IID := Guid("{a1adaaa2-3a24-449d-ac96-5183e7f5c217}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfMouseSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnMouseEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfMouseSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfmousesink-onmouseevent
     */
    OnMouseEvent(uEdge, uQuadrant, dwBtnStatus) {
        result := ComCall(3, this, "uint", uEdge, "uint", uQuadrant, "uint", dwBtnStatus, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    Query(iid) {
        if (ITfMouseSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnMouseEvent := CallbackCreate(GetMethod(implObj, "OnMouseEvent"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnMouseEvent)
    }
}
