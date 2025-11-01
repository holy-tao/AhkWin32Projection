#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCMediaEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCMediaEvent
     * @type {Guid}
     */
    static IID => Guid("{099944fb-bcda-453e-8c41-e13da2adf7f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaType", "get_EventType", "get_EventReason"]

    /**
     * 
     * @param {Pointer<Integer>} pMediaType 
     * @returns {HRESULT} 
     */
    get_MediaType(pMediaType) {
        pMediaTypeMarshal := pMediaType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pMediaTypeMarshal, pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penEventType 
     * @returns {HRESULT} 
     */
    get_EventType(penEventType) {
        penEventTypeMarshal := penEventType is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, penEventTypeMarshal, penEventType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penEventReason 
     * @returns {HRESULT} 
     */
    get_EventReason(penEventReason) {
        penEventReasonMarshal := penEventReason is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, penEventReasonMarshal, penEventReason, "HRESULT")
        return result
    }
}
