#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGPathSegCurvetoQuadraticRel extends IDispatch {
    /**
     * The interface identifier for ISVGPathSegCurvetoQuadraticRel
     * @type {Guid}
     */
    static IID := Guid("{30510505-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathSegCurvetoQuadraticRel
     * @type {Guid}
     */
    static CLSID := Guid("{305105c3-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGPathSegCurvetoQuadraticRel interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_x  : IntPtr
        get_x  : IntPtr
        put_y  : IntPtr
        get_y  : IntPtr
        put_x1 : IntPtr
        get_x1 : IntPtr
        put_y1 : IntPtr
        get_y1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGPathSegCurvetoQuadraticRel.Vtbl()
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
    x1 {
        get => this.get_x1()
        set => this.put_x1(value)
    }

    /**
     * @type {Float} 
     */
    y1 {
        get => this.get_y1()
        set => this.put_y1(value)
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
    put_x1(v) {
        result := ComCall(11, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_x1() {
        result := ComCall(12, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_y1(v) {
        result := ComCall(13, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_y1() {
        result := ComCall(14, this, "float*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGPathSegCurvetoQuadraticRel.IID.Equals(iid)) {
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
        this.vtbl.put_x1 := CallbackCreate(GetMethod(implObj, "put_x1"), flags, 2)
        this.vtbl.get_x1 := CallbackCreate(GetMethod(implObj, "get_x1"), flags, 2)
        this.vtbl.put_y1 := CallbackCreate(GetMethod(implObj, "put_y1"), flags, 2)
        this.vtbl.get_y1 := CallbackCreate(GetMethod(implObj, "get_y1"), flags, 2)
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
        CallbackFree(this.vtbl.put_x1)
        CallbackFree(this.vtbl.get_x1)
        CallbackFree(this.vtbl.put_y1)
        CallbackFree(this.vtbl.get_y1)
    }
}
