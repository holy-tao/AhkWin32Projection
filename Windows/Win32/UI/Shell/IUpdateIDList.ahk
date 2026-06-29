#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to update the ITEMIDLIST of the child of a folder object.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement this interface for an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> implementation to update the provided child <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iupdateidlist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IUpdateIDList extends IUnknown {
    /**
     * The interface identifier for IUpdateIDList
     * @type {Guid}
     */
    static IID := Guid("{6589b6d2-5f8d-4b9e-b7e0-23cdd9717d8c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateIDList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Update : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateIDList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Updates the provided child ITEMIDLIST based on the parameters specified by the provided IBindCtx.
     * @remarks
     * If <i>pbc</i> is <b>NULL</b> or does not contain any parameters that apply to the current Shell folder, <i>ppidlOut</i> points to the same <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a>  as <i>pidlIn</i>.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on a bind context object. Used to specify parameters for updating the child <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a>. This value can be <b>NULL</b>.
     * @param {Pointer<ITEMIDLIST>} pidlIn Type: <b>PCUITEMID_CHILD</b>
     * 
     * The child <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a>.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PITEMID_CHILD*</b>
     * 
     * A pointer to the child <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> relative to the parent folder.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iupdateidlist-update
     */
    Update(pbc, pidlIn) {
        result := ComCall(3, this, "ptr", pbc, ITEMIDLIST.Ptr, pidlIn, "ptr*", &ppidlOut := 0, "HRESULT")
        return ppidlOut
    }

    Query(iid) {
        if (IUpdateIDList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Update)
    }
}
