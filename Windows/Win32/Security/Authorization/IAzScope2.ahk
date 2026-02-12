#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzRoleDefinitions.ahk
#Include .\IAzRoleDefinition.ahk
#Include .\IAzRoleAssignments.ahk
#Include .\IAzRoleAssignment.ahk
#Include .\IAzScope.ahk

/**
 * Extends the IAzScope interface to manage IAzRoleAssignment and IAzRoleDefinition objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nn-azroles-iazscope2
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
     * Retrieves an IAzRoleDefinitions object that represents the collection of IAzRoleDefinition objects associated with this scope.
     * @returns {IAzRoleDefinitions} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazscope2-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(45, this, "ptr*", &ppRoleDefinitions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    /**
     * Creates a new IAzRoleDefinition object with the specified name in this scope.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object.
     * @returns {IAzRoleDefinition} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that this method creates.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazscope2-createroledefinition
     */
    CreateRoleDefinition(bstrRoleDefinitionName) {
        if(bstrRoleDefinitionName is String) {
            pin := BSTR.Alloc(bstrRoleDefinitionName)
            bstrRoleDefinitionName := pin.Value
        }

        result := ComCall(46, this, "ptr", bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleDefinition(ppRoleDefinitions)
    }

    /**
     * Opens an IAzRoleDefinition object with the specified name in this scope.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to open.
     * @returns {IAzRoleDefinition} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that this method opens.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazscope2-openroledefinition
     */
    OpenRoleDefinition(bstrRoleDefinitionName) {
        if(bstrRoleDefinitionName is String) {
            pin := BSTR.Alloc(bstrRoleDefinitionName)
            bstrRoleDefinitionName := pin.Value
        }

        result := ComCall(47, this, "ptr", bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleDefinition(ppRoleDefinitions)
    }

    /**
     * Removes the specified IAzRoleDefinition object from this scope.
     * @remarks
     * If any references to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object have been deleted from the cache, that object can no longer be used. In C++, you must release references to deleted <b>IAzRoleDefinition</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to remove.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazscope2-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinitionName) {
        if(bstrRoleDefinitionName is String) {
            pin := BSTR.Alloc(bstrRoleDefinitionName)
            bstrRoleDefinitionName := pin.Value
        }

        result := ComCall(48, this, "ptr", bstrRoleDefinitionName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an IAzRoleAssignments object that represents the collection of IAzRoleAssignment objects associated with this scope.
     * @returns {IAzRoleAssignments} 
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazscope2-get_roleassignments
     */
    get_RoleAssignments() {
        result := ComCall(49, this, "ptr*", &ppRoleAssignments := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleAssignments(ppRoleAssignments)
    }

    /**
     * Creates a new IAzRoleAssignment object with the specified name in this scope.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object.
     * @returns {IAzRoleAssignment} The address of  a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object that this method creates.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazscope2-createroleassignment
     */
    CreateRoleAssignment(bstrRoleAssignmentName) {
        if(bstrRoleAssignmentName is String) {
            pin := BSTR.Alloc(bstrRoleAssignmentName)
            bstrRoleAssignmentName := pin.Value
        }

        result := ComCall(50, this, "ptr", bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleAssignment(ppRoleAssignment)
    }

    /**
     * Opens an IAzRoleAssignment object with the specified name in this scope.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object to open.
     * @returns {IAzRoleAssignment} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object that this method opens.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazscope2-openroleassignment
     */
    OpenRoleAssignment(bstrRoleAssignmentName) {
        if(bstrRoleAssignmentName is String) {
            pin := BSTR.Alloc(bstrRoleAssignmentName)
            bstrRoleAssignmentName := pin.Value
        }

        result := ComCall(51, this, "ptr", bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAzRoleAssignment(ppRoleAssignment)
    }

    /**
     * Removes the specified IAzRoleAssignment object from this scope.
     * @remarks
     * If any references to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object have been deleted from the cache, the <b>IAzRoleAssignment</b> object can no longer be used. In C++, you must release references to deleted <b>IAzRoleAssignment</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object to remove.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/azroles/nf-azroles-iazscope2-deleteroleassignment
     */
    DeleteRoleAssignment(bstrRoleAssignmentName) {
        if(bstrRoleAssignmentName is String) {
            pin := BSTR.Alloc(bstrRoleAssignmentName)
            bstrRoleAssignmentName := pin.Value
        }

        result := ComCall(52, this, "ptr", bstrRoleAssignmentName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
