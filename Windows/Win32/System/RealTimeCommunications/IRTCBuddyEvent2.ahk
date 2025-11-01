#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCBuddyEvent.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCBuddyEvent2 extends IRTCBuddyEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCBuddyEvent2
     * @type {Guid}
     */
    static IID => Guid("{484a7f1e-73f0-4990-bfc2-60bc3978a720}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "get_StatusCode", "get_StatusText"]

    /**
     * 
     * @param {Pointer<Integer>} pEventType 
     * @returns {HRESULT} 
     */
    get_EventType(pEventType) {
        pEventTypeMarshal := pEventType is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pEventTypeMarshal, pEventType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        plStatusCodeMarshal := plStatusCode is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plStatusCodeMarshal, plStatusCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrStatusText 
     * @returns {HRESULT} 
     */
    get_StatusText(pbstrStatusText) {
        result := ComCall(10, this, "ptr", pbstrStatusText, "HRESULT")
        return result
    }
}
