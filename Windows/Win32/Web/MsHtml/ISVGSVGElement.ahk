#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGSVGElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGSVGElement
     * @type {Guid}
     */
    static IID => Guid("{305104e7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGSVGElement
     * @type {Guid}
     */
    static CLSID => Guid("{30510574-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_x", "get_x", "putref_y", "get_y", "putref_width", "get_width", "putref_height", "get_height", "put_contentScriptType", "get_contentScriptType", "put_contentStyleType", "get_contentStyleType", "putref_viewport", "get_viewport", "put_pixelUnitToMillimeterX", "get_pixelUnitToMillimeterX", "put_pixelUnitToMillimeterY", "get_pixelUnitToMillimeterY", "put_screenPixelToMillimeterX", "get_screenPixelToMillimeterX", "put_screenPixelToMillimeterY", "get_screenPixelToMillimeterY", "put_useCurrentView", "get_useCurrentView", "putref_currentView", "get_currentView", "put_currentScale", "get_currentScale", "putref_currentTranslate", "get_currentTranslate", "suspendRedraw", "unsuspendRedraw", "unsuspendRedrawAll", "forceRedraw", "pauseAnimations", "unpauseAnimations", "animationsPaused", "getCurrentTime", "setCurrentTime", "getIntersectionList", "getEnclosureList", "checkIntersection", "checkEnclosure", "deselectAll", "createSVGNumber", "createSVGLength", "createSVGAngle", "createSVGPoint", "createSVGMatrix", "createSVGRect", "createSVGTransform", "createSVGTransformFromMatrix", "getElementById"]

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_x(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_x(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_y(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_y(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_width(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_width(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_height(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAnimatedLength>} p 
     * @returns {HRESULT} 
     */
    get_height(p) {
        result := ComCall(14, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_contentScriptType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_contentScriptType(p) {
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_contentStyleType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_contentStyleType(p) {
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGRect} v 
     * @returns {HRESULT} 
     */
    putref_viewport(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGRect>} p 
     * @returns {HRESULT} 
     */
    get_viewport(p) {
        result := ComCall(20, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_pixelUnitToMillimeterX(v) {
        result := ComCall(21, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_pixelUnitToMillimeterX(p) {
        result := ComCall(22, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_pixelUnitToMillimeterY(v) {
        result := ComCall(23, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_pixelUnitToMillimeterY(p) {
        result := ComCall(24, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_screenPixelToMillimeterX(v) {
        result := ComCall(25, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_screenPixelToMillimeterX(p) {
        result := ComCall(26, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_screenPixelToMillimeterY(v) {
        result := ComCall(27, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_screenPixelToMillimeterY(p) {
        result := ComCall(28, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_useCurrentView(v) {
        result := ComCall(29, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_useCurrentView(p) {
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGViewSpec} v 
     * @returns {HRESULT} 
     */
    putref_currentView(v) {
        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGViewSpec>} p 
     * @returns {HRESULT} 
     */
    get_currentView(p) {
        result := ComCall(32, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_currentScale(v) {
        result := ComCall(33, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} p 
     * @returns {HRESULT} 
     */
    get_currentScale(p) {
        result := ComCall(34, this, "float*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGPoint} v 
     * @returns {HRESULT} 
     */
    putref_currentTranslate(v) {
        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPoint>} p 
     * @returns {HRESULT} 
     */
    get_currentTranslate(p) {
        result := ComCall(36, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} maxWaitMilliseconds 
     * @param {Pointer<Integer>} pResult 
     * @returns {HRESULT} 
     */
    suspendRedraw(maxWaitMilliseconds, pResult) {
        result := ComCall(37, this, "uint", maxWaitMilliseconds, "uint*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} suspendHandeID 
     * @returns {HRESULT} 
     */
    unsuspendRedraw(suspendHandeID) {
        result := ComCall(38, this, "uint", suspendHandeID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    unsuspendRedrawAll() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    forceRedraw() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pauseAnimations() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    unpauseAnimations() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pResult 
     * @returns {HRESULT} 
     */
    animationsPaused(pResult) {
        result := ComCall(43, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pResult 
     * @returns {HRESULT} 
     */
    getCurrentTime(pResult) {
        result := ComCall(44, this, "float*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} seconds 
     * @returns {HRESULT} 
     */
    setCurrentTime(seconds) {
        result := ComCall(45, this, "float", seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGRect} rect 
     * @param {ISVGElement} referenceElement 
     * @param {Pointer<VARIANT>} pResult 
     * @returns {HRESULT} 
     */
    getIntersectionList(rect, referenceElement, pResult) {
        result := ComCall(46, this, "ptr", rect, "ptr", referenceElement, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGRect} rect 
     * @param {ISVGElement} referenceElement 
     * @param {Pointer<VARIANT>} pResult 
     * @returns {HRESULT} 
     */
    getEnclosureList(rect, referenceElement, pResult) {
        result := ComCall(47, this, "ptr", rect, "ptr", referenceElement, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGElement} element 
     * @param {ISVGRect} rect 
     * @param {Pointer<VARIANT_BOOL>} pResult 
     * @returns {HRESULT} 
     */
    checkIntersection(element, rect, pResult) {
        result := ComCall(48, this, "ptr", element, "ptr", rect, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGElement} element 
     * @param {ISVGRect} rect 
     * @param {Pointer<VARIANT_BOOL>} pResult 
     * @returns {HRESULT} 
     */
    checkEnclosure(element, rect, pResult) {
        result := ComCall(49, this, "ptr", element, "ptr", rect, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deselectAll() {
        result := ComCall(50, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGNumber>} pResult 
     * @returns {HRESULT} 
     */
    createSVGNumber(pResult) {
        result := ComCall(51, this, "ptr*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGLength>} pResult 
     * @returns {HRESULT} 
     */
    createSVGLength(pResult) {
        result := ComCall(52, this, "ptr*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGAngle>} pResult 
     * @returns {HRESULT} 
     */
    createSVGAngle(pResult) {
        result := ComCall(53, this, "ptr*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPoint>} pResult 
     * @returns {HRESULT} 
     */
    createSVGPoint(pResult) {
        result := ComCall(54, this, "ptr*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGMatrix>} pResult 
     * @returns {HRESULT} 
     */
    createSVGMatrix(pResult) {
        result := ComCall(55, this, "ptr*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGRect>} pResult 
     * @returns {HRESULT} 
     */
    createSVGRect(pResult) {
        result := ComCall(56, this, "ptr*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGTransform>} pResult 
     * @returns {HRESULT} 
     */
    createSVGTransform(pResult) {
        result := ComCall(57, this, "ptr*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGMatrix} matrix 
     * @param {Pointer<ISVGTransform>} pResult 
     * @returns {HRESULT} 
     */
    createSVGTransformFromMatrix(matrix, pResult) {
        result := ComCall(58, this, "ptr", matrix, "ptr*", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} elementId 
     * @param {Pointer<IHTMLElement>} pResult 
     * @returns {HRESULT} 
     */
    getElementById(elementId, pResult) {
        elementId := elementId is String ? BSTR.Alloc(elementId).Value : elementId

        result := ComCall(59, this, "ptr", elementId, "ptr*", pResult, "HRESULT")
        return result
    }
}
