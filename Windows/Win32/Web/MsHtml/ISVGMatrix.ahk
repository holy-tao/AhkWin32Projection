#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGMatrix.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGMatrix extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGMatrix
     * @type {Guid}
     */
    static IID => Guid("{305104f6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGMatrix
     * @type {Guid}
     */
    static CLSID => Guid("{305105ae-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_a", "get_a", "put_b", "get_b", "put_c", "get_c", "put_d", "get_d", "put_e", "get_e", "put_f", "get_f", "multiply", "inverse", "translate", "scale", "scaleNonUniform", "rotate", "rotateFromVector", "flipX", "flipY", "skewX", "skewY"]

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
}
