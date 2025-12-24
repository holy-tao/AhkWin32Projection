#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateTemplates.ahk
#Include .\ICertificationAuthorities.ahk
#Include .\IObjectIds.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509EnrollmentPolicyServer interface represents a certificate enrollment policy (CEP) server.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollmentpolicyserver
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509EnrollmentPolicyServer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509EnrollmentPolicyServer
     * @type {Guid}
     */
    static IID => Guid("{13b79026-2181-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "LoadPolicy", "GetTemplates", "GetCAsForTemplate", "GetCAs", "Validate", "GetCustomOids", "GetNextUpdateTime", "GetLastUpdateTime", "GetPolicyServerUrl", "GetPolicyServerId", "GetFriendlyName", "GetIsDefaultCEP", "GetUseClientId", "GetAllowUnTrustedCA", "GetCachePath", "GetCacheDir", "GetAuthFlags", "SetCredential", "QueryChanges", "InitializeImport", "Export", "get_Cost", "put_Cost"]

    /**
     * @type {Integer} 
     */
    Cost {
        get => this.get_Cost()
        set => this.put_Cost(value)
    }

    /**
     * Initializes an IX509EnrollmentPolicyServer object.
     * @param {BSTR} bstrPolicyServerUrl A <b>BSTR</b> variable that contains the URL for the certificate enrollment policy server.
     * @param {BSTR} bstrPolicyServerId A <b>BSTR</b> variable that contains a unique ID for the certificate enrollment policy server. If this value is not <b>NULL</b>, it must match the ID string returned by the CEP response.
     * @param {Integer} authFlags 
     * @param {VARIANT_BOOL} fIsUnTrusted A Boolean value that specifies whether to allow an untrusted certification authority certificates.
     * @param {Integer} context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>bstrPolicyServerUrl</i> parameter cannot be an empty string and must represent an HTTPS URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was not sufficient memory available for the strings specified in the <i>bstrPolicyServerUrl</i> or <i>bstrPolicyServerId</i> parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> object has already been initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>bstrPolicyServerId</i> parameter is not <b>NULL</b> and does not equal the existing CEP ID value on the CEP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-initialize
     */
    Initialize(bstrPolicyServerUrl, bstrPolicyServerId, authFlags, fIsUnTrusted, context) {
        bstrPolicyServerUrl := bstrPolicyServerUrl is String ? BSTR.Alloc(bstrPolicyServerUrl).Value : bstrPolicyServerUrl
        bstrPolicyServerId := bstrPolicyServerId is String ? BSTR.Alloc(bstrPolicyServerId).Value : bstrPolicyServerId

        result := ComCall(7, this, "ptr", bstrPolicyServerUrl, "ptr", bstrPolicyServerId, "int", authFlags, "short", fIsUnTrusted, "int", context, "HRESULT")
        return result
    }

    /**
     * Retrieves policy information from the certificate enrollment policy (CEP) server.
     * @param {Integer} option 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load option requested in the <i>option</i> parameter does not match any supported by the CEP server or you specified LoadOptionCacheOnly in the <i>option</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_VALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was a problem with the lightweight directory access protocol (LDAP) used to locate the CEP server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-loadpolicy
     */
    LoadPolicy(option) {
        result := ComCall(8, this, "int", option, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of the templates supported by the certificate enrollment policy (CEP) server.
     * @returns {IX509CertificateTemplates} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplates">IX509CertificateTemplates</a> interface that represents the template collection.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-gettemplates
     */
    GetTemplates() {
        result := ComCall(9, this, "ptr*", &pTemplates := 0, "HRESULT")
        return IX509CertificateTemplates(pTemplates)
    }

    /**
     * Retrieves a collection of certificate enrollment servers that support a specified template.
     * @param {IX509CertificateTemplate} pTemplate Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplate">IX509CertificateTemplate</a> interface that represents the template.
     * @returns {ICertificationAuthorities} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertificationauthorities">ICertificationAuthorities</a> interface that represents the server collection.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcasfortemplate
     */
    GetCAsForTemplate(pTemplate) {
        result := ComCall(10, this, "ptr", pTemplate, "ptr*", &ppCAs := 0, "HRESULT")
        return ICertificationAuthorities(ppCAs)
    }

    /**
     * Retrieves a collection of certification enrollment servers included in the policy.
     * @returns {ICertificationAuthorities} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertificationauthorities">ICertificationAuthorities</a> interface that represents the collection.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas
     */
    GetCAs() {
        result := ComCall(11, this, "ptr*", &ppCAs := 0, "HRESULT")
        return ICertificationAuthorities(ppCAs)
    }

    /**
     * Validates the current policy information.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_VALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was a problem with the lightweight directory access protocol (LDAP) used to locate the CEP server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_STATE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> has been initialized by calling the <a href="/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initializeimport">InitializeImport</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-validate
     */
    Validate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Is not implemented.
     * @returns {IObjectIds} Not used.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcustomoids
     */
    GetCustomOids() {
        result := ComCall(13, this, "ptr*", &ppObjectIds := 0, "HRESULT")
        return IObjectIds(ppObjectIds)
    }

    /**
     * Retrieves the date and time at which the policy expires and should be refreshed.
     * @returns {Float} Pointer to a <b>DATE</b> value that identifies the time.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getnextupdatetime
     */
    GetNextUpdateTime() {
        result := ComCall(14, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * Retrieves the date and time at which the policy was last downloaded.
     * @returns {Float} Pointer to a <b>DATE</b> value that identifies the time.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getlastupdatetime
     */
    GetLastUpdateTime() {
        result := ComCall(15, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * Retrieves a string value that contains the URL for the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the URL.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getpolicyserverurl
     */
    GetPolicyServerUrl() {
        pValue := BSTR()
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a string value that uniquely identifies the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the ID string.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getpolicyserverid
     */
    GetPolicyServerId() {
        pValue := BSTR()
        result := ComCall(17, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a display name for the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the display name.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getfriendlyname
     */
    GetFriendlyName() {
        pValue := BSTR()
        result := ComCall(18, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether this is the default certificate enrollment policy (CEP) server.
     * @returns {VARIANT_BOOL} Pointer to a Boolean value that specifies whether this is the default server.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getisdefaultcep
     */
    GetIsDefaultCEP() {
        result := ComCall(19, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies whether the ClientId attribute is set in the policy server flags of the certificate enrollment policy (CEP) server.
     * @returns {VARIANT_BOOL} Pointer to a Boolean value that specifies whether the <b>PsfUseClientId</b> bit is set on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-policyserverurlflags">PolicyServerUrlFlags</a> enumeration for this certificate enrollment policy (CEP) server.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getuseclientid
     */
    GetUseClientId() {
        result := ComCall(20, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies whether to allow an untrusted certification authority certificate.
     * @returns {VARIANT_BOOL} Pointer to a Boolean value that specifies whether to allow the certificate.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getallowuntrustedca
     */
    GetAllowUnTrustedCA() {
        result := ComCall(21, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the path of the policy cache file on the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the path.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcachepath
     */
    GetCachePath() {
        pValue := BSTR()
        result := ComCall(22, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the name of the directory on the certificate enrollment policy (CEP) server that contains the policy cache file.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the directory name.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcachedir
     */
    GetCacheDir() {
        pValue := BSTR()
        result := ComCall(23, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies the authentication type used by the client to authenticate itself to the certificate enrollment policy (CEP) server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-getauthflags
     */
    GetAuthFlags() {
        result := ComCall(24, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the credential used to contact the certificate enrollment policy (CEP) server.
     * @param {Integer} hWndParent Parent window handle.
     * @param {Integer} flag 
     * @param {BSTR} strCredential A <b>BSTR</b> variable that contains the credential.
     * @param {BSTR} strPassword A <b>BSTR</b> variable that contains the password.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>flag</i> parameter is not a supported value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-setcredential
     */
    SetCredential(hWndParent, flag, strCredential, strPassword) {
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(25, this, "int", hWndParent, "int", flag, "ptr", strCredential, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that specifies whether the template or certification authority collections have changed in Active Directory.
     * @returns {VARIANT_BOOL} Pointer to a Boolean value that specifies whether the collections have changed.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-querychanges
     */
    QueryChanges() {
        result := ComCall(26, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Initializes the certificate enrollment policy (CEP) server from a collection of templates and object identifiers.
     * @param {VARIANT} val A <b>VARIANT</b> of type <b>VT_ARRAY|VT_UI1</b> that contains the templates and object identifiers.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  <a href="/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> object has already been initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_PARAMETER)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>VARIANT</b> in the <i>val</i> parameter is not of type <b>VT_ARRAY</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-initializeimport
     */
    InitializeImport(val) {
        result := ComCall(27, this, "ptr", val, "HRESULT")
        return result
    }

    /**
     * Exports templates and object identifiers associated with the certificate enrollment policy (CEP) server to a buffer.
     * @param {Integer} exportFlags 
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> of type <b>VT_ARRAY|VT_UI1</b> that receives the templates and object identifiers.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-export
     */
    Export(exportFlags) {
        pVal := VARIANT()
        result := ComCall(28, this, "int", exportFlags, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Specifies and retrieves an arbitrary cost for contacting the certificate enrollment policy server.
     * @remarks
     * 
     * If multiple CEP servers have the same ID value (specified when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initialize">Initialize</a> method is called), the server with the lowest cost is contacted first.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-get_cost
     */
    get_Cost() {
        result := ComCall(29, this, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves an arbitrary cost for contacting the certificate enrollment policy server.
     * @remarks
     * 
     * If multiple CEP servers have the same ID value (specified when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initialize">Initialize</a> method is called), the server with the lowest cost is contacted first.
     * 
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentpolicyserver-put_cost
     */
    put_Cost(value) {
        result := ComCall(30, this, "uint", value, "HRESULT")
        return result
    }
}
