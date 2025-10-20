#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCBuddyGroupEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCBuddyGroupEvent
     * @type {Guid}
     */
    static IID => Guid("{3a79e1d1-b736-4414-96f8-bbc7f08863e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventType", "get_Group", "get_Buddy", "get_StatusCode"]

    /**
     * 
     * @param {Pointer<Integer>} pEventType 
     * @returns {HRESULT} 
     */
    get_EventType(pEventType) {
        result := ComCall(7, this, "int*", pEventType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCBuddyGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    get_Group(ppGroup) {
        result := ComCall(8, this, "ptr*", ppGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCBuddy2>} ppBuddy 
     * @returns {HRESULT} 
     */
    get_Buddy(ppBuddy) {
        result := ComCall(9, this, "ptr*", ppBuddy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        result := ComCall(10, this, "int*", plStatusCode, "HRESULT")
        return result
    }
}
