#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGLangSpace extends IDispatch {
    /**
     * The interface identifier for ISVGLangSpace
     * @type {Guid}
     */
    static IID := Guid("{305104de-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGLangSpace interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_xmllang  : IntPtr
        get_xmllang  : IntPtr
        put_xmlspace : IntPtr
        get_xmlspace : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGLangSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    xmllang {
        get => this.get_xmllang()
        set => this.put_xmllang(value)
    }

    /**
     * @type {BSTR} 
     */
    xmlspace {
        get => this.get_xmlspace()
        set => this.put_xmlspace(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_xmllang(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xmllang() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_xmlspace(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_xmlspace() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGLangSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_xmllang := CallbackCreate(GetMethod(implObj, "put_xmllang"), flags, 2)
        this.vtbl.get_xmllang := CallbackCreate(GetMethod(implObj, "get_xmllang"), flags, 2)
        this.vtbl.put_xmlspace := CallbackCreate(GetMethod(implObj, "put_xmlspace"), flags, 2)
        this.vtbl.get_xmlspace := CallbackCreate(GetMethod(implObj, "get_xmlspace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_xmllang)
        CallbackFree(this.vtbl.get_xmllang)
        CallbackFree(this.vtbl.put_xmlspace)
        CallbackFree(this.vtbl.get_xmlspace)
    }
}
