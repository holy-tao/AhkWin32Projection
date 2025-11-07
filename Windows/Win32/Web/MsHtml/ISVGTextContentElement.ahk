#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGAnimatedLength.ahk
#Include .\ISVGAnimatedEnumeration.ahk
#Include .\ISVGPoint.ahk
#Include .\ISVGRect.ahk
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
     * @returns {ISVGAnimatedLength} 
     */
    get_textLength() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
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
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_lengthAdjust() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    getNumberOfChars() {
        result := ComCall(11, this, "int*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {Float} 
     */
    getComputedTextLength() {
        result := ComCall(12, this, "float*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Integer} charnum 
     * @param {Integer} nchars 
     * @returns {Float} 
     */
    getSubStringLength(charnum, nchars) {
        result := ComCall(13, this, "int", charnum, "int", nchars, "float*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Integer} charnum 
     * @returns {ISVGPoint} 
     */
    getStartPositionOfChar(charnum) {
        result := ComCall(14, this, "int", charnum, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    /**
     * 
     * @param {Integer} charnum 
     * @returns {ISVGPoint} 
     */
    getEndPositionOfChar(charnum) {
        result := ComCall(15, this, "int", charnum, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    /**
     * 
     * @param {Integer} charnum 
     * @returns {ISVGRect} 
     */
    getExtentOfChar(charnum) {
        result := ComCall(16, this, "int", charnum, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGRect(ppResult)
    }

    /**
     * 
     * @param {Integer} charnum 
     * @returns {Float} 
     */
    getRotationOfChar(charnum) {
        result := ComCall(17, this, "int", charnum, "float*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {ISVGPoint} point 
     * @returns {Integer} 
     */
    getCharNumAtPosition(point) {
        result := ComCall(18, this, "ptr", point, "int*", &pResult := 0, "HRESULT")
        return pResult
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
