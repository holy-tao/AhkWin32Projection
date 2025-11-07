#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCSSStyleDeclaration2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCSSStyleDeclaration2
     * @type {Guid}
     */
    static IID => Guid("{305107d1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_msScrollChaining", "get_msScrollChaining", "put_msContentZooming", "get_msContentZooming", "put_msContentZoomSnapType", "get_msContentZoomSnapType", "put_msScrollRails", "get_msScrollRails", "put_msContentZoomChaining", "get_msContentZoomChaining", "put_msScrollSnapType", "get_msScrollSnapType", "put_msContentZoomLimit", "get_msContentZoomLimit", "put_msContentZoomSnap", "get_msContentZoomSnap", "put_msContentZoomSnapPoints", "get_msContentZoomSnapPoints", "put_msContentZoomLimitMin", "get_msContentZoomLimitMin", "put_msContentZoomLimitMax", "get_msContentZoomLimitMax", "put_msScrollSnapX", "get_msScrollSnapX", "put_msScrollSnapY", "get_msScrollSnapY", "put_msScrollSnapPointsX", "get_msScrollSnapPointsX", "put_msScrollSnapPointsY", "get_msScrollSnapPointsY", "put_msGridColumn", "get_msGridColumn", "put_msGridColumnAlign", "get_msGridColumnAlign", "put_msGridColumns", "get_msGridColumns", "put_msGridColumnSpan", "get_msGridColumnSpan", "put_msGridRow", "get_msGridRow", "put_msGridRowAlign", "get_msGridRowAlign", "put_msGridRows", "get_msGridRows", "put_msGridRowSpan", "get_msGridRowSpan", "put_msWrapThrough", "get_msWrapThrough", "put_msWrapMargin", "get_msWrapMargin", "put_msWrapFlow", "get_msWrapFlow", "put_msAnimationName", "get_msAnimationName", "put_msAnimationDuration", "get_msAnimationDuration", "put_msAnimationTimingFunction", "get_msAnimationTimingFunction", "put_msAnimationDelay", "get_msAnimationDelay", "put_msAnimationDirection", "get_msAnimationDirection", "put_msAnimationPlayState", "get_msAnimationPlayState", "put_msAnimationIterationCount", "get_msAnimationIterationCount", "put_msAnimation", "get_msAnimation", "put_msAnimationFillMode", "get_msAnimationFillMode", "put_colorInterpolationFilters", "get_colorInterpolationFilters", "put_columnCount", "get_columnCount", "put_columnWidth", "get_columnWidth", "put_columnGap", "get_columnGap", "put_columnFill", "get_columnFill", "put_columnSpan", "get_columnSpan", "put_columns", "get_columns", "put_columnRule", "get_columnRule", "put_columnRuleColor", "get_columnRuleColor", "put_columnRuleStyle", "get_columnRuleStyle", "put_columnRuleWidth", "get_columnRuleWidth", "put_breakBefore", "get_breakBefore", "put_breakAfter", "get_breakAfter", "put_breakInside", "get_breakInside", "put_floodColor", "get_floodColor", "put_floodOpacity", "get_floodOpacity", "put_lightingColor", "get_lightingColor", "put_msScrollLimitXMin", "get_msScrollLimitXMin", "put_msScrollLimitYMin", "get_msScrollLimitYMin", "put_msScrollLimitXMax", "get_msScrollLimitXMax", "put_msScrollLimitYMax", "get_msScrollLimitYMax", "put_msScrollLimit", "get_msScrollLimit", "put_textShadow", "get_textShadow", "put_msFlowFrom", "get_msFlowFrom", "put_msFlowInto", "get_msFlowInto", "put_msHyphens", "get_msHyphens", "put_msHyphenateLimitZone", "get_msHyphenateLimitZone", "put_msHyphenateLimitChars", "get_msHyphenateLimitChars", "put_msHyphenateLimitLines", "get_msHyphenateLimitLines", "put_msHighContrastAdjust", "get_msHighContrastAdjust", "put_enableBackground", "get_enableBackground", "put_msFontFeatureSettings", "get_msFontFeatureSettings", "put_msUserSelect", "get_msUserSelect", "put_msOverflowStyle", "get_msOverflowStyle", "put_msTransformStyle", "get_msTransformStyle", "put_msBackfaceVisibility", "get_msBackfaceVisibility", "put_msPerspective", "get_msPerspective", "put_msPerspectiveOrigin", "get_msPerspectiveOrigin", "put_msTransitionProperty", "get_msTransitionProperty", "put_msTransitionDuration", "get_msTransitionDuration", "put_msTransitionTimingFunction", "get_msTransitionTimingFunction", "put_msTransitionDelay", "get_msTransitionDelay", "put_msTransition", "get_msTransition", "put_msTouchAction", "get_msTouchAction", "put_msScrollTranslation", "get_msScrollTranslation", "put_msFlex", "get_msFlex", "put_msFlexPositive", "get_msFlexPositive", "put_msFlexNegative", "get_msFlexNegative", "put_msFlexPreferredSize", "get_msFlexPreferredSize", "put_msFlexFlow", "get_msFlexFlow", "put_msFlexDirection", "get_msFlexDirection", "put_msFlexWrap", "get_msFlexWrap", "put_msFlexAlign", "get_msFlexAlign", "put_msFlexItemAlign", "get_msFlexItemAlign", "put_msFlexPack", "get_msFlexPack", "put_msFlexLinePack", "get_msFlexLinePack", "put_msFlexOrder", "get_msFlexOrder", "put_msTouchSelect", "get_msTouchSelect", "put_transform", "get_transform", "put_transformOrigin", "get_transformOrigin", "put_transformStyle", "get_transformStyle", "put_backfaceVisibility", "get_backfaceVisibility", "put_perspective", "get_perspective", "put_perspectiveOrigin", "get_perspectiveOrigin", "put_transitionProperty", "get_transitionProperty", "put_transitionDuration", "get_transitionDuration", "put_transitionTimingFunction", "get_transitionTimingFunction", "put_transitionDelay", "get_transitionDelay", "put_transition", "get_transition", "put_fontFeatureSettings", "get_fontFeatureSettings", "put_animationName", "get_animationName", "put_animationDuration", "get_animationDuration", "put_animationTimingFunction", "get_animationTimingFunction", "put_animationDelay", "get_animationDelay", "put_animationDirection", "get_animationDirection", "put_animationPlayState", "get_animationPlayState", "put_animationIterationCount", "get_animationIterationCount", "put_animation", "get_animation", "put_animationFillMode", "get_animationFillMode"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollChaining(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollChaining() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZooming(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZooming() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomSnapType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomSnapType() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollRails(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollRails() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomChaining(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomChaining() {
        p := BSTR()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapType() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomLimit(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomLimit() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomSnap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomSnap() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomSnapPoints(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomSnapPoints() {
        p := BSTR()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomLimitMin(v) {
        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msContentZoomLimitMin() {
        p := VARIANT()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomLimitMax(v) {
        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msContentZoomLimitMax() {
        p := VARIANT()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapX(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapX() {
        p := BSTR()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapY(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapY() {
        p := BSTR()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapPointsX(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapPointsX() {
        p := BSTR()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapPointsY(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapPointsY() {
        p := BSTR()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msGridColumn(v) {
        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msGridColumn() {
        p := VARIANT()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msGridColumnAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msGridColumnAlign() {
        p := BSTR()
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msGridColumns(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msGridColumns() {
        p := BSTR()
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msGridColumnSpan(v) {
        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msGridColumnSpan() {
        p := VARIANT()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msGridRow(v) {
        result := ComCall(45, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msGridRow() {
        p := VARIANT()
        result := ComCall(46, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msGridRowAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(47, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msGridRowAlign() {
        p := BSTR()
        result := ComCall(48, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msGridRows(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(49, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msGridRows() {
        p := BSTR()
        result := ComCall(50, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msGridRowSpan(v) {
        result := ComCall(51, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msGridRowSpan() {
        p := VARIANT()
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msWrapThrough(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msWrapThrough() {
        p := BSTR()
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msWrapMargin(v) {
        result := ComCall(55, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msWrapMargin() {
        p := VARIANT()
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msWrapFlow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msWrapFlow() {
        p := BSTR()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(59, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationName() {
        p := BSTR()
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationDuration() {
        p := BSTR()
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationTimingFunction() {
        p := BSTR()
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(65, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationDelay() {
        p := BSTR()
        result := ComCall(66, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(67, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationDirection() {
        p := BSTR()
        result := ComCall(68, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationPlayState(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(69, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationPlayState() {
        p := BSTR()
        result := ComCall(70, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationIterationCount(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(71, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationIterationCount() {
        p := BSTR()
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(73, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimation() {
        p := BSTR()
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationFillMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(75, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationFillMode() {
        p := BSTR()
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_colorInterpolationFilters(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(77, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_colorInterpolationFilters() {
        p := BSTR()
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnCount(v) {
        result := ComCall(79, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnCount() {
        p := VARIANT()
        result := ComCall(80, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnWidth(v) {
        result := ComCall(81, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnWidth() {
        p := VARIANT()
        result := ComCall(82, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnGap(v) {
        result := ComCall(83, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnGap() {
        p := VARIANT()
        result := ComCall(84, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columnFill(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(85, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columnFill() {
        p := BSTR()
        result := ComCall(86, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columnSpan(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(87, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columnSpan() {
        p := BSTR()
        result := ComCall(88, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columns(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(89, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columns() {
        p := BSTR()
        result := ComCall(90, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columnRule(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(91, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columnRule() {
        p := BSTR()
        result := ComCall(92, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnRuleColor(v) {
        result := ComCall(93, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnRuleColor() {
        p := VARIANT()
        result := ComCall(94, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columnRuleStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(95, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columnRuleStyle() {
        p := BSTR()
        result := ComCall(96, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnRuleWidth(v) {
        result := ComCall(97, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnRuleWidth() {
        p := VARIANT()
        result := ComCall(98, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_breakBefore(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(99, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_breakBefore() {
        p := BSTR()
        result := ComCall(100, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_breakAfter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(101, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_breakAfter() {
        p := BSTR()
        result := ComCall(102, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_breakInside(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(103, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_breakInside() {
        p := BSTR()
        result := ComCall(104, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_floodColor(v) {
        result := ComCall(105, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_floodColor() {
        p := VARIANT()
        result := ComCall(106, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_floodOpacity(v) {
        result := ComCall(107, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_floodOpacity() {
        p := VARIANT()
        result := ComCall(108, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_lightingColor(v) {
        result := ComCall(109, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_lightingColor() {
        p := VARIANT()
        result := ComCall(110, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimitXMin(v) {
        result := ComCall(111, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msScrollLimitXMin() {
        p := VARIANT()
        result := ComCall(112, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimitYMin(v) {
        result := ComCall(113, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msScrollLimitYMin() {
        p := VARIANT()
        result := ComCall(114, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimitXMax(v) {
        result := ComCall(115, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msScrollLimitXMax() {
        p := VARIANT()
        result := ComCall(116, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimitYMax(v) {
        result := ComCall(117, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msScrollLimitYMax() {
        p := VARIANT()
        result := ComCall(118, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimit(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(119, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollLimit() {
        p := BSTR()
        result := ComCall(120, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textShadow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(121, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textShadow() {
        p := BSTR()
        result := ComCall(122, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlowFrom(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(123, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlowFrom() {
        p := BSTR()
        result := ComCall(124, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlowInto(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(125, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlowInto() {
        p := BSTR()
        result := ComCall(126, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msHyphens(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(127, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msHyphens() {
        p := BSTR()
        result := ComCall(128, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msHyphenateLimitZone(v) {
        result := ComCall(129, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msHyphenateLimitZone() {
        p := VARIANT()
        result := ComCall(130, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msHyphenateLimitChars(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(131, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msHyphenateLimitChars() {
        p := BSTR()
        result := ComCall(132, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msHyphenateLimitLines(v) {
        result := ComCall(133, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msHyphenateLimitLines() {
        p := VARIANT()
        result := ComCall(134, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msHighContrastAdjust(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(135, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msHighContrastAdjust() {
        p := BSTR()
        result := ComCall(136, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_enableBackground(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(137, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_enableBackground() {
        p := BSTR()
        result := ComCall(138, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFontFeatureSettings(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(139, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFontFeatureSettings() {
        p := BSTR()
        result := ComCall(140, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msUserSelect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(141, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msUserSelect() {
        p := BSTR()
        result := ComCall(142, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msOverflowStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(143, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msOverflowStyle() {
        p := BSTR()
        result := ComCall(144, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransformStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(145, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransformStyle() {
        p := BSTR()
        result := ComCall(146, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msBackfaceVisibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(147, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msBackfaceVisibility() {
        p := BSTR()
        result := ComCall(148, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msPerspective(v) {
        result := ComCall(149, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msPerspective() {
        p := VARIANT()
        result := ComCall(150, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msPerspectiveOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(151, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msPerspectiveOrigin() {
        p := BSTR()
        result := ComCall(152, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransitionProperty(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(153, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransitionProperty() {
        p := BSTR()
        result := ComCall(154, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransitionDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(155, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransitionDuration() {
        p := BSTR()
        result := ComCall(156, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransitionTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(157, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransitionTimingFunction() {
        p := BSTR()
        result := ComCall(158, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransitionDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(159, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransitionDelay() {
        p := BSTR()
        result := ComCall(160, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(161, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransition() {
        p := BSTR()
        result := ComCall(162, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTouchAction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(163, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTouchAction() {
        p := BSTR()
        result := ComCall(164, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollTranslation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(165, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollTranslation() {
        p := BSTR()
        result := ComCall(166, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlex(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(167, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlex() {
        p := BSTR()
        result := ComCall(168, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msFlexPositive(v) {
        result := ComCall(169, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msFlexPositive() {
        p := VARIANT()
        result := ComCall(170, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msFlexNegative(v) {
        result := ComCall(171, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msFlexNegative() {
        p := VARIANT()
        result := ComCall(172, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msFlexPreferredSize(v) {
        result := ComCall(173, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msFlexPreferredSize() {
        p := VARIANT()
        result := ComCall(174, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexFlow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(175, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexFlow() {
        p := BSTR()
        result := ComCall(176, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(177, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexDirection() {
        p := BSTR()
        result := ComCall(178, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexWrap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(179, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexWrap() {
        p := BSTR()
        result := ComCall(180, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(181, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexAlign() {
        p := BSTR()
        result := ComCall(182, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexItemAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(183, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexItemAlign() {
        p := BSTR()
        result := ComCall(184, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexPack(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(185, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexPack() {
        p := BSTR()
        result := ComCall(186, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexLinePack(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(187, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexLinePack() {
        p := BSTR()
        result := ComCall(188, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msFlexOrder(v) {
        result := ComCall(189, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msFlexOrder() {
        p := VARIANT()
        result := ComCall(190, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTouchSelect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(191, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTouchSelect() {
        p := BSTR()
        result := ComCall(192, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(193, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transform() {
        p := BSTR()
        result := ComCall(194, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transformOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(195, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transformOrigin() {
        p := BSTR()
        result := ComCall(196, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transformStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(197, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transformStyle() {
        p := BSTR()
        result := ComCall(198, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backfaceVisibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(199, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backfaceVisibility() {
        p := BSTR()
        result := ComCall(200, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_perspective(v) {
        result := ComCall(201, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_perspective() {
        p := VARIANT()
        result := ComCall(202, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_perspectiveOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(203, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_perspectiveOrigin() {
        p := BSTR()
        result := ComCall(204, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transitionProperty(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(205, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transitionProperty() {
        p := BSTR()
        result := ComCall(206, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transitionDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(207, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transitionDuration() {
        p := BSTR()
        result := ComCall(208, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transitionTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(209, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transitionTimingFunction() {
        p := BSTR()
        result := ComCall(210, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transitionDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(211, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transitionDelay() {
        p := BSTR()
        result := ComCall(212, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(213, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transition() {
        p := BSTR()
        result := ComCall(214, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontFeatureSettings(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(215, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontFeatureSettings() {
        p := BSTR()
        result := ComCall(216, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(217, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationName() {
        p := BSTR()
        result := ComCall(218, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(219, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationDuration() {
        p := BSTR()
        result := ComCall(220, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(221, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationTimingFunction() {
        p := BSTR()
        result := ComCall(222, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(223, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationDelay() {
        p := BSTR()
        result := ComCall(224, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(225, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationDirection() {
        p := BSTR()
        result := ComCall(226, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationPlayState(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(227, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationPlayState() {
        p := BSTR()
        result := ComCall(228, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationIterationCount(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(229, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationIterationCount() {
        p := BSTR()
        result := ComCall(230, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(231, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animation() {
        p := BSTR()
        result := ComCall(232, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationFillMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(233, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationFillMode() {
        p := BSTR()
        result := ComCall(234, this, "ptr", p, "HRESULT")
        return p
    }
}
