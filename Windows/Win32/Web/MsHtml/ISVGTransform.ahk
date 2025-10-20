#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGTransform extends IDispatch{
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
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_type(v) {
        result := ComCall(7, this, "short", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} p 
     * @returns {HRESULT} 
     */
    get_type(p) {
        result := ComCall(8, this, "short*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} v 
     * @returns {HRESULT} 
     */
    putref_matrix(v) {
        result := ComCall(9, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} p 
     * @returns {HRESULT} 
     */
    get_matrix(p) {
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_angle(v) {
        result := ComCall(11, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_angle(p) {
        result := ComCall(12, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} matrix 
     * @returns {HRESULT} 
     */
    setMatrix(matrix) {
        result := ComCall(13, this, "ptr", matrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} tx 
     * @param {Float} ty 
     * @returns {HRESULT} 
     */
    setTranslate(tx, ty) {
        result := ComCall(14, this, "float", tx, "float", ty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} sx 
     * @param {Float} sy 
     * @returns {HRESULT} 
     */
    setScale(sx, sy) {
        result := ComCall(15, this, "float", sx, "float", sy, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(16, this, "float", angle, "float", cx, "float", cy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {HRESULT} 
     */
    setSkewX(angle) {
        result := ComCall(17, this, "float", angle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @returns {HRESULT} 
     */
    setSkewY(angle) {
        result := ComCall(18, this, "float", angle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
