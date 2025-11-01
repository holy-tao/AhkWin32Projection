#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCMediaRequestEvent extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_ProposedMedia", "get_CurrentMedia", "Accept", "get_RemotePreferredSecurityLevel", "Reject", "get_State"]

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
     * @param {Pointer<Integer>} plMediaTypes 
     * @returns {HRESULT} 
     */
    get_ProposedMedia(plMediaTypes) {
        plMediaTypesMarshal := plMediaTypes is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plMediaTypesMarshal, plMediaTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMediaTypes 
     * @returns {HRESULT} 
     */
    get_CurrentMedia(plMediaTypes) {
        plMediaTypesMarshal := plMediaTypes is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plMediaTypesMarshal, plMediaTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMediaTypes 
     * @returns {HRESULT} 
     */
    Accept(lMediaTypes) {
        result := ComCall(10, this, "int", lMediaTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @param {Pointer<Integer>} penSecurityLevel 
     * @returns {HRESULT} 
     */
    get_RemotePreferredSecurityLevel(enSecurityType, penSecurityLevel) {
        penSecurityLevelMarshal := penSecurityLevel is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", enSecurityType, penSecurityLevelMarshal, penSecurityLevel, "HRESULT")
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
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     */
    get_State(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pStateMarshal, pState, "HRESULT")
        return result
    }
}
