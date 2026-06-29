#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * IInsertItem may be altered or unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iinsertitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInsertItem extends IUnknown {
    /**
     * The interface identifier for IInsertItem
     * @type {Guid}
     */
    static IID := Guid("{d2b57227-3d23-4b95-93c0-492bd454c356}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInsertItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InsertItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInsertItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds an ITEMIDLIST structure to a list of such structures.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure that corresponds to an item in a Shell folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iinsertitem-insertitem
     */
    InsertItem(pidl) {
        result := ComCall(3, this, ITEMIDLIST.Ptr, pidl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInsertItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InsertItem := CallbackCreate(GetMethod(implObj, "InsertItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InsertItem)
    }
}
