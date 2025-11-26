#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables snap-ins to enumerate dynamic subcontainers in the scope pane. The particular snap-in determines what qualifies as a subcontainer.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsolenamespace
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsoleNameSpace extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConsoleNameSpace
     * @type {Guid}
     */
    static IID => Guid("{bedeb620-f24d-11cf-8afc-00aa003ca9f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertItem", "DeleteItem", "SetItem", "GetItem", "GetChildItem", "GetNextItem", "GetParentItem"]

    /**
     * The IConsoleNameSpace2::InsertItem method enables the snap-in to insert a single item into the scope view.
     * @param {Pointer<SCOPEDATAITEM>} item A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-scopedataitem">SCOPEDATAITEM</a> structure that specifies the attributes of the new scope item. On return, the 
     * ID member of the structure contains the item identifier assigned by MMC for the newly inserted item. Be aware that this value is the <b>HSCOPEITEM</b> handle of the inserted item. The snap-in should store this value in order to later manipulate the inserted item by calling methods such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsolenamespace-getitem">IConsoleNameSpace2::GetItem</a>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolenamespace-insertitem
     */
    InsertItem(item) {
        result := ComCall(3, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::DeleteItem method IConsoleNameSpaceenables the snap-in to delete a single item from the scope pane.
     * @param {Pointer} hItem A handle to the item whose child items are to be deleted from the scope pane. If the second argument to <b>IConsoleNameSpace2::DeleteItem</b> is set to <b>TRUE</b>, the item is also deleted.
     * @param {Integer} fDeleteThis If <b>TRUE</b>, the item specified by hItem is also deleted; otherwise, it is not.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolenamespace-deleteitem
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
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolenamespace-setitem
     */
    SetItem(item) {
        result := ComCall(5, this, "ptr", item, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolenamespace-getitem
     */
    GetItem(item) {
        result := ComCall(6, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::GetChildItem method enables the snap-in to get the handle to a child item in the scope pane.
     * @param {Pointer} item A handle to a parent item in the scope pane.
     * @param {Pointer<Pointer>} pItemChild A pointer to the handle that identifies the child item in the scope pane that has been returned.
     * @param {Pointer<Pointer>} pCookie A pointer to the cookie associated with the child item that has been returned.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolenamespace-getchilditem
     */
    GetChildItem(item, pItemChild, pCookie) {
        pItemChildMarshal := pItemChild is VarRef ? "ptr*" : "ptr"
        pCookieMarshal := pCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", item, pItemChildMarshal, pItemChild, pCookieMarshal, pCookie, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::GetNextItem method enables the snap-in to retrieve the handle to the next item in the scope view.
     * @param {Pointer} item A handle to an item in the scope pane.
     * @param {Pointer<Pointer>} pItemNext A pointer to the handle to the next item in the scope pane that has been returned.
     * @param {Pointer<Pointer>} pCookie A pointer to the cookie of the next item that has been returned.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolenamespace-getnextitem
     */
    GetNextItem(item, pItemNext, pCookie) {
        pItemNextMarshal := pItemNext is VarRef ? "ptr*" : "ptr"
        pCookieMarshal := pCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", item, pItemNextMarshal, pItemNext, pCookieMarshal, pCookie, "HRESULT")
        return result
    }

    /**
     * The IConsoleNameSpace2::GetParentItem method enables the snap-in to retrieve the handle to a parent item in the scope view.
     * @param {Pointer} item A handle to an item in the scope pane.
     * @param {Pointer<Pointer>} pItemParent A pointer to the handle to the parent item that is returned.
     * @param {Pointer<Pointer>} pCookie A pointer to the cookie associated with the parent item that is returned.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iconsolenamespace-getparentitem
     */
    GetParentItem(item, pItemParent, pCookie) {
        pItemParentMarshal := pItemParent is VarRef ? "ptr*" : "ptr"
        pCookieMarshal := pCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", item, pItemParentMarshal, pItemParent, pCookieMarshal, pCookie, "HRESULT")
        return result
    }
}
