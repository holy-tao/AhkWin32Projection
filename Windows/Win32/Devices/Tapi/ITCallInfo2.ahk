#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TAPI_EVENT.ahk" { TAPI_EVENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The ITCallInfo2 interface is an extension of the ITCallInfo interface. ITCallInfo2 provides additional methods that allow an application to set event filtering on a per-call basis.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itcallinfo2
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITCallInfo2 extends ITCallInfo {
    /**
     * The interface identifier for ITCallInfo2
     * @type {Guid}
     */
    static IID := Guid("{94d70ca6-7ab0-4daa-81ca-b8f8643faec1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITCallInfo2 interfaces
    */
    struct Vtbl extends ITCallInfo.Vtbl {
        get_EventFilter : IntPtr
        put_EventFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITCallInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The get_EventFilter method gets the event filter information applicable to this call.
     * @param {TAPI_EVENT} TapiEvent The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapi_event">TAPI_EVENT</a> descriptor of event type information being checked.
     * @param {Integer} lSubEvent Subevent descriptor.
     * @returns {VARIANT_BOOL} VARIANT_TRUE if notifications are being sent on this event type for this call.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo2-get_eventfilter
     */
    get_EventFilter(TapiEvent, lSubEvent) {
        result := ComCall(20, this, TAPI_EVENT, TapiEvent, "int", lSubEvent, VARIANT_BOOL.Ptr, &pEnable := 0, "HRESULT")
        return pEnable
    }

    /**
     * The put_EventFilter method sets an event filter for the current call.
     * @param {TAPI_EVENT} TapiEvent The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapi_event">TAPI_EVENT</a> descriptor of the event type.
     * @param {Integer} lSubEvent Subevent descriptor.
     * @param {VARIANT_BOOL} bEnable VARIANT_TRUE if application requires notification of this event type. VARIANT_FALSE indicates the application does not require notifications for this event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo2-put_eventfilter
     */
    put_EventFilter(TapiEvent, lSubEvent, bEnable) {
        result := ComCall(21, this, TAPI_EVENT, TapiEvent, "int", lSubEvent, VARIANT_BOOL, bEnable, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITCallInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EventFilter := CallbackCreate(GetMethod(implObj, "get_EventFilter"), flags, 4)
        this.vtbl.put_EventFilter := CallbackCreate(GetMethod(implObj, "put_EventFilter"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EventFilter)
        CallbackFree(this.vtbl.put_EventFilter)
    }
}
