#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzRoleDefinitions.ahk
#Include .\IAzScope.ahk
#Include .\IAzRole.ahk

/**
 * Represents a role to which users and groups can be assigned.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazroleassignment
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzRoleAssignment extends IAzRole{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddRoleDefinition", "DeleteRoleDefinition", "get_RoleDefinitions", "get_Scope"]

    /**
     * 
     * @param {BSTR} bstrRoleDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignment-addroledefinition
     */
    AddRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(34, this, "ptr", bstrRoleDefinition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignment-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(35, this, "ptr", bstrRoleDefinition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IAzRoleDefinitions} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignment-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(36, this, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    /**
     * 
     * @returns {IAzScope} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignment-get_scope
     */
    get_Scope() {
        result := ComCall(37, this, "ptr*", &ppScope := 0, "HRESULT")
        return IAzScope(ppScope)
    }
}
