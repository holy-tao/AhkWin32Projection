#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IUpdateServiceCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicemanager-get_services
     */
    get_Services(retval) {
        result := ComCall(7, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} serviceID 
     * @param {BSTR} authorizationCabPath 
     * @param {Pointer<IUpdateService>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicemanager-addservice
     */
    AddService(serviceID, authorizationCabPath, retval) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID
        authorizationCabPath := authorizationCabPath is String ? BSTR.Alloc(authorizationCabPath).Value : authorizationCabPath

        result := ComCall(8, this, "ptr", serviceID, "ptr", authorizationCabPath, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} serviceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicemanager-registerservicewithau
     */
    RegisterServiceWithAU(serviceID) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID

        result := ComCall(9, this, "ptr", serviceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} serviceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicemanager-removeservice
     */
    RemoveService(serviceID) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID

        result := ComCall(10, this, "ptr", serviceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} serviceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicemanager-unregisterservicewithau
     */
    UnregisterServiceWithAU(serviceID) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID

        result := ComCall(11, this, "ptr", serviceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} serviceName 
     * @param {BSTR} scanFileLocation 
     * @param {Integer} flags 
     * @param {Pointer<IUpdateService>} ppService 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicemanager-addscanpackageservice
     */
    AddScanPackageService(serviceName, scanFileLocation, flags, ppService) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName
        scanFileLocation := scanFileLocation is String ? BSTR.Alloc(scanFileLocation).Value : scanFileLocation

        result := ComCall(12, this, "ptr", serviceName, "ptr", scanFileLocation, "int", flags, "ptr*", ppService, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} optionName 
     * @param {VARIANT} optionValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicemanager-setoption
     */
    SetOption(optionName, optionValue) {
        optionName := optionName is String ? BSTR.Alloc(optionName).Value : optionName

        result := ComCall(13, this, "ptr", optionName, "ptr", optionValue, "HRESULT")
        return result
    }
}
