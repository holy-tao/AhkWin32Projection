#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGMatrix extends IDispatch{
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
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_a(v) {
        result := ComCall(7, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_a(p) {
        result := ComCall(8, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_b(v) {
        result := ComCall(9, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_b(p) {
        result := ComCall(10, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_c(v) {
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
    get_c(p) {
        result := ComCall(12, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_d(v) {
        result := ComCall(13, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_d(p) {
        result := ComCall(14, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_e(v) {
        result := ComCall(15, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_e(p) {
        result := ComCall(16, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_f(v) {
        result := ComCall(17, this, "float", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} p 
     * @returns {HRESULT} 
     */
    get_f(p) {
        result := ComCall(18, this, "float*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} secondMatrix 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    multiply(secondMatrix, ppResult) {
        result := ComCall(19, this, "ptr", secondMatrix, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    inverse(ppResult) {
        result := ComCall(20, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    translate(x, y, ppResult) {
        result := ComCall(21, this, "float", x, "float", y, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} scaleFactor 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    scale(scaleFactor, ppResult) {
        result := ComCall(22, this, "float", scaleFactor, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} scaleFactorX 
     * @param {Float} scaleFactorY 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    scaleNonUniform(scaleFactorX, scaleFactorY, ppResult) {
        result := ComCall(23, this, "float", scaleFactorX, "float", scaleFactorY, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    rotate(angle, ppResult) {
        result := ComCall(24, this, "float", angle, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    rotateFromVector(x, y, ppResult) {
        result := ComCall(25, this, "float", x, "float", y, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    flipX(ppResult) {
        result := ComCall(26, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    flipY(ppResult) {
        result := ComCall(27, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    skewX(angle, ppResult) {
        result := ComCall(28, this, "float", angle, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} angle 
     * @param {Pointer<ISVGMatrix>} ppResult 
     * @returns {HRESULT} 
     */
    skewY(angle, ppResult) {
        result := ComCall(29, this, "float", angle, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
