#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RTC_MEDIA_EVENT_TYPE.ahk" { RTC_MEDIA_EVENT_TYPE }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_MEDIA_EVENT_REASON.ahk" { RTC_MEDIA_EVENT_REASON }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCMediaEvent extends IDispatch {
    /**
     * The interface identifier for IRTCMediaEvent
     * @type {Guid}
     */
    static IID := Guid("{099944fb-bcda-453e-8c41-e13da2adf7f3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCMediaEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_MediaType   : IntPtr
        get_EventType   : IntPtr
        get_EventReason : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCMediaEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MediaType {
        get => this.get_MediaType()
    }

    /**
     * @type {RTC_MEDIA_EVENT_TYPE} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * @type {RTC_MEDIA_EVENT_REASON} 
     */
    EventReason {
        get => this.get_EventReason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaType() {
        result := ComCall(7, this, "int*", &pMediaType := 0, "HRESULT")
        return pMediaType
    }

    /**
     * 
     * @returns {RTC_MEDIA_EVENT_TYPE} 
     */
    get_EventType() {
        result := ComCall(8, this, "int*", &penEventType := 0, "HRESULT")
        return penEventType
    }

    /**
     * 
     * @returns {RTC_MEDIA_EVENT_REASON} 
     */
    get_EventReason() {
        result := ComCall(9, this, "int*", &penEventReason := 0, "HRESULT")
        return penEventReason
    }

    Query(iid) {
        if (IRTCMediaEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MediaType := CallbackCreate(GetMethod(implObj, "get_MediaType"), flags, 2)
        this.vtbl.get_EventType := CallbackCreate(GetMethod(implObj, "get_EventType"), flags, 2)
        this.vtbl.get_EventReason := CallbackCreate(GetMethod(implObj, "get_EventReason"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MediaType)
        CallbackFree(this.vtbl.get_EventType)
        CallbackFree(this.vtbl.get_EventReason)
    }
}
