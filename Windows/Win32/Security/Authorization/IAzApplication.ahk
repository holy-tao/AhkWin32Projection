#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IAzScopes.ahk
#Include .\IAzScope.ahk
#Include .\IAzOperations.ahk
#Include .\IAzOperation.ahk
#Include .\IAzTasks.ahk
#Include .\IAzTask.ahk
#Include .\IAzApplicationGroups.ahk
#Include .\IAzApplicationGroup.ahk
#Include .\IAzRoles.ahk
#Include .\IAzRole.ahk
#Include .\IAzClientContext.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines an installed instance of an application. An IAzApplication object is created when an application is installed.
 * @remarks
 * The <b>IAzApplication</b> object is a container in which all authorization policies that apply to an instance of an application reside.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazapplication
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzApplication extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzApplication
     * @type {Guid}
     */
    static IID => Guid("{987bc7c7-b813-4d27-bede-6ba5ae867e95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Description", "put_Description", "get_ApplicationData", "put_ApplicationData", "get_AuthzInterfaceClsid", "put_AuthzInterfaceClsid", "get_Version", "put_Version", "get_GenerateAudits", "put_GenerateAudits", "get_ApplyStoreSacl", "put_ApplyStoreSacl", "get_Writable", "GetProperty", "SetProperty", "get_PolicyAdministrators", "get_PolicyReaders", "AddPolicyAdministrator", "DeletePolicyAdministrator", "AddPolicyReader", "DeletePolicyReader", "get_Scopes", "OpenScope", "CreateScope", "DeleteScope", "get_Operations", "OpenOperation", "CreateOperation", "DeleteOperation", "get_Tasks", "OpenTask", "CreateTask", "DeleteTask", "get_ApplicationGroups", "OpenApplicationGroup", "CreateApplicationGroup", "DeleteApplicationGroup", "get_Roles", "OpenRole", "CreateRole", "DeleteRole", "InitializeClientContextFromToken", "AddPropertyItem", "DeletePropertyItem", "Submit", "InitializeClientContextFromName", "get_DelegatedPolicyUsers", "AddDelegatedPolicyUser", "DeleteDelegatedPolicyUser", "InitializeClientContextFromStringSid", "get_PolicyAdministratorsName", "get_PolicyReadersName", "AddPolicyAdministratorName", "DeletePolicyAdministratorName", "AddPolicyReaderName", "DeletePolicyReaderName", "get_DelegatedPolicyUsersName", "AddDelegatedPolicyUserName", "DeleteDelegatedPolicyUserName"]

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
     * @type {BSTR} 
     */
    AuthzInterfaceClsid {
        get => this.get_AuthzInterfaceClsid()
        set => this.put_AuthzInterfaceClsid(value)
    }

    /**
     * @type {BSTR} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * @type {BOOL} 
     */
    GenerateAudits {
        get => this.get_GenerateAudits()
        set => this.put_GenerateAudits(value)
    }

    /**
     * @type {BOOL} 
     */
    ApplyStoreSacl {
        get => this.get_ApplyStoreSacl()
        set => this.put_ApplyStoreSacl(value)
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
     * @type {IAzScopes} 
     */
    Scopes {
        get => this.get_Scopes()
    }

    /**
     * @type {IAzOperations} 
     */
    Operations {
        get => this.get_Operations()
    }

    /**
     * @type {IAzTasks} 
     */
    Tasks {
        get => this.get_Tasks()
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
     * @type {VARIANT} 
     */
    DelegatedPolicyUsers {
        get => this.get_DelegatedPolicyUsers()
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
     * @type {VARIANT} 
     */
    DelegatedPolicyUsersName {
        get => this.get_DelegatedPolicyUsersName()
    }

    /**
     * Sets or retrieves the name of the application. (Get)
     * @remarks
     * The maximum length of the <b>Name</b> property is 512 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * Sets or retrieves the name of the application. (Put)
     * @remarks
     * The maximum length of the <b>Name</b> property is 512 characters.
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-put_name
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a comment that describes the application. (Get)
     * @remarks
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(9, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * Sets or retrieves a comment that describes the application. (Put)
     * @remarks
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(10, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves an opaque field that can be used by the application to store information. (IAzApplication.get_ApplicationData)
     * @remarks
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_applicationdata
     */
    get_ApplicationData() {
        pbstrApplicationData := BSTR()
        result := ComCall(11, this, "ptr", pbstrApplicationData, "HRESULT")
        return pbstrApplicationData
    }

    /**
     * Sets or retrieves an opaque field that can be used by the application to store information. (IAzApplication.put_ApplicationData)
     * @remarks
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(12, this, "ptr", bstrApplicationData, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the class identifier (CLSID) of the interface that the user interface (UI) uses to perform application-specific operations. (Get)
     * @remarks
     * A CLSID is a GUID associated with a COM class.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_authzinterfaceclsid
     */
    get_AuthzInterfaceClsid() {
        pbstrProp := BSTR()
        result := ComCall(13, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Sets or retrieves the class identifier (CLSID) of the interface that the user interface (UI) uses to perform application-specific operations. (Put)
     * @remarks
     * A CLSID is a GUID associated with a COM class.
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-put_authzinterfaceclsid
     */
    put_AuthzInterfaceClsid(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(14, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the version of the application. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_version
     */
    get_Version() {
        pbstrProp := BSTR()
        result := ComCall(15, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Sets or retrieves the version of the application. (Put)
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-put_version
     */
    put_Version(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(16, this, "ptr", bstrProp, "HRESULT")
        return result
    }

    /**
     * The GenerateAudits property of IAzApplication sets or retrieves a value that indicates whether run-time audits should be generated. (Get)
     * @remarks
     * The <b>GenerateAudits</b> property controls  client context creation, client context deletion,  and access check run-time auditing. The client context can be created by a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID), name, or token.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_generateaudits">AzAuthorizationStore.GenerateAudits</a> property controls application initialization auditing.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_generateaudits
     */
    get_GenerateAudits() {
        result := ComCall(17, this, "int*", &pbProp := 0, "HRESULT")
        return pbProp
    }

    /**
     * The GenerateAudits property of IAzApplication sets or retrieves a value that indicates whether run-time audits should be generated. (Put)
     * @remarks
     * The <b>GenerateAudits</b> property controls  client context creation, client context deletion,  and access check run-time auditing. The client context can be created by a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID), name, or token.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_generateaudits">AzAuthorizationStore.GenerateAudits</a> property controls application initialization auditing.
     * @param {BOOL} bProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-put_generateaudits
     */
    put_GenerateAudits(bProp) {
        result := ComCall(18, this, "int", bProp, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether policy audits should be generated when the authorization store is modified. (IAzApplication.get_ApplyStoreSacl)
     * @remarks
     * Policy audits are generated when the underlying policy store is modified. Both success and failure audits are requested.
     * 
     * This property controls policy auditing only for the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object and its child objects.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_applystoresacl
     */
    get_ApplyStoreSacl() {
        result := ComCall(19, this, "int*", &pbProp := 0, "HRESULT")
        return pbProp
    }

    /**
     * Sets or retrieves a value that indicates whether policy audits should be generated when the authorization store is modified. (IAzApplication.put_ApplyStoreSacl)
     * @remarks
     * Policy audits are generated when the underlying policy store is modified. Both success and failure audits are requested.
     * 
     * This property controls policy auditing only for the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object and its child objects.
     * @param {BOOL} bProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-put_applystoresacl
     */
    put_ApplyStoreSacl(bProp) {
        result := ComCall(20, this, "int", bProp, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the object can be modified by the user context that initialized it.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_writable
     */
    get_Writable() {
        result := ComCall(21, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * Returns the IAzApplication object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object property  to return. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID"></a><a id="az_prop_application_authz_interface_clsid"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_authzinterfaceclsid">AuthzInterfaceClsid</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_applicationdata">ApplicationData</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_VERSION"></a><a id="az_prop_application_version"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_version">Version</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLY_STORE_SACL"></a><a id="az_prop_apply_store_sacl"></a><dl>
     * <dt><b>AZ_PROP_APPLY_STORE_SACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_applystoresacl">ApplyStoreSacl</a> property
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
     * <td width="40%"><a id="AZ_PROP_DELEGATED_POLICY_USERS"></a><a id="az_prop_delegated_policy_users"></a><dl>
     * <dt><b>AZ_PROP_DELEGATED_POLICY_USERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusers">DelegatedPolicyUsers</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DELEGATED_POLICY_USERS_NAME"></a><a id="az_prop_delegated_policy_users_name"></a><dl>
     * <dt><b>AZ_PROP_DELEGATED_POLICY_USERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusersname">DelegatedPolicyUsersName</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_description">Description</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GENERATE_AUDITS"></a><a id="az_prop_generate_audits"></a><dl>
     * <dt><b>AZ_PROP_GENERATE_AUDITS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_generateaudits">GenerateAudits</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_name">Name</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS"></a><a id="az_prop_policy_admins"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_policyadministrators">PolicyAdministrators</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS_NAME"></a><a id="az_prop_policy_admins_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_policyadministratorsname">PolicyAdministratorsName</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS"></a><a id="az_prop_policy_readers"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_policyreaders">PolicyReaders</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS_NAME"></a><a id="az_prop_policy_readers_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_policyreadersname">PolicyReadersName</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_WRITABLE"></a><a id="az_prop_writable"></a><dl>
     * <dt><b>AZ_PROP_WRITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_writable">Writable</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {VARIANT} A pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object property.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(22, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Sets the specified value to the IAzApplication object property with the specified property ID.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-submit">Submit</a> method to persist any changes made by this method.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object property  to set. The following table shows the possible values.
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
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_applicationdata">ApplicationData</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID"></a><a id="az_prop_application_authz_interface_clsid"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_AUTHZ_INTERFACE_CLSID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_authzinterfaceclsid">AuthzInterfaceClsid</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_VERSION"></a><a id="az_prop_application_version"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_version">Version</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLY_STORE_SACL"></a><a id="az_prop_apply_store_sacl"></a><dl>
     * <dt><b>AZ_PROP_APPLY_STORE_SACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_applystoresacl">ApplyStoreSacl</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_description">Description</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GENERATE_AUDITS"></a><a id="az_prop_generate_audits"></a><dl>
     * <dt><b>AZ_PROP_GENERATE_AUDITS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_generateaudits">GenerateAudits</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_NAME"></a><a id="az_prop_name"></a><dl>
     * <dt><b>AZ_PROP_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_name">Name</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Value to set to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object property  specified by the <i>lPropId</i> parameter. The type of data that must be used depends on the value of the <i>lPropId</i> parameter.
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
     * <td width="40%"><a id="AZ_PROP_APPLICATION_INTERFACE_CLSID"></a><a id="az_prop_application_interface_clsid"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_INTERFACE_CLSID</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_VERSION"></a><a id="az_prop_application_version"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_VERSION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>/<b>String</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLY_STORE_SACL"></a><a id="az_prop_apply_store_sacl"></a><dl>
     * <dt><b>AZ_PROP_APPLY_STORE_SACL</b></dt>
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
     * <td width="40%"><a id="AZ_PROP_GENERATE_AUDITS"></a><a id="az_prop_generate_audits"></a><dl>
     * <dt><b>AZ_PROP_GENERATE_AUDITS</b></dt>
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
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(23, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the security identifiers (SIDs), in text form, of principals that act as policy administrators.
     * @remarks
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyadministrators
     */
    get_PolicyAdministrators() {
        pvarAdmins := VARIANT()
        result := ComCall(24, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * Retrieves the security identifiers (SIDs), in text form, of principals that act as policy readers.
     * @remarks
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyreaders
     */
    get_PolicyReaders() {
        pvarReaders := VARIANT()
        result := ComCall(25, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of principals that act as policy administrators. (IAzApplication.AddPolicyAdministrator)
     * @remarks
     * Policy administrators for an object can perform the following tasks:
     * 
     * - Read the object
     * - Write attributes to the object
     * - Read attributes of child objects of the object
     * - Write attributes to child objects of the object
     * - Delete the object
     * - Delete child objects of the object
     * - Create child objects of the object
     * 
     * To view the list of policy administrators, use the [PolicyAdministrators](nf-azroles-iazapplication-get_policyadministrators.md) property.
     * 
     * You must call the [Submit](nf-azroles-iazapplication-submit.md) method to persist any changes made by this method.
     * @param {BSTR} bstrAdmin Text form of the SID to add to the list of policy administrators.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpolicyadministrator
     */
    AddPolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(26, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The DeletePolicyAdministrator method of IAzApplication removes the specified security identifier in text form from the list of principals that act as policy administrators.
     * @remarks
     * Policy administrators for an object can perform the following tasks:
     * 
     * - Read the object
     * - Write attributes to the object
     * - Read attributes of child objects of the object
     * - Write attributes to child objects of the object
     * - Delete the object
     * - Delete child objects of the object
     * - Create child objects of the object
     * 
     * To view the list of policy administrators, use the [PolicyAdministrators](nf-azroles-iazapplication-get_policyadministrators.md) property.
     * @param {BSTR} bstrAdmin Text form of the SID to remove from the list of policy administrators.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepolicyadministrator
     */
    DeletePolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(27, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of principals that act as policy readers. (IAzApplication.AddPolicyReader)
     * @remarks
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the [AccessCheck](nf-azroles-iazclientcontext-accesscheck.md) method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers, use the [PolicyReaders](nf-azroles-iazapplication-get_policyreaders.md) property.
     * 
     * You must call the [Submit](nf-azroles-iazapplication-submit.md) method to persist any changes made by this method.
     * @param {BSTR} bstrReader Text form of the SID to add to the list of policy readers.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpolicyreader
     */
    AddPolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(28, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The DeletePolicyReader method of IAzApplication removes the specified security identifier in text form from the list of principals that act as policy readers.
     * @remarks
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the [AccessCheck](nf-azroles-iazclientcontext-accesscheck.md) method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers, use the [PolicyReaders](nf-azroles-iazapplication-get_policyreaders.md) property.
     * @param {BSTR} bstrReader Text form of the SID to remove from the list of policy readers.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepolicyreader
     */
    DeletePolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(29, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves an IAzScopes object that is used to enumerate IAzScope objects from the policy data.
     * @remarks
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @returns {IAzScopes} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_scopes
     */
    get_Scopes() {
        result := ComCall(30, this, "ptr*", &ppScopeCollection := 0, "HRESULT")
        return IAzScopes(ppScopeCollection)
    }

    /**
     * Opens an IAzScope object with the specified name.
     * @param {BSTR} bstrScopeName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzScope} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openscope
     */
    OpenScope(bstrScopeName, varReserved) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(31, this, "ptr", bstrScopeName, "ptr", varReserved, "ptr*", &ppScope := 0, "HRESULT")
        return IAzScope(ppScope)
    }

    /**
     * Creates an IAzScope object with the specified name.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazscope-submit">IAzScope::Submit</a> method to persist any changes made to the returned object.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object is an immediate child object of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @param {BSTR} bstrScopeName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzScope} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createscope
     */
    CreateScope(bstrScopeName, varReserved) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(32, this, "ptr", bstrScopeName, "ptr", varReserved, "ptr*", &ppScope := 0, "HRESULT")
        return IAzScope(ppScope)
    }

    /**
     * Removes the IAzScope object with the specified name from the IAzApplication object.
     * @remarks
     * If there are any [IAzScope](nn-azroles-iazscope.md) references to an **IAzScope** object that has been deleted from the cache, the **IAzScope** object can no longer be used. In C++, you must release references to deleted **IAzScope** objects by calling the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method. In C# and Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrScopeName Name of the [IAzScope](nn-azroles-iazscope.md) object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletescope
     */
    DeleteScope(bstrScopeName, varReserved) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(33, this, "ptr", bstrScopeName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves an IAzOperations object that is used to enumerate IAzOperation objects from the policy data.
     * @remarks
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @returns {IAzOperations} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_operations
     */
    get_Operations() {
        result := ComCall(34, this, "ptr*", &ppOperationCollection := 0, "HRESULT")
        return IAzOperations(ppOperationCollection)
    }

    /**
     * Opens an IAzOperation object with the specified name.
     * @param {BSTR} bstrOperationName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzOperation} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openoperation
     */
    OpenOperation(bstrOperationName, varReserved) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(35, this, "ptr", bstrOperationName, "ptr", varReserved, "ptr*", &ppOperation := 0, "HRESULT")
        return IAzOperation(ppOperation)
    }

    /**
     * Creates an IAzOperation object with the specified name.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazoperation-submit">IAzOperation::Submit</a> method to persist any changes made to the returned object.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object is an immediate child object of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @param {BSTR} bstrOperationName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzOperation} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazoperation">IAzOperation</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createoperation
     */
    CreateOperation(bstrOperationName, varReserved) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(36, this, "ptr", bstrOperationName, "ptr", varReserved, "ptr*", &ppOperation := 0, "HRESULT")
        return IAzOperation(ppOperation)
    }

    /**
     * Removes the IAzOperation object with the specified name from the IAzApplication object.
     * @remarks
     * If there are any [IAzApplication](nn-azroles-iazapplication.md) references to an **IAzOperation** object that has been deleted from the cache, the **IAzOperation** object can no longer be used. In C++, you must release references to deleted **IAzOperation** objects by calling the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method. In C# and Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrOperationName Name of the [IAzApplication](nn-azroles-iazapplication.md) object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deleteoperation
     */
    DeleteOperation(bstrOperationName, varReserved) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(37, this, "ptr", bstrOperationName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The Tasks property of IAzApplication retrieves an IAzTasks object that is used to enumerate IAzTask objects from the policy data.
     * @remarks
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @returns {IAzTasks} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_tasks
     */
    get_Tasks() {
        result := ComCall(38, this, "ptr*", &ppTaskCollection := 0, "HRESULT")
        return IAzTasks(ppTaskCollection)
    }

    /**
     * Opens an IAzTask object with the specified name. (IAzApplication.OpenTask)
     * @param {BSTR} bstrTaskName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzTask} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-opentask
     */
    OpenTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(39, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", &ppTask := 0, "HRESULT")
        return IAzTask(ppTask)
    }

    /**
     * Creates an IAzTask object with the specified name. (IAzApplication.CreateTask)
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-submit">IAzTask::Submit</a> method to persist any changes made to the returned object.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object is an immediate child object of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @param {BSTR} bstrTaskName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzTask} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iaztask">IAzTask</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createtask
     */
    CreateTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(40, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", &ppTask := 0, "HRESULT")
        return IAzTask(ppTask)
    }

    /**
     * Removes the IAzTask object with the specified name from the IAzApplication object.
     * @remarks
     * If there are any [IAzTask](nn-azroles-iaztask.md) references to an **IAzTask** object that has been deleted from the cache, the **IAzTask** object can no longer be used. In C++, you must release references to deleted **IAzTask** objects by calling the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method. In C# and Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrTaskName Name of the [IAzTask](nn-azroles-iaztask.md) object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletetask
     */
    DeleteTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(41, this, "ptr", bstrTaskName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves an IAzApplicationGroups object that is used to enumerate IAzApplicationGroup objects from the policy data. (IAzApplication.get_ApplicationGroups)
     * @remarks
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @returns {IAzApplicationGroups} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_applicationgroups
     */
    get_ApplicationGroups() {
        result := ComCall(42, this, "ptr*", &ppGroupCollection := 0, "HRESULT")
        return IAzApplicationGroups(ppGroupCollection)
    }

    /**
     * Opens an IAzApplicationGroup object by specifying its name. (IAzApplication.OpenApplicationGroup)
     * @param {BSTR} bstrGroupName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplicationGroup} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openapplicationgroup
     */
    OpenApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(43, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * Creates an IAzApplicationGroup object with the specified name. (IAzApplication.CreateApplicationGroup)
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplicationgroup-submit">IAzApplicationGroup::Submit</a> method to persist any changes made to the returned object.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object is an immediate child object of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @param {BSTR} bstrGroupName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplicationGroup} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createapplicationgroup
     */
    CreateApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(44, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * Removes the IAzApplicationGroup object with the specified name from the IAzApplication object.
     * @remarks
     * If there are any [IAzApplicationGroup](nn-azroles-iazapplicationgroup.md) references to an **IAzApplicationGroup** object that has been deleted from the cache, the **IAzApplicationGroup** object can no longer be used. In C++, you must release references to deleted **IAzApplicationGroup** objects by calling the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method. In C# and Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrGroupName Name of the [IAzApplicationGroup](nn-azroles-iazapplicationgroup.md) object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deleteapplicationgroup
     */
    DeleteApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(45, this, "ptr", bstrGroupName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The Roles property of IAzApplication retrieves an IAzRoles object that is used to enumerate IAzRole objects from the policy data.
     * @remarks
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @returns {IAzRoles} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_roles
     */
    get_Roles() {
        result := ComCall(46, this, "ptr*", &ppRoleCollection := 0, "HRESULT")
        return IAzRoles(ppRoleCollection)
    }

    /**
     * Opens an IAzRole object with the specified name. (IAzApplication.OpenRole)
     * @param {BSTR} bstrRoleName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzRole} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openrole
     */
    OpenRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(47, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", &ppRole := 0, "HRESULT")
        return IAzRole(ppRole)
    }

    /**
     * Creates an IAzRole object with the specified name. (IAzApplication.CreateRole)
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">IAzRole::Submit</a> method to persist any changes made to the returned object.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object is an immediate child object of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @param {BSTR} bstrRoleName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzRole} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazrole">IAzRole</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createrole
     */
    CreateRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(48, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", &ppRole := 0, "HRESULT")
        return IAzRole(ppRole)
    }

    /**
     * Removes the IAzRole object with the specified name from the IAzApplication object.
     * @remarks
     * If there are any [IAzRole](nn-azroles-iazrole.md) references to an **IAzRole** object that has been deleted from the cache, the **IAzRole** object can no longer be used. In C++, you must release references to deleted **IAzRole** objects by calling the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method. In C# and Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrRoleName Name of the [IAzRole](nn-azroles-iazrole.md) object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deleterole
     */
    DeleteRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(49, this, "ptr", bstrRoleName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Gets an IAzClientContext object pointer from the specified client token.
     * @param {Integer} ullTokenHandle A handle to a Windows token that specifies the client. If this parameter is <b>NULL</b>, the impersonation token of the caller's thread is used. If the thread does not have an impersonation token, the process token is used. The token must have been opened for TOKEN_QUERY, TOKEN_IMPERSONATE, and TOKEN_DUPLICATE access.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzClientContext} A pointer to a pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext">IAzClientContext</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromtoken
     */
    InitializeClientContextFromToken(ullTokenHandle, varReserved) {
        result := ComCall(50, this, "uint", ullTokenHandle, "ptr", varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext(ppClientContext)
    }

    /**
     * Adds the specified principal to the specified list of principals. (IAzApplication.AddPropertyItem)
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-submit">Submit</a> method to persist any changes made by this method.
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
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-addpolicyadministrator">AddPolicyAdministrator</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS_NAME"></a><a id="az_prop_policy_admins_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-addpolicyadministratorname">AddPolicyAdministratorName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS"></a><a id="az_prop_policy_readers"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-addpolicyreader">AddPolicyReader</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS_NAME"></a><a id="az_prop_policy_readers_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-addpolicyreadername">AddPolicyReaderName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DELEGATED_POLICY_USERS"></a><a id="az_prop_delegated_policy_users"></a><dl>
     * <dt><b>AZ_PROP_DELEGATED_POLICY_USERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-adddelegatedpolicyuser">AddDelegatedPolicyUser</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DELEGATED_POLICY_USERS_NAME"></a><a id="az_prop_delegated_policy_users_name"></a><dl>
     * <dt><b>AZ_PROP_DELEGATED_POLICY_USERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be added using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-adddelegatedpolicyusername">AddDelegatedPolicyUserName</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Principal to add to the list of principals specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * 
     * If AZ_PROP_POLICY_ADMINS_NAME, AZ_PROP_POLICY_READERS_NAME, or AZ_PROP_DELEGATED_POLICY_USERS_NAME is specified for the <i>lPropId</i> parameter, the string is the account name of the account to add to the list. The account name must be in user principal name (UPN) format (for example, "someone@example.com").
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(51, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified principal from the specified list of principals. (IAzApplication.DeletePropertyItem)
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-submit">Submit</a> method to persist any changes made by this method.
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
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-deletepolicyadministrator">DeletePolicyAdministrator</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS_NAME"></a><a id="az_prop_policy_admins_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-deletepolicyadministratorname">DeletePolicyAdministratorName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS"></a><a id="az_prop_policy_readers"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-deletepolicyreader">DeletePolicyReader</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS_NAME"></a><a id="az_prop_policy_readers_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-deletepolicyreadername">DeletePolicyReaderName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DELEGATED_POLICY_USERS"></a><a id="az_prop_delegated_policy_users"></a><dl>
     * <dt><b>AZ_PROP_DELEGATED_POLICY_USERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-deletedelegatedpolicyuser">DeleteDelegatedPolicyUser</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DELEGATED_POLICY_USERS_NAME"></a><a id="az_prop_delegated_policy_users_name"></a><dl>
     * <dt><b>AZ_PROP_DELEGATED_POLICY_USERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-deletedelegatedpolicyusername">DeleteDelegatedPolicyUserName</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Principal to remove from the list of principals specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * 
     * If AZ_PROP_POLICY_ADMINS, AZ_PROP_POLICY_READERS, or AZ_PROP_DELEGATED_POLICY_USERS is specified for the <i>lPropId</i> parameter, the string is the text form  of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the  Windows account to remove from the list. If AZ_PROP_POLICY_ADMINS_NAME, AZ_PROP_POLICY_READERS_NAME, or AZ_PROP_DELEGATED_POLICY_USERS_NAME is specified for the <i>lPropId</i> parameter, the string is the account name of the account to remove from the list. The account name can be in either user principal name (UPN) format (for example,  "someone@example.com") or in the format  of "ExampleDomain\UserName".
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(52, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Persists changes made to the IAzApplication object.
     * @remarks
     * Any additions or modifications to an [IAzApplication](nn-azroles-iazapplication.md) object are not persisted until the **Submit** method is called.
     * 
     * The **Submit** method does not extend to child objects; child objects  must be individually persisted to the policy store. A created [IAzApplication](nn-azroles-iazapplication.md) object must be submitted before it can be referenced or become a parent object. The destructor for an object silently discards unsubmitted changes.
     * @param {Integer} lFlags Flags that modify the behavior of the **Submit** method. The default value is zero. If the **AZ_SUBMIT_FLAG_ABORT** flag is specified, the changes to the object are discarded and the object is updated to match the underlying policy store.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(53, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Gets an IAzClientContext object pointer from the client identity as a (domain name, client name) pair.
     * @remarks
     * If possible, call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromtoken">InitializeClientContextFromToken</a>  function instead of <b>InitializeClientContextFromName</b>. <b>InitializeClientContextFromName</b> attempts to retrieve the information available in a logon token had the client actually logged on. An actual logon token provides more information, such as logon type and logon properties, and reflects the behavior of the authentication package used for the logon. The client context  created by <b>InitializeClientContextFromToken</b> uses a logon token, and the resulting client context is more complete and accurate than a client context created by <b>InitializeClientContextFromName</b>.
     * 
     * The <i>DomainName</i> and <i>ClientName</i> parameters must combine to represent a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-sid_name_use">SidTypeUser</a>.
     * 
     * The supported name formats are the same as those supported by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function.
     * 
     * <div class="alert"><b>Important</b>  Applications should not assume that the calling context has permission to use this function. The <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzinitializecontextfromsid">AuthzInitializeContextFromSid</a> function reads the tokenGroupsGlobalAndUniversal attribute of the SID specified in the call to determine the current user's group memberships. If the user's object is in <a href="https://docs.microsoft.com/windows/desktop/AD/active-directory-domain-services">Active Directory</a>, the calling context must have read access to the tokenGroupsGlobalAndUniversal attribute on the user object. Read access to the tokenGroupsGlobalAndUniversal attribute is granted  to the <b>Pre-Windows 2000 Compatible Access</b> group, but new domains contain an empty <b>Pre-Windows 2000 Compatible Access</b> group by default because the default setup selection is <b>Permissions compatible with Windows 2000 and Windows Server 2003</b>. Therefore, applications may not have access to the tokenGroupsGlobalAndUniversal attribute; in this case, the <b>AuthzInitializeContextFromSid</b> function  fails with ACCESS_DENIED. Applications that use this function should correctly handle this error and provide supporting documentation. To simplify granting accounts permission to query a user's group information, add accounts that need the ability to look up group information to the Windows Authorization Access Group.</div>
     * <div> </div>
     * Applications calling this function should use the fully qualified domain name or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN). Otherwise, this method might fail across forests if the NetBIOS domain name is used and the two domains do not have a direct trust relationship.
     * @param {BSTR} ClientName Name of the security principal.
     * @param {BSTR} DomainName Domain name in which the user account resides. The default value is <b>NULL</b>.
     * @param {VARIANT} varReserved 
     * @returns {IAzClientContext} A pointer to a pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext">IAzClientContext</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromname
     */
    InitializeClientContextFromName(ClientName, DomainName, varReserved) {
        ClientName := ClientName is String ? BSTR.Alloc(ClientName).Value : ClientName
        DomainName := DomainName is String ? BSTR.Alloc(DomainName).Value : DomainName

        result := ComCall(54, this, "ptr", ClientName, "ptr", DomainName, "ptr", varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext(ppClientContext)
    }

    /**
     * Retrieves the security identifiers (SIDs), in text form, of principals that act as delegated policy users.
     * @remarks
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object uses to administer the delegated object.
     * 
     * <div class="alert"><b>Note</b>  Delegated policy users are not supported for XML stores.</div>
     * <div> </div>
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusers
     */
    get_DelegatedPolicyUsers() {
        pvarDelegatedPolicyUsers := VARIANT()
        result := ComCall(55, this, "ptr", pvarDelegatedPolicyUsers, "HRESULT")
        return pvarDelegatedPolicyUsers
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of principals that act as delegated policy users. (IAzApplication.AddDelegatedPolicyUser)
     * @remarks
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object uses to administer the delegated object.
     * 
     * <div class="alert"><b>Note</b>  Delegated policy users are not supported for XML stores.</div>
     * <div> </div>
     * To view the list of delegated policy users, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusers">DelegatedPolicyUsers</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-submit">Submit</a> method to persist any changes made by this method.
     * @param {BSTR} bstrDelegatedPolicyUser Text form of the SID to add to the list of delegated policy users.
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} <h3>C++</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * An attempt to call this method on an XML store will return E_INVALIDARG.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * 
     * <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * An attempt to call this method on an XML store will return E_INVALIDARG.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-adddelegatedpolicyuser
     */
    AddDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(56, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The IAzApplication::DeleteDelegatedPolicyUser method removes the specified security identifier in text form from the list of principals that act as delegated policy users.
     * @remarks
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an [IAzApplication](nn-azroles-iazapplication.md) object uses to administer the delegated object.
     * 
     * > [!NOTE]
     * > Delegated policy users are not supported for XML stores.
     * 
     * To view the list of delegated policy users, use the [DelegatedPolicyUsers](nf-azroles-iazapplication-get_delegatedpolicyusers.md) property.
     * @param {BSTR} bstrDelegatedPolicyUser Text form of the SID to remove from the list of delegated policy users.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, it will return `S_OK`. Any other **HRESULT** value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletedelegatedpolicyuser
     */
    DeleteDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(57, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Gets an IAzClientContext object pointer from the specified security identifier (SID) in text form.
     * @remarks
     * If possible, call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromtoken">InitializeClientContextFromToken</a>  function instead of <b>InitializeClientContextFromStringSid</b>. <b>InitializeClientContextFromStringSid</b> attempts to retrieve the information available in a logon token had the client actually logged on. An actual logon token provides more information, such as logon type and logon properties, and reflects the behavior of the authentication package used for the logon. The client context  created by <b>InitializeClientContextFromToken</b> uses a logon token, and the resulting client context is more complete and accurate than a client context created by <b>InitializeClientContextFromStringSid</b>.
     * 
     * <div class="alert"><b>Important</b>  Applications should not assume that the calling context has permission to use this function. The <a href="https://docs.microsoft.com/windows/desktop/api/authz/nf-authz-authzinitializecontextfromsid">AuthzInitializeContextFromSid</a> function reads the tokenGroupsGlobalAndUniversal attribute of the SID specified in the call to determine the current user's group memberships. If the user's object is in <a href="https://docs.microsoft.com/windows/desktop/AD/active-directory-domain-services">Active Directory</a>, the calling context must have read access to the tokenGroupsGlobalAndUniversal attribute on the user object. Read access to the tokenGroupsGlobalAndUniversal attribute is granted  to the <b>Pre-Windows 2000 Compatible Access</b> group, but new domains contain an empty <b>Pre-Windows 2000 Compatible Access</b> group by default because the default setup selection is <b>Permissions compatible with Windows 2000 and Windows Server 2003</b>. Therefore, applications may not have access to the tokenGroupsGlobalAndUniversal attribute; in this case, the <b>AuthzInitializeContextFromSid</b> function  fails with ACCESS_DENIED. Applications that use this function should correctly handle this error and provide supporting documentation. To simplify granting accounts permission to query a user's group information, add accounts that need the ability to look up group information to the Windows Authorization Access Group.</div>
     * <div> </div>
     * Applications calling this function should use the fully qualified domain name or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN). Otherwise, this method might fail across forests if the NetBIOS domain name is used and the two domains do not have a direct trust relationship.
     * @param {BSTR} SidString A string that contains the text form of the SID of the security principal. This must be a valid string SID that can be converted by the <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertstringsidtosida">ConvertStringSidToSid</a> function.
     * @param {Integer} lOptions Options for the context creation.
     * 
     * If AZ_CLIENT_CONTEXT_SKIP_GROUP is specified, the SID specified in the <i>SidString</i> parameter is not necessarily a valid user account. The SID will be used to create the context without validation. The created context will be flagged as having been created from a SID,  the  SID string will be stored in the client name field, and the domain name field will be empty. Token groups will not be used in the client context creation. <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Lightweight Directory Access Protocol</a> (LDAP) query groups are not supported when AZ_CLIENT_CONTEXT_SKIP_GROUP is specified. Because the account is not validated in Active Directory, the client context's user information properties, such as <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_usersamcompat">UserSamCompat</a>, will not be valid, and when accessed, they  will return ERROR_INVALID_HANDLE. The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-get_roleforaccesscheck">RoleForAccessCheck</a> property and the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext">IAzClientContext</a> can still be used to specify a role for access checking. The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-getroles">GetRoles</a> method of <b>IAzClientContext</b> can still be used to enumerate  roles assigned to the context within a specific scope.
     * 
     * If AZ_CLIENT_CONTEXT_SKIP_GROUP is not specified, the SID must represent a valid  user account.
     * @param {VARIANT} varReserved 
     * @returns {IAzClientContext} A pointer to a pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext">IAzClientContext</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromstringsid
     */
    InitializeClientContextFromStringSid(SidString, lOptions, varReserved) {
        SidString := SidString is String ? BSTR.Alloc(SidString).Value : SidString

        result := ComCall(58, this, "ptr", SidString, "int", lOptions, "ptr", varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext(ppClientContext)
    }

    /**
     * The IAzApplication::PolicyAdministratorsName property retrieves the account names of principals that act as policy administrators.
     * @remarks
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyadministratorsname
     */
    get_PolicyAdministratorsName() {
        pvarAdmins := VARIANT()
        result := ComCall(59, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * The IAzApplication::PolicyReadersName property retrieves the account names of principals that act as policy readers.
     * @remarks
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyreadersname
     */
    get_PolicyReadersName() {
        pvarReaders := VARIANT()
        result := ComCall(60, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * Adds the specified account name to the list of principals that act as policy administrators. (IAzApplication.AddPolicyAdministratorName)
     * @remarks
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
     * To view the list of policy administrators in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_policyadministratorsname">PolicyAdministratorsName</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-submit">Submit</a> method to persist any changes made by this method.
     * @param {BSTR} bstrAdmin Account name to add to the list of policy administrators. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpolicyadministratorname
     */
    AddPolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(61, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of principals that act as policy administrators. (IAzApplication.DeletePolicyAdministratorName)
     * @remarks
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
     * To view the list of policy administrators in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_policyadministratorsname">PolicyAdministratorsName</a> property.
     * @param {BSTR} bstrAdmin Account name to remove from the list of policy administrators. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the format of "ExampleDomain\UserName". If the domain is not  in the "ExampleDomain\UserName" format, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepolicyadministratorname
     */
    DeletePolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(62, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified account name to the list of principals that act as policy readers. (IAzApplication.AddPolicyReaderName)
     * @remarks
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_policyreadersname">PolicyReadersName</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-submit">Submit</a> method to persist any changes made by this method.
     * @param {BSTR} bstrReader Account name to add to the list of policy readers. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpolicyreadername
     */
    AddPolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(63, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of principals that act as policy readers. (IAzApplication.DeletePolicyReaderName)
     * @remarks
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_policyreadersname">PolicyReadersName</a> property.
     * @param {BSTR} bstrReader The account name to remove from the list of policy readers. The account name can be in either user principal name (UPN) format (for example, "someone@example.com") or in the format of "ExampleDomain\UserName". If the domain is not  in the "ExampleDomain\UserName" format, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepolicyreadername
     */
    DeletePolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(64, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * The DelegatedPolicyUsersName property of IAzApplication retrieves the account names of principals that act as delegated policy users.
     * @remarks
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object uses to administer the delegated object.
     * 
     * <div class="alert"><b>Note</b>  Delegated policy users are not supported for XML stores.</div>
     * <div> </div>
     * In JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusersname
     */
    get_DelegatedPolicyUsersName() {
        pvarDelegatedPolicyUsers := VARIANT()
        result := ComCall(65, this, "ptr", pvarDelegatedPolicyUsers, "HRESULT")
        return pvarDelegatedPolicyUsers
    }

    /**
     * Adds the specified account name to the list of principals that act as delegated policy users. (IAzApplication.AddDelegatedPolicyUserName)
     * @remarks
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object uses to administer the delegated object.
     * 
     * <div class="alert"><b>Note</b>  Delegated policy users are not supported for XML stores.</div>
     * <div> </div>
     * To view the list of delegated policy users in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusersname">DelegatedPolicyUsersName</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-submit">Submit</a> method to persist any changes made by this method.
     * @param {BSTR} bstrDelegatedPolicyUser Account name to add to the list of delegated policy users. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * An attempt to call this method on an XML store will return E_INVALIDARG.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-adddelegatedpolicyusername
     */
    AddDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(66, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of principals that act as delegated policy users. (IAzApplication.DeleteDelegatedPolicyUserName)
     * @remarks
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object uses to administer the delegated object.
     * 
     * <div class="alert"><b>Note</b>  Delegated policy users are not supported for XML stores.</div>
     * <div> </div>
     * To view the list of delegated policy users in account name format, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusersname">DelegatedPolicyUsersName</a> property.
     * @param {BSTR} bstrDelegatedPolicyUser The account name to remove from the list of delegated policy users. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed. An attempt to call this method on an XML store will return E_INVALIDARG.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletedelegatedpolicyusername
     */
    DeleteDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(67, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }
}
