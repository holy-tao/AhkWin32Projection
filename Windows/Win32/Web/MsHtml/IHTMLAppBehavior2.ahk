#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLAppBehavior2 extends IDispatch {
    /**
     * The interface identifier for IHTMLAppBehavior2
     * @type {Guid}
     */
    static IID := Guid("{3050f5c9-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLAppBehavior2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_contextMenu : IntPtr
        get_contextMenu : IntPtr
        put_innerBorder : IntPtr
        get_innerBorder : IntPtr
        put_scroll      : IntPtr
        get_scroll      : IntPtr
        put_scrollFlat  : IntPtr
        get_scrollFlat  : IntPtr
        put_selection   : IntPtr
        get_selection   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLAppBehavior2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    contextMenu {
        get => this.get_contextMenu()
        set => this.put_contextMenu(value)
    }

    /**
     * @type {BSTR} 
     */
    innerBorder {
        get => this.get_innerBorder()
        set => this.put_innerBorder(value)
    }

    /**
     * @type {BSTR} 
     */
    scroll {
        get => this.get_scroll()
        set => this.put_scroll(value)
    }

    /**
     * @type {BSTR} 
     */
    scrollFlat {
        get => this.get_scrollFlat()
        set => this.put_scrollFlat(value)
    }

    /**
     * @type {BSTR} 
     */
    selection {
        get => this.get_selection()
        set => this.put_selection(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_contextMenu(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_contextMenu() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_innerBorder(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_innerBorder() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_scroll(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_scroll() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_scrollFlat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_scrollFlat() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_selection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_selection() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLAppBehavior2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_contextMenu := CallbackCreate(GetMethod(implObj, "put_contextMenu"), flags, 2)
        this.vtbl.get_contextMenu := CallbackCreate(GetMethod(implObj, "get_contextMenu"), flags, 2)
        this.vtbl.put_innerBorder := CallbackCreate(GetMethod(implObj, "put_innerBorder"), flags, 2)
        this.vtbl.get_innerBorder := CallbackCreate(GetMethod(implObj, "get_innerBorder"), flags, 2)
        this.vtbl.put_scroll := CallbackCreate(GetMethod(implObj, "put_scroll"), flags, 2)
        this.vtbl.get_scroll := CallbackCreate(GetMethod(implObj, "get_scroll"), flags, 2)
        this.vtbl.put_scrollFlat := CallbackCreate(GetMethod(implObj, "put_scrollFlat"), flags, 2)
        this.vtbl.get_scrollFlat := CallbackCreate(GetMethod(implObj, "get_scrollFlat"), flags, 2)
        this.vtbl.put_selection := CallbackCreate(GetMethod(implObj, "put_selection"), flags, 2)
        this.vtbl.get_selection := CallbackCreate(GetMethod(implObj, "get_selection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_contextMenu)
        CallbackFree(this.vtbl.get_contextMenu)
        CallbackFree(this.vtbl.put_innerBorder)
        CallbackFree(this.vtbl.get_innerBorder)
        CallbackFree(this.vtbl.put_scroll)
        CallbackFree(this.vtbl.get_scroll)
        CallbackFree(this.vtbl.put_scrollFlat)
        CallbackFree(this.vtbl.get_scrollFlat)
        CallbackFree(this.vtbl.put_selection)
        CallbackFree(this.vtbl.get_selection)
    }
}
