#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITTAPIObjectEvent.ahk" { ITTAPIObjectEvent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITPhone.ahk" { ITPhone }

/**
 * The ITTAPIObjectEvent2 interface is an extension of the ITTAPIObjectEvent interface. ITTAPIObjectEvent2 exposes an additional method that returns a pointer to an ITPhone interface on the phone object that caused the TAPI object event.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-ittapiobjectevent2
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITTAPIObjectEvent2 extends ITTAPIObjectEvent {
    /**
     * The interface identifier for ITTAPIObjectEvent2
     * @type {Guid}
     */
    static IID := Guid("{359dda6e-68ce-4383-bf0b-169133c41b46}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITTAPIObjectEvent2 interfaces
    */
    struct Vtbl extends ITTAPIObjectEvent.Vtbl {
        get_Phone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITTAPIObjectEvent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITPhone} 
     */
    Phone {
        get => this.get_Phone()
    }

    /**
     * The get_Phone method returns a pointer to the ITPhone interface on the phone object that caused this TAPI object event to be fired.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface returned by <b>ITTAPIObjectEvent2::get_Phone</b>. The application must call <b>Release</b> on the 
     * <b>ITPhone</b> interface to free resources associated with it.
     * @returns {ITPhone} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent2-get_phone
     */
    get_Phone() {
        result := ComCall(11, this, "ptr*", &ppPhone := 0, "HRESULT")
        return ITPhone(ppPhone)
    }

    Query(iid) {
        if (ITTAPIObjectEvent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Phone := CallbackCreate(GetMethod(implObj, "get_Phone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Phone)
    }
}
