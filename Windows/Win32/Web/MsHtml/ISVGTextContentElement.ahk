#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGTextContentElement extends IDispatch{
    /**
     * The interface identifier for ISVGTextContentElement
     * @type {Guid}
     */
    static IID => Guid("{3051051a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGTextContentElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105dd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} v 
     * @returns {HRESULT} 
     */
    putref_textLength(v) {
        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_textLength(p) {
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} v 
     * @returns {HRESULT} 
     */
    putref_lengthAdjust(v) {
        result := ComCall(9, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_lengthAdjust(p) {
        result := ComCall(10, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pResult 
     * @returns {HRESULT} 
     */
    getNumberOfChars(pResult) {
        result := ComCall(11, this, "int*", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pResult 
     * @returns {HRESULT} 
     */
    getComputedTextLength(pResult) {
        result := ComCall(12, this, "float*", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Integer} nchars 
     * @param {Pointer<Single>} pResult 
     * @returns {HRESULT} 
     */
    getSubStringLength(charnum, nchars, pResult) {
        result := ComCall(13, this, "int", charnum, "int", nchars, "float*", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    getStartPositionOfChar(charnum, ppResult) {
        result := ComCall(14, this, "int", charnum, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    getEndPositionOfChar(charnum, ppResult) {
        result := ComCall(15, this, "int", charnum, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Pointer<ISVGRect>} ppResult 
     * @returns {HRESULT} 
     */
    getExtentOfChar(charnum, ppResult) {
        result := ComCall(16, this, "int", charnum, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Pointer<Single>} pResult 
     * @returns {HRESULT} 
     */
    getRotationOfChar(charnum, pResult) {
        result := ComCall(17, this, "int", charnum, "float*", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPoint>} point 
     * @param {Pointer<Int32>} pResult 
     * @returns {HRESULT} 
     */
    getCharNumAtPosition(point, pResult) {
        result := ComCall(18, this, "ptr", point, "int*", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Integer} nchars 
     * @returns {HRESULT} 
     */
    selectSubString(charnum, nchars) {
        result := ComCall(19, this, "int", charnum, "int", nchars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
