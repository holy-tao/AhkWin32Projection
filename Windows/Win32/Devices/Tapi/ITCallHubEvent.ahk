#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ITCallHub.ahk" { ITCallHub }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }
#Import ".\CALLHUB_EVENT.ahk" { CALLHUB_EVENT }

/**
 * The ITCallHubEvent interface contains methods that retrieve the description of CallHub events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itcallhubevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITCallHubEvent extends IDispatch {
    /**
     * The interface identifier for ITCallHubEvent
     * @type {Guid}
     */
    static IID := Guid("{a3c15451-5b92-11d1-8f4e-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITCallHubEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Event   : IntPtr
        get_CallHub : IntPtr
        get_Call    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITCallHubEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {CALLHUB_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {ITCallHub} 
     */
    CallHub {
        get => this.get_CallHub()
    }

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * The get_Event method returns a pointer to a CALLHUB_EVENT enum description of the event that occurred.
     * @returns {CALLHUB_EVENT} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callhub_event">CALLHUB_EVENT</a> enum description of the event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhubevent-get_event
     */
    get_Event() {
        result := ComCall(7, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * The get_CallHub method returns a pointer to the ITCallHub interface on which the event occurred. (ITCallHubEvent.get_CallHub)
     * @returns {ITCallHub} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallhub">ITCallHub</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhubevent-get_callhub
     */
    get_CallHub() {
        result := ComCall(8, this, "ptr*", &ppCallHub := 0, "HRESULT")
        return ITCallHub(ppCallHub)
    }

    /**
     * The get_Call method returns a pointer to the ITCallInfo interface of the call on which the event occurred. (ITCallHubEvent.get_Call)
     * @remarks
     * This method may return a <b>NULL</b> if the event is not associated with a call.
     * @returns {ITCallInfo} <b>ITCallInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhubevent-get_call
     */
    get_Call() {
        result := ComCall(9, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    Query(iid) {
        if (ITCallHubEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
        this.vtbl.get_CallHub := CallbackCreate(GetMethod(implObj, "get_CallHub"), flags, 2)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Event)
        CallbackFree(this.vtbl.get_CallHub)
        CallbackFree(this.vtbl.get_Call)
    }
}
