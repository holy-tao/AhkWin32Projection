#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ICertificateEnrollmentPolicyServerSetup interface represents the Certificate Enrollment Policy (CEP) Web Service within Active Directory Certificate Services (ADCS).
 * @see https://learn.microsoft.com/windows/win32/api/casetup/nn-casetup-icertificateenrollmentpolicyserversetup
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
     * @type {BSTR} 
     */
    ErrorString {
        get => this.get_ErrorString()
    }

    /**
     * Retrieves a string that contains additional information about Certificate Enrollment Policy (CEP) Web Service setup failure.
     * @remarks
     * Calling any method on the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentpolicyserversetup">ICertificateEnrollmentPolicyServerSetup</a> interface resets this property value to an empty error string.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring
     */
    get_ErrorString() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Initializes the ICertificateEnrollmentPolicyServerSetup object with a default configuration.
     * @remarks
     * This method performs the following actions:
     * 
     * <ul>
     * <li>
     * Sets the default authentication procedure to Kerberos. You can call <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-setproperty">SetProperty</a> to change the authentication method.
     * 
     * </li>
     * <li>
     * Sets the default URL to https://<i>computerDNSname</i>/ADPolicyProvider_CEP_Kerberos/service.svc/CEP.
     * 
     * </li>
     * <li>
     * Checks to determine whether  the  CEP service is installed on a computer running Windows Server 2008 R2.
     * 
     * 
     * <div class="alert"><b>Note</b>  If this check fails, the method sets the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property to "The Certificate Enrollment Web Service or Certificate Enrollment Policy Web Service must be installed on a member server in an Active Directory forest in which the Windows Server 2008 R2 version of ADPrep /forestprep has been successfully run."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * </ul>
     * You must call the <b>InitializeInstallDefaults</b> method before calling any method other than <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-uninstall">UnInstall</a>. Call the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-install">Install</a> method to install the configured CEP service. Call the <b>UnInstall</b> method on a new <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentpolicyserversetup">ICertificateEnrollmentPolicyServerSetup</a> object to remove the service.
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
     * If the user is not a domain root or enterprise administrator, the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property is set to:
     * 
     * "You must be a member of the Enterprise Admins group to run Setup."
     * 
     * If the computer is not joined to the domain, the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property is set to:
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentpolicyserversetup">ICertificateEnrollmentPolicyServerSetup</a> object has already been initialized. The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property is set to:
     * 
     * "The setup object has already been initialized. This object cannot be initialized more than once."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-initializeinstalldefaults
     */
    InitializeInstallDefaults() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a CEPSetupProperty enumeration value for the Certificate Enrollment Policy (CEP) Web Service configuration.
     * @param {Integer} propertyId A value of the <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-cepsetupproperty">CEPSetupProperty</a> enumeration that specifies the property value to set. The following values are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>ENUM_CEPSETUPPROP_AUTHENTICATION</b></td>
     * <td>
     * The <i>pPropertyValue</i> parameter contains a value that identifies the type of authentication to be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>ENUM_CEPSETUPPROP_SSLCERTHASH</b></td>
     * <td>
     * The <i>pPropertyValue</i> parameter contains a hash of the certificate, if any, used during authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>ENUM_CEPSETUPPROP_KEYBASED_RENEWAL</b></td>
     * <td>
     * The <i>pPropertyValue</i> parameter specifies whether to set up the Enrollment Policy Server in a mode that returns policies for KeyBasedRenewal templates only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>ENUM_CEPSETUPPROP_URL</b></td>
     * <td>
     * Contains the CEP service URL. If the  <b>GetProperty</b> method returns successfully, the <i>pPropertyValue</i> argument will contain a <b>VT_BSTR</b> subtype that contains a URL of the form "https://<i>computerDNSname</i>/ADPolicyProvider_cep_<i>AuthenticationType</i>/service.svc/cep" where the authentication type can be one of the following:<ul>
     * <li>kerberos</li>
     * <li>usernamepassword</li>
     * <li>certificate</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> variable that contains the property value.
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_AUTHENTICATION</b> in the <i>propertyId</i> parameter, the <i>pPropertyValue</i> parameter will contain one of the following constants if the  <b>GetProperty</b> method returns successfully: <ul>
     * <li><b>X509AuthKerberos</b></li>
     * <li><b>X509AuthUsername</b></li>
     * <li><b>X509AuthCertificate</b></li>
     * </ul>
     * 
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_SSLCERTHASH</b> in the <i>propertyId</i> parameter, the <i>pPropertyValue</i> parameter will contain a <b>VT_BSTR</b> subtype that contains the hash if the  <b>GetProperty</b> method returns successfully.
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_AUTHENTICATION</b> in the <i>propertyId</i> parameter, the <i>pPropertyValue</i> parameter contains the authentication procedure.
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_URL</b> in the <i>propertyId</i> parameter, the <i>pPropertyValue</i> parameter contains the Certificate Enrollment Policy (CEP) Web Service URL.
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_KEYBASED_RENEWAL</b> in the <i>propertyId</i> parameter, you must set the <i>pPropertyValue</i> parameter to the <b>VT_BOOL</b> subtype that  indicates  whether to set up the Enrollment Policy Server in a mode that returns policies for KeyBasedRenewal templates only.
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-getproperty
     */
    GetProperty(propertyId) {
        pPropertyValue := VARIANT()
        result := ComCall(9, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return pPropertyValue
    }

    /**
     * Specifies a CEPSetupProperty enumeration value for the Certificate Enrollment Policy (CEP) Web Service configuration.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-initializeinstalldefaults">InitializeInstallDefaults</a> before calling the <b>SetProperty</b> method.
     * @param {Integer} propertyId A value of the <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-cepsetupproperty">CEPSetupProperty</a> enumeration that specifies the property value to set. The following values are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>ENUM_CEPSETUPPROP_AUTHENTICATION</b></td>
     * <td>
     * The <i>pPropertyValue</i> parameter contains a value that identifies the type of authentication to be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>ENUM_CEPSETUPPROP_SSLCERTHASH</b></td>
     * <td>
     * The <i>pPropertyValue</i> parameter contains a hash of the certificate, if any, used during authentication. <b>ENUM_CEPSETUPPROP_AUTHENTICATION</b> must be set to X509AuthCertificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>ENUM_CEPSETUPPROP_KEYBASED_RENEWAL</b></td>
     * <td>
     * The <i>pPropertyValue</i> parameter specifies whether to set up the Enrollment Policy Server in a mode that returns policies for KeyBasedRenewal templates only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>ENUM_CEPSETUPPROP_URL</b></td>
     * <td>
     * You cannot specify this  value.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<VARIANT>} pPropertyValue A pointer to a <b>VARIANT</b> variable that contains the property value.
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_AUTHENTICATION</b> in the <i>propertyId</i> parameter, the  <b>VARIANT</b> subtype must be <b>VT_I2</b>, <b>VT_I4</b>  or <b>VT_UII4</b>, and the <i>pPropertyValue</i> argument must be one of the following constants: <ul>
     * <li><b>X509AuthKerberos</b></li>
     * <li><b>X509AuthUsername</b></li>
     * <li><b>X509AuthCertificate</b></li>
     * </ul>
     * 
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_SSLCERTHASH</b> in the <i>propertyId</i> parameter, you must set the <i>pPropertyValue</i> parameter to a <b>VT_BSTR</b> subtype that contains a hash of the certificate used for authentication.
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_AUTHENTICATION</b> in the <i>propertyId</i> parameter, the <i>pPropertyValue</i> parameter contains the authentication procedure.
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_URL</b> in the <i>propertyId</i> parameter, the <i>pPropertyValue</i> parameter contains the Certificate Enrollment Policy (CEP) Web Service URL.
     * 
     * If you specify <b>ENUM_CEPSETUPPROP_KEYBASED_RENEWAL</b> in the <i>propertyId</i> parameter, you must set the <i>pPropertyValue</i> parameter to the <b>VT_BOOL</b> subtype that indicates  whether to set up the Enrollment Policy Server in a mode that returns policies for KeyBasedRenewal templates only.
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
     * The <i>propertyId</i> argument is not a member of the <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-cepsetupproperty">CEPSetupProperty</a> enumeration type or you have tried to set the <b>ENUM_CEPSETUPPROP_URL</b> value.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentpolicyserversetup">ICertificateEnrollmentPolicyServerSetup</a> object has not been initialized.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property value is set to "The setup object has not been initialized. Please initialize the setup object with the InitializeInstallDefaults method."
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
     * If you are setting the <b>ENUM_CEPSETUPPROP_AUTHENTICATION</b> property, the <b>VARIANT</b> subtype must be <b>VT_I2</b>, <b>VT_I4</b>, or <b>VT_UI4</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-setproperty
     */
    SetProperty(propertyId, pPropertyValue) {
        result := ComCall(10, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return result
    }

    /**
     * Installs the Certificate Enrollment Policy (CEP) Web Service configured by the ICertificateEnrollmentPolicyServerSetup object.
     * @remarks
     * This function performs the following actions:
     * 
     * <ul>
     * <li>
     * Initializes Windows Management Instrumentation (WMI).
     * 
     * </li>
     * <li>
     * Validates the CEP configuration by verifying that an application with the same name does not already exist.  The application name is part of the CEP URL where the URL is of the form "https://<i>computerDNSname</i>/ADPolicyProvider_cep_<i>AuthenticationType</i>/service.svc/cep". The application name consists of "ADPolicyProvider_cep_<i>AuthenticationType</i>" where <i>AuthenticationType</i> can be one of the following:<ul>
     * <li>kerberos</li>
     * <li>usernamepassword</li>
     * <li>certificate</li>
     * </ul>
     * <div class="alert"><b>Note</b>  If an application with the same name exists, the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property is set to "Setup could not add this role service because it already exists in the default website. Please remove the existing role service or select a different certification authority (CA) or authentication type."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * <li>
     * Creates the %windir%\systemdata\cep\ADPolicyProvider_cep_<i>AuthenticationType</i> application directory. <div class="alert"><b>Note</b>  This method does not return an error if the name specified already exists as a directory, but if the specified name exists as a file or if some other error occurred, the method returns a failure <b>HRESULT</b> and sets the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property to "Failed to create the directory %1."</div>
     * <div> </div>
     * 
     * 
     * </li>
     * <li>
     * Creates the %windir%\systemdata\cep\ADPolicyProvider_cep_<i>AuthenticationType</i>\Traces event tracing directory.
     * 
     * </li>
     * <li>
     * Creates the Web.config and Service.svc files and writes them to the application directory. If the files already exist, they are overwritten.
     * 
     * </li>
     * <li>
     * Creates an IIS application pool. By default, the pool runs under the <b>ApplicationPoolIdentity</b> account.
     * 
     * </li>
     * <li>
     * Creates the application in the default website.
     * 
     * </li>
     * <li>
     * Creates a secure (https) binding to port 443 and sets the certificate hash if one has been specified during configuration by calling the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-setproperty">SetProperty</a> method.
     * 
     * </li>
     * <li>
     * Sets IIS authentication to anonymous if you called <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-setproperty">SetProperty</a> and specified  X509AuthCertificate or X509AuthUsername in the <i>pPropertyValue</i> argument. Sets authentication to Windows if you called <b>SetProperty</b> and specified  X509AuthKerberos.
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
     * Updates the security descriptor of the Deleted Objects container in Active Directory to permit access by the computer and/or the application pool. This enables the CEP service to notify the certification authority when a relevant Active Directory object is deleted. If Active Directory is installed on a domain controller, both the computer and application pool are allowed to access the Deleted Objects container. If Active Directory is not installed on a domain controller, only the computer is allowed access.
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
     * The CEP application already exists. For more information, see Remarks.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentpolicyserversetup">ICertificateEnrollmentPolicyServerSetup</a> object has not been initialized.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property value is set to "The setup object has not been initialized. Please initialize the setup object with the InitializeInstallDefaults method."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-install
     */
    Install() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Removes the Certificate Enrollment Policy (CEP) Web Service.
     * @remarks
     * You can call this method to remove the CEP service. However, because you cannot call the <b>UnInstall</b> method on an <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentpolicyserversetup">ICertificateEnrollmentPolicyServerSetup</a> object that has already been initialized, you must create a new <b>ICertificateEnrollmentPolicyServerSetup</b> before calling <b>UnInstall</b>.
     * 
     * When the <i>pAuthKeyBasedRenewal</i> parameter is NULL, this  function performs the following actions:
     * 
     * <ul>
     * <li>
     * Initializes Windows Management Instrumentation (WMI).
     * 
     * </li>
     * <li>Attempts to delete the %Windir%\Systemdata\Cep directory and all application subdirectories that may exist. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-install">Install</a> Remarks section.</li>
     * <li>
     * Attempts to delete the application pool and all applications in the pool.
     * 
     * </li>
     * <li>
     * Attempts to update the security descriptor of the Deleted Objects container in Active Directory to deny access by the computer. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-install">Install</a> Remarks section.
     * 
     * </li>
     * </ul>
     * When the <i>pAuthKeyBasedRenewal</i> parameter contains values for the authentication type and KeyBasedRenewal, this function performs the actions in the previous list but it only deletes the application that corresponds to the values set in <i>pAuthKeyBasedRenewal</i> and leaves other applications in place.
     * @param {Pointer<VARIANT>} pAuthKeyBasedRenewal A pointer to a <b>VARIANT</b> array that contains the authentication type and the optional KeyBasedRenewal values.
     * 
     * You can set the following values for authentication type  in the first element of the array.
     * 
     * 
     * <ul>
     * <li>X509AuthKerberos
     * </li>
     * <li>X509AuthUserName
     * </li>
     * <li>X509AuthCertificate
     * </li>
     * </ul>The second (optional) element in the array value is <b>VARIANT_TRUE</b> for a KeyBasedRenewal CEP.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property value is set to "You have to be the local machine administrator in order to run this setup."
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentpolicyserversetup">ICertificateEnrollmentPolicyServerSetup</a> object has been initialized. An object is initialized when you successfully call <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-initializeinstalldefaults">InitializeInstallDefaults</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-get_errorstring">ErrorString</a> property value is set to "The object has been initialized. You cannot call UnInstall on an initialized object."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertificateenrollmentpolicyserversetup-uninstall
     */
    UnInstall(pAuthKeyBasedRenewal) {
        result := ComCall(12, this, "ptr", pAuthKeyBasedRenewal, "HRESULT")
        return result
    }
}
