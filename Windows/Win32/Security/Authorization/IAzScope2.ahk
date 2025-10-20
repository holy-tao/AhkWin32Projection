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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RoleDefinitions", "CreateRoleDefinition", "OpenRoleDefinition", "DeleteRoleDefinition", "get_RoleAssignments", "CreateRoleAssignment", "OpenRoleAssignment", "DeleteRoleAssignment"]

    /**
     * 
     * @param {Pointer<IAzRoleDefinitions>} ppRoleDefinitions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-get_roledefinitions
     */
    get_RoleDefinitions(ppRoleDefinitions) {
        result := ComCall(45, this, "ptr*", ppRoleDefinitions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @param {Pointer<IAzRoleDefinition>} ppRoleDefinitions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-createroledefinition
     */
    CreateRoleDefinition(bstrRoleDefinitionName, ppRoleDefinitions) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(46, this, "ptr", bstrRoleDefinitionName, "ptr*", ppRoleDefinitions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @param {Pointer<IAzRoleDefinition>} ppRoleDefinitions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-openroledefinition
     */
    OpenRoleDefinition(bstrRoleDefinitionName, ppRoleDefinitions) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(47, this, "ptr", bstrRoleDefinitionName, "ptr*", ppRoleDefinitions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(48, this, "ptr", bstrRoleDefinitionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAzRoleAssignments>} ppRoleAssignments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-get_roleassignments
     */
    get_RoleAssignments(ppRoleAssignments) {
        result := ComCall(49, this, "ptr*", ppRoleAssignments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @param {Pointer<IAzRoleAssignment>} ppRoleAssignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-createroleassignment
     */
    CreateRoleAssignment(bstrRoleAssignmentName, ppRoleAssignment) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(50, this, "ptr", bstrRoleAssignmentName, "ptr*", ppRoleAssignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @param {Pointer<IAzRoleAssignment>} ppRoleAssignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-openroleassignment
     */
    OpenRoleAssignment(bstrRoleAssignmentName, ppRoleAssignment) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(51, this, "ptr", bstrRoleAssignmentName, "ptr*", ppRoleAssignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-deleteroleassignment
     */
    DeleteRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(52, this, "ptr", bstrRoleAssignmentName, "HRESULT")
        return result
    }
}
