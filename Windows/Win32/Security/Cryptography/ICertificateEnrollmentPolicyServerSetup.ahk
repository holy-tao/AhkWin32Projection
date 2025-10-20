#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ICertificateEnrollmentPolicyServerSetup interface represents the Certificate Enrollment Policy (CEP) Web Service within Active Directory Certificate Services (ADCS).
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-icertificateenrollmentpolicyserversetup
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ICertificateEnrollmentPolicyServerSetup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateEnrollmentPolicyServerSetup
     * @type {Guid}
     */
    static IID => Guid("{859252cc-238c-4a88-b8fd-a37e7d04e68b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ErrorString", "InitializeInstallDefaults", "GetProperty", "SetProperty", "Install", "UnInstall"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring
     */
    get_ErrorString(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-initializeinstalldefaults
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
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-getproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-setproperty
     */
    SetProperty(propertyId, pPropertyValue) {
        result := ComCall(10, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-install
     */
    Install() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pAuthKeyBasedRenewal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-uninstall
     */
    UnInstall(pAuthKeyBasedRenewal) {
        result := ComCall(12, this, "ptr", pAuthKeyBasedRenewal, "HRESULT")
        return result
    }
}
