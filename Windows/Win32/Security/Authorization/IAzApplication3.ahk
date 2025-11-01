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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ScopeExists", "OpenScope2", "CreateScope2", "DeleteScope2", "get_RoleDefinitions", "CreateRoleDefinition", "OpenRoleDefinition", "DeleteRoleDefinition", "get_RoleAssignments", "CreateRoleAssignment", "OpenRoleAssignment", "DeleteRoleAssignment", "get_BizRulesEnabled", "put_BizRulesEnabled"]

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<VARIANT_BOOL>} pbExist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-scopeexists
     */
    ScopeExists(bstrScopeName, pbExist) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(70, this, "ptr", bstrScopeName, "ptr", pbExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<IAzScope2>} ppScope2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-openscope2
     */
    OpenScope2(bstrScopeName, ppScope2) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(71, this, "ptr", bstrScopeName, "ptr*", ppScope2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @param {Pointer<IAzScope2>} ppScope2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-createscope2
     */
    CreateScope2(bstrScopeName, ppScope2) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(72, this, "ptr", bstrScopeName, "ptr*", ppScope2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-deletescope2
     */
    DeleteScope2(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(73, this, "ptr", bstrScopeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAzRoleDefinitions>} ppRoleDefinitions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-get_roledefinitions
     */
    get_RoleDefinitions(ppRoleDefinitions) {
        result := ComCall(74, this, "ptr*", ppRoleDefinitions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @param {Pointer<IAzRoleDefinition>} ppRoleDefinitions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-createroledefinition
     */
    CreateRoleDefinition(bstrRoleDefinitionName, ppRoleDefinitions) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(75, this, "ptr", bstrRoleDefinitionName, "ptr*", ppRoleDefinitions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @param {Pointer<IAzRoleDefinition>} ppRoleDefinitions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-openroledefinition
     */
    OpenRoleDefinition(bstrRoleDefinitionName, ppRoleDefinitions) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(76, this, "ptr", bstrRoleDefinitionName, "ptr*", ppRoleDefinitions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(77, this, "ptr", bstrRoleDefinitionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAzRoleAssignments>} ppRoleAssignments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-get_roleassignments
     */
    get_RoleAssignments(ppRoleAssignments) {
        result := ComCall(78, this, "ptr*", ppRoleAssignments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @param {Pointer<IAzRoleAssignment>} ppRoleAssignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-createroleassignment
     */
    CreateRoleAssignment(bstrRoleAssignmentName, ppRoleAssignment) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(79, this, "ptr", bstrRoleAssignmentName, "ptr*", ppRoleAssignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @param {Pointer<IAzRoleAssignment>} ppRoleAssignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-openroleassignment
     */
    OpenRoleAssignment(bstrRoleAssignmentName, ppRoleAssignment) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(80, this, "ptr", bstrRoleAssignmentName, "ptr*", ppRoleAssignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-deleteroleassignment
     */
    DeleteRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(81, this, "ptr", bstrRoleAssignmentName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-get_bizrulesenabled
     */
    get_BizRulesEnabled(pbEnabled) {
        result := ComCall(82, this, "ptr", pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-put_bizrulesenabled
     */
    put_BizRulesEnabled(bEnabled) {
        result := ComCall(83, this, "short", bEnabled, "HRESULT")
        return result
    }
}
