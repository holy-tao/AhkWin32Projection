#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
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
     * @type {BSTR} 
     */
    Identifier {
        get => this.get_Identifier()
    }

    /**
     * @type {VARIANT} 
     */
    CACertificate {
        get => this.get_CACertificate()
    }

    /**
     * @type {BSTR} 
     */
    HashAlgorithm {
        get => this.get_HashAlgorithm()
        set => this.put_HashAlgorithm(value)
    }

    /**
     * @type {Integer} 
     */
    SigningFlags {
        get => this.get_SigningFlags()
        set => this.put_SigningFlags(value)
    }

    /**
     * @type {VARIANT} 
     */
    SigningCertificate {
        get => this.get_SigningCertificate()
        set => this.put_SigningCertificate(value)
    }

    /**
     * @type {Integer} 
     */
    ReminderDuration {
        get => this.get_ReminderDuration()
        set => this.put_ReminderDuration(value)
    }

    /**
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * @type {BSTR} 
     */
    CSPName {
        get => this.get_CSPName()
    }

    /**
     * @type {Integer} 
     */
    KeySpec {
        get => this.get_KeySpec()
    }

    /**
     * @type {BSTR} 
     */
    ProviderCLSID {
        get => this.get_ProviderCLSID()
        set => this.put_ProviderCLSID(value)
    }

    /**
     * @type {VARIANT} 
     */
    ProviderProperties {
        get => this.get_ProviderProperties()
        set => this.put_ProviderProperties(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Modified {
        get => this.get_Modified()
    }

    /**
     * @type {VARIANT} 
     */
    LocalRevocationInformation {
        get => this.get_LocalRevocationInformation()
        set => this.put_LocalRevocationInformation(value)
    }

    /**
     * @type {BSTR} 
     */
    SigningCertificateTemplate {
        get => this.get_SigningCertificateTemplate()
        set => this.put_SigningCertificateTemplate(value)
    }

    /**
     * @type {BSTR} 
     */
    CAConfig {
        get => this.get_CAConfig()
        set => this.put_CAConfig(value)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_identifier
     */
    get_Identifier() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_cacertificate
     */
    get_CACertificate() {
        pVal := VARIANT()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_hashalgorithm
     */
    get_HashAlgorithm() {
        pVal := BSTR()
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return pVal
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_signingflags
     */
    get_SigningFlags() {
        result := ComCall(11, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_signingcertificate
     */
    get_SigningCertificate() {
        pVal := VARIANT()
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return pVal
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_reminderduration
     */
    get_ReminderDuration() {
        result := ComCall(15, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_errorcode
     */
    get_ErrorCode() {
        result := ComCall(17, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_cspname
     */
    get_CSPName() {
        pVal := BSTR()
        result := ComCall(18, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_keyspec
     */
    get_KeySpec() {
        result := ComCall(19, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_providerclsid
     */
    get_ProviderCLSID() {
        pVal := BSTR()
        result := ComCall(20, this, "ptr", pVal, "HRESULT")
        return pVal
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_providerproperties
     */
    get_ProviderProperties() {
        pVal := VARIANT()
        result := ComCall(22, this, "ptr", pVal, "HRESULT")
        return pVal
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_modified
     */
    get_Modified() {
        result := ComCall(24, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_localrevocationinformation
     */
    get_LocalRevocationInformation() {
        pVal := VARIANT()
        result := ComCall(25, this, "ptr", pVal, "HRESULT")
        return pVal
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_signingcertificatetemplate
     */
    get_SigningCertificateTemplate() {
        pVal := BSTR()
        result := ComCall(27, this, "ptr", pVal, "HRESULT")
        return pVal
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfiguration-get_caconfig
     */
    get_CAConfig() {
        pVal := BSTR()
        result := ComCall(29, this, "ptr", pVal, "HRESULT")
        return pVal
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
