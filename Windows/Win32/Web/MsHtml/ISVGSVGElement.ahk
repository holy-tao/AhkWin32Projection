#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISVGAnimatedLength.ahk
#Include .\ISVGRect.ahk
#Include .\ISVGViewSpec.ahk
#Include .\ISVGPoint.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISVGNumber.ahk
#Include .\ISVGLength.ahk
#Include .\ISVGAngle.ahk
#Include .\ISVGMatrix.ahk
#Include .\ISVGTransform.ahk
#Include .\IHTMLElement.ahk
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
     * @returns {ISVGAnimatedLength} 
     */
    get_x() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
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
     * @returns {ISVGAnimatedLength} 
     */
    get_y() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
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
     * @returns {ISVGAnimatedLength} 
     */
    get_width() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
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
     * @returns {ISVGAnimatedLength} 
     */
    get_height() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
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
     * @returns {BSTR} 
     */
    get_contentScriptType() {
        p := BSTR()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_contentStyleType() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {ISVGRect} 
     */
    get_viewport() {
        result := ComCall(20, this, "ptr*", &p := 0, "HRESULT")
        return ISVGRect(p)
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
     * @returns {Float} 
     */
    get_pixelUnitToMillimeterX() {
        result := ComCall(22, this, "float*", &p := 0, "HRESULT")
        return p
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
     * @returns {Float} 
     */
    get_pixelUnitToMillimeterY() {
        result := ComCall(24, this, "float*", &p := 0, "HRESULT")
        return p
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
     * @returns {Float} 
     */
    get_screenPixelToMillimeterX() {
        result := ComCall(26, this, "float*", &p := 0, "HRESULT")
        return p
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
     * @returns {Float} 
     */
    get_screenPixelToMillimeterY() {
        result := ComCall(28, this, "float*", &p := 0, "HRESULT")
        return p
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
     * @returns {VARIANT_BOOL} 
     */
    get_useCurrentView() {
        result := ComCall(30, this, "short*", &p := 0, "HRESULT")
        return p
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
     * @returns {ISVGViewSpec} 
     */
    get_currentView() {
        result := ComCall(32, this, "ptr*", &p := 0, "HRESULT")
        return ISVGViewSpec(p)
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
     * @returns {Float} 
     */
    get_currentScale() {
        result := ComCall(34, this, "float*", &p := 0, "HRESULT")
        return p
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
     * @returns {ISVGPoint} 
     */
    get_currentTranslate() {
        result := ComCall(36, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPoint(p)
    }

    /**
     * 
     * @param {Integer} maxWaitMilliseconds 
     * @returns {Integer} 
     */
    suspendRedraw(maxWaitMilliseconds) {
        result := ComCall(37, this, "uint", maxWaitMilliseconds, "uint*", &pResult := 0, "HRESULT")
        return pResult
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
     * @returns {VARIANT_BOOL} 
     */
    animationsPaused() {
        result := ComCall(43, this, "short*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {Float} 
     */
    getCurrentTime() {
        result := ComCall(44, this, "float*", &pResult := 0, "HRESULT")
        return pResult
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
     * @returns {VARIANT} 
     */
    getIntersectionList(rect, referenceElement) {
        pResult := VARIANT()
        result := ComCall(46, this, "ptr", rect, "ptr", referenceElement, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {ISVGRect} rect 
     * @param {ISVGElement} referenceElement 
     * @returns {VARIANT} 
     */
    getEnclosureList(rect, referenceElement) {
        pResult := VARIANT()
        result := ComCall(47, this, "ptr", rect, "ptr", referenceElement, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {ISVGElement} element 
     * @param {ISVGRect} rect 
     * @returns {VARIANT_BOOL} 
     */
    checkIntersection(element, rect) {
        result := ComCall(48, this, "ptr", element, "ptr", rect, "short*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {ISVGElement} element 
     * @param {ISVGRect} rect 
     * @returns {VARIANT_BOOL} 
     */
    checkEnclosure(element, rect) {
        result := ComCall(49, this, "ptr", element, "ptr", rect, "short*", &pResult := 0, "HRESULT")
        return pResult
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
     * @returns {ISVGNumber} 
     */
    createSVGNumber() {
        result := ComCall(51, this, "ptr*", &pResult := 0, "HRESULT")
        return ISVGNumber(pResult)
    }

    /**
     * 
     * @returns {ISVGLength} 
     */
    createSVGLength() {
        result := ComCall(52, this, "ptr*", &pResult := 0, "HRESULT")
        return ISVGLength(pResult)
    }

    /**
     * 
     * @returns {ISVGAngle} 
     */
    createSVGAngle() {
        result := ComCall(53, this, "ptr*", &pResult := 0, "HRESULT")
        return ISVGAngle(pResult)
    }

    /**
     * 
     * @returns {ISVGPoint} 
     */
    createSVGPoint() {
        result := ComCall(54, this, "ptr*", &pResult := 0, "HRESULT")
        return ISVGPoint(pResult)
    }

    /**
     * 
     * @returns {ISVGMatrix} 
     */
    createSVGMatrix() {
        result := ComCall(55, this, "ptr*", &pResult := 0, "HRESULT")
        return ISVGMatrix(pResult)
    }

    /**
     * 
     * @returns {ISVGRect} 
     */
    createSVGRect() {
        result := ComCall(56, this, "ptr*", &pResult := 0, "HRESULT")
        return ISVGRect(pResult)
    }

    /**
     * 
     * @returns {ISVGTransform} 
     */
    createSVGTransform() {
        result := ComCall(57, this, "ptr*", &pResult := 0, "HRESULT")
        return ISVGTransform(pResult)
    }

    /**
     * 
     * @param {ISVGMatrix} matrix 
     * @returns {ISVGTransform} 
     */
    createSVGTransformFromMatrix(matrix) {
        result := ComCall(58, this, "ptr", matrix, "ptr*", &pResult := 0, "HRESULT")
        return ISVGTransform(pResult)
    }

    /**
     * 
     * @param {BSTR} elementId 
     * @returns {IHTMLElement} 
     */
    getElementById(elementId) {
        elementId := elementId is String ? BSTR.Alloc(elementId).Value : elementId

        result := ComCall(59, this, "ptr", elementId, "ptr*", &pResult := 0, "HRESULT")
        return IHTMLElement(pResult)
    }
}
