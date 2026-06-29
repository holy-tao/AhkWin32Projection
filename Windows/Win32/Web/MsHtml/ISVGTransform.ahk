#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGMatrix.ahk" { ISVGMatrix }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGTransform extends IDispatch {
    /**
     * The interface identifier for ISVGTransform
     * @type {Guid}
     */
    static IID := Guid("{305104f7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGTransform
     * @type {Guid}
     */
    static CLSID := Guid("{305105af-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGTransform interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_type      : IntPtr
        get_type      : IntPtr
        putref_matrix : IntPtr
        get_matrix    : IntPtr
        put_angle     : IntPtr
        get_angle     : IntPtr
        setMatrix     : IntPtr
        setTranslate  : IntPtr
        setScale      : IntPtr
        setRotate     : IntPtr
        setSkewX      : IntPtr
        setSkewY      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    type {
        get => this.get_type()
        set => this.put_type(value)
    }

    /**
     * @type {ISVGMatrix} 
     */
    matrix {
        get => this.get_matrix()
    }

    /**
     * @type {Float} 
     */
    angle {
        get => this.get_angle()
        set => this.put_angle(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_type(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_type() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {ISVGMatrix} v 
     * @returns {HRESULT} 
     */
    putref_matrix(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGMatrix} 
     */
    get_matrix() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGMatrix(p)
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_angle(v) {
        result := ComCall(11, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_angle() {
        result := ComCall(12, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {ISVGMatrix} _matrix 
     * @returns {HRESULT} 
     */
    setMatrix(_matrix) {
        result := ComCall(13, this, "ptr", _matrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} tx 
     * @param {Float} ty 
     * @returns {HRESULT} 
     */
    setTranslate(tx, ty) {
        result := ComCall(14, this, "float", tx, "float", ty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} sx 
     * @param {Float} sy 
     * @returns {HRESULT} 
     */
    setScale(sx, sy) {
        result := ComCall(15, this, "float", sx, "float", sy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @param {Float} cx 
     * @param {Float} _cy 
     * @returns {HRESULT} 
     */
    setRotate(angle, cx, _cy) {
        result := ComCall(16, this, "float", angle, "float", cx, "float", _cy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {HRESULT} 
     */
    setSkewX(angle) {
        result := ComCall(17, this, "float", angle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {HRESULT} 
     */
    setSkewY(angle) {
        result := ComCall(18, this, "float", angle, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISVGTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_type := CallbackCreate(GetMethod(implObj, "put_type"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.putref_matrix := CallbackCreate(GetMethod(implObj, "putref_matrix"), flags, 2)
        this.vtbl.get_matrix := CallbackCreate(GetMethod(implObj, "get_matrix"), flags, 2)
        this.vtbl.put_angle := CallbackCreate(GetMethod(implObj, "put_angle"), flags, 2)
        this.vtbl.get_angle := CallbackCreate(GetMethod(implObj, "get_angle"), flags, 2)
        this.vtbl.setMatrix := CallbackCreate(GetMethod(implObj, "setMatrix"), flags, 2)
        this.vtbl.setTranslate := CallbackCreate(GetMethod(implObj, "setTranslate"), flags, 3)
        this.vtbl.setScale := CallbackCreate(GetMethod(implObj, "setScale"), flags, 3)
        this.vtbl.setRotate := CallbackCreate(GetMethod(implObj, "setRotate"), flags, 4)
        this.vtbl.setSkewX := CallbackCreate(GetMethod(implObj, "setSkewX"), flags, 2)
        this.vtbl.setSkewY := CallbackCreate(GetMethod(implObj, "setSkewY"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_type)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.putref_matrix)
        CallbackFree(this.vtbl.get_matrix)
        CallbackFree(this.vtbl.put_angle)
        CallbackFree(this.vtbl.get_angle)
        CallbackFree(this.vtbl.setMatrix)
        CallbackFree(this.vtbl.setTranslate)
        CallbackFree(this.vtbl.setScale)
        CallbackFree(this.vtbl.setRotate)
        CallbackFree(this.vtbl.setSkewX)
        CallbackFree(this.vtbl.setSkewY)
    }
}
