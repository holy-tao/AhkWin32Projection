#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VSS_MGMT_OBJECT_PROP.ahk" { VSS_MGMT_OBJECT_PROP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains methods to iterate over and perform other operations on a list of enumerated objects. (IVssEnumMgmtObject)
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nn-vsmgmt-ivssenummgmtobject
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssEnumMgmtObject extends IUnknown {
    /**
     * The interface identifier for IVssEnumMgmtObject
     * @type {Guid}
     */
    static IID := Guid("{01954e6b-9254-4e6e-808c-c9e05d007696}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssEnumMgmtObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssEnumMgmtObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the specified number of objects from the specified list of enumerated objects. (IVssEnumMgmtObject.Next)
     * @param {Integer} celt The number of elements to be read from the list of enumerated objects into the <i>rgelt</i> buffer.
     * @param {Pointer<VSS_MGMT_OBJECT_PROP>} rgelt The address of a caller-allocated buffer that receives <i>celt</i><a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/ns-vsmgmt-vss_mgmt_object_prop">VSS_MGMT_OBJECT_PROP</a> structures that contain the 
     *       returned objects. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} pceltFetched The number of elements that were returned in the <i>rgelt</i> buffer.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssenummgmtobject-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, VSS_MGMT_OBJECT_PROP.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips the specified number of objects. (IVssEnumMgmtObject.Skip)
     * @param {Integer} celt Number of elements to be skipped in the list of enumerated objects.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssenummgmtobject-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumerator so that IVssEnumMgmtObject starts at the first enumerated object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssenummgmtobject-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the specified list of enumerated elements by creating a copy of the IVssEnumMgmtObject enumerator object.
     * @param {Pointer<IVssEnumMgmtObject>} ppenum Address of an <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nn-vsmgmt-ivssenummgmtobject">IVssEnumMgmtObject</a> interface 
     *       pointer. Set the value of this parameter to <b>NULL</b> before calling this method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivssenummgmtobject-clone
     */
    Clone(ppenum) {
        result := ComCall(6, this, IVssEnumMgmtObject.Ptr, ppenum, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVssEnumMgmtObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
