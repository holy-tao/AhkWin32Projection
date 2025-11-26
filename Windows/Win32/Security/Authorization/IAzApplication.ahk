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
 * 
 * The <b>IAzApplication</b> object is a container in which all authorization policies that apply to an instance of an application reside.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazapplication
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(9, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_applicationdata
     */
    get_ApplicationData() {
        pbstrApplicationData := BSTR()
        result := ComCall(11, this, "ptr", pbstrApplicationData, "HRESULT")
        return pbstrApplicationData
    }

    /**
     * 
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_authzinterfaceclsid
     */
    get_AuthzInterfaceClsid() {
        pbstrProp := BSTR()
        result := ComCall(13, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_version
     */
    get_Version() {
        pbstrProp := BSTR()
        result := ComCall(15, this, "ptr", pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * 
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
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_generateaudits
     */
    get_GenerateAudits() {
        result := ComCall(17, this, "int*", &pbProp := 0, "HRESULT")
        return pbProp
    }

    /**
     * 
     * @param {BOOL} bProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-put_generateaudits
     */
    put_GenerateAudits(bProp) {
        result := ComCall(18, this, "int", bProp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_applystoresacl
     */
    get_ApplyStoreSacl() {
        result := ComCall(19, this, "int*", &pbProp := 0, "HRESULT")
        return pbProp
    }

    /**
     * 
     * @param {BOOL} bProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-put_applystoresacl
     */
    put_ApplyStoreSacl(bProp) {
        result := ComCall(20, this, "int", bProp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_writable
     */
    get_Writable() {
        result := ComCall(21, this, "int*", &pfProp := 0, "HRESULT")
        return pfProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varReserved 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-getproperty
     */
    GetProperty(lPropId, varReserved) {
        pvarProp := VARIANT()
        result := ComCall(22, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return pvarProp
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-setproperty
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(23, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyadministrators
     */
    get_PolicyAdministrators() {
        pvarAdmins := VARIANT()
        result := ComCall(24, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyreaders
     */
    get_PolicyReaders() {
        pvarReaders := VARIANT()
        result := ComCall(25, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpolicyadministrator
     */
    AddPolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(26, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepolicyadministrator
     */
    DeletePolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(27, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpolicyreader
     */
    AddPolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(28, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepolicyreader
     */
    DeletePolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(29, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAzScopes} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_scopes
     */
    get_Scopes() {
        result := ComCall(30, this, "ptr*", &ppScopeCollection := 0, "HRESULT")
        return IAzScopes(ppScopeCollection)
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT} varReserved 
     * @returns {IAzScope} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openscope
     */
    OpenScope(bstrScopeName, varReserved) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(31, this, "ptr", bstrScopeName, "ptr", varReserved, "ptr*", &ppScope := 0, "HRESULT")
        return IAzScope(ppScope)
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT} varReserved 
     * @returns {IAzScope} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createscope
     */
    CreateScope(bstrScopeName, varReserved) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(32, this, "ptr", bstrScopeName, "ptr", varReserved, "ptr*", &ppScope := 0, "HRESULT")
        return IAzScope(ppScope)
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletescope
     */
    DeleteScope(bstrScopeName, varReserved) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(33, this, "ptr", bstrScopeName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAzOperations} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_operations
     */
    get_Operations() {
        result := ComCall(34, this, "ptr*", &ppOperationCollection := 0, "HRESULT")
        return IAzOperations(ppOperationCollection)
    }

    /**
     * 
     * @param {BSTR} bstrOperationName 
     * @param {VARIANT} varReserved 
     * @returns {IAzOperation} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openoperation
     */
    OpenOperation(bstrOperationName, varReserved) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(35, this, "ptr", bstrOperationName, "ptr", varReserved, "ptr*", &ppOperation := 0, "HRESULT")
        return IAzOperation(ppOperation)
    }

    /**
     * 
     * @param {BSTR} bstrOperationName 
     * @param {VARIANT} varReserved 
     * @returns {IAzOperation} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createoperation
     */
    CreateOperation(bstrOperationName, varReserved) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(36, this, "ptr", bstrOperationName, "ptr", varReserved, "ptr*", &ppOperation := 0, "HRESULT")
        return IAzOperation(ppOperation)
    }

    /**
     * 
     * @param {BSTR} bstrOperationName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deleteoperation
     */
    DeleteOperation(bstrOperationName, varReserved) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(37, this, "ptr", bstrOperationName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAzTasks} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_tasks
     */
    get_Tasks() {
        result := ComCall(38, this, "ptr*", &ppTaskCollection := 0, "HRESULT")
        return IAzTasks(ppTaskCollection)
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @returns {IAzTask} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-opentask
     */
    OpenTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(39, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", &ppTask := 0, "HRESULT")
        return IAzTask(ppTask)
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @returns {IAzTask} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createtask
     */
    CreateTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(40, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", &ppTask := 0, "HRESULT")
        return IAzTask(ppTask)
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletetask
     */
    DeleteTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(41, this, "ptr", bstrTaskName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAzApplicationGroups} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_applicationgroups
     */
    get_ApplicationGroups() {
        result := ComCall(42, this, "ptr*", &ppGroupCollection := 0, "HRESULT")
        return IAzApplicationGroups(ppGroupCollection)
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @returns {IAzApplicationGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openapplicationgroup
     */
    OpenApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(43, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @returns {IAzApplicationGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createapplicationgroup
     */
    CreateApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(44, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", &ppGroup := 0, "HRESULT")
        return IAzApplicationGroup(ppGroup)
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deleteapplicationgroup
     */
    DeleteApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(45, this, "ptr", bstrGroupName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAzRoles} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_roles
     */
    get_Roles() {
        result := ComCall(46, this, "ptr*", &ppRoleCollection := 0, "HRESULT")
        return IAzRoles(ppRoleCollection)
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @returns {IAzRole} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openrole
     */
    OpenRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(47, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", &ppRole := 0, "HRESULT")
        return IAzRole(ppRole)
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @returns {IAzRole} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createrole
     */
    CreateRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(48, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", &ppRole := 0, "HRESULT")
        return IAzRole(ppRole)
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deleterole
     */
    DeleteRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(49, this, "ptr", bstrRoleName, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullTokenHandle 
     * @param {VARIANT} varReserved 
     * @returns {IAzClientContext} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromtoken
     */
    InitializeClientContextFromToken(ullTokenHandle, varReserved) {
        result := ComCall(50, this, "uint", ullTokenHandle, "ptr", varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext(ppClientContext)
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpropertyitem
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(51, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepropertyitem
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(52, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-submit
     */
    Submit(lFlags, varReserved) {
        result := ComCall(53, this, "int", lFlags, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ClientName 
     * @param {BSTR} DomainName 
     * @param {VARIANT} varReserved 
     * @returns {IAzClientContext} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromname
     */
    InitializeClientContextFromName(ClientName, DomainName, varReserved) {
        ClientName := ClientName is String ? BSTR.Alloc(ClientName).Value : ClientName
        DomainName := DomainName is String ? BSTR.Alloc(DomainName).Value : DomainName

        result := ComCall(54, this, "ptr", ClientName, "ptr", DomainName, "ptr", varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext(ppClientContext)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusers
     */
    get_DelegatedPolicyUsers() {
        pvarDelegatedPolicyUsers := VARIANT()
        result := ComCall(55, this, "ptr", pvarDelegatedPolicyUsers, "HRESULT")
        return pvarDelegatedPolicyUsers
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-adddelegatedpolicyuser
     */
    AddDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(56, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletedelegatedpolicyuser
     */
    DeleteDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(57, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} SidString 
     * @param {Integer} lOptions 
     * @param {VARIANT} varReserved 
     * @returns {IAzClientContext} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromstringsid
     */
    InitializeClientContextFromStringSid(SidString, lOptions, varReserved) {
        SidString := SidString is String ? BSTR.Alloc(SidString).Value : SidString

        result := ComCall(58, this, "ptr", SidString, "int", lOptions, "ptr", varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext(ppClientContext)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyadministratorsname
     */
    get_PolicyAdministratorsName() {
        pvarAdmins := VARIANT()
        result := ComCall(59, this, "ptr", pvarAdmins, "HRESULT")
        return pvarAdmins
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyreadersname
     */
    get_PolicyReadersName() {
        pvarReaders := VARIANT()
        result := ComCall(60, this, "ptr", pvarReaders, "HRESULT")
        return pvarReaders
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpolicyadministratorname
     */
    AddPolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(61, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepolicyadministratorname
     */
    DeletePolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(62, this, "ptr", bstrAdmin, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-addpolicyreadername
     */
    AddPolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(63, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletepolicyreadername
     */
    DeletePolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(64, this, "ptr", bstrReader, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusersname
     */
    get_DelegatedPolicyUsersName() {
        pvarDelegatedPolicyUsers := VARIANT()
        result := ComCall(65, this, "ptr", pvarDelegatedPolicyUsers, "HRESULT")
        return pvarDelegatedPolicyUsers
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-adddelegatedpolicyusername
     */
    AddDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(66, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-deletedelegatedpolicyusername
     */
    DeleteDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(67, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "HRESULT")
        return result
    }
}
