#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IOCSPPropertyCollection.ahk
#Include .\IOCSPCAConfigurationCollection.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides functionality to manage an Online Certificate Status Protocol (OCSP) responder server.
 * @remarks
 * 
 * The following table disambiguates the various properties used in the Microsoft OCSP architecture.
 * 
 * <table>
 * <tr>
 * <th>Architecture</th>
 * <th>Scope</th>
 * <th>Information types</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspadmin-get_ocspserviceproperties">OCSPServiceProperties</a>
 * </td>
 * <td>Governs general responder-service behavior for every CA.</td>
 * <td>
 * <ul>
 * <li>Proxy</li>
 * <li>Audit</li>
 * <li>Security configurations</li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspadmin-get_ocspcaconfigurationcollection">OCSPCAConfigurationCollection</a>
 * </td>
 * <td>Governs response behavior for a specific CA.</td>
 * <td>
 * <ul>
 * <li>CA</li>
 * <li>Hash algorithm</li>
 * <li>Certificate signing</li>
 * <li>Revocation provider configurations</li>
 * </ul>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfiguration-get_providerproperties">ProviderProperties</a>
 * </td>
 * <td>Governs behavior of a revocation information provider that is specific to a particular <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">OCSPCAConfiguration</a>.</td>
 * <td>
 * <ul>
 * <li>Certificate revocation lists (CRLs)</li>
 * <li>Refresh interval</li>
 * </ul>
 * </td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-iocspadmin
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IOCSPAdmin extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOCSPAdmin
     * @type {Guid}
     */
    static IID => Guid("{322e830d-67db-4fe9-9577-4596d9f09294}")

    /**
     * The class identifier for OCSPAdmin
     * @type {Guid}
     */
    static CLSID => Guid("{d3f73511-92c9-47cb-8ff2-8d891a7c4de4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OCSPServiceProperties", "get_OCSPCAConfigurationCollection", "GetConfiguration", "SetConfiguration", "GetMyRoles", "Ping", "SetSecurity", "GetSecurity", "GetSigningCertificates", "GetHashAlgorithms"]

    /**
     * @type {IOCSPPropertyCollection} 
     */
    OCSPServiceProperties {
        get => this.get_OCSPServiceProperties()
    }

    /**
     * @type {IOCSPCAConfigurationCollection} 
     */
    OCSPCAConfigurationCollection {
        get => this.get_OCSPCAConfigurationCollection()
    }

    /**
     * Gets an instance of an OCSPPropertyCollection object. This object represents the attributes of an Online Certificate Status Protocol (OCSP) responder service.
     * @remarks
     * 
     * The following table lists the possible <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspproperty-get_name">Name</a>-<a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspproperty-get_value">Value</a> pairs for OCSP service properties.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td><b>LogLevel</b></td>
     * <td>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspproperty-get_value">Value</a> of <b>LogLevel</b> must be one of the following constants.
     * 
     * 
     * 
     * <dl>
     * <dt><a id="Constant__CERTLOG_MINIMAL"></a><a id="constant__certlog_minimal"></a><a id="CONSTANT__CERTLOG_MINIMAL"></a>Constant: CERTLOG_MINIMAL</dt>
     * <dd>
     * <b>DWORD</b>: 0
     * 
     * </dd>
     * <dt><a id="Constant__CERTLOG_TERSE"></a><a id="constant__certlog_terse"></a><a id="CONSTANT__CERTLOG_TERSE"></a>Constant: CERTLOG_TERSE</dt>
     * <dd>
     * <b>DWORD</b>: 1
     * 
     * </dd>
     * <dt><a id="Constant__CERTLOG_ERROR"></a><a id="constant__certlog_error"></a><a id="CONSTANT__CERTLOG_ERROR"></a>Constant: CERTLOG_ERROR</dt>
     * <dd>
     * <b>DWORD</b>: 2
     * 
     * </dd>
     * <dt><a id="Constant__CERTLOG_WARNING"></a><a id="constant__certlog_warning"></a><a id="CONSTANT__CERTLOG_WARNING"></a>Constant: CERTLOG_WARNING</dt>
     * <dd>
     * <b>DWORD</b>: 3 (default)
     * 
     * </dd>
     * <dt><a id="Constant__CERTLOG_VERBOSE"></a><a id="constant__certlog_verbose"></a><a id="CONSTANT__CERTLOG_VERBOSE"></a>Constant: CERTLOG_VERBOSE</dt>
     * <dd>
     * <b>DWORD</b>: 4
     * 
     * </dd>
     * <dt><a id="Constant__CERTLOG_EXHAUSTIVE"></a><a id="constant__certlog_exhaustive"></a><a id="CONSTANT__CERTLOG_EXHAUSTIVE"></a>Constant: CERTLOG_EXHAUSTIVE</dt>
     * <dd>
     * <b>DWORD</b>: 5
     * 
     * </dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><b>AuditFilter</b></td>
     * <td>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspproperty-get_value">Value</a> of <b>AuditFilter</b> can be any bitwise combination of the following <b>DWORD</b> values.
     * 
     * 
     * 
     * <dl>
     * <dt><a id="Description__Audit_OCSP_service_start_stop"></a><a id="description__audit_ocsp_service_start_stop"></a><a id="DESCRIPTION__AUDIT_OCSP_SERVICE_START_STOP"></a>Description: Audit OCSP service start/stop</dt>
     * <dd>
     * <b>DWORD</b>: 0x1
     * 
     * </dd>
     * <dt><a id="Description__Changes_to_the_OCSP_configuration"></a><a id="description__changes_to_the_ocsp_configuration"></a><a id="DESCRIPTION__CHANGES_TO_THE_OCSP_CONFIGURATION"></a>Description: Changes to the OCSP configuration</dt>
     * <dd>
     * <b>DWORD</b>: 0x2
     * 
     * </dd>
     * <dt><a id="Description__Requests_submitted_to_the_OCSP"></a><a id="description__requests_submitted_to_the_ocsp"></a><a id="DESCRIPTION__REQUESTS_SUBMITTED_TO_THE_OCSP"></a>Description: Requests submitted to the OCSP</dt>
     * <dd>
     * <b>DWORD</b>: 0x4
     * 
     * </dd>
     * <dt><a id="Description__Changes_to_the_OCSP_security_settings"></a><a id="description__changes_to_the_ocsp_security_settings"></a><a id="DESCRIPTION__CHANGES_TO_THE_OCSP_SECURITY_SETTINGS"></a>Description: Changes to the OCSP security settings</dt>
     * <dd>
     * <b>DWORD</b>: 0x8
     * 
     * </dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td><b>ArrayController</b></td>
     * <td>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspproperty-get_value">Value</a> of <b>ArrayController</b> must be a string that represents the computer name of the OCSP server that acts as the array controller for an OCSP array configuration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>ArrayMembers</b></td>
     * <td>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspproperty-get_value">Value</a> of <b>ArrayMembers</b> can be a multiple-line string that represents the computer names of the OCSP servers that are part of an OCSP array configuration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>EnrollPollInterval</b></td>
     * <td>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspproperty-get_value">Value</a> of <b>EnrollPollInterval</b> must be a <b>DWORD</b> value from 0 to 24 that represents the number of hours between OCSP service certificate enrollment attempts. This interval determines how often the service checks the status of target certificates for a template change or pending validity change. When the service finds a change, it attempts to enroll for a new certificate.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {IOCSPPropertyCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-get_ocspserviceproperties
     */
    get_OCSPServiceProperties() {
        result := ComCall(7, this, "ptr*", &ppVal := 0, "HRESULT")
        return IOCSPPropertyCollection(ppVal)
    }

    /**
     * Gets an instance of an OCSPCAConfigurationCollection object. This object represents the set of certification authority (CA) certificates for which an Online Certificate Status Protocol (OCSP) responder service can handle status requests.
     * @returns {IOCSPCAConfigurationCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-get_ocspcaconfigurationcollection
     */
    get_OCSPCAConfigurationCollection() {
        result := ComCall(8, this, "ptr*", &pVal := 0, "HRESULT")
        return IOCSPCAConfigurationCollection(pVal)
    }

    /**
     * Connects to an Online Certificate Status Protocol (OCSP) responder server and initializes an OCSPAdmin object with the configuration information from the server.
     * @param {BSTR} bstrServerName A string that contains the responder-server name.
     * @param {VARIANT_BOOL} bForce <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * <b>VARIANT_TRUE</b> if the caller wants to read the responder configuration from the server's registry when a running instance of the OCSP responder service cannot be found; otherwise, <b>VARIANT_FALSE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     * <b>True</b> if the caller wants to read the responder configuration from the server's registry when a running instance of the OCSP responder service cannot be found; otherwise, <b>False</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * If the method returns <b>HRESULT_FROM_WIN32(ERROR_INVALID_STATE)</b>, the configuration is already initialized.
     * 
     * If the method returns <b>E_INVALIDARG</b>, the <i>pVal</i> parameter was set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-getconfiguration
     */
    GetConfiguration(bstrServerName, bForce) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(9, this, "ptr", bstrServerName, "short", bForce, "HRESULT")
        return result
    }

    /**
     * Updates a responder service with configuration changes.
     * @param {BSTR} bstrServerName A string that contains the responder-service name.
     * @param {VARIANT_BOOL} bForce <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td><b>VARIANT_TRUE</b> if the method should update the responder service registry when the service is offline or unavailable; otherwise, <b>VARIANT_FALSE</b>. If the service is offline or unavailable and the <i>bForce</i> parameter is <b>VARIANT_TRUE</b>, <b>SetConfiguration</b> updates the responder service registry directly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td><b>True</b> if the method should update the responder service registry when the service is offline or unavailable; otherwise, <b>False</b>. If the service is offline or unavailable and the <i>bForce</i> parameter is <b>True</b>, <b>SetConfiguration</b> updates the responder service registry directly.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-setconfiguration
     */
    SetConfiguration(bstrServerName, bForce) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(10, this, "ptr", bstrServerName, "short", bForce, "HRESULT")
        return result
    }

    /**
     * Gets the access mask of privilege roles for a user on a given Online Certificate Status Protocol (OCSP) responder server.
     * @param {BSTR} bstrServerName A string that contains the responder-server name.
     * @returns {Integer} A pointer to the 32-bit access mask.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-getmyroles
     */
    GetMyRoles(bstrServerName) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(11, this, "ptr", bstrServerName, "int*", &pRoles := 0, "HRESULT")
        return pRoles
    }

    /**
     * Tests a DCOM connection with an Online Certificate Status Protocol (OCSP) responder service.
     * @param {BSTR} bstrServerName A string that contains the OCSP responder server name.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-ping
     */
    Ping(bstrServerName) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(12, this, "ptr", bstrServerName, "HRESULT")
        return result
    }

    /**
     * Updates security descriptor information for an Online Certificate Status Protocol (OCSP) responder server.
     * @remarks
     * 
     * This method calls the <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertstringsecuritydescriptortosecuritydescriptora">ConvertStringSecurityDescriptorToSecurityDescriptor</a> function to create a security descriptor from a string in <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor String Format</a>.
     * 
     * 
     * @param {BSTR} bstrServerName A string that contains the responder-server name.
     * @param {BSTR} bstrVal A string that contains the security descriptor information to assign to the responder server.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-setsecurity
     */
    SetSecurity(bstrServerName, bstrVal) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(13, this, "ptr", bstrServerName, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * Gets security descriptor information for an Online Certificate Status Protocol (OCSP) responder server.
     * @param {BSTR} bstrServerName A string that contains the responder-server name.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-getsecurity
     */
    GetSecurity(bstrServerName) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        pVal := BSTR()
        result := ComCall(14, this, "ptr", bstrServerName, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the signing certificates that are available on a responder server for a given certification authority (CA) certificate.
     * @param {BSTR} bstrServerName A string that contains the responder-server name.
     * @param {Pointer<VARIANT>} pCACertVar The CA certificate for which to retrieve signing certificates.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-getsigningcertificates
     */
    GetSigningCertificates(bstrServerName, pCACertVar) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        pVal := VARIANT()
        result := ComCall(15, this, "ptr", bstrServerName, "ptr", pCACertVar, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets a list of hash-algorithm names. The Online Certificate Status Protocol (OCSP) responder server uses these names to sign OCSP responses for a given certification authority (CA) configuration.
     * @param {BSTR} bstrServerName A string that contains the responder-server name.
     * @param {BSTR} bstrCAId A string that contains an <b>OCSPCAConfiguration</b> <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfiguration-get_identifier">Identifier</a>.
     * @returns {VARIANT} The list of hash algorithms with which a responder server can sign responses.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspadmin-gethashalgorithms
     */
    GetHashAlgorithms(bstrServerName, bstrCAId) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName
        bstrCAId := bstrCAId is String ? BSTR.Alloc(bstrCAId).Value : bstrCAId

        pVal := VARIANT()
        result := ComCall(16, this, "ptr", bstrServerName, "ptr", bstrCAId, "ptr", pVal, "HRESULT")
        return pVal
    }
}
