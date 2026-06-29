#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_PROFILE_EVENT_TYPE.ahk" { RTC_PROFILE_EVENT_TYPE }
#Import ".\IRTCProfileEvent.ahk" { IRTCProfileEvent }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCProfileEvent2 extends IRTCProfileEvent {
    /**
     * The interface identifier for IRTCProfileEvent2
     * @type {Guid}
     */
    static IID := Guid("{62e56edc-03fa-4121-94fb-23493fd0ae64}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCProfileEvent2 interfaces
    */
    struct Vtbl extends IRTCProfileEvent.Vtbl {
        get_EventType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCProfileEvent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {RTC_PROFILE_EVENT_TYPE} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * 
     * @returns {RTC_PROFILE_EVENT_TYPE} 
     */
    get_EventType() {
        result := ComCall(10, this, "int*", &pEventType := 0, "HRESULT")
        return pEventType
    }

    Query(iid) {
        if (IRTCProfileEvent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EventType := CallbackCreate(GetMethod(implObj, "get_EventType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EventType)
    }
}
