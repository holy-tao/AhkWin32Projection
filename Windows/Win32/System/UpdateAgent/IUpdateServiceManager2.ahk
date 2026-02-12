#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUpdateServiceRegistration.ahk
#Include .\IUpdateServiceManager.ahk

/**
 * Adds or removes the registration of the update service with Windows Update Agent or Automatic Updates. (IUpdateServiceManager2)
 * @remarks
 * You can create an instance of this interface by using the UpdateServiceManager coclass. Use the Microsoft.Update.ServiceManager program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nn-wuapi-iupdateservicemanager2
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
     * Gets and sets the identifier of the current client application. (Get)
     * @remarks
     * Returns the Unknown value if the client application has not set the property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iupdateservicemanager2-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(14, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * Gets and sets the identifier of the current client application. (Put)
     * @remarks
     * Returns the Unknown value if the client application has not set the property.
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iupdateservicemanager2-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        if(value is String) {
            pin := BSTR.Alloc(value)
            value := pin.Value
        }

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a pointer to an IUpdateServiceRegistration interface.
     * @param {BSTR} serviceID An identifier for the service to be registered.
     * @returns {IUpdateServiceRegistration} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateserviceregistration">IUpdateServiceRegistration</a> interface that represents an added service.
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iupdateservicemanager2-queryserviceregistration
     */
    QueryServiceRegistration(serviceID) {
        if(serviceID is String) {
            pin := BSTR.Alloc(serviceID)
            serviceID := pin.Value
        }

        result := ComCall(16, this, "ptr", serviceID, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUpdateServiceRegistration(retval)
    }

    /**
     * Registers a service with Windows Update Agent (WUA) without requiring an authorization cabinet file (.cab). This method also returns a pointer to an IUpdateServiceRegistration interface.
     * @remarks
     * This method may return <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/wua-networking-error-codes-">networking error codes</a> when the <b>asfAllowOnlineRegistration</b> flag is specified.
     * 
     * The <i>authorizationCabPath</i> parameter is optional for this method. If the <i>authorizationCabPath</i> parameter is not specified, it will be retrieved from the Windows Update server.
     * 
     * This method returns <b>E_INVALIDARG</b> if the <b>asfAllowOnlineRegistration</b> or <b>asfAllowPendingRegistration</b> flags are specified and if the value of the <i>authorizationCabPath</i> parameter is not an empty string.
     * 
     * This method returns <b>WU_E_DS_INVALIDOPERATION</b> if the requested change in the state of Automatic Updates is contrary to the specifications in the authorization cabinet file (.cab) when the <b>asfRegisterServiceWithAU</b> flag is specified. An error is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrust">WinVerifyTrust</a> function if the authorization cabinet file has not been signed.
     * 
     * The update agent and <b>AddService2</b> behave in the following ways depending on the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-addserviceflag">AddServiceFlag</a> values that you specify in the <i>flags</i> parameter:
     * 
     * <ul>
     * <li>If you specify <b>asfAllowOnlineRegistration</b> without <b>asfAllowPendingRegistration</b>, the update agent immediately attempts to go online to register the service. <b>AddService2</b> returns an HRESULT value that reflects the success or failure of the registration. If the registration fails, the update agent makes no future attempts to register the service.</li>
     * <li>If you specify <b>asfAllowPendingRegistration</b> without <b>asfAllowOnlineRegistration</b>, the update agent doesn't register the service immediately. <b>AddService2</b> returns  S_OK to indicate that the update agent will attempt to register the service at a later time, which doesn't guarantee that the registration will eventually succeed.</li>
     * <li>If you specify <b>asfAllowPendingRegistration</b> and <b>asfAllowOnlineRegistration</b> together, the update agent immediately attempts to go online to register the service. <b>AddService2</b> returns S_OK if the registration succeeds. <b>AddService2</b> returns a failure HRESULT value if the registration fails, but the update agent still attempts to register the service at a later time.</li>
     * <li>If you specify <b>asfAllowPendingRegistration</b>, <b>asfAllowOnlineRegistration</b>, or both, also specify <b>NULL</b> for the <i>authorizationCabPath</i> parameter.</li>
     * <li>If you specify neither <b>asfAllowPendingRegistration</b> nor <b>asfAllowOnlineRegistration</b> (in other words, if <i>flags</i> is either zero or <b>asfRegisterServiceWithAU</b>), you must specify a non-<b>NULL</b> path in the <i>authorizationCabPath</i> parameter. In this mode, <b>AddService2</b> processes the cabinet file (.cab) and registers the service in the same way as <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager-addservice">IUpdateServiceManager::AddService</a>.</li>
     * <li>If you specify <b>asfRegisterServiceWithAU</b>, the change to the default Automatic Updates service doesn't occur (and isn't reflected in the Windows Update user interface) until the service registration succeeds. This means that if the registration succeeds immediately (because you specified <b>asfAllowPendingRegistration</b> or supplied  a cabinet file (.cab)), the Automatic Updates service change also occurs immediately. If the registration doesn't succeed until later (because you specified <b>asfAllowPendingRegistration</b>), the Automatic Updates service change doesn't occur unless the pending service registration eventually succeeds.</li>
     * </ul>
     * @param {BSTR} serviceID An identifier for the service to be registered.
     * @param {Integer} flags A combination of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-addserviceflag">AddServiceFlag</a> values that are combined by using a bitwise OR operation. The resulting value specifies options for service registration. For more info, see Remarks.
     * @param {BSTR} authorizationCabPath The path of the Microsoft signed local cabinet file (.cab) that has the information that is required for a service registration.  If empty, the update agent searches for the authorization cabinet file (.cab) during service registration when a network connection is available.
     * @returns {IUpdateServiceRegistration} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateserviceregistration">IUpdateServiceRegistration</a> interface that represents an added service.
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iupdateservicemanager2-addservice2
     */
    AddService2(serviceID, flags, authorizationCabPath) {
        if(serviceID is String) {
            pin := BSTR.Alloc(serviceID)
            serviceID := pin.Value
        }
        if(authorizationCabPath is String) {
            pin := BSTR.Alloc(authorizationCabPath)
            authorizationCabPath := pin.Value
        }

        result := ComCall(17, this, "ptr", serviceID, "int", flags, "ptr", authorizationCabPath, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUpdateServiceRegistration(retval)
    }
}
