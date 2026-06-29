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
export default struct IHTMLCSSStyleDeclaration4 extends IDispatch {
    /**
     * The interface identifier for IHTMLCSSStyleDeclaration4
     * @type {Guid}
     */
    static IID := Guid("{d6100f3b-27c8-4132-afea-f0e4b1e00060}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCSSStyleDeclaration4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_webkitAppearance               : IntPtr
        get_webkitAppearance               : IntPtr
        put_webkitUserSelect               : IntPtr
        get_webkitUserSelect               : IntPtr
        put_webkitBoxAlign                 : IntPtr
        get_webkitBoxAlign                 : IntPtr
        put_webkitBoxOrdinalGroup          : IntPtr
        get_webkitBoxOrdinalGroup          : IntPtr
        put_webkitBoxPack                  : IntPtr
        get_webkitBoxPack                  : IntPtr
        put_webkitBoxFlex                  : IntPtr
        get_webkitBoxFlex                  : IntPtr
        put_webkitBoxOrient                : IntPtr
        get_webkitBoxOrient                : IntPtr
        put_webkitBoxDirection             : IntPtr
        get_webkitBoxDirection             : IntPtr
        put_webkitTransform                : IntPtr
        get_webkitTransform                : IntPtr
        put_webkitBackgroundSize           : IntPtr
        get_webkitBackgroundSize           : IntPtr
        put_webkitBackfaceVisibility       : IntPtr
        get_webkitBackfaceVisibility       : IntPtr
        put_webkitAnimation                : IntPtr
        get_webkitAnimation                : IntPtr
        put_webkitTransition               : IntPtr
        get_webkitTransition               : IntPtr
        put_webkitAnimationName            : IntPtr
        get_webkitAnimationName            : IntPtr
        put_webkitAnimationDuration        : IntPtr
        get_webkitAnimationDuration        : IntPtr
        put_webkitAnimationTimingFunction  : IntPtr
        get_webkitAnimationTimingFunction  : IntPtr
        put_webkitAnimationDelay           : IntPtr
        get_webkitAnimationDelay           : IntPtr
        put_webkitAnimationIterationCount  : IntPtr
        get_webkitAnimationIterationCount  : IntPtr
        put_webkitAnimationDirection       : IntPtr
        get_webkitAnimationDirection       : IntPtr
        put_webkitAnimationPlayState       : IntPtr
        get_webkitAnimationPlayState       : IntPtr
        put_webkitTransitionProperty       : IntPtr
        get_webkitTransitionProperty       : IntPtr
        put_webkitTransitionDuration       : IntPtr
        get_webkitTransitionDuration       : IntPtr
        put_webkitTransitionTimingFunction : IntPtr
        get_webkitTransitionTimingFunction : IntPtr
        put_webkitTransitionDelay          : IntPtr
        get_webkitTransitionDelay          : IntPtr
        put_webkitBackgroundAttachment     : IntPtr
        get_webkitBackgroundAttachment     : IntPtr
        put_webkitBackgroundColor          : IntPtr
        get_webkitBackgroundColor          : IntPtr
        put_webkitBackgroundClip           : IntPtr
        get_webkitBackgroundClip           : IntPtr
        put_webkitBackgroundImage          : IntPtr
        get_webkitBackgroundImage          : IntPtr
        put_webkitBackgroundRepeat         : IntPtr
        get_webkitBackgroundRepeat         : IntPtr
        put_webkitBackgroundOrigin         : IntPtr
        get_webkitBackgroundOrigin         : IntPtr
        put_webkitBackgroundPosition       : IntPtr
        get_webkitBackgroundPosition       : IntPtr
        put_webkitBackgroundPositionX      : IntPtr
        get_webkitBackgroundPositionX      : IntPtr
        put_webkitBackgroundPositionY      : IntPtr
        get_webkitBackgroundPositionY      : IntPtr
        put_webkitBackground               : IntPtr
        get_webkitBackground               : IntPtr
        put_webkitTransformOrigin          : IntPtr
        get_webkitTransformOrigin          : IntPtr
        put_msTextSizeAdjust               : IntPtr
        get_msTextSizeAdjust               : IntPtr
        put_webkitTextSizeAdjust           : IntPtr
        get_webkitTextSizeAdjust           : IntPtr
        put_webkitBorderImage              : IntPtr
        get_webkitBorderImage              : IntPtr
        put_webkitBorderImageSource        : IntPtr
        get_webkitBorderImageSource        : IntPtr
        put_webkitBorderImageSlice         : IntPtr
        get_webkitBorderImageSlice         : IntPtr
        put_webkitBorderImageWidth         : IntPtr
        get_webkitBorderImageWidth         : IntPtr
        put_webkitBorderImageOutset        : IntPtr
        get_webkitBorderImageOutset        : IntPtr
        put_webkitBorderImageRepeat        : IntPtr
        get_webkitBorderImageRepeat        : IntPtr
        put_webkitBoxSizing                : IntPtr
        get_webkitBoxSizing                : IntPtr
        put_webkitAnimationFillMode        : IntPtr
        get_webkitAnimationFillMode        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCSSStyleDeclaration4.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAppearance() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitUserSelect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitUserSelect() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxAlign() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxOrdinalGroup(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBoxOrdinalGroup() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxPack(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxPack() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxFlex(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBoxFlex() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxOrient(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxOrient() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxDirection() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransform() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundSize(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundSize() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackfaceVisibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackfaceVisibility() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimation(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimation() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransition() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationName() {
        p := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationDuration() {
        p := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(37, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationTimingFunction() {
        p := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationDelay() {
        p := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationIterationCount(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationIterationCount() {
        p := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationDirection() {
        p := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationPlayState(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(45, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationPlayState() {
        p := BSTR.Owned()
        result := ComCall(46, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransitionProperty(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(47, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransitionProperty() {
        p := BSTR.Owned()
        result := ComCall(48, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransitionDuration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(49, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransitionDuration() {
        p := BSTR.Owned()
        result := ComCall(50, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransitionTimingFunction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(51, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransitionTimingFunction() {
        p := BSTR.Owned()
        result := ComCall(52, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransitionDelay(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransitionDelay() {
        p := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundAttachment(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(55, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundAttachment() {
        p := BSTR.Owned()
        result := ComCall(56, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundColor(v) {
        result := ComCall(57, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBackgroundColor() {
        p := VARIANT()
        result := ComCall(58, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundClip(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(59, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundClip() {
        p := BSTR.Owned()
        result := ComCall(60, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundImage() {
        p := BSTR.Owned()
        result := ComCall(62, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundRepeat() {
        p := BSTR.Owned()
        result := ComCall(64, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(65, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundOrigin() {
        p := BSTR.Owned()
        result := ComCall(66, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(67, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackgroundPosition() {
        p := BSTR.Owned()
        result := ComCall(68, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundPositionX(v) {
        result := ComCall(69, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBackgroundPositionX() {
        p := VARIANT()
        result := ComCall(70, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitBackgroundPositionY(v) {
        result := ComCall(71, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitBackgroundPositionY() {
        p := VARIANT()
        result := ComCall(72, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBackground(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(73, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBackground() {
        p := BSTR.Owned()
        result := ComCall(74, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitTransformOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(75, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitTransformOrigin() {
        p := BSTR.Owned()
        result := ComCall(76, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_msTextSizeAdjust(v) {
        result := ComCall(77, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_msTextSizeAdjust() {
        p := VARIANT()
        result := ComCall(78, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_webkitTextSizeAdjust(v) {
        result := ComCall(79, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_webkitTextSizeAdjust() {
        p := VARIANT()
        result := ComCall(80, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(81, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImage() {
        p := BSTR.Owned()
        result := ComCall(82, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageSource(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(83, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageSource() {
        p := BSTR.Owned()
        result := ComCall(84, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageSlice(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(85, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageSlice() {
        p := BSTR.Owned()
        result := ComCall(86, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageWidth(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(87, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageWidth() {
        p := BSTR.Owned()
        result := ComCall(88, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageOutset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(89, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageOutset() {
        p := BSTR.Owned()
        result := ComCall(90, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBorderImageRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(91, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBorderImageRepeat() {
        p := BSTR.Owned()
        result := ComCall(92, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitBoxSizing(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(93, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitBoxSizing() {
        p := BSTR.Owned()
        result := ComCall(94, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_webkitAnimationFillMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(95, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_webkitAnimationFillMode() {
        p := BSTR.Owned()
        result := ComCall(96, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCSSStyleDeclaration4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_webkitAppearance := CallbackCreate(GetMethod(implObj, "put_webkitAppearance"), flags, 2)
        this.vtbl.get_webkitAppearance := CallbackCreate(GetMethod(implObj, "get_webkitAppearance"), flags, 2)
        this.vtbl.put_webkitUserSelect := CallbackCreate(GetMethod(implObj, "put_webkitUserSelect"), flags, 2)
        this.vtbl.get_webkitUserSelect := CallbackCreate(GetMethod(implObj, "get_webkitUserSelect"), flags, 2)
        this.vtbl.put_webkitBoxAlign := CallbackCreate(GetMethod(implObj, "put_webkitBoxAlign"), flags, 2)
        this.vtbl.get_webkitBoxAlign := CallbackCreate(GetMethod(implObj, "get_webkitBoxAlign"), flags, 2)
        this.vtbl.put_webkitBoxOrdinalGroup := CallbackCreate(GetMethod(implObj, "put_webkitBoxOrdinalGroup"), flags, 2)
        this.vtbl.get_webkitBoxOrdinalGroup := CallbackCreate(GetMethod(implObj, "get_webkitBoxOrdinalGroup"), flags, 2)
        this.vtbl.put_webkitBoxPack := CallbackCreate(GetMethod(implObj, "put_webkitBoxPack"), flags, 2)
        this.vtbl.get_webkitBoxPack := CallbackCreate(GetMethod(implObj, "get_webkitBoxPack"), flags, 2)
        this.vtbl.put_webkitBoxFlex := CallbackCreate(GetMethod(implObj, "put_webkitBoxFlex"), flags, 2)
        this.vtbl.get_webkitBoxFlex := CallbackCreate(GetMethod(implObj, "get_webkitBoxFlex"), flags, 2)
        this.vtbl.put_webkitBoxOrient := CallbackCreate(GetMethod(implObj, "put_webkitBoxOrient"), flags, 2)
        this.vtbl.get_webkitBoxOrient := CallbackCreate(GetMethod(implObj, "get_webkitBoxOrient"), flags, 2)
        this.vtbl.put_webkitBoxDirection := CallbackCreate(GetMethod(implObj, "put_webkitBoxDirection"), flags, 2)
        this.vtbl.get_webkitBoxDirection := CallbackCreate(GetMethod(implObj, "get_webkitBoxDirection"), flags, 2)
        this.vtbl.put_webkitTransform := CallbackCreate(GetMethod(implObj, "put_webkitTransform"), flags, 2)
        this.vtbl.get_webkitTransform := CallbackCreate(GetMethod(implObj, "get_webkitTransform"), flags, 2)
        this.vtbl.put_webkitBackgroundSize := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundSize"), flags, 2)
        this.vtbl.get_webkitBackgroundSize := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundSize"), flags, 2)
        this.vtbl.put_webkitBackfaceVisibility := CallbackCreate(GetMethod(implObj, "put_webkitBackfaceVisibility"), flags, 2)
        this.vtbl.get_webkitBackfaceVisibility := CallbackCreate(GetMethod(implObj, "get_webkitBackfaceVisibility"), flags, 2)
        this.vtbl.put_webkitAnimation := CallbackCreate(GetMethod(implObj, "put_webkitAnimation"), flags, 2)
        this.vtbl.get_webkitAnimation := CallbackCreate(GetMethod(implObj, "get_webkitAnimation"), flags, 2)
        this.vtbl.put_webkitTransition := CallbackCreate(GetMethod(implObj, "put_webkitTransition"), flags, 2)
        this.vtbl.get_webkitTransition := CallbackCreate(GetMethod(implObj, "get_webkitTransition"), flags, 2)
        this.vtbl.put_webkitAnimationName := CallbackCreate(GetMethod(implObj, "put_webkitAnimationName"), flags, 2)
        this.vtbl.get_webkitAnimationName := CallbackCreate(GetMethod(implObj, "get_webkitAnimationName"), flags, 2)
        this.vtbl.put_webkitAnimationDuration := CallbackCreate(GetMethod(implObj, "put_webkitAnimationDuration"), flags, 2)
        this.vtbl.get_webkitAnimationDuration := CallbackCreate(GetMethod(implObj, "get_webkitAnimationDuration"), flags, 2)
        this.vtbl.put_webkitAnimationTimingFunction := CallbackCreate(GetMethod(implObj, "put_webkitAnimationTimingFunction"), flags, 2)
        this.vtbl.get_webkitAnimationTimingFunction := CallbackCreate(GetMethod(implObj, "get_webkitAnimationTimingFunction"), flags, 2)
        this.vtbl.put_webkitAnimationDelay := CallbackCreate(GetMethod(implObj, "put_webkitAnimationDelay"), flags, 2)
        this.vtbl.get_webkitAnimationDelay := CallbackCreate(GetMethod(implObj, "get_webkitAnimationDelay"), flags, 2)
        this.vtbl.put_webkitAnimationIterationCount := CallbackCreate(GetMethod(implObj, "put_webkitAnimationIterationCount"), flags, 2)
        this.vtbl.get_webkitAnimationIterationCount := CallbackCreate(GetMethod(implObj, "get_webkitAnimationIterationCount"), flags, 2)
        this.vtbl.put_webkitAnimationDirection := CallbackCreate(GetMethod(implObj, "put_webkitAnimationDirection"), flags, 2)
        this.vtbl.get_webkitAnimationDirection := CallbackCreate(GetMethod(implObj, "get_webkitAnimationDirection"), flags, 2)
        this.vtbl.put_webkitAnimationPlayState := CallbackCreate(GetMethod(implObj, "put_webkitAnimationPlayState"), flags, 2)
        this.vtbl.get_webkitAnimationPlayState := CallbackCreate(GetMethod(implObj, "get_webkitAnimationPlayState"), flags, 2)
        this.vtbl.put_webkitTransitionProperty := CallbackCreate(GetMethod(implObj, "put_webkitTransitionProperty"), flags, 2)
        this.vtbl.get_webkitTransitionProperty := CallbackCreate(GetMethod(implObj, "get_webkitTransitionProperty"), flags, 2)
        this.vtbl.put_webkitTransitionDuration := CallbackCreate(GetMethod(implObj, "put_webkitTransitionDuration"), flags, 2)
        this.vtbl.get_webkitTransitionDuration := CallbackCreate(GetMethod(implObj, "get_webkitTransitionDuration"), flags, 2)
        this.vtbl.put_webkitTransitionTimingFunction := CallbackCreate(GetMethod(implObj, "put_webkitTransitionTimingFunction"), flags, 2)
        this.vtbl.get_webkitTransitionTimingFunction := CallbackCreate(GetMethod(implObj, "get_webkitTransitionTimingFunction"), flags, 2)
        this.vtbl.put_webkitTransitionDelay := CallbackCreate(GetMethod(implObj, "put_webkitTransitionDelay"), flags, 2)
        this.vtbl.get_webkitTransitionDelay := CallbackCreate(GetMethod(implObj, "get_webkitTransitionDelay"), flags, 2)
        this.vtbl.put_webkitBackgroundAttachment := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundAttachment"), flags, 2)
        this.vtbl.get_webkitBackgroundAttachment := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundAttachment"), flags, 2)
        this.vtbl.put_webkitBackgroundColor := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundColor"), flags, 2)
        this.vtbl.get_webkitBackgroundColor := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundColor"), flags, 2)
        this.vtbl.put_webkitBackgroundClip := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundClip"), flags, 2)
        this.vtbl.get_webkitBackgroundClip := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundClip"), flags, 2)
        this.vtbl.put_webkitBackgroundImage := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundImage"), flags, 2)
        this.vtbl.get_webkitBackgroundImage := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundImage"), flags, 2)
        this.vtbl.put_webkitBackgroundRepeat := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundRepeat"), flags, 2)
        this.vtbl.get_webkitBackgroundRepeat := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundRepeat"), flags, 2)
        this.vtbl.put_webkitBackgroundOrigin := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundOrigin"), flags, 2)
        this.vtbl.get_webkitBackgroundOrigin := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundOrigin"), flags, 2)
        this.vtbl.put_webkitBackgroundPosition := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundPosition"), flags, 2)
        this.vtbl.get_webkitBackgroundPosition := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundPosition"), flags, 2)
        this.vtbl.put_webkitBackgroundPositionX := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundPositionX"), flags, 2)
        this.vtbl.get_webkitBackgroundPositionX := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundPositionX"), flags, 2)
        this.vtbl.put_webkitBackgroundPositionY := CallbackCreate(GetMethod(implObj, "put_webkitBackgroundPositionY"), flags, 2)
        this.vtbl.get_webkitBackgroundPositionY := CallbackCreate(GetMethod(implObj, "get_webkitBackgroundPositionY"), flags, 2)
        this.vtbl.put_webkitBackground := CallbackCreate(GetMethod(implObj, "put_webkitBackground"), flags, 2)
        this.vtbl.get_webkitBackground := CallbackCreate(GetMethod(implObj, "get_webkitBackground"), flags, 2)
        this.vtbl.put_webkitTransformOrigin := CallbackCreate(GetMethod(implObj, "put_webkitTransformOrigin"), flags, 2)
        this.vtbl.get_webkitTransformOrigin := CallbackCreate(GetMethod(implObj, "get_webkitTransformOrigin"), flags, 2)
        this.vtbl.put_msTextSizeAdjust := CallbackCreate(GetMethod(implObj, "put_msTextSizeAdjust"), flags, 2)
        this.vtbl.get_msTextSizeAdjust := CallbackCreate(GetMethod(implObj, "get_msTextSizeAdjust"), flags, 2)
        this.vtbl.put_webkitTextSizeAdjust := CallbackCreate(GetMethod(implObj, "put_webkitTextSizeAdjust"), flags, 2)
        this.vtbl.get_webkitTextSizeAdjust := CallbackCreate(GetMethod(implObj, "get_webkitTextSizeAdjust"), flags, 2)
        this.vtbl.put_webkitBorderImage := CallbackCreate(GetMethod(implObj, "put_webkitBorderImage"), flags, 2)
        this.vtbl.get_webkitBorderImage := CallbackCreate(GetMethod(implObj, "get_webkitBorderImage"), flags, 2)
        this.vtbl.put_webkitBorderImageSource := CallbackCreate(GetMethod(implObj, "put_webkitBorderImageSource"), flags, 2)
        this.vtbl.get_webkitBorderImageSource := CallbackCreate(GetMethod(implObj, "get_webkitBorderImageSource"), flags, 2)
        this.vtbl.put_webkitBorderImageSlice := CallbackCreate(GetMethod(implObj, "put_webkitBorderImageSlice"), flags, 2)
        this.vtbl.get_webkitBorderImageSlice := CallbackCreate(GetMethod(implObj, "get_webkitBorderImageSlice"), flags, 2)
        this.vtbl.put_webkitBorderImageWidth := CallbackCreate(GetMethod(implObj, "put_webkitBorderImageWidth"), flags, 2)
        this.vtbl.get_webkitBorderImageWidth := CallbackCreate(GetMethod(implObj, "get_webkitBorderImageWidth"), flags, 2)
        this.vtbl.put_webkitBorderImageOutset := CallbackCreate(GetMethod(implObj, "put_webkitBorderImageOutset"), flags, 2)
        this.vtbl.get_webkitBorderImageOutset := CallbackCreate(GetMethod(implObj, "get_webkitBorderImageOutset"), flags, 2)
        this.vtbl.put_webkitBorderImageRepeat := CallbackCreate(GetMethod(implObj, "put_webkitBorderImageRepeat"), flags, 2)
        this.vtbl.get_webkitBorderImageRepeat := CallbackCreate(GetMethod(implObj, "get_webkitBorderImageRepeat"), flags, 2)
        this.vtbl.put_webkitBoxSizing := CallbackCreate(GetMethod(implObj, "put_webkitBoxSizing"), flags, 2)
        this.vtbl.get_webkitBoxSizing := CallbackCreate(GetMethod(implObj, "get_webkitBoxSizing"), flags, 2)
        this.vtbl.put_webkitAnimationFillMode := CallbackCreate(GetMethod(implObj, "put_webkitAnimationFillMode"), flags, 2)
        this.vtbl.get_webkitAnimationFillMode := CallbackCreate(GetMethod(implObj, "get_webkitAnimationFillMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_webkitAppearance)
        CallbackFree(this.vtbl.get_webkitAppearance)
        CallbackFree(this.vtbl.put_webkitUserSelect)
        CallbackFree(this.vtbl.get_webkitUserSelect)
        CallbackFree(this.vtbl.put_webkitBoxAlign)
        CallbackFree(this.vtbl.get_webkitBoxAlign)
        CallbackFree(this.vtbl.put_webkitBoxOrdinalGroup)
        CallbackFree(this.vtbl.get_webkitBoxOrdinalGroup)
        CallbackFree(this.vtbl.put_webkitBoxPack)
        CallbackFree(this.vtbl.get_webkitBoxPack)
        CallbackFree(this.vtbl.put_webkitBoxFlex)
        CallbackFree(this.vtbl.get_webkitBoxFlex)
        CallbackFree(this.vtbl.put_webkitBoxOrient)
        CallbackFree(this.vtbl.get_webkitBoxOrient)
        CallbackFree(this.vtbl.put_webkitBoxDirection)
        CallbackFree(this.vtbl.get_webkitBoxDirection)
        CallbackFree(this.vtbl.put_webkitTransform)
        CallbackFree(this.vtbl.get_webkitTransform)
        CallbackFree(this.vtbl.put_webkitBackgroundSize)
        CallbackFree(this.vtbl.get_webkitBackgroundSize)
        CallbackFree(this.vtbl.put_webkitBackfaceVisibility)
        CallbackFree(this.vtbl.get_webkitBackfaceVisibility)
        CallbackFree(this.vtbl.put_webkitAnimation)
        CallbackFree(this.vtbl.get_webkitAnimation)
        CallbackFree(this.vtbl.put_webkitTransition)
        CallbackFree(this.vtbl.get_webkitTransition)
        CallbackFree(this.vtbl.put_webkitAnimationName)
        CallbackFree(this.vtbl.get_webkitAnimationName)
        CallbackFree(this.vtbl.put_webkitAnimationDuration)
        CallbackFree(this.vtbl.get_webkitAnimationDuration)
        CallbackFree(this.vtbl.put_webkitAnimationTimingFunction)
        CallbackFree(this.vtbl.get_webkitAnimationTimingFunction)
        CallbackFree(this.vtbl.put_webkitAnimationDelay)
        CallbackFree(this.vtbl.get_webkitAnimationDelay)
        CallbackFree(this.vtbl.put_webkitAnimationIterationCount)
        CallbackFree(this.vtbl.get_webkitAnimationIterationCount)
        CallbackFree(this.vtbl.put_webkitAnimationDirection)
        CallbackFree(this.vtbl.get_webkitAnimationDirection)
        CallbackFree(this.vtbl.put_webkitAnimationPlayState)
        CallbackFree(this.vtbl.get_webkitAnimationPlayState)
        CallbackFree(this.vtbl.put_webkitTransitionProperty)
        CallbackFree(this.vtbl.get_webkitTransitionProperty)
        CallbackFree(this.vtbl.put_webkitTransitionDuration)
        CallbackFree(this.vtbl.get_webkitTransitionDuration)
        CallbackFree(this.vtbl.put_webkitTransitionTimingFunction)
        CallbackFree(this.vtbl.get_webkitTransitionTimingFunction)
        CallbackFree(this.vtbl.put_webkitTransitionDelay)
        CallbackFree(this.vtbl.get_webkitTransitionDelay)
        CallbackFree(this.vtbl.put_webkitBackgroundAttachment)
        CallbackFree(this.vtbl.get_webkitBackgroundAttachment)
        CallbackFree(this.vtbl.put_webkitBackgroundColor)
        CallbackFree(this.vtbl.get_webkitBackgroundColor)
        CallbackFree(this.vtbl.put_webkitBackgroundClip)
        CallbackFree(this.vtbl.get_webkitBackgroundClip)
        CallbackFree(this.vtbl.put_webkitBackgroundImage)
        CallbackFree(this.vtbl.get_webkitBackgroundImage)
        CallbackFree(this.vtbl.put_webkitBackgroundRepeat)
        CallbackFree(this.vtbl.get_webkitBackgroundRepeat)
        CallbackFree(this.vtbl.put_webkitBackgroundOrigin)
        CallbackFree(this.vtbl.get_webkitBackgroundOrigin)
        CallbackFree(this.vtbl.put_webkitBackgroundPosition)
        CallbackFree(this.vtbl.get_webkitBackgroundPosition)
        CallbackFree(this.vtbl.put_webkitBackgroundPositionX)
        CallbackFree(this.vtbl.get_webkitBackgroundPositionX)
        CallbackFree(this.vtbl.put_webkitBackgroundPositionY)
        CallbackFree(this.vtbl.get_webkitBackgroundPositionY)
        CallbackFree(this.vtbl.put_webkitBackground)
        CallbackFree(this.vtbl.get_webkitBackground)
        CallbackFree(this.vtbl.put_webkitTransformOrigin)
        CallbackFree(this.vtbl.get_webkitTransformOrigin)
        CallbackFree(this.vtbl.put_msTextSizeAdjust)
        CallbackFree(this.vtbl.get_msTextSizeAdjust)
        CallbackFree(this.vtbl.put_webkitTextSizeAdjust)
        CallbackFree(this.vtbl.get_webkitTextSizeAdjust)
        CallbackFree(this.vtbl.put_webkitBorderImage)
        CallbackFree(this.vtbl.get_webkitBorderImage)
        CallbackFree(this.vtbl.put_webkitBorderImageSource)
        CallbackFree(this.vtbl.get_webkitBorderImageSource)
        CallbackFree(this.vtbl.put_webkitBorderImageSlice)
        CallbackFree(this.vtbl.get_webkitBorderImageSlice)
        CallbackFree(this.vtbl.put_webkitBorderImageWidth)
        CallbackFree(this.vtbl.get_webkitBorderImageWidth)
        CallbackFree(this.vtbl.put_webkitBorderImageOutset)
        CallbackFree(this.vtbl.get_webkitBorderImageOutset)
        CallbackFree(this.vtbl.put_webkitBorderImageRepeat)
        CallbackFree(this.vtbl.get_webkitBorderImageRepeat)
        CallbackFree(this.vtbl.put_webkitBoxSizing)
        CallbackFree(this.vtbl.get_webkitBoxSizing)
        CallbackFree(this.vtbl.put_webkitAnimationFillMode)
        CallbackFree(this.vtbl.get_webkitAnimationFillMode)
    }
}
