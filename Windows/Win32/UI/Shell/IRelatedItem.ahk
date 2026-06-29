#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that derive related items with specific relationships.
 * @remarks
 * Do not implement this interface directly. This is a base interface (other interfaces derive from it) for a set of interfaces that describes the relationship between two items, (For example <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idisplayitem">IDisplayItem</a>).  Do not query for this interface directly, for example, using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a>. Instead, use the derived interfaces.
 * 
 * An example derivation is the creation of an identity name handler. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iidentityname">IIdentityName</a>. Other interfaces that may derive from this interface include <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icurrentitem">ICurrentItem</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itransfermediumitem">ITransferMediumItem</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-irelateditem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IRelatedItem extends IUnknown {
    /**
     * The interface identifier for IRelatedItem
     * @type {Guid}
     */
    static IID := Guid("{a73ce67a-8ab1-44f1-8d43-d2fcbf6b1cd0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRelatedItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItemIDList : IntPtr
        GetItem       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRelatedItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the pointer to an item identifier list (PIDL) for the item that is related.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PIDLIST_ABSOLUTE*</b>
     * 
     * When this method returns, contains the PIDL.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irelateditem-getitemidlist
     */
    GetItemIDList() {
        result := ComCall(3, this, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    /**
     * Gets the IShellItem that is related to this item.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface for the item that is related to this item.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-irelateditem-getitem
     */
    GetItem() {
        result := ComCall(4, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    Query(iid) {
        if (IRelatedItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemIDList := CallbackCreate(GetMethod(implObj, "GetItemIDList"), flags, 2)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemIDList)
        CallbackFree(this.vtbl.GetItem)
    }
}
