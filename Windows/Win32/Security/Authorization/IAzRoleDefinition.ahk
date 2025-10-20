#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzTask.ahk

/**
 * Represents one or more IAzRoleDefinition, IAzTask, and IAzOperation objects that specify a set of operations.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazroledefinition
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzRoleDefinition extends IAzTask{
    /**
     * The interface identifier for IAzRoleDefinition
     * @type {Guid}
     */
    static IID => Guid("{d97fcea1-2599-44f1-9fc3-58e9fbe09466}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {VARIANT_BOOL} bRecursive 
     * @param {Pointer<IAzRoleAssignments>} ppRoleAssignments 
     * @returns {HRESULT} 
     */
    RoleAssignments(bstrScopeName, bRecursive, ppRoleAssignments) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(33, this, "ptr", bstrScopeName, "short", bRecursive, "ptr", ppRoleAssignments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinition 
     * @returns {HRESULT} 
     */
    AddRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(34, this, "ptr", bstrRoleDefinition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinition 
     * @returns {HRESULT} 
     */
    DeleteRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(35, this, "ptr", bstrRoleDefinition, "int")
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
        result := ComCall(36, this, "ptr", ppRoleDefinitions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
