#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\SCOPEDATAITEM.ahk" { SCOPEDATAITEM }

/**
 * Enables snap-ins to enumerate dynamic subcontainers in the scope pane. The particular snap-in determines what qualifies as a subcontainer.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iconsolenamespace
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IConsoleNameSpace extends IUnknown {
    /**
     * The interface identifier for IConsoleNameSpace
     * @type {Guid}
     */
    static IID := Guid("{bedeb620-f24d-11cf-8afc-00aa003ca9f6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IConsoleNameSpace interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InsertItem    : IntPtr
        DeleteItem    : IntPtr
        SetItem       : IntPtr
        GetItem       : IntPtr
        GetChildItem  : IntPtr
        GetNextItem   : IntPtr
        GetParentItem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IConsoleNameSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IConsoleNameSpace2::InsertItem method enables the snap-in to insert a single item into the scope view.
     * @param {Pointer<SCOPEDATAITEM>} item A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scopedataitem">SCOPEDATAITEM</a> structure that specifies the attributes of the new scope item. On return, the 
     * ID member of the structure contains the item identifier assigned by MMC for the newly inserted item. Be aware that this value is the <b>HSCOPEITEM</b> handle of the inserted item. The snap-in should store this value in order to later manipulate the inserted item by calling methods such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-getitem">IConsoleNameSpace2::GetItem</a>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-insertitem
     */
    InsertItem(item) {
        result := ComCall(3, this, SCOPEDATAITEM.Ptr, item, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::DeleteItem method IConsoleNameSpaceenables the snap-in to delete a single item from the scope pane.
     * @param {Pointer} hItem A handle to the item whose child items are to be deleted from the scope pane. If the second argument to <b>IConsoleNameSpace2::DeleteItem</b> is set to <b>TRUE</b>, the item is also deleted.
     * @param {Integer} fDeleteThis If <b>TRUE</b>, the item specified by hItem is also deleted; otherwise, it is not.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-deleteitem
     */
    DeleteItem(hItem, fDeleteThis) {
        result := ComCall(4, this, "ptr", hItem, "int", fDeleteThis, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::SetItem method enables the snap-in to set the attributes of a single scope-view item.
     * @param {Pointer<SCOPEDATAITEM>} item A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scopedataitem">SCOPEDATAITEM</a> structure that contains 
     *       information about the item to be set in the scope pane.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-setitem
     */
    SetItem(item) {
        result := ComCall(5, this, SCOPEDATAITEM.Ptr, item, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::GetItem method enables the snap-in to retrieve some or all of a single scope item's attributes.
     * @param {Pointer<SCOPEDATAITEM>} item A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scopedataitem">SCOPEDATAITEM</a> structure that specifies the information to retrieve and receives information about the item. When the message is sent, the 
     * ID member of the structure identifies the item and the mask member specifies the attributes to retrieve.
     * 
     * If mask specifies the <b>SDI_STATE</b> value, the <b>nState</b> member contains the item's state information.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-getitem
     */
    GetItem(item) {
        result := ComCall(6, this, SCOPEDATAITEM.Ptr, item, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::GetChildItem method enables the snap-in to get the handle to a child item in the scope pane.
     * @remarks
     * If the handle to the child item is not obtained, <b>NULL</b> is returned.
     * @param {Pointer} item A handle to a parent item in the scope pane.
     * @param {Pointer<Pointer>} pItemChild A pointer to the handle that identifies the child item in the scope pane that has been returned.
     * @param {Pointer<Pointer>} pCookie A pointer to the cookie associated with the child item that has been returned.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-getchilditem
     */
    GetChildItem(item, pItemChild, pCookie) {
        pItemChildMarshal := pItemChild is VarRef ? "ptr*" : "ptr"
        pCookieMarshal := pCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", item, pItemChildMarshal, pItemChild, pCookieMarshal, pCookie, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::GetNextItem method enables the snap-in to retrieve the handle to the next item in the scope view.
     * @remarks
     * If there is no item next to the given item, <b>NULL</b> is returned.
     * @param {Pointer} item A handle to an item in the scope pane.
     * @param {Pointer<Pointer>} pItemNext A pointer to the handle to the next item in the scope pane that has been returned.
     * @param {Pointer<Pointer>} pCookie A pointer to the cookie of the next item that has been returned.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-getnextitem
     */
    GetNextItem(item, pItemNext, pCookie) {
        pItemNextMarshal := pItemNext is VarRef ? "ptr*" : "ptr"
        pCookieMarshal := pCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", item, pItemNextMarshal, pItemNext, pCookieMarshal, pCookie, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::GetParentItem method enables the snap-in to retrieve the handle to a parent item in the scope view.
     * @remarks
     * If the given item has no parent, <b>NULL</b> is returned.
     * @param {Pointer} item A handle to an item in the scope pane.
     * @param {Pointer<Pointer>} pItemParent A pointer to the handle to the parent item that is returned.
     * @param {Pointer<Pointer>} pCookie A pointer to the cookie associated with the parent item that is returned.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-getparentitem
     */
    GetParentItem(item, pItemParent, pCookie) {
        pItemParentMarshal := pItemParent is VarRef ? "ptr*" : "ptr"
        pCookieMarshal := pCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", item, pItemParentMarshal, pItemParent, pCookieMarshal, pCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IConsoleNameSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InsertItem := CallbackCreate(GetMethod(implObj, "InsertItem"), flags, 2)
        this.vtbl.DeleteItem := CallbackCreate(GetMethod(implObj, "DeleteItem"), flags, 3)
        this.vtbl.SetItem := CallbackCreate(GetMethod(implObj, "SetItem"), flags, 2)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 2)
        this.vtbl.GetChildItem := CallbackCreate(GetMethod(implObj, "GetChildItem"), flags, 4)
        this.vtbl.GetNextItem := CallbackCreate(GetMethod(implObj, "GetNextItem"), flags, 4)
        this.vtbl.GetParentItem := CallbackCreate(GetMethod(implObj, "GetParentItem"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InsertItem)
        CallbackFree(this.vtbl.DeleteItem)
        CallbackFree(this.vtbl.SetItem)
        CallbackFree(this.vtbl.GetItem)
        CallbackFree(this.vtbl.GetChildItem)
        CallbackFree(this.vtbl.GetNextItem)
        CallbackFree(this.vtbl.GetParentItem)
    }
}
