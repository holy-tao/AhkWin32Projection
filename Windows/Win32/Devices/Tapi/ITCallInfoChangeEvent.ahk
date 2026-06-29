#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }
#Import ".\CALLINFOCHANGE_CAUSE.ahk" { CALLINFOCHANGE_CAUSE }

/**
 * The ITCallInfoChangeEvent interface contains methods that retrieve the description of call information change events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itcallinfochangeevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITCallInfoChangeEvent extends IDispatch {
    /**
     * The interface identifier for ITCallInfoChangeEvent
     * @type {Guid}
     */
    static IID := Guid("{5d4b65f9-e51c-11d1-a02f-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITCallInfoChangeEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Call             : IntPtr
        get_Cause            : IntPtr
        get_CallbackInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITCallInfoChangeEvent.Vtbl()
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
     * @type {CALLINFOCHANGE_CAUSE} 
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
     * The get_Call method returns the ITCallInfo interface on which call information has changed.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface returned by <b>ITCallInfoChangeEvent::get_Call</b>. The application must call <b>Release</b> on 
     * <b>ITCallInfo</b> to free resources associated with it.
     * @returns {ITCallInfo} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface on which information has changed.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfochangeevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * The get_Cause method gets a CALLINFOCHANGE_CAUSE description of the change.
     * @returns {CALLINFOCHANGE_CAUSE} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-callinfochange_cause">CALLINFOCHANGE_CAUSE</a> description of the call event that has occurred.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfochangeevent-get_cause
     */
    get_Cause() {
        result := ComCall(8, this, "int*", &pCIC := 0, "HRESULT")
        return pCIC
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with this event. (ITCallInfoChangeEvent.get_CallbackInstance)
     * @returns {Integer} Pointer to callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfochangeevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(9, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }

    Query(iid) {
        if (ITCallInfoChangeEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_Cause := CallbackCreate(GetMethod(implObj, "get_Cause"), flags, 2)
        this.vtbl.get_CallbackInstance := CallbackCreate(GetMethod(implObj, "get_CallbackInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_Cause)
        CallbackFree(this.vtbl.get_CallbackInstance)
    }
}
