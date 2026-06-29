#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLBaseFontElement extends IDispatch {
    /**
     * The interface identifier for IHTMLBaseFontElement
     * @type {Guid}
     */
    static IID := Guid("{3050f202-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLBaseFontElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f282-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLBaseFontElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_color : IntPtr
        get_color : IntPtr
        put_face  : IntPtr
        get_face  : IntPtr
        put_size  : IntPtr
        get_size  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLBaseFontElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    color {
        get => this.get_color()
        set => this.put_color(value)
    }

    /**
     * @type {BSTR} 
     */
    face {
        get => this.get_face()
        set => this.put_face(value)
    }

    /**
     * @type {Integer} 
     */
    size {
        get => this.get_size()
        set => this.put_size(value)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_color(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_color() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_face(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_face() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_size(v) {
        result := ComCall(11, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_size() {
        result := ComCall(12, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLBaseFontElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_color := CallbackCreate(GetMethod(implObj, "put_color"), flags, 2)
        this.vtbl.get_color := CallbackCreate(GetMethod(implObj, "get_color"), flags, 2)
        this.vtbl.put_face := CallbackCreate(GetMethod(implObj, "put_face"), flags, 2)
        this.vtbl.get_face := CallbackCreate(GetMethod(implObj, "get_face"), flags, 2)
        this.vtbl.put_size := CallbackCreate(GetMethod(implObj, "put_size"), flags, 2)
        this.vtbl.get_size := CallbackCreate(GetMethod(implObj, "get_size"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_color)
        CallbackFree(this.vtbl.get_color)
        CallbackFree(this.vtbl.put_face)
        CallbackFree(this.vtbl.get_face)
        CallbackFree(this.vtbl.put_size)
        CallbackFree(this.vtbl.get_size)
    }
}
