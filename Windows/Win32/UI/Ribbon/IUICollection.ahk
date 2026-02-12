#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUICollection interface is implemented by the Ribbon framework.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nn-uiribbon-iuicollection
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
     * Retrieves the number of items contained in the IUICollection.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the item count.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuicollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * Retrieves an item from the IUICollection at the specified index.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The zero-based index of <i>item</i> to retrieve from the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicollection">IUICollection</a>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * When this method returns, contains the address of a pointer variable that receives the item.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuicollection-getitem
     */
    GetItem(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &item := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(item)
    }

    /**
     * Adds an item to the end of the IUICollection.
     * @param {IUnknown} item Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the item that is added to the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicollection">IUICollection</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuicollection-add
     */
    Add(item) {
        result := ComCall(5, this, "ptr", item, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Inserts an item into the IUICollection at the specified index.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The zero-based index at which <i>item</i> is inserted into the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicollection">IUICollection</a>.
     * @param {IUnknown} item Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the item that is added to the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicollection">IUICollection</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuicollection-insert
     */
    Insert(index, item) {
        result := ComCall(6, this, "uint", index, "ptr", item, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes an item from the IUICollection at the specified index.
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * The zero-based index of the item to remove from the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicollection">IUICollection</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuicollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(7, this, "uint", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Replaces an item at the specified index of the IUICollection with another item.
     * @param {Integer} indexReplaced Type: <b>UINT32</b>
     * 
     * The zero-based index of <i>item</i> to be replaced in the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicollection">IUICollection</a>.
     * @param {IUnknown} itemReplaceWith Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Pointer to the replacement item that is added to the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuicollection">IUICollection</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuicollection-replace
     */
    Replace(indexReplaced, itemReplaceWith) {
        result := ComCall(8, this, "uint", indexReplaced, "ptr", itemReplaceWith, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes all items from the IUICollection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuicollection-clear
     */
    Clear() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
