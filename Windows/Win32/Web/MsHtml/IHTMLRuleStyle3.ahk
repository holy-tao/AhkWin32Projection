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
export default struct IHTMLRuleStyle3 extends IDispatch {
    /**
     * The interface identifier for IHTMLRuleStyle3
     * @type {Guid}
     */
    static IID := Guid("{3050f657-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLRuleStyle3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_layoutFlow               : IntPtr
        get_layoutFlow               : IntPtr
        put_zoom                     : IntPtr
        get_zoom                     : IntPtr
        put_wordWrap                 : IntPtr
        get_wordWrap                 : IntPtr
        put_textUnderlinePosition    : IntPtr
        get_textUnderlinePosition    : IntPtr
        put_scrollbarBaseColor       : IntPtr
        get_scrollbarBaseColor       : IntPtr
        put_scrollbarFaceColor       : IntPtr
        get_scrollbarFaceColor       : IntPtr
        put_scrollbar3dLightColor    : IntPtr
        get_scrollbar3dLightColor    : IntPtr
        put_scrollbarShadowColor     : IntPtr
        get_scrollbarShadowColor     : IntPtr
        put_scrollbarHighlightColor  : IntPtr
        get_scrollbarHighlightColor  : IntPtr
        put_scrollbarDarkShadowColor : IntPtr
        get_scrollbarDarkShadowColor : IntPtr
        put_scrollbarArrowColor      : IntPtr
        get_scrollbarArrowColor      : IntPtr
        put_scrollbarTrackColor      : IntPtr
        get_scrollbarTrackColor      : IntPtr
        put_writingMode              : IntPtr
        get_writingMode              : IntPtr
        put_textAlignLast            : IntPtr
        get_textAlignLast            : IntPtr
        put_textKashidaSpace         : IntPtr
        get_textKashidaSpace         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLRuleStyle3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    layoutFlow {
        get => this.get_layoutFlow()
        set => this.put_layoutFlow(value)
    }

    /**
     * @type {VARIANT} 
     */
    zoom {
        get => this.get_zoom()
        set => this.put_zoom(value)
    }

    /**
     * @type {BSTR} 
     */
    wordWrap {
        get => this.get_wordWrap()
        set => this.put_wordWrap(value)
    }

    /**
     * @type {BSTR} 
     */
    textUnderlinePosition {
        get => this.get_textUnderlinePosition()
        set => this.put_textUnderlinePosition(value)
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarBaseColor {
        get => this.get_scrollbarBaseColor()
        set => this.put_scrollbarBaseColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarFaceColor {
        get => this.get_scrollbarFaceColor()
        set => this.put_scrollbarFaceColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    scrollbar3dLightColor {
        get => this.get_scrollbar3dLightColor()
        set => this.put_scrollbar3dLightColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarShadowColor {
        get => this.get_scrollbarShadowColor()
        set => this.put_scrollbarShadowColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarHighlightColor {
        get => this.get_scrollbarHighlightColor()
        set => this.put_scrollbarHighlightColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarDarkShadowColor {
        get => this.get_scrollbarDarkShadowColor()
        set => this.put_scrollbarDarkShadowColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarArrowColor {
        get => this.get_scrollbarArrowColor()
        set => this.put_scrollbarArrowColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarTrackColor {
        get => this.get_scrollbarTrackColor()
        set => this.put_scrollbarTrackColor(value)
    }

    /**
     * @type {BSTR} 
     */
    writingMode {
        get => this.get_writingMode()
        set => this.put_writingMode(value)
    }

    /**
     * @type {BSTR} 
     */
    textAlignLast {
        get => this.get_textAlignLast()
        set => this.put_textAlignLast(value)
    }

    /**
     * @type {VARIANT} 
     */
    textKashidaSpace {
        get => this.get_textKashidaSpace()
        set => this.put_textKashidaSpace(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutFlow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutFlow() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_zoom(v) {
        result := ComCall(9, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_zoom() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_wordWrap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wordWrap() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textUnderlinePosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textUnderlinePosition() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarBaseColor(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarBaseColor() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarFaceColor(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarFaceColor() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbar3dLightColor(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbar3dLightColor() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarShadowColor(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarShadowColor() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarHighlightColor(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarHighlightColor() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarDarkShadowColor(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarDarkShadowColor() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarArrowColor(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarArrowColor() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarTrackColor(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarTrackColor() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_writingMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_writingMode() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlignLast(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlignLast() {
        p := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textKashidaSpace(v) {
        result := ComCall(35, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textKashidaSpace() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLRuleStyle3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_layoutFlow := CallbackCreate(GetMethod(implObj, "put_layoutFlow"), flags, 2)
        this.vtbl.get_layoutFlow := CallbackCreate(GetMethod(implObj, "get_layoutFlow"), flags, 2)
        this.vtbl.put_zoom := CallbackCreate(GetMethod(implObj, "put_zoom"), flags, 2)
        this.vtbl.get_zoom := CallbackCreate(GetMethod(implObj, "get_zoom"), flags, 2)
        this.vtbl.put_wordWrap := CallbackCreate(GetMethod(implObj, "put_wordWrap"), flags, 2)
        this.vtbl.get_wordWrap := CallbackCreate(GetMethod(implObj, "get_wordWrap"), flags, 2)
        this.vtbl.put_textUnderlinePosition := CallbackCreate(GetMethod(implObj, "put_textUnderlinePosition"), flags, 2)
        this.vtbl.get_textUnderlinePosition := CallbackCreate(GetMethod(implObj, "get_textUnderlinePosition"), flags, 2)
        this.vtbl.put_scrollbarBaseColor := CallbackCreate(GetMethod(implObj, "put_scrollbarBaseColor"), flags, 2)
        this.vtbl.get_scrollbarBaseColor := CallbackCreate(GetMethod(implObj, "get_scrollbarBaseColor"), flags, 2)
        this.vtbl.put_scrollbarFaceColor := CallbackCreate(GetMethod(implObj, "put_scrollbarFaceColor"), flags, 2)
        this.vtbl.get_scrollbarFaceColor := CallbackCreate(GetMethod(implObj, "get_scrollbarFaceColor"), flags, 2)
        this.vtbl.put_scrollbar3dLightColor := CallbackCreate(GetMethod(implObj, "put_scrollbar3dLightColor"), flags, 2)
        this.vtbl.get_scrollbar3dLightColor := CallbackCreate(GetMethod(implObj, "get_scrollbar3dLightColor"), flags, 2)
        this.vtbl.put_scrollbarShadowColor := CallbackCreate(GetMethod(implObj, "put_scrollbarShadowColor"), flags, 2)
        this.vtbl.get_scrollbarShadowColor := CallbackCreate(GetMethod(implObj, "get_scrollbarShadowColor"), flags, 2)
        this.vtbl.put_scrollbarHighlightColor := CallbackCreate(GetMethod(implObj, "put_scrollbarHighlightColor"), flags, 2)
        this.vtbl.get_scrollbarHighlightColor := CallbackCreate(GetMethod(implObj, "get_scrollbarHighlightColor"), flags, 2)
        this.vtbl.put_scrollbarDarkShadowColor := CallbackCreate(GetMethod(implObj, "put_scrollbarDarkShadowColor"), flags, 2)
        this.vtbl.get_scrollbarDarkShadowColor := CallbackCreate(GetMethod(implObj, "get_scrollbarDarkShadowColor"), flags, 2)
        this.vtbl.put_scrollbarArrowColor := CallbackCreate(GetMethod(implObj, "put_scrollbarArrowColor"), flags, 2)
        this.vtbl.get_scrollbarArrowColor := CallbackCreate(GetMethod(implObj, "get_scrollbarArrowColor"), flags, 2)
        this.vtbl.put_scrollbarTrackColor := CallbackCreate(GetMethod(implObj, "put_scrollbarTrackColor"), flags, 2)
        this.vtbl.get_scrollbarTrackColor := CallbackCreate(GetMethod(implObj, "get_scrollbarTrackColor"), flags, 2)
        this.vtbl.put_writingMode := CallbackCreate(GetMethod(implObj, "put_writingMode"), flags, 2)
        this.vtbl.get_writingMode := CallbackCreate(GetMethod(implObj, "get_writingMode"), flags, 2)
        this.vtbl.put_textAlignLast := CallbackCreate(GetMethod(implObj, "put_textAlignLast"), flags, 2)
        this.vtbl.get_textAlignLast := CallbackCreate(GetMethod(implObj, "get_textAlignLast"), flags, 2)
        this.vtbl.put_textKashidaSpace := CallbackCreate(GetMethod(implObj, "put_textKashidaSpace"), flags, 2)
        this.vtbl.get_textKashidaSpace := CallbackCreate(GetMethod(implObj, "get_textKashidaSpace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_layoutFlow)
        CallbackFree(this.vtbl.get_layoutFlow)
        CallbackFree(this.vtbl.put_zoom)
        CallbackFree(this.vtbl.get_zoom)
        CallbackFree(this.vtbl.put_wordWrap)
        CallbackFree(this.vtbl.get_wordWrap)
        CallbackFree(this.vtbl.put_textUnderlinePosition)
        CallbackFree(this.vtbl.get_textUnderlinePosition)
        CallbackFree(this.vtbl.put_scrollbarBaseColor)
        CallbackFree(this.vtbl.get_scrollbarBaseColor)
        CallbackFree(this.vtbl.put_scrollbarFaceColor)
        CallbackFree(this.vtbl.get_scrollbarFaceColor)
        CallbackFree(this.vtbl.put_scrollbar3dLightColor)
        CallbackFree(this.vtbl.get_scrollbar3dLightColor)
        CallbackFree(this.vtbl.put_scrollbarShadowColor)
        CallbackFree(this.vtbl.get_scrollbarShadowColor)
        CallbackFree(this.vtbl.put_scrollbarHighlightColor)
        CallbackFree(this.vtbl.get_scrollbarHighlightColor)
        CallbackFree(this.vtbl.put_scrollbarDarkShadowColor)
        CallbackFree(this.vtbl.get_scrollbarDarkShadowColor)
        CallbackFree(this.vtbl.put_scrollbarArrowColor)
        CallbackFree(this.vtbl.get_scrollbarArrowColor)
        CallbackFree(this.vtbl.put_scrollbarTrackColor)
        CallbackFree(this.vtbl.get_scrollbarTrackColor)
        CallbackFree(this.vtbl.put_writingMode)
        CallbackFree(this.vtbl.get_writingMode)
        CallbackFree(this.vtbl.put_textAlignLast)
        CallbackFree(this.vtbl.get_textAlignLast)
        CallbackFree(this.vtbl.put_textKashidaSpace)
        CallbackFree(this.vtbl.get_textKashidaSpace)
    }
}
