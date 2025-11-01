#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPathElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGPathElement
     * @type {Guid}
     */
    static IID => Guid("{30510512-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathElement
     * @type {Guid}
     */
    static CLSID => Guid("{305105b2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_pathLength", "get_pathLength", "getTotalLength", "getPointAtLength", "getPathSegAtLength", "createSVGPathSegClosePath", "createSVGPathSegMovetoAbs", "createSVGPathSegMovetoRel", "createSVGPathSegLinetoAbs", "createSVGPathSegLinetoRel", "createSVGPathSegCurvetoCubicAbs", "createSVGPathSegCurvetoCubicRel", "createSVGPathSegCurvetoQuadraticAbs", "createSVGPathSegCurvetoQuadraticRel", "createSVGPathSegArcAbs", "createSVGPathSegArcRel", "createSVGPathSegLinetoHorizontalAbs", "createSVGPathSegLinetoHorizontalRel", "createSVGPathSegLinetoVerticalAbs", "createSVGPathSegLinetoVerticalRel", "createSVGPathSegCurvetoCubicSmoothAbs", "createSVGPathSegCurvetoCubicSmoothRel", "createSVGPathSegCurvetoQuadraticSmoothAbs", "createSVGPathSegCurvetoQuadraticSmoothRel"]

    /**
     * 
     * @param {ISVGAnimatedNumber} v 
     * @returns {HRESULT} 
     */
    putref_pathLength(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedNumber>} p 
     * @returns {HRESULT} 
     */
    get_pathLength(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pfltResult 
     * @returns {HRESULT} 
     */
    getTotalLength(pfltResult) {
        pfltResultMarshal := pfltResult is VarRef ? "float*" : "ptr"

        result := ComCall(9, this, pfltResultMarshal, pfltResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} fltdistance 
     * @param {Pointer<ISVGPoint>} ppPointResult 
     * @returns {HRESULT} 
     */
    getPointAtLength(fltdistance, ppPointResult) {
        result := ComCall(10, this, "float", fltdistance, "ptr*", ppPointResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} fltdistance 
     * @param {Pointer<Integer>} plResult 
     * @returns {HRESULT} 
     */
    getPathSegAtLength(fltdistance, plResult) {
        plResultMarshal := plResult is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "float", fltdistance, plResultMarshal, plResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPathSegClosePath>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegClosePath(ppResult) {
        result := ComCall(12, this, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<ISVGPathSegMovetoAbs>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegMovetoAbs(x, y, ppResult) {
        result := ComCall(13, this, "float", x, "float", y, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<ISVGPathSegMovetoRel>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegMovetoRel(x, y, ppResult) {
        result := ComCall(14, this, "float", x, "float", y, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<ISVGPathSegLinetoAbs>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegLinetoAbs(x, y, ppResult) {
        result := ComCall(15, this, "float", x, "float", y, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<ISVGPathSegLinetoRel>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegLinetoRel(x, y, ppResult) {
        result := ComCall(16, this, "float", x, "float", y, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @param {Pointer<ISVGPathSegCurvetoCubicAbs>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegCurvetoCubicAbs(x, y, x1, y1, x2, y2, ppResult) {
        result := ComCall(17, this, "float", x, "float", y, "float", x1, "float", y1, "float", x2, "float", y2, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @param {Pointer<ISVGPathSegCurvetoCubicRel>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegCurvetoCubicRel(x, y, x1, y1, x2, y2, ppResult) {
        result := ComCall(18, this, "float", x, "float", y, "float", x1, "float", y1, "float", x2, "float", y2, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Pointer<ISVGPathSegCurvetoQuadraticAbs>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegCurvetoQuadraticAbs(x, y, x1, y1, ppResult) {
        result := ComCall(19, this, "float", x, "float", y, "float", x1, "float", y1, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Pointer<ISVGPathSegCurvetoQuadraticRel>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegCurvetoQuadraticRel(x, y, x1, y1, ppResult) {
        result := ComCall(20, this, "float", x, "float", y, "float", x1, "float", y1, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} r1 
     * @param {Float} r2 
     * @param {Float} angle 
     * @param {VARIANT_BOOL} largeArcFlag 
     * @param {VARIANT_BOOL} sweepFlag 
     * @param {Pointer<ISVGPathSegArcAbs>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegArcAbs(x, y, r1, r2, angle, largeArcFlag, sweepFlag, ppResult) {
        result := ComCall(21, this, "float", x, "float", y, "float", r1, "float", r2, "float", angle, "short", largeArcFlag, "short", sweepFlag, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} r1 
     * @param {Float} r2 
     * @param {Float} angle 
     * @param {VARIANT_BOOL} largeArcFlag 
     * @param {VARIANT_BOOL} sweepFlag 
     * @param {Pointer<ISVGPathSegArcRel>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegArcRel(x, y, r1, r2, angle, largeArcFlag, sweepFlag, ppResult) {
        result := ComCall(22, this, "float", x, "float", y, "float", r1, "float", r2, "float", angle, "short", largeArcFlag, "short", sweepFlag, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Pointer<ISVGPathSegLinetoHorizontalAbs>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegLinetoHorizontalAbs(x, ppResult) {
        result := ComCall(23, this, "float", x, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Pointer<ISVGPathSegLinetoHorizontalRel>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegLinetoHorizontalRel(x, ppResult) {
        result := ComCall(24, this, "float", x, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} y 
     * @param {Pointer<ISVGPathSegLinetoVerticalAbs>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegLinetoVerticalAbs(y, ppResult) {
        result := ComCall(25, this, "float", y, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} y 
     * @param {Pointer<ISVGPathSegLinetoVerticalRel>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegLinetoVerticalRel(y, ppResult) {
        result := ComCall(26, this, "float", y, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x2 
     * @param {Float} y2 
     * @param {Pointer<ISVGPathSegCurvetoCubicSmoothAbs>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegCurvetoCubicSmoothAbs(x, y, x2, y2, ppResult) {
        result := ComCall(27, this, "float", x, "float", y, "float", x2, "float", y2, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x2 
     * @param {Float} y2 
     * @param {Pointer<ISVGPathSegCurvetoCubicSmoothRel>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegCurvetoCubicSmoothRel(x, y, x2, y2, ppResult) {
        result := ComCall(28, this, "float", x, "float", y, "float", x2, "float", y2, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<ISVGPathSegCurvetoQuadraticSmoothAbs>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegCurvetoQuadraticSmoothAbs(x, y, ppResult) {
        result := ComCall(29, this, "float", x, "float", y, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<ISVGPathSegCurvetoQuadraticSmoothRel>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGPathSegCurvetoQuadraticSmoothRel(x, y, ppResult) {
        result := ComCall(30, this, "float", x, "float", y, "ptr*", ppResult, "HRESULT")
        return result
    }
}
