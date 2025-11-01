#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCProfileEvent.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCProfileEvent2 extends IRTCProfileEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCProfileEvent2
     * @type {Guid}
     */
    static IID => Guid("{62e56edc-03fa-4121-94fb-23493fd0ae64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType"]

    /**
     * 
     * @param {Pointer<Integer>} pEventType 
     * @returns {HRESULT} 
     */
    get_EventType(pEventType) {
        pEventTypeMarshal := pEventType is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pEventTypeMarshal, pEventType, "HRESULT")
        return result
    }
}
