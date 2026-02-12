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
 * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nn-azroles-iazapplication3
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
     * Indicates whether the specified scope exists in this IAzApplication3 object.
     * @param {BSTR} bstrScopeName A string that contains the name of the scope to be checked.
     * @returns {VARIANT_BOOL} <b>VARIANT_TRUE</b> if the specified scope exists in this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication3">IAzApplication3</a> object; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-scopeexists
     */
    ScopeExists(bstrScopeName) {
        if(bstrScopeName is String) {
            pin := BSTR.Alloc(bstrScopeName)
            bstrScopeName := pin.Value
        }

        result := ComCall(70, this, "ptr", bstrScopeName, "short*", &pbExist := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbExist
    }

    /**
     * Opens an IAzScope2 object with the specified name.
     * @param {BSTR} bstrScopeName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object to open.
     * @returns {IAzScope2} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object that this method opens.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-openscope2
     */
    OpenScope2(bstrScopeName) {
        if(bstrScopeName is String) {
            pin := BSTR.Alloc(bstrScopeName)
            bstrScopeName := pin.Value
        }

        result := ComCall(71, this, "ptr", bstrScopeName, "ptr*", &ppScope2 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzScope2(ppScope2)
    }

    /**
     * Creates a new IAzScope2 object with the specified name.
     * @param {BSTR} bstrScopeName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object.
     * @returns {IAzScope2} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object that this method creates.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-createscope2
     */
    CreateScope2(bstrScopeName) {
        if(bstrScopeName is String) {
            pin := BSTR.Alloc(bstrScopeName)
            bstrScopeName := pin.Value
        }

        result := ComCall(72, this, "ptr", bstrScopeName, "ptr*", &ppScope2 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzScope2(ppScope2)
    }

    /**
     * Removes the specified IAzScope2 object from the IAzApplication3 object.
     * @remarks
     * If any references to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object have been deleted from the cache, you can no longer use that object. In C++, you must release references to deleted <b>IAzScope2</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrScopeName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object to remove.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-deletescope2
     */
    DeleteScope2(bstrScopeName) {
        if(bstrScopeName is String) {
            pin := BSTR.Alloc(bstrScopeName)
            bstrScopeName := pin.Value
        }

        result := ComCall(73, this, "ptr", bstrScopeName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets an IAzRoleDefinitions object that represents the collection of IAzRoleDefinition objects associated with the current IAzApplication3 object.
     * @returns {IAzRoleDefinitions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(74, this, "ptr*", &ppRoleDefinitions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    /**
     * Creates a new IAzRoleDefinition object with the specified name.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object.
     * @returns {IAzRoleDefinition} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that this method creates.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-createroledefinition
     */
    CreateRoleDefinition(bstrRoleDefinitionName) {
        if(bstrRoleDefinitionName is String) {
            pin := BSTR.Alloc(bstrRoleDefinitionName)
            bstrRoleDefinitionName := pin.Value
        }

        result := ComCall(75, this, "ptr", bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleDefinition(ppRoleDefinitions)
    }

    /**
     * Opens an IAzRoleDefinition object with the specified name.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to open.
     * @returns {IAzRoleDefinition} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that this method opens.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-openroledefinition
     */
    OpenRoleDefinition(bstrRoleDefinitionName) {
        if(bstrRoleDefinitionName is String) {
            pin := BSTR.Alloc(bstrRoleDefinitionName)
            bstrRoleDefinitionName := pin.Value
        }

        result := ComCall(76, this, "ptr", bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleDefinition(ppRoleDefinitions)
    }

    /**
     * Removes the specified IAzRoleDefinition object from the IAzApplication3 object.
     * @remarks
     * If any references to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object have been deleted from the cache, you can no longer use that object. In C++, you must release references to deleted <b>IAzRoleDefinition</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to remove.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinitionName) {
        if(bstrRoleDefinitionName is String) {
            pin := BSTR.Alloc(bstrRoleDefinitionName)
            bstrRoleDefinitionName := pin.Value
        }

        result := ComCall(77, this, "ptr", bstrRoleDefinitionName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets an IAzRoleAssignments object that represents the collection of IAzRoleAssignment objects associated with the current IAzApplication3 object.
     * @returns {IAzRoleAssignments} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-get_roleassignments
     */
    get_RoleAssignments() {
        result := ComCall(78, this, "ptr*", &ppRoleAssignments := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleAssignments(ppRoleAssignments)
    }

    /**
     * Creates a new IAzRoleAssignment object with the specified name.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object.
     * @returns {IAzRoleAssignment} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object that this method creates.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-createroleassignment
     */
    CreateRoleAssignment(bstrRoleAssignmentName) {
        if(bstrRoleAssignmentName is String) {
            pin := BSTR.Alloc(bstrRoleAssignmentName)
            bstrRoleAssignmentName := pin.Value
        }

        result := ComCall(79, this, "ptr", bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleAssignment(ppRoleAssignment)
    }

    /**
     * Opens an IAzRoleAssignment object with the specified name.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object to open.
     * @returns {IAzRoleAssignment} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object that this method opens.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-openroleassignment
     */
    OpenRoleAssignment(bstrRoleAssignmentName) {
        if(bstrRoleAssignmentName is String) {
            pin := BSTR.Alloc(bstrRoleAssignmentName)
            bstrRoleAssignmentName := pin.Value
        }

        result := ComCall(80, this, "ptr", bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleAssignment(ppRoleAssignment)
    }

    /**
     * Removes the specified IAzRoleAssignment object from the IAzApplication3 object.
     * @remarks
     * If any references to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object have been deleted from the cache, you can no longer use that object. In C++, you must release references to deleted <b>IAzRoleAssignment</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object to remove.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-deleteroleassignment
     */
    DeleteRoleAssignment(bstrRoleAssignmentName) {
        if(bstrRoleAssignmentName is String) {
            pin := BSTR.Alloc(bstrRoleAssignmentName)
            bstrRoleAssignmentName := pin.Value
        }

        result := ComCall(81, this, "ptr", bstrRoleAssignmentName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets a value that indicates whether business rules are enabled for this application. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-get_bizrulesenabled
     */
    get_BizRulesEnabled() {
        result := ComCall(82, this, "short*", &pbEnabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbEnabled
    }

    /**
     * Gets or sets a value that indicates whether business rules are enabled for this application. (Put)
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazapplication3-put_bizrulesenabled
     */
    put_BizRulesEnabled(bEnabled) {
        result := ComCall(83, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
