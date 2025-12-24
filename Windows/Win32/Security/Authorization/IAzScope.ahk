#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IAzApplicationGroups.ahk
#Include .\IAzApplicationGroup.ahk
#Include .\IAzRoles.ahk
#Include .\IAzRole.ahk
#Include .\IAzTasks.ahk
#Include .\IAzTask.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines a logical container of resources to which the application manages access.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazscope
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzScope extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzScope
     * @type {Guid}
     */
    static IID => Guid("{00e52487-e08d-4514-b62e-877d5645f5ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Description", "put_Description", "get_ApplicationData", "put_ApplicationData", "get_Writable", "GetProperty", "SetProperty", "AddPropertyItem", "DeletePropertyItem", "get_PolicyAdministrators", "get_PolicyReaders", "AddPolicyAdministrator", "DeletePolicyAdministrator", "AddPolicyReader", "DeletePolicyReader", "get_ApplicationGroups", "OpenApplicationGroup", "CreateApplicationGroup", "DeleteApplicationGroup", "get_Roles", "OpenRole", "CreateRole", "DeleteRole", "get_Tasks", "OpenTask", "CreateTask", "DeleteTask", "Submit", "get_CanBeDelegated", "get_BizrulesWritable", "get_PolicyAdministratorsName", "get_PolicyReadersName", "AddPolicyAdministratorName", "DeletePolicyAdministratorName", "AddPolicyReaderName", "DeletePolicyReaderName"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    ApplicationData {
        get => this.get_ApplicationData()
        set => this.put_ApplicationData(value)
    }

    /**
     * @type {BOOL} 
     */
    Writable {
        get => this.get_Writable()
    }

    /**
     * @type {VARIANT} 
     */
    PolicyAdministrators {
        get => this.get_PolicyAdministrators()
    }

    /**
     * @type {VARIANT} 
     */
    PolicyReaders {
        get => this.get_PolicyReaders()
    }

    /**
     * @type {IAzApplicationGroups} 
     */
    ApplicationGroups {
        get => this.get_ApplicationGroups()
    }

    /**
     * @type {IAzRoles} 
     */
    Roles {
        get => this.get_Roles()
    }

    /**
     * @type {IAzTasks} 
     */
    Tasks {
        get => this.get_Tasks()
    }

    /**
     * @type {BOOL} 
     */
    CanBeDelegated {
        get => this.get_CanBeDelegated()
    }

    /**
     * @type {BOOL} 
     */
    BizrulesWritable {
        get => this.get_BizrulesWritable()
    }

    /**
     * @type {VARIANT} 
     */
    PolicyAdministratorsName {
        get => this.get_PolicyAdministratorsName()
    }

    /**
     * @type {VARIANT} 
     */
    PolicyReadersName {
        get => this.get_PolicyReadersName()
    }

    /**
     * Sets or retrieves the name of the scope.
     * @remarks
     * 
     * The maximum length of the <b>Name</b> property is 512 characters.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrieves the name of the scope.
     * @remarks
     * 
     * The maximum length of the <b>Name</b> property is 512 characters.
     * 
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a comment that describes the scope.
     * @remarks
     * 
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(9, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * Sets or retrieves a comment that describes the scope.
     * @remarks
     * 
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * 
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(10, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * The ApplicationData property of IAzScope sets or retrieves an opaque field that can be used by the application to store information.
     * @remarks
     * 
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_applicationdata
     */
    get_ApplicationData() {
        pbstrApplicationData := BSTR()
        result := ComCall(11, this, "ptr", pbstrApplicationData, "HRESULT")
        return pbstrApplicationData
    }

    /**
     * The ApplicationData property of IAzScope sets or retrieves an opaque field that can be used by the application to store information.
     * @remarks
     * 
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * 
     * 
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(12, this, "ptr", bstrApplicationData, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the scope can be modified by the user context that initialized it.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_writable
     */
    get_Writable() {
        result := ComCall(13, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * Returns the IAzScope object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object property  to return. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_applicationdata">ApplicationData</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_CHILD_CREATE"></a><a id="az_prop_child_create"></a><dl>
     * <dt><b>AZ_PROP_CHILD_CREATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Determines whether the current user has permission to create child objects. This value is <b>TRUE</b> if the current user has permission; otherwise, <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_description">Description</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_name">Name</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS"></a><a id="az_prop_policy_admins"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyadministrators">PolicyAdministrators</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS_NAME"></a><a id="az_prop_policy_admins_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyadministratorsname">PolicyAdministratorsName</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS"></a><a id="az_prop_policy_readers"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyreaders">PolicyReaders</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS_NAME"></a><a id="az_prop_policy_readers_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyreadersname">PolicyReadersName</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_SCOPE_BIZRULES_WRITABLE"></a><a id="az_prop_scope_bizrules_writable"></a><dl>
     * <dt><b>AZ_PROP_SCOPE_BIZRULES_WRITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_bizruleswritable">BizrulesWritable</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_SCOPE_CAN_BE_DELEGATED"></a><a id="az_prop_scope_can_be_delegated"></a><dl>
     * <dt><b>AZ_PROP_SCOPE_CAN_BE_DELEGATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_canbedelegated">CanBeDelegated</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_WRITABLE"></a><a id="az_prop_writable"></a><dl>
     * <dt><b>AZ_PROP_WRITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_writable">Writable</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {VARIANT} A pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object property.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(14, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Sets the specified value to the IAzScope object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object property  to set. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_applicationdata">ApplicationData</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_description">Description</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_name">Name</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Value to set to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object property  specified by the <i>lPropId</i> parameter. The following table shows the type of data that must be used depending on the value of the <i>lPropId</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>lPropId</i> value</th>
     * <th>Data type (C++/Visual Basic)</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Any other value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(15, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified principal to the specified list of principals.
     * @param {Integer} lPropId Property ID of the  list of principals to which to add the principal specified by the <i>varProp</i> parameter. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS"></a><a id="az_prop_policy_admins"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-addpolicyadministrator">AddPolicyAdministrator</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS_NAME"></a><a id="az_prop_policy_admins_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-addpolicyadministratorname">AddPolicyAdministratorName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS"></a><a id="az_prop_policy_readers"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-addpolicyreader">AddPolicyReader</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS_NAME"></a><a id="az_prop_policy_readers_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-addpolicyreadername">AddPolicyReaderName</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Principal to add to the list of principals specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * 
     * If AZ_PROP_POLICY_ADMINS or AZ_PROP_POLICY_READERS is specified for the <i>lPropId</i> parameter, the string is the text form of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the Windows account to add to the list. If AZ_PROP_POLICY_ADMINS_NAME or AZ_PROP_POLICY_READERS_NAME is specified for the <i>lPropId</i> parameter, the string is the account name of the account to add to the list. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the "ExampleDomain\UserName" format.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Any other value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(16, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified principal from the specified list of principals.
     * @param {Integer} lPropId Property ID of the  list of principals from which to remove the principal specified by the <i>varProp</i> parameter. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS"></a><a id="az_prop_policy_admins"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-deletepolicyadministrator">DeletePolicyAdministrator</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS_NAME"></a><a id="az_prop_policy_admins_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-deletepolicyadministratorname">DeletePolicyAdministratorName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS"></a><a id="az_prop_policy_readers"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-deletepolicyreader">DeletePolicyReader</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS_NAME"></a><a id="az_prop_policy_readers_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-deletepolicyreadername">DeletePolicyReaderName</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Principal to remove from the list of principals specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * 
     * If AZ_PROP_POLICY_ADMINS or AZ_PROP_POLICY_READERS is specified for the <i>lPropId</i> parameter, the string is the text form of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the Windows account to remove from the list. If AZ_PROP_POLICY_ADMINS_NAME or AZ_PROP_POLICY_READERS_NAME is specified for the <i>lPropId</i> parameter, the string is the account name of the account to remove from the list. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the "ExampleDomain\UserName" format.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success. Any other value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(17, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The PolicyAdministrators property of IAzScope retrieves the security identifiers (SIDs), in text form, of principals that act as policy administrators.
     * @remarks
     * 
     * Policy administrators for an object can perform the following tasks:
     * 
     * <ul>
     * <li>Read the object</li>
     * <li>Write attributes to the object</li>
     * <li>Read attributes of child objects of the object</li>
     * <li>Write attributes to child objects of the object</li>
     * <li>Delete the object</li>
     * <li>Delete child objects of the object</li>
     * <li>Create child objects of the object</li>
     * </ul>
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_policyadministrators
     */
    get_PolicyAdministrators() {
        pvarAdmins := VARIANT()
        result := ComCall(18, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * The PolicyReaders property of IAzScope retrieves the security identifiers (SIDs), in text form, of principals that act as policy readers.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_policyreaders
     */
    get_PolicyReaders() {
        pvarReaders := VARIANT()
        result := ComCall(19, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * The AddPolicyAdministrator method of IAzScope adds the specified security identifier in text form to the list of principals that act as policy administrators.
     * @remarks
     * 
     * Policy administrators for an object can perform the following tasks:
     * 
     * <ul>
     * <li>Read the object</li>
     * <li>Write attributes to the object</li>
     * <li>Read attributes of child objects of the object</li>
     * <li>Write attributes to child objects of the object</li>
     * <li>Delete the object</li>
     * <li>Delete child objects of the object</li>
     * <li>Create child objects of the object</li>
     * </ul>
     * To view the list of policy administrators, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyadministrators">PolicyAdministrators</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrAdmin Text form of the SID to add to the list of policy administrators.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-addpolicyadministrator
     */
    AddPolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(20, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The DeletePolicyAdministrator method of IAzScope removes the specified security identifier in text form from the list of principals that act as policy administrators.
     * @remarks
     * 
     * Policy administrators for an object can perform the following tasks:
     * 
     * <ul>
     * <li>Read the object</li>
     * <li>Write attributes to the object</li>
     * <li>Read attributes of child objects of the object</li>
     * <li>Write attributes to child objects of the object</li>
     * <li>Delete the object</li>
     * <li>Delete child objects of the object</li>
     * <li>Create child objects of the object</li>
     * </ul>
     * To view the list of policy administrators, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyadministrators">PolicyAdministrators</a> property.
     * 
     * @param {BSTR} bstrAdmin Text form of the SID to remove from the list of policy administrators.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-deletepolicyadministrator
     */
    DeletePolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(21, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The AddPolicyReader method of IAzScope adds the specified security identifier in text form to the list of principals that act as policy readers.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyreaders">PolicyReaders</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrReader Text form of the SID to add to the list of policy readers.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-addpolicyreader
     */
    AddPolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(22, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The DeletePolicyReader method of IAzScope removes the specified security identifier in text form from the list of principals that act as policy readers.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyreaders">PolicyReaders</a> property.
     * 
     * @param {BSTR} bstrReader Text form of the SID to remove from the list of policy readers.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-deletepolicyreader
     */
    DeletePolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(23, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves an IAzApplicationGroups object that is used to enumerate IAzApplicationGroup objects from the policy data.
     * @remarks
     * 
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object.
     * 
     * @returns {IAzApplicationGroups} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_applicationgroups
     */
    get_ApplicationGroups() {
        result := ComCall(24, this, "ptr*", &ppGroupCollection := 0, "HRESULT")
        return IAzApplicationGroups(ppGroupCollection)
    }

    /**
     * Opens an IAzApplicationGroup object by specifying its name.
     * @param {BSTR} bstrGroupName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplicationGroup} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-openapplicationgroup
     */
    OpenApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(25, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * Creates an IAzApplicationGroup object with the specified name.
     * @param {BSTR} bstrGroupName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplicationGroup} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-createapplicationgroup
     */
    CreateApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(26, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * Removes the IAzApplicationGroup object with the specified name from the IAzScope object.
     * @remarks
     * 
     * If there are any <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> references to an <b>IAzApplicationGroup</b> object that has been deleted from the cache, the <b>IAzApplicationGroup</b> object can no longer be used. In C++, you must release references to deleted <b>IAzApplicationGroup</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * 
     * @param {BSTR} bstrGroupName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-deleteapplicationgroup
     */
    DeleteApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(27, this, "ptr", bstrGroupName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves an IAzRoles object that is used to enumerate IAzRole objects from the policy data.
     * @remarks
     * 
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object.
     * 
     * @returns {IAzRoles} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_roles
     */
    get_Roles() {
        result := ComCall(28, this, "ptr*", &ppRoleCollection := 0, "HRESULT")
        return IAzRoles(ppRoleCollection)
    }

    /**
     * Opens an IAzRole object with the specified name.
     * @param {BSTR} bstrRoleName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzRole} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-openrole
     */
    OpenRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(29, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", &ppRole := 0, "HRESULT")
        return IAzRole(ppRole)
    }

    /**
     * Creates an IAzRole object with the specified name.
     * @param {BSTR} bstrRoleName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzRole} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-createrole
     */
    CreateRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(30, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", &ppRole := 0, "HRESULT")
        return IAzRole(ppRole)
    }

    /**
     * Removes the IAzRole object with the specified name from the IAzScope object.
     * @remarks
     * 
     * If there are any <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> references to an <b>IAzRole</b> object that has been deleted from the cache, the <b>IAzRole</b> object can no longer be used. In C++, you must release references to deleted <b>IAzRole</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * 
     * @param {BSTR} bstrRoleName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-deleterole
     */
    DeleteRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(31, this, "ptr", bstrRoleName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves an IAzTasks object that is used to enumerate IAzTask objects from the policy data.
     * @remarks
     * 
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object.
     * 
     * @returns {IAzTasks} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_tasks
     */
    get_Tasks() {
        result := ComCall(32, this, "ptr*", &ppTaskCollection := 0, "HRESULT")
        return IAzTasks(ppTaskCollection)
    }

    /**
     * Opens an IAzTask object with the specified name.
     * @param {BSTR} bstrTaskName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzTask} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-opentask
     */
    OpenTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(33, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", &ppTask := 0, "HRESULT")
        return IAzTask(ppTask)
    }

    /**
     * Creates an IAzTask object with the specified name.
     * @param {BSTR} bstrTaskName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzTask} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-createtask
     */
    CreateTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(34, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", &ppTask := 0, "HRESULT")
        return IAzTask(ppTask)
    }

    /**
     * Removes the IAzTask object with the specified name from the IAzScope object.
     * @remarks
     * 
     * If there are any <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> references to an <b>IAzTask</b> object that has been deleted from the cache, the <b>IAzTask</b> object can no longer be used. In C++, you must release references to deleted <b>IAzTask</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * 
     * @param {BSTR} bstrTaskName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-deletetask
     */
    DeleteTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(35, this, "ptr", bstrTaskName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Persists changes made to the IAzScope object.
     * @remarks
     * 
     * Any additions or modifications to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object are not persisted until the <b>Submit</b> method is called. 
     * 
     * The <b>Submit</b> method does not extend to child objects; child objects  must be individually persisted to the policy store. A created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object must be submitted before it can be referenced or become a parent object. The destructor for an object silently discards unsubmitted changes.
     * 
     * @param {Integer} lFlags Flags that modify the behavior of the <b>Submit</b> method. The default value is zero. If the AZ_SUBMIT_FLAG_ABORT flag is specified, the changes to the object are discarded and the object is updated to match the underlying policy store.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(36, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the scope can be delegated.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_canbedelegated
     */
    get_CanBeDelegated() {
        result := ComCall(37, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * Retrieves a value that indicates whether a non-delegated scope is writable.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_bizruleswritable
     */
    get_BizrulesWritable() {
        result := ComCall(38, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * Retrieves the account names of principals that act as policy administrators.
     * @remarks
     * 
     * Policy administrators for an object can perform the following tasks:
     * 
     * <ul>
     * <li>Read the object</li>
     * <li>Write attributes to the object</li>
     * <li>Read attributes of child objects of the object</li>
     * <li>Write attributes to child objects of the object</li>
     * <li>Delete the object</li>
     * <li>Delete child objects of the object</li>
     * <li>Create child objects of the object</li>
     * </ul>
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_policyadministratorsname
     */
    get_PolicyAdministratorsName() {
        pvarAdmins := VARIANT()
        result := ComCall(39, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * Retrieves the account names of principals that act as policy readers.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-get_policyreadersname
     */
    get_PolicyReadersName() {
        pvarReaders := VARIANT()
        result := ComCall(40, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * The AddPolicyAdministratorName method of IAzScope adds the specified account name to the list of principals that act as policy administrators.
     * @remarks
     * 
     * Policy administrators for an object can perform the following tasks:
     * 
     * <ul>
     * <li>Read the object</li>
     * <li>Write attributes to the object</li>
     * <li>Read attributes of child objects of the object</li>
     * <li>Write attributes to child objects of the object</li>
     * <li>Delete the object</li>
     * <li>Delete child objects of the object</li>
     * <li>Create child objects of the object</li>
     * </ul>
     * To view the list of policy administrators in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyadministratorsname">PolicyAdministratorsName</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrAdmin The account name to add to the list of policy administrators.  The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the "ExampleDomain\UserName" format. If the domain is not  in the "ExampleDomain\UserName" format, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-addpolicyadministratorname
     */
    AddPolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(41, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The DeletePolicyAdministratorName method of IAzScope removes the specified account name from the list of principals that act as policy administrators.
     * @remarks
     * 
     * Policy administrators for an object can perform the following tasks:
     * 
     * <ul>
     * <li>Read the object</li>
     * <li>Write attributes to the object</li>
     * <li>Read attributes of child objects of the object</li>
     * <li>Write attributes to child objects of the object</li>
     * <li>Delete the object</li>
     * <li>Delete child objects of the object</li>
     * <li>Create child objects of the object</li>
     * </ul>
     * To view the list of policy administrators in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyadministratorsname">PolicyAdministratorsName</a> property.
     * 
     * @param {BSTR} bstrAdmin Account name to remove from the list of policy administrators. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the "ExampleDomain\UserName" format. If the domain is not  in the "ExampleDomain\UserName" format, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-deletepolicyadministratorname
     */
    DeletePolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(42, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The AddPolicyReaderName method of IAzScope adds the specified account name to the list of principals that act as policy readers.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyreadersname">PolicyReadersName</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrReader Account name to add to the list of policy readers. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the "ExampleDomain\UserName" format. If the domain is not  in the "ExampleDomain\UserName" format, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-addpolicyreadername
     */
    AddPolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(43, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The DeletePolicyReaderName method of IAzScope removes the specified account name from the list of principals that act as policy readers.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-get_policyreadersname">PolicyReadersName</a> property.
     * 
     * @param {BSTR} bstrReader Account name to remove from the list of policy readers. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the "ExampleDomain\UserName" format. If the domain is not  in the "ExampleDomain\UserName" format, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazscope-deletepolicyreadername
     */
    DeletePolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(44, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }
}
