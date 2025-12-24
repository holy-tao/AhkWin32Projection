#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUpdateService2.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about the registration state of a service.
 * @remarks
 * 
 * You can create an instance of this interface by using the UpdateServiceRegistration coclass. Use the Microsoft.Update.ServiceRegistration program identifier to create the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateserviceregistration
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateServiceRegistration extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateServiceRegistration
     * @type {Guid}
     */
    static IID => Guid("{dde02280-12b3-4e0b-937b-6747f6acb286}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RegistrationState", "get_ServiceID", "get_IsPendingRegistrationWithAU", "get_Service"]

    /**
     * @type {Integer} 
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
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateserviceregistration-get_registrationstate
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
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the service will also be registered with Automatic Updates, when added.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-updateserviceregistrationstate">RegistrationState</a> property is <b>usrsRegistrationPending</b>, registration with Automatic Updates is subject to the allowed settings that are specified in the authorization cabinet  file (.cab) for the service.  If the authorization cabinet file does not allow registration with Automatic Updates, the service will  be registered with Windows Update Agent (WUA). However, the service will  not be registered with Automatic Updates.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateserviceregistration-get_ispendingregistrationwithau
     */
    get_IsPendingRegistrationWithAU() {
        result := ComCall(9, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a pointer to an IUpdateService2 interface. This property is the default property.
     * @returns {IUpdateService2} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateserviceregistration-get_service
     */
    get_Service() {
        result := ComCall(10, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateService2(retval)
    }
}
