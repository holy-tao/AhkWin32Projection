#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CALL_STATE.ahk" { CALL_STATE }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CALL_STATE_EVENT_CAUSE.ahk" { CALL_STATE_EVENT_CAUSE }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITCallStateEvent interface contains methods that retrieve the description of call state events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itcallstateevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITCallStateEvent extends IDispatch {
    /**
     * The interface identifier for ITCallStateEvent
     * @type {Guid}
     */
    static IID := Guid("{62f47097-95c9-11d0-835d-00aa003ccabd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITCallStateEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Call             : IntPtr
        get_State            : IntPtr
        get_Cause            : IntPtr
        get_CallbackInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITCallStateEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {CALL_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {CALL_STATE_EVENT_CAUSE} 
     */
    Cause {
        get => this.get_Cause()
    }

    /**
     * @type {Integer} 
     */
    CallbackInstance {
        get => this.get_CallbackInstance()
    }

    /**
     * The get_Call method gets a pointer to the call information interface for the call on which the event has occurred. (ITCallStateEvent.get_Call)
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallstateevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_State method gets information on the new call state.
     * @returns {CALL_STATE} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_state">CALL_STATE</a> constant.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallstateevent-get_state
     */
    get_State() {
        result := ComCall(8, this, "int*", &pCallState := 0, "HRESULT")
        return pCallState
    }

    /**
     * The get_Cause method gets the cause associated with this event. (ITCallStateEvent.get_Cause)
     * @returns {CALL_STATE_EVENT_CAUSE} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_state_event_cause">CALL_STATE_EVENT_CAUSE</a> indicator.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallstateevent-get_cause
     */
    get_Cause() {
        result := ComCall(9, this, "int*", &pCEC := 0, "HRESULT")
        return pCEC
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with this event. (ITCallStateEvent.get_CallbackInstance)
     * @returns {Integer} Pointer to callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallstateevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }

    Query(iid) {
        if (ITCallStateEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_Cause := CallbackCreate(GetMethod(implObj, "get_Cause"), flags, 2)
        this.vtbl.get_CallbackInstance := CallbackCreate(GetMethod(implObj, "get_CallbackInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_Cause)
        CallbackFree(this.vtbl.get_CallbackInstance)
    }
}
