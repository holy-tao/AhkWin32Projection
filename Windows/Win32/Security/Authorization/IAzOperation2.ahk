#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IAzRoleAssignments.ahk" { IAzRoleAssignments }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IAzOperation.ahk" { IAzOperation }

/**
 * Extends the IAzOperation with a method that returns the role assignments associated with the operation.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazoperation2
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzOperation2 extends IAzOperation {
    /**
     * The interface identifier for IAzOperation2
     * @type {Guid}
     */
    static IID := Guid("{1f5ea01f-44a2-4184-9c48-a75b4dcc8ccc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzOperation2 interfaces
    */
    struct Vtbl extends IAzOperation.Vtbl {
        RoleAssignments : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzOperation2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a collection of the role assignments associated with this operation.
     * @param {BSTR} bstrScopeName The name of the scope in which to check for role assignments. If the value of this parameter is an empty string, the method checks for role assignments at the application level.
     * @param {VARIANT_BOOL} bRecursive <b>TRUE</b> if the method checks all scopes within the application; otherwise, <b>FALSE</b>. This parameter is ignored if the value of the <i>bstrScopeName</i> parameter is not <b>NULL</b>.
     * @returns {IAzRoleAssignments} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignments">IAzRoleAssignments</a> interface that represents the collection of <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazroleassignment">IAzRoleAssignment</a> objects associated with this operation.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazoperation2-roleassignments
     */
    RoleAssignments(bstrScopeName, bRecursive) {
        bstrScopeName := bstrScopeName is String ? BSTR.Alloc(bstrScopeName).Value : bstrScopeName

        result := ComCall(19, this, BSTR, bstrScopeName, VARIANT_BOOL, bRecursive, "ptr*", &ppRoleAssignments := 0, "HRESULT")
        return IAzRoleAssignments(ppRoleAssignments)
    }

    Query(iid) {
        if (IAzOperation2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RoleAssignments := CallbackCreate(GetMethod(implObj, "RoleAssignments"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RoleAssignments)
    }
}
