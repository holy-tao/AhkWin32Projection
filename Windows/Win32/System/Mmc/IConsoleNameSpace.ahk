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
     * 
     * @param {Pointer<SCOPEDATAITEM>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-insertitem
     */
    InsertItem(item) {
        result := ComCall(3, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hItem 
     * @param {Integer} fDeleteThis 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-deleteitem
     */
    DeleteItem(hItem, fDeleteThis) {
        result := ComCall(4, this, "ptr", hItem, "int", fDeleteThis, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SCOPEDATAITEM>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-setitem
     */
    SetItem(item) {
        result := ComCall(5, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SCOPEDATAITEM>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-getitem
     */
    GetItem(item) {
        result := ComCall(6, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} item 
     * @param {Pointer<Pointer>} pItemChild 
     * @param {Pointer<Pointer>} pCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-getchilditem
     */
    GetChildItem(item, pItemChild, pCookie) {
        pItemChildMarshal := pItemChild is VarRef ? "ptr*" : "ptr"
        pCookieMarshal := pCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", item, pItemChildMarshal, pItemChild, pCookieMarshal, pCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} item 
     * @param {Pointer<Pointer>} pItemNext 
     * @param {Pointer<Pointer>} pCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-getnextitem
     */
    GetNextItem(item, pItemNext, pCookie) {
        pItemNextMarshal := pItemNext is VarRef ? "ptr*" : "ptr"
        pCookieMarshal := pCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", item, pItemNextMarshal, pItemNext, pCookieMarshal, pCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} item 
     * @param {Pointer<Pointer>} pItemParent 
     * @param {Pointer<Pointer>} pCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iconsolenamespace-getparentitem
     */
    GetParentItem(item, pItemParent, pCookie) {
        pItemParentMarshal := pItemParent is VarRef ? "ptr*" : "ptr"
        pCookieMarshal := pCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", item, pItemParentMarshal, pItemParent, pCookieMarshal, pCookie, "HRESULT")
        return result
    }
}
