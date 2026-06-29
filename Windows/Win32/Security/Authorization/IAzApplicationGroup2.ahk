#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IAzApplicationGroup.ahk" { IAzApplicationGroup }
#Import ".\IAzRoleAssignments.ahk" { IAzRoleAssignments }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Extends the IAzApplicationGroup interface by adding support for the BizRule group type.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazapplicationgroup2
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzApplicationGroup2 extends IAzApplicationGroup {
    /**
     * The interface identifier for IAzApplicationGroup2
     * @type {Guid}
     */
    static IID := Guid("{3f0613fc-b71a-464e-a11d-5b881a56cefa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzApplicationGroup2 interfaces
    */
    struct Vtbl extends IAzApplicationGroup.Vtbl {
        get_BizRule             : IntPtr
        put_BizRule             : IntPtr
        get_BizRuleLanguage     : IntPtr
        put_BizRuleLanguage     : IntPtr
        get_BizRuleImportedPath : IntPtr
        put_BizRuleImportedPath : IntPtr
        RoleAssignments         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzApplicationGroup2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    BizRule {
        get => this.get_BizRule()
        set => this.put_BizRule(value)
    }

    /**
     * @type {BSTR} 
     */
    BizRuleLanguage {
        get => this.get_BizRuleLanguage()
        set => this.put_BizRuleLanguage(value)
    }

    /**
     * @type {BSTR} 
     */
    BizRuleImportedPath {
        get => this.get_BizRuleImportedPath()
        set => this.put_BizRuleImportedPath(value)
    }

    /**
     * Gets or sets the script that determines membership for this application group. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-get_bizrule
     */
    get_BizRule() {
        pbstrProp := BSTR.Owned()
        result := ComCall(39, this, BSTR.Ptr, pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Gets or sets the script that determines membership for this application group. (Put)
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-put_bizrule
     */
    put_BizRule(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(40, this, BSTR, bstrProp, "HRESULT")
        return result
    }

    /**
     * Gets or sets the programming language of the business rule script associated with this application group. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-get_bizrulelanguage
     */
    get_BizRuleLanguage() {
        pbstrProp := BSTR.Owned()
        result := ComCall(41, this, BSTR.Ptr, pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Gets or sets the programming language of the business rule script associated with this application group. (Put)
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-put_bizrulelanguage
     */
    put_BizRuleLanguage(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(42, this, BSTR, bstrProp, "HRESULT")
        return result
    }

    /**
     * Gets or sets the path of the file that contains the business rule script associated with this application group. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-get_bizruleimportedpath
     */
    get_BizRuleImportedPath() {
        pbstrProp := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, pbstrProp, "HRESULT")
        return pbstrProp
    }

    /**
     * Gets or sets the path of the file that contains the business rule script associated with this application group. (Put)
     * @param {BSTR} bstrProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-put_bizruleimportedpath
     */
    put_BizRuleImportedPath(bstrProp) {
        bstrProp := bstrProp is String ? BSTR.Alloc(bstrProp).Value : bstrProp

        result := ComCall(44, this, BSTR, bstrProp, "HRESULT")
        return result
    }

    /**
     * Gets a collection of IAzRoleAssignment objects associated with this application group.
     * @param {BSTR} bstrScopeName Provides a scope name to include in the search for **IAzRoleAssignment** objects. If this parameter is **NULL**, the search is performed in the global scope.
     * @param {VARIANT_BOOL} bRecursive Indicates if the search for **IAzRoleAssignment** objects should be performed recursively.
     * @returns {IAzRoleAssignments} The list of [IAzRoleAssignment](nn-azroles-iazroleassignment.md) objects associated with the specified application group.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplicationgroup2-roleassignments
     */
    RoleAssignments(bstrScopeName, bRecursive) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(45, this, BSTR, bstrScopeName, VARIANT_BOOL, bRecursive, "ptr*", &ppRoleAssignments := 0, "HRESULT")
        return IAzRoleAssignments(ppRoleAssignments)
    }

    Query(iid) {
        if (IAzApplicationGroup2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BizRule := CallbackCreate(GetMethod(implObj, "get_BizRule"), flags, 2)
        this.vtbl.put_BizRule := CallbackCreate(GetMethod(implObj, "put_BizRule"), flags, 2)
        this.vtbl.get_BizRuleLanguage := CallbackCreate(GetMethod(implObj, "get_BizRuleLanguage"), flags, 2)
        this.vtbl.put_BizRuleLanguage := CallbackCreate(GetMethod(implObj, "put_BizRuleLanguage"), flags, 2)
        this.vtbl.get_BizRuleImportedPath := CallbackCreate(GetMethod(implObj, "get_BizRuleImportedPath"), flags, 2)
        this.vtbl.put_BizRuleImportedPath := CallbackCreate(GetMethod(implObj, "put_BizRuleImportedPath"), flags, 2)
        this.vtbl.RoleAssignments := CallbackCreate(GetMethod(implObj, "RoleAssignments"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BizRule)
        CallbackFree(this.vtbl.put_BizRule)
        CallbackFree(this.vtbl.get_BizRuleLanguage)
        CallbackFree(this.vtbl.put_BizRuleLanguage)
        CallbackFree(this.vtbl.get_BizRuleImportedPath)
        CallbackFree(this.vtbl.put_BizRuleImportedPath)
        CallbackFree(this.vtbl.RoleAssignments)
    }
}
