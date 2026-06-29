#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGStyleElement extends IDispatch {
    /**
     * The interface identifier for ISVGStyleElement
     * @type {Guid}
     */
    static IID := Guid("{305104f3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGStyleElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105d1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGStyleElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_type  : IntPtr
        get_type  : IntPtr
        put_media : IntPtr
        get_media : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGStyleElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
        set => this.put_type(value)
    }

    /**
     * @type {BSTR} 
     */
    media {
        get => this.get_media()
        set => this.put_media(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_type(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_media() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGStyleElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_type := CallbackCreate(GetMethod(implObj, "put_type"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.put_media := CallbackCreate(GetMethod(implObj, "put_media"), flags, 2)
        this.vtbl.get_media := CallbackCreate(GetMethod(implObj, "get_media"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_type)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.put_media)
        CallbackFree(this.vtbl.get_media)
    }
}
