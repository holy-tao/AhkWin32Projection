#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ClientApplicationID(retval) {
        result := ComCall(14, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} serviceID 
     * @param {Pointer<IUpdateServiceRegistration>} retval 
     * @returns {HRESULT} 
     */
    QueryServiceRegistration(serviceID, retval) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID

        result := ComCall(16, this, "ptr", serviceID, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} serviceID 
     * @param {Integer} flags 
     * @param {BSTR} authorizationCabPath 
     * @param {Pointer<IUpdateServiceRegistration>} retval 
     * @returns {HRESULT} 
     */
    AddService2(serviceID, flags, authorizationCabPath, retval) {
        serviceID := serviceID is String ? BSTR.Alloc(serviceID).Value : serviceID
        authorizationCabPath := authorizationCabPath is String ? BSTR.Alloc(authorizationCabPath).Value : authorizationCabPath

        result := ComCall(17, this, "ptr", serviceID, "int", flags, "ptr", authorizationCabPath, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
