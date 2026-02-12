#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ICertificateEnrollmentServerSetup interface represents the Certificate Enrollment Web Service (CES) within Active Directory Certificate Services (ADCS).
 * @see https://learn.microsoft.com/windows/win32/api//content/casetup/nn-casetup-icertificateenrollmentserversetup
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
     * @type {BSTR} 
     */
    ErrorString {
        get => this.get_ErrorString()
    }

    /**
     * Retrieves a string that contains additional information about Certificate Enrollment Web Service (CES) setup failure.
     * @remarks
     * Calling any method on the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> interface resets this property value to an empty error string.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring
     */
    get_ErrorString() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Initializes the ICertificateEnrollmentServerSetup object with a default configuration.
     * @remarks
     * This method performs the following actions:
     * 
     * <ul>
     * <li>
     * Determines whether the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has already been initialized.
     * 
     * 
     * <div class="alert"><b>Note</b>  If this check fails, the method sets the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property to "The setup object has already been initialized. This object cannot be initialized more than once."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * <li>
     * Determines whether the user is an administrator of the domain root or the enterprise.
     * 
     * 
     * <div class="alert"><b>Note</b>  If this check fails, the method sets the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property to "You must be a member of the Enterprise Admins group to run Setup."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * <li>
     * Determines whether the computer is joined to the domain.
     * 
     * 
     * <div class="alert"><b>Note</b>  If this check fails, the method sets the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property to "The Certificate Enrollment Web Service or Certificate Enrollment Policy Web Service cannot be installed on a computer that is not a member of a domain."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * <li>Sets the default authentication procedure to Kerberos. You can call <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-setproperty">SetProperty</a> to change the authentication method. </li>
     * <li>
     * Determines whether  CES is installed on a computer running Windows Server 2008 R2.
     * 
     * 
     * <div class="alert"><b>Note</b>  If this check fails, the method sets the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property to "The Certificate Enrollment Web Service or Certificate Enrollment Policy Web Service must be installed on a member server in an Active Directory forest in which the Windows Server 2008 R2 version of ADPrep /forestprep has been successfully run."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * <li>Sets the default server context to the <b>ApplicationPoolIdentity</b> built-in account.</li>
     * <li>Sets the ENUM_CESSETUPPROP_RENEWALONLY property to <b>FALSE</b>.</li>
     * <li>
     * Sets the ENUM_CESSETUPPROP_URL property is to "https://<i>computerDNSname</i>/<i>SanitizedCAShortName</i>_CES_Kerberos/service.svc/ces" if a valid certification authority (CA) configuration exists. If a valid configuration does not exist, the ENUM_CESSETUPPROP_URL property is not set. The <i>SanitizedCAShortName</i> is the sanitized short name of the CA. For more information about sanitized names, see <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nf-certcli-icertgetconfig-getconfig">GetConfig</a>.
     * 
     * 
     * <div class="alert"><b>Note</b>  If the certification authority is a standalone CA, the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property is set to "The Certificate Enrollment Web Service cannot be used with a standalone certification authority (CA). It can only be used with an enterprise CA."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * </ul>
     * You must call the <b>InitializeInstallDefaults</b> method before calling any method other than <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-uninstall">UnInstall</a>. Call the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-install">Install</a> method to install the configured service. Call <b>UnInstall</b> on a new <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object to remove the service.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A user must be an administrator of the domain root or the enterprise. A computer must be joined to the domain.
     * 
     * If the user is not a domain root or enterprise administrator, the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property is set to:
     * 
     * "You must be a member of the Enterprise Admins group to run Setup."
     * 
     * If the computer is not joined to the domain, the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property is set to:
     * 
     * "The Certificate Enrollment Web Service or Certificate Enrollment Policy Web Service cannot be installed on a computer that is not a member of a domain."
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has already been initialized. The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property is set to:
     * 
     * "The setup object has already been initialized. This object cannot be initialized more than once."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/casetup/nf-casetup-icertificateenrollmentserversetup-initializeinstalldefaults
     */
    InitializeInstallDefaults() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a CESSetupProperty enumeration value for the Certificate Enrollment Web Service (CES) configuration.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-cessetupproperty">CESSetupProperty</a> enumeration type contains the following values:<ul>
     * <li><b>ENUM_CESSETUPPROP_USE_IISAPPPOOLIDENTITY</b></li>
     * <li><b>ENUM_CESSETUPPROP_CACONFIG</b></li>
     * <li><b>ENUM_CESSETUPPROP_AUTHENTICATION</b></li>
     * <li><b>ENUM_CESSETUPPROP_SSLCERTHASH</b></li>
     * <li><b>ENUM_CESSETUPPROP_URL</b></li>
     * <li><b>ENUM_CESSETUPPROP_RENEWALONLY</b></li>
     * </ul>
     * 
     * 
     * These values have the following meanings:
     * 
     * <ul>
     * <li>
     * The <b>ENUM_CESSETUPPROP_USE_IISAPPPOOLIDENTITY</b> property is a <b>VT_BOOL</b> value that specifies whether the server context is <b>ApplicationPoolIdentity</b>.
     * 
     * </li>
     * <li>
     * The <b>ENUM_CESSETUPPROP_CACONFIG</b> property contains a certification authority (CA) configuration string (<b>VT_BSTR</b>) of the form <i>computerDNSname</i>/<i>CAName</i> where <i>computerDNSname</i> is the fully qualified DNS name of the server and <i>CAName</i> is the common name of the CA.
     * 
     * </li>
     * <li>
     * The <b>ENUM_CESSETUPPROP_AUTHENTICATION</b> property specifies the type of authentication procedure used. If the  <b>GetProperty</b> method returns successfully, the <i>pPropertyValue</i> argument will contain one of the following constants: <ul>
     * <li>X509AuthKerberos</li>
     * <li>X509AuthUsername</li>
     * <li>X509AuthCertificate</li>
     * </ul>
     * 
     * 
     * </li>
     * <li>
     * The <b>ENUM_CESSETUPPROP_SSLCERTHASH</b> property contains the hash (<b>VT_BSTR</b>) of the certificate used during authentication. The <b>ENUM_CESSETUPPROP_AUTHENTICATION</b> property must be set to X509AuthCertificate.
     * 
     * </li>
     * <li>The <b>ENUM_CESSETUPPROP_URL</b> property contains the CES service URL. If the  <b>GetProperty</b> method returns successfully, the <i>pPropertyValue</i> argument will contain a <b>VT_BSTR</b> subtype that contains a URL of the form "https://<i>computerDNSname</i>/ADPolicyProvider_ces_<i>AuthenticationType</i>/service.svc/ces" where the authentication type can be one of the following:<ul>
     * <li>kerberos</li>
     * <li>usernamepassword</li>
     * <li>certificate</li>
     * </ul>
     * </li>
     * <li>The <b>ENUM_CESSETUPPROP_RENEWALONLY</b> property is a <b>VT_BOOL</b> value that specifies whether CES can process only certificate renewals.</li>
     * </ul>
     * @param {Integer} propertyId A <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-cessetupproperty">CESSetupProperty</a> enumeration value that specifies the property value to retrieve. For more information, see Remarks.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> variable that contains the property value.
     * @see https://learn.microsoft.com/windows/win32/api//content/casetup/nf-casetup-icertificateenrollmentserversetup-getproperty
     */
    GetProperty(propertyId) {
        pPropertyValue := VARIANT()
        result := ComCall(9, this, "int", propertyId, "ptr", pPropertyValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPropertyValue
    }

    /**
     * Specifies a CESSetupProperty enumeration value for the Certificate Enrollment Web Service (CES) configuration.
     * @remarks
     * You must call  <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-initializeinstalldefaults">InitializeInstallDefaults</a> before calling <b>SetProperty</b>.
     * 
     * You cannot set the <b>ENUM_CESSETUPPROP_URL</b> property.
     * 
     * You cannot set the <b>ENUM_CESSETUPPROP_USE_IISAPPPOOLIDENTITY</b> if the WSEnrollmentServer application pool already exists and WMI has been initialized.
     * 
     * If you are setting the <b>ENUM_CESSETUPPROP_AUTHENTICATION</b> property, the  <b>VARIANT</b> subtype must be <b>VT_I2</b>, <b>VT_I4</b>  or <b>VT_UII4</b>, and the <i>pPropertyValue</i> argument must be one of the following constants: <ul>
     * <li><b>X509AuthKerberos</b></li>
     * <li><b>X509AuthUsername</b></li>
     * <li><b>X509AuthCertificate</b></li>
     * </ul>
     * 
     * 
     * You cannot set the ENUM_CESSETUPPROP_CACONFIG property if the target server is a standalone certification authority. The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property will be set to "The Certificate Enrollment Web Service cannot be used with a standalone certification authority (CA). It can only be used with an enterprise CA."
     * 
     * .
     * @param {Integer} propertyId A <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-cessetupproperty">CESSetupProperty</a> enumeration value that specifies the property value to retrieve.
     * @param {Pointer<VARIANT>} pPropertyValue A pointer to a <b>VARIANT</b> variable that contains the property value.
     * @returns {HRESULT} <table>
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
     * The <i>propertyId</i> argument is not a member of the <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-cessetupproperty">CESSetupProperty</a> enumeration type.
     * 
     * Also, if you are setting the <b>ENUM_CESSETUPPROP_AUTHENTICATION</b> property, you must specify one of the following values in the <i>pPropertyValue</i> argument:<ul>
     * <li><b>X509AuthKerberos</b></li>
     * <li><b>X509AuthUsername</b></li>
     * <li><b>X509AuthCertificate</b></li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pPropertyValue</i> parameter cannot be <b>NULL</b>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has not been initialized.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "The setup object has not been initialized. Please initialize the setup object with the InitializeInstallDefaults method."
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_CLUSTER_PROPERTY_DATA_TYPE_MISMATCH)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If you are setting the <b>ENUM_CESSETUPPROP_AUTHENTICATION</b> property, the <b>VARIANT</b> subtype must be <b>VT_I2</b>, <b>VT_I4</b>, or <b>VT_UI4</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/casetup/nf-casetup-icertificateenrollmentserversetup-setproperty
     */
    SetProperty(propertyId, pPropertyValue) {
        result := ComCall(10, this, "int", propertyId, "ptr", pPropertyValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies user account information for the application pool in which the Certificate Enrollment Web Service (CES) runs.
     * @remarks
     * The <b>SetApplicationPoolCredentials</b> method determines whether the user credentials are valid and whether the account is a member of the IIS_IUSRS group. If an error is encountered, the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property can be set to any of the following:<ul>
     * <li>"Setup is unable to obtain security information for the account."</li>
     * <li>"Setup is unable to check the membership of the account."</li>
     * <li>"The account is not a member of the local machine's IIS_IUSRS group."</li>
     * <li>"Fail to retrieve the DNS name of the computer."</li>
     * <li>"The account should be a domain account.  Local account is not allowed."</li>
     * </ul>
     * @param {BSTR} bstrUsername A <b>BSTR</b> that contains the username for the account.
     * @param {BSTR} bstrPassword A <b>BSTR</b> that contains the account password.
     * @returns {HRESULT} <table>
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
     * The <i>bstrUsername</i> and <i>bstrPassword</i> arguments cannot be <b>NULL</b> or empty.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has not been initialized.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "The setup object has not been initialized. Please initialize the setup object with the InitializeInstallDefaults method."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/casetup/nf-casetup-icertificateenrollmentserversetup-setapplicationpoolcredentials
     */
    SetApplicationPoolCredentials(bstrUsername, bstrPassword) {
        if(bstrUsername is String) {
            pin := BSTR.Alloc(bstrUsername)
            bstrUsername := pin.Value
        }
        if(bstrPassword is String) {
            pin := BSTR.Alloc(bstrPassword)
            bstrPassword := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrUsername, "ptr", bstrPassword, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Installs the Certificate Enrollment Web Service (CES) configured by the ICertificateEnrollmentServerSetup object.
     * @remarks
     * This function performs the following actions:
     * 
     * <ul>
     * <li>
     * Initializes Windows Management Instrumentation (WMI).
     * 
     * </li>
     * <li>
     * Validates the CES configuration by verifying that an application with the same name does not already exist.  The application name is part of the CES URL where the URL is of the form "https://<i>computerDNSname</i>/<i>SanitizedCAShortName</i>_ces_<i>AuthenticationType</i>/service.svc/ces". The application name consists of "<i>SanitizedCAShortName</i>_ces_<i>AuthenticationType</i>" where <i>AuthenticationType</i> can be one of the following:<ul>
     * <li>kerberos</li>
     * <li>usernamepassword</li>
     * <li>certificate</li>
     * </ul>
     * <div class="alert"><b>Note</b>  If an application with the same name exists, the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property is set to "Setup could not add this role service because it already exists in the default website. Please remove the existing role service or select a different certification authority (CA) or authentication type."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * <li>
     * Creates the %windir%\systemdata\ces&#92;<i>SanitizedCAShortName</i>_ces_<i>AuthenticationType</i> application directory. <div class="alert"><b>Note</b>  This method does not return an error if the name specified already exists as a directory, but if the specified name exists as a file or if some other error occurred, the method returns a failure <b>HRESULT</b> and sets the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property to "Failed to create the directory %1."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * <li>
     * Creates the %windir%\systemdata\ces&#92;<i>SanitizedCAShortName</i>_ces_<i>AuthenticationType</i>\Traces event tracing directory.
     * 
     * </li>
     * <li>
     * Creates the Web.config and Service.svc files and writes them to the application directory. If the files already exist, they are overwritten.
     * 
     * </li>
     * <li>
     * Creates an IIS application pool. By default, the pool runs under the <b>ApplicationPoolIdentity</b> account. To use a different identity, you must manually change it after the CES role has been installed.
     * 
     * </li>
     * <li>
     * Creates the application in the default website.
     * 
     * </li>
     * <li>
     * Creates a secure (https) binding to port 443 and sets the certificate hash if one was specified during configuration.
     * 
     * </li>
     * <li>
     * Sets IIS authentication to anonymous if you called <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-setproperty">SetProperty</a> and specified  X509AuthCertificate or X509AuthUsername in the <i>pPropertyValue</i> argument. Sets authentication to Windows if you called <b>SetProperty</b> and specified  X509AuthKerberos.
     * 
     * </li>
     * <li>
     * Sets SSL flags depending on the type of authentication chosen during configuration. The default flags for all  authentication types are SSL (require secure channel) and SSL_128 (128-bit encryption). Additionally, if you specify  X509AuthCertificate, the SSL_REQUIRE_CERT and  SSL_NEGOTIATE_CERT flags are set.
     * 
     * </li>
     * <li>
     * Adds read and write access to the event tracing directory.
     * 
     * </li>
     * <li>
     * Updates the security descriptor of the Deleted Objects container in Active Directory to permit access by the computer and/or the application pool. This enables CES to notify the certification authority when a relevant Active Directory object is deleted. If Active Directory resides on a domain controller, both the computer and application pool are allowed to access the Deleted Objects container. If Active Directory does not reside on a domain controller, only the computer is allowed access.
     * 
     * <div class="alert"><b>Note</b>  If access to the Deleted Objects container fails, the method returns a failure <b>HRESULT</b> and sets the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property to "Setup cannot give the Certificate Enrollment Policy Web Service account List permission on the ""Deleted Objects"" container. The web service will not be able to detect deletion of Active Directory objects such as certificate templates. To complete Setup, a member of the Domain Admins group must manually give the Certificate Enrollment Policy Web Service account List permission on the ""Deleted Objects"" container in Active Directory Domain Services (AD DS)."</div>
     * <div> </div>
     * </li>
     * </ul>
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name specified for the event tracing directory or the application directory already existed but represented a file rather than a directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_EXISTS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CES application already exists. For more information, see Remarks
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has not been initialized.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "The setup object has not been initialized. Please initialize the setup object with the InitializeInstallDefaults method."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/casetup/nf-casetup-icertificateenrollmentserversetup-install
     */
    Install() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the Certificate Enrollment Web Service (CES).
     * @remarks
     * You can call this method to remove CES. However, because you cannot call the <b>UnInstall</b> method on an <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object that has already been initialized, you must create a new <b>ICertificateEnrollmentServerSetup</b> before calling <b>UnInstall</b>.
     * 
     * This method attempts to delete all CES-related  directories and the application pool. If it is unable to do so, it still returns S_OK, but you can check the  <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property to determine what problems the method encountered.
     * 
     * This function performs the following actions:
     * 
     * <ul>
     * <li>
     * Initializes Windows Management Instrumentation (WMI).
     * 
     * </li>
     * <li>
     * Attempts to delete the %windir%\systemdata\ces directory and all application subdirectories that may exist. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-install">Install</a> Remarks section.
     * 
     * </li>
     * <li>
     * Attempts to delete the application pool and all applications in the pool.
     * 
     * </li>
     * <li>
     * Attempts to update the security descriptor of the Deleted Objects container in Active Directory to deny access by the computer. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-install">Install</a> Remarks section.
     * 
     * </li>
     * </ul>
     * @param {Pointer<VARIANT>} pCAConfig This parameter is reserved for future use.
     * @param {Pointer<VARIANT>} pAuthentication This parameter is reserved for future use.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user must be a local administrator.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "You have to be the local machine administrator in order to run this setup."
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has been initialized. An object is initialized when you successfully call <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-initializeinstalldefaults">InitializeInstallDefaults</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "The object has been initialized. You cannot call UnInstall on an initialized object."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/casetup/nf-casetup-icertificateenrollmentserversetup-uninstall
     */
    UnInstall(pCAConfig, pAuthentication) {
        result := ComCall(13, this, "ptr", pCAConfig, "ptr", pAuthentication, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
