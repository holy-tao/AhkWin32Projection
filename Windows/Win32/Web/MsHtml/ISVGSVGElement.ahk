#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGTransform.ahk" { ISVGTransform }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGPoint.ahk" { ISVGPoint }
#Import ".\ISVGMatrix.ahk" { ISVGMatrix }
#Import ".\ISVGAnimatedLength.ahk" { ISVGAnimatedLength }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ISVGLength.ahk" { ISVGLength }
#Import ".\ISVGRect.ahk" { ISVGRect }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISVGAngle.ahk" { ISVGAngle }
#Import ".\ISVGNumber.ahk" { ISVGNumber }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import ".\ISVGViewSpec.ahk" { ISVGViewSpec }
#Import ".\ISVGElement.ahk" { ISVGElement }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGSVGElement extends IDispatch {
    /**
     * The interface identifier for ISVGSVGElement
     * @type {Guid}
     */
    static IID := Guid("{305104e7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGSVGElement
     * @type {Guid}
     */
    static CLSID := Guid("{30510574-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGSVGElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_x                     : IntPtr
        get_x                        : IntPtr
        putref_y                     : IntPtr
        get_y                        : IntPtr
        putref_width                 : IntPtr
        get_width                    : IntPtr
        putref_height                : IntPtr
        get_height                   : IntPtr
        put_contentScriptType        : IntPtr
        get_contentScriptType        : IntPtr
        put_contentStyleType         : IntPtr
        get_contentStyleType         : IntPtr
        putref_viewport              : IntPtr
        get_viewport                 : IntPtr
        put_pixelUnitToMillimeterX   : IntPtr
        get_pixelUnitToMillimeterX   : IntPtr
        put_pixelUnitToMillimeterY   : IntPtr
        get_pixelUnitToMillimeterY   : IntPtr
        put_screenPixelToMillimeterX : IntPtr
        get_screenPixelToMillimeterX : IntPtr
        put_screenPixelToMillimeterY : IntPtr
        get_screenPixelToMillimeterY : IntPtr
        put_useCurrentView           : IntPtr
        get_useCurrentView           : IntPtr
        putref_currentView           : IntPtr
        get_currentView              : IntPtr
        put_currentScale             : IntPtr
        get_currentScale             : IntPtr
        putref_currentTranslate      : IntPtr
        get_currentTranslate         : IntPtr
        suspendRedraw                : IntPtr
        unsuspendRedraw              : IntPtr
        unsuspendRedrawAll           : IntPtr
        forceRedraw                  : IntPtr
        pauseAnimations              : IntPtr
        unpauseAnimations            : IntPtr
        animationsPaused             : IntPtr
        getCurrentTime               : IntPtr
        setCurrentTime               : IntPtr
        getIntersectionList          : IntPtr
        getEnclosureList             : IntPtr
        checkIntersection            : IntPtr
        checkEnclosure               : IntPtr
        deselectAll                  : IntPtr
        createSVGNumber              : IntPtr
        createSVGLength              : IntPtr
        createSVGAngle               : IntPtr
        createSVGPoint               : IntPtr
        createSVGMatrix              : IntPtr
        createSVGRect                : IntPtr
        createSVGTransform           : IntPtr
        createSVGTransformFromMatrix : IntPtr
        getElementById               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGSVGElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    x {
        get => this.get_x()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    y {
        get => this.get_y()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    width {
        get => this.get_width()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    height {
        get => this.get_height()
    }

    /**
     * @type {BSTR} 
     */
    contentScriptType {
        get => this.get_contentScriptType()
        set => this.put_contentScriptType(value)
    }

    /**
     * @type {BSTR} 
     */
    contentStyleType {
        get => this.get_contentStyleType()
        set => this.put_contentStyleType(value)
    }

    /**
     * @type {ISVGRect} 
     */
    viewport {
        get => this.get_viewport()
    }

    /**
     * @type {Float} 
     */
    pixelUnitToMillimeterX {
        get => this.get_pixelUnitToMillimeterX()
        set => this.put_pixelUnitToMillimeterX(value)
    }

    /**
     * @type {Float} 
     */
    pixelUnitToMillimeterY {
        get => this.get_pixelUnitToMillimeterY()
        set => this.put_pixelUnitToMillimeterY(value)
    }

    /**
     * @type {Float} 
     */
    screenPixelToMillimeterX {
        get => this.get_screenPixelToMillimeterX()
        set => this.put_screenPixelToMillimeterX(value)
    }

    /**
     * @type {Float} 
     */
    screenPixelToMillimeterY {
        get => this.get_screenPixelToMillimeterY()
        set => this.put_screenPixelToMillimeterY(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    useCurrentView {
        get => this.get_useCurrentView()
        set => this.put_useCurrentView(value)
    }

    /**
     * @type {ISVGViewSpec} 
     */
    currentView {
        get => this.get_currentView()
    }

    /**
     * @type {Float} 
     */
    currentScale {
        get => this.get_currentScale()
        set => this.put_currentScale(value)
    }

    /**
     * @type {ISVGPoint} 
     */
    currentTranslate {
        get => this.get_currentTranslate()
    }

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

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_contentScriptType() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_contentStyleType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_contentStyleType() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
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
        result := ComCall(29, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_useCurrentView() {
        result := ComCall(30, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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
        result := ComCall(43, this, VARIANT_BOOL.Ptr, &pResult := 0, "HRESULT")
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
     * @param {ISVGRect} _rect 
     * @param {ISVGElement} referenceElement 
     * @returns {VARIANT} 
     */
    getIntersectionList(_rect, referenceElement) {
        pResult := VARIANT()
        result := ComCall(46, this, "ptr", _rect, "ptr", referenceElement, VARIANT.Ptr, pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {ISVGRect} _rect 
     * @param {ISVGElement} referenceElement 
     * @returns {VARIANT} 
     */
    getEnclosureList(_rect, referenceElement) {
        pResult := VARIANT()
        result := ComCall(47, this, "ptr", _rect, "ptr", referenceElement, VARIANT.Ptr, pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {ISVGElement} element 
     * @param {ISVGRect} _rect 
     * @returns {VARIANT_BOOL} 
     */
    checkIntersection(element, _rect) {
        result := ComCall(48, this, "ptr", element, "ptr", _rect, VARIANT_BOOL.Ptr, &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {ISVGElement} element 
     * @param {ISVGRect} _rect 
     * @returns {VARIANT_BOOL} 
     */
    checkEnclosure(element, _rect) {
        result := ComCall(49, this, "ptr", element, "ptr", _rect, VARIANT_BOOL.Ptr, &pResult := 0, "HRESULT")
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
     * @param {ISVGMatrix} _matrix 
     * @returns {ISVGTransform} 
     */
    createSVGTransformFromMatrix(_matrix) {
        result := ComCall(58, this, "ptr", _matrix, "ptr*", &pResult := 0, "HRESULT")
        return ISVGTransform(pResult)
    }

    /**
     * 
     * @param {BSTR} elementId 
     * @returns {IHTMLElement} 
     */
    getElementById(elementId) {
        elementId := elementId is String ? BSTR.Alloc(elementId).Value : elementId

        result := ComCall(59, this, BSTR, elementId, "ptr*", &pResult := 0, "HRESULT")
        return IHTMLElement(pResult)
    }

    Query(iid) {
        if (ISVGSVGElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_x := CallbackCreate(GetMethod(implObj, "putref_x"), flags, 2)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.putref_y := CallbackCreate(GetMethod(implObj, "putref_y"), flags, 2)
        this.vtbl.get_y := CallbackCreate(GetMethod(implObj, "get_y"), flags, 2)
        this.vtbl.putref_width := CallbackCreate(GetMethod(implObj, "putref_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.putref_height := CallbackCreate(GetMethod(implObj, "putref_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.put_contentScriptType := CallbackCreate(GetMethod(implObj, "put_contentScriptType"), flags, 2)
        this.vtbl.get_contentScriptType := CallbackCreate(GetMethod(implObj, "get_contentScriptType"), flags, 2)
        this.vtbl.put_contentStyleType := CallbackCreate(GetMethod(implObj, "put_contentStyleType"), flags, 2)
        this.vtbl.get_contentStyleType := CallbackCreate(GetMethod(implObj, "get_contentStyleType"), flags, 2)
        this.vtbl.putref_viewport := CallbackCreate(GetMethod(implObj, "putref_viewport"), flags, 2)
        this.vtbl.get_viewport := CallbackCreate(GetMethod(implObj, "get_viewport"), flags, 2)
        this.vtbl.put_pixelUnitToMillimeterX := CallbackCreate(GetMethod(implObj, "put_pixelUnitToMillimeterX"), flags, 2)
        this.vtbl.get_pixelUnitToMillimeterX := CallbackCreate(GetMethod(implObj, "get_pixelUnitToMillimeterX"), flags, 2)
        this.vtbl.put_pixelUnitToMillimeterY := CallbackCreate(GetMethod(implObj, "put_pixelUnitToMillimeterY"), flags, 2)
        this.vtbl.get_pixelUnitToMillimeterY := CallbackCreate(GetMethod(implObj, "get_pixelUnitToMillimeterY"), flags, 2)
        this.vtbl.put_screenPixelToMillimeterX := CallbackCreate(GetMethod(implObj, "put_screenPixelToMillimeterX"), flags, 2)
        this.vtbl.get_screenPixelToMillimeterX := CallbackCreate(GetMethod(implObj, "get_screenPixelToMillimeterX"), flags, 2)
        this.vtbl.put_screenPixelToMillimeterY := CallbackCreate(GetMethod(implObj, "put_screenPixelToMillimeterY"), flags, 2)
        this.vtbl.get_screenPixelToMillimeterY := CallbackCreate(GetMethod(implObj, "get_screenPixelToMillimeterY"), flags, 2)
        this.vtbl.put_useCurrentView := CallbackCreate(GetMethod(implObj, "put_useCurrentView"), flags, 2)
        this.vtbl.get_useCurrentView := CallbackCreate(GetMethod(implObj, "get_useCurrentView"), flags, 2)
        this.vtbl.putref_currentView := CallbackCreate(GetMethod(implObj, "putref_currentView"), flags, 2)
        this.vtbl.get_currentView := CallbackCreate(GetMethod(implObj, "get_currentView"), flags, 2)
        this.vtbl.put_currentScale := CallbackCreate(GetMethod(implObj, "put_currentScale"), flags, 2)
        this.vtbl.get_currentScale := CallbackCreate(GetMethod(implObj, "get_currentScale"), flags, 2)
        this.vtbl.putref_currentTranslate := CallbackCreate(GetMethod(implObj, "putref_currentTranslate"), flags, 2)
        this.vtbl.get_currentTranslate := CallbackCreate(GetMethod(implObj, "get_currentTranslate"), flags, 2)
        this.vtbl.suspendRedraw := CallbackCreate(GetMethod(implObj, "suspendRedraw"), flags, 3)
        this.vtbl.unsuspendRedraw := CallbackCreate(GetMethod(implObj, "unsuspendRedraw"), flags, 2)
        this.vtbl.unsuspendRedrawAll := CallbackCreate(GetMethod(implObj, "unsuspendRedrawAll"), flags, 1)
        this.vtbl.forceRedraw := CallbackCreate(GetMethod(implObj, "forceRedraw"), flags, 1)
        this.vtbl.pauseAnimations := CallbackCreate(GetMethod(implObj, "pauseAnimations"), flags, 1)
        this.vtbl.unpauseAnimations := CallbackCreate(GetMethod(implObj, "unpauseAnimations"), flags, 1)
        this.vtbl.animationsPaused := CallbackCreate(GetMethod(implObj, "animationsPaused"), flags, 2)
        this.vtbl.getCurrentTime := CallbackCreate(GetMethod(implObj, "getCurrentTime"), flags, 2)
        this.vtbl.setCurrentTime := CallbackCreate(GetMethod(implObj, "setCurrentTime"), flags, 2)
        this.vtbl.getIntersectionList := CallbackCreate(GetMethod(implObj, "getIntersectionList"), flags, 4)
        this.vtbl.getEnclosureList := CallbackCreate(GetMethod(implObj, "getEnclosureList"), flags, 4)
        this.vtbl.checkIntersection := CallbackCreate(GetMethod(implObj, "checkIntersection"), flags, 4)
        this.vtbl.checkEnclosure := CallbackCreate(GetMethod(implObj, "checkEnclosure"), flags, 4)
        this.vtbl.deselectAll := CallbackCreate(GetMethod(implObj, "deselectAll"), flags, 1)
        this.vtbl.createSVGNumber := CallbackCreate(GetMethod(implObj, "createSVGNumber"), flags, 2)
        this.vtbl.createSVGLength := CallbackCreate(GetMethod(implObj, "createSVGLength"), flags, 2)
        this.vtbl.createSVGAngle := CallbackCreate(GetMethod(implObj, "createSVGAngle"), flags, 2)
        this.vtbl.createSVGPoint := CallbackCreate(GetMethod(implObj, "createSVGPoint"), flags, 2)
        this.vtbl.createSVGMatrix := CallbackCreate(GetMethod(implObj, "createSVGMatrix"), flags, 2)
        this.vtbl.createSVGRect := CallbackCreate(GetMethod(implObj, "createSVGRect"), flags, 2)
        this.vtbl.createSVGTransform := CallbackCreate(GetMethod(implObj, "createSVGTransform"), flags, 2)
        this.vtbl.createSVGTransformFromMatrix := CallbackCreate(GetMethod(implObj, "createSVGTransformFromMatrix"), flags, 3)
        this.vtbl.getElementById := CallbackCreate(GetMethod(implObj, "getElementById"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_x)
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.putref_y)
        CallbackFree(this.vtbl.get_y)
        CallbackFree(this.vtbl.putref_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.putref_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.put_contentScriptType)
        CallbackFree(this.vtbl.get_contentScriptType)
        CallbackFree(this.vtbl.put_contentStyleType)
        CallbackFree(this.vtbl.get_contentStyleType)
        CallbackFree(this.vtbl.putref_viewport)
        CallbackFree(this.vtbl.get_viewport)
        CallbackFree(this.vtbl.put_pixelUnitToMillimeterX)
        CallbackFree(this.vtbl.get_pixelUnitToMillimeterX)
        CallbackFree(this.vtbl.put_pixelUnitToMillimeterY)
        CallbackFree(this.vtbl.get_pixelUnitToMillimeterY)
        CallbackFree(this.vtbl.put_screenPixelToMillimeterX)
        CallbackFree(this.vtbl.get_screenPixelToMillimeterX)
        CallbackFree(this.vtbl.put_screenPixelToMillimeterY)
        CallbackFree(this.vtbl.get_screenPixelToMillimeterY)
        CallbackFree(this.vtbl.put_useCurrentView)
        CallbackFree(this.vtbl.get_useCurrentView)
        CallbackFree(this.vtbl.putref_currentView)
        CallbackFree(this.vtbl.get_currentView)
        CallbackFree(this.vtbl.put_currentScale)
        CallbackFree(this.vtbl.get_currentScale)
        CallbackFree(this.vtbl.putref_currentTranslate)
        CallbackFree(this.vtbl.get_currentTranslate)
        CallbackFree(this.vtbl.suspendRedraw)
        CallbackFree(this.vtbl.unsuspendRedraw)
        CallbackFree(this.vtbl.unsuspendRedrawAll)
        CallbackFree(this.vtbl.forceRedraw)
        CallbackFree(this.vtbl.pauseAnimations)
        CallbackFree(this.vtbl.unpauseAnimations)
        CallbackFree(this.vtbl.animationsPaused)
        CallbackFree(this.vtbl.getCurrentTime)
        CallbackFree(this.vtbl.setCurrentTime)
        CallbackFree(this.vtbl.getIntersectionList)
        CallbackFree(this.vtbl.getEnclosureList)
        CallbackFree(this.vtbl.checkIntersection)
        CallbackFree(this.vtbl.checkEnclosure)
        CallbackFree(this.vtbl.deselectAll)
        CallbackFree(this.vtbl.createSVGNumber)
        CallbackFree(this.vtbl.createSVGLength)
        CallbackFree(this.vtbl.createSVGAngle)
        CallbackFree(this.vtbl.createSVGPoint)
        CallbackFree(this.vtbl.createSVGMatrix)
        CallbackFree(this.vtbl.createSVGRect)
        CallbackFree(this.vtbl.createSVGTransform)
        CallbackFree(this.vtbl.createSVGTransformFromMatrix)
        CallbackFree(this.vtbl.getElementById)
    }
}
