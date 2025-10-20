#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzRole.ahk

/**
 * Represents a role to which users and groups can be assigned.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazroleassignment
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzRoleAssignment extends IAzRole{
    /**
     * The interface identifier for IAzRoleAssignment
     * @type {Guid}
     */
    static IID => Guid("{55647d31-0d5a-4fa3-b4ac-2b5f9ad5ab76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

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

    /**
     * 
     * @param {Pointer<IAzScope>} ppScope 
     * @returns {HRESULT} 
     */
    get_Scope(ppScope) {
        result := ComCall(37, this, "ptr", ppScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
