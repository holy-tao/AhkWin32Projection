#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITToneDetectionEvent interface exposes methods that allow an application to retrieve information about a tone detection event.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-ittonedetectionevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITToneDetectionEvent extends IDispatch {
    /**
     * The interface identifier for ITToneDetectionEvent
     * @type {Guid}
     */
    static IID := Guid("{407e0faf-d047-4753-b0c6-8e060373fecd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITToneDetectionEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Call             : IntPtr
        get_AppSpecific      : IntPtr
        get_TickCount        : IntPtr
        get_CallbackInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITToneDetectionEvent.Vtbl()
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
     * @type {Integer} 
     */
    AppSpecific {
        get => this.get_AppSpecific()
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
     * The get_Call method gets a pointer to the call information interface for the call object on which the tone detection event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface returned by <b>ITToneDetectionEvent::get_Call</b>. The application must call <b>Release</b> on the 
     * <b>ITCallInfo</b> interface to free resources associated with it.
     * @returns {ITCallInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittonedetectionevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCallInfo := 0, "HRESULT")
        return ITCallInfo(ppCallInfo)
    }

    /**
     * The get_AppSpecific method gets the application-defined tag that identifies the tone associated with the tone detection event.
     * @returns {Integer} Pointer to a value to receive the application-specific identifier for the tone, as defined in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itdetecttone">ITDetectTone</a> object or in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemonitortone">LINEMONITORTONE</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittonedetectionevent-get_appspecific
     */
    get_AppSpecific() {
        result := ComCall(8, this, "int*", &plAppSpecific := 0, "HRESULT")
        return plAppSpecific
    }

    /**
     * The get_TickCount method gets the &quot;tick count&quot; (the number of milliseconds since Windows started) at which the tone was detected.
     * @returns {Integer} Pointer to a value to receive the tick count.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittonedetectionevent-get_tickcount
     */
    get_TickCount() {
        result := ComCall(9, this, "int*", &plTickCount := 0, "HRESULT")
        return plTickCount
    }

    /**
     * The get_CallbackInstance method gets a pointer to the application's callback function that will process the event. (ITToneDetectionEvent.get_CallbackInstance)
     * @returns {Integer} Pointer to the callback instance returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittonedetectionevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }

    Query(iid) {
        if (ITToneDetectionEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_AppSpecific := CallbackCreate(GetMethod(implObj, "get_AppSpecific"), flags, 2)
        this.vtbl.get_TickCount := CallbackCreate(GetMethod(implObj, "get_TickCount"), flags, 2)
        this.vtbl.get_CallbackInstance := CallbackCreate(GetMethod(implObj, "get_CallbackInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_AppSpecific)
        CallbackFree(this.vtbl.get_TickCount)
        CallbackFree(this.vtbl.get_CallbackInstance)
    }
}
