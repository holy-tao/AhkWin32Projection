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
class IHTMLCSSStyleDeclaration3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCSSStyleDeclaration3
     * @type {Guid}
     */
    static IID => Guid("{3051085c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_flex", "get_flex", "put_flexDirection", "get_flexDirection", "put_flexWrap", "get_flexWrap", "put_flexFlow", "get_flexFlow", "put_flexGrow", "get_flexGrow", "put_flexShrink", "get_flexShrink", "put_flexBasis", "get_flexBasis", "put_justifyContent", "get_justifyContent", "put_alignItems", "get_alignItems", "put_alignSelf", "get_alignSelf", "put_alignContent", "get_alignContent", "put_borderImage", "get_borderImage", "put_borderImageSource", "get_borderImageSource", "put_borderImageSlice", "get_borderImageSlice", "put_borderImageWidth", "get_borderImageWidth", "put_borderImageOutset", "get_borderImageOutset", "put_borderImageRepeat", "get_borderImageRepeat", "put_msImeAlign", "get_msImeAlign", "put_msTextCombineHorizontal", "get_msTextCombineHorizontal", "put_touchAction", "get_touchAction"]

    /**
     * @type {BSTR} 
     */
    flex {
        get => this.get_flex()
        set => this.put_flex(value)
    }

    /**
     * @type {BSTR} 
     */
    flexDirection {
        get => this.get_flexDirection()
        set => this.put_flexDirection(value)
    }

    /**
     * @type {BSTR} 
     */
    flexWrap {
        get => this.get_flexWrap()
        set => this.put_flexWrap(value)
    }

    /**
     * @type {BSTR} 
     */
    flexFlow {
        get => this.get_flexFlow()
        set => this.put_flexFlow(value)
    }

    /**
     * @type {VARIANT} 
     */
    flexGrow {
        get => this.get_flexGrow()
        set => this.put_flexGrow(value)
    }

    /**
     * @type {VARIANT} 
     */
    flexShrink {
        get => this.get_flexShrink()
        set => this.put_flexShrink(value)
    }

    /**
     * @type {VARIANT} 
     */
    flexBasis {
        get => this.get_flexBasis()
        set => this.put_flexBasis(value)
    }

    /**
     * @type {BSTR} 
     */
    justifyContent {
        get => this.get_justifyContent()
        set => this.put_justifyContent(value)
    }

    /**
     * @type {BSTR} 
     */
    alignItems {
        get => this.get_alignItems()
        set => this.put_alignItems(value)
    }

    /**
     * @type {BSTR} 
     */
    alignSelf {
        get => this.get_alignSelf()
        set => this.put_alignSelf(value)
    }

    /**
     * @type {BSTR} 
     */
    alignContent {
        get => this.get_alignContent()
        set => this.put_alignContent(value)
    }

    /**
     * @type {BSTR} 
     */
    borderImage {
        get => this.get_borderImage()
        set => this.put_borderImage(value)
    }

    /**
     * @type {BSTR} 
     */
    borderImageSource {
        get => this.get_borderImageSource()
        set => this.put_borderImageSource(value)
    }

    /**
     * @type {BSTR} 
     */
    borderImageSlice {
        get => this.get_borderImageSlice()
        set => this.put_borderImageSlice(value)
    }

    /**
     * @type {BSTR} 
     */
    borderImageWidth {
        get => this.get_borderImageWidth()
        set => this.put_borderImageWidth(value)
    }

    /**
     * @type {BSTR} 
     */
    borderImageOutset {
        get => this.get_borderImageOutset()
        set => this.put_borderImageOutset(value)
    }

    /**
     * @type {BSTR} 
     */
    borderImageRepeat {
        get => this.get_borderImageRepeat()
        set => this.put_borderImageRepeat(value)
    }

    /**
     * @type {BSTR} 
     */
    msImeAlign {
        get => this.get_msImeAlign()
        set => this.put_msImeAlign(value)
    }

    /**
     * @type {BSTR} 
     */
    msTextCombineHorizontal {
        get => this.get_msTextCombineHorizontal()
        set => this.put_msTextCombineHorizontal(value)
    }

    /**
     * @type {BSTR} 
     */
    touchAction {
        get => this.get_touchAction()
        set => this.put_touchAction(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_flex(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_flex() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_flexDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_flexDirection() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_flexWrap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_flexWrap() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_flexFlow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_flexFlow() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_flexGrow(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_flexGrow() {
        p := VARIANT()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_flexShrink(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_flexShrink() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_flexBasis(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_flexBasis() {
        p := VARIANT()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_justifyContent(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_justifyContent() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alignItems(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alignItems() {
        p := BSTR()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alignSelf(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alignSelf() {
        p := BSTR()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alignContent(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alignContent() {
        p := BSTR()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImage() {
        p := BSTR()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageSource(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageSource() {
        p := BSTR()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageSlice(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageSlice() {
        p := BSTR()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageWidth(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageWidth() {
        p := BSTR()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageOutset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageOutset() {
        p := BSTR()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageRepeat() {
        p := BSTR()
        result := ComCall(40, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msImeAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msImeAlign() {
        p := BSTR()
        result := ComCall(42, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTextCombineHorizontal(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTextCombineHorizontal() {
        p := BSTR()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_touchAction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(45, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_touchAction() {
        p := BSTR()
        result := ComCall(46, this, "ptr", p, "HRESULT")
        return p
    }
}
