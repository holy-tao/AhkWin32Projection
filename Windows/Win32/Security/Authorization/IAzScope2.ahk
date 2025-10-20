#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzScope.ahk

/**
 * Extends the IAzScope interface to manage IAzRoleAssignment and IAzRoleDefinition objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazscope2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzScope2 extends IAzScope{
    /**
     * The interface identifier for IAzScope2
     * @type {Guid}
     */
    static IID => Guid("{ee9fe8c9-c9f3-40e2-aa12-d1d8599727fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 45

    /**
     * 
     * @param {Pointer<IAzRoleDefinitions>} ppRoleDefinitions 
     * @returns {HRESULT} 
     */
    get_RoleDefinitions(ppRoleDefinitions) {
        result := ComCall(45, this, "ptr", ppRoleDefinitions, "int")
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

        result := ComCall(46, this, "ptr", bstrRoleDefinitionName, "ptr", ppRoleDefinitions, "int")
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

        result := ComCall(47, this, "ptr", bstrRoleDefinitionName, "ptr", ppRoleDefinitions, "int")
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

        result := ComCall(48, this, "ptr", bstrRoleDefinitionName, "int")
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
        result := ComCall(49, this, "ptr", ppRoleAssignments, "int")
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

        result := ComCall(50, this, "ptr", bstrRoleAssignmentName, "ptr", ppRoleAssignment, "int")
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

        result := ComCall(51, this, "ptr", bstrRoleAssignmentName, "ptr", ppRoleAssignment, "int")
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

        result := ComCall(52, this, "ptr", bstrRoleAssignmentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
