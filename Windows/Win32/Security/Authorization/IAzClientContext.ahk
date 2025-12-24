#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Maintains the state that describes a particular client.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazclientcontext
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzClientContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzClientContext
     * @type {Guid}
     */
    static IID => Guid("{eff1f00b-488a-466d-afd9-a401c5f9eef5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AccessCheck", "GetBusinessRuleString", "get_UserDn", "get_UserSamCompat", "get_UserDisplay", "get_UserGuid", "get_UserCanonical", "get_UserUpn", "get_UserDnsSamCompat", "GetProperty", "GetRoles", "get_RoleForAccessCheck", "put_RoleForAccessCheck"]

    /**
     * @type {BSTR} 
     */
    UserDn {
        get => this.get_UserDn()
    }

    /**
     * @type {BSTR} 
     */
    UserSamCompat {
        get => this.get_UserSamCompat()
    }

    /**
     * @type {BSTR} 
     */
    UserDisplay {
        get => this.get_UserDisplay()
    }

    /**
     * @type {BSTR} 
     */
    UserGuid {
        get => this.get_UserGuid()
    }

    /**
     * @type {BSTR} 
     */
    UserCanonical {
        get => this.get_UserCanonical()
    }

    /**
     * @type {BSTR} 
     */
    UserUpn {
        get => this.get_UserUpn()
    }

    /**
     * @type {BSTR} 
     */
    UserDnsSamCompat {
        get => this.get_UserDnsSamCompat()
    }

    /**
     * @type {BSTR} 
     */
    RoleForAccessCheck {
        get => this.get_RoleForAccessCheck()
        set => this.put_RoleForAccessCheck(value)
    }

    /**
     * Determines whether the current client context is allowed to perform the specified operations.
     * @param {BSTR} bstrObjectName The name of the accessed object. This string is used in audits.
     * @param {VARIANT} varScopeNames A variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds  a <b>VT_BSTR</b> that contains the name of a scope that the object specified by the <i>bstrObjectName</i> parameter matches. The array can contain only one element. To use the default application level scope, set the first entry in the array to an empty string ("") or <b>VT_EMPTY</b>, or pass <b>VT_EMPTY</b> in to this parameter.
     * @param {VARIANT} varOperations The operations for which access by the client context is checked. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_I2</b> or <b>VT_I4</b> that represents the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-get_operationid">OperationID</a> property of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object in the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> policy.
     * @param {VARIANT} varParameterNames The names of the parameters available to business rules (BizRules) through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazbizrulecontext-getparameter">AzBizRuleContext::GetParameter</a> method. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_BSTR</b> that contains a parameter name. This array must be sorted alphabetically by the caller; the sort order is as defined by a case-sensitive <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-varcmp">VarCmp</a>. The order of the <i>varParameterValues</i> array must match the order of this array. The default value is <b>VT_NULL</b>.
     * @param {VARIANT} varParameterValues The values of the parameters that are available to business rules (BizRules) through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazbizrulecontext-getparameter">AzBizRuleContext::GetParameter</a> method. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a value that corresponds to an element in the <i>varParameterNames</i> array. The default value is <b>VT_NULL</b>. The entries in the array can hold any type except <b>VT_UNKNOWN</b> and <b>VT_DISPATCH</b>.
     * @param {VARIANT} varInterfaceNames The names by which the interfaces in the <i>varInterfaces</i> array will be known in a BizRule script. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a string variant that contains an interface name. This method calls the <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript-addnameditem">IActiveScript::AddNamedItem</a> method for each entry in the array. The default value is <b>VT_NULL</b>.
     * @param {VARIANT} varInterfaceFlags Flags that will be passed in the call to <a href="https://docs.microsoft.com/scripting/winscript/reference/iactivescript-addnameditem">IActiveScript::AddNamedItem</a>. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds a <b>VT_I4</b>. The SCRIPTITEM_ISVISIBLE flag is implied; the SCRIPTITEM_ISPERSISTENT flag is ignored. Each entry in the array must match the corresponding element in the <i>varInterfaceNames</i> array. The default value is <b>VT_NULL</b>.
     * @param {VARIANT} varInterfaces The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interfaces that will be made available to the BizRule script. This is a variant that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> or the  JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object. Each element of the array holds an <b>IDispatch</b> interface. Each entry in the array must match the corresponding element in the <i>varInterfaceNames</i> array. The default value is <b>VT_NULL</b>.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> used to return a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains the results of the access check. Each element of the <b>SAFEARRAY</b> is a <b>VARIANT</b> of type <b>VT_I4</b>. Each entry in the array  matches the corresponding element in the <i>varOperations</i> array. If access to an operation is granted to the client context, a value of NO_ERROR is returned in the corresponding element in the <i>pvarResults</i> array. Any other value indicates that access to that operation is not granted. A typical value that indicates failure is ERROR_ACCESS_DENIED.
     * 
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-accesscheck
     */
    AccessCheck(bstrObjectName, varScopeNames, varOperations, varParameterNames, varParameterValues, varInterfaceNames, varInterfaceFlags, varInterfaces) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName

        pvarResults := VARIANT()
        result := ComCall(7, this, "ptr", bstrObjectName, "ptr", varScopeNames, "ptr", varOperations, "ptr", varParameterNames, "ptr", varParameterValues, "ptr", varInterfaceNames, "ptr", varInterfaceFlags, "ptr", varInterfaces, "ptr", pvarResults, "HRESULT")
        return pvarResults
    }

    /**
     * Returns the application-specific string for the business rule (BizRule).
     * @returns {BSTR} String that contains information about the BizRule. The  format and contents of the string are  defined by the application.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-getbusinessrulestring
     */
    GetBusinessRuleString() {
        pbstrBusinessRuleString := BSTR()
        result := ComCall(8, this, "ptr", pbstrBusinessRuleString, "HRESULT")
        return pbstrBusinessRuleString
    }

    /**
     * Retrieves the name of the current client in distinguished name (DN) format.
     * @remarks
     * 
     * The DN client name is retrieved by impersonating the client token and calling the <a href="https://docs.microsoft.com/windows/desktop/api/secext/nf-secext-getusernameexa">GetUserNameEx</a> function with <b>NameFullyQualifiedDN</b> specified for the <i>NameFormat</i> parameter. 
     * 
     * An example of a  client name in DN format is "CN=Ben Smith, OU=Software, OU=Example, O=FourthCoffee, C=US".
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-get_userdn
     */
    get_UserDn() {
        pbstrProp := BSTR()
        result := ComCall(9, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Retrieves the name of the current client in a format compatible with Windows�Security�Account�Manager (SAM).
     * @remarks
     * 
     * The SAM-compatible client name is retrieved by impersonating the client token and calling the <a href="https://docs.microsoft.com/windows/desktop/api/secext/nf-secext-getusernameexa">GetUserNameEx</a> function with <b>NameSamCompatible</b> specified for the <i>NameFormat</i> parameter. 
     * 
     * An example of a  client name in SAM-compatible format is "ExampleDomain\UserName".
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-get_usersamcompat
     */
    get_UserSamCompat() {
        pbstrProp := BSTR()
        result := ComCall(10, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Retrieves the name of the current client in user display name format.
     * @remarks
     * 
     * The user display client name is retrieved by impersonating the client token and calling the <a href="https://docs.microsoft.com/windows/desktop/api/secext/nf-secext-getusernameexa">GetUserNameEx</a> function with <b>NameCanonical</b> specified for the <i>NameDisplay</i> parameter. 
     * 
     * An example of a  client name in user display name format is "Ben Smith".
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-get_userdisplay
     */
    get_UserDisplay() {
        pbstrProp := BSTR()
        result := ComCall(11, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Retrieves the name of the current client in GUID format.
     * @remarks
     * 
     * The GUID client name is retrieved by impersonating the client token and calling the <a href="https://docs.microsoft.com/windows/desktop/api/secext/nf-secext-getusernameexa">GetUserNameEx</a> function with <b>NameUniqueId</b> specified for the <i>NameFormat</i> parameter. 
     * 
     * An example of a  client name in GUID format is "{4fa050f0-f561-11cf-bdd9-00aa003a77b6}Ben Smith".
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-get_userguid
     */
    get_UserGuid() {
        pbstrProp := BSTR()
        result := ComCall(12, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Retrieves the name of the current client in canonical format.
     * @remarks
     * 
     * The canonical client name is retrieved by impersonating the client token and calling the <a href="https://docs.microsoft.com/windows/desktop/api/secext/nf-secext-getusernameexa">GetUserNameEx</a> function with <b>NameCanonical</b> specified for the <i>NameFormat</i> parameter. 
     * 
     * An example of a  client name in canonical format is "example.fourthcoffee.com/software/Ben Smith".
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-get_usercanonical
     */
    get_UserCanonical() {
        pbstrProp := BSTR()
        result := ComCall(13, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Retrieves the name of the current client in user principal name (UPN) format.
     * @remarks
     * 
     * The UPN client name is retrieved by impersonating the client token and calling the <a href="https://docs.microsoft.com/windows/desktop/api/secext/nf-secext-getusernameexa">GetUserNameEx</a> function with <b>NameUserPrincipal</b> specified for the <i>NameFormat</i> parameter. 
     * 
     * An example of a  client name in UPN format is "someone@example.com".
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-get_userupn
     */
    get_UserUpn() {
        pbstrProp := BSTR()
        result := ComCall(14, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Retrieves the name of the current client in a DNS format compatible with Windows�Security�Account�Manager (SAM).
     * @remarks
     * 
     * The SAM-compatible DNS client name is retrieved by impersonating the client token and calling the <a href="https://docs.microsoft.com/windows/desktop/api/secext/nf-secext-getusernameexa">GetUserNameEx</a> function with <b>NameDnsDomain</b> specified for the <i>NameFormat</i> parameter. 
     * 
     * An example of a  client name in SAM-compatible DNS format is "example.fourthcoffee.com\Username".
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-get_userdnssamcompat
     */
    get_UserDnsSamCompat() {
        pbstrProp := BSTR()
        result := ComCall(15, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Returns the IAzClientContext object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext">IAzClientContext</a> object property  to return. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CHILD_CREATE"></a><a id="az_prop_child_create"></a><dl>
     * <dt><b>AZ_PROP_CHILD_CREATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Determines whether the current user has permission to create child objects. This value will always be <b>FALSE</b> because this object cannot have child objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CLIENT_CONTEXT_ROLE_FOR_ACCESS_CHECK"></a><a id="az_prop_client_context_role_for_access_check"></a><dl>
     * <dt><b>AZ_PROP_CLIENT_CONTEXT_ROLE_FOR_ACCESS_CHECK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_roleforaccesscheck">RoleForAccessCheck</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CLIENT_CONTEXT_USER_CANONICAL"></a><a id="az_prop_client_context_user_canonical"></a><dl>
     * <dt><b>AZ_PROP_CLIENT_CONTEXT_USER_CANONICAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_usercanonical">UserCanonical</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CLIENT_CONTEXT_USER_DISPLAY"></a><a id="az_prop_client_context_user_display"></a><dl>
     * <dt><b>AZ_PROP_CLIENT_CONTEXT_USER_DISPLAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_userdisplay">UserDisplay</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CLIENT_CONTEXT_USER_DN"></a><a id="az_prop_client_context_user_dn"></a><dl>
     * <dt><b>AZ_PROP_CLIENT_CONTEXT_USER_DN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_userdn">UserDn</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CLIENT_CONTEXT_USER_DNS_SAM_COMPAT"></a><a id="az_prop_client_context_user_dns_sam_compat"></a><dl>
     * <dt><b>AZ_PROP_CLIENT_CONTEXT_USER_DNS_SAM_COMPAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_userdnssamcompat">UserDnsSamCompat</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CLIENT_CONTEXT_USER_GUID"></a><a id="az_prop_client_context_user_guid"></a><dl>
     * <dt><b>AZ_PROP_CLIENT_CONTEXT_USER_GUID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_userguid">UserGuid</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CLIENT_CONTEXT_USER_SAM_COMPAT"></a><a id="az_prop_client_context_user_sam_compat"></a><dl>
     * <dt><b>AZ_PROP_CLIENT_CONTEXT_USER_SAM_COMPAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_usersamcompat">UserSamCompat</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CLIENT_CONTEXT_USER_UPN"></a><a id="az_prop_client_context_user_upn"></a><dl>
     * <dt><b>AZ_PROP_CLIENT_CONTEXT_USER_UPN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_userupn">UserUpn</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {VARIANT} A pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext">IAzClientContext</a> object property.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(16, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Returns the roles for the client context.
     * @param {BSTR} bstrScopeName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object from which the roles returned in the <i>pvarRoleNames</i> parameter are applicable. If this property is <b>NULL</b>, the roles from the application scope are returned; otherwise, the roles from the specified scope are returned instead of the roles from the application scope.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> used to return a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>. Each element of the <b>SAFEARRAY</b> is a <b>VARIANT</b> of type <b>BSTR</b> that contains the name of a role to which the client belongs at the scope specified by the <i>bstrScopeName</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-getroles
     */
    GetRoles(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        pvarRoleNames := VARIANT()
        result := ComCall(17, this, "ptr", bstrScopeName, "ptr", pvarRoleNames, "HRESULT")
        return pvarRoleNames
    }

    /**
     * Sets or retrieves the role that is used to perform the access check.
     * @remarks
     * 
     * If this property is set, the role specified by this property will be the only role used in the access check; otherwise, all roles contained in the context will be used.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-get_roleforaccesscheck
     */
    get_RoleForAccessCheck() {
        pbstrProp := BSTR()
        result := ComCall(18, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Sets or retrieves the role that is used to perform the access check.
     * @remarks
     * 
     * If this property is set, the role specified by this property will be the only role used in the access check; otherwise, all roles contained in the context will be used.
     * 
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazclientcontext-put_roleforaccesscheck
     */
    put_RoleForAccessCheck(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(19, this, "ptr", bstrProp, "HRESULT")
        return result
    }
}
