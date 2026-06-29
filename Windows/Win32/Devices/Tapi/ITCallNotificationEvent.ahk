#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }
#Import ".\CALL_NOTIFICATION_EVENT.ahk" { CALL_NOTIFICATION_EVENT }

/**
 * The ITCallNotificationEvent interface contains methods that retrieve the description of call notification events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itcallnotificationevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITCallNotificationEvent extends IDispatch {
    /**
     * The interface identifier for ITCallNotificationEvent
     * @type {Guid}
     */
    static IID := Guid("{895801df-3dd6-11d1-8f30-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITCallNotificationEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Call             : IntPtr
        get_Event            : IntPtr
        get_CallbackInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITCallNotificationEvent.Vtbl()
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
     * @type {CALL_NOTIFICATION_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {Integer} 
     */
    CallbackInstance {
        get => this.get_CallbackInstance()
    }

    /**
     * The get_Call method returns the ITCallInfo interface on which a call event has occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface returned by <b>ITCallNotificationEvent::get_Call</b>. The application must call <b>Release</b> on 
     * <b>ITCallInfo</b> to free resources associated with it.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface on which call event has occurred.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallnotificationevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * The get_Event method returns a CALL_NOTIFICATION_EVENT description of whether the application owns or is monitoring the call on which the event has occurred.
     * @returns {CALL_NOTIFICATION_EVENT} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-call_notification_event">CALL_NOTIFICATION_EVENT</a> description of the application's privilege on the call returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itcallnotificationevent-get_call">ITCallNotificationEvent::get_Call</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallnotificationevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pCallNotificationEvent := 0, "HRESULT")
        return pCallNotificationEvent
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with this event. (ITCallNotificationEvent.get_CallbackInstance)
     * @returns {Integer} Pointer to callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallnotificationevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(9, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }

    Query(iid) {
        if (ITCallNotificationEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
        this.vtbl.get_CallbackInstance := CallbackCreate(GetMethod(implObj, "get_CallbackInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_Event)
        CallbackFree(this.vtbl.get_CallbackInstance)
    }
}
