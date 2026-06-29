#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.TransactionServer
 */
export default struct IRoleAssociationUtil extends IDispatch {
    /**
     * The interface identifier for IRoleAssociationUtil
     * @type {Guid}
     */
    static IID := Guid("{6eb22876-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for RoleAssociationUtil
     * @type {Guid}
     */
    static CLSID := Guid("{6eb22887-8a19-11d0-81b6-00a0c9231c29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRoleAssociationUtil interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        AssociateRole       : IntPtr
        AssociateRoleByName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRoleAssociationUtil.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrRoleID 
     * @returns {HRESULT} 
     */
    AssociateRole(bstrRoleID) {
        bstrRoleID := bstrRoleID is String ? BSTR.Alloc(bstrRoleID).Value : bstrRoleID

        result := ComCall(7, this, BSTR, bstrRoleID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRoleName 
     * @returns {HRESULT} 
     */
    AssociateRoleByName(bstrRoleName) {
        bstrRoleName := bstrRoleName is String ? BSTR.Alloc(bstrRoleName).Value : bstrRoleName

        result := ComCall(8, this, BSTR, bstrRoleName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRoleAssociationUtil.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AssociateRole := CallbackCreate(GetMethod(implObj, "AssociateRole"), flags, 2)
        this.vtbl.AssociateRoleByName := CallbackCreate(GetMethod(implObj, "AssociateRoleByName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AssociateRole)
        CallbackFree(this.vtbl.AssociateRoleByName)
    }
}
