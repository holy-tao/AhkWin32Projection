#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRTCWatcherEvent.ahk" { IRTCWatcherEvent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_WATCHER_EVENT_TYPE.ahk" { RTC_WATCHER_EVENT_TYPE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCWatcherEvent2 extends IRTCWatcherEvent {
    /**
     * The interface identifier for IRTCWatcherEvent2
     * @type {Guid}
     */
    static IID := Guid("{e52891e8-188c-49af-b005-98ed13f83f9c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCWatcherEvent2 interfaces
    */
    struct Vtbl extends IRTCWatcherEvent.Vtbl {
        get_EventType  : IntPtr
        get_StatusCode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCWatcherEvent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {RTC_WATCHER_EVENT_TYPE} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * 
     * @returns {RTC_WATCHER_EVENT_TYPE} 
     */
    get_EventType() {
        result := ComCall(8, this, "int*", &pEventType := 0, "HRESULT")
        return pEventType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(9, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    Query(iid) {
        if (IRTCWatcherEvent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EventType := CallbackCreate(GetMethod(implObj, "get_EventType"), flags, 2)
        this.vtbl.get_StatusCode := CallbackCreate(GetMethod(implObj, "get_StatusCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EventType)
        CallbackFree(this.vtbl.get_StatusCode)
    }
}
