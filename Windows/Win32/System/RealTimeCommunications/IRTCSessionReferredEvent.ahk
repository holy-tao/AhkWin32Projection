#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionReferredEvent extends IDispatch{
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
     * 
     * @param {Pointer<IRTCSession2>} ppSession 
     * @returns {HRESULT} 
     */
    get_Session(ppSession) {
        result := ComCall(7, this, "ptr", ppSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReferredByURI 
     * @returns {HRESULT} 
     */
    get_ReferredByURI(pbstrReferredByURI) {
        result := ComCall(8, this, "ptr", pbstrReferredByURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReferoURI 
     * @returns {HRESULT} 
     */
    get_ReferToURI(pbstrReferoURI) {
        result := ComCall(9, this, "ptr", pbstrReferoURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReferCookie 
     * @returns {HRESULT} 
     */
    get_ReferCookie(pbstrReferCookie) {
        result := ComCall(10, this, "ptr", pbstrReferCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Accept() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reject() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enState 
     * @returns {HRESULT} 
     */
    SetReferredSessionState(enState) {
        result := ComCall(13, this, "int", enState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
