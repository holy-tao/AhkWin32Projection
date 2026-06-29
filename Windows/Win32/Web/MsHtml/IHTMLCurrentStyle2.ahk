#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCurrentStyle2 extends IDispatch {
    /**
     * The interface identifier for IHTMLCurrentStyle2
     * @type {Guid}
     */
    static IID := Guid("{3050f658-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCurrentStyle2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_layoutFlow               : IntPtr
        get_wordWrap                 : IntPtr
        get_textUnderlinePosition    : IntPtr
        get_hasLayout                : IntPtr
        get_scrollbarBaseColor       : IntPtr
        get_scrollbarFaceColor       : IntPtr
        get_scrollbar3dLightColor    : IntPtr
        get_scrollbarShadowColor     : IntPtr
        get_scrollbarHighlightColor  : IntPtr
        get_scrollbarDarkShadowColor : IntPtr
        get_scrollbarArrowColor      : IntPtr
        get_scrollbarTrackColor      : IntPtr
        get_writingMode              : IntPtr
        get_zoom                     : IntPtr
        get_filter                   : IntPtr
        get_textAlignLast            : IntPtr
        get_textKashidaSpace         : IntPtr
        get_isBlock                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCurrentStyle2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    layoutFlow {
        get => this.get_layoutFlow()
    }

    /**
     * @type {BSTR} 
     */
    wordWrap {
        get => this.get_wordWrap()
    }

    /**
     * @type {BSTR} 
     */
    textUnderlinePosition {
        get => this.get_textUnderlinePosition()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    hasLayout {
        get => this.get_hasLayout()
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarBaseColor {
        get => this.get_scrollbarBaseColor()
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarFaceColor {
        get => this.get_scrollbarFaceColor()
    }

    /**
     * @type {VARIANT} 
     */
    scrollbar3dLightColor {
        get => this.get_scrollbar3dLightColor()
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarShadowColor {
        get => this.get_scrollbarShadowColor()
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarHighlightColor {
        get => this.get_scrollbarHighlightColor()
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarDarkShadowColor {
        get => this.get_scrollbarDarkShadowColor()
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarArrowColor {
        get => this.get_scrollbarArrowColor()
    }

    /**
     * @type {VARIANT} 
     */
    scrollbarTrackColor {
        get => this.get_scrollbarTrackColor()
    }

    /**
     * @type {BSTR} 
     */
    writingMode {
        get => this.get_writingMode()
    }

    /**
     * @type {VARIANT} 
     */
    zoom {
        get => this.get_zoom()
    }

    /**
     * @type {BSTR} 
     */
    filter {
        get => this.get_filter()
    }

    /**
     * @type {BSTR} 
     */
    textAlignLast {
        get => this.get_textAlignLast()
    }

    /**
     * @type {VARIANT} 
     */
    textKashidaSpace {
        get => this.get_textKashidaSpace()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isBlock {
        get => this.get_isBlock()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutFlow() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wordWrap() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textUnderlinePosition() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_hasLayout() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarBaseColor() {
        p := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarFaceColor() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbar3dLightColor() {
        p := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarShadowColor() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarHighlightColor() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarDarkShadowColor() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarArrowColor() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarTrackColor() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_writingMode() {
        p := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_zoom() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_filter() {
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlignLast() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textKashidaSpace() {
        p := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isBlock() {
        result := ComCall(24, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCurrentStyle2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_layoutFlow := CallbackCreate(GetMethod(implObj, "get_layoutFlow"), flags, 2)
        this.vtbl.get_wordWrap := CallbackCreate(GetMethod(implObj, "get_wordWrap"), flags, 2)
        this.vtbl.get_textUnderlinePosition := CallbackCreate(GetMethod(implObj, "get_textUnderlinePosition"), flags, 2)
        this.vtbl.get_hasLayout := CallbackCreate(GetMethod(implObj, "get_hasLayout"), flags, 2)
        this.vtbl.get_scrollbarBaseColor := CallbackCreate(GetMethod(implObj, "get_scrollbarBaseColor"), flags, 2)
        this.vtbl.get_scrollbarFaceColor := CallbackCreate(GetMethod(implObj, "get_scrollbarFaceColor"), flags, 2)
        this.vtbl.get_scrollbar3dLightColor := CallbackCreate(GetMethod(implObj, "get_scrollbar3dLightColor"), flags, 2)
        this.vtbl.get_scrollbarShadowColor := CallbackCreate(GetMethod(implObj, "get_scrollbarShadowColor"), flags, 2)
        this.vtbl.get_scrollbarHighlightColor := CallbackCreate(GetMethod(implObj, "get_scrollbarHighlightColor"), flags, 2)
        this.vtbl.get_scrollbarDarkShadowColor := CallbackCreate(GetMethod(implObj, "get_scrollbarDarkShadowColor"), flags, 2)
        this.vtbl.get_scrollbarArrowColor := CallbackCreate(GetMethod(implObj, "get_scrollbarArrowColor"), flags, 2)
        this.vtbl.get_scrollbarTrackColor := CallbackCreate(GetMethod(implObj, "get_scrollbarTrackColor"), flags, 2)
        this.vtbl.get_writingMode := CallbackCreate(GetMethod(implObj, "get_writingMode"), flags, 2)
        this.vtbl.get_zoom := CallbackCreate(GetMethod(implObj, "get_zoom"), flags, 2)
        this.vtbl.get_filter := CallbackCreate(GetMethod(implObj, "get_filter"), flags, 2)
        this.vtbl.get_textAlignLast := CallbackCreate(GetMethod(implObj, "get_textAlignLast"), flags, 2)
        this.vtbl.get_textKashidaSpace := CallbackCreate(GetMethod(implObj, "get_textKashidaSpace"), flags, 2)
        this.vtbl.get_isBlock := CallbackCreate(GetMethod(implObj, "get_isBlock"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_layoutFlow)
        CallbackFree(this.vtbl.get_wordWrap)
        CallbackFree(this.vtbl.get_textUnderlinePosition)
        CallbackFree(this.vtbl.get_hasLayout)
        CallbackFree(this.vtbl.get_scrollbarBaseColor)
        CallbackFree(this.vtbl.get_scrollbarFaceColor)
        CallbackFree(this.vtbl.get_scrollbar3dLightColor)
        CallbackFree(this.vtbl.get_scrollbarShadowColor)
        CallbackFree(this.vtbl.get_scrollbarHighlightColor)
        CallbackFree(this.vtbl.get_scrollbarDarkShadowColor)
        CallbackFree(this.vtbl.get_scrollbarArrowColor)
        CallbackFree(this.vtbl.get_scrollbarTrackColor)
        CallbackFree(this.vtbl.get_writingMode)
        CallbackFree(this.vtbl.get_zoom)
        CallbackFree(this.vtbl.get_filter)
        CallbackFree(this.vtbl.get_textAlignLast)
        CallbackFree(this.vtbl.get_textKashidaSpace)
        CallbackFree(this.vtbl.get_isBlock)
    }
}
