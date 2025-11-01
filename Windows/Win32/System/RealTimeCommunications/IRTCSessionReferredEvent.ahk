#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionReferredEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionReferredEvent
     * @type {Guid}
     */
    static IID => Guid("{176a6828-4fcc-4f28-a862-04597a6cf1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_ReferredByURI", "get_ReferToURI", "get_ReferCookie", "Accept", "Reject", "SetReferredSessionState"]

    /**
     * 
     * @param {Pointer<IRTCSession2>} ppSession 
     * @returns {HRESULT} 
     */
    get_Session(ppSession) {
        result := ComCall(7, this, "ptr*", ppSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReferredByURI 
     * @returns {HRESULT} 
     */
    get_ReferredByURI(pbstrReferredByURI) {
        result := ComCall(8, this, "ptr", pbstrReferredByURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReferoURI 
     * @returns {HRESULT} 
     */
    get_ReferToURI(pbstrReferoURI) {
        result := ComCall(9, this, "ptr", pbstrReferoURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReferCookie 
     * @returns {HRESULT} 
     */
    get_ReferCookie(pbstrReferCookie) {
        result := ComCall(10, this, "ptr", pbstrReferCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Accept() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reject() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enState 
     * @returns {HRESULT} 
     */
    SetReferredSessionState(enState) {
        result := ComCall(13, this, "int", enState, "HRESULT")
        return result
    }
}
