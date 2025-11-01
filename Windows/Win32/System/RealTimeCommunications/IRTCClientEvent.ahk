#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClientEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCClientEvent
     * @type {Guid}
     */
    static IID => Guid("{2b493b7a-3cba-4170-9c8b-76a9dacdd644}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "get_Client"]

    /**
     * 
     * @param {Pointer<Integer>} penEventType 
     * @returns {HRESULT} 
     */
    get_EventType(penEventType) {
        penEventTypeMarshal := penEventType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, penEventTypeMarshal, penEventType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCClient>} ppClient 
     * @returns {HRESULT} 
     */
    get_Client(ppClient) {
        result := ComCall(8, this, "ptr*", ppClient, "HRESULT")
        return result
    }
}
