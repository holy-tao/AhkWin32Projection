#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IAzApplications.ahk
#Include .\IAzApplication.ahk
#Include .\IAzApplicationGroups.ahk
#Include .\IAzApplicationGroup.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines the container that is the root of the authorization policy store.
 * @remarks
 * 
 * The <b>AzAuthorizationStore</b> object is named according to the URL passed to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-initialize">Initialize</a> method. The object has no name within  the policy store.
 * 
 * The application must ensure that the user context from which the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-initialize">Initialize</a> method is called is used for all future access to the <b>AzAuthorizationStore</b> object, except for the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromtoken">IAzApplication::InitializeClientContextFromToken</a> method.
 * 
 * <div class="alert"><b>Note</b>  If an XML store is used over a network, the traffic is not automatically encrypted. IPsec can be used to encrypt the authorization information in transit.</div>
 * <div> </div>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazauthorizationstore
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzAuthorizationStore extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzAuthorizationStore
     * @type {Guid}
     */
    static IID => Guid("{edbd9ca9-9b82-4f6a-9e8b-98301e450f14}")

    /**
     * The class identifier for AzAuthorizationStore
     * @type {Guid}
     */
    static CLSID => Guid("{b2bcff59-a757-4b0b-a1bc-ea69981da69e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description", "put_Description", "get_ApplicationData", "put_ApplicationData", "get_DomainTimeout", "put_DomainTimeout", "get_ScriptEngineTimeout", "put_ScriptEngineTimeout", "get_MaxScriptEngines", "put_MaxScriptEngines", "get_GenerateAudits", "put_GenerateAudits", "get_Writable", "GetProperty", "SetProperty", "AddPropertyItem", "DeletePropertyItem", "get_PolicyAdministrators", "get_PolicyReaders", "AddPolicyAdministrator", "DeletePolicyAdministrator", "AddPolicyReader", "DeletePolicyReader", "Initialize", "UpdateCache", "Delete", "get_Applications", "OpenApplication", "CreateApplication", "DeleteApplication", "get_ApplicationGroups", "CreateApplicationGroup", "OpenApplicationGroup", "DeleteApplicationGroup", "Submit", "get_DelegatedPolicyUsers", "AddDelegatedPolicyUser", "DeleteDelegatedPolicyUser", "get_TargetMachine", "get_ApplyStoreSacl", "put_ApplyStoreSacl", "get_PolicyAdministratorsName", "get_PolicyReadersName", "AddPolicyAdministratorName", "DeletePolicyAdministratorName", "AddPolicyReaderName", "DeletePolicyReaderName", "get_DelegatedPolicyUsersName", "AddDelegatedPolicyUserName", "DeleteDelegatedPolicyUserName", "CloseApplication"]

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
     * @type {Integer} 
     */
    DomainTimeout {
        get => this.get_DomainTimeout()
        set => this.put_DomainTimeout(value)
    }

    /**
     * @type {Integer} 
     */
    ScriptEngineTimeout {
        get => this.get_ScriptEngineTimeout()
        set => this.put_ScriptEngineTimeout(value)
    }

    /**
     * @type {Integer} 
     */
    MaxScriptEngines {
        get => this.get_MaxScriptEngines()
        set => this.put_MaxScriptEngines(value)
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
     * @type {IAzApplications} 
     */
    Applications {
        get => this.get_Applications()
    }

    /**
     * @type {IAzApplicationGroups} 
     */
    ApplicationGroups {
        get => this.get_ApplicationGroups()
    }

    /**
     * @type {VARIANT} 
     */
    DelegatedPolicyUsers {
        get => this.get_DelegatedPolicyUsers()
    }

    /**
     * @type {BSTR} 
     */
    TargetMachine {
        get => this.get_TargetMachine()
    }

    /**
     * @type {BOOL} 
     */
    ApplyStoreSacl {
        get => this.get_ApplyStoreSacl()
        set => this.put_ApplyStoreSacl(value)
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
     * Sets or retrieves a comment that describes the operation.
     * @remarks
     * 
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(7, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * Sets or retrieves a comment that describes the operation.
     * @remarks
     * 
     * The maximum length of the <b>Description</b> property is 1,024 characters.
     * 
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(8, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves an opaque field that can be used by the application to store information.
     * @remarks
     * 
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_applicationdata
     */
    get_ApplicationData() {
        pbstrApplicationData := BSTR()
        result := ComCall(9, this, "ptr", pbstrApplicationData, "HRESULT")
        return pbstrApplicationData
    }

    /**
     * Sets or retrieves an opaque field that can be used by the application to store information.
     * @remarks
     * 
     * <div class="alert"><b>Important</b>  Policy administrators can read from and write to this property. Applications should not store data in the <b>ApplicationData</b> property that should not be available to the policy administrator.</div>
     * <div> </div>
     * 
     * 
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-put_applicationdata
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(10, this, "ptr", bstrApplicationData, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the time in milliseconds after which a domain is determined to be unreachable.
     * @remarks
     * 
     * After  the specified time-out interval, LDAP query group membership will attempt to contact a domain controller again.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_domaintimeout
     */
    get_DomainTimeout() {
        result := ComCall(11, this, "int*", &plProp := 0, "HRESULT")
        return plProp
    }

    /**
     * Sets or retrieves the time in milliseconds after which a domain is determined to be unreachable.
     * @remarks
     * 
     * After  the specified time-out interval, LDAP query group membership will attempt to contact a domain controller again.
     * 
     * 
     * @param {Integer} lProp 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-put_domaintimeout
     */
    put_DomainTimeout(lProp) {
        result := ComCall(12, this, "int", lProp, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the time in milliseconds that the IAzClientContext::AccessCheck method will wait for a Business Rule (BizRule) to complete execution before canceling it.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_scriptenginetimeout
     */
    get_ScriptEngineTimeout() {
        result := ComCall(13, this, "int*", &plProp := 0, "HRESULT")
        return plProp
    }

    /**
     * Sets or retrieves the time in milliseconds that the IAzClientContext::AccessCheck method will wait for a Business Rule (BizRule) to complete execution before canceling it.
     * @param {Integer} lProp 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-put_scriptenginetimeout
     */
    put_ScriptEngineTimeout(lProp) {
        result := ComCall(14, this, "int", lProp, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves the maximum number of Business Rule (BizRule) script engines that will be cached.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_maxscriptengines
     */
    get_MaxScriptEngines() {
        result := ComCall(15, this, "int*", &plProp := 0, "HRESULT")
        return plProp
    }

    /**
     * Sets or retrieves the maximum number of Business Rule (BizRule) script engines that will be cached.
     * @param {Integer} lProp 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-put_maxscriptengines
     */
    put_MaxScriptEngines(lProp) {
        result := ComCall(16, this, "int", lProp, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a value that indicates whether run-time audits should be generated.
     * @remarks
     * 
     * The <b>GenerateAudits</b> property controls application initialization, client context creation, client context deletion,  and access check run-time auditing. The client context can be created by <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID), name, or token.
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_generateaudits
     */
    get_GenerateAudits() {
        result := ComCall(17, this, "int*", &pbProp := 0, "HRESULT")
        return pbProp
    }

    /**
     * Sets or retrieves a value that indicates whether run-time audits should be generated.
     * @remarks
     * 
     * The <b>GenerateAudits</b> property controls application initialization, client context creation, client context deletion,  and access check run-time auditing. The client context can be created by <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID), name, or token.
     * 
     * @param {BOOL} bProp 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-put_generateaudits
     */
    put_GenerateAudits(bProp) {
        result := ComCall(18, this, "int", bProp, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the object can be modified by the user context that called the Initialize method.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_writable
     */
    get_Writable() {
        result := ComCall(19, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * Returns the AzAuthorizationStore object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object property  to return. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_description">Description</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_applicationdata">ApplicationData</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_DOMAIN_TIMEOUT"></a><a id="az_prop_azstore_domain_timeout"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_DOMAIN_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_domaintimeout">DomainTimeout</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT"></a><a id="az_prop_azstore_script_engine_timeout"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_scriptenginetimeout">ScriptEngineTimeout</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES"></a><a id="az_prop_azstore_max_script_engines"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_maxscriptengines">MaxScriptEngines</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_TARGET_MACHINE"></a><a id="az_prop_azstore_target_machine"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_TARGET_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_targetmachine">TargetMachine</a> property
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
     * <td width="40%"><a id="AZ_PROP_GENERATE_AUDITS"></a><a id="az_prop_generate_audits"></a><dl>
     * <dt><b>AZ_PROP_GENERATE_AUDITS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_generateaudits">GenerateAudits</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLY_STORE_SACL"></a><a id="az_prop_apply_store_sacl"></a><dl>
     * <dt><b>AZ_PROP_APPLY_STORE_SACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_applystoresacl">ApplyStoreSacl</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_WRITABLE"></a><a id="az_prop_writable"></a><dl>
     * <dt><b>AZ_PROP_WRITABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_writable">Writable</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {VARIANT} A pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object property.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(20, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * Sets the specified value to the AzAuthorizationStore object property with the specified property ID.
     * @param {Integer} lPropId Property ID of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object property  to set. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_DOMAIN_TIMEOUT"></a><a id="az_prop_azstore_domain_timeout"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_DOMAIN_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_domaintimeout">DomainTimeout</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES"></a><a id="az_prop_azstore_max_script_engines"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_maxscriptengines">MaxScriptEngines</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT"></a><a id="az_prop_azstore_script_engine_timeout"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_scriptenginetimeout">ScriptEngineTimeout</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_applicationdata">ApplicationData</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLY_STORE_SACL"></a><a id="az_prop_apply_store_sacl"></a><dl>
     * <dt><b>AZ_PROP_APPLY_STORE_SACL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_applystoresacl">ApplyStoreSacl</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DESCRIPTION"></a><a id="az_prop_description"></a><dl>
     * <dt><b>AZ_PROP_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_description">Description</a> property
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_GENERATE_AUDITS"></a><a id="az_prop_generate_audits"></a><dl>
     * <dt><b>AZ_PROP_GENERATE_AUDITS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Also accessed through the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_generateaudits">GenerateAudits</a> property
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp Value to set to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object property  specified by the <i>lPropId</i> parameter. The following table shows the type of data that must be used depending on the value of the <i>lPropId</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>lPropId</i> value</th>
     * <th>Data type</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_DOMAIN_TIMEOUT"></a><a id="az_prop_azstore_domain_timeout"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_DOMAIN_TIMEOUT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>LONG</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES"></a><a id="az_prop_azstore_max_script_engines"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_MAX_SCRIPT_ENGINES</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>LONG</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT"></a><a id="az_prop_azstore_script_engine_timeout"></a><dl>
     * <dt><b>AZ_PROP_AZSTORE_SCRIPT_ENGINE_TIMEOUT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>LONG</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_APPLICATION_DATA"></a><a id="az_prop_application_data"></a><dl>
     * <dt><b>AZ_PROP_APPLICATION_DATA</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>BSTR</b>
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
     * <b>BOOL</b>
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
     * <b>BSTR</b>
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
     * <b>BOOL</b>
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(21, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified principal to the specified list of principals.
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp Principal to add to the list of principals specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * 
     * If AZ_PROP_POLICY_ADMINS_NAME, AZ_PROP_POLICY_READERS_NAME, or AZ_PROP_DELEGATED_POLICY_USERS_NAME is specified for the <i>lPropId</i> parameter, the string is the account name of the account to add to the list. The account name must be in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) format (for example, "someone@example.com").
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(22, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
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
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-deletepolicyadministrator">DeletePolicyAdministrator</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_ADMINS_NAME"></a><a id="az_prop_policy_admins_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_ADMINS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-deletepolicyadministratorname">DeletePolicyAdministratorName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS"></a><a id="az_prop_policy_readers"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-deletepolicyreader">DeletePolicyReader</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_POLICY_READERS_NAME"></a><a id="az_prop_policy_readers_name"></a><dl>
     * <dt><b>AZ_PROP_POLICY_READERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-deletepolicyreadername">DeletePolicyReaderName</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DELEGATED_POLICY_USERS"></a><a id="az_prop_delegated_policy_users"></a><dl>
     * <dt><b>AZ_PROP_DELEGATED_POLICY_USERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-deletedelegatedpolicyuser">DeleteDelegatedPolicyUser</a> method
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_PROP_DELEGATED_POLICY_USERS_NAME"></a><a id="az_prop_delegated_policy_users_name"></a><dl>
     * <dt><b>AZ_PROP_DELEGATED_POLICY_USERS_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Can also be removed using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-deletedelegatedpolicyusername">DeleteDelegatedPolicyUserName</a> method
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} varProp The principal to remove from the list of principals specified by the <i>lPropId</i> parameter.
     * 
     * The variant must be a <b>BSTR</b> variant.
     * 
     * If AZ_PROP_POLICY_ADMINS_NAME, AZ_PROP_POLICY_READERS_NAME, or AZ_PROP_DELEGATED_POLICY_USERS_NAME is specified for the <i>lPropId</i> parameter, the string is the account name of the account to remove from the list. The account name must be in user principal name (UPN) format (for example, "someone@example.com").
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(23, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the security identifiers (SIDs) of principals that act as policy administrators in text form.
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
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_policyadministrators
     */
    get_PolicyAdministrators() {
        pvarAdmins := VARIANT()
        result := ComCall(24, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * Retrieves the security identifiers (SIDs) of principals that act as policy readers in text form.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_policyreaders
     */
    get_PolicyReaders() {
        pvarReaders := VARIANT()
        result := ComCall(25, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of principals that act as policy administrators.
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
     * To view the list of policy administrators, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_policyadministrators">PolicyAdministrators</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrAdmin Text form of the SID to add to the list of policy administrators.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-addpolicyadministrator
     */
    AddPolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(26, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified security identifier (SID) in text form from the list of principals that act as policy administrators.
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
     * To view the list of policy administrators, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_policyadministrators">PolicyAdministrators</a> property.
     * 
     * @param {BSTR} bstrAdmin Text form of the SID to remove from the list of policy administrators.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-deletepolicyadministrator
     */
    DeletePolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(27, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of principals that act as policy readers.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_policyreaders">PolicyReaders</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrReader Text form of the  SID to add to the list of policy readers.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-addpolicyreader
     */
    AddPolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(28, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified security identifier (SID) in text form from the list of principals that act as policy readers.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * To view the list of policy readers, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_policyreaders">PolicyReaders</a> property.
     * 
     * @param {BSTR} bstrReader Text form of the SID to remove from the list of policy readers.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-deletepolicyreader
     */
    DeletePolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(29, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Initializes the authorization manager.
     * @param {Integer} lFlags 
     * @param {BSTR} bstrPolicyURL Location of the persistent copy of the authorization policy database.
     * 
     * This string must contain both the policy URL prefix and the provider-specific policy location. Authorization Manager uses the provider prefix to load the appropriate provider. The store is loaded from the provider-specific policy location. No spaces are allowed in the policy URL prefix.
     * 
     * The policy URL prefix for an Active Directory store is <b>msldap:</b>. The general format for the URL  is as follows:
     * 
     * <b>msldap://</b><i>ServerName</i><b>:</b><i>Port</i><b>//</b><i>DistinguishedNameForTheStore</i>
     * 
     * The server name and the port are optional. If a server name is not provided, the default domain controller is used. If a port is not specified, the default LDAP port (LDAP_PORT, 389) is used. The distinguished name (DN) for the store begins with the relative distinguished name (RDN) of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object. For example, if the RDN of the <b>AzAuthorizationStore</b> object is MyStore and MyStore is in an organizational unit (OU) named AzMan, a possible URL for the Active Directory store is as follows:
     * 
     * msldap://<i>MyServer</i>/CN=MyStore,OU=AzMan,DC=<i>MyDomain</i>,DC=Fabrikam,DC=Com
     * 
     * The policy URL prefix for an XML store is <b>msxml:</b>.  The general format for an XML store URL is the same as for a file URL, as shown in the following examples:  
     * 
     * 
     * <ul>
     * <li>msxml://c:/abc/test.xml</li>
     * <li>msxml://\\server\share\abc.xml</li>
     * <li>msxml://d|/dir1/dir2/abc.xml</li>
     * <li>msxml://c:/Documents%20and%20Settings/test%2exml</li>
     * </ul>
     * Note that in the fourth example, the URL uses encoding for the space (%20) and the period (%2e) characters. Also, the traditional relative path notation is not supported in URLs. If you specify msxml://abc.xml, the URL points to the file at the root of your drive.
     * 
     * <div class="alert"><b>Note</b>  If an XML or SQL store is used over a network, the traffic is not automatically encrypted. IPsec can be used to encrypt the authorization information in transit. For an SQL store, it is also possible to set up the open database connectivity (ODBC) connection to use encryption. For information about how to set up the ODBC connection, see <a href="https://msdn.microsoft.com/library/aa198230.aspx">How to enable encryption after SQL Server has been installed (Network Utility)</a>.</div>
     * <div> </div>
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the <i>bstrPolicyURL</i> parameter is not valid, the method returns HRESULT_FROM_WIN32(ERROR_INVALID_NAME).
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-initialize
     */
    Initialize(lFlags, bstrPolicyURL, varReserved) {
        bstrPolicyURL := bstrPolicyURL is String ? BSTR.Alloc(bstrPolicyURL).Value : bstrPolicyURL

        result := ComCall(30, this, "int", lFlags, "ptr", bstrPolicyURL, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Updates the cache of objects and object attributes to match the underlying policy store.
     * @remarks
     * 
     * When the <b>UpdateCache</b> method is called, all changes to the persistent store after the last call to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-initialize">Initialize</a> method or to the <b>UpdateCache</b> method are incorporated into the cache. Any changes to the cache that have not been submitted using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-submit">Submit</a> method override the changes to the  store.
     * 
     * Most stores  should be  stable and have  few changes.  Providers are expected to implement this method to efficiently  determine whether   changes have been written  to the physical store since the last update.
     * 
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-updatecache
     */
    UpdateCache(varReserved) {
        result := ComCall(31, this, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Deletes the policy store currently in use by the AzAuthorizationStore object.
     * @remarks
     * 
     * When the <b>Delete</b> method is called, the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object returns to an uninitialized state. The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-initialize">Initialize</a> method can then be called to reinitialize the object. 
     * 
     * <div class="alert"><b>Important</b>  All objects opened by clients on the policy store  (for example,  <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> objects created using <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-createapplication">CreateApplication</a>) must be released before you call the <b>Delete</b> method. If the <b>Delete</b> method is called on an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object whose current policy store contains child objects, HRESULT_FROM_WIN32(ERROR_SERVER_HAS_OPEN_HANDLES) is returned.</div>
     * <div> </div>
     * 
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-delete
     */
    Delete(varReserved) {
        result := ComCall(32, this, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves an IAzApplications object that is used to enumerate IAzApplication objects from the policy store.
     * @remarks
     * 
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object.
     * 
     * @returns {IAzApplications} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_applications
     */
    get_Applications() {
        result := ComCall(33, this, "ptr*", &ppAppCollection := 0, "HRESULT")
        return IAzApplications(ppAppCollection)
    }

    /**
     * Opens the IAzApplication object with the specified name.
     * @param {BSTR} bstrApplicationName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplication} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-openapplication
     */
    OpenApplication(bstrApplicationName, varReserved) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(34, this, "ptr", bstrApplicationName, "ptr", varReserved, "ptr*", &ppApplication := 0, "HRESULT")
        return IAzApplication(ppApplication)
    }

    /**
     * Creates an IAzApplication object with the specified name.
     * @param {BSTR} bstrApplicationName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplication} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-createapplication
     */
    CreateApplication(bstrApplicationName, varReserved) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(35, this, "ptr", bstrApplicationName, "ptr", varReserved, "ptr*", &ppApplication := 0, "HRESULT")
        return IAzApplication(ppApplication)
    }

    /**
     * Removes the IAzApplication object with the specified name from the AzAuthorizationStore object.
     * @remarks
     * 
     * If the deleted <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object has child objects, those objects are deleted, as well. If there are any <b>IAzApplication</b> references to an <b>IAzApplication</b> object that has been deleted from the cache, the <b>IAzApplication</b> object can no longer be used. In C++, you must release references to deleted <b>IAzApplication</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In  Visual Basic, references to deleted objects are automatically released.
     * 
     * @param {BSTR} bstrApplicationName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-deleteapplication
     */
    DeleteApplication(bstrApplicationName, varReserved) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(36, this, "ptr", bstrApplicationName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves an IAzApplicationGroups object that is used to enumerate IAzApplicationGroup objects from the policy data.
     * @remarks
     * 
     * This property can be used only to enumerate <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> objects that are direct child objects of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object.
     * 
     * @returns {IAzApplicationGroups} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_applicationgroups
     */
    get_ApplicationGroups() {
        result := ComCall(37, this, "ptr*", &ppGroupCollection := 0, "HRESULT")
        return IAzApplicationGroups(ppGroupCollection)
    }

    /**
     * Creates an IAzApplicationGroup object with the specified name.
     * @param {BSTR} bstrGroupName Name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplicationGroup} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-createapplicationgroup
     */
    CreateApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(38, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * Opens an IAzApplicationGroup object by specifying its name.
     * @param {BSTR} bstrGroupName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplicationGroup} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-openapplicationgroup
     */
    OpenApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(39, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * Removes the IAzApplicationGroup object with the specified name from the AzAuthorizationStore object.
     * @remarks
     * 
     * If there are any <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> references to an <b>IAzApplicationGroup</b> object that has been deleted from the cache, the <b>IAzApplicationGroup</b> object can no longer be used. In C++, you must release references to deleted <b>IAzApplicationGroup</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In  Visual Basic, references to deleted objects are automatically released.
     * 
     * @param {BSTR} bstrGroupName Name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplicationgroup">IAzApplicationGroup</a> object to delete.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-deleteapplicationgroup
     */
    DeleteApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(40, this, "ptr", bstrGroupName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Persists changes made to the AzAuthorizationStore object.
     * @remarks
     * 
     * Any additions or modifications to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object are not persisted until the <b>Submit</b> method is called. The <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-delete">Delete</a>  method automatically submits changes.
     * 
     * The <b>Submit</b> method does not extend to child objects; child objects  must be individually persisted to the policy store. A created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore">AzAuthorizationStore</a> object must be submitted before it can be referenced or become a parent object. The destructor for an object silently discards unsubmitted changes.
     * 
     * @param {Integer} lFlags Flags that modify the behavior of the <b>Submit</b> method. The default value is zero. If the AZ_SUBMIT_FLAG_ABORT flag is specified, the changes to the object are discarded and the object is updated to match the underlying policy store.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(41, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the security identifiers (SIDs) of principals that act as delegated policy users in text form.
     * @remarks
     * 
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object uses to administer the delegated object.
     * 
     * <div class="alert"><b>Note</b>  Delegated policy users are not supported for XML stores.</div>
     * <div> </div>
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_delegatedpolicyusers
     */
    get_DelegatedPolicyUsers() {
        pvarDelegatedPolicyUsers := VARIANT()
        result := ComCall(42, this, "ptr", pvarDelegatedPolicyUsers, "HRESULT")
        return pvarDelegatedPolicyUsers
    }

    /**
     * Adds the specified security identifier (SID) in text form to the list of principals that act as delegated policy users.
     * @remarks
     * 
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object uses to administer the delegated object.
     * 
     * <div class="alert"><b>Note</b>  Delegated policy users are not supported for XML stores.</div>
     * <div> </div>
     * To view the list of delegated policy users, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_delegatedpolicyusers">DelegatedPolicyUsers</a> property.
     * 
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-submit">Submit</a> method to persist any changes made by this method.
     * 
     * @param {BSTR} bstrDelegatedPolicyUser Text form of the SID to add to the list of delegated policy users.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-adddelegatedpolicyuser
     */
    AddDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(43, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified security identifier (SID) in text form from the list of principals that act as delegated policy users.
     * @remarks
     * 
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object uses to administer the delegated object. 
     * 
     * <div class="alert"><b>Note</b>  Delegated policy users are not supported for XML stores.</div>
     * <div> </div>
     * To view the list of delegated policy users, use the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazauthorizationstore-get_delegatedpolicyusers">DelegatedPolicyUsers</a> property.
     * 
     * @param {BSTR} bstrDelegatedPolicyUser Text form of the SID to remove from the list of delegated policy users.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-deletedelegatedpolicyuser
     */
    DeleteDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(44, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the computer on which account resolution should occur.
     * @remarks
     * 
     * Determination of the target computer takes into consideration active directories in local and remote domains, Distributed File System (DFS) shares, mount point, local drive, remote mapped shares, and so on.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_targetmachine
     */
    get_TargetMachine() {
        pbstrTargetMachine := BSTR()
        result := ComCall(45, this, "ptr", pbstrTargetMachine, "HRESULT")
        return pbstrTargetMachine
    }

    /**
     * Sets or retrieves a value that indicates whether policy audits should be generated when the authorization store is modified.
     * @remarks
     * 
     * Policy audits are generated when the underlying policy store is modified. Both success and failure audits are requested.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_applystoresacl
     */
    get_ApplyStoreSacl() {
        result := ComCall(46, this, "int*", &pbApplyStoreSacl := 0, "HRESULT")
        return pbApplyStoreSacl
    }

    /**
     * Sets or retrieves a value that indicates whether policy audits should be generated when the authorization store is modified.
     * @remarks
     * 
     * Policy audits are generated when the underlying policy store is modified. Both success and failure audits are requested.
     * 
     * 
     * @param {BOOL} bApplyStoreSacl 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-put_applystoresacl
     */
    put_ApplyStoreSacl(bApplyStoreSacl) {
        result := ComCall(47, this, "int", bApplyStoreSacl, "HRESULT")
        return result
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
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_policyadministratorsname
     */
    get_PolicyAdministratorsName() {
        pvarAdmins := VARIANT()
        result := ComCall(48, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * Retrieves the account names of principals that act as policy readers.
     * @remarks
     * 
     * Policy readers for an object can read attributes for the object and for child objects of the object. Readers can also  use the policy; for example, readers can call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazclientcontext-accesscheck">AccessCheck</a> method. Readers cannot modify the object or its child objects.
     * 
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_policyreadersname
     */
    get_PolicyReadersName() {
        pvarReaders := VARIANT()
        result := ComCall(49, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * Adds the specified account name to the list of principals that act as policy administrators.
     * @param {BSTR} bstrAdmin Account name  to add to the list of policy administrators. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-addpolicyadministratorname
     */
    AddPolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(50, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of principals that act as policy administrators.
     * @param {BSTR} bstrAdmin The account name to remove from the list of policy administrators. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-deletepolicyadministratorname
     */
    DeletePolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(51, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Adds the specified account name to the list of principals that act as policy readers.
     * @param {BSTR} bstrReader Account name to add to the list of policy readers. The account name must be in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-addpolicyreadername
     */
    AddPolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(52, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of principals that act as policy readers.
     * @param {BSTR} bstrReader The account name to remove from the list of policy readers. The account name must be in user principal name (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * Any other <b>HRESULT</b> value indicates that the operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-deletepolicyreadername
     */
    DeletePolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(53, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the account names of principals that act as delegated policy users.
     * @remarks
     * 
     * Delegated policy users are principals that are allowed to read the subset of the policy data that the policy administrator of an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope">IAzScope</a> object uses to administer the delegated object.
     * 
     * <div class="alert"><b>Note</b>  Delegated policy users are not supported for XML stores.</div>
     * <div> </div>
     * In  JScript, the returned <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> must be converted to the JScript <a href="https://docs.microsoft.com/scripting/javascript/reference/array-object-javascript">Array</a> object.
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-get_delegatedpolicyusersname
     */
    get_DelegatedPolicyUsersName() {
        pvarDelegatedPolicyUsers := VARIANT()
        result := ComCall(54, this, "ptr", pvarDelegatedPolicyUsers, "HRESULT")
        return pvarDelegatedPolicyUsers
    }

    /**
     * Adds the specified account name to the list of principals that act as delegated policy users.
     * @param {BSTR} bstrDelegatedPolicyUser Account name to add to the list of delegated policy users. The account name must be in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * An attempt to call this method on an XML store will return E_INVALIDARG.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-adddelegatedpolicyusername
     */
    AddDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(55, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Removes the specified account name from the list of principals that act as delegated policy users.
     * @param {BSTR} bstrDelegatedPolicyUser Account name to remove from the list of delegated policy users. The account name must be in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) format (for example, "someone@example.com"). The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> function is called to retrieve the domain.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * An attempt to call this method on an XML store will return E_INVALIDARG.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-deletedelegatedpolicyusername
     */
    DeleteDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(56, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * Unloads a specified IAzApplication object from the cache.
     * @param {BSTR} bstrApplicationName The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object to close.
     * @param {Integer} lFlag Flags that control the behavior of the operation. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Child objects of the specified <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object will be unloaded from the cache only when the user closes the last handle to the <b>IAzApplication</b> object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AZ_AZSTORE_FORCE_APPLICATION_CLOSE"></a><a id="az_azstore_force_application_close"></a><dl>
     * <dt><b>AZ_AZSTORE_FORCE_APPLICATION_CLOSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All child objects of the specified <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication">IAzApplication</a> object will be forcefully closed. Attempts to reference an open handle to a child object of the specified <b>IAzApplication</b> object will result in an HRESULT_FROM_WIN32(ERROR_INVALID_HANDLE) error. This flag should be used only if the user has implemented code to gracefully handle the  error.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazauthorizationstore-closeapplication
     */
    CloseApplication(bstrApplicationName, lFlag) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(57, this, "ptr", bstrApplicationName, "int", lFlag, "HRESULT")
        return result
    }
}
