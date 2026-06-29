#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IPersist.ahk" { IPersist }

/**
 * Exposes methods that are used to persist item identifier lists.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipersistidlist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPersistIDList extends IPersist {
    /**
     * The interface identifier for IPersistIDList
     * @type {Guid}
     */
    static IID := Guid("{1079acfc-29bd-11d3-8e0d-00c04f6837d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistIDList interfaces
    */
    struct Vtbl extends IPersist.Vtbl {
        SetIDList : IntPtr
        GetIDList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistIDList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a persisted item identifier list.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * A pointer to the item identifier list to set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipersistidlist-setidlist
     */
    SetIDList(pidl) {
        result := ComCall(4, this, ITEMIDLIST.Ptr, pidl, "HRESULT")
        return result
    }

    /**
     * Gets an item identifier list.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>LPITEMIDLIST*</b>
     * 
     * The address of a pointer to the item identifier list to get.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ipersistidlist-getidlist
     */
    GetIDList() {
        result := ComCall(5, this, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    Query(iid) {
        if (IPersistIDList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIDList := CallbackCreate(GetMethod(implObj, "SetIDList"), flags, 2)
        this.vtbl.GetIDList := CallbackCreate(GetMethod(implObj, "GetIDList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIDList)
        CallbackFree(this.vtbl.GetIDList)
    }
}
