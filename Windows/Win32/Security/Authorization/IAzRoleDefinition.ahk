#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IAzRoleAssignments.ahk" { IAzRoleAssignments }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IAzTask.ahk" { IAzTask }
#Import ".\IAzRoleDefinitions.ahk" { IAzRoleDefinitions }

/**
 * Represents one or more IAzRoleDefinition, IAzTask, and IAzOperation objects that specify a set of operations.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazroledefinition
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzRoleDefinition extends IAzTask {
    /**
     * The interface identifier for IAzRoleDefinition
     * @type {Guid}
     */
    static IID := Guid("{d97fcea1-2599-44f1-9fc3-58e9fbe09466}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzRoleDefinition interfaces
    */
    struct Vtbl extends IAzTask.Vtbl {
        RoleAssignments      : IntPtr
        AddRoleDefinition    : IntPtr
        DeleteRoleDefinition : IntPtr
        get_RoleDefinitions  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzRoleDefinition.Vtbl()
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
     * Retrieves a collection of IAzRoleAssignment objects that represent the role assignments associated with this IAzRoleDefinition object.
     * @param {BSTR} bstrScopeName Provides a scope name to include in the search for **IAzRoleAssignment** objects. If this parameter is **NULL**, the search is performed in the global scope.
     * @param {VARIANT_BOOL} bRecursive Indicates if the search for **IAzRoleAssignment** objects should be performed recursively.
     * @returns {IAzRoleAssignments} The collection of **IAzRoleAssignment** objects that represent the role assignments associated with this **IAzRoleDefinition** object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroledefinition-roleassignments
     */
    RoleAssignments(bstrScopeName, bRecursive) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(33, this, BSTR, bstrScopeName, VARIANT_BOOL, bRecursive, "ptr*", &ppRoleAssignments := 0, "HRESULT")
        return IAzRoleAssignments(ppRoleAssignments)
    }

    /**
     * Adds the specified IAzRoleDefinition object to this IAzRoleDefinition object.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iaztask-submit">Submit</a> method to persist any changes made by this method.
     * @param {BSTR} bstrRoleDefinition The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> to add.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroledefinition-addroledefinition
     */
    AddRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(34, this, BSTR, bstrRoleDefinition, "HRESULT")
        return result
    }

    /**
     * Removes the IAzRoleDefinition object with the specified name from this IAzRoleDefinition object.
     * @remarks
     * If there are any references to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object that has been deleted from the cache, the <b>IAzRoleDefinition</b> object can no longer be used. In C++, you must release references to deleted <b>IAzRoleDefinition</b> objects by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method. In Visual Basic, references to deleted objects are automatically released.
     * @param {BSTR} bstrRoleDefinition The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroledefinition">IAzRoleDefinition</a> object to delete.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroledefinition-deleteroledefinition
     */
    DeleteRoleDefinition(bstrRoleDefinition) {
        bstrRoleDefinition := bstrRoleDefinition is String ? BSTR.Alloc(bstrRoleDefinition).Value : bstrRoleDefinition

        result := ComCall(35, this, BSTR, bstrRoleDefinition, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of the IAzRoleDefinition objects associated with this IAzRoleDefinition object.
     * @returns {IAzRoleDefinitions} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazroledefinition-get_roledefinitions
     */
    get_RoleDefinitions() {
        result := ComCall(36, this, "ptr*", &ppRoleDefinitions := 0, "HRESULT")
        return IAzRoleDefinitions(ppRoleDefinitions)
    }

    Query(iid) {
        if (IAzRoleDefinition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RoleAssignments := CallbackCreate(GetMethod(implObj, "RoleAssignments"), flags, 4)
        this.vtbl.AddRoleDefinition := CallbackCreate(GetMethod(implObj, "AddRoleDefinition"), flags, 2)
        this.vtbl.DeleteRoleDefinition := CallbackCreate(GetMethod(implObj, "DeleteRoleDefinition"), flags, 2)
        this.vtbl.get_RoleDefinitions := CallbackCreate(GetMethod(implObj, "get_RoleDefinitions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RoleAssignments)
        CallbackFree(this.vtbl.AddRoleDefinition)
        CallbackFree(this.vtbl.DeleteRoleDefinition)
        CallbackFree(this.vtbl.get_RoleDefinitions)
    }
}
