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
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * @type {VARIANT} 
     */
    parentRule {
        get => this.get_parentRule()
    }

    /**
     * @type {BSTR} 
     */
    fontFamily {
        get => this.get_fontFamily()
        set => this.put_fontFamily(value)
    }

    /**
     * @type {BSTR} 
     */
    fontStyle {
        get => this.get_fontStyle()
        set => this.put_fontStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    fontVariant {
        get => this.get_fontVariant()
        set => this.put_fontVariant(value)
    }

    /**
     * @type {BSTR} 
     */
    fontWeight {
        get => this.get_fontWeight()
        set => this.put_fontWeight(value)
    }

    /**
     * @type {VARIANT} 
     */
    fontSize {
        get => this.get_fontSize()
        set => this.put_fontSize(value)
    }

    /**
     * @type {BSTR} 
     */
    font {
        get => this.get_font()
        set => this.put_font(value)
    }

    /**
     * @type {VARIANT} 
     */
    color {
        get => this.get_color()
        set => this.put_color(value)
    }

    /**
     * @type {BSTR} 
     */
    background {
        get => this.get_background()
        set => this.put_background(value)
    }

    /**
     * @type {VARIANT} 
     */
    backgroundColor {
        get => this.get_backgroundColor()
        set => this.put_backgroundColor(value)
    }

    /**
     * @type {BSTR} 
     */
    backgroundImage {
        get => this.get_backgroundImage()
        set => this.put_backgroundImage(value)
    }

    /**
     * @type {BSTR} 
     */
    backgroundRepeat {
        get => this.get_backgroundRepeat()
        set => this.put_backgroundRepeat(value)
    }

    /**
     * @type {BSTR} 
     */
    backgroundAttachment {
        get => this.get_backgroundAttachment()
        set => this.put_backgroundAttachment(value)
    }

    /**
     * @type {BSTR} 
     */
    backgroundPosition {
        get => this.get_backgroundPosition()
        set => this.put_backgroundPosition(value)
    }

    /**
     * @type {VARIANT} 
     */
    backgroundPositionX {
        get => this.get_backgroundPositionX()
        set => this.put_backgroundPositionX(value)
    }

    /**
     * @type {VARIANT} 
     */
    backgroundPositionY {
        get => this.get_backgroundPositionY()
        set => this.put_backgroundPositionY(value)
    }

    /**
     * @type {VARIANT} 
     */
    wordSpacing {
        get => this.get_wordSpacing()
        set => this.put_wordSpacing(value)
    }

    /**
     * @type {VARIANT} 
     */
    letterSpacing {
        get => this.get_letterSpacing()
        set => this.put_letterSpacing(value)
    }

    /**
     * @type {BSTR} 
     */
    textDecoration {
        get => this.get_textDecoration()
        set => this.put_textDecoration(value)
    }

    /**
     * @type {VARIANT} 
     */
    verticalAlign {
        get => this.get_verticalAlign()
        set => this.put_verticalAlign(value)
    }

    /**
     * @type {BSTR} 
     */
    textTransform {
        get => this.get_textTransform()
        set => this.put_textTransform(value)
    }

    /**
     * @type {BSTR} 
     */
    textAlign {
        get => this.get_textAlign()
        set => this.put_textAlign(value)
    }

    /**
     * @type {VARIANT} 
     */
    textIndent {
        get => this.get_textIndent()
        set => this.put_textIndent(value)
    }

    /**
     * @type {VARIANT} 
     */
    lineHeight {
        get => this.get_lineHeight()
        set => this.put_lineHeight(value)
    }

    /**
     * @type {VARIANT} 
     */
    marginTop {
        get => this.get_marginTop()
        set => this.put_marginTop(value)
    }

    /**
     * @type {VARIANT} 
     */
    marginRight {
        get => this.get_marginRight()
        set => this.put_marginRight(value)
    }

    /**
     * @type {VARIANT} 
     */
    marginBottom {
        get => this.get_marginBottom()
        set => this.put_marginBottom(value)
    }

    /**
     * @type {VARIANT} 
     */
    marginLeft {
        get => this.get_marginLeft()
        set => this.put_marginLeft(value)
    }

    /**
     * @type {BSTR} 
     */
    margin {
        get => this.get_margin()
        set => this.put_margin(value)
    }

    /**
     * @type {VARIANT} 
     */
    paddingTop {
        get => this.get_paddingTop()
        set => this.put_paddingTop(value)
    }

    /**
     * @type {VARIANT} 
     */
    paddingRight {
        get => this.get_paddingRight()
        set => this.put_paddingRight(value)
    }

    /**
     * @type {VARIANT} 
     */
    paddingBottom {
        get => this.get_paddingBottom()
        set => this.put_paddingBottom(value)
    }

    /**
     * @type {VARIANT} 
     */
    paddingLeft {
        get => this.get_paddingLeft()
        set => this.put_paddingLeft(value)
    }

    /**
     * @type {BSTR} 
     */
    padding {
        get => this.get_padding()
        set => this.put_padding(value)
    }

    /**
     * @type {BSTR} 
     */
    border {
        get => this.get_border()
        set => this.put_border(value)
    }

    /**
     * @type {BSTR} 
     */
    borderTop {
        get => this.get_borderTop()
        set => this.put_borderTop(value)
    }

    /**
     * @type {BSTR} 
     */
    borderRight {
        get => this.get_borderRight()
        set => this.put_borderRight(value)
    }

    /**
     * @type {BSTR} 
     */
    borderBottom {
        get => this.get_borderBottom()
        set => this.put_borderBottom(value)
    }

    /**
     * @type {BSTR} 
     */
    borderLeft {
        get => this.get_borderLeft()
        set => this.put_borderLeft(value)
    }

    /**
     * @type {BSTR} 
     */
    borderColor {
        get => this.get_borderColor()
        set => this.put_borderColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderTopColor {
        get => this.get_borderTopColor()
        set => this.put_borderTopColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderRightColor {
        get => this.get_borderRightColor()
        set => this.put_borderRightColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderBottomColor {
        get => this.get_borderBottomColor()
        set => this.put_borderBottomColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderLeftColor {
        get => this.get_borderLeftColor()
        set => this.put_borderLeftColor(value)
    }

    /**
     * @type {BSTR} 
     */
    borderWidth {
        get => this.get_borderWidth()
        set => this.put_borderWidth(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderTopWidth {
        get => this.get_borderTopWidth()
        set => this.put_borderTopWidth(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderRightWidth {
        get => this.get_borderRightWidth()
        set => this.put_borderRightWidth(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderBottomWidth {
        get => this.get_borderBottomWidth()
        set => this.put_borderBottomWidth(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderLeftWidth {
        get => this.get_borderLeftWidth()
        set => this.put_borderLeftWidth(value)
    }

    /**
     * @type {BSTR} 
     */
    borderStyle {
        get => this.get_borderStyle()
        set => this.put_borderStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    borderTopStyle {
        get => this.get_borderTopStyle()
        set => this.put_borderTopStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    borderRightStyle {
        get => this.get_borderRightStyle()
        set => this.put_borderRightStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    borderBottomStyle {
        get => this.get_borderBottomStyle()
        set => this.put_borderBottomStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    borderLeftStyle {
        get => this.get_borderLeftStyle()
        set => this.put_borderLeftStyle(value)
    }

    /**
     * @type {VARIANT} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * @type {VARIANT} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * @type {BSTR} 
     */
    styleFloat {
        get => this.get_styleFloat()
        set => this.put_styleFloat(value)
    }

    /**
     * @type {BSTR} 
     */
    clear {
        get => this.get_clear()
        set => this.put_clear(value)
    }

    /**
     * @type {BSTR} 
     */
    display {
        get => this.get_display()
        set => this.put_display(value)
    }

    /**
     * @type {BSTR} 
     */
    visibility {
        get => this.get_visibility()
        set => this.put_visibility(value)
    }

    /**
     * @type {BSTR} 
     */
    listStyleType {
        get => this.get_listStyleType()
        set => this.put_listStyleType(value)
    }

    /**
     * @type {BSTR} 
     */
    listStylePosition {
        get => this.get_listStylePosition()
        set => this.put_listStylePosition(value)
    }

    /**
     * @type {BSTR} 
     */
    listStyleImage {
        get => this.get_listStyleImage()
        set => this.put_listStyleImage(value)
    }

    /**
     * @type {BSTR} 
     */
    listStyle {
        get => this.get_listStyle()
        set => this.put_listStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    whiteSpace {
        get => this.get_whiteSpace()
        set => this.put_whiteSpace(value)
    }

    /**
     * @type {VARIANT} 
     */
    top {
        get => this.get_top()
        set => this.put_top(value)
    }

    /**
     * @type {VARIANT} 
     */
    left {
        get => this.get_left()
        set => this.put_left(value)
    }

    /**
     * @type {VARIANT} 
     */
    zIndex {
        get => this.get_zIndex()
        set => this.put_zIndex(value)
    }

    /**
     * @type {BSTR} 
     */
    overflow {
        get => this.get_overflow()
        set => this.put_overflow(value)
    }

    /**
     * @type {BSTR} 
     */
    pageBreakBefore {
        get => this.get_pageBreakBefore()
        set => this.put_pageBreakBefore(value)
    }

    /**
     * @type {BSTR} 
     */
    pageBreakAfter {
        get => this.get_pageBreakAfter()
        set => this.put_pageBreakAfter(value)
    }

    /**
     * @type {BSTR} 
     */
    cssText {
        get => this.get_cssText()
        set => this.put_cssText(value)
    }

    /**
     * @type {BSTR} 
     */
    cursor {
        get => this.get_cursor()
        set => this.put_cursor(value)
    }

    /**
     * @type {BSTR} 
     */
    clip {
        get => this.get_clip()
        set => this.put_clip(value)
    }

    /**
     * @type {BSTR} 
     */
    filter {
        get => this.get_filter()
        set => this.put_filter(value)
    }

    /**
     * @type {BSTR} 
     */
    tableLayout {
        get => this.get_tableLayout()
        set => this.put_tableLayout(value)
    }

    /**
     * @type {BSTR} 
     */
    borderCollapse {
        get => this.get_borderCollapse()
        set => this.put_borderCollapse(value)
    }

    /**
     * @type {BSTR} 
     */
    direction {
        get => this.get_direction()
        set => this.put_direction(value)
    }

    /**
     * @type {BSTR} 
     */
    behavior {
        get => this.get_behavior()
        set => this.put_behavior(value)
    }

    /**
     * @type {BSTR} 
     */
    position {
        get => this.get_position()
        set => this.put_position(value)
    }

    /**
     * @type {BSTR} 
     */
    unicodeBidi {
        get => this.get_unicodeBidi()
        set => this.put_unicodeBidi(value)
    }

    /**
     * @type {VARIANT} 
     */
    bottom {
        get => this.get_bottom()
        set => this.put_bottom(value)
    }

    /**
     * @type {VARIANT} 
     */
    right {
        get => this.get_right()
        set => this.put_right(value)
    }

    /**
     * @type {BSTR} 
     */
    imeMode {
        get => this.get_imeMode()
        set => this.put_imeMode(value)
    }

    /**
     * @type {BSTR} 
     */
    rubyAlign {
        get => this.get_rubyAlign()
        set => this.put_rubyAlign(value)
    }

    /**
     * @type {BSTR} 
     */
    rubyPosition {
        get => this.get_rubyPosition()
        set => this.put_rubyPosition(value)
    }

    /**
     * @type {BSTR} 
     */
    rubyOverhang {
        get => this.get_rubyOverhang()
        set => this.put_rubyOverhang(value)
    }

    /**
     * @type {VARIANT} 
     */
    layoutGridChar {
        get => this.get_layoutGridChar()
        set => this.put_layoutGridChar(value)
    }

    /**
     * @type {VARIANT} 
     */
    layoutGridLine {
        get => this.get_layoutGridLine()
        set => this.put_layoutGridLine(value)
    }

    /**
     * @type {BSTR} 
     */
    layoutGridMode {
        get => this.get_layoutGridMode()
        set => this.put_layoutGridMode(value)
    }

    /**
     * @type {BSTR} 
     */
    layoutGridType {
        get => this.get_layoutGridType()
        set => this.put_layoutGridType(value)
    }

    /**
     * @type {BSTR} 
     */
    layoutGrid {
        get => this.get_layoutGrid()
        set => this.put_layoutGrid(value)
    }

    /**
     * @type {BSTR} 
     */
    textAutospace {
        get => this.get_textAutospace()
        set => this.put_textAutospace(value)
    }

    /**
     * @type {BSTR} 
     */
    wordBreak {
        get => this.get_wordBreak()
        set => this.put_wordBreak(value)
    }

    /**
     * @type {BSTR} 
     */
    lineBreak {
        get => this.get_lineBreak()
        set => this.put_lineBreak(value)
    }

    /**
     * @type {BSTR} 
     */
    textJustify {
        get => this.get_textJustify()
        set => this.put_textJustify(value)
    }

    /**
     * @type {BSTR} 
     */
    textJustifyTrim {
        get => this.get_textJustifyTrim()
        set => this.put_textJustifyTrim(value)
    }

    /**
     * @type {VARIANT} 
     */
    textKashida {
        get => this.get_textKashida()
        set => this.put_textKashida(value)
    }

    /**
     * @type {BSTR} 
     */
    overflowX {
        get => this.get_overflowX()
        set => this.put_overflowX(value)
    }

    /**
     * @type {BSTR} 
     */
    overflowY {
        get => this.get_overflowY()
        set => this.put_overflowY(value)
    }

    /**
     * @type {BSTR} 
     */
    accelerator {
        get => this.get_accelerator()
        set => this.put_accelerator(value)
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
     * @type {BSTR} 
     */
    textOverflow {
        get => this.get_textOverflow()
        set => this.put_textOverflow(value)
    }

    /**
     * @type {VARIANT} 
     */
    minHeight {
        get => this.get_minHeight()
        set => this.put_minHeight(value)
    }

    /**
     * @type {BSTR} 
     */
    msInterpolationMode {
        get => this.get_msInterpolationMode()
        set => this.put_msInterpolationMode(value)
    }

    /**
     * @type {VARIANT} 
     */
    maxHeight {
        get => this.get_maxHeight()
        set => this.put_maxHeight(value)
    }

    /**
     * @type {VARIANT} 
     */
    minWidth {
        get => this.get_minWidth()
        set => this.put_minWidth(value)
    }

    /**
     * @type {VARIANT} 
     */
    maxWidth {
        get => this.get_maxWidth()
        set => this.put_maxWidth(value)
    }

    /**
     * @type {BSTR} 
     */
    content {
        get => this.get_content()
        set => this.put_content(value)
    }

    /**
     * @type {BSTR} 
     */
    captionSide {
        get => this.get_captionSide()
        set => this.put_captionSide(value)
    }

    /**
     * @type {BSTR} 
     */
    counterIncrement {
        get => this.get_counterIncrement()
        set => this.put_counterIncrement(value)
    }

    /**
     * @type {BSTR} 
     */
    counterReset {
        get => this.get_counterReset()
        set => this.put_counterReset(value)
    }

    /**
     * @type {BSTR} 
     */
    outline {
        get => this.get_outline()
        set => this.put_outline(value)
    }

    /**
     * @type {VARIANT} 
     */
    outlineWidth {
        get => this.get_outlineWidth()
        set => this.put_outlineWidth(value)
    }

    /**
     * @type {BSTR} 
     */
    outlineStyle {
        get => this.get_outlineStyle()
        set => this.put_outlineStyle(value)
    }

    /**
     * @type {VARIANT} 
     */
    outlineColor {
        get => this.get_outlineColor()
        set => this.put_outlineColor(value)
    }

    /**
     * @type {BSTR} 
     */
    boxSizing {
        get => this.get_boxSizing()
        set => this.put_boxSizing(value)
    }

    /**
     * @type {BSTR} 
     */
    borderSpacing {
        get => this.get_borderSpacing()
        set => this.put_borderSpacing(value)
    }

    /**
     * @type {VARIANT} 
     */
    orphans {
        get => this.get_orphans()
        set => this.put_orphans(value)
    }

    /**
     * @type {VARIANT} 
     */
    widows {
        get => this.get_widows()
        set => this.put_widows(value)
    }

    /**
     * @type {BSTR} 
     */
    pageBreakInside {
        get => this.get_pageBreakInside()
        set => this.put_pageBreakInside(value)
    }

    /**
     * @type {BSTR} 
     */
    emptyCells {
        get => this.get_emptyCells()
        set => this.put_emptyCells(value)
    }

    /**
     * @type {BSTR} 
     */
    msBlockProgression {
        get => this.get_msBlockProgression()
        set => this.put_msBlockProgression(value)
    }

    /**
     * @type {BSTR} 
     */
    quotes {
        get => this.get_quotes()
        set => this.put_quotes(value)
    }

    /**
     * @type {BSTR} 
     */
    alignmentBaseline {
        get => this.get_alignmentBaseline()
        set => this.put_alignmentBaseline(value)
    }

    /**
     * @type {VARIANT} 
     */
    baselineShift {
        get => this.get_baselineShift()
        set => this.put_baselineShift(value)
    }

    /**
     * @type {BSTR} 
     */
    dominantBaseline {
        get => this.get_dominantBaseline()
        set => this.put_dominantBaseline(value)
    }

    /**
     * @type {VARIANT} 
     */
    fontSizeAdjust {
        get => this.get_fontSizeAdjust()
        set => this.put_fontSizeAdjust(value)
    }

    /**
     * @type {BSTR} 
     */
    fontStretch {
        get => this.get_fontStretch()
        set => this.put_fontStretch(value)
    }

    /**
     * @type {VARIANT} 
     */
    opacity {
        get => this.get_opacity()
        set => this.put_opacity(value)
    }

    /**
     * @type {BSTR} 
     */
    clipPath {
        get => this.get_clipPath()
        set => this.put_clipPath(value)
    }

    /**
     * @type {BSTR} 
     */
    clipRule {
        get => this.get_clipRule()
        set => this.put_clipRule(value)
    }

    /**
     * @type {BSTR} 
     */
    fill {
        get => this.get_fill()
        set => this.put_fill(value)
    }

    /**
     * @type {VARIANT} 
     */
    fillOpacity {
        get => this.get_fillOpacity()
        set => this.put_fillOpacity(value)
    }

    /**
     * @type {BSTR} 
     */
    fillRule {
        get => this.get_fillRule()
        set => this.put_fillRule(value)
    }

    /**
     * @type {VARIANT} 
     */
    kerning {
        get => this.get_kerning()
        set => this.put_kerning(value)
    }

    /**
     * @type {BSTR} 
     */
    marker {
        get => this.get_marker()
        set => this.put_marker(value)
    }

    /**
     * @type {BSTR} 
     */
    markerEnd {
        get => this.get_markerEnd()
        set => this.put_markerEnd(value)
    }

    /**
     * @type {BSTR} 
     */
    markerMid {
        get => this.get_markerMid()
        set => this.put_markerMid(value)
    }

    /**
     * @type {BSTR} 
     */
    markerStart {
        get => this.get_markerStart()
        set => this.put_markerStart(value)
    }

    /**
     * @type {BSTR} 
     */
    mask {
        get => this.get_mask()
        set => this.put_mask(value)
    }

    /**
     * @type {BSTR} 
     */
    pointerEvents {
        get => this.get_pointerEvents()
        set => this.put_pointerEvents(value)
    }

    /**
     * @type {VARIANT} 
     */
    stopColor {
        get => this.get_stopColor()
        set => this.put_stopColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    stopOpacity {
        get => this.get_stopOpacity()
        set => this.put_stopOpacity(value)
    }

    /**
     * @type {BSTR} 
     */
    stroke {
        get => this.get_stroke()
        set => this.put_stroke(value)
    }

    /**
     * @type {BSTR} 
     */
    strokeDasharray {
        get => this.get_strokeDasharray()
        set => this.put_strokeDasharray(value)
    }

    /**
     * @type {VARIANT} 
     */
    strokeDashoffset {
        get => this.get_strokeDashoffset()
        set => this.put_strokeDashoffset(value)
    }

    /**
     * @type {BSTR} 
     */
    strokeLinecap {
        get => this.get_strokeLinecap()
        set => this.put_strokeLinecap(value)
    }

    /**
     * @type {BSTR} 
     */
    strokeLinejoin {
        get => this.get_strokeLinejoin()
        set => this.put_strokeLinejoin(value)
    }

    /**
     * @type {VARIANT} 
     */
    strokeMiterlimit {
        get => this.get_strokeMiterlimit()
        set => this.put_strokeMiterlimit(value)
    }

    /**
     * @type {VARIANT} 
     */
    strokeOpacity {
        get => this.get_strokeOpacity()
        set => this.put_strokeOpacity(value)
    }

    /**
     * @type {VARIANT} 
     */
    strokeWidth {
        get => this.get_strokeWidth()
        set => this.put_strokeWidth(value)
    }

    /**
     * @type {BSTR} 
     */
    textAnchor {
        get => this.get_textAnchor()
        set => this.put_textAnchor(value)
    }

    /**
     * @type {VARIANT} 
     */
    glyphOrientationHorizontal {
        get => this.get_glyphOrientationHorizontal()
        set => this.put_glyphOrientationHorizontal(value)
    }

    /**
     * @type {VARIANT} 
     */
    glyphOrientationVertical {
        get => this.get_glyphOrientationVertical()
        set => this.put_glyphOrientationVertical(value)
    }

    /**
     * @type {BSTR} 
     */
    borderRadius {
        get => this.get_borderRadius()
        set => this.put_borderRadius(value)
    }

    /**
     * @type {BSTR} 
     */
    borderTopLeftRadius {
        get => this.get_borderTopLeftRadius()
        set => this.put_borderTopLeftRadius(value)
    }

    /**
     * @type {BSTR} 
     */
    borderTopRightRadius {
        get => this.get_borderTopRightRadius()
        set => this.put_borderTopRightRadius(value)
    }

    /**
     * @type {BSTR} 
     */
    borderBottomRightRadius {
        get => this.get_borderBottomRightRadius()
        set => this.put_borderBottomRightRadius(value)
    }

    /**
     * @type {BSTR} 
     */
    borderBottomLeftRadius {
        get => this.get_borderBottomLeftRadius()
        set => this.put_borderBottomLeftRadius(value)
    }

    /**
     * @type {VARIANT} 
     */
    clipTop {
        get => this.get_clipTop()
        set => this.put_clipTop(value)
    }

    /**
     * @type {VARIANT} 
     */
    clipRight {
        get => this.get_clipRight()
        set => this.put_clipRight(value)
    }

    /**
     * @type {VARIANT} 
     */
    clipBottom {
        get => this.get_clipBottom()
    }

    /**
     * @type {VARIANT} 
     */
    clipLeft {
        get => this.get_clipLeft()
        set => this.put_clipLeft(value)
    }

    /**
     * @type {BSTR} 
     */
    cssFloat {
        get => this.get_cssFloat()
        set => this.put_cssFloat(value)
    }

    /**
     * @type {BSTR} 
     */
    backgroundClip {
        get => this.get_backgroundClip()
        set => this.put_backgroundClip(value)
    }

    /**
     * @type {BSTR} 
     */
    backgroundOrigin {
        get => this.get_backgroundOrigin()
        set => this.put_backgroundOrigin(value)
    }

    /**
     * @type {BSTR} 
     */
    backgroundSize {
        get => this.get_backgroundSize()
        set => this.put_backgroundSize(value)
    }

    /**
     * @type {BSTR} 
     */
    boxShadow {
        get => this.get_boxShadow()
        set => this.put_boxShadow(value)
    }

    /**
     * @type {BSTR} 
     */
    msTransform {
        get => this.get_msTransform()
        set => this.put_msTransform(value)
    }

    /**
     * @type {BSTR} 
     */
    msTransformOrigin {
        get => this.get_msTransformOrigin()
        set => this.put_msTransformOrigin(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_parentRule() {
        p := VARIANT()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {BSTR} 
     */
    getPropertyValue(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        pbstrPropertyValue := BSTR()
        result := ComCall(9, this, "ptr", bstrPropertyName, "ptr", pbstrPropertyValue, "HRESULT")
        return pbstrPropertyValue
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {BSTR} 
     */
    getPropertyPriority(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        pbstrPropertyPriority := BSTR()
        result := ComCall(10, this, "ptr", bstrPropertyName, "ptr", pbstrPropertyPriority, "HRESULT")
        return pbstrPropertyPriority
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {BSTR} 
     */
    removeProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        pbstrPropertyValue := BSTR()
        result := ComCall(11, this, "ptr", bstrPropertyName, "ptr", pbstrPropertyValue, "HRESULT")
        return pbstrPropertyValue
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
     * @returns {BSTR} 
     */
    item(index) {
        pbstrPropertyName := BSTR()
        result := ComCall(13, this, "int", index, "ptr", pbstrPropertyName, "HRESULT")
        return pbstrPropertyName
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
     * @returns {BSTR} 
     */
    get_fontFamily() {
        p := BSTR()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_fontStyle() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_fontVariant() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_fontWeight() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_fontSize() {
        p := VARIANT()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_font() {
        p := BSTR()
        result := ComCall(25, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_color() {
        p := VARIANT()
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_background() {
        p := BSTR()
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_backgroundColor() {
        p := VARIANT()
        result := ComCall(31, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_backgroundImage() {
        p := BSTR()
        result := ComCall(33, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_backgroundRepeat() {
        p := BSTR()
        result := ComCall(35, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_backgroundAttachment() {
        p := BSTR()
        result := ComCall(37, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_backgroundPosition() {
        p := BSTR()
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_backgroundPositionX() {
        p := VARIANT()
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_backgroundPositionY() {
        p := VARIANT()
        result := ComCall(43, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_wordSpacing() {
        p := VARIANT()
        result := ComCall(45, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_letterSpacing() {
        p := VARIANT()
        result := ComCall(47, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textDecoration() {
        p := BSTR()
        result := ComCall(49, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_verticalAlign() {
        p := VARIANT()
        result := ComCall(51, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textTransform() {
        p := BSTR()
        result := ComCall(53, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textAlign() {
        p := BSTR()
        result := ComCall(55, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_textIndent() {
        p := VARIANT()
        result := ComCall(57, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_lineHeight() {
        p := VARIANT()
        result := ComCall(59, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_marginTop() {
        p := VARIANT()
        result := ComCall(61, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_marginRight() {
        p := VARIANT()
        result := ComCall(63, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_marginBottom() {
        p := VARIANT()
        result := ComCall(65, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_marginLeft() {
        p := VARIANT()
        result := ComCall(67, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_margin() {
        p := BSTR()
        result := ComCall(69, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_paddingTop() {
        p := VARIANT()
        result := ComCall(71, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_paddingRight() {
        p := VARIANT()
        result := ComCall(73, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_paddingBottom() {
        p := VARIANT()
        result := ComCall(75, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_paddingLeft() {
        p := VARIANT()
        result := ComCall(77, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_padding() {
        p := BSTR()
        result := ComCall(79, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_border() {
        p := BSTR()
        result := ComCall(81, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderTop() {
        p := BSTR()
        result := ComCall(83, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderRight() {
        p := BSTR()
        result := ComCall(85, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderBottom() {
        p := BSTR()
        result := ComCall(87, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderLeft() {
        p := BSTR()
        result := ComCall(89, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderColor() {
        p := BSTR()
        result := ComCall(91, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_borderTopColor() {
        p := VARIANT()
        result := ComCall(93, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_borderRightColor() {
        p := VARIANT()
        result := ComCall(95, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_borderBottomColor() {
        p := VARIANT()
        result := ComCall(97, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_borderLeftColor() {
        p := VARIANT()
        result := ComCall(99, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderWidth() {
        p := BSTR()
        result := ComCall(101, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_borderTopWidth() {
        p := VARIANT()
        result := ComCall(103, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_borderRightWidth() {
        p := VARIANT()
        result := ComCall(105, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_borderBottomWidth() {
        p := VARIANT()
        result := ComCall(107, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_borderLeftWidth() {
        p := VARIANT()
        result := ComCall(109, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderStyle() {
        p := BSTR()
        result := ComCall(111, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderTopStyle() {
        p := BSTR()
        result := ComCall(113, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderRightStyle() {
        p := BSTR()
        result := ComCall(115, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderBottomStyle() {
        p := BSTR()
        result := ComCall(117, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderLeftStyle() {
        p := BSTR()
        result := ComCall(119, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(121, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(123, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_styleFloat() {
        p := BSTR()
        result := ComCall(125, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_clear() {
        p := BSTR()
        result := ComCall(127, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_display() {
        p := BSTR()
        result := ComCall(129, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_visibility() {
        p := BSTR()
        result := ComCall(131, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_listStyleType() {
        p := BSTR()
        result := ComCall(133, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_listStylePosition() {
        p := BSTR()
        result := ComCall(135, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_listStyleImage() {
        p := BSTR()
        result := ComCall(137, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_listStyle() {
        p := BSTR()
        result := ComCall(139, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_whiteSpace() {
        p := BSTR()
        result := ComCall(141, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_top() {
        p := VARIANT()
        result := ComCall(143, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_left() {
        p := VARIANT()
        result := ComCall(145, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_zIndex() {
        p := VARIANT()
        result := ComCall(147, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_overflow() {
        p := BSTR()
        result := ComCall(149, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_pageBreakBefore() {
        p := BSTR()
        result := ComCall(151, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_pageBreakAfter() {
        p := BSTR()
        result := ComCall(153, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_cssText() {
        p := BSTR()
        result := ComCall(155, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_cursor() {
        p := BSTR()
        result := ComCall(157, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_clip() {
        p := BSTR()
        result := ComCall(159, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_filter() {
        p := BSTR()
        result := ComCall(161, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_tableLayout() {
        p := BSTR()
        result := ComCall(163, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderCollapse() {
        p := BSTR()
        result := ComCall(165, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_direction() {
        p := BSTR()
        result := ComCall(167, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_behavior() {
        p := BSTR()
        result := ComCall(169, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_position() {
        p := BSTR()
        result := ComCall(171, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_unicodeBidi() {
        p := BSTR()
        result := ComCall(173, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_bottom() {
        p := VARIANT()
        result := ComCall(175, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_right() {
        p := VARIANT()
        result := ComCall(177, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_imeMode() {
        p := BSTR()
        result := ComCall(179, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_rubyAlign() {
        p := BSTR()
        result := ComCall(181, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_rubyPosition() {
        p := BSTR()
        result := ComCall(183, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_rubyOverhang() {
        p := BSTR()
        result := ComCall(185, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_layoutGridChar() {
        p := VARIANT()
        result := ComCall(187, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_layoutGridLine() {
        p := VARIANT()
        result := ComCall(189, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_layoutGridMode() {
        p := BSTR()
        result := ComCall(191, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_layoutGridType() {
        p := BSTR()
        result := ComCall(193, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_layoutGrid() {
        p := BSTR()
        result := ComCall(195, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textAutospace() {
        p := BSTR()
        result := ComCall(197, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_wordBreak() {
        p := BSTR()
        result := ComCall(199, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_lineBreak() {
        p := BSTR()
        result := ComCall(201, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textJustify() {
        p := BSTR()
        result := ComCall(203, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textJustifyTrim() {
        p := BSTR()
        result := ComCall(205, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_textKashida() {
        p := VARIANT()
        result := ComCall(207, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_overflowX() {
        p := BSTR()
        result := ComCall(209, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_overflowY() {
        p := BSTR()
        result := ComCall(211, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_accelerator() {
        p := BSTR()
        result := ComCall(213, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_layoutFlow() {
        p := BSTR()
        result := ComCall(215, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_zoom() {
        p := VARIANT()
        result := ComCall(217, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_wordWrap() {
        p := BSTR()
        result := ComCall(219, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textUnderlinePosition() {
        p := BSTR()
        result := ComCall(221, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_scrollbarBaseColor() {
        p := VARIANT()
        result := ComCall(223, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_scrollbarFaceColor() {
        p := VARIANT()
        result := ComCall(225, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_scrollbar3dLightColor() {
        p := VARIANT()
        result := ComCall(227, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_scrollbarShadowColor() {
        p := VARIANT()
        result := ComCall(229, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_scrollbarHighlightColor() {
        p := VARIANT()
        result := ComCall(231, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_scrollbarDarkShadowColor() {
        p := VARIANT()
        result := ComCall(233, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_scrollbarArrowColor() {
        p := VARIANT()
        result := ComCall(235, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_scrollbarTrackColor() {
        p := VARIANT()
        result := ComCall(237, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_writingMode() {
        p := BSTR()
        result := ComCall(239, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textAlignLast() {
        p := BSTR()
        result := ComCall(241, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_textKashidaSpace() {
        p := VARIANT()
        result := ComCall(243, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textOverflow() {
        p := BSTR()
        result := ComCall(245, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_minHeight() {
        p := VARIANT()
        result := ComCall(247, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_msInterpolationMode() {
        p := BSTR()
        result := ComCall(249, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_maxHeight() {
        p := VARIANT()
        result := ComCall(251, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_minWidth() {
        p := VARIANT()
        result := ComCall(253, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_maxWidth() {
        p := VARIANT()
        result := ComCall(255, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_content() {
        p := BSTR()
        result := ComCall(257, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_captionSide() {
        p := BSTR()
        result := ComCall(259, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_counterIncrement() {
        p := BSTR()
        result := ComCall(261, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_counterReset() {
        p := BSTR()
        result := ComCall(263, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_outline() {
        p := BSTR()
        result := ComCall(265, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_outlineWidth() {
        p := VARIANT()
        result := ComCall(267, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_outlineStyle() {
        p := BSTR()
        result := ComCall(269, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_outlineColor() {
        p := VARIANT()
        result := ComCall(271, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_boxSizing() {
        p := BSTR()
        result := ComCall(273, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderSpacing() {
        p := BSTR()
        result := ComCall(275, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_orphans() {
        p := VARIANT()
        result := ComCall(277, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_widows() {
        p := VARIANT()
        result := ComCall(279, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_pageBreakInside() {
        p := BSTR()
        result := ComCall(281, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_emptyCells() {
        p := BSTR()
        result := ComCall(283, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_msBlockProgression() {
        p := BSTR()
        result := ComCall(285, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_quotes() {
        p := BSTR()
        result := ComCall(287, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_alignmentBaseline() {
        p := BSTR()
        result := ComCall(289, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_baselineShift() {
        p := VARIANT()
        result := ComCall(291, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_dominantBaseline() {
        p := BSTR()
        result := ComCall(293, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_fontSizeAdjust() {
        p := VARIANT()
        result := ComCall(295, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_fontStretch() {
        p := BSTR()
        result := ComCall(297, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_opacity() {
        p := VARIANT()
        result := ComCall(299, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_clipPath() {
        p := BSTR()
        result := ComCall(301, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_clipRule() {
        p := BSTR()
        result := ComCall(303, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_fill() {
        p := BSTR()
        result := ComCall(305, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_fillOpacity() {
        p := VARIANT()
        result := ComCall(307, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_fillRule() {
        p := BSTR()
        result := ComCall(309, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_kerning() {
        p := VARIANT()
        result := ComCall(311, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_marker() {
        p := BSTR()
        result := ComCall(313, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_markerEnd() {
        p := BSTR()
        result := ComCall(315, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_markerMid() {
        p := BSTR()
        result := ComCall(317, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_markerStart() {
        p := BSTR()
        result := ComCall(319, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_mask() {
        p := BSTR()
        result := ComCall(321, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_pointerEvents() {
        p := BSTR()
        result := ComCall(323, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_stopColor() {
        p := VARIANT()
        result := ComCall(325, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_stopOpacity() {
        p := VARIANT()
        result := ComCall(327, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_stroke() {
        p := BSTR()
        result := ComCall(329, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_strokeDasharray() {
        p := BSTR()
        result := ComCall(331, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_strokeDashoffset() {
        p := VARIANT()
        result := ComCall(333, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_strokeLinecap() {
        p := BSTR()
        result := ComCall(335, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_strokeLinejoin() {
        p := BSTR()
        result := ComCall(337, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_strokeMiterlimit() {
        p := VARIANT()
        result := ComCall(339, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_strokeOpacity() {
        p := VARIANT()
        result := ComCall(341, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_strokeWidth() {
        p := VARIANT()
        result := ComCall(343, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_textAnchor() {
        p := BSTR()
        result := ComCall(345, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_glyphOrientationHorizontal() {
        p := VARIANT()
        result := ComCall(347, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_glyphOrientationVertical() {
        p := VARIANT()
        result := ComCall(349, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderRadius() {
        p := BSTR()
        result := ComCall(351, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderTopLeftRadius() {
        p := BSTR()
        result := ComCall(353, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderTopRightRadius() {
        p := BSTR()
        result := ComCall(355, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderBottomRightRadius() {
        p := BSTR()
        result := ComCall(357, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_borderBottomLeftRadius() {
        p := BSTR()
        result := ComCall(359, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_clipTop() {
        p := VARIANT()
        result := ComCall(361, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_clipRight() {
        p := VARIANT()
        result := ComCall(363, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipBottom() {
        p := VARIANT()
        result := ComCall(364, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {VARIANT} 
     */
    get_clipLeft() {
        p := VARIANT()
        result := ComCall(366, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_cssFloat() {
        p := BSTR()
        result := ComCall(368, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_backgroundClip() {
        p := BSTR()
        result := ComCall(370, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_backgroundOrigin() {
        p := BSTR()
        result := ComCall(372, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_backgroundSize() {
        p := BSTR()
        result := ComCall(374, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_boxShadow() {
        p := BSTR()
        result := ComCall(376, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_msTransform() {
        p := BSTR()
        result := ComCall(378, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {BSTR} 
     */
    get_msTransformOrigin() {
        p := BSTR()
        result := ComCall(380, this, "ptr", p, "HRESULT")
        return p
    }
}
