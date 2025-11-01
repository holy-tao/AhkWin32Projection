#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGTextContentElement extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_textLength", "get_textLength", "putref_lengthAdjust", "get_lengthAdjust", "getNumberOfChars", "getComputedTextLength", "getSubStringLength", "getStartPositionOfChar", "getEndPositionOfChar", "getExtentOfChar", "getRotationOfChar", "getCharNumAtPosition", "selectSubString"]

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_textLength(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_textLength(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_lengthAdjust(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedEnumeration>} p 
     * @returns {HRESULT} 
     */
    get_lengthAdjust(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pResult 
     * @returns {HRESULT} 
     */
    getNumberOfChars(pResult) {
        pResultMarshal := pResult is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pResultMarshal, pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pResult 
     * @returns {HRESULT} 
     */
    getComputedTextLength(pResult) {
        pResultMarshal := pResult is VarRef ? "float*" : "ptr"

        result := ComCall(12, this, pResultMarshal, pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Integer} nchars 
     * @param {Pointer<Float>} pResult 
     * @returns {HRESULT} 
     */
    getSubStringLength(charnum, nchars, pResult) {
        pResultMarshal := pResult is VarRef ? "float*" : "ptr"

        result := ComCall(13, this, "int", charnum, "int", nchars, pResultMarshal, pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    getStartPositionOfChar(charnum, ppResult) {
        result := ComCall(14, this, "int", charnum, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    getEndPositionOfChar(charnum, ppResult) {
        result := ComCall(15, this, "int", charnum, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Pointer<ISVGRect>} ppResult 
     * @returns {HRESULT} 
     */
    getExtentOfChar(charnum, ppResult) {
        result := ComCall(16, this, "int", charnum, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Pointer<Float>} pResult 
     * @returns {HRESULT} 
     */
    getRotationOfChar(charnum, pResult) {
        pResultMarshal := pResult is VarRef ? "float*" : "ptr"

        result := ComCall(17, this, "int", charnum, pResultMarshal, pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGPoint} point 
     * @param {Pointer<Integer>} pResult 
     * @returns {HRESULT} 
     */
    getCharNumAtPosition(point, pResult) {
        pResultMarshal := pResult is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, "ptr", point, pResultMarshal, pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Integer} nchars 
     * @returns {HRESULT} 
     */
    selectSubString(charnum, nchars) {
        result := ComCall(19, this, "int", charnum, "int", nchars, "HRESULT")
        return result
    }
}
