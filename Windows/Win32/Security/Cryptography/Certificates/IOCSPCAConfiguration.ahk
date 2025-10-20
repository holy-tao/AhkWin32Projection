#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a set of definitions that enable an Online Certificate Status Protocol (OCSP) service to respond to a certificate status request for a specific certification authority (CA).
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-iocspcaconfiguration
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IOCSPCAConfiguration extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOCSPCAConfiguration
     * @type {Guid}
     */
    static IID => Guid("{aec92b40-3d46-433f-87d1-b84d5c1e790d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Identifier", "get_CACertificate", "get_HashAlgorithm", "put_HashAlgorithm", "get_SigningFlags", "put_SigningFlags", "get_SigningCertificate", "put_SigningCertificate", "get_ReminderDuration", "put_ReminderDuration", "get_ErrorCode", "get_CSPName", "get_KeySpec", "get_ProviderCLSID", "put_ProviderCLSID", "get_ProviderProperties", "put_ProviderProperties", "get_Modified", "get_LocalRevocationInformation", "put_LocalRevocationInformation", "get_SigningCertificateTemplate", "put_SigningCertificateTemplate", "get_CAConfig", "put_CAConfig"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_identifier
     */
    get_Identifier(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_cacertificate
     */
    get_CACertificate(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_hashalgorithm
     */
    get_HashAlgorithm(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-put_hashalgorithm
     */
    put_HashAlgorithm(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_signingflags
     */
    get_SigningFlags(pVal) {
        result := ComCall(11, this, "uint*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-put_signingflags
     */
    put_SigningFlags(newVal) {
        result := ComCall(12, this, "uint", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_signingcertificate
     */
    get_SigningCertificate(pVal) {
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-put_signingcertificate
     */
    put_SigningCertificate(newVal) {
        result := ComCall(14, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_reminderduration
     */
    get_ReminderDuration(pVal) {
        result := ComCall(15, this, "uint*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-put_reminderduration
     */
    put_ReminderDuration(newVal) {
        result := ComCall(16, this, "uint", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_errorcode
     */
    get_ErrorCode(pVal) {
        result := ComCall(17, this, "uint*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_cspname
     */
    get_CSPName(pVal) {
        result := ComCall(18, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_keyspec
     */
    get_KeySpec(pVal) {
        result := ComCall(19, this, "uint*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_providerclsid
     */
    get_ProviderCLSID(pVal) {
        result := ComCall(20, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-put_providerclsid
     */
    put_ProviderCLSID(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(21, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_providerproperties
     */
    get_ProviderProperties(pVal) {
        result := ComCall(22, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-put_providerproperties
     */
    put_ProviderProperties(newVal) {
        result := ComCall(23, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_modified
     */
    get_Modified(pVal) {
        result := ComCall(24, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_localrevocationinformation
     */
    get_LocalRevocationInformation(pVal) {
        result := ComCall(25, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-put_localrevocationinformation
     */
    put_LocalRevocationInformation(newVal) {
        result := ComCall(26, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_signingcertificatetemplate
     */
    get_SigningCertificateTemplate(pVal) {
        result := ComCall(27, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-put_signingcertificatetemplate
     */
    put_SigningCertificateTemplate(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(28, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_caconfig
     */
    get_CAConfig(pVal) {
        result := ComCall(29, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-put_caconfig
     */
    put_CAConfig(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(30, this, "ptr", newVal, "HRESULT")
        return result
    }
}
