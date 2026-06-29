#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGPathSegLinetoVerticalAbs.ahk" { ISVGPathSegLinetoVerticalAbs }
#Import ".\ISVGPathSegCurvetoQuadraticSmoothRel.ahk" { ISVGPathSegCurvetoQuadraticSmoothRel }
#Import ".\ISVGPoint.ahk" { ISVGPoint }
#Import ".\ISVGPathSegClosePath.ahk" { ISVGPathSegClosePath }
#Import ".\ISVGPathSegArcRel.ahk" { ISVGPathSegArcRel }
#Import ".\ISVGPathSegLinetoAbs.ahk" { ISVGPathSegLinetoAbs }
#Import ".\ISVGPathSegCurvetoQuadraticRel.ahk" { ISVGPathSegCurvetoQuadraticRel }
#Import ".\ISVGPathSegMovetoRel.ahk" { ISVGPathSegMovetoRel }
#Import ".\ISVGPathSegMovetoAbs.ahk" { ISVGPathSegMovetoAbs }
#Import ".\ISVGPathSegArcAbs.ahk" { ISVGPathSegArcAbs }
#Import ".\ISVGPathSegCurvetoCubicAbs.ahk" { ISVGPathSegCurvetoCubicAbs }
#Import ".\ISVGPathSegLinetoVerticalRel.ahk" { ISVGPathSegLinetoVerticalRel }
#Import ".\ISVGPathSegLinetoHorizontalAbs.ahk" { ISVGPathSegLinetoHorizontalAbs }
#Import ".\ISVGPathSegCurvetoQuadraticSmoothAbs.ahk" { ISVGPathSegCurvetoQuadraticSmoothAbs }
#Import ".\ISVGPathSegCurvetoCubicSmoothAbs.ahk" { ISVGPathSegCurvetoCubicSmoothAbs }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISVGAnimatedNumber.ahk" { ISVGAnimatedNumber }
#Import ".\ISVGPathSegLinetoRel.ahk" { ISVGPathSegLinetoRel }
#Import ".\ISVGPathSegLinetoHorizontalRel.ahk" { ISVGPathSegLinetoHorizontalRel }
#Import ".\ISVGPathSegCurvetoQuadraticAbs.ahk" { ISVGPathSegCurvetoQuadraticAbs }
#Import ".\ISVGPathSegCurvetoCubicRel.ahk" { ISVGPathSegCurvetoCubicRel }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ISVGPathSegCurvetoCubicSmoothRel.ahk" { ISVGPathSegCurvetoCubicSmoothRel }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGPathElement extends IDispatch {
    /**
     * The interface identifier for ISVGPathElement
     * @type {Guid}
     */
    static IID := Guid("{30510512-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105b2-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGPathElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_pathLength                         : IntPtr
        get_pathLength                            : IntPtr
        getTotalLength                            : IntPtr
        getPointAtLength                          : IntPtr
        getPathSegAtLength                        : IntPtr
        createSVGPathSegClosePath                 : IntPtr
        createSVGPathSegMovetoAbs                 : IntPtr
        createSVGPathSegMovetoRel                 : IntPtr
        createSVGPathSegLinetoAbs                 : IntPtr
        createSVGPathSegLinetoRel                 : IntPtr
        createSVGPathSegCurvetoCubicAbs           : IntPtr
        createSVGPathSegCurvetoCubicRel           : IntPtr
        createSVGPathSegCurvetoQuadraticAbs       : IntPtr
        createSVGPathSegCurvetoQuadraticRel       : IntPtr
        createSVGPathSegArcAbs                    : IntPtr
        createSVGPathSegArcRel                    : IntPtr
        createSVGPathSegLinetoHorizontalAbs       : IntPtr
        createSVGPathSegLinetoHorizontalRel       : IntPtr
        createSVGPathSegLinetoVerticalAbs         : IntPtr
        createSVGPathSegLinetoVerticalRel         : IntPtr
        createSVGPathSegCurvetoCubicSmoothAbs     : IntPtr
        createSVGPathSegCurvetoCubicSmoothRel     : IntPtr
        createSVGPathSegCurvetoQuadraticSmoothAbs : IntPtr
        createSVGPathSegCurvetoQuadraticSmoothRel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGPathElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(21, this, "float", x, "float", y, "float", r1, "float", r2, "float", angle, VARIANT_BOOL, largeArcFlag, VARIANT_BOOL, sweepFlag, "ptr*", &ppResult := 0, "HRESULT")
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
        result := ComCall(22, this, "float", x, "float", y, "float", r1, "float", r2, "float", angle, VARIANT_BOOL, largeArcFlag, VARIANT_BOOL, sweepFlag, "ptr*", &ppResult := 0, "HRESULT")
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

    Query(iid) {
        if (ISVGPathElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_pathLength := CallbackCreate(GetMethod(implObj, "putref_pathLength"), flags, 2)
        this.vtbl.get_pathLength := CallbackCreate(GetMethod(implObj, "get_pathLength"), flags, 2)
        this.vtbl.getTotalLength := CallbackCreate(GetMethod(implObj, "getTotalLength"), flags, 2)
        this.vtbl.getPointAtLength := CallbackCreate(GetMethod(implObj, "getPointAtLength"), flags, 3)
        this.vtbl.getPathSegAtLength := CallbackCreate(GetMethod(implObj, "getPathSegAtLength"), flags, 3)
        this.vtbl.createSVGPathSegClosePath := CallbackCreate(GetMethod(implObj, "createSVGPathSegClosePath"), flags, 2)
        this.vtbl.createSVGPathSegMovetoAbs := CallbackCreate(GetMethod(implObj, "createSVGPathSegMovetoAbs"), flags, 4)
        this.vtbl.createSVGPathSegMovetoRel := CallbackCreate(GetMethod(implObj, "createSVGPathSegMovetoRel"), flags, 4)
        this.vtbl.createSVGPathSegLinetoAbs := CallbackCreate(GetMethod(implObj, "createSVGPathSegLinetoAbs"), flags, 4)
        this.vtbl.createSVGPathSegLinetoRel := CallbackCreate(GetMethod(implObj, "createSVGPathSegLinetoRel"), flags, 4)
        this.vtbl.createSVGPathSegCurvetoCubicAbs := CallbackCreate(GetMethod(implObj, "createSVGPathSegCurvetoCubicAbs"), flags, 8)
        this.vtbl.createSVGPathSegCurvetoCubicRel := CallbackCreate(GetMethod(implObj, "createSVGPathSegCurvetoCubicRel"), flags, 8)
        this.vtbl.createSVGPathSegCurvetoQuadraticAbs := CallbackCreate(GetMethod(implObj, "createSVGPathSegCurvetoQuadraticAbs"), flags, 6)
        this.vtbl.createSVGPathSegCurvetoQuadraticRel := CallbackCreate(GetMethod(implObj, "createSVGPathSegCurvetoQuadraticRel"), flags, 6)
        this.vtbl.createSVGPathSegArcAbs := CallbackCreate(GetMethod(implObj, "createSVGPathSegArcAbs"), flags, 9)
        this.vtbl.createSVGPathSegArcRel := CallbackCreate(GetMethod(implObj, "createSVGPathSegArcRel"), flags, 9)
        this.vtbl.createSVGPathSegLinetoHorizontalAbs := CallbackCreate(GetMethod(implObj, "createSVGPathSegLinetoHorizontalAbs"), flags, 3)
        this.vtbl.createSVGPathSegLinetoHorizontalRel := CallbackCreate(GetMethod(implObj, "createSVGPathSegLinetoHorizontalRel"), flags, 3)
        this.vtbl.createSVGPathSegLinetoVerticalAbs := CallbackCreate(GetMethod(implObj, "createSVGPathSegLinetoVerticalAbs"), flags, 3)
        this.vtbl.createSVGPathSegLinetoVerticalRel := CallbackCreate(GetMethod(implObj, "createSVGPathSegLinetoVerticalRel"), flags, 3)
        this.vtbl.createSVGPathSegCurvetoCubicSmoothAbs := CallbackCreate(GetMethod(implObj, "createSVGPathSegCurvetoCubicSmoothAbs"), flags, 6)
        this.vtbl.createSVGPathSegCurvetoCubicSmoothRel := CallbackCreate(GetMethod(implObj, "createSVGPathSegCurvetoCubicSmoothRel"), flags, 6)
        this.vtbl.createSVGPathSegCurvetoQuadraticSmoothAbs := CallbackCreate(GetMethod(implObj, "createSVGPathSegCurvetoQuadraticSmoothAbs"), flags, 4)
        this.vtbl.createSVGPathSegCurvetoQuadraticSmoothRel := CallbackCreate(GetMethod(implObj, "createSVGPathSegCurvetoQuadraticSmoothRel"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_pathLength)
        CallbackFree(this.vtbl.get_pathLength)
        CallbackFree(this.vtbl.getTotalLength)
        CallbackFree(this.vtbl.getPointAtLength)
        CallbackFree(this.vtbl.getPathSegAtLength)
        CallbackFree(this.vtbl.createSVGPathSegClosePath)
        CallbackFree(this.vtbl.createSVGPathSegMovetoAbs)
        CallbackFree(this.vtbl.createSVGPathSegMovetoRel)
        CallbackFree(this.vtbl.createSVGPathSegLinetoAbs)
        CallbackFree(this.vtbl.createSVGPathSegLinetoRel)
        CallbackFree(this.vtbl.createSVGPathSegCurvetoCubicAbs)
        CallbackFree(this.vtbl.createSVGPathSegCurvetoCubicRel)
        CallbackFree(this.vtbl.createSVGPathSegCurvetoQuadraticAbs)
        CallbackFree(this.vtbl.createSVGPathSegCurvetoQuadraticRel)
        CallbackFree(this.vtbl.createSVGPathSegArcAbs)
        CallbackFree(this.vtbl.createSVGPathSegArcRel)
        CallbackFree(this.vtbl.createSVGPathSegLinetoHorizontalAbs)
        CallbackFree(this.vtbl.createSVGPathSegLinetoHorizontalRel)
        CallbackFree(this.vtbl.createSVGPathSegLinetoVerticalAbs)
        CallbackFree(this.vtbl.createSVGPathSegLinetoVerticalRel)
        CallbackFree(this.vtbl.createSVGPathSegCurvetoCubicSmoothAbs)
        CallbackFree(this.vtbl.createSVGPathSegCurvetoCubicSmoothRel)
        CallbackFree(this.vtbl.createSVGPathSegCurvetoQuadraticSmoothAbs)
        CallbackFree(this.vtbl.createSVGPathSegCurvetoQuadraticSmoothRel)
    }
}
