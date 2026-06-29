#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGPathSeg.ahk" { ISVGPathSeg }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGPathSegList extends IDispatch {
    /**
     * The interface identifier for ISVGPathSegList
     * @type {Guid}
     */
    static IID := Guid("{30510510-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathSegList
     * @type {Guid}
     */
    static CLSID := Guid("{305105b4-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGPathSegList interfaces
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
            this.vtbl := ISVGPathSegList.Vtbl()
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
     * @param {ISVGPathSeg} newItem 
     * @returns {ISVGPathSeg} 
     */
    initialize(newItem) {
        result := ComCall(10, this, "ptr", newItem, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSeg(ppResult)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ISVGPathSeg} 
     */
    getItem(index) {
        result := ComCall(11, this, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSeg(ppResult)
    }

    /**
     * 
     * @param {ISVGPathSeg} newItem 
     * @param {Integer} index 
     * @returns {ISVGPathSeg} 
     */
    insertItemBefore(newItem, index) {
        result := ComCall(12, this, "ptr", newItem, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSeg(ppResult)
    }

    /**
     * 
     * @param {ISVGPathSeg} newItem 
     * @param {Integer} index 
     * @returns {ISVGPathSeg} 
     */
    replaceItem(newItem, index) {
        result := ComCall(13, this, "ptr", newItem, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSeg(ppResult)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ISVGPathSeg} 
     */
    removeItem(index) {
        result := ComCall(14, this, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSeg(ppResult)
    }

    /**
     * 
     * @param {ISVGPathSeg} newItem 
     * @returns {ISVGPathSeg} 
     */
    appendItem(newItem) {
        result := ComCall(15, this, "ptr", newItem, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSeg(ppResult)
    }

    Query(iid) {
        if (ISVGPathSegList.IID.Equals(iid)) {
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
