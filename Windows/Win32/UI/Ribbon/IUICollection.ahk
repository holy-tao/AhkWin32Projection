#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUICollection interface is implemented by the Ribbon framework.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuicollection
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUICollection extends IUnknown {
    /**
     * The interface identifier for IUICollection
     * @type {Guid}
     */
    static IID := Guid("{df4f45bf-6f9d-4dd7-9d68-d8f9cd18c4db}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUICollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount : IntPtr
        GetItem  : IntPtr
        Add      : IntPtr
        Insert   : IntPtr
        RemoveAt : IntPtr
        Replace  : IntPtr
        Clear    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUICollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of items contained in the IUICollection.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the item count.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-getitem
     */
    GetItem(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &item := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-add
     */
    Add(item) {
        result := ComCall(5, this, "ptr", item, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-insert
     */
    Insert(index, item) {
        result := ComCall(6, this, "uint", index, "ptr", item, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(7, this, "uint", index, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-replace
     */
    Replace(indexReplaced, itemReplaceWith) {
        result := ComCall(8, this, "uint", indexReplaced, "ptr", itemReplaceWith, "HRESULT")
        return result
    }

    /**
     * Deletes all items from the IUICollection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicollection-clear
     */
    Clear() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUICollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Insert := CallbackCreate(GetMethod(implObj, "Insert"), flags, 3)
        this.vtbl.RemoveAt := CallbackCreate(GetMethod(implObj, "RemoveAt"), flags, 2)
        this.vtbl.Replace := CallbackCreate(GetMethod(implObj, "Replace"), flags, 3)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetItem)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Insert)
        CallbackFree(this.vtbl.RemoveAt)
        CallbackFree(this.vtbl.Replace)
        CallbackFree(this.vtbl.Clear)
    }
}
