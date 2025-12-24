#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUpdateServiceCollection.ahk
#Include .\IUpdateService.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Adds or removes the registration of the update service with Windows Update Agent or Automatic Updates.
 * @remarks
 * 
 * You can create an instance of this interface by using the UpdateServiceManager coclass. Use the Microsoft.Update.ServiceManager program identifier to create the object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateservicemanager
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateServiceManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateServiceManager
     * @type {Guid}
     */
    static IID => Guid("{23857e3c-02ba-44a3-9423-b1c900805f37}")

    /**
     * The class identifier for UpdateServiceManager
     * @type {Guid}
     */
    static CLSID => Guid("{f8d253d9-89a4-4daa-87b6-1168369f0b21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Services", "AddService", "RegisterServiceWithAU", "RemoveService", "UnregisterServiceWithAU", "AddScanPackageService", "SetOption"]

    /**
     * @type {IUpdateServiceCollection} 
     */
    Services {
        get => this.get_Services()
    }

    /**
     * Gets an IUpdateServiceCollection of the services that are registered with WUA.
     * @returns {IUpdateServiceCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager-get_services
     */
    get_Services() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateServiceCollection(retval)
    }

    /**
     * Registers a service with Windows Update Agent (WUA).
     * @param {BSTR} serviceID An identifier for a service to be registered.
     * @param {BSTR} authorizationCabPath The path of the Microsoft signed local cabinet file that has the information that is required for a service registration.
     * @returns {IUpdateService} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateservice">IUpdateService</a> interface that represents an added service.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager-addservice
     */
    AddService(serviceID, authorizationCabPath) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID
        authorizationCabPath := authorizationCabPath is String ? BSTR.Alloc(authorizationCabPath).Value : authorizationCabPath

        result := ComCall(8, this, "ptr", serviceID, "ptr", authorizationCabPath, "ptr*", &retval := 0, "HRESULT")
        return IUpdateService(retval)
    }

    /**
     * Registers a service with Automatic Updates.
     * @param {BSTR} serviceID An identifier for the service to be registered.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns  a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DS_UNKNOWNSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt to register an unknown service. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DS_NEEDWINDOWSSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Update service  could not be removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer could not access the update site, or the state of Automatic Updates could not be changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager-registerservicewithau
     */
    RegisterServiceWithAU(serviceID) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID

        result := ComCall(9, this, "ptr", serviceID, "HRESULT")
        return result
    }

    /**
     * Removes a service registration from Windows Update Agent (WUA).
     * @param {BSTR} serviceID An identifier for the service to be unregistered.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter value was invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DS_NEEDWINDOWSSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Update service  could not be removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DS_INVALIDOPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of Automatic Updates could not be changed. This error is returned if you try to delete the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DS_UNKNOWNSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempt to register  or remove an unknown service. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager-removeservice
     */
    RemoveService(serviceID) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID

        result := ComCall(10, this, "ptr", serviceID, "HRESULT")
        return result
    }

    /**
     * Unregisters a service with Automatic Updates.
     * @param {BSTR} serviceID An identifier for the service to be unregistered.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DS_NEEDWINDOWSSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Update service  could not be removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DS_INVALIDOPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of Automatic Updates could not be changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DS_UNKNOWNSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempt to register an unknown service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer could not access the update site.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_CALL_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the change.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager-unregisterservicewithau
     */
    UnregisterServiceWithAU(serviceID) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID

        result := ComCall(11, this, "ptr", serviceID, "HRESULT")
        return result
    }

    /**
     * Registers a scan package as a service with Windows Update Agent (WUA) and then returns an IUpdateService interface.
     * @param {BSTR} serviceName A descriptive name for the scan package service.
     * @param {BSTR} scanFileLocation The path of the Microsoft signed scan file that has to be registered as a service.
     * @param {Integer} flags Determines how to remove the service registration of the scan package. 
     * 
     * For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-updateserviceoption">UpdateServiceOption</a>.
     * @returns {IUpdateService} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateservice">IUpdateService</a> interface that contains service registration information.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager-addscanpackageservice
     */
    AddScanPackageService(serviceName, scanFileLocation, flags) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName
        scanFileLocation := scanFileLocation is String ? BSTR.Alloc(scanFileLocation).Value : scanFileLocation

        result := ComCall(12, this, "ptr", serviceName, "ptr", scanFileLocation, "int", flags, "ptr*", &ppService := 0, "HRESULT")
        return IUpdateService(ppService)
    }

    /**
     * Set options for the object that specifies the service ID. The SetOption method is also used to determine whether a warning is displayed when you change the registration of Automatic Updates.
     * @param {BSTR} optionName Set this parameter to AllowedServiceID to specify the form of the service ID that is provided to the object. 
     * 
     * Set to AllowWarningUI to display a warning when changing the Automatic Updates registration.
     * @param {VARIANT} optionValue If the <i>optionName</i> parameter is set to AllowServiceID,    the <i>optionValue</i> parameter is set to the service ID that is provided as a <b>VT_BSTR</b> value.  
     * 
     * If <i>optionName</i> is set to AllowWarningUI,    <i>optionValue</i> is a <b>VT_BOOL</b> value that specifies whether to display a warning when changing the registration of Automatic Updates.
     * 
     * Set the optionValue parameter to VARIANT_TRUE to display the warning UI. Set it to VARIANT_FALSE to suppress the warning UI.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows 
     * 
     * error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is not allowed to access the update site.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument of the method is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateservicemanager-setoption
     */
    SetOption(optionName, optionValue) {
        optionName := optionName is String ? BSTR.Alloc(optionName).Value : optionName

        result := ComCall(13, this, "ptr", optionName, "ptr", optionValue, "HRESULT")
        return result
    }
}
