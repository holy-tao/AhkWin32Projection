#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCBuddyGroup.ahk
#Include .\IRTCBuddy2.ahk
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
     * @type {Integer} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * @type {IRTCBuddyGroup} 
     */
    Group {
        get => this.get_Group()
    }

    /**
     * @type {IRTCBuddy2} 
     */
    Buddy {
        get => this.get_Buddy()
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventType() {
        result := ComCall(7, this, "int*", &pEventType := 0, "HRESULT")
        return pEventType
    }

    /**
     * 
     * @returns {IRTCBuddyGroup} 
     */
    get_Group() {
        result := ComCall(8, this, "ptr*", &ppGroup := 0, "HRESULT")
        return IRTCBuddyGroup(ppGroup)
    }

    /**
     * 
     * @returns {IRTCBuddy2} 
     */
    get_Buddy() {
        result := ComCall(9, this, "ptr*", &ppBuddy := 0, "HRESULT")
        return IRTCBuddy2(ppBuddy)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(10, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }
}
