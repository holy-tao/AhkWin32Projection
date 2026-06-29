#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAzScope.ahk" { IAzScope }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IAzRoleAssignment.ahk" { IAzRoleAssignment }
#Import ".\IAzRoleAssignments.ahk" { IAzRoleAssignments }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAzRoleDefinition.ahk" { IAzRoleDefinition }
#Import ".\IAzRoleDefinitions.ahk" { IAzRoleDefinitions }

/**
 * Extends the IAzScope interface to manage IAzRoleAssignment and IAzRoleDefinition objects.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazscope2
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzScope2 extends IAzScope {
    /**
     * The interface identifier for IAzScope2
     * @type {Guid}
     */
    static IID := Guid("{ee9fe8c9-c9f3-40e2-aa12-d1d8599727fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzScope2 interfaces
    */
    struct Vtbl extends IAzScope.Vtbl {
        get_RoleDefinitions  : IntPtr
        CreateRoleDefinition : IntPtr
        OpenRoleDefinition   : IntPtr
        DeleteRoleDefinition : IntPtr
        get_RoleAssignments  : IntPtr
        CreateRoleAssignment : IntPtr
        OpenRoleAssignment   : IntPtr
        DeleteRoleAssignment : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzScope2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(45, this, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    /**
     * Creates a new IAzRoleDefinition object with the specified name in this scope.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object.
     * @returns {IAzRoleDefinition} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that this method creates.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-createroledefinition
     */
    CreateRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(46, this, BSTR, bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinition(ppRoleDefinitions)
    }

    /**
     * Opens an IAzRoleDefinition object with the specified name in this scope.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to open.
     * @returns {IAzRoleDefinition} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that this method opens.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-openroledefinition
     */
    OpenRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(47, this, BSTR, bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(48, this, BSTR, bstrRoleDefinitionName, "HRESULT")
        return result
    }

    /**
     * Retrieves an IAzRoleAssignments object that represents the collection of IAzRoleAssignment objects associated with this scope.
     * @returns {IAzRoleAssignments} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-get_roleassignments
     */
    get_RoleAssignments() {
        result := ComCall(49, this, "ptr*", &ppRoleAssignments := 0, "HRESULT")
        return IAzRoleAssignments(ppRoleAssignments)
    }

    /**
     * Creates a new IAzRoleAssignment object with the specified name in this scope.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object.
     * @returns {IAzRoleAssignment} The address of  a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object that this method creates.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-createroleassignment
     */
    CreateRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(50, this, BSTR, bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "HRESULT")
        return IAzRoleAssignment(ppRoleAssignment)
    }

    /**
     * Opens an IAzRoleAssignment object with the specified name in this scope.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object to open.
     * @returns {IAzRoleAssignment} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object that this method opens.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-openroleassignment
     */
    OpenRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(51, this, BSTR, bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazscope2-deleteroleassignment
     */
    DeleteRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(52, this, BSTR, bstrRoleAssignmentName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAzScope2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RoleDefinitions := CallbackCreate(GetMethod(implObj, "get_RoleDefinitions"), flags, 2)
        this.vtbl.CreateRoleDefinition := CallbackCreate(GetMethod(implObj, "CreateRoleDefinition"), flags, 3)
        this.vtbl.OpenRoleDefinition := CallbackCreate(GetMethod(implObj, "OpenRoleDefinition"), flags, 3)
        this.vtbl.DeleteRoleDefinition := CallbackCreate(GetMethod(implObj, "DeleteRoleDefinition"), flags, 2)
        this.vtbl.get_RoleAssignments := CallbackCreate(GetMethod(implObj, "get_RoleAssignments"), flags, 2)
        this.vtbl.CreateRoleAssignment := CallbackCreate(GetMethod(implObj, "CreateRoleAssignment"), flags, 3)
        this.vtbl.OpenRoleAssignment := CallbackCreate(GetMethod(implObj, "OpenRoleAssignment"), flags, 3)
        this.vtbl.DeleteRoleAssignment := CallbackCreate(GetMethod(implObj, "DeleteRoleAssignment"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RoleDefinitions)
        CallbackFree(this.vtbl.CreateRoleDefinition)
        CallbackFree(this.vtbl.OpenRoleDefinition)
        CallbackFree(this.vtbl.DeleteRoleDefinition)
        CallbackFree(this.vtbl.get_RoleAssignments)
        CallbackFree(this.vtbl.CreateRoleAssignment)
        CallbackFree(this.vtbl.OpenRoleAssignment)
        CallbackFree(this.vtbl.DeleteRoleAssignment)
    }
}
