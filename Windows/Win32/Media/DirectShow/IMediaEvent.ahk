#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMediaEvent interface contains methods for retrieving event notifications and for overriding the Filter Graph Manager's default handling of events.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-imediaevent
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEvent
     * @type {Guid}
     */
    static IID => Guid("{56a868b6-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventHandle", "GetEvent", "WaitForCompletion", "CancelDefaultHandling", "RestoreDefaultHandling", "FreeEventParams"]

    /**
     * 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-geteventhandle
     */
    GetEventHandle() {
        result := ComCall(7, this, "ptr*", &hEvent := 0, "HRESULT")
        return hEvent
    }

    /**
     * 
     * @param {Pointer<Integer>} lEventCode 
     * @param {Pointer<Pointer>} lParam1 
     * @param {Pointer<Pointer>} lParam2 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-getevent
     */
    GetEvent(lEventCode, lParam1, lParam2, msTimeout) {
        lEventCodeMarshal := lEventCode is VarRef ? "int*" : "ptr"
        lParam1Marshal := lParam1 is VarRef ? "ptr*" : "ptr"
        lParam2Marshal := lParam2 is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, lEventCodeMarshal, lEventCode, lParam1Marshal, lParam1, lParam2Marshal, lParam2, "int", msTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-waitforcompletion
     */
    WaitForCompletion(msTimeout) {
        result := ComCall(9, this, "int", msTimeout, "int*", &pEvCode := 0, "HRESULT")
        return pEvCode
    }

    /**
     * 
     * @param {Integer} lEvCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-canceldefaulthandling
     */
    CancelDefaultHandling(lEvCode) {
        result := ComCall(10, this, "int", lEvCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lEvCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-restoredefaulthandling
     */
    RestoreDefaultHandling(lEvCode) {
        result := ComCall(11, this, "int", lEvCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lEvCode 
     * @param {Pointer} lParam1 
     * @param {Pointer} lParam2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaevent-freeeventparams
     */
    FreeEventParams(lEvCode, lParam1, lParam2) {
        result := ComCall(12, this, "int", lEvCode, "ptr", lParam1, "ptr", lParam2, "HRESULT")
        return result
    }
}
