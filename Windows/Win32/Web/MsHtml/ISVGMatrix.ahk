#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGMatrix extends IDispatch {
    /**
     * The interface identifier for ISVGMatrix
     * @type {Guid}
     */
    static IID := Guid("{305104f6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGMatrix
     * @type {Guid}
     */
    static CLSID := Guid("{305105ae-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGMatrix interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_a            : IntPtr
        get_a            : IntPtr
        put_b            : IntPtr
        get_b            : IntPtr
        put_c            : IntPtr
        get_c            : IntPtr
        put_d            : IntPtr
        get_d            : IntPtr
        put_e            : IntPtr
        get_e            : IntPtr
        put_f            : IntPtr
        get_f            : IntPtr
        multiply         : IntPtr
        inverse          : IntPtr
        translate        : IntPtr
        scale            : IntPtr
        scaleNonUniform  : IntPtr
        rotate           : IntPtr
        rotateFromVector : IntPtr
        flipX            : IntPtr
        flipY            : IntPtr
        skewX            : IntPtr
        skewY            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGMatrix.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    a {
        get => this.get_a()
        set => this.put_a(value)
    }

    /**
     * @type {Float} 
     */
    b {
        get => this.get_b()
        set => this.put_b(value)
    }

    /**
     * @type {Float} 
     */
    c {
        get => this.get_c()
        set => this.put_c(value)
    }

    /**
     * @type {Float} 
     */
    d {
        get => this.get_d()
        set => this.put_d(value)
    }

    /**
     * @type {Float} 
     */
    e {
        get => this.get_e()
        set => this.put_e(value)
    }

    /**
     * @type {Float} 
     */
    f {
        get => this.get_f()
        set => this.put_f(value)
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_a(v) {
        result := ComCall(7, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_a() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_b(v) {
        result := ComCall(9, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_b() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_c(v) {
        result := ComCall(11, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_c() {
        result := ComCall(12, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_d(v) {
        result := ComCall(13, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_d() {
        result := ComCall(14, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_e(v) {
        result := ComCall(15, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_e() {
        result := ComCall(16, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_f(v) {
        result := ComCall(17, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_f() {
        result := ComCall(18, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {ISVGMatrix} secondMatrix 
     * @returns {ISVGMatrix} 
     */
    multiply(secondMatrix) {
        result := ComCall(19, this, "ptr", secondMatrix, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @returns {ISVGMatrix} 
     */
    inverse() {
        result := ComCall(20, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {ISVGMatrix} 
     */
    translate(x, y) {
        result := ComCall(21, this, "float", x, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @param {Float} scaleFactor 
     * @returns {ISVGMatrix} 
     */
    scale(scaleFactor) {
        result := ComCall(22, this, "float", scaleFactor, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @param {Float} scaleFactorX 
     * @param {Float} scaleFactorY 
     * @returns {ISVGMatrix} 
     */
    scaleNonUniform(scaleFactorX, scaleFactorY) {
        result := ComCall(23, this, "float", scaleFactorX, "float", scaleFactorY, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {ISVGMatrix} 
     */
    rotate(angle) {
        result := ComCall(24, this, "float", angle, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {ISVGMatrix} 
     */
    rotateFromVector(x, y) {
        result := ComCall(25, this, "float", x, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @returns {ISVGMatrix} 
     */
    flipX() {
        result := ComCall(26, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @returns {ISVGMatrix} 
     */
    flipY() {
        result := ComCall(27, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {ISVGMatrix} 
     */
    skewX(angle) {
        result := ComCall(28, this, "float", angle, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {ISVGMatrix} 
     */
    skewY(angle) {
        result := ComCall(29, this, "float", angle, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    Query(iid) {
        if (ISVGMatrix.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_a := CallbackCreate(GetMethod(implObj, "put_a"), flags, 2)
        this.vtbl.get_a := CallbackCreate(GetMethod(implObj, "get_a"), flags, 2)
        this.vtbl.put_b := CallbackCreate(GetMethod(implObj, "put_b"), flags, 2)
        this.vtbl.get_b := CallbackCreate(GetMethod(implObj, "get_b"), flags, 2)
        this.vtbl.put_c := CallbackCreate(GetMethod(implObj, "put_c"), flags, 2)
        this.vtbl.get_c := CallbackCreate(GetMethod(implObj, "get_c"), flags, 2)
        this.vtbl.put_d := CallbackCreate(GetMethod(implObj, "put_d"), flags, 2)
        this.vtbl.get_d := CallbackCreate(GetMethod(implObj, "get_d"), flags, 2)
        this.vtbl.put_e := CallbackCreate(GetMethod(implObj, "put_e"), flags, 2)
        this.vtbl.get_e := CallbackCreate(GetMethod(implObj, "get_e"), flags, 2)
        this.vtbl.put_f := CallbackCreate(GetMethod(implObj, "put_f"), flags, 2)
        this.vtbl.get_f := CallbackCreate(GetMethod(implObj, "get_f"), flags, 2)
        this.vtbl.multiply := CallbackCreate(GetMethod(implObj, "multiply"), flags, 3)
        this.vtbl.inverse := CallbackCreate(GetMethod(implObj, "inverse"), flags, 2)
        this.vtbl.translate := CallbackCreate(GetMethod(implObj, "translate"), flags, 4)
        this.vtbl.scale := CallbackCreate(GetMethod(implObj, "scale"), flags, 3)
        this.vtbl.scaleNonUniform := CallbackCreate(GetMethod(implObj, "scaleNonUniform"), flags, 4)
        this.vtbl.rotate := CallbackCreate(GetMethod(implObj, "rotate"), flags, 3)
        this.vtbl.rotateFromVector := CallbackCreate(GetMethod(implObj, "rotateFromVector"), flags, 4)
        this.vtbl.flipX := CallbackCreate(GetMethod(implObj, "flipX"), flags, 2)
        this.vtbl.flipY := CallbackCreate(GetMethod(implObj, "flipY"), flags, 2)
        this.vtbl.skewX := CallbackCreate(GetMethod(implObj, "skewX"), flags, 3)
        this.vtbl.skewY := CallbackCreate(GetMethod(implObj, "skewY"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_a)
        CallbackFree(this.vtbl.get_a)
        CallbackFree(this.vtbl.put_b)
        CallbackFree(this.vtbl.get_b)
        CallbackFree(this.vtbl.put_c)
        CallbackFree(this.vtbl.get_c)
        CallbackFree(this.vtbl.put_d)
        CallbackFree(this.vtbl.get_d)
        CallbackFree(this.vtbl.put_e)
        CallbackFree(this.vtbl.get_e)
        CallbackFree(this.vtbl.put_f)
        CallbackFree(this.vtbl.get_f)
        CallbackFree(this.vtbl.multiply)
        CallbackFree(this.vtbl.inverse)
        CallbackFree(this.vtbl.translate)
        CallbackFree(this.vtbl.scale)
        CallbackFree(this.vtbl.scaleNonUniform)
        CallbackFree(this.vtbl.rotate)
        CallbackFree(this.vtbl.rotateFromVector)
        CallbackFree(this.vtbl.flipX)
        CallbackFree(this.vtbl.flipY)
        CallbackFree(this.vtbl.skewX)
        CallbackFree(this.vtbl.skewY)
    }
}
