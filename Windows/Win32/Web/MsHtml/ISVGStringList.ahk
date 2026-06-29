#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGStringList extends IDispatch {
    /**
     * The interface identifier for ISVGStringList
     * @type {Guid}
     */
    static IID := Guid("{305104c8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGStringList
     * @type {Guid}
     */
    static CLSID := Guid("{3051058d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGStringList interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_numberOfItems : IntPtr
        get_numberOfItems : IntPtr
        clear             : IntPtr
        initialize        : IntPtr
        getItem           : IntPtr
        insertItemBefore  : IntPtr
        replaceItem       : IntPtr
        removeItem        : IntPtr
        appendItem        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGStringList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    numberOfItems {
        get => this.get_numberOfItems()
        set => this.put_numberOfItems(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_numberOfItems(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_numberOfItems() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clear() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} newItem 
     * @returns {BSTR} 
     */
    initialize(newItem) {
        newItem := newItem is String ? BSTR.Alloc(newItem).Value : newItem

        ppResult := BSTR.Owned()
        result := ComCall(10, this, BSTR, newItem, BSTR.Ptr, ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    getItem(index) {
        ppResult := BSTR.Owned()
        result := ComCall(11, this, "int", index, BSTR.Ptr, ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {BSTR} newItem 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    insertItemBefore(newItem, index) {
        newItem := newItem is String ? BSTR.Alloc(newItem).Value : newItem

        ppResult := BSTR.Owned()
        result := ComCall(12, this, BSTR, newItem, "int", index, BSTR.Ptr, ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {BSTR} newItem 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    replaceItem(newItem, index) {
        newItem := newItem is String ? BSTR.Alloc(newItem).Value : newItem

        ppResult := BSTR.Owned()
        result := ComCall(13, this, BSTR, newItem, "int", index, BSTR.Ptr, ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    removeItem(index) {
        ppResult := BSTR.Owned()
        result := ComCall(14, this, "int", index, BSTR.Ptr, ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {BSTR} newItem 
     * @returns {BSTR} 
     */
    appendItem(newItem) {
        newItem := newItem is String ? BSTR.Alloc(newItem).Value : newItem

        ppResult := BSTR.Owned()
        result := ComCall(15, this, BSTR, newItem, BSTR.Ptr, ppResult, "HRESULT")
        return ppResult
    }

    Query(iid) {
        if (ISVGStringList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_numberOfItems := CallbackCreate(GetMethod(implObj, "put_numberOfItems"), flags, 2)
        this.vtbl.get_numberOfItems := CallbackCreate(GetMethod(implObj, "get_numberOfItems"), flags, 2)
        this.vtbl.clear := CallbackCreate(GetMethod(implObj, "clear"), flags, 1)
        this.vtbl.initialize := CallbackCreate(GetMethod(implObj, "initialize"), flags, 3)
        this.vtbl.getItem := CallbackCreate(GetMethod(implObj, "getItem"), flags, 3)
        this.vtbl.insertItemBefore := CallbackCreate(GetMethod(implObj, "insertItemBefore"), flags, 4)
        this.vtbl.replaceItem := CallbackCreate(GetMethod(implObj, "replaceItem"), flags, 4)
        this.vtbl.removeItem := CallbackCreate(GetMethod(implObj, "removeItem"), flags, 3)
        this.vtbl.appendItem := CallbackCreate(GetMethod(implObj, "appendItem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_numberOfItems)
        CallbackFree(this.vtbl.get_numberOfItems)
        CallbackFree(this.vtbl.clear)
        CallbackFree(this.vtbl.initialize)
        CallbackFree(this.vtbl.getItem)
        CallbackFree(this.vtbl.insertItemBefore)
        CallbackFree(this.vtbl.replaceItem)
        CallbackFree(this.vtbl.removeItem)
        CallbackFree(this.vtbl.appendItem)
    }
}
