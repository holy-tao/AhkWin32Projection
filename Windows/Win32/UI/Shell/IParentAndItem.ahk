#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellFolder.ahk" { IShellFolder }

/**
 * Exposes methods that get and set the parent and the parent's child ID. While IParentAndItem is typically implemented on IShellItems, it is not specific to IShellItem.
 * @remarks
 * The performance improvement using this interface can be noted in comparison with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ipersistidlist">IPersistIDList</a>, an interface that uses absolute item identifier lists. Subsequent operations on objects that implement <b>IPersistIDList</b> may require <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> calls, and these calls may impact performance.  In the case of IShellItems and participating IShellFolders that implement <b>IParentAndItem</b>, the parent <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> may already be cached. By implementing <b>IParentAndItem</b> and then getting/setting the parent <b>IShellFolder</b> directly, the call to <b>IShellFolder::BindToObject</b> on the item identifier list to retrieve the <b>IShellFolder</b> interface is eliminated.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iparentanditem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IParentAndItem extends IUnknown {
    /**
     * The interface identifier for IParentAndItem
     * @type {Guid}
     */
    static IID := Guid("{b3a4b685-b685-4805-99d9-5dead2873236}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IParentAndItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetParentAndItem : IntPtr
        GetParentAndItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IParentAndItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the parent of an item and the parent's child ID.
     * @remarks
     * While <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iparentanditem">IParentAndItem</a> is typically implemented on IShellItems, it is not specific to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @param {Pointer<ITEMIDLIST>} pidlParent Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A pointer of the parent.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> that is the parent.
     * @param {Pointer<ITEMIDLIST>} pidlChild Type: <b>PCUITEMID_CHILD</b>
     * 
     * A PIDL that is a child relative to <i>psf</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iparentanditem-setparentanditem
     */
    SetParentAndItem(pidlParent, psf, pidlChild) {
        result := ComCall(3, this, ITEMIDLIST.Ptr, pidlParent, "ptr", psf, ITEMIDLIST.Ptr, pidlChild, "HRESULT")
        return result
    }

    /**
     * Gets the parent of an item and the parent's child ID.
     * @remarks
     * While <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iparentanditem">IParentAndItem</a> is typically implemented on IShellItems, it is not specific to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidlParent Type: <b>PIDLIST_ABSOLUTE*</b>
     * 
     * When this method returns, contains the address of a PIDL that specifies the parent.
     * @param {Pointer<IShellFolder>} ppsf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> that is the parent.
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidlChild Type: <b>PITEMID_CHILD*</b>
     * 
     * When this method returns, contains the address of a child PIDL that identifies the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iparentanditem">IParentAndItem</a> object relative to that specified by <i>ppsf</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iparentanditem-getparentanditem
     */
    GetParentAndItem(ppidlParent, ppsf, ppidlChild) {
        ppidlParentMarshal := ppidlParent is VarRef ? "ptr*" : "ptr"
        ppidlChildMarshal := ppidlChild is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppidlParentMarshal, ppidlParent, IShellFolder.Ptr, ppsf, ppidlChildMarshal, ppidlChild, "HRESULT")
        return result
    }

    Query(iid) {
        if (IParentAndItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetParentAndItem := CallbackCreate(GetMethod(implObj, "SetParentAndItem"), flags, 4)
        this.vtbl.GetParentAndItem := CallbackCreate(GetMethod(implObj, "GetParentAndItem"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetParentAndItem)
        CallbackFree(this.vtbl.GetParentAndItem)
    }
}
