#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCMediaRequestEvent extends IDispatch{
    /**
     * The interface identifier for IRTCMediaRequestEvent
     * @type {Guid}
     */
    static IID => Guid("{52572d15-148c-4d97-a36c-2da55c289d63}")

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
     * @param {Pointer<Int32>} plMediaTypes 
     * @returns {HRESULT} 
     */
    get_ProposedMedia(plMediaTypes) {
        result := ComCall(8, this, "int*", plMediaTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMediaTypes 
     * @returns {HRESULT} 
     */
    get_CurrentMedia(plMediaTypes) {
        result := ComCall(9, this, "int*", plMediaTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMediaTypes 
     * @returns {HRESULT} 
     */
    Accept(lMediaTypes) {
        result := ComCall(10, this, "int", lMediaTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @param {Pointer<Int32>} penSecurityLevel 
     * @returns {HRESULT} 
     */
    get_RemotePreferredSecurityLevel(enSecurityType, penSecurityLevel) {
        result := ComCall(11, this, "int", enSecurityType, "int*", penSecurityLevel, "int")
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
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    get_State(pState) {
        result := ComCall(13, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
