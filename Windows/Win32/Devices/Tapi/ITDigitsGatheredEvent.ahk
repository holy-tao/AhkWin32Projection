#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\TAPI_GATHERTERM.ahk" { TAPI_GATHERTERM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITDigitsGatheredEvent interface exposes methods that allow an application to retrieve data when the TAPI Server sends an event indicating that the Server has gathered digits required by the application.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itdigitsgatheredevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITDigitsGatheredEvent extends IDispatch {
    /**
     * The interface identifier for ITDigitsGatheredEvent
     * @type {Guid}
     */
    static IID := Guid("{e52ec4c1-cba3-441a-9e6a-93cb909e9724}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITDigitsGatheredEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Call              : IntPtr
        get_Digits            : IntPtr
        get_GatherTermination : IntPtr
        get_TickCount         : IntPtr
        get_CallbackInstance  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITDigitsGatheredEvent.Vtbl()
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
     * @type {BSTR} 
     */
    Digits {
        get => this.get_Digits()
    }

    /**
     * @type {TAPI_GATHERTERM} 
     */
    GatherTermination {
        get => this.get_GatherTermination()
    }

    /**
     * @type {Integer} 
     */
    TickCount {
        get => this.get_TickCount()
    }

    /**
     * @type {Integer} 
     */
    CallbackInstance {
        get => this.get_CallbackInstance()
    }

    /**
     * The get_Call method gets a pointer to the call information interface for the call object on which the event occurred.
     * @returns {ITCallInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_Digits method gets the gathered digits for the call.
     * @returns {BSTR} Pointer to a <b>BSTR</b> where the gathered digits are stored.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_digits
     */
    get_Digits() {
        ppDigits := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, ppDigits, "HRESULT")
        return ppDigits
    }

    /**
     * The get_GatherTermination method gets the reason why the TAPI Server terminated the gathering of digits on the call.
     * @returns {TAPI_GATHERTERM} Pointer to a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapi_gatherterm">TAPI_GATHERTERM</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_gathertermination
     */
    get_GatherTermination() {
        result := ComCall(9, this, "int*", &pGatherTermination := 0, "HRESULT")
        return pGatherTermination
    }

    /**
     * The get_TickCount method gets the &quot;tick count&quot; (the number of milliseconds since Windows started) at which digit-gathering completed.
     * @returns {Integer} Pointer to a value to receive the tick count.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(10, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * The get_CallbackInstance method gets a pointer to the application's callback function that will process the event. (ITDigitsGatheredEvent.get_CallbackInstance)
     * @returns {Integer} Pointer to the callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itdigitsgatheredevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(11, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }

    Query(iid) {
        if (ITDigitsGatheredEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_Digits := CallbackCreate(GetMethod(implObj, "get_Digits"), flags, 2)
        this.vtbl.get_GatherTermination := CallbackCreate(GetMethod(implObj, "get_GatherTermination"), flags, 2)
        this.vtbl.get_TickCount := CallbackCreate(GetMethod(implObj, "get_TickCount"), flags, 2)
        this.vtbl.get_CallbackInstance := CallbackCreate(GetMethod(implObj, "get_CallbackInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_Digits)
        CallbackFree(this.vtbl.get_GatherTermination)
        CallbackFree(this.vtbl.get_TickCount)
        CallbackFree(this.vtbl.get_CallbackInstance)
    }
}
