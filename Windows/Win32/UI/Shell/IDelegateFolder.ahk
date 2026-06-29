#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IMalloc.ahk" { IMalloc }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method through which a delegate folder is given the IMalloc interface required to allocate and free item IDs.
 * @remarks
 * The IDs allocated by the delegate folder are in the form of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-delegateitemid">DELEGATEITEMID</a> structures. It is the delegate's job to pack its data into the pointer to an item identifier list (PIDL) in the <b>DELEGATEITEMID</b> format.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idelegatefolder
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDelegateFolder extends IUnknown {
    /**
     * The interface identifier for IDelegateFolder
     * @type {Guid}
     */
    static IID := Guid("{add8ba80-002b-11d0-8f0f-00c04fd7d062}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDelegateFolder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetItemAlloc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDelegateFolder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides the delegate folder an IMalloc interface used to allocate and free item IDs.
     * @param {IMalloc} pmalloc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idelegatefolder-setitemalloc
     */
    SetItemAlloc(pmalloc) {
        result := ComCall(3, this, "ptr", pmalloc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDelegateFolder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetItemAlloc := CallbackCreate(GetMethod(implObj, "SetItemAlloc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetItemAlloc)
    }
}
