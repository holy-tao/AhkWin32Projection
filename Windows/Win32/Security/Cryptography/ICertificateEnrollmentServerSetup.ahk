#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ICertificateEnrollmentServerSetup interface represents the Certificate Enrollment Web Service (CES) within Active Directory Certificate Services (ADCS).
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-icertificateenrollmentserversetup
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ICertificateEnrollmentServerSetup extends IDispatch{
    /**
     * The interface identifier for ICertificateEnrollmentServerSetup
     * @type {Guid}
     */
    static IID => Guid("{70027fdb-9dd9-4921-8944-b35cb31bd2ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ErrorString(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeInstallDefaults() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pPropertyValue 
     * @returns {HRESULT} 
     */
    GetProperty(propertyId, pPropertyValue) {
        result := ComCall(9, this, "int", propertyId, "ptr", pPropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pPropertyValue 
     * @returns {HRESULT} 
     */
    SetProperty(propertyId, pPropertyValue) {
        result := ComCall(10, this, "int", propertyId, "ptr", pPropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUsername 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     */
    SetApplicationPoolCredentials(bstrUsername, bstrPassword) {
        bstrUsername := bstrUsername is String ? BSTR.Alloc(bstrUsername).Value : bstrUsername
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(11, this, "ptr", bstrUsername, "ptr", bstrPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Install() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pCAConfig 
     * @param {Pointer<VARIANT>} pAuthentication 
     * @returns {HRESULT} 
     */
    UnInstall(pCAConfig, pAuthentication) {
        result := ComCall(13, this, "ptr", pCAConfig, "ptr", pAuthentication, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
