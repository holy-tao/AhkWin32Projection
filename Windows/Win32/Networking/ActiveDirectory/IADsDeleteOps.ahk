#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsDeleteOps interface specifies a method an object can use to delete itself from the underlying directory. For a container object, the method deletes its children and the entire subtree.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsdeleteops
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsDeleteOps extends IDispatch {
    /**
     * The interface identifier for IADsDeleteOps
     * @type {Guid}
     */
    static IID := Guid("{b2bd0902-8878-11d1-8c21-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsDeleteOps interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        DeleteObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsDeleteOps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IADsDeleteOps::DeleteObject method deletes an ADSI object.
     * @param {Integer} lnFlags Reserved.
     * @returns {HRESULT} This method supports standard return values, including S_OK for a successful operation. For more information about error codes, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsdeleteops-deleteobject
     */
    DeleteObject(lnFlags) {
        result := ComCall(7, this, "int", lnFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsDeleteOps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeleteObject := CallbackCreate(GetMethod(implObj, "DeleteObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeleteObject)
    }
}
