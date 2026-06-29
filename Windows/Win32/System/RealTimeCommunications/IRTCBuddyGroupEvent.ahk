#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRTCBuddyGroup.ahk" { IRTCBuddyGroup }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCBuddy2.ahk" { IRTCBuddy2 }
#Import ".\RTC_GROUP_EVENT_TYPE.ahk" { RTC_GROUP_EVENT_TYPE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCBuddyGroupEvent extends IDispatch {
    /**
     * The interface identifier for IRTCBuddyGroupEvent
     * @type {Guid}
     */
    static IID := Guid("{3a79e1d1-b736-4414-96f8-bbc7f08863e4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCBuddyGroupEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_EventType  : IntPtr
        get_Group      : IntPtr
        get_Buddy      : IntPtr
        get_StatusCode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCBuddyGroupEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {RTC_GROUP_EVENT_TYPE} 
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
     * @returns {RTC_GROUP_EVENT_TYPE} 
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

    Query(iid) {
        if (IRTCBuddyGroupEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EventType := CallbackCreate(GetMethod(implObj, "get_EventType"), flags, 2)
        this.vtbl.get_Group := CallbackCreate(GetMethod(implObj, "get_Group"), flags, 2)
        this.vtbl.get_Buddy := CallbackCreate(GetMethod(implObj, "get_Buddy"), flags, 2)
        this.vtbl.get_StatusCode := CallbackCreate(GetMethod(implObj, "get_StatusCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EventType)
        CallbackFree(this.vtbl.get_Group)
        CallbackFree(this.vtbl.get_Buddy)
        CallbackFree(this.vtbl.get_StatusCode)
    }
}
