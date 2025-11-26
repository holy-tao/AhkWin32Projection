#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGMatrix.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGTransform extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGTransform
     * @type {Guid}
     */
    static IID => Guid("{305104f7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGTransform
     * @type {Guid}
     */
    static CLSID => Guid("{305105af-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_type", "get_type", "putref_matrix", "get_matrix", "put_angle", "get_angle", "setMatrix", "setTranslate", "setScale", "setRotate", "setSkewX", "setSkewY"]

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
     * @param {ISVGMatrix} matrix 
     * @returns {HRESULT} 
     */
    setMatrix(matrix) {
        result := ComCall(13, this, "ptr", matrix, "HRESULT")
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
     * @param {Float} cy 
     * @returns {HRESULT} 
     */
    setRotate(angle, cx, cy) {
        result := ComCall(16, this, "float", angle, "float", cx, "float", cy, "HRESULT")
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
}
