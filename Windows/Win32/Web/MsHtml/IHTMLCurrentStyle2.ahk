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
class IHTMLCurrentStyle2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCurrentStyle2
     * @type {Guid}
     */
    static IID => Guid("{3050f658-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_layoutFlow", "get_wordWrap", "get_textUnderlinePosition", "get_hasLayout", "get_scrollbarBaseColor", "get_scrollbarFaceColor", "get_scrollbar3dLightColor", "get_scrollbarShadowColor", "get_scrollbarHighlightColor", "get_scrollbarDarkShadowColor", "get_scrollbarArrowColor", "get_scrollbarTrackColor", "get_writingMode", "get_zoom", "get_filter", "get_textAlignLast", "get_textKashidaSpace", "get_isBlock"]

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
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wordWrap() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textUnderlinePosition() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_hasLayout() {
        result := ComCall(10, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarBaseColor() {
        p := VARIANT()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarFaceColor() {
        p := VARIANT()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbar3dLightColor() {
        p := VARIANT()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarShadowColor() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarHighlightColor() {
        p := VARIANT()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarDarkShadowColor() {
        p := VARIANT()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarArrowColor() {
        p := VARIANT()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarTrackColor() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_writingMode() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_zoom() {
        p := VARIANT()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_filter() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlignLast() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textKashidaSpace() {
        p := VARIANT()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isBlock() {
        result := ComCall(24, this, "short*", &p := 0, "HRESULT")
        return p
    }
}
