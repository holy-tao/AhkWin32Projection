#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAzRole.ahk" { IAzRole }
#Import ".\IAzScope.ahk" { IAzScope }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAzRoleDefinitions.ahk" { IAzRoleDefinitions }

/**
 * Represents a role to which users and groups can be assigned.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazroleassignment
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzRoleAssignment extends IAzRole {
    /**
     * The interface identifier for IAzRoleAssignment
     * @type {Guid}
     */
    static IID := Guid("{55647d31-0d5a-4fa3-b4ac-2b5f9ad5ab76}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzRoleAssignment interfaces
    */
    struct Vtbl extends IAzRole.Vtbl {
        AddRoleDefinition    : IntPtr
        DeleteRoleDefinition : IntPtr
        get_RoleDefinitions  : IntPtr
        get_Scope            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzRoleAssignment.Vtbl()
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
     * @type {IAzScope} 
     */
    Scope {
        get => this.get_Scope()
    }

    /**
     * Adds the specified IAzRoleDefinition object to this IAzRoleAssignment object.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazrole-submit">Submit</a> method to persist any changes made by this method.
     * @param {BSTR} bstrRoleDefinition The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> to add.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignment-addroledefinition
     */
    AddRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(34, this, BSTR, bstrRoleDefinition, "HRESULT")
        return result
    }

    /**
     * Removes the IAzRoleDefinition object with the specified name from this IAzRoleAssignment object.
     * @remarks
     * If there are any references to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that has been deleted from the cache, the <b>IAzRoleDefinition</b> object can no longer be used. In C++, you must release references to deleted <b>IAzRoleDefinition</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrRoleDefinition The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to delete.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignment-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(35, this, BSTR, bstrRoleDefinition, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of the IAzRoleDefinition objects associated with this IAzRoleAssignment object.
     * @returns {IAzRoleDefinitions} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignment-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(36, this, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    /**
     * Retrieves the IAzScope object that represents the scope in which this IAzRoleAssignment object is defined.
     * @returns {IAzScope} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroleassignment-get_scope
     */
    get_Scope() {
        result := ComCall(37, this, "ptr*", &ppScope := 0, "HRESULT")
        return IAzScope(ppScope)
    }

    Query(iid) {
        if (IAzRoleAssignment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddRoleDefinition := CallbackCreate(GetMethod(implObj, "AddRoleDefinition"), flags, 2)
        this.vtbl.DeleteRoleDefinition := CallbackCreate(GetMethod(implObj, "DeleteRoleDefinition"), flags, 2)
        this.vtbl.get_RoleDefinitions := CallbackCreate(GetMethod(implObj, "get_RoleDefinitions"), flags, 2)
        this.vtbl.get_Scope := CallbackCreate(GetMethod(implObj, "get_Scope"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddRoleDefinition)
        CallbackFree(this.vtbl.DeleteRoleDefinition)
        CallbackFree(this.vtbl.get_RoleDefinitions)
        CallbackFree(this.vtbl.get_Scope)
    }
}
