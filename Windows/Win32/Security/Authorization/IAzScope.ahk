#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines a logical container of resources to which the application manages access.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazscope
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzScope extends IDispatch{
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
     * @param {Pointer<BOOL>} pfProp 
     * @returns {HRESULT} 
     */
    get_Writable(pfProp) {
        result := ComCall(13, this, "ptr", pfProp, "int")
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
        result := ComCall(14, this, "int", lPropId, "ptr", varReserved, "ptr", pvarProp, "int")
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
        result := ComCall(15, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
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
        result := ComCall(16, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
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
        result := ComCall(17, this, "int", lPropId, "ptr", varProp, "ptr", varReserved, "int")
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
        result := ComCall(18, this, "ptr", pvarAdmins, "int")
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
        result := ComCall(19, this, "ptr", pvarReaders, "int")
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

        result := ComCall(20, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
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

        result := ComCall(21, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
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

        result := ComCall(22, this, "ptr", bstrReader, "ptr", varReserved, "int")
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

        result := ComCall(23, this, "ptr", bstrReader, "ptr", varReserved, "int")
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
        result := ComCall(24, this, "ptr", ppGroupCollection, "int")
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

        result := ComCall(25, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr", ppGroup, "int")
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

        result := ComCall(26, this, "ptr", bstrGroupName, "ptr", varReserved, "ptr", ppGroup, "int")
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

        result := ComCall(27, this, "ptr", bstrGroupName, "ptr", varReserved, "int")
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
        result := ComCall(28, this, "ptr", ppRoleCollection, "int")
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

        result := ComCall(29, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr", ppRole, "int")
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

        result := ComCall(30, this, "ptr", bstrRoleName, "ptr", varReserved, "ptr", ppRole, "int")
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

        result := ComCall(31, this, "ptr", bstrRoleName, "ptr", varReserved, "int")
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
        result := ComCall(32, this, "ptr", ppTaskCollection, "int")
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

        result := ComCall(33, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr", ppTask, "int")
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

        result := ComCall(34, this, "ptr", bstrTaskName, "ptr", varReserved, "ptr", ppTask, "int")
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

        result := ComCall(35, this, "ptr", bstrTaskName, "ptr", varReserved, "int")
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
        result := ComCall(36, this, "int", lFlags, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfProp 
     * @returns {HRESULT} 
     */
    get_CanBeDelegated(pfProp) {
        result := ComCall(37, this, "ptr", pfProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfProp 
     * @returns {HRESULT} 
     */
    get_BizrulesWritable(pfProp) {
        result := ComCall(38, this, "ptr", pfProp, "int")
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
        result := ComCall(39, this, "ptr", pvarAdmins, "int")
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
        result := ComCall(40, this, "ptr", pvarReaders, "int")
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

        result := ComCall(41, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
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

        result := ComCall(42, this, "ptr", bstrAdmin, "ptr", varReserved, "int")
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

        result := ComCall(43, this, "ptr", bstrReader, "ptr", varReserved, "int")
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

        result := ComCall(44, this, "ptr", bstrReader, "ptr", varReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
