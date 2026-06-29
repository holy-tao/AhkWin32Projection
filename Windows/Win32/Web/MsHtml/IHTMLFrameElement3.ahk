#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLFrameElement3 extends IDispatch {
    /**
     * The interface identifier for IHTMLFrameElement3
     * @type {Guid}
     */
    static IID := Guid("{3051042d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLFrameElement3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_contentDocument : IntPtr
        put_src             : IntPtr
        get_src             : IntPtr
        put_longDesc        : IntPtr
        get_longDesc        : IntPtr
        put_frameBorder     : IntPtr
        get_frameBorder     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLFrameElement3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    contentDocument {
        get => this.get_contentDocument()
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
    longDesc {
        get => this.get_longDesc()
        set => this.put_longDesc(value)
    }

    /**
     * @type {BSTR} 
     */
    frameBorder {
        get => this.get_frameBorder()
        set => this.put_frameBorder(value)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_contentDocument() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_longDesc(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_longDesc() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_frameBorder(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_frameBorder() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLFrameElement3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_contentDocument := CallbackCreate(GetMethod(implObj, "get_contentDocument"), flags, 2)
        this.vtbl.put_src := CallbackCreate(GetMethod(implObj, "put_src"), flags, 2)
        this.vtbl.get_src := CallbackCreate(GetMethod(implObj, "get_src"), flags, 2)
        this.vtbl.put_longDesc := CallbackCreate(GetMethod(implObj, "put_longDesc"), flags, 2)
        this.vtbl.get_longDesc := CallbackCreate(GetMethod(implObj, "get_longDesc"), flags, 2)
        this.vtbl.put_frameBorder := CallbackCreate(GetMethod(implObj, "put_frameBorder"), flags, 2)
        this.vtbl.get_frameBorder := CallbackCreate(GetMethod(implObj, "get_frameBorder"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_contentDocument)
        CallbackFree(this.vtbl.put_src)
        CallbackFree(this.vtbl.get_src)
        CallbackFree(this.vtbl.put_longDesc)
        CallbackFree(this.vtbl.get_longDesc)
        CallbackFree(this.vtbl.put_frameBorder)
        CallbackFree(this.vtbl.get_frameBorder)
    }
}
