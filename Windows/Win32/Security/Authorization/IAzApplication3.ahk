#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAzRoleDefinitions.ahk" { IAzRoleDefinitions }
#Import ".\IAzApplication2.ahk" { IAzApplication2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IAzRoleDefinition.ahk" { IAzRoleDefinition }
#Import ".\IAzRoleAssignments.ahk" { IAzRoleAssignments }
#Import ".\IAzScope2.ahk" { IAzScope2 }
#Import ".\IAzRoleAssignment.ahk" { IAzRoleAssignment }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Provides methods to manage IAzRoleAssignment, IAzRoleDefinition, and IAzScope2 objects.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazapplication3
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzApplication3 extends IAzApplication2 {
    /**
     * The interface identifier for IAzApplication3
     * @type {Guid}
     */
    static IID := Guid("{181c845e-7196-4a7d-ac2e-020c0bb7a303}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzApplication3 interfaces
    */
    struct Vtbl extends IAzApplication2.Vtbl {
        ScopeExists          : IntPtr
        OpenScope2           : IntPtr
        CreateScope2         : IntPtr
        DeleteScope2         : IntPtr
        get_RoleDefinitions  : IntPtr
        CreateRoleDefinition : IntPtr
        OpenRoleDefinition   : IntPtr
        DeleteRoleDefinition : IntPtr
        get_RoleAssignments  : IntPtr
        CreateRoleAssignment : IntPtr
        OpenRoleAssignment   : IntPtr
        DeleteRoleAssignment : IntPtr
        get_BizRulesEnabled  : IntPtr
        put_BizRulesEnabled  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzApplication3.Vtbl()
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-scopeexists
     */
    ScopeExists(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(70, this, BSTR, bstrScopeName, VARIANT_BOOL.Ptr, &pbExist := 0, "HRESULT")
        return pbExist
    }

    /**
     * Opens an IAzScope2 object with the specified name.
     * @param {BSTR} bstrScopeName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object to open.
     * @returns {IAzScope2} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object that this method opens.
     * 
     * When you have finished using the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-openscope2
     */
    OpenScope2(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(71, this, BSTR, bstrScopeName, "ptr*", &ppScope2 := 0, "HRESULT")
        return IAzScope2(ppScope2)
    }

    /**
     * Creates a new IAzScope2 object with the specified name.
     * @param {BSTR} bstrScopeName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object.
     * @returns {IAzScope2} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object that this method creates.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazscope2">IAzScope2</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-createscope2
     */
    CreateScope2(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(72, this, BSTR, bstrScopeName, "ptr*", &ppScope2 := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-deletescope2
     */
    DeleteScope2(bstrScopeName) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(73, this, BSTR, bstrScopeName, "HRESULT")
        return result
    }

    /**
     * Gets an IAzRoleDefinitions object that represents the collection of IAzRoleDefinition objects associated with the current IAzApplication3 object.
     * @returns {IAzRoleDefinitions} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(74, this, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    /**
     * Creates a new IAzRoleDefinition object with the specified name.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object.
     * @returns {IAzRoleDefinition} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that this method creates.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-createroledefinition
     */
    CreateRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(75, this, BSTR, bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinition(ppRoleDefinitions)
    }

    /**
     * Opens an IAzRoleDefinition object with the specified name.
     * @param {BSTR} bstrRoleDefinitionName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to open.
     * @returns {IAzRoleDefinition} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that this method opens.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-openroledefinition
     */
    OpenRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(76, this, BSTR, bstrRoleDefinitionName, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinitionName) {
        bstrRoleDefinitionName := bstrRoleDefinitionName is String ? BSTR.Alloc(bstrRoleDefinitionName).Value : bstrRoleDefinitionName

        result := ComCall(77, this, BSTR, bstrRoleDefinitionName, "HRESULT")
        return result
    }

    /**
     * Gets an IAzRoleAssignments object that represents the collection of IAzRoleAssignment objects associated with the current IAzApplication3 object.
     * @returns {IAzRoleAssignments} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-get_roleassignments
     */
    get_RoleAssignments() {
        result := ComCall(78, this, "ptr*", &ppRoleAssignments := 0, "HRESULT")
        return IAzRoleAssignments(ppRoleAssignments)
    }

    /**
     * Creates a new IAzRoleAssignment object with the specified name.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object.
     * @returns {IAzRoleAssignment} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object that this method creates.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-createroleassignment
     */
    CreateRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(79, this, BSTR, bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "HRESULT")
        return IAzRoleAssignment(ppRoleAssignment)
    }

    /**
     * Opens an IAzRoleAssignment object with the specified name.
     * @param {BSTR} bstrRoleAssignmentName A string that contains the name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object to open.
     * @returns {IAzRoleAssignment} The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object that this method opens.
     * 
     * When you have finished using this <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-openroleassignment
     */
    OpenRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(80, this, BSTR, bstrRoleAssignmentName, "ptr*", &ppRoleAssignment := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-deleteroleassignment
     */
    DeleteRoleAssignment(bstrRoleAssignmentName) {
        bstrRoleAssignmentName := bstrRoleAssignmentName is String ? BSTR.Alloc(bstrRoleAssignmentName).Value : bstrRoleAssignmentName

        result := ComCall(81, this, BSTR, bstrRoleAssignmentName, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates whether business rules are enabled for this application. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-get_bizrulesenabled
     */
    get_BizRulesEnabled() {
        result := ComCall(82, this, VARIANT_BOOL.Ptr, &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * Gets or sets a value that indicates whether business rules are enabled for this application. (Put)
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication3-put_bizrulesenabled
     */
    put_BizRulesEnabled(bEnabled) {
        result := ComCall(83, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAzApplication3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ScopeExists := CallbackCreate(GetMethod(implObj, "ScopeExists"), flags, 3)
        this.vtbl.OpenScope2 := CallbackCreate(GetMethod(implObj, "OpenScope2"), flags, 3)
        this.vtbl.CreateScope2 := CallbackCreate(GetMethod(implObj, "CreateScope2"), flags, 3)
        this.vtbl.DeleteScope2 := CallbackCreate(GetMethod(implObj, "DeleteScope2"), flags, 2)
        this.vtbl.get_RoleDefinitions := CallbackCreate(GetMethod(implObj, "get_RoleDefinitions"), flags, 2)
        this.vtbl.CreateRoleDefinition := CallbackCreate(GetMethod(implObj, "CreateRoleDefinition"), flags, 3)
        this.vtbl.OpenRoleDefinition := CallbackCreate(GetMethod(implObj, "OpenRoleDefinition"), flags, 3)
        this.vtbl.DeleteRoleDefinition := CallbackCreate(GetMethod(implObj, "DeleteRoleDefinition"), flags, 2)
        this.vtbl.get_RoleAssignments := CallbackCreate(GetMethod(implObj, "get_RoleAssignments"), flags, 2)
        this.vtbl.CreateRoleAssignment := CallbackCreate(GetMethod(implObj, "CreateRoleAssignment"), flags, 3)
        this.vtbl.OpenRoleAssignment := CallbackCreate(GetMethod(implObj, "OpenRoleAssignment"), flags, 3)
        this.vtbl.DeleteRoleAssignment := CallbackCreate(GetMethod(implObj, "DeleteRoleAssignment"), flags, 2)
        this.vtbl.get_BizRulesEnabled := CallbackCreate(GetMethod(implObj, "get_BizRulesEnabled"), flags, 2)
        this.vtbl.put_BizRulesEnabled := CallbackCreate(GetMethod(implObj, "put_BizRulesEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ScopeExists)
        CallbackFree(this.vtbl.OpenScope2)
        CallbackFree(this.vtbl.CreateScope2)
        CallbackFree(this.vtbl.DeleteScope2)
        CallbackFree(this.vtbl.get_RoleDefinitions)
        CallbackFree(this.vtbl.CreateRoleDefinition)
        CallbackFree(this.vtbl.OpenRoleDefinition)
        CallbackFree(this.vtbl.DeleteRoleDefinition)
        CallbackFree(this.vtbl.get_RoleAssignments)
        CallbackFree(this.vtbl.CreateRoleAssignment)
        CallbackFree(this.vtbl.OpenRoleAssignment)
        CallbackFree(this.vtbl.DeleteRoleAssignment)
        CallbackFree(this.vtbl.get_BizRulesEnabled)
        CallbackFree(this.vtbl.put_BizRulesEnabled)
    }
}
