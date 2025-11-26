#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGAnimatedNumber.ahk
#Include .\ISVGPoint.ahk
#Include .\ISVGPathSegClosePath.ahk
#Include .\ISVGPathSegMovetoAbs.ahk
#Include .\ISVGPathSegMovetoRel.ahk
#Include .\ISVGPathSegLinetoAbs.ahk
#Include .\ISVGPathSegLinetoRel.ahk
#Include .\ISVGPathSegCurvetoCubicAbs.ahk
#Include .\ISVGPathSegCurvetoCubicRel.ahk
#Include .\ISVGPathSegCurvetoQuadraticAbs.ahk
#Include .\ISVGPathSegCurvetoQuadraticRel.ahk
#Include .\ISVGPathSegArcAbs.ahk
#Include .\ISVGPathSegArcRel.ahk
#Include .\ISVGPathSegLinetoHorizontalAbs.ahk
#Include .\ISVGPathSegLinetoHorizontalRel.ahk
#Include .\ISVGPathSegLinetoVerticalAbs.ahk
#Include .\ISVGPathSegLinetoVerticalRel.ahk
#Include .\ISVGPathSegCurvetoCubicSmoothAbs.ahk
#Include .\ISVGPathSegCurvetoCubicSmoothRel.ahk
#Include .\ISVGPathSegCurvetoQuadraticSmoothAbs.ahk
#Include .\ISVGPathSegCurvetoQuadraticSmoothRel.ahk
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
     * @type {ISVGAnimatedNumber} 
     */
    pathLength {
        get => this.get_pathLength()
    }

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
     * @returns {ISVGAnimatedNumber} 
     */
    get_pathLength() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedNumber(p)
    }

    /**
     * 
     * @returns {Float} 
     */
    getTotalLength() {
        result := ComCall(9, this, "float*", &pfltResult := 0, "HRESULT")
        return pfltResult
    }

    /**
     * 
     * @param {Float} fltdistance 
     * @returns {ISVGPoint} 
     */
    getPointAtLength(fltdistance) {
        result := ComCall(10, this, "float", fltdistance, "ptr*", &ppPointResult := 0, "HRESULT")
        return ISVGPoint(ppPointResult)
    }

    /**
     * 
     * @param {Float} fltdistance 
     * @returns {Integer} 
     */
    getPathSegAtLength(fltdistance) {
        result := ComCall(11, this, "float", fltdistance, "int*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @returns {ISVGPathSegClosePath} 
     */
    createSVGPathSegClosePath() {
        result := ComCall(12, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegClosePath(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {ISVGPathSegMovetoAbs} 
     */
    createSVGPathSegMovetoAbs(x, y) {
        result := ComCall(13, this, "float", x, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegMovetoAbs(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {ISVGPathSegMovetoRel} 
     */
    createSVGPathSegMovetoRel(x, y) {
        result := ComCall(14, this, "float", x, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegMovetoRel(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {ISVGPathSegLinetoAbs} 
     */
    createSVGPathSegLinetoAbs(x, y) {
        result := ComCall(15, this, "float", x, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegLinetoAbs(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {ISVGPathSegLinetoRel} 
     */
    createSVGPathSegLinetoRel(x, y) {
        result := ComCall(16, this, "float", x, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegLinetoRel(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {ISVGPathSegCurvetoCubicAbs} 
     */
    createSVGPathSegCurvetoCubicAbs(x, y, x1, y1, x2, y2) {
        result := ComCall(17, this, "float", x, "float", y, "float", x1, "float", y1, "float", x2, "float", y2, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegCurvetoCubicAbs(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {ISVGPathSegCurvetoCubicRel} 
     */
    createSVGPathSegCurvetoCubicRel(x, y, x1, y1, x2, y2) {
        result := ComCall(18, this, "float", x, "float", y, "float", x1, "float", y1, "float", x2, "float", y2, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegCurvetoCubicRel(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x1 
     * @param {Float} y1 
     * @returns {ISVGPathSegCurvetoQuadraticAbs} 
     */
    createSVGPathSegCurvetoQuadraticAbs(x, y, x1, y1) {
        result := ComCall(19, this, "float", x, "float", y, "float", x1, "float", y1, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegCurvetoQuadraticAbs(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x1 
     * @param {Float} y1 
     * @returns {ISVGPathSegCurvetoQuadraticRel} 
     */
    createSVGPathSegCurvetoQuadraticRel(x, y, x1, y1) {
        result := ComCall(20, this, "float", x, "float", y, "float", x1, "float", y1, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegCurvetoQuadraticRel(ppResult)
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
     * @returns {ISVGPathSegArcAbs} 
     */
    createSVGPathSegArcAbs(x, y, r1, r2, angle, largeArcFlag, sweepFlag) {
        result := ComCall(21, this, "float", x, "float", y, "float", r1, "float", r2, "float", angle, "short", largeArcFlag, "short", sweepFlag, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegArcAbs(ppResult)
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
     * @returns {ISVGPathSegArcRel} 
     */
    createSVGPathSegArcRel(x, y, r1, r2, angle, largeArcFlag, sweepFlag) {
        result := ComCall(22, this, "float", x, "float", y, "float", r1, "float", r2, "float", angle, "short", largeArcFlag, "short", sweepFlag, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegArcRel(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @returns {ISVGPathSegLinetoHorizontalAbs} 
     */
    createSVGPathSegLinetoHorizontalAbs(x) {
        result := ComCall(23, this, "float", x, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegLinetoHorizontalAbs(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @returns {ISVGPathSegLinetoHorizontalRel} 
     */
    createSVGPathSegLinetoHorizontalRel(x) {
        result := ComCall(24, this, "float", x, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegLinetoHorizontalRel(ppResult)
    }

    /**
     * 
     * @param {Float} y 
     * @returns {ISVGPathSegLinetoVerticalAbs} 
     */
    createSVGPathSegLinetoVerticalAbs(y) {
        result := ComCall(25, this, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegLinetoVerticalAbs(ppResult)
    }

    /**
     * 
     * @param {Float} y 
     * @returns {ISVGPathSegLinetoVerticalRel} 
     */
    createSVGPathSegLinetoVerticalRel(y) {
        result := ComCall(26, this, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegLinetoVerticalRel(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {ISVGPathSegCurvetoCubicSmoothAbs} 
     */
    createSVGPathSegCurvetoCubicSmoothAbs(x, y, x2, y2) {
        result := ComCall(27, this, "float", x, "float", y, "float", x2, "float", y2, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegCurvetoCubicSmoothAbs(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {ISVGPathSegCurvetoCubicSmoothRel} 
     */
    createSVGPathSegCurvetoCubicSmoothRel(x, y, x2, y2) {
        result := ComCall(28, this, "float", x, "float", y, "float", x2, "float", y2, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegCurvetoCubicSmoothRel(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {ISVGPathSegCurvetoQuadraticSmoothAbs} 
     */
    createSVGPathSegCurvetoQuadraticSmoothAbs(x, y) {
        result := ComCall(29, this, "float", x, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegCurvetoQuadraticSmoothAbs(ppResult)
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {ISVGPathSegCurvetoQuadraticSmoothRel} 
     */
    createSVGPathSegCurvetoQuadraticSmoothRel(x, y) {
        result := ComCall(30, this, "float", x, "float", y, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPathSegCurvetoQuadraticSmoothRel(ppResult)
    }
}
