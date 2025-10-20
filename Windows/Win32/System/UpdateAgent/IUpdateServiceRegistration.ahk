#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_RegistrationState(retval) {
        result := ComCall(7, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ServiceID(retval) {
        result := ComCall(8, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_IsPendingRegistrationWithAU(retval) {
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateService2>} retval 
     * @returns {HRESULT} 
     */
    get_Service(retval) {
        result := ComCall(10, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
