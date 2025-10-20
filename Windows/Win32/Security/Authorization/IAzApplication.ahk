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
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    get_Description(pbstrDescription) {
        result := ComCall(9, this, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(10, this, "ptr", bstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrApplicationData 
     * @returns {HRESULT} 
     */
    get_ApplicationData(pbstrApplicationData) {
        result := ComCall(11, this, "ptr", pbstrApplicationData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrApplicationData 
     * @returns {HRESULT} 
     */
    put_ApplicationData(bstrApplicationData) {
        bstrApplicationData := bstrApplicationData is String ? BSTR.Alloc(bstrApplicationData).Value : bstrApplicationData

        result := ComCall(12, this, "ptr", bstrApplicationData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     */
    get_AuthzInterfaceClsid(pbstrProp) {
        result := ComCall(13, this, "ptr", pbstrProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     */
    put_AuthzInterfaceClsid(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(14, this, "ptr", bstrProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrProp 
     * @returns {HRESULT} 
     */
    get_Version(pbstrProp) {
        result := ComCall(15, this, "ptr", pbstrProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     */
    put_Version(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(16, this, "ptr", bstrProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbProp 
     * @returns {HRESULT} 
     */
    get_GenerateAudits(pbProp) {
        result := ComCall(17, this, "ptr", pbProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bProp 
     * @returns {HRESULT} 
     */
    put_GenerateAudits(bProp) {
        result := ComCall(18, this, "int", bProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbProp 
     * @returns {HRESULT} 
     */
    get_ApplyStoreSacl(pbProp) {
        result := ComCall(19, this, "ptr", pbProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bProp 
     * @returns {HRESULT} 
     */
    put_ApplyStoreSacl(bProp) {
        result := ComCall(20, this, "int", bProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfProp 
     * @returns {HRESULT} 
     */
    get_Writable(pfProp) {
        result := ComCall(21, this, "ptr", pfProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varReserved 
     * @param {Pointer<VARIANT>} pvarProp 
     * @returns {HRESULT} 
     */
    GetProperty(lPropId, varReserved, pvarProp) {
        result := ComCall(22, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    SetProperty(lPropId, varProp, varReserved) {
        result := ComCall(23, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarAdmins 
     * @returns {HRESULT} 
     */
    get_PolicyAdministrators(pvarAdmins) {
        result := ComCall(24, this, "ptr", pvarAdmins, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarReaders 
     * @returns {HRESULT} 
     */
    get_PolicyReaders(pvarReaders) {
        result := ComCall(25, this, "ptr", pvarReaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(26, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePolicyAdministrator(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(27, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(28, this, "ptr", bstrReader, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePolicyReader(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(29, this, "ptr", bstrReader, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzScopes>} ppScopeCollection 
     * @returns {HRESULT} 
     */
    get_Scopes(ppScopeCollection) {
        result := ComCall(30, this, "ptr", ppScopeCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzScope>} ppScope 
     * @returns {HRESULT} 
     */
    OpenScope(bstrScopeName, varReserved, ppScope) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(31, this, "ptr", bstrScopeName, "ptr", varReserved, "ptr", ppScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzScope>} ppScope 
     * @returns {HRESULT} 
     */
    CreateScope(bstrScopeName, varReserved, ppScope) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(32, this, "ptr", bstrScopeName, "ptr", varReserved, "ptr", ppScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteScope(bstrScopeName, varReserved) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(33, this, "ptr", bstrScopeName, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzOperations>} ppOperationCollection 
     * @returns {HRESULT} 
     */
    get_Operations(ppOperationCollection) {
        result := ComCall(34, this, "ptr", ppOperationCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOperationName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzOperation>} ppOperation 
     * @returns {HRESULT} 
     */
    OpenOperation(bstrOperationName, varReserved, ppOperation) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(35, this, "ptr", bstrOperationName, "ptr", varReserved, "ptr", ppOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOperationName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzOperation>} ppOperation 
     * @returns {HRESULT} 
     */
    CreateOperation(bstrOperationName, varReserved, ppOperation) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(36, this, "ptr", bstrOperationName, "ptr", varReserved, "ptr", ppOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOperationName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteOperation(bstrOperationName, varReserved) {
        bstrOperationName := bstrOperationName is String ? BSTR.Alloc(bstrOperationName).Value : bstrOperationName

        result := ComCall(37, this, "ptr", bstrOperationName, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzTasks>} ppTaskCollection 
     * @returns {HRESULT} 
     */
    get_Tasks(ppTaskCollection) {
        result := ComCall(38, this, "ptr", ppTaskCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzTask>} ppTask 
     * @returns {HRESULT} 
     */
    OpenTask(bstrTaskName, varReserved, ppTask) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(39, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr", ppTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzTask>} ppTask 
     * @returns {HRESULT} 
     */
    CreateTask(bstrTaskName, varReserved, ppTask) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(40, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr", ppTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTaskName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteTask(bstrTaskName, varReserved) {
        bstrTaskName := bstrTaskName is String ? BSTR.Alloc(bstrTaskName).Value : bstrTaskName

        result := ComCall(41, this, "ptr", bstrTaskName, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzApplicationGroups>} ppGroupCollection 
     * @returns {HRESULT} 
     */
    get_ApplicationGroups(ppGroupCollection) {
        result := ComCall(42, this, "ptr", ppGroupCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplicationGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    OpenApplicationGroup(bstrGroupName, varReserved, ppGroup) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(43, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzApplicationGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    CreateApplicationGroup(bstrGroupName, varReserved, ppGroup) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(44, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteApplicationGroup(bstrGroupName, varReserved) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(45, this, "ptr", bstrGroupName, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzRoles>} ppRoleCollection 
     * @returns {HRESULT} 
     */
    get_Roles(ppRoleCollection) {
        result := ComCall(46, this, "ptr", ppRoleCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzRole>} ppRole 
     * @returns {HRESULT} 
     */
    OpenRole(bstrRoleName, varReserved, ppRole) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(47, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr", ppRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzRole>} ppRole 
     * @returns {HRESULT} 
     */
    CreateRole(bstrRoleName, varReserved, ppRole) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(48, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr", ppRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteRole(bstrRoleName, varReserved) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(49, this, "ptr", bstrRoleName, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullTokenHandle 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzClientContext>} ppClientContext 
     * @returns {HRESULT} 
     */
    InitializeClientContextFromToken(ullTokenHandle, varReserved, ppClientContext) {
        result := ComCall(50, this, "uint", ullTokenHandle, "ptr", varReserved, "ptr", ppClientContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(51, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPropId 
     * @param {VARIANT} varProp 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePropertyItem(lPropId, varProp, varReserved) {
        result := ComCall(52, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    Submit(lFlags, varReserved) {
        result := ComCall(53, this, "int", lFlags, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} ClientName 
     * @param {BSTR} DomainName 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzClientContext>} ppClientContext 
     * @returns {HRESULT} 
     */
    InitializeClientContextFromName(ClientName, DomainName, varReserved, ppClientContext) {
        ClientName := ClientName is String ? BSTR.Alloc(ClientName).Value : ClientName
        DomainName := DomainName is String ? BSTR.Alloc(DomainName).Value : DomainName

        result := ComCall(54, this, "ptr", ClientName, "ptr", DomainName, "ptr", varReserved, "ptr", ppClientContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarDelegatedPolicyUsers 
     * @returns {HRESULT} 
     */
    get_DelegatedPolicyUsers(pvarDelegatedPolicyUsers) {
        result := ComCall(55, this, "ptr", pvarDelegatedPolicyUsers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(56, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteDelegatedPolicyUser(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(57, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} SidString 
     * @param {Integer} lOptions 
     * @param {VARIANT} varReserved 
     * @param {Pointer<IAzClientContext>} ppClientContext 
     * @returns {HRESULT} 
     */
    InitializeClientContextFromStringSid(SidString, lOptions, varReserved, ppClientContext) {
        SidString := SidString is String ? BSTR.Alloc(SidString).Value : SidString

        result := ComCall(58, this, "ptr", SidString, "int", lOptions, "ptr", varReserved, "ptr", ppClientContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarAdmins 
     * @returns {HRESULT} 
     */
    get_PolicyAdministratorsName(pvarAdmins) {
        result := ComCall(59, this, "ptr", pvarAdmins, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarReaders 
     * @returns {HRESULT} 
     */
    get_PolicyReadersName(pvarReaders) {
        result := ComCall(60, this, "ptr", pvarReaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(61, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAdmin 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePolicyAdministratorName(bstrAdmin, varReserved) {
        bstrAdmin := bstrAdmin is String ? BSTR.Alloc(bstrAdmin).Value : bstrAdmin

        result := ComCall(62, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddPolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(63, this, "ptr", bstrReader, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReader 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeletePolicyReaderName(bstrReader, varReserved) {
        bstrReader := bstrReader is String ? BSTR.Alloc(bstrReader).Value : bstrReader

        result := ComCall(64, this, "ptr", bstrReader, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarDelegatedPolicyUsers 
     * @returns {HRESULT} 
     */
    get_DelegatedPolicyUsersName(pvarDelegatedPolicyUsers) {
        result := ComCall(65, this, "ptr", pvarDelegatedPolicyUsers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    AddDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(66, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDelegatedPolicyUser 
     * @param {VARIANT} varReserved 
     * @returns {HRESULT} 
     */
    DeleteDelegatedPolicyUserName(bstrDelegatedPolicyUser, varReserved) {
        bstrDelegatedPolicyUser := bstrDelegatedPolicyUser is String ? BSTR.Alloc(bstrDelegatedPolicyUser).Value : bstrDelegatedPolicyUser

        result := ComCall(67, this, "ptr", bstrDelegatedPolicyUser, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
