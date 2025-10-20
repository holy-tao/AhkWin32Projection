#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzApplication2.ahk

/**
 * Provides methods to manage IAzRoleAssignment, IAzRoleDefinition, and IAzScope2 objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazapplication3
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzApplication3 extends IAzApplication2{
    /**
     * The interface identifier for IAzApplication3
     * @type {Guid}
     */
    static IID => Guid("{181c845e-7196-4a7d-ac2e-020c0bb7a303}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 70

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<VARIANT_BOOL>} pbExist 
     * @returns {HRESULT} 
     */
    ScopeExists(bstrScopeName, pbExist) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(70, this, "ptr", bstrScopeName, "ptr", pbExist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<IAzScope2>} ppScope2 
     * @returns {HRESULT} 
     */
    OpenScope2(bstrScopeName, ppScope2) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(71, this, "ptr", bstrScopeName, "ptr", ppScope2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<IAzScope2>} ppScope2 
     * @returns {HRESULT} 
     */
    CreateScope2(bstrScopeName, ppScope2) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(72, this, "ptr", bstrScopeName, "ptr", ppScope2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @returns {HRESULT} 
     */
    DeleteScope2(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(73, this, "ptr", bstrScopeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzRoleDefinitions>} ppRoleDefinitions 
     * @returns {HRESULT} 
     */
    get_RoleDefinitions(ppRoleDefinitions) {
        result := ComCall(74, this, "ptr", ppRoleDefinitions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @param {Pointer<IAzRoleDefinition>} ppRoleDefinitions 
     * @returns {HRESULT} 
     */
    CreateRoleDefinition(bstrRoleDefinitionName, ppRoleDefinitions) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(75, this, "ptr", bstrRoleDefinitionName, "ptr", ppRoleDefinitions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @param {Pointer<IAzRoleDefinition>} ppRoleDefinitions 
     * @returns {HRESULT} 
     */
    OpenRoleDefinition(bstrRoleDefinitionName, ppRoleDefinitions) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(76, this, "ptr", bstrRoleDefinitionName, "ptr", ppRoleDefinitions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @returns {HRESULT} 
     */
    DeleteRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(77, this, "ptr", bstrRoleDefinitionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAzRoleAssignments>} ppRoleAssignments 
     * @returns {HRESULT} 
     */
    get_RoleAssignments(ppRoleAssignments) {
        result := ComCall(78, this, "ptr", ppRoleAssignments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @param {Pointer<IAzRoleAssignment>} ppRoleAssignment 
     * @returns {HRESULT} 
     */
    CreateRoleAssignment(bstrRoleAssignmentName, ppRoleAssignment) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(79, this, "ptr", bstrRoleAssignmentName, "ptr", ppRoleAssignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @param {Pointer<IAzRoleAssignment>} ppRoleAssignment 
     * @returns {HRESULT} 
     */
    OpenRoleAssignment(bstrRoleAssignmentName, ppRoleAssignment) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(80, this, "ptr", bstrRoleAssignmentName, "ptr", ppRoleAssignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @returns {HRESULT} 
     */
    DeleteRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(81, this, "ptr", bstrRoleAssignmentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_BizRulesEnabled(pbEnabled) {
        result := ComCall(82, this, "ptr", pbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_BizRulesEnabled(bEnabled) {
        result := ComCall(83, this, "short", bEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
