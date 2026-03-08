#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class ISimpleConnectionPoint extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimpleConnectionPoint
     * @type {Guid}
     */
    static IID => Guid("{51973c3e-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventCount", "DescribeEvents", "Advise", "Unadvise"]

    /**
     * 
     * @returns {Integer} 
     */
    GetEventCount() {
        result := ComCall(3, this, "uint*", &pulCount := 0, "HRESULT")
        return pulCount
    }

    /**
     * 
     * @param {Integer} iEvent 
     * @param {Integer} cEvents 
     * @param {Pointer<Integer>} prgid 
     * @param {Pointer<BSTR>} prgbstr 
     * @param {Pointer<Integer>} pcEventsFetched 
     * @returns {HRESULT} 
     */
    DescribeEvents(iEvent, cEvents, prgid, prgbstr, pcEventsFetched) {
        prgidMarshal := prgid is VarRef ? "int*" : "ptr"
        pcEventsFetchedMarshal := pcEventsFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", iEvent, "uint", cEvents, prgidMarshal, prgid, "ptr", prgbstr, pcEventsFetchedMarshal, pcEventsFetched, "HRESULT")
        return result
    }

    /**
     * Stops the recognizer from processing ink because a stroke has been added or deleted.
     * @remarks
     * The <b>AdviseInkChange</b> function signals that there will be additional calls to the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function. This enables any recognition already in progress to stop at any convenient point. Recognition completion is one such point, so <b>AdviseInkChange</b> can safely do nothing.
     * 
     * For example, if you have two threads, one thread may be using <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> and <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-process">Process</a> with other functions to obtain results. The other thread may be collecting ink, echoing it, and queuing tasks for the first thread. The second thread calls <b>AdviseInkChange</b> to notify the recognizer a change is coming. This enables the first thread to return to the caller sooner than without the call to <b>AdviseInkChange</b>. The first thread can then call the recognizer again with more ink.
     * 
     * If you set the bNewStroke parameter to <b>FALSE</b> because a stroke was modified or deleted, you must also call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-resetcontext">ResetContext</a> function, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function to add the strokes from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object to the recognizer context. This is done automatically if you attach the recognizer context to the <b>InkDisp</b> object.
     * @param {IDispatch} pdisp 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-adviseinkchange
     */
    Advise(pdisp) {
        result := ComCall(5, this, "ptr", pdisp, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
