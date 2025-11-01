#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCSSStyleDeclaration extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCSSStyleDeclaration
     * @type {Guid}
     */
    static IID => Guid("{30510740-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSStyleDeclaration
     * @type {Guid}
     */
    static CLSID => Guid("{30510741-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "get_parentRule", "getPropertyValue", "getPropertyPriority", "removeProperty", "setProperty", "item", "put_fontFamily", "get_fontFamily", "put_fontStyle", "get_fontStyle", "put_fontVariant", "get_fontVariant", "put_fontWeight", "get_fontWeight", "put_fontSize", "get_fontSize", "put_font", "get_font", "put_color", "get_color", "put_background", "get_background", "put_backgroundColor", "get_backgroundColor", "put_backgroundImage", "get_backgroundImage", "put_backgroundRepeat", "get_backgroundRepeat", "put_backgroundAttachment", "get_backgroundAttachment", "put_backgroundPosition", "get_backgroundPosition", "put_backgroundPositionX", "get_backgroundPositionX", "put_backgroundPositionY", "get_backgroundPositionY", "put_wordSpacing", "get_wordSpacing", "put_letterSpacing", "get_letterSpacing", "put_textDecoration", "get_textDecoration", "put_verticalAlign", "get_verticalAlign", "put_textTransform", "get_textTransform", "put_textAlign", "get_textAlign", "put_textIndent", "get_textIndent", "put_lineHeight", "get_lineHeight", "put_marginTop", "get_marginTop", "put_marginRight", "get_marginRight", "put_marginBottom", "get_marginBottom", "put_marginLeft", "get_marginLeft", "put_margin", "get_margin", "put_paddingTop", "get_paddingTop", "put_paddingRight", "get_paddingRight", "put_paddingBottom", "get_paddingBottom", "put_paddingLeft", "get_paddingLeft", "put_padding", "get_padding", "put_border", "get_border", "put_borderTop", "get_borderTop", "put_borderRight", "get_borderRight", "put_borderBottom", "get_borderBottom", "put_borderLeft", "get_borderLeft", "put_borderColor", "get_borderColor", "put_borderTopColor", "get_borderTopColor", "put_borderRightColor", "get_borderRightColor", "put_borderBottomColor", "get_borderBottomColor", "put_borderLeftColor", "get_borderLeftColor", "put_borderWidth", "get_borderWidth", "put_borderTopWidth", "get_borderTopWidth", "put_borderRightWidth", "get_borderRightWidth", "put_borderBottomWidth", "get_borderBottomWidth", "put_borderLeftWidth", "get_borderLeftWidth", "put_borderStyle", "get_borderStyle", "put_borderTopStyle", "get_borderTopStyle", "put_borderRightStyle", "get_borderRightStyle", "put_borderBottomStyle", "get_borderBottomStyle", "put_borderLeftStyle", "get_borderLeftStyle", "put_width", "get_width", "put_height", "get_height", "put_styleFloat", "get_styleFloat", "put_clear", "get_clear", "put_display", "get_display", "put_visibility", "get_visibility", "put_listStyleType", "get_listStyleType", "put_listStylePosition", "get_listStylePosition", "put_listStyleImage", "get_listStyleImage", "put_listStyle", "get_listStyle", "put_whiteSpace", "get_whiteSpace", "put_top", "get_top", "put_left", "get_left", "put_zIndex", "get_zIndex", "put_overflow", "get_overflow", "put_pageBreakBefore", "get_pageBreakBefore", "put_pageBreakAfter", "get_pageBreakAfter", "put_cssText", "get_cssText", "put_cursor", "get_cursor", "put_clip", "get_clip", "put_filter", "get_filter", "put_tableLayout", "get_tableLayout", "put_borderCollapse", "get_borderCollapse", "put_direction", "get_direction", "put_behavior", "get_behavior", "put_position", "get_position", "put_unicodeBidi", "get_unicodeBidi", "put_bottom", "get_bottom", "put_right", "get_right", "put_imeMode", "get_imeMode", "put_rubyAlign", "get_rubyAlign", "put_rubyPosition", "get_rubyPosition", "put_rubyOverhang", "get_rubyOverhang", "put_layoutGridChar", "get_layoutGridChar", "put_layoutGridLine", "get_layoutGridLine", "put_layoutGridMode", "get_layoutGridMode", "put_layoutGridType", "get_layoutGridType", "put_layoutGrid", "get_layoutGrid", "put_textAutospace", "get_textAutospace", "put_wordBreak", "get_wordBreak", "put_lineBreak", "get_lineBreak", "put_textJustify", "get_textJustify", "put_textJustifyTrim", "get_textJustifyTrim", "put_textKashida", "get_textKashida", "put_overflowX", "get_overflowX", "put_overflowY", "get_overflowY", "put_accelerator", "get_accelerator", "put_layoutFlow", "get_layoutFlow", "put_zoom", "get_zoom", "put_wordWrap", "get_wordWrap", "put_textUnderlinePosition", "get_textUnderlinePosition", "put_scrollbarBaseColor", "get_scrollbarBaseColor", "put_scrollbarFaceColor", "get_scrollbarFaceColor", "put_scrollbar3dLightColor", "get_scrollbar3dLightColor", "put_scrollbarShadowColor", "get_scrollbarShadowColor", "put_scrollbarHighlightColor", "get_scrollbarHighlightColor", "put_scrollbarDarkShadowColor", "get_scrollbarDarkShadowColor", "put_scrollbarArrowColor", "get_scrollbarArrowColor", "put_scrollbarTrackColor", "get_scrollbarTrackColor", "put_writingMode", "get_writingMode", "put_textAlignLast", "get_textAlignLast", "put_textKashidaSpace", "get_textKashidaSpace", "put_textOverflow", "get_textOverflow", "put_minHeight", "get_minHeight", "put_msInterpolationMode", "get_msInterpolationMode", "put_maxHeight", "get_maxHeight", "put_minWidth", "get_minWidth", "put_maxWidth", "get_maxWidth", "put_content", "get_content", "put_captionSide", "get_captionSide", "put_counterIncrement", "get_counterIncrement", "put_counterReset", "get_counterReset", "put_outline", "get_outline", "put_outlineWidth", "get_outlineWidth", "put_outlineStyle", "get_outlineStyle", "put_outlineColor", "get_outlineColor", "put_boxSizing", "get_boxSizing", "put_borderSpacing", "get_borderSpacing", "put_orphans", "get_orphans", "put_widows", "get_widows", "put_pageBreakInside", "get_pageBreakInside", "put_emptyCells", "get_emptyCells", "put_msBlockProgression", "get_msBlockProgression", "put_quotes", "get_quotes", "put_alignmentBaseline", "get_alignmentBaseline", "put_baselineShift", "get_baselineShift", "put_dominantBaseline", "get_dominantBaseline", "put_fontSizeAdjust", "get_fontSizeAdjust", "put_fontStretch", "get_fontStretch", "put_opacity", "get_opacity", "put_clipPath", "get_clipPath", "put_clipRule", "get_clipRule", "put_fill", "get_fill", "put_fillOpacity", "get_fillOpacity", "put_fillRule", "get_fillRule", "put_kerning", "get_kerning", "put_marker", "get_marker", "put_markerEnd", "get_markerEnd", "put_markerMid", "get_markerMid", "put_markerStart", "get_markerStart", "put_mask", "get_mask", "put_pointerEvents", "get_pointerEvents", "put_stopColor", "get_stopColor", "put_stopOpacity", "get_stopOpacity", "put_stroke", "get_stroke", "put_strokeDasharray", "get_strokeDasharray", "put_strokeDashoffset", "get_strokeDashoffset", "put_strokeLinecap", "get_strokeLinecap", "put_strokeLinejoin", "get_strokeLinejoin", "put_strokeMiterlimit", "get_strokeMiterlimit", "put_strokeOpacity", "get_strokeOpacity", "put_strokeWidth", "get_strokeWidth", "put_textAnchor", "get_textAnchor", "put_glyphOrientationHorizontal", "get_glyphOrientationHorizontal", "put_glyphOrientationVertical", "get_glyphOrientationVertical", "put_borderRadius", "get_borderRadius", "put_borderTopLeftRadius", "get_borderTopLeftRadius", "put_borderTopRightRadius", "get_borderTopRightRadius", "put_borderBottomRightRadius", "get_borderBottomRightRadius", "put_borderBottomLeftRadius", "get_borderBottomLeftRadius", "put_clipTop", "get_clipTop", "put_clipRight", "get_clipRight", "get_clipBottom", "put_clipLeft", "get_clipLeft", "put_cssFloat", "get_cssFloat", "put_backgroundClip", "get_backgroundClip", "put_backgroundOrigin", "get_backgroundOrigin", "put_backgroundSize", "get_backgroundSize", "put_boxShadow", "get_boxShadow", "put_msTransform", "get_msTransform", "put_msTransformOrigin", "get_msTransformOrigin"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_parentRule(p) {
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<BSTR>} pbstrPropertyValue 
     * @returns {HRESULT} 
     */
    getPropertyValue(bstrPropertyName, pbstrPropertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(9, this, "ptr", bstrPropertyName, "ptr", pbstrPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<BSTR>} pbstrPropertyPriority 
     * @returns {HRESULT} 
     */
    getPropertyPriority(bstrPropertyName, pbstrPropertyPriority) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(10, this, "ptr", bstrPropertyName, "ptr", pbstrPropertyPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<BSTR>} pbstrPropertyValue 
     * @returns {HRESULT} 
     */
    removeProperty(bstrPropertyName, pbstrPropertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(11, this, "ptr", bstrPropertyName, "ptr", pbstrPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @param {Pointer<VARIANT>} pvarPropertyPriority 
     * @returns {HRESULT} 
     */
    setProperty(bstrPropertyName, pvarPropertyValue, pvarPropertyPriority) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(12, this, "ptr", bstrPropertyName, "ptr", pvarPropertyValue, "ptr", pvarPropertyPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pbstrPropertyName 
     * @returns {HRESULT} 
     */
    item(index, pbstrPropertyName) {
        result := ComCall(13, this, "int", index, "ptr", pbstrPropertyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontFamily(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(14, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fontFamily(p) {
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fontStyle(p) {
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontVariant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fontVariant(p) {
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontWeight(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fontWeight(p) {
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fontSize(v) {
        result := ComCall(22, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_fontSize(p) {
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_font(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_font(p) {
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_color(v) {
        result := ComCall(26, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_color(p) {
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_background(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(28, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_background(p) {
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundColor(v) {
        result := ComCall(30, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_backgroundColor(p) {
        result := ComCall(31, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(32, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_backgroundImage(p) {
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(34, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_backgroundRepeat(p) {
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundAttachment(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(36, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_backgroundAttachment(p) {
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(38, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_backgroundPosition(p) {
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundPositionX(v) {
        result := ComCall(40, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_backgroundPositionX(p) {
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundPositionY(v) {
        result := ComCall(42, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_backgroundPositionY(p) {
        result := ComCall(43, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_wordSpacing(v) {
        result := ComCall(44, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_wordSpacing(p) {
        result := ComCall(45, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_letterSpacing(v) {
        result := ComCall(46, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_letterSpacing(p) {
        result := ComCall(47, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textDecoration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(48, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textDecoration(p) {
        result := ComCall(49, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_verticalAlign(v) {
        result := ComCall(50, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_verticalAlign(p) {
        result := ComCall(51, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textTransform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(52, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textTransform(p) {
        result := ComCall(53, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(54, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textAlign(p) {
        result := ComCall(55, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textIndent(v) {
        result := ComCall(56, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_textIndent(p) {
        result := ComCall(57, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_lineHeight(v) {
        result := ComCall(58, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_lineHeight(p) {
        result := ComCall(59, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginTop(v) {
        result := ComCall(60, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_marginTop(p) {
        result := ComCall(61, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginRight(v) {
        result := ComCall(62, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_marginRight(p) {
        result := ComCall(63, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginBottom(v) {
        result := ComCall(64, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_marginBottom(p) {
        result := ComCall(65, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginLeft(v) {
        result := ComCall(66, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_marginLeft(p) {
        result := ComCall(67, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_margin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(68, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_margin(p) {
        result := ComCall(69, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingTop(v) {
        result := ComCall(70, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_paddingTop(p) {
        result := ComCall(71, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingRight(v) {
        result := ComCall(72, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_paddingRight(p) {
        result := ComCall(73, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingBottom(v) {
        result := ComCall(74, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_paddingBottom(p) {
        result := ComCall(75, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingLeft(v) {
        result := ComCall(76, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_paddingLeft(p) {
        result := ComCall(77, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_padding(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(78, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_padding(p) {
        result := ComCall(79, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(80, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_border(p) {
        result := ComCall(81, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTop(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(82, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderTop(p) {
        result := ComCall(83, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRight(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(84, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderRight(p) {
        result := ComCall(85, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottom(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(86, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderBottom(p) {
        result := ComCall(87, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderLeft(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(88, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderLeft(p) {
        result := ComCall(89, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(90, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderColor(p) {
        result := ComCall(91, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderTopColor(v) {
        result := ComCall(92, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderTopColor(p) {
        result := ComCall(93, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderRightColor(v) {
        result := ComCall(94, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderRightColor(p) {
        result := ComCall(95, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderBottomColor(v) {
        result := ComCall(96, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderBottomColor(p) {
        result := ComCall(97, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderLeftColor(v) {
        result := ComCall(98, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderLeftColor(p) {
        result := ComCall(99, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderWidth(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(100, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderWidth(p) {
        result := ComCall(101, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderTopWidth(v) {
        result := ComCall(102, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderTopWidth(p) {
        result := ComCall(103, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderRightWidth(v) {
        result := ComCall(104, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderRightWidth(p) {
        result := ComCall(105, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderBottomWidth(v) {
        result := ComCall(106, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderBottomWidth(p) {
        result := ComCall(107, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderLeftWidth(v) {
        result := ComCall(108, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_borderLeftWidth(p) {
        result := ComCall(109, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(110, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderStyle(p) {
        result := ComCall(111, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTopStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(112, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderTopStyle(p) {
        result := ComCall(113, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRightStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(114, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderRightStyle(p) {
        result := ComCall(115, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottomStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(116, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderBottomStyle(p) {
        result := ComCall(117, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderLeftStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(118, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderLeftStyle(p) {
        result := ComCall(119, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(120, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_width(p) {
        result := ComCall(121, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(122, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_height(p) {
        result := ComCall(123, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_styleFloat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(124, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_styleFloat(p) {
        result := ComCall(125, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clear(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(126, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_clear(p) {
        result := ComCall(127, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_display(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(128, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_display(p) {
        result := ComCall(129, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_visibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(130, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_visibility(p) {
        result := ComCall(131, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyleType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(132, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_listStyleType(p) {
        result := ComCall(133, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStylePosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(134, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_listStylePosition(p) {
        result := ComCall(135, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyleImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(136, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_listStyleImage(p) {
        result := ComCall(137, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(138, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_listStyle(p) {
        result := ComCall(139, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_whiteSpace(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(140, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_whiteSpace(p) {
        result := ComCall(141, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_top(v) {
        result := ComCall(142, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_top(p) {
        result := ComCall(143, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_left(v) {
        result := ComCall(144, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_left(p) {
        result := ComCall(145, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_zIndex(v) {
        result := ComCall(146, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_zIndex(p) {
        result := ComCall(147, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(148, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_overflow(p) {
        result := ComCall(149, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakBefore(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(150, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_pageBreakBefore(p) {
        result := ComCall(151, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakAfter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(152, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_pageBreakAfter(p) {
        result := ComCall(153, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(154, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_cssText(p) {
        result := ComCall(155, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cursor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(156, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_cursor(p) {
        result := ComCall(157, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clip(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(158, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_clip(p) {
        result := ComCall(159, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_filter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(160, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_filter(p) {
        result := ComCall(161, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_tableLayout(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(162, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_tableLayout(p) {
        result := ComCall(163, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderCollapse(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(164, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderCollapse(p) {
        result := ComCall(165, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_direction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(166, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_direction(p) {
        result := ComCall(167, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_behavior(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(168, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_behavior(p) {
        result := ComCall(169, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_position(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(170, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_position(p) {
        result := ComCall(171, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_unicodeBidi(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(172, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_unicodeBidi(p) {
        result := ComCall(173, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bottom(v) {
        result := ComCall(174, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_bottom(p) {
        result := ComCall(175, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_right(v) {
        result := ComCall(176, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_right(p) {
        result := ComCall(177, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_imeMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(178, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_imeMode(p) {
        result := ComCall(179, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(180, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_rubyAlign(p) {
        result := ComCall(181, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(182, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_rubyPosition(p) {
        result := ComCall(183, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyOverhang(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(184, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_rubyOverhang(p) {
        result := ComCall(185, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_layoutGridChar(v) {
        result := ComCall(186, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_layoutGridChar(p) {
        result := ComCall(187, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_layoutGridLine(v) {
        result := ComCall(188, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_layoutGridLine(p) {
        result := ComCall(189, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGridMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(190, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_layoutGridMode(p) {
        result := ComCall(191, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGridType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(192, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_layoutGridType(p) {
        result := ComCall(193, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGrid(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(194, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_layoutGrid(p) {
        result := ComCall(195, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAutospace(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(196, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textAutospace(p) {
        result := ComCall(197, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_wordBreak(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(198, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_wordBreak(p) {
        result := ComCall(199, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineBreak(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(200, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_lineBreak(p) {
        result := ComCall(201, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textJustify(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(202, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textJustify(p) {
        result := ComCall(203, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textJustifyTrim(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(204, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textJustifyTrim(p) {
        result := ComCall(205, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textKashida(v) {
        result := ComCall(206, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_textKashida(p) {
        result := ComCall(207, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflowX(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(208, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_overflowX(p) {
        result := ComCall(209, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflowY(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(210, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_overflowY(p) {
        result := ComCall(211, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_accelerator(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(212, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_accelerator(p) {
        result := ComCall(213, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutFlow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(214, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_layoutFlow(p) {
        result := ComCall(215, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_zoom(v) {
        result := ComCall(216, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_zoom(p) {
        result := ComCall(217, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_wordWrap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(218, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_wordWrap(p) {
        result := ComCall(219, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textUnderlinePosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(220, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textUnderlinePosition(p) {
        result := ComCall(221, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarBaseColor(v) {
        result := ComCall(222, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_scrollbarBaseColor(p) {
        result := ComCall(223, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarFaceColor(v) {
        result := ComCall(224, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_scrollbarFaceColor(p) {
        result := ComCall(225, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbar3dLightColor(v) {
        result := ComCall(226, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_scrollbar3dLightColor(p) {
        result := ComCall(227, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarShadowColor(v) {
        result := ComCall(228, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_scrollbarShadowColor(p) {
        result := ComCall(229, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarHighlightColor(v) {
        result := ComCall(230, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_scrollbarHighlightColor(p) {
        result := ComCall(231, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarDarkShadowColor(v) {
        result := ComCall(232, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_scrollbarDarkShadowColor(p) {
        result := ComCall(233, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarArrowColor(v) {
        result := ComCall(234, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_scrollbarArrowColor(p) {
        result := ComCall(235, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarTrackColor(v) {
        result := ComCall(236, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_scrollbarTrackColor(p) {
        result := ComCall(237, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_writingMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(238, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_writingMode(p) {
        result := ComCall(239, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlignLast(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(240, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textAlignLast(p) {
        result := ComCall(241, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textKashidaSpace(v) {
        result := ComCall(242, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_textKashidaSpace(p) {
        result := ComCall(243, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textOverflow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(244, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textOverflow(p) {
        result := ComCall(245, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_minHeight(v) {
        result := ComCall(246, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_minHeight(p) {
        result := ComCall(247, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msInterpolationMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(248, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_msInterpolationMode(p) {
        result := ComCall(249, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_maxHeight(v) {
        result := ComCall(250, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_maxHeight(p) {
        result := ComCall(251, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_minWidth(v) {
        result := ComCall(252, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_minWidth(p) {
        result := ComCall(253, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_maxWidth(v) {
        result := ComCall(254, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_maxWidth(p) {
        result := ComCall(255, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_content(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(256, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_content(p) {
        result := ComCall(257, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_captionSide(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(258, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_captionSide(p) {
        result := ComCall(259, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_counterIncrement(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(260, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_counterIncrement(p) {
        result := ComCall(261, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_counterReset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(262, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_counterReset(p) {
        result := ComCall(263, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outline(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(264, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_outline(p) {
        result := ComCall(265, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_outlineWidth(v) {
        result := ComCall(266, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_outlineWidth(p) {
        result := ComCall(267, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outlineStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(268, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_outlineStyle(p) {
        result := ComCall(269, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_outlineColor(v) {
        result := ComCall(270, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_outlineColor(p) {
        result := ComCall(271, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_boxSizing(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(272, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_boxSizing(p) {
        result := ComCall(273, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderSpacing(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(274, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderSpacing(p) {
        result := ComCall(275, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_orphans(v) {
        result := ComCall(276, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_orphans(p) {
        result := ComCall(277, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_widows(v) {
        result := ComCall(278, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_widows(p) {
        result := ComCall(279, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakInside(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(280, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_pageBreakInside(p) {
        result := ComCall(281, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_emptyCells(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(282, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_emptyCells(p) {
        result := ComCall(283, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msBlockProgression(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(284, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_msBlockProgression(p) {
        result := ComCall(285, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_quotes(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(286, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_quotes(p) {
        result := ComCall(287, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alignmentBaseline(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(288, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_alignmentBaseline(p) {
        result := ComCall(289, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_baselineShift(v) {
        result := ComCall(290, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_baselineShift(p) {
        result := ComCall(291, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dominantBaseline(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(292, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_dominantBaseline(p) {
        result := ComCall(293, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fontSizeAdjust(v) {
        result := ComCall(294, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_fontSizeAdjust(p) {
        result := ComCall(295, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontStretch(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(296, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fontStretch(p) {
        result := ComCall(297, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_opacity(v) {
        result := ComCall(298, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_opacity(p) {
        result := ComCall(299, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clipPath(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(300, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_clipPath(p) {
        result := ComCall(301, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clipRule(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(302, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_clipRule(p) {
        result := ComCall(303, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fill(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(304, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fill(p) {
        result := ComCall(305, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fillOpacity(v) {
        result := ComCall(306, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_fillOpacity(p) {
        result := ComCall(307, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fillRule(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(308, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_fillRule(p) {
        result := ComCall(309, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_kerning(v) {
        result := ComCall(310, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_kerning(p) {
        result := ComCall(311, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_marker(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(312, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_marker(p) {
        result := ComCall(313, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_markerEnd(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(314, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_markerEnd(p) {
        result := ComCall(315, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_markerMid(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(316, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_markerMid(p) {
        result := ComCall(317, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_markerStart(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(318, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_markerStart(p) {
        result := ComCall(319, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_mask(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(320, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_mask(p) {
        result := ComCall(321, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pointerEvents(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(322, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_pointerEvents(p) {
        result := ComCall(323, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_stopColor(v) {
        result := ComCall(324, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_stopColor(p) {
        result := ComCall(325, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_stopOpacity(v) {
        result := ComCall(326, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_stopOpacity(p) {
        result := ComCall(327, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_stroke(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(328, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_stroke(p) {
        result := ComCall(329, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_strokeDasharray(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(330, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_strokeDasharray(p) {
        result := ComCall(331, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeDashoffset(v) {
        result := ComCall(332, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_strokeDashoffset(p) {
        result := ComCall(333, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_strokeLinecap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(334, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_strokeLinecap(p) {
        result := ComCall(335, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_strokeLinejoin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(336, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_strokeLinejoin(p) {
        result := ComCall(337, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeMiterlimit(v) {
        result := ComCall(338, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_strokeMiterlimit(p) {
        result := ComCall(339, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeOpacity(v) {
        result := ComCall(340, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_strokeOpacity(p) {
        result := ComCall(341, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeWidth(v) {
        result := ComCall(342, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_strokeWidth(p) {
        result := ComCall(343, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAnchor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(344, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_textAnchor(p) {
        result := ComCall(345, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_glyphOrientationHorizontal(v) {
        result := ComCall(346, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_glyphOrientationHorizontal(p) {
        result := ComCall(347, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_glyphOrientationVertical(v) {
        result := ComCall(348, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_glyphOrientationVertical(p) {
        result := ComCall(349, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(350, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderRadius(p) {
        result := ComCall(351, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTopLeftRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(352, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderTopLeftRadius(p) {
        result := ComCall(353, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTopRightRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(354, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderTopRightRadius(p) {
        result := ComCall(355, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottomRightRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(356, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderBottomRightRadius(p) {
        result := ComCall(357, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottomLeftRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(358, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_borderBottomLeftRadius(p) {
        result := ComCall(359, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_clipTop(v) {
        result := ComCall(360, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_clipTop(p) {
        result := ComCall(361, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_clipRight(v) {
        result := ComCall(362, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_clipRight(p) {
        result := ComCall(363, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_clipBottom(p) {
        result := ComCall(364, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_clipLeft(v) {
        result := ComCall(365, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_clipLeft(p) {
        result := ComCall(366, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssFloat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(367, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_cssFloat(p) {
        result := ComCall(368, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundClip(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(369, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_backgroundClip(p) {
        result := ComCall(370, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(371, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_backgroundOrigin(p) {
        result := ComCall(372, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundSize(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(373, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_backgroundSize(p) {
        result := ComCall(374, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_boxShadow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(375, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_boxShadow(p) {
        result := ComCall(376, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(377, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_msTransform(p) {
        result := ComCall(378, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransformOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(379, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_msTransformOrigin(p) {
        result := ComCall(380, this, "ptr", p, "HRESULT")
        return result
    }
}
