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
export default struct IHTMLCSSStyleDeclaration3 extends IDispatch {
    /**
     * The interface identifier for IHTMLCSSStyleDeclaration3
     * @type {Guid}
     */
    static IID := Guid("{3051085c-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCSSStyleDeclaration3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_flex                    : IntPtr
        get_flex                    : IntPtr
        put_flexDirection           : IntPtr
        get_flexDirection           : IntPtr
        put_flexWrap                : IntPtr
        get_flexWrap                : IntPtr
        put_flexFlow                : IntPtr
        get_flexFlow                : IntPtr
        put_flexGrow                : IntPtr
        get_flexGrow                : IntPtr
        put_flexShrink              : IntPtr
        get_flexShrink              : IntPtr
        put_flexBasis               : IntPtr
        get_flexBasis               : IntPtr
        put_justifyContent          : IntPtr
        get_justifyContent          : IntPtr
        put_alignItems              : IntPtr
        get_alignItems              : IntPtr
        put_alignSelf               : IntPtr
        get_alignSelf               : IntPtr
        put_alignContent            : IntPtr
        get_alignContent            : IntPtr
        put_borderImage             : IntPtr
        get_borderImage             : IntPtr
        put_borderImageSource       : IntPtr
        get_borderImageSource       : IntPtr
        put_borderImageSlice        : IntPtr
        get_borderImageSlice        : IntPtr
        put_borderImageWidth        : IntPtr
        get_borderImageWidth        : IntPtr
        put_borderImageOutset       : IntPtr
        get_borderImageOutset       : IntPtr
        put_borderImageRepeat       : IntPtr
        get_borderImageRepeat       : IntPtr
        put_msImeAlign              : IntPtr
        get_msImeAlign              : IntPtr
        put_msTextCombineHorizontal : IntPtr
        get_msTextCombineHorizontal : IntPtr
        put_touchAction             : IntPtr
        get_touchAction             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCSSStyleDeclaration3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_flex() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_flexDirection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_flexDirection() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_flexWrap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_flexWrap() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_flexFlow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_flexFlow() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_flexGrow(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_flexGrow() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_flexShrink(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_flexShrink() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_flexBasis(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_flexBasis() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_justifyContent(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_justifyContent() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alignItems(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alignItems() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alignSelf(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alignSelf() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alignContent(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alignContent() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImage() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageSource(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageSource() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageSlice(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageSlice() {
        p := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageWidth(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageWidth() {
        p := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageOutset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(37, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageOutset() {
        p := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderImageRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(39, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderImageRepeat() {
        p := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msImeAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msImeAlign() {
        p := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTextCombineHorizontal(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTextCombineHorizontal() {
        p := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_touchAction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(45, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_touchAction() {
        p := BSTR.Owned()
        result := ComCall(46, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCSSStyleDeclaration3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_flex := CallbackCreate(GetMethod(implObj, "put_flex"), flags, 2)
        this.vtbl.get_flex := CallbackCreate(GetMethod(implObj, "get_flex"), flags, 2)
        this.vtbl.put_flexDirection := CallbackCreate(GetMethod(implObj, "put_flexDirection"), flags, 2)
        this.vtbl.get_flexDirection := CallbackCreate(GetMethod(implObj, "get_flexDirection"), flags, 2)
        this.vtbl.put_flexWrap := CallbackCreate(GetMethod(implObj, "put_flexWrap"), flags, 2)
        this.vtbl.get_flexWrap := CallbackCreate(GetMethod(implObj, "get_flexWrap"), flags, 2)
        this.vtbl.put_flexFlow := CallbackCreate(GetMethod(implObj, "put_flexFlow"), flags, 2)
        this.vtbl.get_flexFlow := CallbackCreate(GetMethod(implObj, "get_flexFlow"), flags, 2)
        this.vtbl.put_flexGrow := CallbackCreate(GetMethod(implObj, "put_flexGrow"), flags, 2)
        this.vtbl.get_flexGrow := CallbackCreate(GetMethod(implObj, "get_flexGrow"), flags, 2)
        this.vtbl.put_flexShrink := CallbackCreate(GetMethod(implObj, "put_flexShrink"), flags, 2)
        this.vtbl.get_flexShrink := CallbackCreate(GetMethod(implObj, "get_flexShrink"), flags, 2)
        this.vtbl.put_flexBasis := CallbackCreate(GetMethod(implObj, "put_flexBasis"), flags, 2)
        this.vtbl.get_flexBasis := CallbackCreate(GetMethod(implObj, "get_flexBasis"), flags, 2)
        this.vtbl.put_justifyContent := CallbackCreate(GetMethod(implObj, "put_justifyContent"), flags, 2)
        this.vtbl.get_justifyContent := CallbackCreate(GetMethod(implObj, "get_justifyContent"), flags, 2)
        this.vtbl.put_alignItems := CallbackCreate(GetMethod(implObj, "put_alignItems"), flags, 2)
        this.vtbl.get_alignItems := CallbackCreate(GetMethod(implObj, "get_alignItems"), flags, 2)
        this.vtbl.put_alignSelf := CallbackCreate(GetMethod(implObj, "put_alignSelf"), flags, 2)
        this.vtbl.get_alignSelf := CallbackCreate(GetMethod(implObj, "get_alignSelf"), flags, 2)
        this.vtbl.put_alignContent := CallbackCreate(GetMethod(implObj, "put_alignContent"), flags, 2)
        this.vtbl.get_alignContent := CallbackCreate(GetMethod(implObj, "get_alignContent"), flags, 2)
        this.vtbl.put_borderImage := CallbackCreate(GetMethod(implObj, "put_borderImage"), flags, 2)
        this.vtbl.get_borderImage := CallbackCreate(GetMethod(implObj, "get_borderImage"), flags, 2)
        this.vtbl.put_borderImageSource := CallbackCreate(GetMethod(implObj, "put_borderImageSource"), flags, 2)
        this.vtbl.get_borderImageSource := CallbackCreate(GetMethod(implObj, "get_borderImageSource"), flags, 2)
        this.vtbl.put_borderImageSlice := CallbackCreate(GetMethod(implObj, "put_borderImageSlice"), flags, 2)
        this.vtbl.get_borderImageSlice := CallbackCreate(GetMethod(implObj, "get_borderImageSlice"), flags, 2)
        this.vtbl.put_borderImageWidth := CallbackCreate(GetMethod(implObj, "put_borderImageWidth"), flags, 2)
        this.vtbl.get_borderImageWidth := CallbackCreate(GetMethod(implObj, "get_borderImageWidth"), flags, 2)
        this.vtbl.put_borderImageOutset := CallbackCreate(GetMethod(implObj, "put_borderImageOutset"), flags, 2)
        this.vtbl.get_borderImageOutset := CallbackCreate(GetMethod(implObj, "get_borderImageOutset"), flags, 2)
        this.vtbl.put_borderImageRepeat := CallbackCreate(GetMethod(implObj, "put_borderImageRepeat"), flags, 2)
        this.vtbl.get_borderImageRepeat := CallbackCreate(GetMethod(implObj, "get_borderImageRepeat"), flags, 2)
        this.vtbl.put_msImeAlign := CallbackCreate(GetMethod(implObj, "put_msImeAlign"), flags, 2)
        this.vtbl.get_msImeAlign := CallbackCreate(GetMethod(implObj, "get_msImeAlign"), flags, 2)
        this.vtbl.put_msTextCombineHorizontal := CallbackCreate(GetMethod(implObj, "put_msTextCombineHorizontal"), flags, 2)
        this.vtbl.get_msTextCombineHorizontal := CallbackCreate(GetMethod(implObj, "get_msTextCombineHorizontal"), flags, 2)
        this.vtbl.put_touchAction := CallbackCreate(GetMethod(implObj, "put_touchAction"), flags, 2)
        this.vtbl.get_touchAction := CallbackCreate(GetMethod(implObj, "get_touchAction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_flex)
        CallbackFree(this.vtbl.get_flex)
        CallbackFree(this.vtbl.put_flexDirection)
        CallbackFree(this.vtbl.get_flexDirection)
        CallbackFree(this.vtbl.put_flexWrap)
        CallbackFree(this.vtbl.get_flexWrap)
        CallbackFree(this.vtbl.put_flexFlow)
        CallbackFree(this.vtbl.get_flexFlow)
        CallbackFree(this.vtbl.put_flexGrow)
        CallbackFree(this.vtbl.get_flexGrow)
        CallbackFree(this.vtbl.put_flexShrink)
        CallbackFree(this.vtbl.get_flexShrink)
        CallbackFree(this.vtbl.put_flexBasis)
        CallbackFree(this.vtbl.get_flexBasis)
        CallbackFree(this.vtbl.put_justifyContent)
        CallbackFree(this.vtbl.get_justifyContent)
        CallbackFree(this.vtbl.put_alignItems)
        CallbackFree(this.vtbl.get_alignItems)
        CallbackFree(this.vtbl.put_alignSelf)
        CallbackFree(this.vtbl.get_alignSelf)
        CallbackFree(this.vtbl.put_alignContent)
        CallbackFree(this.vtbl.get_alignContent)
        CallbackFree(this.vtbl.put_borderImage)
        CallbackFree(this.vtbl.get_borderImage)
        CallbackFree(this.vtbl.put_borderImageSource)
        CallbackFree(this.vtbl.get_borderImageSource)
        CallbackFree(this.vtbl.put_borderImageSlice)
        CallbackFree(this.vtbl.get_borderImageSlice)
        CallbackFree(this.vtbl.put_borderImageWidth)
        CallbackFree(this.vtbl.get_borderImageWidth)
        CallbackFree(this.vtbl.put_borderImageOutset)
        CallbackFree(this.vtbl.get_borderImageOutset)
        CallbackFree(this.vtbl.put_borderImageRepeat)
        CallbackFree(this.vtbl.get_borderImageRepeat)
        CallbackFree(this.vtbl.put_msImeAlign)
        CallbackFree(this.vtbl.get_msImeAlign)
        CallbackFree(this.vtbl.put_msTextCombineHorizontal)
        CallbackFree(this.vtbl.get_msTextCombineHorizontal)
        CallbackFree(this.vtbl.put_touchAction)
        CallbackFree(this.vtbl.get_touchAction)
    }
}
