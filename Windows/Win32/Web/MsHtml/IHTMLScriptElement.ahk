#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLScriptElement extends IDispatch {
    /**
     * The interface identifier for IHTMLScriptElement
     * @type {Guid}
     */
    static IID := Guid("{3050f28b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLScriptElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f28c-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLScriptElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_src        : IntPtr
        get_src        : IntPtr
        put_htmlFor    : IntPtr
        get_htmlFor    : IntPtr
        put_event      : IntPtr
        get_event      : IntPtr
        put_text       : IntPtr
        get_text       : IntPtr
        put_defer      : IntPtr
        get_defer      : IntPtr
        get_readyState : IntPtr
        put_onerror    : IntPtr
        get_onerror    : IntPtr
        put_type       : IntPtr
        get_type       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLScriptElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    src {
        get => this.get_src()
        set => this.put_src(value)
    }

    /**
     * @type {BSTR} 
     */
    htmlFor {
        get => this.get_htmlFor()
        set => this.put_htmlFor(value)
    }

    /**
     * @type {BSTR} 
     */
    event {
        get => this.get_event()
        set => this.put_event(value)
    }

    /**
     * @type {BSTR} 
     */
    text {
        get => this.get_text()
        set => this.put_text(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    defer {
        get => this.get_defer()
        set => this.put_defer(value)
    }

    /**
     * @type {BSTR} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {VARIANT} 
     */
    onerror {
        get => this.get_onerror()
        set => this.put_onerror(value)
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
        set => this.put_type(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_htmlFor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_htmlFor() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_event(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_event() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_text(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_text() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_defer(v) {
        result := ComCall(15, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_defer() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_readyState() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(18, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_type(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLScriptElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_src := CallbackCreate(GetMethod(implObj, "put_src"), flags, 2)
        this.vtbl.get_src := CallbackCreate(GetMethod(implObj, "get_src"), flags, 2)
        this.vtbl.put_htmlFor := CallbackCreate(GetMethod(implObj, "put_htmlFor"), flags, 2)
        this.vtbl.get_htmlFor := CallbackCreate(GetMethod(implObj, "get_htmlFor"), flags, 2)
        this.vtbl.put_event := CallbackCreate(GetMethod(implObj, "put_event"), flags, 2)
        this.vtbl.get_event := CallbackCreate(GetMethod(implObj, "get_event"), flags, 2)
        this.vtbl.put_text := CallbackCreate(GetMethod(implObj, "put_text"), flags, 2)
        this.vtbl.get_text := CallbackCreate(GetMethod(implObj, "get_text"), flags, 2)
        this.vtbl.put_defer := CallbackCreate(GetMethod(implObj, "put_defer"), flags, 2)
        this.vtbl.get_defer := CallbackCreate(GetMethod(implObj, "get_defer"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.put_onerror := CallbackCreate(GetMethod(implObj, "put_onerror"), flags, 2)
        this.vtbl.get_onerror := CallbackCreate(GetMethod(implObj, "get_onerror"), flags, 2)
        this.vtbl.put_type := CallbackCreate(GetMethod(implObj, "put_type"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_src)
        CallbackFree(this.vtbl.get_src)
        CallbackFree(this.vtbl.put_htmlFor)
        CallbackFree(this.vtbl.get_htmlFor)
        CallbackFree(this.vtbl.put_event)
        CallbackFree(this.vtbl.get_event)
        CallbackFree(this.vtbl.put_text)
        CallbackFree(this.vtbl.get_text)
        CallbackFree(this.vtbl.put_defer)
        CallbackFree(this.vtbl.get_defer)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.put_onerror)
        CallbackFree(this.vtbl.get_onerror)
        CallbackFree(this.vtbl.put_type)
        CallbackFree(this.vtbl.get_type)
    }
}
