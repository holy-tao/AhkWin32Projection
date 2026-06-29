#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCSSStyleDeclaration2 extends IDispatch {
    /**
     * The interface identifier for IHTMLCSSStyleDeclaration2
     * @type {Guid}
     */
    static IID := Guid("{305107d1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCSSStyleDeclaration2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_msScrollChaining           : IntPtr
        get_msScrollChaining           : IntPtr
        put_msContentZooming           : IntPtr
        get_msContentZooming           : IntPtr
        put_msContentZoomSnapType      : IntPtr
        get_msContentZoomSnapType      : IntPtr
        put_msScrollRails              : IntPtr
        get_msScrollRails              : IntPtr
        put_msContentZoomChaining      : IntPtr
        get_msContentZoomChaining      : IntPtr
        put_msScrollSnapType           : IntPtr
        get_msScrollSnapType           : IntPtr
        put_msContentZoomLimit         : IntPtr
        get_msContentZoomLimit         : IntPtr
        put_msContentZoomSnap          : IntPtr
        get_msContentZoomSnap          : IntPtr
        put_msContentZoomSnapPoints    : IntPtr
        get_msContentZoomSnapPoints    : IntPtr
        put_msContentZoomLimitMin      : IntPtr
        get_msContentZoomLimitMin      : IntPtr
        put_msContentZoomLimitMax      : IntPtr
        get_msContentZoomLimitMax      : IntPtr
        put_msScrollSnapX              : IntPtr
        get_msScrollSnapX              : IntPtr
        put_msScrollSnapY              : IntPtr
        get_msScrollSnapY              : IntPtr
        put_msScrollSnapPointsX        : IntPtr
        get_msScrollSnapPointsX        : IntPtr
        put_msScrollSnapPointsY        : IntPtr
        get_msScrollSnapPointsY        : IntPtr
        put_msGridColumn               : IntPtr
        get_msGridColumn               : IntPtr
        put_msGridColumnAlign          : IntPtr
        get_msGridColumnAlign          : IntPtr
        put_msGridColumns              : IntPtr
        get_msGridColumns              : IntPtr
        put_msGridColumnSpan           : IntPtr
        get_msGridColumnSpan           : IntPtr
        put_msGridRow                  : IntPtr
        get_msGridRow                  : IntPtr
        put_msGridRowAlign             : IntPtr
        get_msGridRowAlign             : IntPtr
        put_msGridRows                 : IntPtr
        get_msGridRows                 : IntPtr
        put_msGridRowSpan              : IntPtr
        get_msGridRowSpan              : IntPtr
        put_msWrapThrough              : IntPtr
        get_msWrapThrough              : IntPtr
        put_msWrapMargin               : IntPtr
        get_msWrapMargin               : IntPtr
        put_msWrapFlow                 : IntPtr
        get_msWrapFlow                 : IntPtr
        put_msAnimationName            : IntPtr
        get_msAnimationName            : IntPtr
        put_msAnimationDuration        : IntPtr
        get_msAnimationDuration        : IntPtr
        put_msAnimationTimingFunction  : IntPtr
        get_msAnimationTimingFunction  : IntPtr
        put_msAnimationDelay           : IntPtr
        get_msAnimationDelay           : IntPtr
        put_msAnimationDirection       : IntPtr
        get_msAnimationDirection       : IntPtr
        put_msAnimationPlayState       : IntPtr
        get_msAnimationPlayState       : IntPtr
        put_msAnimationIterationCount  : IntPtr
        get_msAnimationIterationCount  : IntPtr
        put_msAnimation                : IntPtr
        get_msAnimation                : IntPtr
        put_msAnimationFillMode        : IntPtr
        get_msAnimationFillMode        : IntPtr
        put_colorInterpolationFilters  : IntPtr
        get_colorInterpolationFilters  : IntPtr
        put_columnCount                : IntPtr
        get_columnCount                : IntPtr
        put_columnWidth                : IntPtr
        get_columnWidth                : IntPtr
        put_columnGap                  : IntPtr
        get_columnGap                  : IntPtr
        put_columnFill                 : IntPtr
        get_columnFill                 : IntPtr
        put_columnSpan                 : IntPtr
        get_columnSpan                 : IntPtr
        put_columns                    : IntPtr
        get_columns                    : IntPtr
        put_columnRule                 : IntPtr
        get_columnRule                 : IntPtr
        put_columnRuleColor            : IntPtr
        get_columnRuleColor            : IntPtr
        put_columnRuleStyle            : IntPtr
        get_columnRuleStyle            : IntPtr
        put_columnRuleWidth            : IntPtr
        get_columnRuleWidth            : IntPtr
        put_breakBefore                : IntPtr
        get_breakBefore                : IntPtr
        put_breakAfter                 : IntPtr
        get_breakAfter                 : IntPtr
        put_breakInside                : IntPtr
        get_breakInside                : IntPtr
        put_floodColor                 : IntPtr
        get_floodColor                 : IntPtr
        put_floodOpacity               : IntPtr
        get_floodOpacity               : IntPtr
        put_lightingColor              : IntPtr
        get_lightingColor              : IntPtr
        put_msScrollLimitXMin          : IntPtr
        get_msScrollLimitXMin          : IntPtr
        put_msScrollLimitYMin          : IntPtr
        get_msScrollLimitYMin          : IntPtr
        put_msScrollLimitXMax          : IntPtr
        get_msScrollLimitXMax          : IntPtr
        put_msScrollLimitYMax          : IntPtr
        get_msScrollLimitYMax          : IntPtr
        put_msScrollLimit              : IntPtr
        get_msScrollLimit              : IntPtr
        put_textShadow                 : IntPtr
        get_textShadow                 : IntPtr
        put_msFlowFrom                 : IntPtr
        get_msFlowFrom                 : IntPtr
        put_msFlowInto                 : IntPtr
        get_msFlowInto                 : IntPtr
        put_msHyphens                  : IntPtr
        get_msHyphens                  : IntPtr
        put_msHyphenateLimitZone       : IntPtr
        get_msHyphenateLimitZone       : IntPtr
        put_msHyphenateLimitChars      : IntPtr
        get_msHyphenateLimitChars      : IntPtr
        put_msHyphenateLimitLines      : IntPtr
        get_msHyphenateLimitLines      : IntPtr
        put_msHighContrastAdjust       : IntPtr
        get_msHighContrastAdjust       : IntPtr
        put_enableBackground           : IntPtr
        get_enableBackground           : IntPtr
        put_msFontFeatureSettings      : IntPtr
        get_msFontFeatureSettings      : IntPtr
        put_msUserSelect               : IntPtr
        get_msUserSelect               : IntPtr
        put_msOverflowStyle            : IntPtr
        get_msOverflowStyle            : IntPtr
        put_msTransformStyle           : IntPtr
        get_msTransformStyle           : IntPtr
        put_msBackfaceVisibility       : IntPtr
        get_msBackfaceVisibility       : IntPtr
        put_msPerspective              : IntPtr
        get_msPerspective              : IntPtr
        put_msPerspectiveOrigin        : IntPtr
        get_msPerspectiveOrigin        : IntPtr
        put_msTransitionProperty       : IntPtr
        get_msTransitionProperty       : IntPtr
        put_msTransitionDuration       : IntPtr
        get_msTransitionDuration       : IntPtr
        put_msTransitionTimingFunction : IntPtr
        get_msTransitionTimingFunction : IntPtr
        put_msTransitionDelay          : IntPtr
        get_msTransitionDelay          : IntPtr
        put_msTransition               : IntPtr
        get_msTransition               : IntPtr
        put_msTouchAction              : IntPtr
        get_msTouchAction              : IntPtr
        put_msScrollTranslation        : IntPtr
        get_msScrollTranslation        : IntPtr
        put_msFlex                     : IntPtr
        get_msFlex                     : IntPtr
        put_msFlexPositive             : IntPtr
        get_msFlexPositive             : IntPtr
        put_msFlexNegative             : IntPtr
        get_msFlexNegative             : IntPtr
        put_msFlexPreferredSize        : IntPtr
        get_msFlexPreferredSize        : IntPtr
        put_msFlexFlow                 : IntPtr
        get_msFlexFlow                 : IntPtr
        put_msFlexDirection            : IntPtr
        get_msFlexDirection            : IntPtr
        put_msFlexWrap                 : IntPtr
        get_msFlexWrap                 : IntPtr
        put_msFlexAlign                : IntPtr
        get_msFlexAlign                : IntPtr
        put_msFlexItemAlign            : IntPtr
        get_msFlexItemAlign            : IntPtr
        put_msFlexPack                 : IntPtr
        get_msFlexPack                 : IntPtr
        put_msFlexLinePack             : IntPtr
        get_msFlexLinePack             : IntPtr
        put_msFlexOrder                : IntPtr
        get_msFlexOrder                : IntPtr
        put_msTouchSelect              : IntPtr
        get_msTouchSelect              : IntPtr
        put_transform                  : IntPtr
        get_transform                  : IntPtr
        put_transformOrigin            : IntPtr
        get_transformOrigin            : IntPtr
        put_transformStyle             : IntPtr
        get_transformStyle             : IntPtr
        put_backfaceVisibility         : IntPtr
        get_backfaceVisibility         : IntPtr
        put_perspective                : IntPtr
        get_perspective                : IntPtr
        put_perspectiveOrigin          : IntPtr
        get_perspectiveOrigin          : IntPtr
        put_transitionProperty         : IntPtr
        get_transitionProperty         : IntPtr
        put_transitionDuration         : IntPtr
        get_transitionDuration         : IntPtr
        put_transitionTimingFunction   : IntPtr
        get_transitionTimingFunction   : IntPtr
        put_transitionDelay            : IntPtr
        get_transitionDelay            : IntPtr
        put_transition                 : IntPtr
        get_transition                 : IntPtr
        put_fontFeatureSettings        : IntPtr
        get_fontFeatureSettings        : IntPtr
        put_animationName              : IntPtr
        get_animationName              : IntPtr
        put_animationDuration          : IntPtr
        get_animationDuration          : IntPtr
        put_animationTimingFunction    : IntPtr
        get_animationTimingFunction    : IntPtr
        put_animationDelay             : IntPtr
        get_animationDelay             : IntPtr
        put_animationDirection         : IntPtr
        get_animationDirection         : IntPtr
        put_animationPlayState         : IntPtr
        get_animationPlayState         : IntPtr
        put_animationIterationCount    : IntPtr
        get_animationIterationCount    : IntPtr
        put_animation                  : IntPtr
        get_animation                  : IntPtr
        put_animationFillMode          : IntPtr
        get_animationFillMode          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCSSStyleDeclaration2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    msScrollChaining {
        get => this.get_msScrollChaining()
        set => this.put_msScrollChaining(value)
    }

    /**
     * @type {BSTR} 
     */
    msContentZooming {
        get => this.get_msContentZooming()
        set => this.put_msContentZooming(value)
    }

    /**
     * @type {BSTR} 
     */
    msContentZoomSnapType {
        get => this.get_msContentZoomSnapType()
        set => this.put_msContentZoomSnapType(value)
    }

    /**
     * @type {BSTR} 
     */
    msScrollRails {
        get => this.get_msScrollRails()
        set => this.put_msScrollRails(value)
    }

    /**
     * @type {BSTR} 
     */
    msContentZoomChaining {
        get => this.get_msContentZoomChaining()
        set => this.put_msContentZoomChaining(value)
    }

    /**
     * @type {BSTR} 
     */
    msScrollSnapType {
        get => this.get_msScrollSnapType()
        set => this.put_msScrollSnapType(value)
    }

    /**
     * @type {BSTR} 
     */
    msContentZoomLimit {
        get => this.get_msContentZoomLimit()
        set => this.put_msContentZoomLimit(value)
    }

    /**
     * @type {BSTR} 
     */
    msContentZoomSnap {
        get => this.get_msContentZoomSnap()
        set => this.put_msContentZoomSnap(value)
    }

    /**
     * @type {BSTR} 
     */
    msContentZoomSnapPoints {
        get => this.get_msContentZoomSnapPoints()
        set => this.put_msContentZoomSnapPoints(value)
    }

    /**
     * @type {VARIANT} 
     */
    msContentZoomLimitMin {
        get => this.get_msContentZoomLimitMin()
        set => this.put_msContentZoomLimitMin(value)
    }

    /**
     * @type {VARIANT} 
     */
    msContentZoomLimitMax {
        get => this.get_msContentZoomLimitMax()
        set => this.put_msContentZoomLimitMax(value)
    }

    /**
     * @type {BSTR} 
     */
    msScrollSnapX {
        get => this.get_msScrollSnapX()
        set => this.put_msScrollSnapX(value)
    }

    /**
     * @type {BSTR} 
     */
    msScrollSnapY {
        get => this.get_msScrollSnapY()
        set => this.put_msScrollSnapY(value)
    }

    /**
     * @type {BSTR} 
     */
    msScrollSnapPointsX {
        get => this.get_msScrollSnapPointsX()
        set => this.put_msScrollSnapPointsX(value)
    }

    /**
     * @type {BSTR} 
     */
    msScrollSnapPointsY {
        get => this.get_msScrollSnapPointsY()
        set => this.put_msScrollSnapPointsY(value)
    }

    /**
     * @type {VARIANT} 
     */
    msGridColumn {
        get => this.get_msGridColumn()
        set => this.put_msGridColumn(value)
    }

    /**
     * @type {BSTR} 
     */
    msGridColumnAlign {
        get => this.get_msGridColumnAlign()
        set => this.put_msGridColumnAlign(value)
    }

    /**
     * @type {BSTR} 
     */
    msGridColumns {
        get => this.get_msGridColumns()
        set => this.put_msGridColumns(value)
    }

    /**
     * @type {VARIANT} 
     */
    msGridColumnSpan {
        get => this.get_msGridColumnSpan()
        set => this.put_msGridColumnSpan(value)
    }

    /**
     * @type {VARIANT} 
     */
    msGridRow {
        get => this.get_msGridRow()
        set => this.put_msGridRow(value)
    }

    /**
     * @type {BSTR} 
     */
    msGridRowAlign {
        get => this.get_msGridRowAlign()
        set => this.put_msGridRowAlign(value)
    }

    /**
     * @type {BSTR} 
     */
    msGridRows {
        get => this.get_msGridRows()
        set => this.put_msGridRows(value)
    }

    /**
     * @type {VARIANT} 
     */
    msGridRowSpan {
        get => this.get_msGridRowSpan()
        set => this.put_msGridRowSpan(value)
    }

    /**
     * @type {BSTR} 
     */
    msWrapThrough {
        get => this.get_msWrapThrough()
        set => this.put_msWrapThrough(value)
    }

    /**
     * @type {VARIANT} 
     */
    msWrapMargin {
        get => this.get_msWrapMargin()
        set => this.put_msWrapMargin(value)
    }

    /**
     * @type {BSTR} 
     */
    msWrapFlow {
        get => this.get_msWrapFlow()
        set => this.put_msWrapFlow(value)
    }

    /**
     * @type {BSTR} 
     */
    msAnimationName {
        get => this.get_msAnimationName()
        set => this.put_msAnimationName(value)
    }

    /**
     * @type {BSTR} 
     */
    msAnimationDuration {
        get => this.get_msAnimationDuration()
        set => this.put_msAnimationDuration(value)
    }

    /**
     * @type {BSTR} 
     */
    msAnimationTimingFunction {
        get => this.get_msAnimationTimingFunction()
        set => this.put_msAnimationTimingFunction(value)
    }

    /**
     * @type {BSTR} 
     */
    msAnimationDelay {
        get => this.get_msAnimationDelay()
        set => this.put_msAnimationDelay(value)
    }

    /**
     * @type {BSTR} 
     */
    msAnimationDirection {
        get => this.get_msAnimationDirection()
        set => this.put_msAnimationDirection(value)
    }

    /**
     * @type {BSTR} 
     */
    msAnimationPlayState {
        get => this.get_msAnimationPlayState()
        set => this.put_msAnimationPlayState(value)
    }

    /**
     * @type {BSTR} 
     */
    msAnimationIterationCount {
        get => this.get_msAnimationIterationCount()
        set => this.put_msAnimationIterationCount(value)
    }

    /**
     * @type {BSTR} 
     */
    msAnimation {
        get => this.get_msAnimation()
        set => this.put_msAnimation(value)
    }

    /**
     * @type {BSTR} 
     */
    msAnimationFillMode {
        get => this.get_msAnimationFillMode()
        set => this.put_msAnimationFillMode(value)
    }

    /**
     * @type {BSTR} 
     */
    colorInterpolationFilters {
        get => this.get_colorInterpolationFilters()
        set => this.put_colorInterpolationFilters(value)
    }

    /**
     * @type {VARIANT} 
     */
    columnCount {
        get => this.get_columnCount()
        set => this.put_columnCount(value)
    }

    /**
     * @type {VARIANT} 
     */
    columnWidth {
        get => this.get_columnWidth()
        set => this.put_columnWidth(value)
    }

    /**
     * @type {VARIANT} 
     */
    columnGap {
        get => this.get_columnGap()
        set => this.put_columnGap(value)
    }

    /**
     * @type {BSTR} 
     */
    columnFill {
        get => this.get_columnFill()
        set => this.put_columnFill(value)
    }

    /**
     * @type {BSTR} 
     */
    columnSpan {
        get => this.get_columnSpan()
        set => this.put_columnSpan(value)
    }

    /**
     * @type {BSTR} 
     */
    columns {
        get => this.get_columns()
        set => this.put_columns(value)
    }

    /**
     * @type {BSTR} 
     */
    columnRule {
        get => this.get_columnRule()
        set => this.put_columnRule(value)
    }

    /**
     * @type {VARIANT} 
     */
    columnRuleColor {
        get => this.get_columnRuleColor()
        set => this.put_columnRuleColor(value)
    }

    /**
     * @type {BSTR} 
     */
    columnRuleStyle {
        get => this.get_columnRuleStyle()
        set => this.put_columnRuleStyle(value)
    }

    /**
     * @type {VARIANT} 
     */
    columnRuleWidth {
        get => this.get_columnRuleWidth()
        set => this.put_columnRuleWidth(value)
    }

    /**
     * @type {BSTR} 
     */
    breakBefore {
        get => this.get_breakBefore()
        set => this.put_breakBefore(value)
    }

    /**
     * @type {BSTR} 
     */
    breakAfter {
        get => this.get_breakAfter()
        set => this.put_breakAfter(value)
    }

    /**
     * @type {BSTR} 
     */
    breakInside {
        get => this.get_breakInside()
        set => this.put_breakInside(value)
    }

    /**
     * @type {VARIANT} 
     */
    floodColor {
        get => this.get_floodColor()
        set => this.put_floodColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    floodOpacity {
        get => this.get_floodOpacity()
        set => this.put_floodOpacity(value)
    }

    /**
     * @type {VARIANT} 
     */
    lightingColor {
        get => this.get_lightingColor()
        set => this.put_lightingColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    msScrollLimitXMin {
        get => this.get_msScrollLimitXMin()
        set => this.put_msScrollLimitXMin(value)
    }

    /**
     * @type {VARIANT} 
     */
    msScrollLimitYMin {
        get => this.get_msScrollLimitYMin()
        set => this.put_msScrollLimitYMin(value)
    }

    /**
     * @type {VARIANT} 
     */
    msScrollLimitXMax {
        get => this.get_msScrollLimitXMax()
        set => this.put_msScrollLimitXMax(value)
    }

    /**
     * @type {VARIANT} 
     */
    msScrollLimitYMax {
        get => this.get_msScrollLimitYMax()
        set => this.put_msScrollLimitYMax(value)
    }

    /**
     * @type {BSTR} 
     */
    msScrollLimit {
        get => this.get_msScrollLimit()
        set => this.put_msScrollLimit(value)
    }

    /**
     * @type {BSTR} 
     */
    textShadow {
        get => this.get_textShadow()
        set => this.put_textShadow(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlowFrom {
        get => this.get_msFlowFrom()
        set => this.put_msFlowFrom(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlowInto {
        get => this.get_msFlowInto()
        set => this.put_msFlowInto(value)
    }

    /**
     * @type {BSTR} 
     */
    msHyphens {
        get => this.get_msHyphens()
        set => this.put_msHyphens(value)
    }

    /**
     * @type {VARIANT} 
     */
    msHyphenateLimitZone {
        get => this.get_msHyphenateLimitZone()
        set => this.put_msHyphenateLimitZone(value)
    }

    /**
     * @type {BSTR} 
     */
    msHyphenateLimitChars {
        get => this.get_msHyphenateLimitChars()
        set => this.put_msHyphenateLimitChars(value)
    }

    /**
     * @type {VARIANT} 
     */
    msHyphenateLimitLines {
        get => this.get_msHyphenateLimitLines()
        set => this.put_msHyphenateLimitLines(value)
    }

    /**
     * @type {BSTR} 
     */
    msHighContrastAdjust {
        get => this.get_msHighContrastAdjust()
        set => this.put_msHighContrastAdjust(value)
    }

    /**
     * @type {BSTR} 
     */
    enableBackground {
        get => this.get_enableBackground()
        set => this.put_enableBackground(value)
    }

    /**
     * @type {BSTR} 
     */
    msFontFeatureSettings {
        get => this.get_msFontFeatureSettings()
        set => this.put_msFontFeatureSettings(value)
    }

    /**
     * @type {BSTR} 
     */
    msUserSelect {
        get => this.get_msUserSelect()
        set => this.put_msUserSelect(value)
    }

    /**
     * @type {BSTR} 
     */
    msOverflowStyle {
        get => this.get_msOverflowStyle()
        set => this.put_msOverflowStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    msTransformStyle {
        get => this.get_msTransformStyle()
        set => this.put_msTransformStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    msBackfaceVisibility {
        get => this.get_msBackfaceVisibility()
        set => this.put_msBackfaceVisibility(value)
    }

    /**
     * @type {VARIANT} 
     */
    msPerspective {
        get => this.get_msPerspective()
        set => this.put_msPerspective(value)
    }

    /**
     * @type {BSTR} 
     */
    msPerspectiveOrigin {
        get => this.get_msPerspectiveOrigin()
        set => this.put_msPerspectiveOrigin(value)
    }

    /**
     * @type {BSTR} 
     */
    msTransitionProperty {
        get => this.get_msTransitionProperty()
        set => this.put_msTransitionProperty(value)
    }

    /**
     * @type {BSTR} 
     */
    msTransitionDuration {
        get => this.get_msTransitionDuration()
        set => this.put_msTransitionDuration(value)
    }

    /**
     * @type {BSTR} 
     */
    msTransitionTimingFunction {
        get => this.get_msTransitionTimingFunction()
        set => this.put_msTransitionTimingFunction(value)
    }

    /**
     * @type {BSTR} 
     */
    msTransitionDelay {
        get => this.get_msTransitionDelay()
        set => this.put_msTransitionDelay(value)
    }

    /**
     * @type {BSTR} 
     */
    msTransition {
        get => this.get_msTransition()
        set => this.put_msTransition(value)
    }

    /**
     * @type {BSTR} 
     */
    msTouchAction {
        get => this.get_msTouchAction()
        set => this.put_msTouchAction(value)
    }

    /**
     * @type {BSTR} 
     */
    msScrollTranslation {
        get => this.get_msScrollTranslation()
        set => this.put_msScrollTranslation(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlex {
        get => this.get_msFlex()
        set => this.put_msFlex(value)
    }

    /**
     * @type {VARIANT} 
     */
    msFlexPositive {
        get => this.get_msFlexPositive()
        set => this.put_msFlexPositive(value)
    }

    /**
     * @type {VARIANT} 
     */
    msFlexNegative {
        get => this.get_msFlexNegative()
        set => this.put_msFlexNegative(value)
    }

    /**
     * @type {VARIANT} 
     */
    msFlexPreferredSize {
        get => this.get_msFlexPreferredSize()
        set => this.put_msFlexPreferredSize(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlexFlow {
        get => this.get_msFlexFlow()
        set => this.put_msFlexFlow(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlexDirection {
        get => this.get_msFlexDirection()
        set => this.put_msFlexDirection(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlexWrap {
        get => this.get_msFlexWrap()
        set => this.put_msFlexWrap(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlexAlign {
        get => this.get_msFlexAlign()
        set => this.put_msFlexAlign(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlexItemAlign {
        get => this.get_msFlexItemAlign()
        set => this.put_msFlexItemAlign(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlexPack {
        get => this.get_msFlexPack()
        set => this.put_msFlexPack(value)
    }

    /**
     * @type {BSTR} 
     */
    msFlexLinePack {
        get => this.get_msFlexLinePack()
        set => this.put_msFlexLinePack(value)
    }

    /**
     * @type {VARIANT} 
     */
    msFlexOrder {
        get => this.get_msFlexOrder()
        set => this.put_msFlexOrder(value)
    }

    /**
     * @type {BSTR} 
     */
    msTouchSelect {
        get => this.get_msTouchSelect()
        set => this.put_msTouchSelect(value)
    }

    /**
     * @type {BSTR} 
     */
    transform {
        get => this.get_transform()
        set => this.put_transform(value)
    }

    /**
     * @type {BSTR} 
     */
    transformOrigin {
        get => this.get_transformOrigin()
        set => this.put_transformOrigin(value)
    }

    /**
     * @type {BSTR} 
     */
    transformStyle {
        get => this.get_transformStyle()
        set => this.put_transformStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    backfaceVisibility {
        get => this.get_backfaceVisibility()
        set => this.put_backfaceVisibility(value)
    }

    /**
     * @type {VARIANT} 
     */
    perspective {
        get => this.get_perspective()
        set => this.put_perspective(value)
    }

    /**
     * @type {BSTR} 
     */
    perspectiveOrigin {
        get => this.get_perspectiveOrigin()
        set => this.put_perspectiveOrigin(value)
    }

    /**
     * @type {BSTR} 
     */
    transitionProperty {
        get => this.get_transitionProperty()
        set => this.put_transitionProperty(value)
    }

    /**
     * @type {BSTR} 
     */
    transitionDuration {
        get => this.get_transitionDuration()
        set => this.put_transitionDuration(value)
    }

    /**
     * @type {BSTR} 
     */
    transitionTimingFunction {
        get => this.get_transitionTimingFunction()
        set => this.put_transitionTimingFunction(value)
    }

    /**
     * @type {BSTR} 
     */
    transitionDelay {
        get => this.get_transitionDelay()
        set => this.put_transitionDelay(value)
    }

    /**
     * @type {BSTR} 
     */
    transition {
        get => this.get_transition()
        set => this.put_transition(value)
    }

    /**
     * @type {BSTR} 
     */
    fontFeatureSettings {
        get => this.get_fontFeatureSettings()
        set => this.put_fontFeatureSettings(value)
    }

    /**
     * @type {BSTR} 
     */
    animationName {
        get => this.get_animationName()
        set => this.put_animationName(value)
    }

    /**
     * @type {BSTR} 
     */
    animationDuration {
        get => this.get_animationDuration()
        set => this.put_animationDuration(value)
    }

    /**
     * @type {BSTR} 
     */
    animationTimingFunction {
        get => this.get_animationTimingFunction()
        set => this.put_animationTimingFunction(value)
    }

    /**
     * @type {BSTR} 
     */
    animationDelay {
        get => this.get_animationDelay()
        set => this.put_animationDelay(value)
    }

    /**
     * @type {BSTR} 
     */
    animationDirection {
        get => this.get_animationDirection()
        set => this.put_animationDirection(value)
    }

    /**
     * @type {BSTR} 
     */
    animationPlayState {
        get => this.get_animationPlayState()
        set => this.put_animationPlayState(value)
    }

    /**
     * @type {BSTR} 
     */
    animationIterationCount {
        get => this.get_animationIterationCount()
        set => this.put_animationIterationCount(value)
    }

    /**
     * @type {BSTR} 
     */
    animation {
        get => this.get_animation()
        set => this.put_animation(value)
    }

    /**
     * @type {BSTR} 
     */
    animationFillMode {
        get => this.get_animationFillMode()
        set => this.put_animationFillMode(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollChaining(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollChaining() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZooming(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZooming() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomSnapType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomSnapType() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollRails(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollRails() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomChaining(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomChaining() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapType() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomLimit(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomLimit() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomSnap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomSnap() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomSnapPoints(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msContentZoomSnapPoints() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomLimitMin(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msContentZoomLimitMin() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msContentZoomLimitMax(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msContentZoomLimitMax() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapX(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapX() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapY(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapY() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapPointsX(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapPointsX() {
        p := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollSnapPointsY(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollSnapPointsY() {
        p := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msGridColumn(v) {
        result := ComCall(37, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msGridColumn() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msGridColumnAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msGridColumnAlign() {
        p := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msGridColumns(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msGridColumns() {
        p := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msGridColumnSpan(v) {
        result := ComCall(43, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msGridColumnSpan() {
        p := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msGridRow(v) {
        result := ComCall(45, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msGridRow() {
        p := VARIANT()
        result := ComCall(46, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msGridRowAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(47, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msGridRowAlign() {
        p := BSTR.Owned()
        result := ComCall(48, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msGridRows(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(49, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msGridRows() {
        p := BSTR.Owned()
        result := ComCall(50, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msGridRowSpan(v) {
        result := ComCall(51, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msGridRowSpan() {
        p := VARIANT()
        result := ComCall(52, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msWrapThrough(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msWrapThrough() {
        p := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msWrapMargin(v) {
        result := ComCall(55, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msWrapMargin() {
        p := VARIANT()
        result := ComCall(56, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msWrapFlow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(57, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msWrapFlow() {
        p := BSTR.Owned()
        result := ComCall(58, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(59, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationName() {
        p := BSTR.Owned()
        result := ComCall(60, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationDuration() {
        p := BSTR.Owned()
        result := ComCall(62, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationTimingFunction() {
        p := BSTR.Owned()
        result := ComCall(64, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(65, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationDelay() {
        p := BSTR.Owned()
        result := ComCall(66, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(67, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationDirection() {
        p := BSTR.Owned()
        result := ComCall(68, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationPlayState(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(69, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationPlayState() {
        p := BSTR.Owned()
        result := ComCall(70, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationIterationCount(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(71, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationIterationCount() {
        p := BSTR.Owned()
        result := ComCall(72, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(73, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimation() {
        p := BSTR.Owned()
        result := ComCall(74, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msAnimationFillMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(75, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msAnimationFillMode() {
        p := BSTR.Owned()
        result := ComCall(76, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_colorInterpolationFilters(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(77, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_colorInterpolationFilters() {
        p := BSTR.Owned()
        result := ComCall(78, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnCount(v) {
        result := ComCall(79, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnCount() {
        p := VARIANT()
        result := ComCall(80, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnWidth(v) {
        result := ComCall(81, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnWidth() {
        p := VARIANT()
        result := ComCall(82, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnGap(v) {
        result := ComCall(83, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnGap() {
        p := VARIANT()
        result := ComCall(84, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columnFill(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(85, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columnFill() {
        p := BSTR.Owned()
        result := ComCall(86, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columnSpan(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(87, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columnSpan() {
        p := BSTR.Owned()
        result := ComCall(88, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columns(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(89, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columns() {
        p := BSTR.Owned()
        result := ComCall(90, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columnRule(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(91, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columnRule() {
        p := BSTR.Owned()
        result := ComCall(92, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnRuleColor(v) {
        result := ComCall(93, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnRuleColor() {
        p := VARIANT()
        result := ComCall(94, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_columnRuleStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(95, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_columnRuleStyle() {
        p := BSTR.Owned()
        result := ComCall(96, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_columnRuleWidth(v) {
        result := ComCall(97, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_columnRuleWidth() {
        p := VARIANT()
        result := ComCall(98, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_breakBefore(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(99, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_breakBefore() {
        p := BSTR.Owned()
        result := ComCall(100, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_breakAfter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(101, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_breakAfter() {
        p := BSTR.Owned()
        result := ComCall(102, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_breakInside(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(103, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_breakInside() {
        p := BSTR.Owned()
        result := ComCall(104, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_floodColor(v) {
        result := ComCall(105, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_floodColor() {
        p := VARIANT()
        result := ComCall(106, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_floodOpacity(v) {
        result := ComCall(107, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_floodOpacity() {
        p := VARIANT()
        result := ComCall(108, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_lightingColor(v) {
        result := ComCall(109, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_lightingColor() {
        p := VARIANT()
        result := ComCall(110, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimitXMin(v) {
        result := ComCall(111, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msScrollLimitXMin() {
        p := VARIANT()
        result := ComCall(112, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimitYMin(v) {
        result := ComCall(113, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msScrollLimitYMin() {
        p := VARIANT()
        result := ComCall(114, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimitXMax(v) {
        result := ComCall(115, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msScrollLimitXMax() {
        p := VARIANT()
        result := ComCall(116, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimitYMax(v) {
        result := ComCall(117, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msScrollLimitYMax() {
        p := VARIANT()
        result := ComCall(118, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollLimit(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(119, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollLimit() {
        p := BSTR.Owned()
        result := ComCall(120, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textShadow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(121, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textShadow() {
        p := BSTR.Owned()
        result := ComCall(122, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlowFrom(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(123, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlowFrom() {
        p := BSTR.Owned()
        result := ComCall(124, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlowInto(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(125, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlowInto() {
        p := BSTR.Owned()
        result := ComCall(126, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msHyphens(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(127, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msHyphens() {
        p := BSTR.Owned()
        result := ComCall(128, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msHyphenateLimitZone(v) {
        result := ComCall(129, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msHyphenateLimitZone() {
        p := VARIANT()
        result := ComCall(130, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msHyphenateLimitChars(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(131, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msHyphenateLimitChars() {
        p := BSTR.Owned()
        result := ComCall(132, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msHyphenateLimitLines(v) {
        result := ComCall(133, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msHyphenateLimitLines() {
        p := VARIANT()
        result := ComCall(134, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msHighContrastAdjust(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(135, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msHighContrastAdjust() {
        p := BSTR.Owned()
        result := ComCall(136, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_enableBackground(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(137, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_enableBackground() {
        p := BSTR.Owned()
        result := ComCall(138, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFontFeatureSettings(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(139, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFontFeatureSettings() {
        p := BSTR.Owned()
        result := ComCall(140, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msUserSelect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(141, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msUserSelect() {
        p := BSTR.Owned()
        result := ComCall(142, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msOverflowStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(143, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msOverflowStyle() {
        p := BSTR.Owned()
        result := ComCall(144, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransformStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(145, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransformStyle() {
        p := BSTR.Owned()
        result := ComCall(146, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msBackfaceVisibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(147, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msBackfaceVisibility() {
        p := BSTR.Owned()
        result := ComCall(148, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msPerspective(v) {
        result := ComCall(149, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msPerspective() {
        p := VARIANT()
        result := ComCall(150, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msPerspectiveOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(151, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msPerspectiveOrigin() {
        p := BSTR.Owned()
        result := ComCall(152, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransitionProperty(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(153, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransitionProperty() {
        p := BSTR.Owned()
        result := ComCall(154, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransitionDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(155, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransitionDuration() {
        p := BSTR.Owned()
        result := ComCall(156, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransitionTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(157, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransitionTimingFunction() {
        p := BSTR.Owned()
        result := ComCall(158, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransitionDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(159, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransitionDelay() {
        p := BSTR.Owned()
        result := ComCall(160, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(161, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransition() {
        p := BSTR.Owned()
        result := ComCall(162, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTouchAction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(163, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTouchAction() {
        p := BSTR.Owned()
        result := ComCall(164, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msScrollTranslation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(165, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msScrollTranslation() {
        p := BSTR.Owned()
        result := ComCall(166, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlex(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(167, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlex() {
        p := BSTR.Owned()
        result := ComCall(168, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msFlexPositive(v) {
        result := ComCall(169, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msFlexPositive() {
        p := VARIANT()
        result := ComCall(170, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msFlexNegative(v) {
        result := ComCall(171, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msFlexNegative() {
        p := VARIANT()
        result := ComCall(172, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msFlexPreferredSize(v) {
        result := ComCall(173, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msFlexPreferredSize() {
        p := VARIANT()
        result := ComCall(174, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexFlow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(175, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexFlow() {
        p := BSTR.Owned()
        result := ComCall(176, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(177, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexDirection() {
        p := BSTR.Owned()
        result := ComCall(178, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexWrap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(179, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexWrap() {
        p := BSTR.Owned()
        result := ComCall(180, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(181, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexAlign() {
        p := BSTR.Owned()
        result := ComCall(182, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexItemAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(183, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexItemAlign() {
        p := BSTR.Owned()
        result := ComCall(184, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexPack(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(185, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexPack() {
        p := BSTR.Owned()
        result := ComCall(186, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msFlexLinePack(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(187, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msFlexLinePack() {
        p := BSTR.Owned()
        result := ComCall(188, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msFlexOrder(v) {
        result := ComCall(189, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msFlexOrder() {
        p := VARIANT()
        result := ComCall(190, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTouchSelect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(191, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTouchSelect() {
        p := BSTR.Owned()
        result := ComCall(192, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(193, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transform() {
        p := BSTR.Owned()
        result := ComCall(194, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transformOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(195, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transformOrigin() {
        p := BSTR.Owned()
        result := ComCall(196, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transformStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(197, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transformStyle() {
        p := BSTR.Owned()
        result := ComCall(198, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backfaceVisibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(199, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backfaceVisibility() {
        p := BSTR.Owned()
        result := ComCall(200, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_perspective(v) {
        result := ComCall(201, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_perspective() {
        p := VARIANT()
        result := ComCall(202, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_perspectiveOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(203, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_perspectiveOrigin() {
        p := BSTR.Owned()
        result := ComCall(204, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transitionProperty(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(205, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transitionProperty() {
        p := BSTR.Owned()
        result := ComCall(206, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transitionDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(207, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transitionDuration() {
        p := BSTR.Owned()
        result := ComCall(208, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transitionTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(209, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transitionTimingFunction() {
        p := BSTR.Owned()
        result := ComCall(210, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transitionDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(211, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transitionDelay() {
        p := BSTR.Owned()
        result := ComCall(212, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_transition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(213, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_transition() {
        p := BSTR.Owned()
        result := ComCall(214, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontFeatureSettings(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(215, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontFeatureSettings() {
        p := BSTR.Owned()
        result := ComCall(216, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(217, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationName() {
        p := BSTR.Owned()
        result := ComCall(218, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(219, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationDuration() {
        p := BSTR.Owned()
        result := ComCall(220, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(221, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationTimingFunction() {
        p := BSTR.Owned()
        result := ComCall(222, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(223, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationDelay() {
        p := BSTR.Owned()
        result := ComCall(224, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(225, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationDirection() {
        p := BSTR.Owned()
        result := ComCall(226, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationPlayState(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(227, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationPlayState() {
        p := BSTR.Owned()
        result := ComCall(228, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationIterationCount(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(229, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationIterationCount() {
        p := BSTR.Owned()
        result := ComCall(230, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(231, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animation() {
        p := BSTR.Owned()
        result := ComCall(232, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_animationFillMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(233, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_animationFillMode() {
        p := BSTR.Owned()
        result := ComCall(234, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCSSStyleDeclaration2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_msScrollChaining := CallbackCreate(GetMethod(implObj, "put_msScrollChaining"), flags, 2)
        this.vtbl.get_msScrollChaining := CallbackCreate(GetMethod(implObj, "get_msScrollChaining"), flags, 2)
        this.vtbl.put_msContentZooming := CallbackCreate(GetMethod(implObj, "put_msContentZooming"), flags, 2)
        this.vtbl.get_msContentZooming := CallbackCreate(GetMethod(implObj, "get_msContentZooming"), flags, 2)
        this.vtbl.put_msContentZoomSnapType := CallbackCreate(GetMethod(implObj, "put_msContentZoomSnapType"), flags, 2)
        this.vtbl.get_msContentZoomSnapType := CallbackCreate(GetMethod(implObj, "get_msContentZoomSnapType"), flags, 2)
        this.vtbl.put_msScrollRails := CallbackCreate(GetMethod(implObj, "put_msScrollRails"), flags, 2)
        this.vtbl.get_msScrollRails := CallbackCreate(GetMethod(implObj, "get_msScrollRails"), flags, 2)
        this.vtbl.put_msContentZoomChaining := CallbackCreate(GetMethod(implObj, "put_msContentZoomChaining"), flags, 2)
        this.vtbl.get_msContentZoomChaining := CallbackCreate(GetMethod(implObj, "get_msContentZoomChaining"), flags, 2)
        this.vtbl.put_msScrollSnapType := CallbackCreate(GetMethod(implObj, "put_msScrollSnapType"), flags, 2)
        this.vtbl.get_msScrollSnapType := CallbackCreate(GetMethod(implObj, "get_msScrollSnapType"), flags, 2)
        this.vtbl.put_msContentZoomLimit := CallbackCreate(GetMethod(implObj, "put_msContentZoomLimit"), flags, 2)
        this.vtbl.get_msContentZoomLimit := CallbackCreate(GetMethod(implObj, "get_msContentZoomLimit"), flags, 2)
        this.vtbl.put_msContentZoomSnap := CallbackCreate(GetMethod(implObj, "put_msContentZoomSnap"), flags, 2)
        this.vtbl.get_msContentZoomSnap := CallbackCreate(GetMethod(implObj, "get_msContentZoomSnap"), flags, 2)
        this.vtbl.put_msContentZoomSnapPoints := CallbackCreate(GetMethod(implObj, "put_msContentZoomSnapPoints"), flags, 2)
        this.vtbl.get_msContentZoomSnapPoints := CallbackCreate(GetMethod(implObj, "get_msContentZoomSnapPoints"), flags, 2)
        this.vtbl.put_msContentZoomLimitMin := CallbackCreate(GetMethod(implObj, "put_msContentZoomLimitMin"), flags, 2)
        this.vtbl.get_msContentZoomLimitMin := CallbackCreate(GetMethod(implObj, "get_msContentZoomLimitMin"), flags, 2)
        this.vtbl.put_msContentZoomLimitMax := CallbackCreate(GetMethod(implObj, "put_msContentZoomLimitMax"), flags, 2)
        this.vtbl.get_msContentZoomLimitMax := CallbackCreate(GetMethod(implObj, "get_msContentZoomLimitMax"), flags, 2)
        this.vtbl.put_msScrollSnapX := CallbackCreate(GetMethod(implObj, "put_msScrollSnapX"), flags, 2)
        this.vtbl.get_msScrollSnapX := CallbackCreate(GetMethod(implObj, "get_msScrollSnapX"), flags, 2)
        this.vtbl.put_msScrollSnapY := CallbackCreate(GetMethod(implObj, "put_msScrollSnapY"), flags, 2)
        this.vtbl.get_msScrollSnapY := CallbackCreate(GetMethod(implObj, "get_msScrollSnapY"), flags, 2)
        this.vtbl.put_msScrollSnapPointsX := CallbackCreate(GetMethod(implObj, "put_msScrollSnapPointsX"), flags, 2)
        this.vtbl.get_msScrollSnapPointsX := CallbackCreate(GetMethod(implObj, "get_msScrollSnapPointsX"), flags, 2)
        this.vtbl.put_msScrollSnapPointsY := CallbackCreate(GetMethod(implObj, "put_msScrollSnapPointsY"), flags, 2)
        this.vtbl.get_msScrollSnapPointsY := CallbackCreate(GetMethod(implObj, "get_msScrollSnapPointsY"), flags, 2)
        this.vtbl.put_msGridColumn := CallbackCreate(GetMethod(implObj, "put_msGridColumn"), flags, 2)
        this.vtbl.get_msGridColumn := CallbackCreate(GetMethod(implObj, "get_msGridColumn"), flags, 2)
        this.vtbl.put_msGridColumnAlign := CallbackCreate(GetMethod(implObj, "put_msGridColumnAlign"), flags, 2)
        this.vtbl.get_msGridColumnAlign := CallbackCreate(GetMethod(implObj, "get_msGridColumnAlign"), flags, 2)
        this.vtbl.put_msGridColumns := CallbackCreate(GetMethod(implObj, "put_msGridColumns"), flags, 2)
        this.vtbl.get_msGridColumns := CallbackCreate(GetMethod(implObj, "get_msGridColumns"), flags, 2)
        this.vtbl.put_msGridColumnSpan := CallbackCreate(GetMethod(implObj, "put_msGridColumnSpan"), flags, 2)
        this.vtbl.get_msGridColumnSpan := CallbackCreate(GetMethod(implObj, "get_msGridColumnSpan"), flags, 2)
        this.vtbl.put_msGridRow := CallbackCreate(GetMethod(implObj, "put_msGridRow"), flags, 2)
        this.vtbl.get_msGridRow := CallbackCreate(GetMethod(implObj, "get_msGridRow"), flags, 2)
        this.vtbl.put_msGridRowAlign := CallbackCreate(GetMethod(implObj, "put_msGridRowAlign"), flags, 2)
        this.vtbl.get_msGridRowAlign := CallbackCreate(GetMethod(implObj, "get_msGridRowAlign"), flags, 2)
        this.vtbl.put_msGridRows := CallbackCreate(GetMethod(implObj, "put_msGridRows"), flags, 2)
        this.vtbl.get_msGridRows := CallbackCreate(GetMethod(implObj, "get_msGridRows"), flags, 2)
        this.vtbl.put_msGridRowSpan := CallbackCreate(GetMethod(implObj, "put_msGridRowSpan"), flags, 2)
        this.vtbl.get_msGridRowSpan := CallbackCreate(GetMethod(implObj, "get_msGridRowSpan"), flags, 2)
        this.vtbl.put_msWrapThrough := CallbackCreate(GetMethod(implObj, "put_msWrapThrough"), flags, 2)
        this.vtbl.get_msWrapThrough := CallbackCreate(GetMethod(implObj, "get_msWrapThrough"), flags, 2)
        this.vtbl.put_msWrapMargin := CallbackCreate(GetMethod(implObj, "put_msWrapMargin"), flags, 2)
        this.vtbl.get_msWrapMargin := CallbackCreate(GetMethod(implObj, "get_msWrapMargin"), flags, 2)
        this.vtbl.put_msWrapFlow := CallbackCreate(GetMethod(implObj, "put_msWrapFlow"), flags, 2)
        this.vtbl.get_msWrapFlow := CallbackCreate(GetMethod(implObj, "get_msWrapFlow"), flags, 2)
        this.vtbl.put_msAnimationName := CallbackCreate(GetMethod(implObj, "put_msAnimationName"), flags, 2)
        this.vtbl.get_msAnimationName := CallbackCreate(GetMethod(implObj, "get_msAnimationName"), flags, 2)
        this.vtbl.put_msAnimationDuration := CallbackCreate(GetMethod(implObj, "put_msAnimationDuration"), flags, 2)
        this.vtbl.get_msAnimationDuration := CallbackCreate(GetMethod(implObj, "get_msAnimationDuration"), flags, 2)
        this.vtbl.put_msAnimationTimingFunction := CallbackCreate(GetMethod(implObj, "put_msAnimationTimingFunction"), flags, 2)
        this.vtbl.get_msAnimationTimingFunction := CallbackCreate(GetMethod(implObj, "get_msAnimationTimingFunction"), flags, 2)
        this.vtbl.put_msAnimationDelay := CallbackCreate(GetMethod(implObj, "put_msAnimationDelay"), flags, 2)
        this.vtbl.get_msAnimationDelay := CallbackCreate(GetMethod(implObj, "get_msAnimationDelay"), flags, 2)
        this.vtbl.put_msAnimationDirection := CallbackCreate(GetMethod(implObj, "put_msAnimationDirection"), flags, 2)
        this.vtbl.get_msAnimationDirection := CallbackCreate(GetMethod(implObj, "get_msAnimationDirection"), flags, 2)
        this.vtbl.put_msAnimationPlayState := CallbackCreate(GetMethod(implObj, "put_msAnimationPlayState"), flags, 2)
        this.vtbl.get_msAnimationPlayState := CallbackCreate(GetMethod(implObj, "get_msAnimationPlayState"), flags, 2)
        this.vtbl.put_msAnimationIterationCount := CallbackCreate(GetMethod(implObj, "put_msAnimationIterationCount"), flags, 2)
        this.vtbl.get_msAnimationIterationCount := CallbackCreate(GetMethod(implObj, "get_msAnimationIterationCount"), flags, 2)
        this.vtbl.put_msAnimation := CallbackCreate(GetMethod(implObj, "put_msAnimation"), flags, 2)
        this.vtbl.get_msAnimation := CallbackCreate(GetMethod(implObj, "get_msAnimation"), flags, 2)
        this.vtbl.put_msAnimationFillMode := CallbackCreate(GetMethod(implObj, "put_msAnimationFillMode"), flags, 2)
        this.vtbl.get_msAnimationFillMode := CallbackCreate(GetMethod(implObj, "get_msAnimationFillMode"), flags, 2)
        this.vtbl.put_colorInterpolationFilters := CallbackCreate(GetMethod(implObj, "put_colorInterpolationFilters"), flags, 2)
        this.vtbl.get_colorInterpolationFilters := CallbackCreate(GetMethod(implObj, "get_colorInterpolationFilters"), flags, 2)
        this.vtbl.put_columnCount := CallbackCreate(GetMethod(implObj, "put_columnCount"), flags, 2)
        this.vtbl.get_columnCount := CallbackCreate(GetMethod(implObj, "get_columnCount"), flags, 2)
        this.vtbl.put_columnWidth := CallbackCreate(GetMethod(implObj, "put_columnWidth"), flags, 2)
        this.vtbl.get_columnWidth := CallbackCreate(GetMethod(implObj, "get_columnWidth"), flags, 2)
        this.vtbl.put_columnGap := CallbackCreate(GetMethod(implObj, "put_columnGap"), flags, 2)
        this.vtbl.get_columnGap := CallbackCreate(GetMethod(implObj, "get_columnGap"), flags, 2)
        this.vtbl.put_columnFill := CallbackCreate(GetMethod(implObj, "put_columnFill"), flags, 2)
        this.vtbl.get_columnFill := CallbackCreate(GetMethod(implObj, "get_columnFill"), flags, 2)
        this.vtbl.put_columnSpan := CallbackCreate(GetMethod(implObj, "put_columnSpan"), flags, 2)
        this.vtbl.get_columnSpan := CallbackCreate(GetMethod(implObj, "get_columnSpan"), flags, 2)
        this.vtbl.put_columns := CallbackCreate(GetMethod(implObj, "put_columns"), flags, 2)
        this.vtbl.get_columns := CallbackCreate(GetMethod(implObj, "get_columns"), flags, 2)
        this.vtbl.put_columnRule := CallbackCreate(GetMethod(implObj, "put_columnRule"), flags, 2)
        this.vtbl.get_columnRule := CallbackCreate(GetMethod(implObj, "get_columnRule"), flags, 2)
        this.vtbl.put_columnRuleColor := CallbackCreate(GetMethod(implObj, "put_columnRuleColor"), flags, 2)
        this.vtbl.get_columnRuleColor := CallbackCreate(GetMethod(implObj, "get_columnRuleColor"), flags, 2)
        this.vtbl.put_columnRuleStyle := CallbackCreate(GetMethod(implObj, "put_columnRuleStyle"), flags, 2)
        this.vtbl.get_columnRuleStyle := CallbackCreate(GetMethod(implObj, "get_columnRuleStyle"), flags, 2)
        this.vtbl.put_columnRuleWidth := CallbackCreate(GetMethod(implObj, "put_columnRuleWidth"), flags, 2)
        this.vtbl.get_columnRuleWidth := CallbackCreate(GetMethod(implObj, "get_columnRuleWidth"), flags, 2)
        this.vtbl.put_breakBefore := CallbackCreate(GetMethod(implObj, "put_breakBefore"), flags, 2)
        this.vtbl.get_breakBefore := CallbackCreate(GetMethod(implObj, "get_breakBefore"), flags, 2)
        this.vtbl.put_breakAfter := CallbackCreate(GetMethod(implObj, "put_breakAfter"), flags, 2)
        this.vtbl.get_breakAfter := CallbackCreate(GetMethod(implObj, "get_breakAfter"), flags, 2)
        this.vtbl.put_breakInside := CallbackCreate(GetMethod(implObj, "put_breakInside"), flags, 2)
        this.vtbl.get_breakInside := CallbackCreate(GetMethod(implObj, "get_breakInside"), flags, 2)
        this.vtbl.put_floodColor := CallbackCreate(GetMethod(implObj, "put_floodColor"), flags, 2)
        this.vtbl.get_floodColor := CallbackCreate(GetMethod(implObj, "get_floodColor"), flags, 2)
        this.vtbl.put_floodOpacity := CallbackCreate(GetMethod(implObj, "put_floodOpacity"), flags, 2)
        this.vtbl.get_floodOpacity := CallbackCreate(GetMethod(implObj, "get_floodOpacity"), flags, 2)
        this.vtbl.put_lightingColor := CallbackCreate(GetMethod(implObj, "put_lightingColor"), flags, 2)
        this.vtbl.get_lightingColor := CallbackCreate(GetMethod(implObj, "get_lightingColor"), flags, 2)
        this.vtbl.put_msScrollLimitXMin := CallbackCreate(GetMethod(implObj, "put_msScrollLimitXMin"), flags, 2)
        this.vtbl.get_msScrollLimitXMin := CallbackCreate(GetMethod(implObj, "get_msScrollLimitXMin"), flags, 2)
        this.vtbl.put_msScrollLimitYMin := CallbackCreate(GetMethod(implObj, "put_msScrollLimitYMin"), flags, 2)
        this.vtbl.get_msScrollLimitYMin := CallbackCreate(GetMethod(implObj, "get_msScrollLimitYMin"), flags, 2)
        this.vtbl.put_msScrollLimitXMax := CallbackCreate(GetMethod(implObj, "put_msScrollLimitXMax"), flags, 2)
        this.vtbl.get_msScrollLimitXMax := CallbackCreate(GetMethod(implObj, "get_msScrollLimitXMax"), flags, 2)
        this.vtbl.put_msScrollLimitYMax := CallbackCreate(GetMethod(implObj, "put_msScrollLimitYMax"), flags, 2)
        this.vtbl.get_msScrollLimitYMax := CallbackCreate(GetMethod(implObj, "get_msScrollLimitYMax"), flags, 2)
        this.vtbl.put_msScrollLimit := CallbackCreate(GetMethod(implObj, "put_msScrollLimit"), flags, 2)
        this.vtbl.get_msScrollLimit := CallbackCreate(GetMethod(implObj, "get_msScrollLimit"), flags, 2)
        this.vtbl.put_textShadow := CallbackCreate(GetMethod(implObj, "put_textShadow"), flags, 2)
        this.vtbl.get_textShadow := CallbackCreate(GetMethod(implObj, "get_textShadow"), flags, 2)
        this.vtbl.put_msFlowFrom := CallbackCreate(GetMethod(implObj, "put_msFlowFrom"), flags, 2)
        this.vtbl.get_msFlowFrom := CallbackCreate(GetMethod(implObj, "get_msFlowFrom"), flags, 2)
        this.vtbl.put_msFlowInto := CallbackCreate(GetMethod(implObj, "put_msFlowInto"), flags, 2)
        this.vtbl.get_msFlowInto := CallbackCreate(GetMethod(implObj, "get_msFlowInto"), flags, 2)
        this.vtbl.put_msHyphens := CallbackCreate(GetMethod(implObj, "put_msHyphens"), flags, 2)
        this.vtbl.get_msHyphens := CallbackCreate(GetMethod(implObj, "get_msHyphens"), flags, 2)
        this.vtbl.put_msHyphenateLimitZone := CallbackCreate(GetMethod(implObj, "put_msHyphenateLimitZone"), flags, 2)
        this.vtbl.get_msHyphenateLimitZone := CallbackCreate(GetMethod(implObj, "get_msHyphenateLimitZone"), flags, 2)
        this.vtbl.put_msHyphenateLimitChars := CallbackCreate(GetMethod(implObj, "put_msHyphenateLimitChars"), flags, 2)
        this.vtbl.get_msHyphenateLimitChars := CallbackCreate(GetMethod(implObj, "get_msHyphenateLimitChars"), flags, 2)
        this.vtbl.put_msHyphenateLimitLines := CallbackCreate(GetMethod(implObj, "put_msHyphenateLimitLines"), flags, 2)
        this.vtbl.get_msHyphenateLimitLines := CallbackCreate(GetMethod(implObj, "get_msHyphenateLimitLines"), flags, 2)
        this.vtbl.put_msHighContrastAdjust := CallbackCreate(GetMethod(implObj, "put_msHighContrastAdjust"), flags, 2)
        this.vtbl.get_msHighContrastAdjust := CallbackCreate(GetMethod(implObj, "get_msHighContrastAdjust"), flags, 2)
        this.vtbl.put_enableBackground := CallbackCreate(GetMethod(implObj, "put_enableBackground"), flags, 2)
        this.vtbl.get_enableBackground := CallbackCreate(GetMethod(implObj, "get_enableBackground"), flags, 2)
        this.vtbl.put_msFontFeatureSettings := CallbackCreate(GetMethod(implObj, "put_msFontFeatureSettings"), flags, 2)
        this.vtbl.get_msFontFeatureSettings := CallbackCreate(GetMethod(implObj, "get_msFontFeatureSettings"), flags, 2)
        this.vtbl.put_msUserSelect := CallbackCreate(GetMethod(implObj, "put_msUserSelect"), flags, 2)
        this.vtbl.get_msUserSelect := CallbackCreate(GetMethod(implObj, "get_msUserSelect"), flags, 2)
        this.vtbl.put_msOverflowStyle := CallbackCreate(GetMethod(implObj, "put_msOverflowStyle"), flags, 2)
        this.vtbl.get_msOverflowStyle := CallbackCreate(GetMethod(implObj, "get_msOverflowStyle"), flags, 2)
        this.vtbl.put_msTransformStyle := CallbackCreate(GetMethod(implObj, "put_msTransformStyle"), flags, 2)
        this.vtbl.get_msTransformStyle := CallbackCreate(GetMethod(implObj, "get_msTransformStyle"), flags, 2)
        this.vtbl.put_msBackfaceVisibility := CallbackCreate(GetMethod(implObj, "put_msBackfaceVisibility"), flags, 2)
        this.vtbl.get_msBackfaceVisibility := CallbackCreate(GetMethod(implObj, "get_msBackfaceVisibility"), flags, 2)
        this.vtbl.put_msPerspective := CallbackCreate(GetMethod(implObj, "put_msPerspective"), flags, 2)
        this.vtbl.get_msPerspective := CallbackCreate(GetMethod(implObj, "get_msPerspective"), flags, 2)
        this.vtbl.put_msPerspectiveOrigin := CallbackCreate(GetMethod(implObj, "put_msPerspectiveOrigin"), flags, 2)
        this.vtbl.get_msPerspectiveOrigin := CallbackCreate(GetMethod(implObj, "get_msPerspectiveOrigin"), flags, 2)
        this.vtbl.put_msTransitionProperty := CallbackCreate(GetMethod(implObj, "put_msTransitionProperty"), flags, 2)
        this.vtbl.get_msTransitionProperty := CallbackCreate(GetMethod(implObj, "get_msTransitionProperty"), flags, 2)
        this.vtbl.put_msTransitionDuration := CallbackCreate(GetMethod(implObj, "put_msTransitionDuration"), flags, 2)
        this.vtbl.get_msTransitionDuration := CallbackCreate(GetMethod(implObj, "get_msTransitionDuration"), flags, 2)
        this.vtbl.put_msTransitionTimingFunction := CallbackCreate(GetMethod(implObj, "put_msTransitionTimingFunction"), flags, 2)
        this.vtbl.get_msTransitionTimingFunction := CallbackCreate(GetMethod(implObj, "get_msTransitionTimingFunction"), flags, 2)
        this.vtbl.put_msTransitionDelay := CallbackCreate(GetMethod(implObj, "put_msTransitionDelay"), flags, 2)
        this.vtbl.get_msTransitionDelay := CallbackCreate(GetMethod(implObj, "get_msTransitionDelay"), flags, 2)
        this.vtbl.put_msTransition := CallbackCreate(GetMethod(implObj, "put_msTransition"), flags, 2)
        this.vtbl.get_msTransition := CallbackCreate(GetMethod(implObj, "get_msTransition"), flags, 2)
        this.vtbl.put_msTouchAction := CallbackCreate(GetMethod(implObj, "put_msTouchAction"), flags, 2)
        this.vtbl.get_msTouchAction := CallbackCreate(GetMethod(implObj, "get_msTouchAction"), flags, 2)
        this.vtbl.put_msScrollTranslation := CallbackCreate(GetMethod(implObj, "put_msScrollTranslation"), flags, 2)
        this.vtbl.get_msScrollTranslation := CallbackCreate(GetMethod(implObj, "get_msScrollTranslation"), flags, 2)
        this.vtbl.put_msFlex := CallbackCreate(GetMethod(implObj, "put_msFlex"), flags, 2)
        this.vtbl.get_msFlex := CallbackCreate(GetMethod(implObj, "get_msFlex"), flags, 2)
        this.vtbl.put_msFlexPositive := CallbackCreate(GetMethod(implObj, "put_msFlexPositive"), flags, 2)
        this.vtbl.get_msFlexPositive := CallbackCreate(GetMethod(implObj, "get_msFlexPositive"), flags, 2)
        this.vtbl.put_msFlexNegative := CallbackCreate(GetMethod(implObj, "put_msFlexNegative"), flags, 2)
        this.vtbl.get_msFlexNegative := CallbackCreate(GetMethod(implObj, "get_msFlexNegative"), flags, 2)
        this.vtbl.put_msFlexPreferredSize := CallbackCreate(GetMethod(implObj, "put_msFlexPreferredSize"), flags, 2)
        this.vtbl.get_msFlexPreferredSize := CallbackCreate(GetMethod(implObj, "get_msFlexPreferredSize"), flags, 2)
        this.vtbl.put_msFlexFlow := CallbackCreate(GetMethod(implObj, "put_msFlexFlow"), flags, 2)
        this.vtbl.get_msFlexFlow := CallbackCreate(GetMethod(implObj, "get_msFlexFlow"), flags, 2)
        this.vtbl.put_msFlexDirection := CallbackCreate(GetMethod(implObj, "put_msFlexDirection"), flags, 2)
        this.vtbl.get_msFlexDirection := CallbackCreate(GetMethod(implObj, "get_msFlexDirection"), flags, 2)
        this.vtbl.put_msFlexWrap := CallbackCreate(GetMethod(implObj, "put_msFlexWrap"), flags, 2)
        this.vtbl.get_msFlexWrap := CallbackCreate(GetMethod(implObj, "get_msFlexWrap"), flags, 2)
        this.vtbl.put_msFlexAlign := CallbackCreate(GetMethod(implObj, "put_msFlexAlign"), flags, 2)
        this.vtbl.get_msFlexAlign := CallbackCreate(GetMethod(implObj, "get_msFlexAlign"), flags, 2)
        this.vtbl.put_msFlexItemAlign := CallbackCreate(GetMethod(implObj, "put_msFlexItemAlign"), flags, 2)
        this.vtbl.get_msFlexItemAlign := CallbackCreate(GetMethod(implObj, "get_msFlexItemAlign"), flags, 2)
        this.vtbl.put_msFlexPack := CallbackCreate(GetMethod(implObj, "put_msFlexPack"), flags, 2)
        this.vtbl.get_msFlexPack := CallbackCreate(GetMethod(implObj, "get_msFlexPack"), flags, 2)
        this.vtbl.put_msFlexLinePack := CallbackCreate(GetMethod(implObj, "put_msFlexLinePack"), flags, 2)
        this.vtbl.get_msFlexLinePack := CallbackCreate(GetMethod(implObj, "get_msFlexLinePack"), flags, 2)
        this.vtbl.put_msFlexOrder := CallbackCreate(GetMethod(implObj, "put_msFlexOrder"), flags, 2)
        this.vtbl.get_msFlexOrder := CallbackCreate(GetMethod(implObj, "get_msFlexOrder"), flags, 2)
        this.vtbl.put_msTouchSelect := CallbackCreate(GetMethod(implObj, "put_msTouchSelect"), flags, 2)
        this.vtbl.get_msTouchSelect := CallbackCreate(GetMethod(implObj, "get_msTouchSelect"), flags, 2)
        this.vtbl.put_transform := CallbackCreate(GetMethod(implObj, "put_transform"), flags, 2)
        this.vtbl.get_transform := CallbackCreate(GetMethod(implObj, "get_transform"), flags, 2)
        this.vtbl.put_transformOrigin := CallbackCreate(GetMethod(implObj, "put_transformOrigin"), flags, 2)
        this.vtbl.get_transformOrigin := CallbackCreate(GetMethod(implObj, "get_transformOrigin"), flags, 2)
        this.vtbl.put_transformStyle := CallbackCreate(GetMethod(implObj, "put_transformStyle"), flags, 2)
        this.vtbl.get_transformStyle := CallbackCreate(GetMethod(implObj, "get_transformStyle"), flags, 2)
        this.vtbl.put_backfaceVisibility := CallbackCreate(GetMethod(implObj, "put_backfaceVisibility"), flags, 2)
        this.vtbl.get_backfaceVisibility := CallbackCreate(GetMethod(implObj, "get_backfaceVisibility"), flags, 2)
        this.vtbl.put_perspective := CallbackCreate(GetMethod(implObj, "put_perspective"), flags, 2)
        this.vtbl.get_perspective := CallbackCreate(GetMethod(implObj, "get_perspective"), flags, 2)
        this.vtbl.put_perspectiveOrigin := CallbackCreate(GetMethod(implObj, "put_perspectiveOrigin"), flags, 2)
        this.vtbl.get_perspectiveOrigin := CallbackCreate(GetMethod(implObj, "get_perspectiveOrigin"), flags, 2)
        this.vtbl.put_transitionProperty := CallbackCreate(GetMethod(implObj, "put_transitionProperty"), flags, 2)
        this.vtbl.get_transitionProperty := CallbackCreate(GetMethod(implObj, "get_transitionProperty"), flags, 2)
        this.vtbl.put_transitionDuration := CallbackCreate(GetMethod(implObj, "put_transitionDuration"), flags, 2)
        this.vtbl.get_transitionDuration := CallbackCreate(GetMethod(implObj, "get_transitionDuration"), flags, 2)
        this.vtbl.put_transitionTimingFunction := CallbackCreate(GetMethod(implObj, "put_transitionTimingFunction"), flags, 2)
        this.vtbl.get_transitionTimingFunction := CallbackCreate(GetMethod(implObj, "get_transitionTimingFunction"), flags, 2)
        this.vtbl.put_transitionDelay := CallbackCreate(GetMethod(implObj, "put_transitionDelay"), flags, 2)
        this.vtbl.get_transitionDelay := CallbackCreate(GetMethod(implObj, "get_transitionDelay"), flags, 2)
        this.vtbl.put_transition := CallbackCreate(GetMethod(implObj, "put_transition"), flags, 2)
        this.vtbl.get_transition := CallbackCreate(GetMethod(implObj, "get_transition"), flags, 2)
        this.vtbl.put_fontFeatureSettings := CallbackCreate(GetMethod(implObj, "put_fontFeatureSettings"), flags, 2)
        this.vtbl.get_fontFeatureSettings := CallbackCreate(GetMethod(implObj, "get_fontFeatureSettings"), flags, 2)
        this.vtbl.put_animationName := CallbackCreate(GetMethod(implObj, "put_animationName"), flags, 2)
        this.vtbl.get_animationName := CallbackCreate(GetMethod(implObj, "get_animationName"), flags, 2)
        this.vtbl.put_animationDuration := CallbackCreate(GetMethod(implObj, "put_animationDuration"), flags, 2)
        this.vtbl.get_animationDuration := CallbackCreate(GetMethod(implObj, "get_animationDuration"), flags, 2)
        this.vtbl.put_animationTimingFunction := CallbackCreate(GetMethod(implObj, "put_animationTimingFunction"), flags, 2)
        this.vtbl.get_animationTimingFunction := CallbackCreate(GetMethod(implObj, "get_animationTimingFunction"), flags, 2)
        this.vtbl.put_animationDelay := CallbackCreate(GetMethod(implObj, "put_animationDelay"), flags, 2)
        this.vtbl.get_animationDelay := CallbackCreate(GetMethod(implObj, "get_animationDelay"), flags, 2)
        this.vtbl.put_animationDirection := CallbackCreate(GetMethod(implObj, "put_animationDirection"), flags, 2)
        this.vtbl.get_animationDirection := CallbackCreate(GetMethod(implObj, "get_animationDirection"), flags, 2)
        this.vtbl.put_animationPlayState := CallbackCreate(GetMethod(implObj, "put_animationPlayState"), flags, 2)
        this.vtbl.get_animationPlayState := CallbackCreate(GetMethod(implObj, "get_animationPlayState"), flags, 2)
        this.vtbl.put_animationIterationCount := CallbackCreate(GetMethod(implObj, "put_animationIterationCount"), flags, 2)
        this.vtbl.get_animationIterationCount := CallbackCreate(GetMethod(implObj, "get_animationIterationCount"), flags, 2)
        this.vtbl.put_animation := CallbackCreate(GetMethod(implObj, "put_animation"), flags, 2)
        this.vtbl.get_animation := CallbackCreate(GetMethod(implObj, "get_animation"), flags, 2)
        this.vtbl.put_animationFillMode := CallbackCreate(GetMethod(implObj, "put_animationFillMode"), flags, 2)
        this.vtbl.get_animationFillMode := CallbackCreate(GetMethod(implObj, "get_animationFillMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_msScrollChaining)
        CallbackFree(this.vtbl.get_msScrollChaining)
        CallbackFree(this.vtbl.put_msContentZooming)
        CallbackFree(this.vtbl.get_msContentZooming)
        CallbackFree(this.vtbl.put_msContentZoomSnapType)
        CallbackFree(this.vtbl.get_msContentZoomSnapType)
        CallbackFree(this.vtbl.put_msScrollRails)
        CallbackFree(this.vtbl.get_msScrollRails)
        CallbackFree(this.vtbl.put_msContentZoomChaining)
        CallbackFree(this.vtbl.get_msContentZoomChaining)
        CallbackFree(this.vtbl.put_msScrollSnapType)
        CallbackFree(this.vtbl.get_msScrollSnapType)
        CallbackFree(this.vtbl.put_msContentZoomLimit)
        CallbackFree(this.vtbl.get_msContentZoomLimit)
        CallbackFree(this.vtbl.put_msContentZoomSnap)
        CallbackFree(this.vtbl.get_msContentZoomSnap)
        CallbackFree(this.vtbl.put_msContentZoomSnapPoints)
        CallbackFree(this.vtbl.get_msContentZoomSnapPoints)
        CallbackFree(this.vtbl.put_msContentZoomLimitMin)
        CallbackFree(this.vtbl.get_msContentZoomLimitMin)
        CallbackFree(this.vtbl.put_msContentZoomLimitMax)
        CallbackFree(this.vtbl.get_msContentZoomLimitMax)
        CallbackFree(this.vtbl.put_msScrollSnapX)
        CallbackFree(this.vtbl.get_msScrollSnapX)
        CallbackFree(this.vtbl.put_msScrollSnapY)
        CallbackFree(this.vtbl.get_msScrollSnapY)
        CallbackFree(this.vtbl.put_msScrollSnapPointsX)
        CallbackFree(this.vtbl.get_msScrollSnapPointsX)
        CallbackFree(this.vtbl.put_msScrollSnapPointsY)
        CallbackFree(this.vtbl.get_msScrollSnapPointsY)
        CallbackFree(this.vtbl.put_msGridColumn)
        CallbackFree(this.vtbl.get_msGridColumn)
        CallbackFree(this.vtbl.put_msGridColumnAlign)
        CallbackFree(this.vtbl.get_msGridColumnAlign)
        CallbackFree(this.vtbl.put_msGridColumns)
        CallbackFree(this.vtbl.get_msGridColumns)
        CallbackFree(this.vtbl.put_msGridColumnSpan)
        CallbackFree(this.vtbl.get_msGridColumnSpan)
        CallbackFree(this.vtbl.put_msGridRow)
        CallbackFree(this.vtbl.get_msGridRow)
        CallbackFree(this.vtbl.put_msGridRowAlign)
        CallbackFree(this.vtbl.get_msGridRowAlign)
        CallbackFree(this.vtbl.put_msGridRows)
        CallbackFree(this.vtbl.get_msGridRows)
        CallbackFree(this.vtbl.put_msGridRowSpan)
        CallbackFree(this.vtbl.get_msGridRowSpan)
        CallbackFree(this.vtbl.put_msWrapThrough)
        CallbackFree(this.vtbl.get_msWrapThrough)
        CallbackFree(this.vtbl.put_msWrapMargin)
        CallbackFree(this.vtbl.get_msWrapMargin)
        CallbackFree(this.vtbl.put_msWrapFlow)
        CallbackFree(this.vtbl.get_msWrapFlow)
        CallbackFree(this.vtbl.put_msAnimationName)
        CallbackFree(this.vtbl.get_msAnimationName)
        CallbackFree(this.vtbl.put_msAnimationDuration)
        CallbackFree(this.vtbl.get_msAnimationDuration)
        CallbackFree(this.vtbl.put_msAnimationTimingFunction)
        CallbackFree(this.vtbl.get_msAnimationTimingFunction)
        CallbackFree(this.vtbl.put_msAnimationDelay)
        CallbackFree(this.vtbl.get_msAnimationDelay)
        CallbackFree(this.vtbl.put_msAnimationDirection)
        CallbackFree(this.vtbl.get_msAnimationDirection)
        CallbackFree(this.vtbl.put_msAnimationPlayState)
        CallbackFree(this.vtbl.get_msAnimationPlayState)
        CallbackFree(this.vtbl.put_msAnimationIterationCount)
        CallbackFree(this.vtbl.get_msAnimationIterationCount)
        CallbackFree(this.vtbl.put_msAnimation)
        CallbackFree(this.vtbl.get_msAnimation)
        CallbackFree(this.vtbl.put_msAnimationFillMode)
        CallbackFree(this.vtbl.get_msAnimationFillMode)
        CallbackFree(this.vtbl.put_colorInterpolationFilters)
        CallbackFree(this.vtbl.get_colorInterpolationFilters)
        CallbackFree(this.vtbl.put_columnCount)
        CallbackFree(this.vtbl.get_columnCount)
        CallbackFree(this.vtbl.put_columnWidth)
        CallbackFree(this.vtbl.get_columnWidth)
        CallbackFree(this.vtbl.put_columnGap)
        CallbackFree(this.vtbl.get_columnGap)
        CallbackFree(this.vtbl.put_columnFill)
        CallbackFree(this.vtbl.get_columnFill)
        CallbackFree(this.vtbl.put_columnSpan)
        CallbackFree(this.vtbl.get_columnSpan)
        CallbackFree(this.vtbl.put_columns)
        CallbackFree(this.vtbl.get_columns)
        CallbackFree(this.vtbl.put_columnRule)
        CallbackFree(this.vtbl.get_columnRule)
        CallbackFree(this.vtbl.put_columnRuleColor)
        CallbackFree(this.vtbl.get_columnRuleColor)
        CallbackFree(this.vtbl.put_columnRuleStyle)
        CallbackFree(this.vtbl.get_columnRuleStyle)
        CallbackFree(this.vtbl.put_columnRuleWidth)
        CallbackFree(this.vtbl.get_columnRuleWidth)
        CallbackFree(this.vtbl.put_breakBefore)
        CallbackFree(this.vtbl.get_breakBefore)
        CallbackFree(this.vtbl.put_breakAfter)
        CallbackFree(this.vtbl.get_breakAfter)
        CallbackFree(this.vtbl.put_breakInside)
        CallbackFree(this.vtbl.get_breakInside)
        CallbackFree(this.vtbl.put_floodColor)
        CallbackFree(this.vtbl.get_floodColor)
        CallbackFree(this.vtbl.put_floodOpacity)
        CallbackFree(this.vtbl.get_floodOpacity)
        CallbackFree(this.vtbl.put_lightingColor)
        CallbackFree(this.vtbl.get_lightingColor)
        CallbackFree(this.vtbl.put_msScrollLimitXMin)
        CallbackFree(this.vtbl.get_msScrollLimitXMin)
        CallbackFree(this.vtbl.put_msScrollLimitYMin)
        CallbackFree(this.vtbl.get_msScrollLimitYMin)
        CallbackFree(this.vtbl.put_msScrollLimitXMax)
        CallbackFree(this.vtbl.get_msScrollLimitXMax)
        CallbackFree(this.vtbl.put_msScrollLimitYMax)
        CallbackFree(this.vtbl.get_msScrollLimitYMax)
        CallbackFree(this.vtbl.put_msScrollLimit)
        CallbackFree(this.vtbl.get_msScrollLimit)
        CallbackFree(this.vtbl.put_textShadow)
        CallbackFree(this.vtbl.get_textShadow)
        CallbackFree(this.vtbl.put_msFlowFrom)
        CallbackFree(this.vtbl.get_msFlowFrom)
        CallbackFree(this.vtbl.put_msFlowInto)
        CallbackFree(this.vtbl.get_msFlowInto)
        CallbackFree(this.vtbl.put_msHyphens)
        CallbackFree(this.vtbl.get_msHyphens)
        CallbackFree(this.vtbl.put_msHyphenateLimitZone)
        CallbackFree(this.vtbl.get_msHyphenateLimitZone)
        CallbackFree(this.vtbl.put_msHyphenateLimitChars)
        CallbackFree(this.vtbl.get_msHyphenateLimitChars)
        CallbackFree(this.vtbl.put_msHyphenateLimitLines)
        CallbackFree(this.vtbl.get_msHyphenateLimitLines)
        CallbackFree(this.vtbl.put_msHighContrastAdjust)
        CallbackFree(this.vtbl.get_msHighContrastAdjust)
        CallbackFree(this.vtbl.put_enableBackground)
        CallbackFree(this.vtbl.get_enableBackground)
        CallbackFree(this.vtbl.put_msFontFeatureSettings)
        CallbackFree(this.vtbl.get_msFontFeatureSettings)
        CallbackFree(this.vtbl.put_msUserSelect)
        CallbackFree(this.vtbl.get_msUserSelect)
        CallbackFree(this.vtbl.put_msOverflowStyle)
        CallbackFree(this.vtbl.get_msOverflowStyle)
        CallbackFree(this.vtbl.put_msTransformStyle)
        CallbackFree(this.vtbl.get_msTransformStyle)
        CallbackFree(this.vtbl.put_msBackfaceVisibility)
        CallbackFree(this.vtbl.get_msBackfaceVisibility)
        CallbackFree(this.vtbl.put_msPerspective)
        CallbackFree(this.vtbl.get_msPerspective)
        CallbackFree(this.vtbl.put_msPerspectiveOrigin)
        CallbackFree(this.vtbl.get_msPerspectiveOrigin)
        CallbackFree(this.vtbl.put_msTransitionProperty)
        CallbackFree(this.vtbl.get_msTransitionProperty)
        CallbackFree(this.vtbl.put_msTransitionDuration)
        CallbackFree(this.vtbl.get_msTransitionDuration)
        CallbackFree(this.vtbl.put_msTransitionTimingFunction)
        CallbackFree(this.vtbl.get_msTransitionTimingFunction)
        CallbackFree(this.vtbl.put_msTransitionDelay)
        CallbackFree(this.vtbl.get_msTransitionDelay)
        CallbackFree(this.vtbl.put_msTransition)
        CallbackFree(this.vtbl.get_msTransition)
        CallbackFree(this.vtbl.put_msTouchAction)
        CallbackFree(this.vtbl.get_msTouchAction)
        CallbackFree(this.vtbl.put_msScrollTranslation)
        CallbackFree(this.vtbl.get_msScrollTranslation)
        CallbackFree(this.vtbl.put_msFlex)
        CallbackFree(this.vtbl.get_msFlex)
        CallbackFree(this.vtbl.put_msFlexPositive)
        CallbackFree(this.vtbl.get_msFlexPositive)
        CallbackFree(this.vtbl.put_msFlexNegative)
        CallbackFree(this.vtbl.get_msFlexNegative)
        CallbackFree(this.vtbl.put_msFlexPreferredSize)
        CallbackFree(this.vtbl.get_msFlexPreferredSize)
        CallbackFree(this.vtbl.put_msFlexFlow)
        CallbackFree(this.vtbl.get_msFlexFlow)
        CallbackFree(this.vtbl.put_msFlexDirection)
        CallbackFree(this.vtbl.get_msFlexDirection)
        CallbackFree(this.vtbl.put_msFlexWrap)
        CallbackFree(this.vtbl.get_msFlexWrap)
        CallbackFree(this.vtbl.put_msFlexAlign)
        CallbackFree(this.vtbl.get_msFlexAlign)
        CallbackFree(this.vtbl.put_msFlexItemAlign)
        CallbackFree(this.vtbl.get_msFlexItemAlign)
        CallbackFree(this.vtbl.put_msFlexPack)
        CallbackFree(this.vtbl.get_msFlexPack)
        CallbackFree(this.vtbl.put_msFlexLinePack)
        CallbackFree(this.vtbl.get_msFlexLinePack)
        CallbackFree(this.vtbl.put_msFlexOrder)
        CallbackFree(this.vtbl.get_msFlexOrder)
        CallbackFree(this.vtbl.put_msTouchSelect)
        CallbackFree(this.vtbl.get_msTouchSelect)
        CallbackFree(this.vtbl.put_transform)
        CallbackFree(this.vtbl.get_transform)
        CallbackFree(this.vtbl.put_transformOrigin)
        CallbackFree(this.vtbl.get_transformOrigin)
        CallbackFree(this.vtbl.put_transformStyle)
        CallbackFree(this.vtbl.get_transformStyle)
        CallbackFree(this.vtbl.put_backfaceVisibility)
        CallbackFree(this.vtbl.get_backfaceVisibility)
        CallbackFree(this.vtbl.put_perspective)
        CallbackFree(this.vtbl.get_perspective)
        CallbackFree(this.vtbl.put_perspectiveOrigin)
        CallbackFree(this.vtbl.get_perspectiveOrigin)
        CallbackFree(this.vtbl.put_transitionProperty)
        CallbackFree(this.vtbl.get_transitionProperty)
        CallbackFree(this.vtbl.put_transitionDuration)
        CallbackFree(this.vtbl.get_transitionDuration)
        CallbackFree(this.vtbl.put_transitionTimingFunction)
        CallbackFree(this.vtbl.get_transitionTimingFunction)
        CallbackFree(this.vtbl.put_transitionDelay)
        CallbackFree(this.vtbl.get_transitionDelay)
        CallbackFree(this.vtbl.put_transition)
        CallbackFree(this.vtbl.get_transition)
        CallbackFree(this.vtbl.put_fontFeatureSettings)
        CallbackFree(this.vtbl.get_fontFeatureSettings)
        CallbackFree(this.vtbl.put_animationName)
        CallbackFree(this.vtbl.get_animationName)
        CallbackFree(this.vtbl.put_animationDuration)
        CallbackFree(this.vtbl.get_animationDuration)
        CallbackFree(this.vtbl.put_animationTimingFunction)
        CallbackFree(this.vtbl.get_animationTimingFunction)
        CallbackFree(this.vtbl.put_animationDelay)
        CallbackFree(this.vtbl.get_animationDelay)
        CallbackFree(this.vtbl.put_animationDirection)
        CallbackFree(this.vtbl.get_animationDirection)
        CallbackFree(this.vtbl.put_animationPlayState)
        CallbackFree(this.vtbl.get_animationPlayState)
        CallbackFree(this.vtbl.put_animationIterationCount)
        CallbackFree(this.vtbl.get_animationIterationCount)
        CallbackFree(this.vtbl.put_animation)
        CallbackFree(this.vtbl.get_animation)
        CallbackFree(this.vtbl.put_animationFillMode)
        CallbackFree(this.vtbl.get_animationFillMode)
    }
}
