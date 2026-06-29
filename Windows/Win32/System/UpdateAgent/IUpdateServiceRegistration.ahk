#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IUpdateService2.ahk" { IUpdateService2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\UpdateServiceRegistrationState.ahk" { UpdateServiceRegistrationState }

/**
 * Contains information about the registration state of a service.
 * @remarks
 * You can create an instance of this interface by using the UpdateServiceRegistration coclass. Use the Microsoft.Update.ServiceRegistration program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateserviceregistration
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateServiceRegistration extends IDispatch {
    /**
     * The interface identifier for IUpdateServiceRegistration
     * @type {Guid}
     */
    static IID := Guid("{dde02280-12b3-4e0b-937b-6747f6acb286}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateServiceRegistration interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RegistrationState           : IntPtr
        get_ServiceID                   : IntPtr
        get_IsPendingRegistrationWithAU : IntPtr
        get_Service                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateServiceRegistration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UpdateServiceRegistrationState} 
     */
    RegistrationState {
        get => this.get_RegistrationState()
    }

    /**
     * @type {BSTR} 
     */
    ServiceID {
        get => this.get_ServiceID()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsPendingRegistrationWithAU {
        get => this.get_IsPendingRegistrationWithAU()
    }

    /**
     * @type {IUpdateService2} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * Gets an UpdateServiceRegistrationState value that indicates the current state of the service registration.
     * @returns {UpdateServiceRegistrationState} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateserviceregistration-get_registrationstate
     */
    get_RegistrationState() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ServiceID() {
        retval := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the service will also be registered with Automatic Updates, when added.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-updateserviceregistrationstate">RegistrationState</a> property is <b>usrsRegistrationPending</b>, registration with Automatic Updates is subject to the allowed settings that are specified in the authorization cabinet  file (.cab) for the service.  If the authorization cabinet file does not allow registration with Automatic Updates, the service will  be registered with Windows Update Agent (WUA). However, the service will  not be registered with Automatic Updates.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateserviceregistration-get_ispendingregistrationwithau
     */
    get_IsPendingRegistrationWithAU() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a pointer to an IUpdateService2 interface. This property is the default property.
     * @returns {IUpdateService2} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateserviceregistration-get_service
     */
    get_Service() {
        result := ComCall(10, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateService2(retval)
    }

    Query(iid) {
        if (IUpdateServiceRegistration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RegistrationState := CallbackCreate(GetMethod(implObj, "get_RegistrationState"), flags, 2)
        this.vtbl.get_ServiceID := CallbackCreate(GetMethod(implObj, "get_ServiceID"), flags, 2)
        this.vtbl.get_IsPendingRegistrationWithAU := CallbackCreate(GetMethod(implObj, "get_IsPendingRegistrationWithAU"), flags, 2)
        this.vtbl.get_Service := CallbackCreate(GetMethod(implObj, "get_Service"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RegistrationState)
        CallbackFree(this.vtbl.get_ServiceID)
        CallbackFree(this.vtbl.get_IsPendingRegistrationWithAU)
        CallbackFree(this.vtbl.get_Service)
    }
}
