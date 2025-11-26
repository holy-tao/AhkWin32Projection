#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzScope2.ahk
#Include .\IAzRoleDefinitions.ahk
#Include .\IAzRoleDefinition.ahk
#Include .\IAzRoleAssignments.ahk
#Include .\IAzRoleAssignment.ahk
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
     * @type {IAzRoleDefinitions} 
     */
    RoleDefinitions {
        get => this.get_RoleDefinitions()
    }

    /**
     * @type {IAzRoleAssignments} 
     */
    RoleAssignments {
        get => this.get_RoleAssignments()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    BizRulesEnabled {
        get => this.get_BizRulesEnabled()
        set => this.put_BizRulesEnabled(value)
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-scopeexists
     */
    ScopeExists(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(70, this, "ptr", bstrScopeName, "short*", &pbExist := 0, "HRESULT")
        return pbExist
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @returns {IAzScope2} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-openscope2
     */
    OpenScope2(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(71, this, "ptr", bstrScopeName, "ptr*", &ppScope2 := 0, "HRESULT")
        return IAzScope2(ppScope2)
    }

    /**
     * 
     * @param {BSTR} bstrScopeName 
     * @returns {IAzScope2} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-createscope2
     */
    CreateScope2(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(72, this, "ptr", bstrScopeName, "ptr*", &ppScope2 := 0, "HRESULT")
        return IAzScope2(ppScope2)
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
     * @returns {IAzRoleDefinitions} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(74, this, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @returns {IAzRoleDefinition} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-createroledefinition
     */
    CreateRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(75, this, "ptr", bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinition(ppRoleDefinitions)
    }

    /**
     * 
     * @param {BSTR} bstrRoleDefinitionName 
     * @returns {IAzRoleDefinition} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-openroledefinition
     */
    OpenRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(76, this, "ptr", bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinition(ppRoleDefinitions)
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
     * @returns {IAzRoleAssignments} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-get_roleassignments
     */
    get_RoleAssignments() {
        result := ComCall(78, this, "ptr*", &ppRoleAssignments := 0, "HRESULT")
        return IAzRoleAssignments(ppRoleAssignments)
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @returns {IAzRoleAssignment} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-createroleassignment
     */
    CreateRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(79, this, "ptr", bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "HRESULT")
        return IAzRoleAssignment(ppRoleAssignment)
    }

    /**
     * 
     * @param {BSTR} bstrRoleAssignmentName 
     * @returns {IAzRoleAssignment} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-openroleassignment
     */
    OpenRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(80, this, "ptr", bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "HRESULT")
        return IAzRoleAssignment(ppRoleAssignment)
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-get_bizrulesenabled
     */
    get_BizRulesEnabled() {
        result := ComCall(82, this, "short*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
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
