#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITAddress.ahk" { ITAddress }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TAPIOBJECT_EVENT.ahk" { TAPIOBJECT_EVENT }
#Import ".\ITTAPI.ahk" { ITTAPI }

/**
 * The ITTAPIObjectEvent interface contains methods that retrieve the description of TAPI object events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-ittapiobjectevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITTAPIObjectEvent extends IDispatch {
    /**
     * The interface identifier for ITTAPIObjectEvent
     * @type {Guid}
     */
    static IID := Guid("{f4854d48-937a-11d1-bb58-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITTAPIObjectEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_TAPIObject       : IntPtr
        get_Event            : IntPtr
        get_Address          : IntPtr
        get_CallbackInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITTAPIObjectEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITTAPI} 
     */
    TAPIObject {
        get => this.get_TAPIObject()
    }

    /**
     * @type {TAPIOBJECT_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {ITAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * @type {Integer} 
     */
    CallbackInstance {
        get => this.get_CallbackInstance()
    }

    /**
     * The get_TAPIObject method gets a pointer to the TAPI object on which the event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ittapi">ITTAPI</a> interface returned by <b>ITTAPIObjectEvent::get_TAPIObject</b>. The application must call <b>Release</b> on the 
     * <b>ITTAPI</b> interface to free resources associated with it.
     * @returns {ITTAPI} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ittapi">ITTAPI</a> interface of the TAPI object on which the event occurred.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_tapiobject
     */
    get_TAPIObject() {
        result := ComCall(7, this, "ptr*", &ppTAPIObject := 0, "HRESULT")
        return ITTAPI(ppTAPIObject)
    }

    /**
     * The get_Event method gets information concerning an asynchronous event notification. The application uses TAPIOBJECT_EVENT to determine what type of event is being signaled.
     * @returns {TAPIOBJECT_EVENT} <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapiobject_event">TAPIOBJECT_EVENT</a> indicator of the event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * The get_Address method gets a pointer to the Address object on which the event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface returned by <b>ITTAPIObjectEvent::get_Address</b>. The application must call <b>Release</b> on the 
     * <b>ITAddress</b> interface to free resources associated with it.
     * @returns {ITAddress} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_address
     */
    get_Address() {
        result := ComCall(9, this, "ptr*", &ppAddress := 0, "HRESULT")
        return ITAddress(ppAddress)
    }

    /**
     * The get_CallbackInstance method gets a pointer to the callback instance associated with the event. (ITTAPIObjectEvent.get_CallbackInstance)
     * @returns {Integer} Pointer to the callback instance returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }

    Query(iid) {
        if (ITTAPIObjectEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TAPIObject := CallbackCreate(GetMethod(implObj, "get_TAPIObject"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
        this.vtbl.get_Address := CallbackCreate(GetMethod(implObj, "get_Address"), flags, 2)
        this.vtbl.get_CallbackInstance := CallbackCreate(GetMethod(implObj, "get_CallbackInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TAPIObject)
        CallbackFree(this.vtbl.get_Event)
        CallbackFree(this.vtbl.get_Address)
        CallbackFree(this.vtbl.get_CallbackInstance)
    }
}
