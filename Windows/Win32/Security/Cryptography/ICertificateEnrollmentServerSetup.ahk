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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ErrorString", "InitializeInstallDefaults", "GetProperty", "SetProperty", "SetApplicationPoolCredentials", "Install", "UnInstall"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring
     */
    get_ErrorString(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentserversetup-initializeinstalldefaults
     */
    InitializeInstallDefaults() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentserversetup-getproperty
     */
    GetProperty(propertyId, pPropertyValue) {
        result := ComCall(9, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentserversetup-setproperty
     */
    SetProperty(propertyId, pPropertyValue) {
        result := ComCall(10, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUsername 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentserversetup-setapplicationpoolcredentials
     */
    SetApplicationPoolCredentials(bstrUsername, bstrPassword) {
        bstrUsername := bstrUsername is String ? BSTR.Alloc(bstrUsername).Value : bstrUsername
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(11, this, "ptr", bstrUsername, "ptr", bstrPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentserversetup-install
     */
    Install() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pCAConfig 
     * @param {Pointer<VARIANT>} pAuthentication 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentserversetup-uninstall
     */
    UnInstall(pCAConfig, pAuthentication) {
        result := ComCall(13, this, "ptr", pCAConfig, "ptr", pAuthentication, "HRESULT")
        return result
    }
}
