#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Security.DirectoryServices
 * @version v4.0.30319
 */
class DirectoryServices {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DSSI_READ_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSSI_NO_ACCESS_CHECK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSSI_NO_EDIT_SACL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSSI_NO_EDIT_OWNER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSSI_IS_ROOT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSSI_NO_FILTER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSSI_NO_READONLY_MESSAGE => 64
;@endregion Constants

;@region Methods
    /**
     * Creates an instance of the ISecurityInformation interface associated with the specified directory service (DS) object.
     * @param {PWSTR} pwszObjectPath The full path of the DS object for which to create an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface.
     * @param {PWSTR} pwszObjectClass The class of the object specified by the <i>pwszObjectPath</i> parameter.
     * @param {Integer} dwFlags Flags used for the security property page associated with the new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface. This parameter can be any combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_READ_ONLY"></a><a id="dssi_read_only"></a><dl>
     * <dt><b>DSSI_READ_ONLY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security properties are read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_ACCESS_CHECK_"></a><a id="dssi_no_access_check_"></a><dl>
     * <dt><b>DSSI_NO_ACCESS_CHECK </b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No access check is performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_EDIT_SACL"></a><a id="dssi_no_edit_sacl"></a><dl>
     * <dt><b>DSSI_NO_EDIT_SACL</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) property is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_EDIT_OWNER"></a><a id="dssi_no_edit_owner"></a><dl>
     * <dt><b>DSSI_NO_EDIT_OWNER</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object owner property is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_IS_ROOT"></a><a id="dssi_is_root"></a><dl>
     * <dt><b>DSSI_IS_ROOT</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is a root object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_FILTER"></a><a id="dssi_no_filter"></a><dl>
     * <dt><b>DSSI_NO_FILTER</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not apply any filters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_READONLY_MESSAGE"></a><a id="dssi_no_readonly_message"></a><dl>
     * <dt><b>DSSI_NO_READONLY_MESSAGE</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppress read-only popup messages.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<ISecurityInformation>} ppSI A pointer to the instance of the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface this function creates.
     * @param {Pointer<PFNREADOBJECTSECURITY>} pfnReadSD A pointer to a function used to read the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> of the object. This value can be <b>NULL</b>. If <i>pfnReadSD</i> is not <b>NULL</b>, <b>DSCreateISecurityInfoObject</b>  calls the function referenced by <i>pfnReadSD</i> to retrieve the security descriptor of the object.
     * @param {Pointer<PFNWRITEOBJECTSECURITY>} pfnWriteSD A pointer to  a function used to write the security descriptor of the object. This value can be <b>NULL</b>. If <i>pfnWriteSD</i> is not <b>NULL</b>, <b>DSCreateISecurityInfoObject</b>  calls the function referenced by <i>pfnWriteSD</i> to write the security descriptor of the object.
     * @param {LPARAM} lpContext Context to pass to the functions identified by the <i>pfnReadSD</i> and <i>pfnWriteSD</i> parameters.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dssec/nf-dssec-dscreateisecurityinfoobject
     * @since windowsserver2008
     */
    static DSCreateISecurityInfoObject(pwszObjectPath, pwszObjectClass, dwFlags, ppSI, pfnReadSD, pfnWriteSD, lpContext) {
        pwszObjectPath := pwszObjectPath is String ? StrPtr(pwszObjectPath) : pwszObjectPath
        pwszObjectClass := pwszObjectClass is String ? StrPtr(pwszObjectClass) : pwszObjectClass

        result := DllCall("DSSEC.dll\DSCreateISecurityInfoObject", "ptr", pwszObjectPath, "ptr", pwszObjectClass, "uint", dwFlags, "ptr", ppSI, "ptr", pfnReadSD, "ptr", pfnWriteSD, "ptr", lpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an instance of the ISecurityInformation interface associated with the specified directory service (DS) object on the specified server.
     * @param {PWSTR} pwszObjectPath The full path of the DS object for which to create an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface.
     * @param {PWSTR} pwszObjectClass The class of the object specified by the <i>pwszObjectPath</i> parameter.
     * @param {PWSTR} pwszServer The server of the object specified by the <i>pwszObjectPath</i> parameter. If the value of this parameter is <b>NULL</b>, the server is obtained from the path specified by the <i>pwszObjectPath</i> parameter.
     * @param {PWSTR} pwszUserName A user name to be associated with the new <b>ISecurityInformation</b> object. If the value of this parameter is <b>NULL</b>, the <a href="https://docs.microsoft.com/windows/desktop/ADSI/active-directory-service-interfaces-adsi">Active Directory Services Interfaces</a> (ADSI) default is used.
     * @param {PWSTR} pwszPassword A password to be associated with the new <b>ISecurityInformation</b> object. If the value of this parameter is <b>NULL</b>, the <a href="https://docs.microsoft.com/windows/desktop/ADSI/active-directory-service-interfaces-adsi">Active Directory Services Interfaces</a> (ADSI) default is used.
     * @param {Integer} dwFlags Flags used for the security property page associated with the new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface. This parameter can be any combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_READ_ONLY"></a><a id="dssi_read_only"></a><dl>
     * <dt><b>DSSI_READ_ONLY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security properties are read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_ACCESS_CHECK_"></a><a id="dssi_no_access_check_"></a><dl>
     * <dt><b>DSSI_NO_ACCESS_CHECK </b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No access check is performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_EDIT_SACL"></a><a id="dssi_no_edit_sacl"></a><dl>
     * <dt><b>DSSI_NO_EDIT_SACL</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) property is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_EDIT_OWNER"></a><a id="dssi_no_edit_owner"></a><dl>
     * <dt><b>DSSI_NO_EDIT_OWNER</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object owner property is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_IS_ROOT"></a><a id="dssi_is_root"></a><dl>
     * <dt><b>DSSI_IS_ROOT</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is a root object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_FILTER"></a><a id="dssi_no_filter"></a><dl>
     * <dt><b>DSSI_NO_FILTER</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not apply any filters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_READONLY_MESSAGE"></a><a id="dssi_no_readonly_message"></a><dl>
     * <dt><b>DSSI_NO_READONLY_MESSAGE</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppress read-only popup messages.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<ISecurityInformation>} ppSI A pointer to the instance of the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface this function creates.
     * @param {Pointer<PFNREADOBJECTSECURITY>} pfnReadSD A pointer to a function used to read the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> of the object. This value can be <b>NULL</b>. If <i>pfnReadSD</i> is not <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/dssec/nf-dssec-dscreateisecurityinfoobject">DSCreateISecurityInfoObject</a>  calls the function referenced by <i>pfnReadSD</i> to retrieve the security descriptor of the object.
     * @param {Pointer<PFNWRITEOBJECTSECURITY>} pfnWriteSD A pointer to  a function used to write the security descriptor of the object. This value can be <b>NULL</b>. If <i>pfnWriteSD</i> is not <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/dssec/nf-dssec-dscreateisecurityinfoobject">DSCreateISecurityInfoObject</a>  calls the function referenced by <i>pfnWriteSD</i> to write the security descriptor of the object.
     * @param {LPARAM} lpContext Context to pass to the functions identified by the <i>pfnReadSD</i> and <i>pfnWriteSD</i> parameters.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dssec/nf-dssec-dscreateisecurityinfoobjectex
     * @since windowsserver2008
     */
    static DSCreateISecurityInfoObjectEx(pwszObjectPath, pwszObjectClass, pwszServer, pwszUserName, pwszPassword, dwFlags, ppSI, pfnReadSD, pfnWriteSD, lpContext) {
        pwszObjectPath := pwszObjectPath is String ? StrPtr(pwszObjectPath) : pwszObjectPath
        pwszObjectClass := pwszObjectClass is String ? StrPtr(pwszObjectClass) : pwszObjectClass
        pwszServer := pwszServer is String ? StrPtr(pwszServer) : pwszServer
        pwszUserName := pwszUserName is String ? StrPtr(pwszUserName) : pwszUserName
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := DllCall("DSSEC.dll\DSCreateISecurityInfoObjectEx", "ptr", pwszObjectPath, "ptr", pwszObjectClass, "ptr", pwszServer, "ptr", pwszUserName, "ptr", pwszPassword, "uint", dwFlags, "ptr", ppSI, "ptr", pfnReadSD, "ptr", pfnWriteSD, "ptr", lpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a security property page for an Active Directory object.
     * @param {PWSTR} pwszObjectPath A pointer to a <b>null</b>-terminated wide character string that represents the full Active Directory path for the object.
     * @param {PWSTR} pwszObjectClass A pointer to a <b>null</b>-terminated wide character string that represents the object class. This value can be <b>NULL</b>.
     * @param {Integer} dwFlags Flags used for the security property page. This parameter can be none or any combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_READ_ONLY"></a><a id="dssi_read_only"></a><dl>
     * <dt><b>DSSI_READ_ONLY</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security properties are read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_ACCESS_CHECK_"></a><a id="dssi_no_access_check_"></a><dl>
     * <dt><b>DSSI_NO_ACCESS_CHECK </b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No access check is performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_EDIT_SACL"></a><a id="dssi_no_edit_sacl"></a><dl>
     * <dt><b>DSSI_NO_EDIT_SACL</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) property is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_EDIT_OWNER"></a><a id="dssi_no_edit_owner"></a><dl>
     * <dt><b>DSSI_NO_EDIT_OWNER</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object owner property is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_IS_ROOT"></a><a id="dssi_is_root"></a><dl>
     * <dt><b>DSSI_IS_ROOT</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is a root object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_FILTER"></a><a id="dssi_no_filter"></a><dl>
     * <dt><b>DSSI_NO_FILTER</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not apply any filters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DSSI_NO_READONLY_MESSAGE"></a><a id="dssi_no_readonly_message"></a><dl>
     * <dt><b>DSSI_NO_READONLY_MESSAGE</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppress read-only popup messages.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<HPROPSHEETPAGE>} phPage A pointer to a <b>HPROPSHEETPAGE</b> that returns the created security property page.
     * @param {Pointer<PFNREADOBJECTSECURITY>} pfnReadSD A pointer to a function used to read the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> of the object. This value can be <b>NULL</b>. If <i>pfnReadSD</i> is not <b>NULL</b>, <b>DSCreateSecurityPage</b>  calls the function referenced by <i>pfnReadSD</i> to retrieve the security descriptor of the object.
     * @param {Pointer<PFNWRITEOBJECTSECURITY>} pfnWriteSD A pointer to  a function used to write the security descriptor of the object. This value can be <b>NULL</b>. If <i>pfnWriteSD</i> is not <b>NULL</b>, <b>DSCreateSecurityPage</b>  calls the function referenced by <i>pfnWriteSD</i> to write the security descriptor of the object.
     * @param {LPARAM} lpContext Context to pass to the functions identified by <i>pfnReadSD</i> or <i>pfnWriteSD</i>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dssec/nf-dssec-dscreatesecuritypage
     * @since windowsserver2003
     */
    static DSCreateSecurityPage(pwszObjectPath, pwszObjectClass, dwFlags, phPage, pfnReadSD, pfnWriteSD, lpContext) {
        pwszObjectPath := pwszObjectPath is String ? StrPtr(pwszObjectPath) : pwszObjectPath
        pwszObjectClass := pwszObjectClass is String ? StrPtr(pwszObjectClass) : pwszObjectClass

        result := DllCall("DSSEC.dll\DSCreateSecurityPage", "ptr", pwszObjectPath, "ptr", pwszObjectClass, "uint", dwFlags, "ptr", phPage, "ptr", pfnReadSD, "ptr", pfnWriteSD, "ptr", lpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Displays a modal dialog box for editing security on a Directory Services (DS) object.
     * @param {HWND} hwndOwner The dialog box owner window.
     * @param {PWSTR} pwszObjectPath The full Active Directory Services (ADS) path of the DS object.
     * @param {PWSTR} pwszObjectClass The class of the object.
     * @param {Integer} dwFlags The combination of DSSI_* flags.
     * @param {PWSTR} pwszCaption The dialog box caption.
     * @param {Pointer<PFNREADOBJECTSECURITY>} pfnReadSD The function for reading the object.
     * @param {Pointer<PFNWRITEOBJECTSECURITY>} pfnWriteSD The function for writing the object.
     * @param {LPARAM} lpContext The context passed into the read or write functions in the <i>pfnReadSD</i> and <i>pfnWriteSD</i> parameters.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dssec/nf-dssec-dseditsecurity
     * @since windowsserver2008
     */
    static DSEditSecurity(hwndOwner, pwszObjectPath, pwszObjectClass, dwFlags, pwszCaption, pfnReadSD, pfnWriteSD, lpContext) {
        pwszObjectPath := pwszObjectPath is String ? StrPtr(pwszObjectPath) : pwszObjectPath
        pwszObjectClass := pwszObjectClass is String ? StrPtr(pwszObjectClass) : pwszObjectClass
        pwszCaption := pwszCaption is String ? StrPtr(pwszCaption) : pwszCaption
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("DSSEC.dll\DSEditSecurity", "ptr", hwndOwner, "ptr", pwszObjectPath, "ptr", pwszObjectClass, "uint", dwFlags, "ptr", pwszCaption, "ptr", pfnReadSD, "ptr", pfnWriteSD, "ptr", lpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
