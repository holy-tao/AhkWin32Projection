#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUpdateServiceRegistration.ahk
#Include .\IUpdateServiceManager.ahk

/**
 * Adds or removes the registration of the update service with Windows Update Agent or Automatic Updates.
 * @remarks
 * 
 * You can create an instance of this interface by using the UpdateServiceManager coclass. Use the Microsoft.Update.ServiceManager program identifier to create the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateservicemanager2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateServiceManager2 extends IUpdateServiceManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateServiceManager2
     * @type {Guid}
     */
    static IID => Guid("{0bb8531d-7e8d-424f-986c-a0b8f60a3e7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClientApplicationID", "put_ClientApplicationID", "QueryServiceRegistration", "AddService2"]

    /**
     * @type {BSTR} 
     */
    ClientApplicationID {
        get => this.get_ClientApplicationID()
        set => this.put_ClientApplicationID(value)
    }

    /**
     * Gets and sets the identifier of the current client application.
     * @remarks
     * 
     * Returns the Unknown value if the client application has not set the property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager2-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the identifier of the current client application.
     * @remarks
     * 
     * Returns the Unknown value if the client application has not set the property.
     * 
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager2-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(15, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Returns a pointer to an IUpdateServiceRegistration interface.
     * @param {BSTR} serviceID An identifier for the service to be registered.
     * @returns {IUpdateServiceRegistration} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateserviceregistration">IUpdateServiceRegistration</a> interface that represents an added service.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager2-queryserviceregistration
     */
    QueryServiceRegistration(serviceID) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID

        result := ComCall(16, this, "ptr", serviceID, "ptr*", &retval := 0, "HRESULT")
        return IUpdateServiceRegistration(retval)
    }

    /**
     * Registers a service with Windows Update Agent (WUA) without requiring an authorization cabinet file (.cab). This method also returns a pointer to an IUpdateServiceRegistration interface.
     * @param {BSTR} serviceID An identifier for the service to be registered.
     * @param {Integer} flags A combination of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-addserviceflag">AddServiceFlag</a> values that are combined by using a bitwise OR operation. The resulting value specifies options for service registration. For more info, see Remarks.
     * @param {BSTR} authorizationCabPath The path of the Microsoft signed local cabinet file (.cab) that has the information that is required for a service registration.  If empty, the update agent searches for the authorization cabinet file (.cab) during service registration when a network connection is available.
     * @returns {IUpdateServiceRegistration} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateserviceregistration">IUpdateServiceRegistration</a> interface that represents an added service.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager2-addservice2
     */
    AddService2(serviceID, flags, authorizationCabPath) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID
        authorizationCabPath := authorizationCabPath is String ? BSTR.Alloc(authorizationCabPath).Value : authorizationCabPath

        result := ComCall(17, this, "ptr", serviceID, "int", flags, "ptr", authorizationCabPath, "ptr*", &retval := 0, "HRESULT")
        return IUpdateServiceRegistration(retval)
    }
}
