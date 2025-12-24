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
     * Gets a name for the certification authority (CA) configuration.
     * @remarks
     * 
     * The name returned in <i>pVal</i> corresponds to the name used in the <i>bstrIdentifier</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfigurationcollection-createcaconfiguration">CreateCAConfiguration</a> method.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_identifier
     */
    get_Identifier() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets an X.509 certificate that has been encoded by using Distinguished Encoding Rules (DER) and that is for a certification authority (CA).
     * @remarks
     * 
     * The <i>pVal</i> certificate corresponds to the certificate used in the <i>varCACert</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfigurationcollection-createcaconfiguration">CreateCAConfiguration</a> method to create the configuration.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_cacertificate
     */
    get_CACertificate() {
        pVal := VARIANT()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets an identifier for the hash algorithm used to sign a certificate.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_hashalgorithm
     */
    get_HashAlgorithm() {
        pVal := BSTR()
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets an identifier for the hash algorithm used to sign a certificate.
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-put_hashalgorithm
     */
    put_HashAlgorithm(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a combination of flag values. These values specify the management of signing certificates that belong to a certification authority (CA) configuration.
     * @remarks
     * 
     * The following table lists bit flag values for 
     * <b>SigningFlags</b>.
     * 
     * <table>
     * <tr>
     * <th>Flag constant</th>
     * <th>Flag value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_SILENT</b></td>
     * <td>0x001</td>
     * <td>Acquire  a private key silently.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_USE_CACERT</b></td>
     * <td>				0x002</td>
     * <td>Use a CA certificate in this configuration for signing an OCSP response. This option is available only if the responder service is installed on the CA computer.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_ALLOW_SIGNINGCERT_AUTORENEWAL</b></td>
     * <td>0x004</td>
     * <td>Enable a responder service to  automatically transition to a renewed signing certificate.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_FORCE_SIGNINGCERT_ISSUER_ISCA</b></td>
     * <td>	0x008</td>
     * <td>Force a delegated signing certificate to be signed by the CA.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_AUTODISCOVER_SIGNINGCERT</b></td>
     * <td>				0x010</td>
     * <td>Automatically discover a delegated signing certificate.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_MANUAL_ASSIGN_SIGNINGCERT</b></td>
     * <td>				0x020</td>
     * <td>Manually assign a signing certificate.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_RESPONDER_ID_KEYHASH</b></td>
     * <td>				0x040</td>
     * <td>A responder ID includes a hash of the public key of the signing certificate (default).</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_RESPONDER_ID_NAME</b></td>
     * <td>				0x080</td>
     * <td>A responder ID includes the name of the subject in a signing certificate.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_ALLOW_NONCE_EXTENSION</b></td>
     * <td>				0x100</td>
     * <td>Enable NONCE extension to be processed by a responder service.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_ALLOW_SIGNINGCERT_AUTOENROLLMENT</b></td>
     * <td>				0x200</td>
     * <td>A responder service can enroll for a signing certificate.</td>
     * </tr>
     * </table>
     *  
     * 
     * When setting <b>SigningFlags</b>, you must specify one of the values <b>OCSP_SF_USE_CACERT</b>, <b>OCSP_SF_AUTODISCOVER_SIGNINGCERT</b>, or <b>OCSP_SF_MANUAL_ASSIGN_SIGNINGCERT</b>.
     * 
     * If you specify <b>OCSP_SF_ALLOW_SIGNINGCERT_AUTOENROLLMENT</b>, you must also specify <b>OCSP_SF_AUTODISCOVER_SIGNINGCERT</b>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_signingflags
     */
    get_SigningFlags() {
        result := ComCall(11, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a combination of flag values. These values specify the management of signing certificates that belong to a certification authority (CA) configuration.
     * @remarks
     * 
     * The following table lists bit flag values for 
     * <b>SigningFlags</b>.
     * 
     * <table>
     * <tr>
     * <th>Flag constant</th>
     * <th>Flag value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_SILENT</b></td>
     * <td>0x001</td>
     * <td>Acquire  a private key silently.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_USE_CACERT</b></td>
     * <td>				0x002</td>
     * <td>Use a CA certificate in this configuration for signing an OCSP response. This option is available only if the responder service is installed on the CA computer.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_ALLOW_SIGNINGCERT_AUTORENEWAL</b></td>
     * <td>0x004</td>
     * <td>Enable a responder service to  automatically transition to a renewed signing certificate.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_FORCE_SIGNINGCERT_ISSUER_ISCA</b></td>
     * <td>	0x008</td>
     * <td>Force a delegated signing certificate to be signed by the CA.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_AUTODISCOVER_SIGNINGCERT</b></td>
     * <td>				0x010</td>
     * <td>Automatically discover a delegated signing certificate.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_MANUAL_ASSIGN_SIGNINGCERT</b></td>
     * <td>				0x020</td>
     * <td>Manually assign a signing certificate.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_RESPONDER_ID_KEYHASH</b></td>
     * <td>				0x040</td>
     * <td>A responder ID includes a hash of the public key of the signing certificate (default).</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_RESPONDER_ID_NAME</b></td>
     * <td>				0x080</td>
     * <td>A responder ID includes the name of the subject in a signing certificate.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_ALLOW_NONCE_EXTENSION</b></td>
     * <td>				0x100</td>
     * <td>Enable NONCE extension to be processed by a responder service.</td>
     * </tr>
     * <tr>
     * <td><b>OCSP_SF_ALLOW_SIGNINGCERT_AUTOENROLLMENT</b></td>
     * <td>				0x200</td>
     * <td>A responder service can enroll for a signing certificate.</td>
     * </tr>
     * </table>
     *  
     * 
     * When setting <b>SigningFlags</b>, you must specify one of the values <b>OCSP_SF_USE_CACERT</b>, <b>OCSP_SF_AUTODISCOVER_SIGNINGCERT</b>, or <b>OCSP_SF_MANUAL_ASSIGN_SIGNINGCERT</b>.
     * 
     * If you specify <b>OCSP_SF_ALLOW_SIGNINGCERT_AUTOENROLLMENT</b>, you must also specify <b>OCSP_SF_AUTODISCOVER_SIGNINGCERT</b>.
     * 
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-put_signingflags
     */
    put_SigningFlags(newVal) {
        result := ComCall(12, this, "uint", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a signing certificate that has been encoded by using Distinguished Encoding Rules (DER). An Online Certificate Status Protocol (OCSP) responder service uses this certificate to sign its responses to certificate status requests.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_signingcertificate
     */
    get_SigningCertificate() {
        pVal := VARIANT()
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a signing certificate that has been encoded by using Distinguished Encoding Rules (DER). An Online Certificate Status Protocol (OCSP) responder service uses this certificate to sign its responses to certificate status requests.
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-put_signingcertificate
     */
    put_SigningCertificate(newVal) {
        result := ComCall(14, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the percentage of a signing certificate lifetime after which a warning event is logged.
     * @remarks
     * 
     * Percentage values must be in the range 0 through 100; the default value is 90. An Online Certificate Status Protocol (OCSP) responder service includes a service-wide value having this default.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_reminderduration
     */
    get_ReminderDuration() {
        result := ComCall(15, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the percentage of a signing certificate lifetime after which a warning event is logged.
     * @remarks
     * 
     * Percentage values must be in the range 0 through 100; the default value is 90. An Online Certificate Status Protocol (OCSP) responder service includes a service-wide value having this default.
     * 
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-put_reminderduration
     */
    put_ReminderDuration(newVal) {
        result := ComCall(16, this, "uint", newVal, "HRESULT")
        return result
    }

    /**
     * Gets a code that identifies an error condition in a CA configuration.
     * @remarks
     * 
     * The OCSP responder service returns an error code when it encounters a problem with a configuration. For the definition of a returned code, see Winerror.h in the Microsoft Windows Software Development Kit (SDK).
     * 
     * An <b>OCSPCAConfiguration</b> object internally stores the error code as an <b>HRESULT</b> with an initial value of <b>E_PENDING</b>. When <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspadmin-setconfiguration">IOCSPAdmin::SetConfiguration</a> is called, the error code is reset to <b>E_PENDING</b>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_errorcode
     */
    get_ErrorCode() {
        result := ComCall(17, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets a cryptographic service provider (CSP) or key storage provider (KSP) name.
     * @remarks
     * 
     * The name returned in <i>pVal</i> corresponds to the CSP or KSP used for the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfiguration-get_signingcertificate">SigningCertificate</a> property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_cspname
     */
    get_CSPName() {
        pVal := BSTR()
        result := ComCall(18, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets a value that indicates whether the key bound to the configuration is used for encryption or for signing content.
     * @remarks
     * 
     * For the Microsoft Base Cryptographic Provider, the <b>KeySpec</b> property has the value <b>AT_KEYEXCHANGE</b> for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/e-gly">exchange keys</a> and the value <b>AT_SIGNATURE</b> for signature keys. The default value is <b>AT_SIGNATURE</b>.
     * 
     * For information about the other Microsoft CSPs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-service-providers">Cryptographic Service Providers</a> in the CryptoAPI 2.0 documentation.
     * 
     * For information about a non-Microsoft CSP, see the documentation provided with that CSP.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_keyspec
     */
    get_KeySpec() {
        result := ComCall(19, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the CLSID of the revocation information provider used by the CA configuration.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_providerclsid
     */
    get_ProviderCLSID() {
        pVal := BSTR()
        result := ComCall(20, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the CLSID of the revocation information provider used by the CA configuration.
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-put_providerclsid
     */
    put_ProviderCLSID(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(21, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets information that provides certificate status responses.
     * @remarks
     * 
     * 
     * The <b>VARIANT</b> returned in <i>pVal</i> is a pointer to a safe array that contains the properties as name-value pairs.
     * 
     * 
     * This array is a two-dimensional array of elements, each of type VARIANT. The array contains one row for each named property in the collection. Each row contains two columns: the property name and the property value.
     * 
     * 
     * The following table lists the possible named property values and their data types for the default revocation provider:
     * 
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Data type</th>
     * </tr>
     * <tr>
     * <td>BaseCrl</td>
     * <td>REG_BINARY</td>
     * </tr>
     * <tr>
     * <td>BaseCrlUrls </td>
     * <td>REG_MULTI_SZ</td>
     * </tr>
     * <tr>
     * <td>CrlUrlTimeout</td>
     * <td>DWORD</td>
     * </tr>
     * <tr>
     * <td>DeltaCrl</td>
     * <td>REG_BINARY</td>
     * </tr>
     * <tr>
     * <td>DeltaCrlUrls</td>
     * <td>REG_MULTI_SZ</td>
     * </tr>
     * <tr>
     * <td>RefreshTimeOut</td>
     * <td>DWORD</td>
     * </tr>
     * <tr>
     * <td>RevocationErrorCode</td>
     * <td>DWORD</td>
     * </tr>
     * <tr>
     * <td>IssuedSerialNumberDirectories</td>
     * <td>REG_MULTI_SZ</td>
     * </tr>
     * </table>
     * 
     * Note: IssuedSerialNumberDirectories is not supported on Windows Server 2008.
     * 
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_providerproperties
     */
    get_ProviderProperties() {
        pVal := VARIANT()
        result := ComCall(22, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets information that provides certificate status responses.
     * @remarks
     * 
     * The <b>VARIANT</b> returned in <i>pVal</i> is an <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocsppropertycollection">IOCSPPropertyCollection</a> interface.
     * 
     * To work with revocation-information provider properties:
     * 
     * <ol>
     * <li>Create an <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocsppropertycollection">IOCSPPropertyCollection</a> object.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocsppropertycollection-initializefromproperties">InitializeFromProperties</a> and pass in the <b>VARIANT</b>, <i>pVal</i>, returned by the <b>ProviderProperties</b> property.</li>
     * <li>Use the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/methods-of-iocsppropertycollection">Methods</a> and <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/properties-of-iocsppropertycollection">Properties</a> of the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocsppropertycollection">IOCSPPropertyCollection</a> interface.</li>
     * </ol>
     * The following table lists the possible <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspproperty">IOCSPProperty</a> <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspproperty-get_name">Name</a> values and their data types for the default revocation-information provider.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Data type</th>
     * </tr>
     * <tr>
     * <td>BaseCrl</td>
     * <td>Depends on BaseCrlUrl</td>
     * </tr>
     * <tr>
     * <td>BaseCrlUrl </td>
     * <td>REG_MULTI_SZ</td>
     * </tr>
     * <tr>
     * <td>CrlUrlTimeout</td>
     * <td>DWORD</td>
     * </tr>
     * <tr>
     * <td>DeltaCrl</td>
     * <td>Depends on BaseCrlUrl or DeltaCrlUrl</td>
     * </tr>
     * <tr>
     * <td>DeltaCrlUrl</td>
     * <td>REG_MULTI_SZ</td>
     * </tr>
     * <tr>
     * <td>RefreshTimeOut</td>
     * <td>DWORD</td>
     * </tr>
     * <tr>
     * <td>RevocationErrorCode</td>
     * <td>DWORD</td>
     * </tr>
     * </table>
     * 
     * 
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-put_providerproperties
     */
    put_ProviderProperties(newVal) {
        result := ComCall(23, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether an OCSPCAConfiguration object has been modified since it was created.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_modified
     */
    get_Modified() {
        result := ComCall(24, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the certificate revocation list (CRL) of the local machine.
     * @remarks
     * 
     * The CRL used for the <b>LocalRevocationInformation</b> property can be signed or not signed. There is no signature verification for the CRL.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_localrevocationinformation
     */
    get_LocalRevocationInformation() {
        pVal := VARIANT()
        result := ComCall(25, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the certificate revocation list (CRL) of the local machine.
     * @remarks
     * 
     * The CRL used for the <b>LocalRevocationInformation</b> property can be signed or not signed. There is no signature verification for the CRL.
     * 
     * 
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-put_localrevocationinformation
     */
    put_LocalRevocationInformation(newVal) {
        result := ComCall(26, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets the template name for a signing certificate.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_signingcertificatetemplate
     */
    get_SigningCertificateTemplate() {
        pVal := BSTR()
        result := ComCall(27, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the template name for a signing certificate.
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-put_signingcertificatetemplate
     */
    put_SigningCertificateTemplate(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(28, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * Gets or sets a certification authority (CA) name with which a signing certificate must be signed.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-get_caconfig
     */
    get_CAConfig() {
        pVal := BSTR()
        result := ComCall(29, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets a certification authority (CA) name with which a signing certificate must be signed.
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfiguration-put_caconfig
     */
    put_CAConfig(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(30, this, "ptr", newVal, "HRESULT")
        return result
    }
}
