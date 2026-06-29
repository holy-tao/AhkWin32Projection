#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IX509CertificateTemplates.ahk" { IX509CertificateTemplates }
#Import ".\ICertificationAuthorities.ahk" { ICertificationAuthorities }
#Import ".\X509CertificateEnrollmentContext.ahk" { X509CertificateEnrollmentContext }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IObjectIds.ahk" { IObjectIds }
#Import ".\X509EnrollmentPolicyLoadOption.ahk" { X509EnrollmentPolicyLoadOption }
#Import ".\X509EnrollmentPolicyExportFlags.ahk" { X509EnrollmentPolicyExportFlags }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IX509CertificateTemplate.ahk" { IX509CertificateTemplate }
#Import ".\X509EnrollmentAuthFlags.ahk" { X509EnrollmentAuthFlags }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IX509EnrollmentPolicyServer interface represents a certificate enrollment policy (CEP) server.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509EnrollmentPolicyServer extends IDispatch {
    /**
     * The interface identifier for IX509EnrollmentPolicyServer
     * @type {Guid}
     */
    static IID := Guid("{13b79026-2181-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509EnrollmentPolicyServer interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize          : IntPtr
        LoadPolicy          : IntPtr
        GetTemplates        : IntPtr
        GetCAsForTemplate   : IntPtr
        GetCAs              : IntPtr
        Validate            : IntPtr
        GetCustomOids       : IntPtr
        GetNextUpdateTime   : IntPtr
        GetLastUpdateTime   : IntPtr
        GetPolicyServerUrl  : IntPtr
        GetPolicyServerId   : IntPtr
        GetFriendlyName     : IntPtr
        GetIsDefaultCEP     : IntPtr
        GetUseClientId      : IntPtr
        GetAllowUnTrustedCA : IntPtr
        GetCachePath        : IntPtr
        GetCacheDir         : IntPtr
        GetAuthFlags        : IntPtr
        SetCredential       : IntPtr
        QueryChanges        : IntPtr
        InitializeImport    : IntPtr
        Export              : IntPtr
        get_Cost            : IntPtr
        put_Cost            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509EnrollmentPolicyServer.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {X509EnrollmentAuthFlags} authFlags 
     * @param {VARIANT_BOOL} fIsUnTrusted A Boolean value that specifies whether to allow an untrusted certification authority certificates.
     * @param {X509CertificateEnrollmentContext} _context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> object has already been initialized.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initialize
     */
    Initialize(bstrPolicyServerUrl, bstrPolicyServerId, authFlags, fIsUnTrusted, _context) {
        bstrPolicyServerUrl := bstrPolicyServerUrl is String ? BSTR.Alloc(bstrPolicyServerUrl).Value : bstrPolicyServerUrl
        bstrPolicyServerId := bstrPolicyServerId is String ? BSTR.Alloc(bstrPolicyServerId).Value : bstrPolicyServerId

        result := ComCall(7, this, BSTR, bstrPolicyServerUrl, BSTR, bstrPolicyServerId, X509EnrollmentAuthFlags, authFlags, VARIANT_BOOL, fIsUnTrusted, X509CertificateEnrollmentContext, _context, "HRESULT")
        return result
    }

    /**
     * Retrieves policy information from the certificate enrollment policy (CEP) server.
     * @param {X509EnrollmentPolicyLoadOption} option 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-loadpolicy
     */
    LoadPolicy(option) {
        result := ComCall(8, this, X509EnrollmentPolicyLoadOption, option, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of the templates supported by the certificate enrollment policy (CEP) server.
     * @returns {IX509CertificateTemplates} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplates">IX509CertificateTemplates</a> interface that represents the template collection.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-gettemplates
     */
    GetTemplates() {
        result := ComCall(9, this, "ptr*", &pTemplates := 0, "HRESULT")
        return IX509CertificateTemplates(pTemplates)
    }

    /**
     * Retrieves a collection of certificate enrollment servers that support a specified template.
     * @param {IX509CertificateTemplate} pTemplate Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificatetemplate">IX509CertificateTemplate</a> interface that represents the template.
     * @returns {ICertificationAuthorities} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertificationauthorities">ICertificationAuthorities</a> interface that represents the server collection.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcasfortemplate
     */
    GetCAsForTemplate(pTemplate) {
        result := ComCall(10, this, "ptr", pTemplate, "ptr*", &ppCAs := 0, "HRESULT")
        return ICertificationAuthorities(ppCAs)
    }

    /**
     * Retrieves a collection of certification enrollment servers included in the policy.
     * @returns {ICertificationAuthorities} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertificationauthorities">ICertificationAuthorities</a> interface that represents the collection.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas
     */
    GetCAs() {
        result := ComCall(11, this, "ptr*", &ppCAs := 0, "HRESULT")
        return ICertificationAuthorities(ppCAs)
    }

    /**
     * Validates the current policy information.
     * @remarks
     * This method calls <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-loadpolicy">LoadPolicy</a> with the input parameter set to <b>LoadOptionReload</b>.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> has been initialized by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initializeimport">InitializeImport</a> method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-validate
     */
    Validate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Is not implemented.
     * @returns {IObjectIds} Not used.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcustomoids
     */
    GetCustomOids() {
        result := ComCall(13, this, "ptr*", &ppObjectIds := 0, "HRESULT")
        return IObjectIds(ppObjectIds)
    }

    /**
     * Retrieves the date and time at which the policy expires and should be refreshed.
     * @remarks
     * The date is stored as an 8-byte real value that represents a Coordinated Universal Time (Greenwich Mean Time) value between January 1, 1900 and December 31, 9999, inclusive. The value 2.0 represents January 1, 1900; 3.0 represents January 2, 1900. Adding 1 to the value increments the date by a day. The fractional part of the value represents the time of day. Therefore, 2.5 represents 12:00 on January 1, 1900; 3.25 represents 06:00 on January 2, 1900.
     * @returns {Float} Pointer to a <b>DATE</b> value that identifies the time.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getnextupdatetime
     */
    GetNextUpdateTime() {
        result := ComCall(14, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * Retrieves the date and time at which the policy was last downloaded.
     * @remarks
     * The date is stored as an 8-byte real value that represents a Coordinated Universal Time (Greenwich Mean Time) value between January 1, 1900 and December 31, 9999, inclusive. The value 2.0 represents January 1, 1900; 3.0 represents January 2, 1900. Adding 1 to the value increments the date by a day. The fractional part of the value represents the time of day. Therefore, 2.5 represents 12:00 on January 1, 1900; 3.25 represents 06:00 on January 2, 1900.
     * @returns {Float} Pointer to a <b>DATE</b> value that identifies the time.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getlastupdatetime
     */
    GetLastUpdateTime() {
        result := ComCall(15, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * Retrieves a string value that contains the URL for the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the URL.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getpolicyserverurl
     */
    GetPolicyServerUrl() {
        pValue := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a string value that uniquely identifies the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the ID string.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getpolicyserverid
     */
    GetPolicyServerId() {
        pValue := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a display name for the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the display name.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getfriendlyname
     */
    GetFriendlyName() {
        pValue := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether this is the default certificate enrollment policy (CEP) server.
     * @remarks
     * The default server is set by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-initialize">Initialize</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyenrollmentpolicyserver">ICertPropertyEnrollmentPolicyServer</a> interface.
     * @returns {VARIANT_BOOL} Pointer to a Boolean value that specifies whether this is the default server.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getisdefaultcep
     */
    GetIsDefaultCEP() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies whether the ClientId attribute is set in the policy server flags of the certificate enrollment policy (CEP) server.
     * @remarks
     * This method returns <b>VARIANT_TRUE</b> if the <b>PsfUseClientId</b> bit is set on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-policyserverurlflags">PolicyServerUrlFlags</a> enumeration for this CEP server. If this flag is set, the <b>ClientID</b> attribute is included in certificate requests during the enrollment process and can be used by the certification authority for diagnostic or auditing purposes. Examples of the type of information included in this attribute include the name of the cryptographic service provider, the Windows version number, the user name, the computer DNS name, and the domain controller DNS name.
     * @returns {VARIANT_BOOL} Pointer to a Boolean value that specifies whether the <b>PsfUseClientId</b> bit is set on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-policyserverurlflags">PolicyServerUrlFlags</a> enumeration for this certificate enrollment policy (CEP) server.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getuseclientid
     */
    GetUseClientId() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies whether to allow an untrusted certification authority certificate.
     * @returns {VARIANT_BOOL} Pointer to a Boolean value that specifies whether to allow the certificate.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getallowuntrustedca
     */
    GetAllowUnTrustedCA() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the path of the policy cache file on the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the path.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcachepath
     */
    GetCachePath() {
        pValue := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the name of the directory on the certificate enrollment policy (CEP) server that contains the policy cache file.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the directory name.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcachedir
     */
    GetCacheDir() {
        pValue := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies the authentication type used by the client to authenticate itself to the certificate enrollment policy (CEP) server.
     * @returns {X509EnrollmentAuthFlags} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getauthflags
     */
    GetAuthFlags() {
        result := ComCall(24, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the credential used to contact the certificate enrollment policy (CEP) server.
     * @remarks
     * The <i>strCredential</i> and <i>strPassword</i> arguments will change depending on the value specified in the <i>flag</i> argument as shown in the following table.
     * 
     * <table>
     * <tr>
     * <th><i>flag</i> parameter </th>
     * <th><i>strCredential</i> parameter</th>
     * <th><i>strPassword</i> parameter</th>
     * </tr>
     * <tr>
     * <td>X509AuthAnonymous</td>
     * <td><b>NULL</b></td>
     * <td><b>NULL</b></td>
     * </tr>
     * <tr>
     * <td>X509AuthKerberos</td>
     * <td><b>NULL</b></td>
     * <td><b>NULL</b></td>
     * </tr>
     * <tr>
     * <td>X509AuthUsername</td>
     * <td>Clear text user name recognized by the CEP server.</td>
     * <td>Clear text password associated with the user name.</td>
     * </tr>
     * <tr>
     * <td>X509AuthCertificate</td>
     * <td>Contains a 20 byte SHA-1 hash (thumbprint) of the certificate.</td>
     * <td><b>NULL</b></td>
     * </tr>
     * </table>
     * @param {Integer} hWndParent Parent window handle.
     * @param {X509EnrollmentAuthFlags} flag 
     * @param {BSTR} strCredential A <b>BSTR</b> variable that contains the credential.
     * @param {BSTR} strPassword A <b>BSTR</b> variable that contains the password.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-setcredential
     */
    SetCredential(hWndParent, flag, strCredential, strPassword) {
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(25, this, "int", hWndParent, X509EnrollmentAuthFlags, flag, BSTR, strCredential, BSTR, strPassword, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that specifies whether the template or certification authority collections have changed in Active Directory.
     * @remarks
     * The <b>QueryChanges</b> method is relevant only when you specify <b>LoadOptionRegisterForADChanges</b> in the <i>option</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-loadpolicy">LoadPolicy</a> method. The method returns <b>VARIANT_TRUE</b> for either of the following cases:
     * 
     * <ul>
     * <li>The template collection in Active Directory has changed since the last time <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-gettemplates">GetTemplates</a> was called.</li>
     * <li>The certification authority collection in Active Directory has changed since the last time <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas">GetCAs</a> was called.</li>
     * </ul>
     * @returns {VARIANT_BOOL} Pointer to a Boolean value that specifies whether the collections have changed.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-querychanges
     */
    QueryChanges() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Initializes the certificate enrollment policy (CEP) server from a collection of templates and object identifiers.
     * @remarks
     * Call this method to import templates and OIDs previously written to a buffer by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-export">Export</a> method.
     * @param {VARIANT} _val A <b>VARIANT</b> of type <b>VT_ARRAY|VT_UI1</b> that contains the templates and object identifiers.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmentpolicyserver">IX509EnrollmentPolicyServer</a> object has already been initialized.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initializeimport
     */
    InitializeImport(_val) {
        result := ComCall(27, this, VARIANT, _val, "HRESULT")
        return result
    }

    /**
     * Exports templates and object identifiers associated with the certificate enrollment policy (CEP) server to a buffer.
     * @remarks
     * To prevent memory leaks, you must free the <b>VARIANT</b> returned by this function.
     * 
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-loadpolicy">LoadPolicy</a> before calling this function and after calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initialize">Initialize</a> for the exported data to be meaningful.
     * @param {X509EnrollmentPolicyExportFlags} exportFlags 
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> of type <b>VT_ARRAY|VT_UI1</b> that receives the templates and object identifiers.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-export
     */
    Export(exportFlags) {
        pVal := VARIANT()
        result := ComCall(28, this, X509EnrollmentPolicyExportFlags, exportFlags, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Specifies and retrieves an arbitrary cost for contacting the certificate enrollment policy server. (IX509EnrollmentPolicyServer.get_Cost)
     * @remarks
     * If multiple CEP servers have the same ID value (specified when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initialize">Initialize</a> method is called), the server with the lowest cost is contacted first.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-get_cost
     */
    get_Cost() {
        result := ComCall(29, this, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves an arbitrary cost for contacting the certificate enrollment policy server. (IX509EnrollmentPolicyServer.put_Cost)
     * @remarks
     * If multiple CEP servers have the same ID value (specified when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initialize">Initialize</a> method is called), the server with the lowest cost is contacted first.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-put_cost
     */
    put_Cost(value) {
        result := ComCall(30, this, "uint", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509EnrollmentPolicyServer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 6)
        this.vtbl.LoadPolicy := CallbackCreate(GetMethod(implObj, "LoadPolicy"), flags, 2)
        this.vtbl.GetTemplates := CallbackCreate(GetMethod(implObj, "GetTemplates"), flags, 2)
        this.vtbl.GetCAsForTemplate := CallbackCreate(GetMethod(implObj, "GetCAsForTemplate"), flags, 3)
        this.vtbl.GetCAs := CallbackCreate(GetMethod(implObj, "GetCAs"), flags, 2)
        this.vtbl.Validate := CallbackCreate(GetMethod(implObj, "Validate"), flags, 1)
        this.vtbl.GetCustomOids := CallbackCreate(GetMethod(implObj, "GetCustomOids"), flags, 2)
        this.vtbl.GetNextUpdateTime := CallbackCreate(GetMethod(implObj, "GetNextUpdateTime"), flags, 2)
        this.vtbl.GetLastUpdateTime := CallbackCreate(GetMethod(implObj, "GetLastUpdateTime"), flags, 2)
        this.vtbl.GetPolicyServerUrl := CallbackCreate(GetMethod(implObj, "GetPolicyServerUrl"), flags, 2)
        this.vtbl.GetPolicyServerId := CallbackCreate(GetMethod(implObj, "GetPolicyServerId"), flags, 2)
        this.vtbl.GetFriendlyName := CallbackCreate(GetMethod(implObj, "GetFriendlyName"), flags, 2)
        this.vtbl.GetIsDefaultCEP := CallbackCreate(GetMethod(implObj, "GetIsDefaultCEP"), flags, 2)
        this.vtbl.GetUseClientId := CallbackCreate(GetMethod(implObj, "GetUseClientId"), flags, 2)
        this.vtbl.GetAllowUnTrustedCA := CallbackCreate(GetMethod(implObj, "GetAllowUnTrustedCA"), flags, 2)
        this.vtbl.GetCachePath := CallbackCreate(GetMethod(implObj, "GetCachePath"), flags, 2)
        this.vtbl.GetCacheDir := CallbackCreate(GetMethod(implObj, "GetCacheDir"), flags, 2)
        this.vtbl.GetAuthFlags := CallbackCreate(GetMethod(implObj, "GetAuthFlags"), flags, 2)
        this.vtbl.SetCredential := CallbackCreate(GetMethod(implObj, "SetCredential"), flags, 5)
        this.vtbl.QueryChanges := CallbackCreate(GetMethod(implObj, "QueryChanges"), flags, 2)
        this.vtbl.InitializeImport := CallbackCreate(GetMethod(implObj, "InitializeImport"), flags, 2)
        this.vtbl.Export := CallbackCreate(GetMethod(implObj, "Export"), flags, 3)
        this.vtbl.get_Cost := CallbackCreate(GetMethod(implObj, "get_Cost"), flags, 2)
        this.vtbl.put_Cost := CallbackCreate(GetMethod(implObj, "put_Cost"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.LoadPolicy)
        CallbackFree(this.vtbl.GetTemplates)
        CallbackFree(this.vtbl.GetCAsForTemplate)
        CallbackFree(this.vtbl.GetCAs)
        CallbackFree(this.vtbl.Validate)
        CallbackFree(this.vtbl.GetCustomOids)
        CallbackFree(this.vtbl.GetNextUpdateTime)
        CallbackFree(this.vtbl.GetLastUpdateTime)
        CallbackFree(this.vtbl.GetPolicyServerUrl)
        CallbackFree(this.vtbl.GetPolicyServerId)
        CallbackFree(this.vtbl.GetFriendlyName)
        CallbackFree(this.vtbl.GetIsDefaultCEP)
        CallbackFree(this.vtbl.GetUseClientId)
        CallbackFree(this.vtbl.GetAllowUnTrustedCA)
        CallbackFree(this.vtbl.GetCachePath)
        CallbackFree(this.vtbl.GetCacheDir)
        CallbackFree(this.vtbl.GetAuthFlags)
        CallbackFree(this.vtbl.SetCredential)
        CallbackFree(this.vtbl.QueryChanges)
        CallbackFree(this.vtbl.InitializeImport)
        CallbackFree(this.vtbl.Export)
        CallbackFree(this.vtbl.get_Cost)
        CallbackFree(this.vtbl.put_Cost)
    }
}
