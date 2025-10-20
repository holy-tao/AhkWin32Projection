#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_name
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_description
     */
    get_Description(pbstrDescription) {
        result := ComCall(9, this, "ptr", pbstrDescription, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrApplicationData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_applicationdata
     */
    get_ApplicationData(pbstrApplicationData) {
        result := ComCall(11, this, "ptr", pbstrApplicationData, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_authzinterfaceclsid
     */
    get_AuthzInterfaceClsid(pbstrProp) {
        result := ComCall(13, this, "ptr", pbstrProp, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_version
     */
    get_Version(pbstrProp) {
        result := ComCall(15, this, "ptr", pbstrProp, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_generateaudits
     */
    get_GenerateAudits(pbProp) {
        result := ComCall(17, this, "ptr", pbProp, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pbProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_applystoresacl
     */
    get_ApplyStoreSacl(pbProp) {
        result := ComCall(19, this, "ptr", pbProp, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pfProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_writable
     */
    get_Writable(pfProp) {
        result := ComCall(21, this, "ptr", pfProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varReserved 
     * @param {Pointer<VARIANT>} pvarProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-getproperty
     */
    GetProperty(lPropId, varReserved, pvarProp) {
        result := ComCall(22, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarAdmins 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyadministrators
     */
    get_PolicyAdministrators(pvarAdmins) {
        result := ComCall(24, this, "ptr", pvarAdmins, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarReaders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyreaders
     */
    get_PolicyReaders(pvarReaders) {
        result := ComCall(25, this, "ptr", pvarReaders, "HRESULT")
        return result
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
     * @param {Pointer<IAzScopes>} ppScopeCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_scopes
     */
    get_Scopes(ppScopeCollection) {
        result := ComCall(30, this, "ptr*", ppScopeCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzScope>} ppScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openscope
     */
    OpenScope(bstrScopeName, varReserved, ppScope) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(31, this, "ptr", bstrScopeName, "ptr", varReserved, "ptr*", ppScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzScope>} ppScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createscope
     */
    CreateScope(bstrScopeName, varReserved, ppScope) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(32, this, "ptr", bstrScopeName, "ptr", varReserved, "ptr*", ppScope, "HRESULT")
        return result
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
     * @param {Pointer<IAzOperations>} ppOperationCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_operations
     */
    get_Operations(ppOperationCollection) {
        result := ComCall(34, this, "ptr*", ppOperationCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrOperationName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzOperation>} ppOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openoperation
     */
    OpenOperation(bstrOperationName, varReserved, ppOperation) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(35, this, "ptr", bstrOperationName, "ptr", varReserved, "ptr*", ppOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrOperationName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzOperation>} ppOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createoperation
     */
    CreateOperation(bstrOperationName, varReserved, ppOperation) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(36, this, "ptr", bstrOperationName, "ptr", varReserved, "ptr*", ppOperation, "HRESULT")
        return result
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
     * @param {Pointer<IAzTasks>} ppTaskCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_tasks
     */
    get_Tasks(ppTaskCollection) {
        result := ComCall(38, this, "ptr*", ppTaskCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzTask>} ppTask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-opentask
     */
    OpenTask(bstrTaskName, varReserved, ppTask) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(39, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", ppTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzTask>} ppTask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createtask
     */
    CreateTask(bstrTaskName, varReserved, ppTask) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(40, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr*", ppTask, "HRESULT")
        return result
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
     * @param {Pointer<IAzApplicationGroups>} ppGroupCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_applicationgroups
     */
    get_ApplicationGroups(ppGroupCollection) {
        result := ComCall(42, this, "ptr*", ppGroupCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplicationGroup>} ppGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openapplicationgroup
     */
    OpenApplicationGroup(bstrGroupName, varReserved, ppGroup) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(43, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", ppGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplicationGroup>} ppGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createapplicationgroup
     */
    CreateApplicationGroup(bstrGroupName, varReserved, ppGroup) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(44, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr*", ppGroup, "HRESULT")
        return result
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
     * @param {Pointer<IAzRoles>} ppRoleCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_roles
     */
    get_Roles(ppRoleCollection) {
        result := ComCall(46, this, "ptr*", ppRoleCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzRole>} ppRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-openrole
     */
    OpenRole(bstrRoleName, varReserved, ppRole) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(47, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", ppRole, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzRole>} ppRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-createrole
     */
    CreateRole(bstrRoleName, varReserved, ppRole) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(48, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr*", ppRole, "HRESULT")
        return result
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
     * @param {Pointer<IAzClientContext>} ppClientContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromtoken
     */
    InitializeClientContextFromToken(ullTokenHandle, varReserved, ppClientContext) {
        result := ComCall(50, this, "uint", ullTokenHandle, "ptr", varReserved, "ptr*", ppClientContext, "HRESULT")
        return result
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
     * @param {Pointer<IAzClientContext>} ppClientContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromname
     */
    InitializeClientContextFromName(ClientName, DomainName, varReserved, ppClientContext) {
        ClientName := ClientName is String ? BSTR.Alloc(ClientName).Value : ClientName
        DomainName := DomainName is String ? BSTR.Alloc(DomainName).Value : DomainName

        result := ComCall(54, this, "ptr", ClientName, "ptr", DomainName, "ptr", varReserved, "ptr*", ppClientContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarDelegatedPolicyUsers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusers
     */
    get_DelegatedPolicyUsers(pvarDelegatedPolicyUsers) {
        result := ComCall(55, this, "ptr", pvarDelegatedPolicyUsers, "HRESULT")
        return result
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
     * @param {Pointer<IAzClientContext>} ppClientContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-initializeclientcontextfromstringsid
     */
    InitializeClientContextFromStringSid(SidString, lOptions, varReserved, ppClientContext) {
        SidString := SidString is String ? BSTR.Alloc(SidString).Value : SidString

        result := ComCall(58, this, "ptr", SidString, "int", lOptions, "ptr", varReserved, "ptr*", ppClientContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarAdmins 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyadministratorsname
     */
    get_PolicyAdministratorsName(pvarAdmins) {
        result := ComCall(59, this, "ptr", pvarAdmins, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarReaders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_policyreadersname
     */
    get_PolicyReadersName(pvarReaders) {
        result := ComCall(60, this, "ptr", pvarReaders, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarDelegatedPolicyUsers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication-get_delegatedpolicyusersname
     */
    get_DelegatedPolicyUsersName(pvarDelegatedPolicyUsers) {
        result := ComCall(65, this, "ptr", pvarDelegatedPolicyUsers, "HRESULT")
        return result
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
