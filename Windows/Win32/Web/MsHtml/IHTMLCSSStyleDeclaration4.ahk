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
class IHTMLCSSStyleDeclaration4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCSSStyleDeclaration4
     * @type {Guid}
     */
    static IID => Guid("{d6100f3b-27c8-4132-afea-f0e4b1e00060}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_webkitAppearance", "get_webkitAppearance", "put_webkitUserSelect", "get_webkitUserSelect", "put_webkitBoxAlign", "get_webkitBoxAlign", "put_webkitBoxOrdinalGroup", "get_webkitBoxOrdinalGroup", "put_webkitBoxPack", "get_webkitBoxPack", "put_webkitBoxFlex", "get_webkitBoxFlex", "put_webkitBoxOrient", "get_webkitBoxOrient", "put_webkitBoxDirection", "get_webkitBoxDirection", "put_webkitTransform", "get_webkitTransform", "put_webkitBackgroundSize", "get_webkitBackgroundSize", "put_webkitBackfaceVisibility", "get_webkitBackfaceVisibility", "put_webkitAnimation", "get_webkitAnimation", "put_webkitTransition", "get_webkitTransition", "put_webkitAnimationName", "get_webkitAnimationName", "put_webkitAnimationDuration", "get_webkitAnimationDuration", "put_webkitAnimationTimingFunction", "get_webkitAnimationTimingFunction", "put_webkitAnimationDelay", "get_webkitAnimationDelay", "put_webkitAnimationIterationCount", "get_webkitAnimationIterationCount", "put_webkitAnimationDirection", "get_webkitAnimationDirection", "put_webkitAnimationPlayState", "get_webkitAnimationPlayState", "put_webkitTransitionProperty", "get_webkitTransitionProperty", "put_webkitTransitionDuration", "get_webkitTransitionDuration", "put_webkitTransitionTimingFunction", "get_webkitTransitionTimingFunction", "put_webkitTransitionDelay", "get_webkitTransitionDelay", "put_webkitBackgroundAttachment", "get_webkitBackgroundAttachment", "put_webkitBackgroundColor", "get_webkitBackgroundColor", "put_webkitBackgroundClip", "get_webkitBackgroundClip", "put_webkitBackgroundImage", "get_webkitBackgroundImage", "put_webkitBackgroundRepeat", "get_webkitBackgroundRepeat", "put_webkitBackgroundOrigin", "get_webkitBackgroundOrigin", "put_webkitBackgroundPosition", "get_webkitBackgroundPosition", "put_webkitBackgroundPositionX", "get_webkitBackgroundPositionX", "put_webkitBackgroundPositionY", "get_webkitBackgroundPositionY", "put_webkitBackground", "get_webkitBackground", "put_webkitTransformOrigin", "get_webkitTransformOrigin", "put_msTextSizeAdjust", "get_msTextSizeAdjust", "put_webkitTextSizeAdjust", "get_webkitTextSizeAdjust", "put_webkitBorderImage", "get_webkitBorderImage", "put_webkitBorderImageSource", "get_webkitBorderImageSource", "put_webkitBorderImageSlice", "get_webkitBorderImageSlice", "put_webkitBorderImageWidth", "get_webkitBorderImageWidth", "put_webkitBorderImageOutset", "get_webkitBorderImageOutset", "put_webkitBorderImageRepeat", "get_webkitBorderImageRepeat", "put_webkitBoxSizing", "get_webkitBoxSizing", "put_webkitAnimationFillMode", "get_webkitAnimationFillMode"]

    /**
     * @type {BSTR} 
     */
    webkitAppearance {
        get => this.get_webkitAppearance()
        set => this.put_webkitAppearance(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitUserSelect {
        get => this.get_webkitUserSelect()
        set => this.put_webkitUserSelect(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBoxAlign {
        get => this.get_webkitBoxAlign()
        set => this.put_webkitBoxAlign(value)
    }

    /**
     * @type {VARIANT} 
     */
    webkitBoxOrdinalGroup {
        get => this.get_webkitBoxOrdinalGroup()
        set => this.put_webkitBoxOrdinalGroup(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBoxPack {
        get => this.get_webkitBoxPack()
        set => this.put_webkitBoxPack(value)
    }

    /**
     * @type {VARIANT} 
     */
    webkitBoxFlex {
        get => this.get_webkitBoxFlex()
        set => this.put_webkitBoxFlex(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBoxOrient {
        get => this.get_webkitBoxOrient()
        set => this.put_webkitBoxOrient(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBoxDirection {
        get => this.get_webkitBoxDirection()
        set => this.put_webkitBoxDirection(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitTransform {
        get => this.get_webkitTransform()
        set => this.put_webkitTransform(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBackgroundSize {
        get => this.get_webkitBackgroundSize()
        set => this.put_webkitBackgroundSize(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBackfaceVisibility {
        get => this.get_webkitBackfaceVisibility()
        set => this.put_webkitBackfaceVisibility(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitAnimation {
        get => this.get_webkitAnimation()
        set => this.put_webkitAnimation(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitTransition {
        get => this.get_webkitTransition()
        set => this.put_webkitTransition(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitAnimationName {
        get => this.get_webkitAnimationName()
        set => this.put_webkitAnimationName(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitAnimationDuration {
        get => this.get_webkitAnimationDuration()
        set => this.put_webkitAnimationDuration(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitAnimationTimingFunction {
        get => this.get_webkitAnimationTimingFunction()
        set => this.put_webkitAnimationTimingFunction(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitAnimationDelay {
        get => this.get_webkitAnimationDelay()
        set => this.put_webkitAnimationDelay(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitAnimationIterationCount {
        get => this.get_webkitAnimationIterationCount()
        set => this.put_webkitAnimationIterationCount(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitAnimationDirection {
        get => this.get_webkitAnimationDirection()
        set => this.put_webkitAnimationDirection(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitAnimationPlayState {
        get => this.get_webkitAnimationPlayState()
        set => this.put_webkitAnimationPlayState(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitTransitionProperty {
        get => this.get_webkitTransitionProperty()
        set => this.put_webkitTransitionProperty(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitTransitionDuration {
        get => this.get_webkitTransitionDuration()
        set => this.put_webkitTransitionDuration(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitTransitionTimingFunction {
        get => this.get_webkitTransitionTimingFunction()
        set => this.put_webkitTransitionTimingFunction(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitTransitionDelay {
        get => this.get_webkitTransitionDelay()
        set => this.put_webkitTransitionDelay(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBackgroundAttachment {
        get => this.get_webkitBackgroundAttachment()
        set => this.put_webkitBackgroundAttachment(value)
    }

    /**
     * @type {VARIANT} 
     */
    webkitBackgroundColor {
        get => this.get_webkitBackgroundColor()
        set => this.put_webkitBackgroundColor(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBackgroundClip {
        get => this.get_webkitBackgroundClip()
        set => this.put_webkitBackgroundClip(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBackgroundImage {
        get => this.get_webkitBackgroundImage()
        set => this.put_webkitBackgroundImage(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBackgroundRepeat {
        get => this.get_webkitBackgroundRepeat()
        set => this.put_webkitBackgroundRepeat(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBackgroundOrigin {
        get => this.get_webkitBackgroundOrigin()
        set => this.put_webkitBackgroundOrigin(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBackgroundPosition {
        get => this.get_webkitBackgroundPosition()
        set => this.put_webkitBackgroundPosition(value)
    }

    /**
     * @type {VARIANT} 
     */
    webkitBackgroundPositionX {
        get => this.get_webkitBackgroundPositionX()
        set => this.put_webkitBackgroundPositionX(value)
    }

    /**
     * @type {VARIANT} 
     */
    webkitBackgroundPositionY {
        get => this.get_webkitBackgroundPositionY()
        set => this.put_webkitBackgroundPositionY(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBackground {
        get => this.get_webkitBackground()
        set => this.put_webkitBackground(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitTransformOrigin {
        get => this.get_webkitTransformOrigin()
        set => this.put_webkitTransformOrigin(value)
    }

    /**
     * @type {VARIANT} 
     */
    msTextSizeAdjust {
        get => this.get_msTextSizeAdjust()
        set => this.put_msTextSizeAdjust(value)
    }

    /**
     * @type {VARIANT} 
     */
    webkitTextSizeAdjust {
        get => this.get_webkitTextSizeAdjust()
        set => this.put_webkitTextSizeAdjust(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBorderImage {
        get => this.get_webkitBorderImage()
        set => this.put_webkitBorderImage(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBorderImageSource {
        get => this.get_webkitBorderImageSource()
        set => this.put_webkitBorderImageSource(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBorderImageSlice {
        get => this.get_webkitBorderImageSlice()
        set => this.put_webkitBorderImageSlice(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBorderImageWidth {
        get => this.get_webkitBorderImageWidth()
        set => this.put_webkitBorderImageWidth(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBorderImageOutset {
        get => this.get_webkitBorderImageOutset()
        set => this.put_webkitBorderImageOutset(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBorderImageRepeat {
        get => this.get_webkitBorderImageRepeat()
        set => this.put_webkitBorderImageRepeat(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitBoxSizing {
        get => this.get_webkitBoxSizing()
        set => this.put_webkitBoxSizing(value)
    }

    /**
     * @type {BSTR} 
     */
    webkitAnimationFillMode {
        get => this.get_webkitAnimationFillMode()
        set => this.put_webkitAnimationFillMode(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAppearance(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAppearance() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitUserSelect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitUserSelect() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxAlign() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxOrdinalGroup(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBoxOrdinalGroup() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxPack(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxPack() {
        p := BSTR()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxFlex(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBoxFlex() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxOrient(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxOrient() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxDirection() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransform() {
        p := BSTR()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundSize(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundSize() {
        p := BSTR()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackfaceVisibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackfaceVisibility() {
        p := BSTR()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimation() {
        p := BSTR()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransition() {
        p := BSTR()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationName() {
        p := BSTR()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationDuration() {
        p := BSTR()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationTimingFunction() {
        p := BSTR()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationDelay() {
        p := BSTR()
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationIterationCount(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationIterationCount() {
        p := BSTR()
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationDirection() {
        p := BSTR()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationPlayState(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(45, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationPlayState() {
        p := BSTR()
        result := ComCall(46, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransitionProperty(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(47, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransitionProperty() {
        p := BSTR()
        result := ComCall(48, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransitionDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(49, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransitionDuration() {
        p := BSTR()
        result := ComCall(50, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransitionTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(51, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransitionTimingFunction() {
        p := BSTR()
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransitionDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransitionDelay() {
        p := BSTR()
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundAttachment(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(55, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundAttachment() {
        p := BSTR()
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundColor(v) {
        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBackgroundColor() {
        p := VARIANT()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundClip(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(59, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundClip() {
        p := BSTR()
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundImage() {
        p := BSTR()
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundRepeat() {
        p := BSTR()
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(65, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundOrigin() {
        p := BSTR()
        result := ComCall(66, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(67, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundPosition() {
        p := BSTR()
        result := ComCall(68, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundPositionX(v) {
        result := ComCall(69, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBackgroundPositionX() {
        p := VARIANT()
        result := ComCall(70, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundPositionY(v) {
        result := ComCall(71, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBackgroundPositionY() {
        p := VARIANT()
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackground(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(73, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackground() {
        p := BSTR()
        result := ComCall(74, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransformOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(75, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransformOrigin() {
        p := BSTR()
        result := ComCall(76, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msTextSizeAdjust(v) {
        result := ComCall(77, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msTextSizeAdjust() {
        p := VARIANT()
        result := ComCall(78, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitTextSizeAdjust(v) {
        result := ComCall(79, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitTextSizeAdjust() {
        p := VARIANT()
        result := ComCall(80, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(81, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImage() {
        p := BSTR()
        result := ComCall(82, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageSource(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(83, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageSource() {
        p := BSTR()
        result := ComCall(84, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageSlice(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(85, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageSlice() {
        p := BSTR()
        result := ComCall(86, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageWidth(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(87, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageWidth() {
        p := BSTR()
        result := ComCall(88, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageOutset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(89, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageOutset() {
        p := BSTR()
        result := ComCall(90, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(91, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageRepeat() {
        p := BSTR()
        result := ComCall(92, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxSizing(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(93, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxSizing() {
        p := BSTR()
        result := ComCall(94, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationFillMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(95, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationFillMode() {
        p := BSTR()
        result := ComCall(96, this, "ptr", p, "HRESULT")
        return p
    }
}
