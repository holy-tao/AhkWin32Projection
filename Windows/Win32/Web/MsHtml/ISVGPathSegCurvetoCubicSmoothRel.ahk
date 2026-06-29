#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGPathSegCurvetoCubicSmoothRel extends IDispatch {
    /**
     * The interface identifier for ISVGPathSegCurvetoCubicSmoothRel
     * @type {Guid}
     */
    static IID := Guid("{3051050d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathSegCurvetoCubicSmoothRel
     * @type {Guid}
     */
    static CLSID := Guid("{305105c1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGPathSegCurvetoCubicSmoothRel interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_x  : IntPtr
        get_x  : IntPtr
        put_y  : IntPtr
        get_y  : IntPtr
        put_x2 : IntPtr
        get_x2 : IntPtr
        put_y2 : IntPtr
        get_y2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGPathSegCurvetoCubicSmoothRel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    x {
        get => this.get_x()
        set => this.put_x(value)
    }

    /**
     * @type {Float} 
     */
    y {
        get => this.get_y()
        set => this.put_y(value)
    }

    /**
     * @type {Float} 
     */
    x2 {
        get => this.get_x2()
        set => this.put_x2(value)
    }

    /**
     * @type {Float} 
     */
    y2 {
        get => this.get_y2()
        set => this.put_y2(value)
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_x(v) {
        result := ComCall(7, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_x() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_y(v) {
        result := ComCall(9, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_y() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_x2(v) {
        result := ComCall(11, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_x2() {
        result := ComCall(12, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_y2(v) {
        result := ComCall(13, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_y2() {
        result := ComCall(14, this, "float*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGPathSegCurvetoCubicSmoothRel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_x := CallbackCreate(GetMethod(implObj, "put_x"), flags, 2)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.put_y := CallbackCreate(GetMethod(implObj, "put_y"), flags, 2)
        this.vtbl.get_y := CallbackCreate(GetMethod(implObj, "get_y"), flags, 2)
        this.vtbl.put_x2 := CallbackCreate(GetMethod(implObj, "put_x2"), flags, 2)
        this.vtbl.get_x2 := CallbackCreate(GetMethod(implObj, "get_x2"), flags, 2)
        this.vtbl.put_y2 := CallbackCreate(GetMethod(implObj, "put_y2"), flags, 2)
        this.vtbl.get_y2 := CallbackCreate(GetMethod(implObj, "get_y2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_x)
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.put_y)
        CallbackFree(this.vtbl.get_y)
        CallbackFree(this.vtbl.put_x2)
        CallbackFree(this.vtbl.get_x2)
        CallbackFree(this.vtbl.put_y2)
        CallbackFree(this.vtbl.get_y2)
    }
}
