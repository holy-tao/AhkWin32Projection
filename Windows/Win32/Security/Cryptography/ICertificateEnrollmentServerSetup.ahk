#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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
     * @type {BSTR} 
     */
    ErrorString {
        get => this.get_ErrorString()
    }

    /**
     * Retrieves a string that contains additional information about Certificate Enrollment Web Service (CES) setup failure.
     * @remarks
     * 
     * Calling any method on the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> interface resets this property value to an empty error string.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring
     */
    get_ErrorString() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Initializes the ICertificateEnrollmentServerSetup object with a default configuration.
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
     * If the user is not a domain root or enterprise administrator, the <a href="/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property is set to:
     * 
     * "You must be a member of the Enterprise Admins group to run Setup."
     * 
     * If the computer is not joined to the domain, the <a href="/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property is set to:
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
     * The <a href="/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has already been initialized. The <a href="/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property is set to:
     * 
     * "The setup object has already been initialized. This object cannot be initialized more than once."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertificateenrollmentserversetup-initializeinstalldefaults
     */
    InitializeInstallDefaults() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a CESSetupProperty enumeration value for the Certificate Enrollment Web Service (CES) configuration.
     * @param {Integer} propertyId A <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-cessetupproperty">CESSetupProperty</a> enumeration value that specifies the property value to retrieve. For more information, see Remarks.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> variable that contains the property value.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertificateenrollmentserversetup-getproperty
     */
    GetProperty(propertyId) {
        pPropertyValue := VARIANT()
        result := ComCall(9, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return pPropertyValue
    }

    /**
     * Specifies a CESSetupProperty enumeration value for the Certificate Enrollment Web Service (CES) configuration.
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
     * The <i>propertyId</i> argument is not a member of the <a href="/windows/win32/api/casetup/ne-casetup-cessetupproperty">CESSetupProperty</a> enumeration type.
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
     * The <a href="/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has not been initialized.
     * 
     * The <a href="/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "The setup object has not been initialized. Please initialize the setup object with the InitializeInstallDefaults method."
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
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertificateenrollmentserversetup-setproperty
     */
    SetProperty(propertyId, pPropertyValue) {
        result := ComCall(10, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return result
    }

    /**
     * Specifies user account information for the application pool in which the Certificate Enrollment Web Service (CES) runs.
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
     * The <a href="/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has not been initialized.
     * 
     * The <a href="/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "The setup object has not been initialized. Please initialize the setup object with the InitializeInstallDefaults method."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertificateenrollmentserversetup-setapplicationpoolcredentials
     */
    SetApplicationPoolCredentials(bstrUsername, bstrPassword) {
        bstrUsername := bstrUsername is String ? BSTR.Alloc(bstrUsername).Value : bstrUsername
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(11, this, "ptr", bstrUsername, "ptr", bstrPassword, "HRESULT")
        return result
    }

    /**
     * Installs the Certificate Enrollment Web Service (CES) configured by the ICertificateEnrollmentServerSetup object.
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
     * The <a href="/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has not been initialized.
     * 
     * The <a href="/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "The setup object has not been initialized. Please initialize the setup object with the InitializeInstallDefaults method."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertificateenrollmentserversetup-install
     */
    Install() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Removes the Certificate Enrollment Web Service (CES).
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
     * The <a href="/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "You have to be the local machine administrator in order to run this setup."
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
     * The <a href="/windows/desktop/api/casetup/nn-casetup-icertificateenrollmentserversetup">ICertificateEnrollmentServerSetup</a> object has been initialized. An object is initialized when you successfully call <a href="/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-initializeinstalldefaults">InitializeInstallDefaults</a>.
     * 
     * The <a href="/windows/desktop/api/casetup/nf-casetup-icertificateenrollmentserversetup-get_errorstring">ErrorString</a> property value is set to "The object has been initialized. You cannot call UnInstall on an initialized object."
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertificateenrollmentserversetup-uninstall
     */
    UnInstall(pCAConfig, pAuthentication) {
        result := ComCall(13, this, "ptr", pCAConfig, "ptr", pAuthentication, "HRESULT")
        return result
    }
}
