#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_type(p) {
        result := ComCall(8, this, "short*", p, "HRESULT")
        return result
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
     * @param {Pointer<ISVGMatrix>} p 
     * @returns {HRESULT} 
     */
    get_matrix(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
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
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_angle(p) {
        result := ComCall(12, this, "float*", p, "HRESULT")
        return result
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
