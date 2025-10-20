#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUICollection interface is implemented by the Ribbon framework.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuicollection
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUICollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUICollection
     * @type {Guid}
     */
    static IID => Guid("{df4f45bf-6f9d-4dd7-9d68-d8f9cd18c4db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetItem", "Add", "Insert", "RemoveAt", "Replace", "Clear"]

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-getcount
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IUnknown>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-getitem
     */
    GetItem(index, item) {
        result := ComCall(4, this, "uint", index, "ptr*", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-add
     */
    Add(item) {
        result := ComCall(5, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IUnknown} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-insert
     */
    Insert(index, item) {
        result := ComCall(6, this, "uint", index, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(7, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} indexReplaced 
     * @param {IUnknown} itemReplaceWith 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-replace
     */
    Replace(indexReplaced, itemReplaceWith) {
        result := ComCall(8, this, "uint", indexReplaced, "ptr", itemReplaceWith, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-clear
     */
    Clear() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
