#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLMetaElement extends IDispatch {
    /**
     * The interface identifier for IHTMLMetaElement
     * @type {Guid}
     */
    static IID := Guid("{3050f203-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLMetaElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f275-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLMetaElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_httpEquiv : IntPtr
        get_httpEquiv : IntPtr
        put_content   : IntPtr
        get_content   : IntPtr
        put_name      : IntPtr
        get_name      : IntPtr
        put_url       : IntPtr
        get_url       : IntPtr
        put_charset   : IntPtr
        get_charset   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLMetaElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    httpEquiv {
        get => this.get_httpEquiv()
        set => this.put_httpEquiv(value)
    }

    /**
     * @type {BSTR} 
     */
    content {
        get => this.get_content()
        set => this.put_content(value)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {BSTR} 
     */
    url {
        get => this.get_url()
        set => this.put_url(value)
    }

    /**
     * @type {BSTR} 
     */
    charset {
        get => this.get_charset()
        set => this.put_charset(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_httpEquiv(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_httpEquiv() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_content(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_content() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_url(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_url() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_charset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_charset() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLMetaElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_httpEquiv := CallbackCreate(GetMethod(implObj, "put_httpEquiv"), flags, 2)
        this.vtbl.get_httpEquiv := CallbackCreate(GetMethod(implObj, "get_httpEquiv"), flags, 2)
        this.vtbl.put_content := CallbackCreate(GetMethod(implObj, "put_content"), flags, 2)
        this.vtbl.get_content := CallbackCreate(GetMethod(implObj, "get_content"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_url := CallbackCreate(GetMethod(implObj, "put_url"), flags, 2)
        this.vtbl.get_url := CallbackCreate(GetMethod(implObj, "get_url"), flags, 2)
        this.vtbl.put_charset := CallbackCreate(GetMethod(implObj, "put_charset"), flags, 2)
        this.vtbl.get_charset := CallbackCreate(GetMethod(implObj, "get_charset"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_httpEquiv)
        CallbackFree(this.vtbl.get_httpEquiv)
        CallbackFree(this.vtbl.put_content)
        CallbackFree(this.vtbl.get_content)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_url)
        CallbackFree(this.vtbl.get_url)
        CallbackFree(this.vtbl.put_charset)
        CallbackFree(this.vtbl.get_charset)
    }
}
