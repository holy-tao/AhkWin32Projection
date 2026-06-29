#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLVideoElement extends IDispatch {
    /**
     * The interface identifier for IHTMLVideoElement
     * @type {Guid}
     */
    static IID := Guid("{30510709-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLVideoElement
     * @type {Guid}
     */
    static CLSID := Guid("{3051070f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLVideoElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_width       : IntPtr
        get_width       : IntPtr
        put_height      : IntPtr
        get_height      : IntPtr
        get_videoWidth  : IntPtr
        get_videoHeight : IntPtr
        put_poster      : IntPtr
        get_poster      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLVideoElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * @type {Integer} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * @type {Integer} 
     */
    videoWidth {
        get => this.get_videoWidth()
    }

    /**
     * @type {Integer} 
     */
    videoHeight {
        get => this.get_videoHeight()
    }

    /**
     * @type {BSTR} 
     */
    poster {
        get => this.get_poster()
        set => this.put_poster(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_videoWidth() {
        result := ComCall(11, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_videoHeight() {
        result := ComCall(12, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_poster(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_poster() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLVideoElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.get_videoWidth := CallbackCreate(GetMethod(implObj, "get_videoWidth"), flags, 2)
        this.vtbl.get_videoHeight := CallbackCreate(GetMethod(implObj, "get_videoHeight"), flags, 2)
        this.vtbl.put_poster := CallbackCreate(GetMethod(implObj, "put_poster"), flags, 2)
        this.vtbl.get_poster := CallbackCreate(GetMethod(implObj, "get_poster"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.get_videoWidth)
        CallbackFree(this.vtbl.get_videoHeight)
        CallbackFree(this.vtbl.put_poster)
        CallbackFree(this.vtbl.get_poster)
    }
}
