#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCSession2.ahk
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
     * @returns {IRTCSession2} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession2(ppSession)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProposedMedia() {
        result := ComCall(8, this, "int*", &plMediaTypes := 0, "HRESULT")
        return plMediaTypes
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentMedia() {
        result := ComCall(9, this, "int*", &plMediaTypes := 0, "HRESULT")
        return plMediaTypes
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
     * @returns {Integer} 
     */
    get_RemotePreferredSecurityLevel(enSecurityType) {
        result := ComCall(11, this, "int", enSecurityType, "int*", &penSecurityLevel := 0, "HRESULT")
        return penSecurityLevel
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
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(13, this, "int*", &pState := 0, "HRESULT")
        return pState
    }
}
