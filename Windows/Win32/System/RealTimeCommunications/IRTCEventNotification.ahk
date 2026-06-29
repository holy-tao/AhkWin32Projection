#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_EVENT.ahk" { RTC_EVENT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCEventNotification extends IUnknown {
    /**
     * The interface identifier for IRTCEventNotification
     * @type {Guid}
     */
    static IID := Guid("{13fa24c7-5748-4b21-91f5-7397609ce747}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCEventNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Event : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCEventNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Event attribute is a string that specifies the event (or album) associated with a given photo.
     * @remarks
     * To determine whether you can change the value of this attribute, use the [Media.isReadOnlyItem](media-isreadonlyitem.md) method.
     * @param {RTC_EVENT} RTCEvent 
     * @param {IDispatch} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/event-attribute
     */
    Event(RTCEvent, pEvent) {
        result := ComCall(3, this, RTC_EVENT, RTCEvent, "ptr", pEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCEventNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Event := CallbackCreate(GetMethod(implObj, "Event"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Event)
    }
}
