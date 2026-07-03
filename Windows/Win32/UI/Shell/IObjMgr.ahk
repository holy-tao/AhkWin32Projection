#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow a client to append or remove an object from a collection of objects managed by a server object.
 * @remarks
 * This interface is implemented by objects that manage a collection of other objects. It is exported to allow clients of the object to request that objects be added to or removed from the collection.
 * 
 * Use this interface to add or delete an object from the server object's collection of managed objects.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iobjmgr
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IObjMgr extends IUnknown {
    /**
     * The interface identifier for IObjMgr
     * @type {Guid}
     */
    static IID := Guid("{00bb2761-6a77-11d0-a535-00c04fd7d062}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Append : IntPtr
        Remove : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Appends an object to the collection of managed objects.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the object to be added to the list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iobjmgr-append
     */
    Append(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Removes an object from the collection of managed objects.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the object to be removed from the list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iobjmgr-remove
     */
    Remove(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Append := CallbackCreate(GetMethod(implObj, "Append"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Append)
        CallbackFree(this.vtbl.Remove)
    }
}
