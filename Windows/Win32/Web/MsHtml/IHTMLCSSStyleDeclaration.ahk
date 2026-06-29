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
export default struct IHTMLCSSStyleDeclaration extends IDispatch {
    /**
     * The interface identifier for IHTMLCSSStyleDeclaration
     * @type {Guid}
     */
    static IID := Guid("{30510740-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSStyleDeclaration
     * @type {Guid}
     */
    static CLSID := Guid("{30510741-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCSSStyleDeclaration interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_length                     : IntPtr
        get_parentRule                 : IntPtr
        getPropertyValue               : IntPtr
        getPropertyPriority            : IntPtr
        removeProperty                 : IntPtr
        setProperty                    : IntPtr
        item                           : IntPtr
        put_fontFamily                 : IntPtr
        get_fontFamily                 : IntPtr
        put_fontStyle                  : IntPtr
        get_fontStyle                  : IntPtr
        put_fontVariant                : IntPtr
        get_fontVariant                : IntPtr
        put_fontWeight                 : IntPtr
        get_fontWeight                 : IntPtr
        put_fontSize                   : IntPtr
        get_fontSize                   : IntPtr
        put_font                       : IntPtr
        get_font                       : IntPtr
        put_color                      : IntPtr
        get_color                      : IntPtr
        put_background                 : IntPtr
        get_background                 : IntPtr
        put_backgroundColor            : IntPtr
        get_backgroundColor            : IntPtr
        put_backgroundImage            : IntPtr
        get_backgroundImage            : IntPtr
        put_backgroundRepeat           : IntPtr
        get_backgroundRepeat           : IntPtr
        put_backgroundAttachment       : IntPtr
        get_backgroundAttachment       : IntPtr
        put_backgroundPosition         : IntPtr
        get_backgroundPosition         : IntPtr
        put_backgroundPositionX        : IntPtr
        get_backgroundPositionX        : IntPtr
        put_backgroundPositionY        : IntPtr
        get_backgroundPositionY        : IntPtr
        put_wordSpacing                : IntPtr
        get_wordSpacing                : IntPtr
        put_letterSpacing              : IntPtr
        get_letterSpacing              : IntPtr
        put_textDecoration             : IntPtr
        get_textDecoration             : IntPtr
        put_verticalAlign              : IntPtr
        get_verticalAlign              : IntPtr
        put_textTransform              : IntPtr
        get_textTransform              : IntPtr
        put_textAlign                  : IntPtr
        get_textAlign                  : IntPtr
        put_textIndent                 : IntPtr
        get_textIndent                 : IntPtr
        put_lineHeight                 : IntPtr
        get_lineHeight                 : IntPtr
        put_marginTop                  : IntPtr
        get_marginTop                  : IntPtr
        put_marginRight                : IntPtr
        get_marginRight                : IntPtr
        put_marginBottom               : IntPtr
        get_marginBottom               : IntPtr
        put_marginLeft                 : IntPtr
        get_marginLeft                 : IntPtr
        put_margin                     : IntPtr
        get_margin                     : IntPtr
        put_paddingTop                 : IntPtr
        get_paddingTop                 : IntPtr
        put_paddingRight               : IntPtr
        get_paddingRight               : IntPtr
        put_paddingBottom              : IntPtr
        get_paddingBottom              : IntPtr
        put_paddingLeft                : IntPtr
        get_paddingLeft                : IntPtr
        put_padding                    : IntPtr
        get_padding                    : IntPtr
        put_border                     : IntPtr
        get_border                     : IntPtr
        put_borderTop                  : IntPtr
        get_borderTop                  : IntPtr
        put_borderRight                : IntPtr
        get_borderRight                : IntPtr
        put_borderBottom               : IntPtr
        get_borderBottom               : IntPtr
        put_borderLeft                 : IntPtr
        get_borderLeft                 : IntPtr
        put_borderColor                : IntPtr
        get_borderColor                : IntPtr
        put_borderTopColor             : IntPtr
        get_borderTopColor             : IntPtr
        put_borderRightColor           : IntPtr
        get_borderRightColor           : IntPtr
        put_borderBottomColor          : IntPtr
        get_borderBottomColor          : IntPtr
        put_borderLeftColor            : IntPtr
        get_borderLeftColor            : IntPtr
        put_borderWidth                : IntPtr
        get_borderWidth                : IntPtr
        put_borderTopWidth             : IntPtr
        get_borderTopWidth             : IntPtr
        put_borderRightWidth           : IntPtr
        get_borderRightWidth           : IntPtr
        put_borderBottomWidth          : IntPtr
        get_borderBottomWidth          : IntPtr
        put_borderLeftWidth            : IntPtr
        get_borderLeftWidth            : IntPtr
        put_borderStyle                : IntPtr
        get_borderStyle                : IntPtr
        put_borderTopStyle             : IntPtr
        get_borderTopStyle             : IntPtr
        put_borderRightStyle           : IntPtr
        get_borderRightStyle           : IntPtr
        put_borderBottomStyle          : IntPtr
        get_borderBottomStyle          : IntPtr
        put_borderLeftStyle            : IntPtr
        get_borderLeftStyle            : IntPtr
        put_width                      : IntPtr
        get_width                      : IntPtr
        put_height                     : IntPtr
        get_height                     : IntPtr
        put_styleFloat                 : IntPtr
        get_styleFloat                 : IntPtr
        put_clear                      : IntPtr
        get_clear                      : IntPtr
        put_display                    : IntPtr
        get_display                    : IntPtr
        put_visibility                 : IntPtr
        get_visibility                 : IntPtr
        put_listStyleType              : IntPtr
        get_listStyleType              : IntPtr
        put_listStylePosition          : IntPtr
        get_listStylePosition          : IntPtr
        put_listStyleImage             : IntPtr
        get_listStyleImage             : IntPtr
        put_listStyle                  : IntPtr
        get_listStyle                  : IntPtr
        put_whiteSpace                 : IntPtr
        get_whiteSpace                 : IntPtr
        put_top                        : IntPtr
        get_top                        : IntPtr
        put_left                       : IntPtr
        get_left                       : IntPtr
        put_zIndex                     : IntPtr
        get_zIndex                     : IntPtr
        put_overflow                   : IntPtr
        get_overflow                   : IntPtr
        put_pageBreakBefore            : IntPtr
        get_pageBreakBefore            : IntPtr
        put_pageBreakAfter             : IntPtr
        get_pageBreakAfter             : IntPtr
        put_cssText                    : IntPtr
        get_cssText                    : IntPtr
        put_cursor                     : IntPtr
        get_cursor                     : IntPtr
        put_clip                       : IntPtr
        get_clip                       : IntPtr
        put_filter                     : IntPtr
        get_filter                     : IntPtr
        put_tableLayout                : IntPtr
        get_tableLayout                : IntPtr
        put_borderCollapse             : IntPtr
        get_borderCollapse             : IntPtr
        put_direction                  : IntPtr
        get_direction                  : IntPtr
        put_behavior                   : IntPtr
        get_behavior                   : IntPtr
        put_position                   : IntPtr
        get_position                   : IntPtr
        put_unicodeBidi                : IntPtr
        get_unicodeBidi                : IntPtr
        put_bottom                     : IntPtr
        get_bottom                     : IntPtr
        put_right                      : IntPtr
        get_right                      : IntPtr
        put_imeMode                    : IntPtr
        get_imeMode                    : IntPtr
        put_rubyAlign                  : IntPtr
        get_rubyAlign                  : IntPtr
        put_rubyPosition               : IntPtr
        get_rubyPosition               : IntPtr
        put_rubyOverhang               : IntPtr
        get_rubyOverhang               : IntPtr
        put_layoutGridChar             : IntPtr
        get_layoutGridChar             : IntPtr
        put_layoutGridLine             : IntPtr
        get_layoutGridLine             : IntPtr
        put_layoutGridMode             : IntPtr
        get_layoutGridMode             : IntPtr
        put_layoutGridType             : IntPtr
        get_layoutGridType             : IntPtr
        put_layoutGrid                 : IntPtr
        get_layoutGrid                 : IntPtr
        put_textAutospace              : IntPtr
        get_textAutospace              : IntPtr
        put_wordBreak                  : IntPtr
        get_wordBreak                  : IntPtr
        put_lineBreak                  : IntPtr
        get_lineBreak                  : IntPtr
        put_textJustify                : IntPtr
        get_textJustify                : IntPtr
        put_textJustifyTrim            : IntPtr
        get_textJustifyTrim            : IntPtr
        put_textKashida                : IntPtr
        get_textKashida                : IntPtr
        put_overflowX                  : IntPtr
        get_overflowX                  : IntPtr
        put_overflowY                  : IntPtr
        get_overflowY                  : IntPtr
        put_accelerator                : IntPtr
        get_accelerator                : IntPtr
        put_layoutFlow                 : IntPtr
        get_layoutFlow                 : IntPtr
        put_zoom                       : IntPtr
        get_zoom                       : IntPtr
        put_wordWrap                   : IntPtr
        get_wordWrap                   : IntPtr
        put_textUnderlinePosition      : IntPtr
        get_textUnderlinePosition      : IntPtr
        put_scrollbarBaseColor         : IntPtr
        get_scrollbarBaseColor         : IntPtr
        put_scrollbarFaceColor         : IntPtr
        get_scrollbarFaceColor         : IntPtr
        put_scrollbar3dLightColor      : IntPtr
        get_scrollbar3dLightColor      : IntPtr
        put_scrollbarShadowColor       : IntPtr
        get_scrollbarShadowColor       : IntPtr
        put_scrollbarHighlightColor    : IntPtr
        get_scrollbarHighlightColor    : IntPtr
        put_scrollbarDarkShadowColor   : IntPtr
        get_scrollbarDarkShadowColor   : IntPtr
        put_scrollbarArrowColor        : IntPtr
        get_scrollbarArrowColor        : IntPtr
        put_scrollbarTrackColor        : IntPtr
        get_scrollbarTrackColor        : IntPtr
        put_writingMode                : IntPtr
        get_writingMode                : IntPtr
        put_textAlignLast              : IntPtr
        get_textAlignLast              : IntPtr
        put_textKashidaSpace           : IntPtr
        get_textKashidaSpace           : IntPtr
        put_textOverflow               : IntPtr
        get_textOverflow               : IntPtr
        put_minHeight                  : IntPtr
        get_minHeight                  : IntPtr
        put_msInterpolationMode        : IntPtr
        get_msInterpolationMode        : IntPtr
        put_maxHeight                  : IntPtr
        get_maxHeight                  : IntPtr
        put_minWidth                   : IntPtr
        get_minWidth                   : IntPtr
        put_maxWidth                   : IntPtr
        get_maxWidth                   : IntPtr
        put_content                    : IntPtr
        get_content                    : IntPtr
        put_captionSide                : IntPtr
        get_captionSide                : IntPtr
        put_counterIncrement           : IntPtr
        get_counterIncrement           : IntPtr
        put_counterReset               : IntPtr
        get_counterReset               : IntPtr
        put_outline                    : IntPtr
        get_outline                    : IntPtr
        put_outlineWidth               : IntPtr
        get_outlineWidth               : IntPtr
        put_outlineStyle               : IntPtr
        get_outlineStyle               : IntPtr
        put_outlineColor               : IntPtr
        get_outlineColor               : IntPtr
        put_boxSizing                  : IntPtr
        get_boxSizing                  : IntPtr
        put_borderSpacing              : IntPtr
        get_borderSpacing              : IntPtr
        put_orphans                    : IntPtr
        get_orphans                    : IntPtr
        put_widows                     : IntPtr
        get_widows                     : IntPtr
        put_pageBreakInside            : IntPtr
        get_pageBreakInside            : IntPtr
        put_emptyCells                 : IntPtr
        get_emptyCells                 : IntPtr
        put_msBlockProgression         : IntPtr
        get_msBlockProgression         : IntPtr
        put_quotes                     : IntPtr
        get_quotes                     : IntPtr
        put_alignmentBaseline          : IntPtr
        get_alignmentBaseline          : IntPtr
        put_baselineShift              : IntPtr
        get_baselineShift              : IntPtr
        put_dominantBaseline           : IntPtr
        get_dominantBaseline           : IntPtr
        put_fontSizeAdjust             : IntPtr
        get_fontSizeAdjust             : IntPtr
        put_fontStretch                : IntPtr
        get_fontStretch                : IntPtr
        put_opacity                    : IntPtr
        get_opacity                    : IntPtr
        put_clipPath                   : IntPtr
        get_clipPath                   : IntPtr
        put_clipRule                   : IntPtr
        get_clipRule                   : IntPtr
        put_fill                       : IntPtr
        get_fill                       : IntPtr
        put_fillOpacity                : IntPtr
        get_fillOpacity                : IntPtr
        put_fillRule                   : IntPtr
        get_fillRule                   : IntPtr
        put_kerning                    : IntPtr
        get_kerning                    : IntPtr
        put_marker                     : IntPtr
        get_marker                     : IntPtr
        put_markerEnd                  : IntPtr
        get_markerEnd                  : IntPtr
        put_markerMid                  : IntPtr
        get_markerMid                  : IntPtr
        put_markerStart                : IntPtr
        get_markerStart                : IntPtr
        put_mask                       : IntPtr
        get_mask                       : IntPtr
        put_pointerEvents              : IntPtr
        get_pointerEvents              : IntPtr
        put_stopColor                  : IntPtr
        get_stopColor                  : IntPtr
        put_stopOpacity                : IntPtr
        get_stopOpacity                : IntPtr
        put_stroke                     : IntPtr
        get_stroke                     : IntPtr
        put_strokeDasharray            : IntPtr
        get_strokeDasharray            : IntPtr
        put_strokeDashoffset           : IntPtr
        get_strokeDashoffset           : IntPtr
        put_strokeLinecap              : IntPtr
        get_strokeLinecap              : IntPtr
        put_strokeLinejoin             : IntPtr
        get_strokeLinejoin             : IntPtr
        put_strokeMiterlimit           : IntPtr
        get_strokeMiterlimit           : IntPtr
        put_strokeOpacity              : IntPtr
        get_strokeOpacity              : IntPtr
        put_strokeWidth                : IntPtr
        get_strokeWidth                : IntPtr
        put_textAnchor                 : IntPtr
        get_textAnchor                 : IntPtr
        put_glyphOrientationHorizontal : IntPtr
        get_glyphOrientationHorizontal : IntPtr
        put_glyphOrientationVertical   : IntPtr
        get_glyphOrientationVertical   : IntPtr
        put_borderRadius               : IntPtr
        get_borderRadius               : IntPtr
        put_borderTopLeftRadius        : IntPtr
        get_borderTopLeftRadius        : IntPtr
        put_borderTopRightRadius       : IntPtr
        get_borderTopRightRadius       : IntPtr
        put_borderBottomRightRadius    : IntPtr
        get_borderBottomRightRadius    : IntPtr
        put_borderBottomLeftRadius     : IntPtr
        get_borderBottomLeftRadius     : IntPtr
        put_clipTop                    : IntPtr
        get_clipTop                    : IntPtr
        put_clipRight                  : IntPtr
        get_clipRight                  : IntPtr
        get_clipBottom                 : IntPtr
        put_clipLeft                   : IntPtr
        get_clipLeft                   : IntPtr
        put_cssFloat                   : IntPtr
        get_cssFloat                   : IntPtr
        put_backgroundClip             : IntPtr
        get_backgroundClip             : IntPtr
        put_backgroundOrigin           : IntPtr
        get_backgroundOrigin           : IntPtr
        put_backgroundSize             : IntPtr
        get_backgroundSize             : IntPtr
        put_boxShadow                  : IntPtr
        get_boxShadow                  : IntPtr
        put_msTransform                : IntPtr
        get_msTransform                : IntPtr
        put_msTransformOrigin          : IntPtr
        get_msTransformOrigin          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCSSStyleDeclaration.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {BSTR} 
     */
    getPropertyValue(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        pbstrPropertyValue := BSTR.Owned()
        result := ComCall(9, this, BSTR, bstrPropertyName, BSTR.Ptr, pbstrPropertyValue, "HRESULT")
        return pbstrPropertyValue
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {BSTR} 
     */
    getPropertyPriority(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        pbstrPropertyPriority := BSTR.Owned()
        result := ComCall(10, this, BSTR, bstrPropertyName, BSTR.Ptr, pbstrPropertyPriority, "HRESULT")
        return pbstrPropertyPriority
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {BSTR} 
     */
    removeProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        pbstrPropertyValue := BSTR.Owned()
        result := ComCall(11, this, BSTR, bstrPropertyName, BSTR.Ptr, pbstrPropertyValue, "HRESULT")
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

        result := ComCall(12, this, BSTR, bstrPropertyName, VARIANT.Ptr, pvarPropertyValue, VARIANT.Ptr, pvarPropertyPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    item(index) {
        pbstrPropertyName := BSTR.Owned()
        result := ComCall(13, this, "int", index, BSTR.Ptr, pbstrPropertyName, "HRESULT")
        return pbstrPropertyName
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontFamily(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(14, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontFamily() {
        p := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontStyle() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontVariant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontVariant() {
        p := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontWeight(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontWeight() {
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fontSize(v) {
        result := ComCall(22, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fontSize() {
        p := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_font(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(24, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_font() {
        p := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_color(v) {
        result := ComCall(26, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_color() {
        p := VARIANT()
        result := ComCall(27, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_background(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(28, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_background() {
        p := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundColor(v) {
        result := ComCall(30, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundColor() {
        p := VARIANT()
        result := ComCall(31, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(32, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundImage() {
        p := BSTR.Owned()
        result := ComCall(33, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(34, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundRepeat() {
        p := BSTR.Owned()
        result := ComCall(35, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundAttachment(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(36, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundAttachment() {
        p := BSTR.Owned()
        result := ComCall(37, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(38, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundPosition() {
        p := BSTR.Owned()
        result := ComCall(39, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundPositionX(v) {
        result := ComCall(40, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionX() {
        p := VARIANT()
        result := ComCall(41, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundPositionY(v) {
        result := ComCall(42, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionY() {
        p := VARIANT()
        result := ComCall(43, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_wordSpacing(v) {
        result := ComCall(44, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_wordSpacing() {
        p := VARIANT()
        result := ComCall(45, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_letterSpacing(v) {
        result := ComCall(46, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_letterSpacing() {
        p := VARIANT()
        result := ComCall(47, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textDecoration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(48, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textDecoration() {
        p := BSTR.Owned()
        result := ComCall(49, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_verticalAlign(v) {
        result := ComCall(50, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_verticalAlign() {
        p := VARIANT()
        result := ComCall(51, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textTransform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(52, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textTransform() {
        p := BSTR.Owned()
        result := ComCall(53, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(54, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlign() {
        p := BSTR.Owned()
        result := ComCall(55, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textIndent(v) {
        result := ComCall(56, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textIndent() {
        p := VARIANT()
        result := ComCall(57, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_lineHeight(v) {
        result := ComCall(58, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_lineHeight() {
        p := VARIANT()
        result := ComCall(59, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginTop(v) {
        result := ComCall(60, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginTop() {
        p := VARIANT()
        result := ComCall(61, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginRight(v) {
        result := ComCall(62, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginRight() {
        p := VARIANT()
        result := ComCall(63, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginBottom(v) {
        result := ComCall(64, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginBottom() {
        p := VARIANT()
        result := ComCall(65, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginLeft(v) {
        result := ComCall(66, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginLeft() {
        p := VARIANT()
        result := ComCall(67, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_margin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(68, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_margin() {
        p := BSTR.Owned()
        result := ComCall(69, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingTop(v) {
        result := ComCall(70, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingTop() {
        p := VARIANT()
        result := ComCall(71, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingRight(v) {
        result := ComCall(72, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingRight() {
        p := VARIANT()
        result := ComCall(73, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingBottom(v) {
        result := ComCall(74, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingBottom() {
        p := VARIANT()
        result := ComCall(75, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingLeft(v) {
        result := ComCall(76, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingLeft() {
        p := VARIANT()
        result := ComCall(77, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_padding(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(78, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_padding() {
        p := BSTR.Owned()
        result := ComCall(79, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(80, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_border() {
        p := BSTR.Owned()
        result := ComCall(81, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTop(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(82, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTop() {
        p := BSTR.Owned()
        result := ComCall(83, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRight(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(84, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderRight() {
        p := BSTR.Owned()
        result := ComCall(85, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottom(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(86, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottom() {
        p := BSTR.Owned()
        result := ComCall(87, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderLeft(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(88, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderLeft() {
        p := BSTR.Owned()
        result := ComCall(89, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(90, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderColor() {
        p := BSTR.Owned()
        result := ComCall(91, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderTopColor(v) {
        result := ComCall(92, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopColor() {
        p := VARIANT()
        result := ComCall(93, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderRightColor(v) {
        result := ComCall(94, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightColor() {
        p := VARIANT()
        result := ComCall(95, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderBottomColor(v) {
        result := ComCall(96, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomColor() {
        p := VARIANT()
        result := ComCall(97, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderLeftColor(v) {
        result := ComCall(98, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftColor() {
        p := VARIANT()
        result := ComCall(99, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderWidth(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(100, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderWidth() {
        p := BSTR.Owned()
        result := ComCall(101, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderTopWidth(v) {
        result := ComCall(102, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopWidth() {
        p := VARIANT()
        result := ComCall(103, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderRightWidth(v) {
        result := ComCall(104, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightWidth() {
        p := VARIANT()
        result := ComCall(105, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderBottomWidth(v) {
        result := ComCall(106, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomWidth() {
        p := VARIANT()
        result := ComCall(107, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderLeftWidth(v) {
        result := ComCall(108, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftWidth() {
        p := VARIANT()
        result := ComCall(109, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(110, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderStyle() {
        p := BSTR.Owned()
        result := ComCall(111, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTopStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(112, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTopStyle() {
        p := BSTR.Owned()
        result := ComCall(113, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRightStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(114, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderRightStyle() {
        p := BSTR.Owned()
        result := ComCall(115, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottomStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(116, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottomStyle() {
        p := BSTR.Owned()
        result := ComCall(117, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderLeftStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(118, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderLeftStyle() {
        p := BSTR.Owned()
        result := ComCall(119, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(120, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(121, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(122, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(123, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_styleFloat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(124, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_styleFloat() {
        p := BSTR.Owned()
        result := ComCall(125, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clear(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(126, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clear() {
        p := BSTR.Owned()
        result := ComCall(127, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_display(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(128, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_display() {
        p := BSTR.Owned()
        result := ComCall(129, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_visibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(130, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_visibility() {
        p := BSTR.Owned()
        result := ComCall(131, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyleType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(132, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleType() {
        p := BSTR.Owned()
        result := ComCall(133, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStylePosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(134, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStylePosition() {
        p := BSTR.Owned()
        result := ComCall(135, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyleImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(136, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleImage() {
        p := BSTR.Owned()
        result := ComCall(137, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(138, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyle() {
        p := BSTR.Owned()
        result := ComCall(139, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_whiteSpace(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(140, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_whiteSpace() {
        p := BSTR.Owned()
        result := ComCall(141, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_top(v) {
        result := ComCall(142, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_top() {
        p := VARIANT()
        result := ComCall(143, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_left(v) {
        result := ComCall(144, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_left() {
        p := VARIANT()
        result := ComCall(145, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_zIndex(v) {
        result := ComCall(146, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_zIndex() {
        p := VARIANT()
        result := ComCall(147, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(148, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflow() {
        p := BSTR.Owned()
        result := ComCall(149, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakBefore(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(150, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakBefore() {
        p := BSTR.Owned()
        result := ComCall(151, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakAfter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(152, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakAfter() {
        p := BSTR.Owned()
        result := ComCall(153, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(154, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cssText() {
        p := BSTR.Owned()
        result := ComCall(155, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cursor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(156, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cursor() {
        p := BSTR.Owned()
        result := ComCall(157, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clip(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(158, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clip() {
        p := BSTR.Owned()
        result := ComCall(159, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_filter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(160, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_filter() {
        p := BSTR.Owned()
        result := ComCall(161, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_tableLayout(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(162, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tableLayout() {
        p := BSTR.Owned()
        result := ComCall(163, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderCollapse(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(164, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderCollapse() {
        p := BSTR.Owned()
        result := ComCall(165, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_direction(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(166, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_direction() {
        p := BSTR.Owned()
        result := ComCall(167, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_behavior(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(168, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_behavior() {
        p := BSTR.Owned()
        result := ComCall(169, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_position(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(170, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_position() {
        p := BSTR.Owned()
        result := ComCall(171, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_unicodeBidi(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(172, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_unicodeBidi() {
        p := BSTR.Owned()
        result := ComCall(173, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bottom(v) {
        result := ComCall(174, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bottom() {
        p := VARIANT()
        result := ComCall(175, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_right(v) {
        result := ComCall(176, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_right() {
        p := VARIANT()
        result := ComCall(177, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_imeMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(178, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_imeMode() {
        p := BSTR.Owned()
        result := ComCall(179, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(180, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyAlign() {
        p := BSTR.Owned()
        result := ComCall(181, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(182, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyPosition() {
        p := BSTR.Owned()
        result := ComCall(183, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_rubyOverhang(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(184, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyOverhang() {
        p := BSTR.Owned()
        result := ComCall(185, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_layoutGridChar(v) {
        result := ComCall(186, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridChar() {
        p := VARIANT()
        result := ComCall(187, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_layoutGridLine(v) {
        result := ComCall(188, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridLine() {
        p := VARIANT()
        result := ComCall(189, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGridMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(190, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridMode() {
        p := BSTR.Owned()
        result := ComCall(191, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGridType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(192, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridType() {
        p := BSTR.Owned()
        result := ComCall(193, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutGrid(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(194, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGrid() {
        p := BSTR.Owned()
        result := ComCall(195, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAutospace(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(196, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAutospace() {
        p := BSTR.Owned()
        result := ComCall(197, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_wordBreak(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(198, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wordBreak() {
        p := BSTR.Owned()
        result := ComCall(199, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lineBreak(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(200, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lineBreak() {
        p := BSTR.Owned()
        result := ComCall(201, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textJustify(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(202, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustify() {
        p := BSTR.Owned()
        result := ComCall(203, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textJustifyTrim(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(204, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustifyTrim() {
        p := BSTR.Owned()
        result := ComCall(205, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textKashida(v) {
        result := ComCall(206, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textKashida() {
        p := VARIANT()
        result := ComCall(207, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflowX(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(208, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowX() {
        p := BSTR.Owned()
        result := ComCall(209, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflowY(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(210, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowY() {
        p := BSTR.Owned()
        result := ComCall(211, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_accelerator(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(212, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accelerator() {
        p := BSTR.Owned()
        result := ComCall(213, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_layoutFlow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(214, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutFlow() {
        p := BSTR.Owned()
        result := ComCall(215, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_zoom(v) {
        result := ComCall(216, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_zoom() {
        p := VARIANT()
        result := ComCall(217, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_wordWrap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(218, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wordWrap() {
        p := BSTR.Owned()
        result := ComCall(219, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textUnderlinePosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(220, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textUnderlinePosition() {
        p := BSTR.Owned()
        result := ComCall(221, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarBaseColor(v) {
        result := ComCall(222, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarBaseColor() {
        p := VARIANT()
        result := ComCall(223, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarFaceColor(v) {
        result := ComCall(224, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarFaceColor() {
        p := VARIANT()
        result := ComCall(225, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbar3dLightColor(v) {
        result := ComCall(226, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbar3dLightColor() {
        p := VARIANT()
        result := ComCall(227, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarShadowColor(v) {
        result := ComCall(228, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarShadowColor() {
        p := VARIANT()
        result := ComCall(229, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarHighlightColor(v) {
        result := ComCall(230, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarHighlightColor() {
        p := VARIANT()
        result := ComCall(231, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarDarkShadowColor(v) {
        result := ComCall(232, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarDarkShadowColor() {
        p := VARIANT()
        result := ComCall(233, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarArrowColor(v) {
        result := ComCall(234, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarArrowColor() {
        p := VARIANT()
        result := ComCall(235, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_scrollbarTrackColor(v) {
        result := ComCall(236, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_scrollbarTrackColor() {
        p := VARIANT()
        result := ComCall(237, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_writingMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(238, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_writingMode() {
        p := BSTR.Owned()
        result := ComCall(239, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlignLast(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(240, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlignLast() {
        p := BSTR.Owned()
        result := ComCall(241, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textKashidaSpace(v) {
        result := ComCall(242, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textKashidaSpace() {
        p := VARIANT()
        result := ComCall(243, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textOverflow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(244, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textOverflow() {
        p := BSTR.Owned()
        result := ComCall(245, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_minHeight(v) {
        result := ComCall(246, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_minHeight() {
        p := VARIANT()
        result := ComCall(247, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msInterpolationMode(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(248, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msInterpolationMode() {
        p := BSTR.Owned()
        result := ComCall(249, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_maxHeight(v) {
        result := ComCall(250, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxHeight() {
        p := VARIANT()
        result := ComCall(251, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_minWidth(v) {
        result := ComCall(252, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_minWidth() {
        p := VARIANT()
        result := ComCall(253, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_maxWidth(v) {
        result := ComCall(254, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_maxWidth() {
        p := VARIANT()
        result := ComCall(255, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_content(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(256, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_content() {
        p := BSTR.Owned()
        result := ComCall(257, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_captionSide(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(258, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_captionSide() {
        p := BSTR.Owned()
        result := ComCall(259, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_counterIncrement(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(260, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_counterIncrement() {
        p := BSTR.Owned()
        result := ComCall(261, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_counterReset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(262, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_counterReset() {
        p := BSTR.Owned()
        result := ComCall(263, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outline(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(264, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outline() {
        p := BSTR.Owned()
        result := ComCall(265, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_outlineWidth(v) {
        result := ComCall(266, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_outlineWidth() {
        p := VARIANT()
        result := ComCall(267, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outlineStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(268, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outlineStyle() {
        p := BSTR.Owned()
        result := ComCall(269, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_outlineColor(v) {
        result := ComCall(270, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_outlineColor() {
        p := VARIANT()
        result := ComCall(271, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_boxSizing(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(272, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_boxSizing() {
        p := BSTR.Owned()
        result := ComCall(273, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderSpacing(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(274, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderSpacing() {
        p := BSTR.Owned()
        result := ComCall(275, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_orphans(v) {
        result := ComCall(276, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_orphans() {
        p := VARIANT()
        result := ComCall(277, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_widows(v) {
        result := ComCall(278, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_widows() {
        p := VARIANT()
        result := ComCall(279, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakInside(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(280, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakInside() {
        p := BSTR.Owned()
        result := ComCall(281, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_emptyCells(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(282, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_emptyCells() {
        p := BSTR.Owned()
        result := ComCall(283, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msBlockProgression(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(284, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msBlockProgression() {
        p := BSTR.Owned()
        result := ComCall(285, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_quotes(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(286, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_quotes() {
        p := BSTR.Owned()
        result := ComCall(287, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_alignmentBaseline(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(288, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alignmentBaseline() {
        p := BSTR.Owned()
        result := ComCall(289, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_baselineShift(v) {
        result := ComCall(290, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_baselineShift() {
        p := VARIANT()
        result := ComCall(291, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dominantBaseline(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(292, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dominantBaseline() {
        p := BSTR.Owned()
        result := ComCall(293, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fontSizeAdjust(v) {
        result := ComCall(294, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fontSizeAdjust() {
        p := VARIANT()
        result := ComCall(295, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontStretch(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(296, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontStretch() {
        p := BSTR.Owned()
        result := ComCall(297, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_opacity(v) {
        result := ComCall(298, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_opacity() {
        p := VARIANT()
        result := ComCall(299, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clipPath(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(300, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clipPath() {
        p := BSTR.Owned()
        result := ComCall(301, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clipRule(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(302, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clipRule() {
        p := BSTR.Owned()
        result := ComCall(303, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fill(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(304, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fill() {
        p := BSTR.Owned()
        result := ComCall(305, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fillOpacity(v) {
        result := ComCall(306, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fillOpacity() {
        p := VARIANT()
        result := ComCall(307, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fillRule(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(308, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fillRule() {
        p := BSTR.Owned()
        result := ComCall(309, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_kerning(v) {
        result := ComCall(310, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_kerning() {
        p := VARIANT()
        result := ComCall(311, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_marker(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(312, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_marker() {
        p := BSTR.Owned()
        result := ComCall(313, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_markerEnd(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(314, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_markerEnd() {
        p := BSTR.Owned()
        result := ComCall(315, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_markerMid(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(316, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_markerMid() {
        p := BSTR.Owned()
        result := ComCall(317, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_markerStart(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(318, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_markerStart() {
        p := BSTR.Owned()
        result := ComCall(319, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_mask(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(320, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_mask() {
        p := BSTR.Owned()
        result := ComCall(321, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pointerEvents(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(322, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pointerEvents() {
        p := BSTR.Owned()
        result := ComCall(323, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_stopColor(v) {
        result := ComCall(324, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_stopColor() {
        p := VARIANT()
        result := ComCall(325, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_stopOpacity(v) {
        result := ComCall(326, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_stopOpacity() {
        p := VARIANT()
        result := ComCall(327, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_stroke(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(328, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_stroke() {
        p := BSTR.Owned()
        result := ComCall(329, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_strokeDasharray(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(330, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_strokeDasharray() {
        p := BSTR.Owned()
        result := ComCall(331, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeDashoffset(v) {
        result := ComCall(332, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_strokeDashoffset() {
        p := VARIANT()
        result := ComCall(333, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_strokeLinecap(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(334, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_strokeLinecap() {
        p := BSTR.Owned()
        result := ComCall(335, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_strokeLinejoin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(336, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_strokeLinejoin() {
        p := BSTR.Owned()
        result := ComCall(337, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeMiterlimit(v) {
        result := ComCall(338, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_strokeMiterlimit() {
        p := VARIANT()
        result := ComCall(339, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeOpacity(v) {
        result := ComCall(340, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_strokeOpacity() {
        p := VARIANT()
        result := ComCall(341, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_strokeWidth(v) {
        result := ComCall(342, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_strokeWidth() {
        p := VARIANT()
        result := ComCall(343, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAnchor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(344, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAnchor() {
        p := BSTR.Owned()
        result := ComCall(345, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_glyphOrientationHorizontal(v) {
        result := ComCall(346, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_glyphOrientationHorizontal() {
        p := VARIANT()
        result := ComCall(347, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_glyphOrientationVertical(v) {
        result := ComCall(348, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_glyphOrientationVertical() {
        p := VARIANT()
        result := ComCall(349, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(350, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderRadius() {
        p := BSTR.Owned()
        result := ComCall(351, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTopLeftRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(352, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTopLeftRadius() {
        p := BSTR.Owned()
        result := ComCall(353, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTopRightRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(354, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTopRightRadius() {
        p := BSTR.Owned()
        result := ComCall(355, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottomRightRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(356, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottomRightRadius() {
        p := BSTR.Owned()
        result := ComCall(357, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottomLeftRadius(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(358, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottomLeftRadius() {
        p := BSTR.Owned()
        result := ComCall(359, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_clipTop(v) {
        result := ComCall(360, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipTop() {
        p := VARIANT()
        result := ComCall(361, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_clipRight(v) {
        result := ComCall(362, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipRight() {
        p := VARIANT()
        result := ComCall(363, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipBottom() {
        p := VARIANT()
        result := ComCall(364, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_clipLeft(v) {
        result := ComCall(365, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipLeft() {
        p := VARIANT()
        result := ComCall(366, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssFloat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(367, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cssFloat() {
        p := BSTR.Owned()
        result := ComCall(368, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundClip(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(369, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundClip() {
        p := BSTR.Owned()
        result := ComCall(370, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(371, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundOrigin() {
        p := BSTR.Owned()
        result := ComCall(372, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundSize(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(373, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundSize() {
        p := BSTR.Owned()
        result := ComCall(374, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_boxShadow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(375, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_boxShadow() {
        p := BSTR.Owned()
        result := ComCall(376, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(377, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransform() {
        p := BSTR.Owned()
        result := ComCall(378, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msTransformOrigin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(379, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msTransformOrigin() {
        p := BSTR.Owned()
        result := ComCall(380, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCSSStyleDeclaration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get_parentRule := CallbackCreate(GetMethod(implObj, "get_parentRule"), flags, 2)
        this.vtbl.getPropertyValue := CallbackCreate(GetMethod(implObj, "getPropertyValue"), flags, 3)
        this.vtbl.getPropertyPriority := CallbackCreate(GetMethod(implObj, "getPropertyPriority"), flags, 3)
        this.vtbl.removeProperty := CallbackCreate(GetMethod(implObj, "removeProperty"), flags, 3)
        this.vtbl.setProperty := CallbackCreate(GetMethod(implObj, "setProperty"), flags, 4)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
        this.vtbl.put_fontFamily := CallbackCreate(GetMethod(implObj, "put_fontFamily"), flags, 2)
        this.vtbl.get_fontFamily := CallbackCreate(GetMethod(implObj, "get_fontFamily"), flags, 2)
        this.vtbl.put_fontStyle := CallbackCreate(GetMethod(implObj, "put_fontStyle"), flags, 2)
        this.vtbl.get_fontStyle := CallbackCreate(GetMethod(implObj, "get_fontStyle"), flags, 2)
        this.vtbl.put_fontVariant := CallbackCreate(GetMethod(implObj, "put_fontVariant"), flags, 2)
        this.vtbl.get_fontVariant := CallbackCreate(GetMethod(implObj, "get_fontVariant"), flags, 2)
        this.vtbl.put_fontWeight := CallbackCreate(GetMethod(implObj, "put_fontWeight"), flags, 2)
        this.vtbl.get_fontWeight := CallbackCreate(GetMethod(implObj, "get_fontWeight"), flags, 2)
        this.vtbl.put_fontSize := CallbackCreate(GetMethod(implObj, "put_fontSize"), flags, 2)
        this.vtbl.get_fontSize := CallbackCreate(GetMethod(implObj, "get_fontSize"), flags, 2)
        this.vtbl.put_font := CallbackCreate(GetMethod(implObj, "put_font"), flags, 2)
        this.vtbl.get_font := CallbackCreate(GetMethod(implObj, "get_font"), flags, 2)
        this.vtbl.put_color := CallbackCreate(GetMethod(implObj, "put_color"), flags, 2)
        this.vtbl.get_color := CallbackCreate(GetMethod(implObj, "get_color"), flags, 2)
        this.vtbl.put_background := CallbackCreate(GetMethod(implObj, "put_background"), flags, 2)
        this.vtbl.get_background := CallbackCreate(GetMethod(implObj, "get_background"), flags, 2)
        this.vtbl.put_backgroundColor := CallbackCreate(GetMethod(implObj, "put_backgroundColor"), flags, 2)
        this.vtbl.get_backgroundColor := CallbackCreate(GetMethod(implObj, "get_backgroundColor"), flags, 2)
        this.vtbl.put_backgroundImage := CallbackCreate(GetMethod(implObj, "put_backgroundImage"), flags, 2)
        this.vtbl.get_backgroundImage := CallbackCreate(GetMethod(implObj, "get_backgroundImage"), flags, 2)
        this.vtbl.put_backgroundRepeat := CallbackCreate(GetMethod(implObj, "put_backgroundRepeat"), flags, 2)
        this.vtbl.get_backgroundRepeat := CallbackCreate(GetMethod(implObj, "get_backgroundRepeat"), flags, 2)
        this.vtbl.put_backgroundAttachment := CallbackCreate(GetMethod(implObj, "put_backgroundAttachment"), flags, 2)
        this.vtbl.get_backgroundAttachment := CallbackCreate(GetMethod(implObj, "get_backgroundAttachment"), flags, 2)
        this.vtbl.put_backgroundPosition := CallbackCreate(GetMethod(implObj, "put_backgroundPosition"), flags, 2)
        this.vtbl.get_backgroundPosition := CallbackCreate(GetMethod(implObj, "get_backgroundPosition"), flags, 2)
        this.vtbl.put_backgroundPositionX := CallbackCreate(GetMethod(implObj, "put_backgroundPositionX"), flags, 2)
        this.vtbl.get_backgroundPositionX := CallbackCreate(GetMethod(implObj, "get_backgroundPositionX"), flags, 2)
        this.vtbl.put_backgroundPositionY := CallbackCreate(GetMethod(implObj, "put_backgroundPositionY"), flags, 2)
        this.vtbl.get_backgroundPositionY := CallbackCreate(GetMethod(implObj, "get_backgroundPositionY"), flags, 2)
        this.vtbl.put_wordSpacing := CallbackCreate(GetMethod(implObj, "put_wordSpacing"), flags, 2)
        this.vtbl.get_wordSpacing := CallbackCreate(GetMethod(implObj, "get_wordSpacing"), flags, 2)
        this.vtbl.put_letterSpacing := CallbackCreate(GetMethod(implObj, "put_letterSpacing"), flags, 2)
        this.vtbl.get_letterSpacing := CallbackCreate(GetMethod(implObj, "get_letterSpacing"), flags, 2)
        this.vtbl.put_textDecoration := CallbackCreate(GetMethod(implObj, "put_textDecoration"), flags, 2)
        this.vtbl.get_textDecoration := CallbackCreate(GetMethod(implObj, "get_textDecoration"), flags, 2)
        this.vtbl.put_verticalAlign := CallbackCreate(GetMethod(implObj, "put_verticalAlign"), flags, 2)
        this.vtbl.get_verticalAlign := CallbackCreate(GetMethod(implObj, "get_verticalAlign"), flags, 2)
        this.vtbl.put_textTransform := CallbackCreate(GetMethod(implObj, "put_textTransform"), flags, 2)
        this.vtbl.get_textTransform := CallbackCreate(GetMethod(implObj, "get_textTransform"), flags, 2)
        this.vtbl.put_textAlign := CallbackCreate(GetMethod(implObj, "put_textAlign"), flags, 2)
        this.vtbl.get_textAlign := CallbackCreate(GetMethod(implObj, "get_textAlign"), flags, 2)
        this.vtbl.put_textIndent := CallbackCreate(GetMethod(implObj, "put_textIndent"), flags, 2)
        this.vtbl.get_textIndent := CallbackCreate(GetMethod(implObj, "get_textIndent"), flags, 2)
        this.vtbl.put_lineHeight := CallbackCreate(GetMethod(implObj, "put_lineHeight"), flags, 2)
        this.vtbl.get_lineHeight := CallbackCreate(GetMethod(implObj, "get_lineHeight"), flags, 2)
        this.vtbl.put_marginTop := CallbackCreate(GetMethod(implObj, "put_marginTop"), flags, 2)
        this.vtbl.get_marginTop := CallbackCreate(GetMethod(implObj, "get_marginTop"), flags, 2)
        this.vtbl.put_marginRight := CallbackCreate(GetMethod(implObj, "put_marginRight"), flags, 2)
        this.vtbl.get_marginRight := CallbackCreate(GetMethod(implObj, "get_marginRight"), flags, 2)
        this.vtbl.put_marginBottom := CallbackCreate(GetMethod(implObj, "put_marginBottom"), flags, 2)
        this.vtbl.get_marginBottom := CallbackCreate(GetMethod(implObj, "get_marginBottom"), flags, 2)
        this.vtbl.put_marginLeft := CallbackCreate(GetMethod(implObj, "put_marginLeft"), flags, 2)
        this.vtbl.get_marginLeft := CallbackCreate(GetMethod(implObj, "get_marginLeft"), flags, 2)
        this.vtbl.put_margin := CallbackCreate(GetMethod(implObj, "put_margin"), flags, 2)
        this.vtbl.get_margin := CallbackCreate(GetMethod(implObj, "get_margin"), flags, 2)
        this.vtbl.put_paddingTop := CallbackCreate(GetMethod(implObj, "put_paddingTop"), flags, 2)
        this.vtbl.get_paddingTop := CallbackCreate(GetMethod(implObj, "get_paddingTop"), flags, 2)
        this.vtbl.put_paddingRight := CallbackCreate(GetMethod(implObj, "put_paddingRight"), flags, 2)
        this.vtbl.get_paddingRight := CallbackCreate(GetMethod(implObj, "get_paddingRight"), flags, 2)
        this.vtbl.put_paddingBottom := CallbackCreate(GetMethod(implObj, "put_paddingBottom"), flags, 2)
        this.vtbl.get_paddingBottom := CallbackCreate(GetMethod(implObj, "get_paddingBottom"), flags, 2)
        this.vtbl.put_paddingLeft := CallbackCreate(GetMethod(implObj, "put_paddingLeft"), flags, 2)
        this.vtbl.get_paddingLeft := CallbackCreate(GetMethod(implObj, "get_paddingLeft"), flags, 2)
        this.vtbl.put_padding := CallbackCreate(GetMethod(implObj, "put_padding"), flags, 2)
        this.vtbl.get_padding := CallbackCreate(GetMethod(implObj, "get_padding"), flags, 2)
        this.vtbl.put_border := CallbackCreate(GetMethod(implObj, "put_border"), flags, 2)
        this.vtbl.get_border := CallbackCreate(GetMethod(implObj, "get_border"), flags, 2)
        this.vtbl.put_borderTop := CallbackCreate(GetMethod(implObj, "put_borderTop"), flags, 2)
        this.vtbl.get_borderTop := CallbackCreate(GetMethod(implObj, "get_borderTop"), flags, 2)
        this.vtbl.put_borderRight := CallbackCreate(GetMethod(implObj, "put_borderRight"), flags, 2)
        this.vtbl.get_borderRight := CallbackCreate(GetMethod(implObj, "get_borderRight"), flags, 2)
        this.vtbl.put_borderBottom := CallbackCreate(GetMethod(implObj, "put_borderBottom"), flags, 2)
        this.vtbl.get_borderBottom := CallbackCreate(GetMethod(implObj, "get_borderBottom"), flags, 2)
        this.vtbl.put_borderLeft := CallbackCreate(GetMethod(implObj, "put_borderLeft"), flags, 2)
        this.vtbl.get_borderLeft := CallbackCreate(GetMethod(implObj, "get_borderLeft"), flags, 2)
        this.vtbl.put_borderColor := CallbackCreate(GetMethod(implObj, "put_borderColor"), flags, 2)
        this.vtbl.get_borderColor := CallbackCreate(GetMethod(implObj, "get_borderColor"), flags, 2)
        this.vtbl.put_borderTopColor := CallbackCreate(GetMethod(implObj, "put_borderTopColor"), flags, 2)
        this.vtbl.get_borderTopColor := CallbackCreate(GetMethod(implObj, "get_borderTopColor"), flags, 2)
        this.vtbl.put_borderRightColor := CallbackCreate(GetMethod(implObj, "put_borderRightColor"), flags, 2)
        this.vtbl.get_borderRightColor := CallbackCreate(GetMethod(implObj, "get_borderRightColor"), flags, 2)
        this.vtbl.put_borderBottomColor := CallbackCreate(GetMethod(implObj, "put_borderBottomColor"), flags, 2)
        this.vtbl.get_borderBottomColor := CallbackCreate(GetMethod(implObj, "get_borderBottomColor"), flags, 2)
        this.vtbl.put_borderLeftColor := CallbackCreate(GetMethod(implObj, "put_borderLeftColor"), flags, 2)
        this.vtbl.get_borderLeftColor := CallbackCreate(GetMethod(implObj, "get_borderLeftColor"), flags, 2)
        this.vtbl.put_borderWidth := CallbackCreate(GetMethod(implObj, "put_borderWidth"), flags, 2)
        this.vtbl.get_borderWidth := CallbackCreate(GetMethod(implObj, "get_borderWidth"), flags, 2)
        this.vtbl.put_borderTopWidth := CallbackCreate(GetMethod(implObj, "put_borderTopWidth"), flags, 2)
        this.vtbl.get_borderTopWidth := CallbackCreate(GetMethod(implObj, "get_borderTopWidth"), flags, 2)
        this.vtbl.put_borderRightWidth := CallbackCreate(GetMethod(implObj, "put_borderRightWidth"), flags, 2)
        this.vtbl.get_borderRightWidth := CallbackCreate(GetMethod(implObj, "get_borderRightWidth"), flags, 2)
        this.vtbl.put_borderBottomWidth := CallbackCreate(GetMethod(implObj, "put_borderBottomWidth"), flags, 2)
        this.vtbl.get_borderBottomWidth := CallbackCreate(GetMethod(implObj, "get_borderBottomWidth"), flags, 2)
        this.vtbl.put_borderLeftWidth := CallbackCreate(GetMethod(implObj, "put_borderLeftWidth"), flags, 2)
        this.vtbl.get_borderLeftWidth := CallbackCreate(GetMethod(implObj, "get_borderLeftWidth"), flags, 2)
        this.vtbl.put_borderStyle := CallbackCreate(GetMethod(implObj, "put_borderStyle"), flags, 2)
        this.vtbl.get_borderStyle := CallbackCreate(GetMethod(implObj, "get_borderStyle"), flags, 2)
        this.vtbl.put_borderTopStyle := CallbackCreate(GetMethod(implObj, "put_borderTopStyle"), flags, 2)
        this.vtbl.get_borderTopStyle := CallbackCreate(GetMethod(implObj, "get_borderTopStyle"), flags, 2)
        this.vtbl.put_borderRightStyle := CallbackCreate(GetMethod(implObj, "put_borderRightStyle"), flags, 2)
        this.vtbl.get_borderRightStyle := CallbackCreate(GetMethod(implObj, "get_borderRightStyle"), flags, 2)
        this.vtbl.put_borderBottomStyle := CallbackCreate(GetMethod(implObj, "put_borderBottomStyle"), flags, 2)
        this.vtbl.get_borderBottomStyle := CallbackCreate(GetMethod(implObj, "get_borderBottomStyle"), flags, 2)
        this.vtbl.put_borderLeftStyle := CallbackCreate(GetMethod(implObj, "put_borderLeftStyle"), flags, 2)
        this.vtbl.get_borderLeftStyle := CallbackCreate(GetMethod(implObj, "get_borderLeftStyle"), flags, 2)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.put_styleFloat := CallbackCreate(GetMethod(implObj, "put_styleFloat"), flags, 2)
        this.vtbl.get_styleFloat := CallbackCreate(GetMethod(implObj, "get_styleFloat"), flags, 2)
        this.vtbl.put_clear := CallbackCreate(GetMethod(implObj, "put_clear"), flags, 2)
        this.vtbl.get_clear := CallbackCreate(GetMethod(implObj, "get_clear"), flags, 2)
        this.vtbl.put_display := CallbackCreate(GetMethod(implObj, "put_display"), flags, 2)
        this.vtbl.get_display := CallbackCreate(GetMethod(implObj, "get_display"), flags, 2)
        this.vtbl.put_visibility := CallbackCreate(GetMethod(implObj, "put_visibility"), flags, 2)
        this.vtbl.get_visibility := CallbackCreate(GetMethod(implObj, "get_visibility"), flags, 2)
        this.vtbl.put_listStyleType := CallbackCreate(GetMethod(implObj, "put_listStyleType"), flags, 2)
        this.vtbl.get_listStyleType := CallbackCreate(GetMethod(implObj, "get_listStyleType"), flags, 2)
        this.vtbl.put_listStylePosition := CallbackCreate(GetMethod(implObj, "put_listStylePosition"), flags, 2)
        this.vtbl.get_listStylePosition := CallbackCreate(GetMethod(implObj, "get_listStylePosition"), flags, 2)
        this.vtbl.put_listStyleImage := CallbackCreate(GetMethod(implObj, "put_listStyleImage"), flags, 2)
        this.vtbl.get_listStyleImage := CallbackCreate(GetMethod(implObj, "get_listStyleImage"), flags, 2)
        this.vtbl.put_listStyle := CallbackCreate(GetMethod(implObj, "put_listStyle"), flags, 2)
        this.vtbl.get_listStyle := CallbackCreate(GetMethod(implObj, "get_listStyle"), flags, 2)
        this.vtbl.put_whiteSpace := CallbackCreate(GetMethod(implObj, "put_whiteSpace"), flags, 2)
        this.vtbl.get_whiteSpace := CallbackCreate(GetMethod(implObj, "get_whiteSpace"), flags, 2)
        this.vtbl.put_top := CallbackCreate(GetMethod(implObj, "put_top"), flags, 2)
        this.vtbl.get_top := CallbackCreate(GetMethod(implObj, "get_top"), flags, 2)
        this.vtbl.put_left := CallbackCreate(GetMethod(implObj, "put_left"), flags, 2)
        this.vtbl.get_left := CallbackCreate(GetMethod(implObj, "get_left"), flags, 2)
        this.vtbl.put_zIndex := CallbackCreate(GetMethod(implObj, "put_zIndex"), flags, 2)
        this.vtbl.get_zIndex := CallbackCreate(GetMethod(implObj, "get_zIndex"), flags, 2)
        this.vtbl.put_overflow := CallbackCreate(GetMethod(implObj, "put_overflow"), flags, 2)
        this.vtbl.get_overflow := CallbackCreate(GetMethod(implObj, "get_overflow"), flags, 2)
        this.vtbl.put_pageBreakBefore := CallbackCreate(GetMethod(implObj, "put_pageBreakBefore"), flags, 2)
        this.vtbl.get_pageBreakBefore := CallbackCreate(GetMethod(implObj, "get_pageBreakBefore"), flags, 2)
        this.vtbl.put_pageBreakAfter := CallbackCreate(GetMethod(implObj, "put_pageBreakAfter"), flags, 2)
        this.vtbl.get_pageBreakAfter := CallbackCreate(GetMethod(implObj, "get_pageBreakAfter"), flags, 2)
        this.vtbl.put_cssText := CallbackCreate(GetMethod(implObj, "put_cssText"), flags, 2)
        this.vtbl.get_cssText := CallbackCreate(GetMethod(implObj, "get_cssText"), flags, 2)
        this.vtbl.put_cursor := CallbackCreate(GetMethod(implObj, "put_cursor"), flags, 2)
        this.vtbl.get_cursor := CallbackCreate(GetMethod(implObj, "get_cursor"), flags, 2)
        this.vtbl.put_clip := CallbackCreate(GetMethod(implObj, "put_clip"), flags, 2)
        this.vtbl.get_clip := CallbackCreate(GetMethod(implObj, "get_clip"), flags, 2)
        this.vtbl.put_filter := CallbackCreate(GetMethod(implObj, "put_filter"), flags, 2)
        this.vtbl.get_filter := CallbackCreate(GetMethod(implObj, "get_filter"), flags, 2)
        this.vtbl.put_tableLayout := CallbackCreate(GetMethod(implObj, "put_tableLayout"), flags, 2)
        this.vtbl.get_tableLayout := CallbackCreate(GetMethod(implObj, "get_tableLayout"), flags, 2)
        this.vtbl.put_borderCollapse := CallbackCreate(GetMethod(implObj, "put_borderCollapse"), flags, 2)
        this.vtbl.get_borderCollapse := CallbackCreate(GetMethod(implObj, "get_borderCollapse"), flags, 2)
        this.vtbl.put_direction := CallbackCreate(GetMethod(implObj, "put_direction"), flags, 2)
        this.vtbl.get_direction := CallbackCreate(GetMethod(implObj, "get_direction"), flags, 2)
        this.vtbl.put_behavior := CallbackCreate(GetMethod(implObj, "put_behavior"), flags, 2)
        this.vtbl.get_behavior := CallbackCreate(GetMethod(implObj, "get_behavior"), flags, 2)
        this.vtbl.put_position := CallbackCreate(GetMethod(implObj, "put_position"), flags, 2)
        this.vtbl.get_position := CallbackCreate(GetMethod(implObj, "get_position"), flags, 2)
        this.vtbl.put_unicodeBidi := CallbackCreate(GetMethod(implObj, "put_unicodeBidi"), flags, 2)
        this.vtbl.get_unicodeBidi := CallbackCreate(GetMethod(implObj, "get_unicodeBidi"), flags, 2)
        this.vtbl.put_bottom := CallbackCreate(GetMethod(implObj, "put_bottom"), flags, 2)
        this.vtbl.get_bottom := CallbackCreate(GetMethod(implObj, "get_bottom"), flags, 2)
        this.vtbl.put_right := CallbackCreate(GetMethod(implObj, "put_right"), flags, 2)
        this.vtbl.get_right := CallbackCreate(GetMethod(implObj, "get_right"), flags, 2)
        this.vtbl.put_imeMode := CallbackCreate(GetMethod(implObj, "put_imeMode"), flags, 2)
        this.vtbl.get_imeMode := CallbackCreate(GetMethod(implObj, "get_imeMode"), flags, 2)
        this.vtbl.put_rubyAlign := CallbackCreate(GetMethod(implObj, "put_rubyAlign"), flags, 2)
        this.vtbl.get_rubyAlign := CallbackCreate(GetMethod(implObj, "get_rubyAlign"), flags, 2)
        this.vtbl.put_rubyPosition := CallbackCreate(GetMethod(implObj, "put_rubyPosition"), flags, 2)
        this.vtbl.get_rubyPosition := CallbackCreate(GetMethod(implObj, "get_rubyPosition"), flags, 2)
        this.vtbl.put_rubyOverhang := CallbackCreate(GetMethod(implObj, "put_rubyOverhang"), flags, 2)
        this.vtbl.get_rubyOverhang := CallbackCreate(GetMethod(implObj, "get_rubyOverhang"), flags, 2)
        this.vtbl.put_layoutGridChar := CallbackCreate(GetMethod(implObj, "put_layoutGridChar"), flags, 2)
        this.vtbl.get_layoutGridChar := CallbackCreate(GetMethod(implObj, "get_layoutGridChar"), flags, 2)
        this.vtbl.put_layoutGridLine := CallbackCreate(GetMethod(implObj, "put_layoutGridLine"), flags, 2)
        this.vtbl.get_layoutGridLine := CallbackCreate(GetMethod(implObj, "get_layoutGridLine"), flags, 2)
        this.vtbl.put_layoutGridMode := CallbackCreate(GetMethod(implObj, "put_layoutGridMode"), flags, 2)
        this.vtbl.get_layoutGridMode := CallbackCreate(GetMethod(implObj, "get_layoutGridMode"), flags, 2)
        this.vtbl.put_layoutGridType := CallbackCreate(GetMethod(implObj, "put_layoutGridType"), flags, 2)
        this.vtbl.get_layoutGridType := CallbackCreate(GetMethod(implObj, "get_layoutGridType"), flags, 2)
        this.vtbl.put_layoutGrid := CallbackCreate(GetMethod(implObj, "put_layoutGrid"), flags, 2)
        this.vtbl.get_layoutGrid := CallbackCreate(GetMethod(implObj, "get_layoutGrid"), flags, 2)
        this.vtbl.put_textAutospace := CallbackCreate(GetMethod(implObj, "put_textAutospace"), flags, 2)
        this.vtbl.get_textAutospace := CallbackCreate(GetMethod(implObj, "get_textAutospace"), flags, 2)
        this.vtbl.put_wordBreak := CallbackCreate(GetMethod(implObj, "put_wordBreak"), flags, 2)
        this.vtbl.get_wordBreak := CallbackCreate(GetMethod(implObj, "get_wordBreak"), flags, 2)
        this.vtbl.put_lineBreak := CallbackCreate(GetMethod(implObj, "put_lineBreak"), flags, 2)
        this.vtbl.get_lineBreak := CallbackCreate(GetMethod(implObj, "get_lineBreak"), flags, 2)
        this.vtbl.put_textJustify := CallbackCreate(GetMethod(implObj, "put_textJustify"), flags, 2)
        this.vtbl.get_textJustify := CallbackCreate(GetMethod(implObj, "get_textJustify"), flags, 2)
        this.vtbl.put_textJustifyTrim := CallbackCreate(GetMethod(implObj, "put_textJustifyTrim"), flags, 2)
        this.vtbl.get_textJustifyTrim := CallbackCreate(GetMethod(implObj, "get_textJustifyTrim"), flags, 2)
        this.vtbl.put_textKashida := CallbackCreate(GetMethod(implObj, "put_textKashida"), flags, 2)
        this.vtbl.get_textKashida := CallbackCreate(GetMethod(implObj, "get_textKashida"), flags, 2)
        this.vtbl.put_overflowX := CallbackCreate(GetMethod(implObj, "put_overflowX"), flags, 2)
        this.vtbl.get_overflowX := CallbackCreate(GetMethod(implObj, "get_overflowX"), flags, 2)
        this.vtbl.put_overflowY := CallbackCreate(GetMethod(implObj, "put_overflowY"), flags, 2)
        this.vtbl.get_overflowY := CallbackCreate(GetMethod(implObj, "get_overflowY"), flags, 2)
        this.vtbl.put_accelerator := CallbackCreate(GetMethod(implObj, "put_accelerator"), flags, 2)
        this.vtbl.get_accelerator := CallbackCreate(GetMethod(implObj, "get_accelerator"), flags, 2)
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
        this.vtbl.put_textOverflow := CallbackCreate(GetMethod(implObj, "put_textOverflow"), flags, 2)
        this.vtbl.get_textOverflow := CallbackCreate(GetMethod(implObj, "get_textOverflow"), flags, 2)
        this.vtbl.put_minHeight := CallbackCreate(GetMethod(implObj, "put_minHeight"), flags, 2)
        this.vtbl.get_minHeight := CallbackCreate(GetMethod(implObj, "get_minHeight"), flags, 2)
        this.vtbl.put_msInterpolationMode := CallbackCreate(GetMethod(implObj, "put_msInterpolationMode"), flags, 2)
        this.vtbl.get_msInterpolationMode := CallbackCreate(GetMethod(implObj, "get_msInterpolationMode"), flags, 2)
        this.vtbl.put_maxHeight := CallbackCreate(GetMethod(implObj, "put_maxHeight"), flags, 2)
        this.vtbl.get_maxHeight := CallbackCreate(GetMethod(implObj, "get_maxHeight"), flags, 2)
        this.vtbl.put_minWidth := CallbackCreate(GetMethod(implObj, "put_minWidth"), flags, 2)
        this.vtbl.get_minWidth := CallbackCreate(GetMethod(implObj, "get_minWidth"), flags, 2)
        this.vtbl.put_maxWidth := CallbackCreate(GetMethod(implObj, "put_maxWidth"), flags, 2)
        this.vtbl.get_maxWidth := CallbackCreate(GetMethod(implObj, "get_maxWidth"), flags, 2)
        this.vtbl.put_content := CallbackCreate(GetMethod(implObj, "put_content"), flags, 2)
        this.vtbl.get_content := CallbackCreate(GetMethod(implObj, "get_content"), flags, 2)
        this.vtbl.put_captionSide := CallbackCreate(GetMethod(implObj, "put_captionSide"), flags, 2)
        this.vtbl.get_captionSide := CallbackCreate(GetMethod(implObj, "get_captionSide"), flags, 2)
        this.vtbl.put_counterIncrement := CallbackCreate(GetMethod(implObj, "put_counterIncrement"), flags, 2)
        this.vtbl.get_counterIncrement := CallbackCreate(GetMethod(implObj, "get_counterIncrement"), flags, 2)
        this.vtbl.put_counterReset := CallbackCreate(GetMethod(implObj, "put_counterReset"), flags, 2)
        this.vtbl.get_counterReset := CallbackCreate(GetMethod(implObj, "get_counterReset"), flags, 2)
        this.vtbl.put_outline := CallbackCreate(GetMethod(implObj, "put_outline"), flags, 2)
        this.vtbl.get_outline := CallbackCreate(GetMethod(implObj, "get_outline"), flags, 2)
        this.vtbl.put_outlineWidth := CallbackCreate(GetMethod(implObj, "put_outlineWidth"), flags, 2)
        this.vtbl.get_outlineWidth := CallbackCreate(GetMethod(implObj, "get_outlineWidth"), flags, 2)
        this.vtbl.put_outlineStyle := CallbackCreate(GetMethod(implObj, "put_outlineStyle"), flags, 2)
        this.vtbl.get_outlineStyle := CallbackCreate(GetMethod(implObj, "get_outlineStyle"), flags, 2)
        this.vtbl.put_outlineColor := CallbackCreate(GetMethod(implObj, "put_outlineColor"), flags, 2)
        this.vtbl.get_outlineColor := CallbackCreate(GetMethod(implObj, "get_outlineColor"), flags, 2)
        this.vtbl.put_boxSizing := CallbackCreate(GetMethod(implObj, "put_boxSizing"), flags, 2)
        this.vtbl.get_boxSizing := CallbackCreate(GetMethod(implObj, "get_boxSizing"), flags, 2)
        this.vtbl.put_borderSpacing := CallbackCreate(GetMethod(implObj, "put_borderSpacing"), flags, 2)
        this.vtbl.get_borderSpacing := CallbackCreate(GetMethod(implObj, "get_borderSpacing"), flags, 2)
        this.vtbl.put_orphans := CallbackCreate(GetMethod(implObj, "put_orphans"), flags, 2)
        this.vtbl.get_orphans := CallbackCreate(GetMethod(implObj, "get_orphans"), flags, 2)
        this.vtbl.put_widows := CallbackCreate(GetMethod(implObj, "put_widows"), flags, 2)
        this.vtbl.get_widows := CallbackCreate(GetMethod(implObj, "get_widows"), flags, 2)
        this.vtbl.put_pageBreakInside := CallbackCreate(GetMethod(implObj, "put_pageBreakInside"), flags, 2)
        this.vtbl.get_pageBreakInside := CallbackCreate(GetMethod(implObj, "get_pageBreakInside"), flags, 2)
        this.vtbl.put_emptyCells := CallbackCreate(GetMethod(implObj, "put_emptyCells"), flags, 2)
        this.vtbl.get_emptyCells := CallbackCreate(GetMethod(implObj, "get_emptyCells"), flags, 2)
        this.vtbl.put_msBlockProgression := CallbackCreate(GetMethod(implObj, "put_msBlockProgression"), flags, 2)
        this.vtbl.get_msBlockProgression := CallbackCreate(GetMethod(implObj, "get_msBlockProgression"), flags, 2)
        this.vtbl.put_quotes := CallbackCreate(GetMethod(implObj, "put_quotes"), flags, 2)
        this.vtbl.get_quotes := CallbackCreate(GetMethod(implObj, "get_quotes"), flags, 2)
        this.vtbl.put_alignmentBaseline := CallbackCreate(GetMethod(implObj, "put_alignmentBaseline"), flags, 2)
        this.vtbl.get_alignmentBaseline := CallbackCreate(GetMethod(implObj, "get_alignmentBaseline"), flags, 2)
        this.vtbl.put_baselineShift := CallbackCreate(GetMethod(implObj, "put_baselineShift"), flags, 2)
        this.vtbl.get_baselineShift := CallbackCreate(GetMethod(implObj, "get_baselineShift"), flags, 2)
        this.vtbl.put_dominantBaseline := CallbackCreate(GetMethod(implObj, "put_dominantBaseline"), flags, 2)
        this.vtbl.get_dominantBaseline := CallbackCreate(GetMethod(implObj, "get_dominantBaseline"), flags, 2)
        this.vtbl.put_fontSizeAdjust := CallbackCreate(GetMethod(implObj, "put_fontSizeAdjust"), flags, 2)
        this.vtbl.get_fontSizeAdjust := CallbackCreate(GetMethod(implObj, "get_fontSizeAdjust"), flags, 2)
        this.vtbl.put_fontStretch := CallbackCreate(GetMethod(implObj, "put_fontStretch"), flags, 2)
        this.vtbl.get_fontStretch := CallbackCreate(GetMethod(implObj, "get_fontStretch"), flags, 2)
        this.vtbl.put_opacity := CallbackCreate(GetMethod(implObj, "put_opacity"), flags, 2)
        this.vtbl.get_opacity := CallbackCreate(GetMethod(implObj, "get_opacity"), flags, 2)
        this.vtbl.put_clipPath := CallbackCreate(GetMethod(implObj, "put_clipPath"), flags, 2)
        this.vtbl.get_clipPath := CallbackCreate(GetMethod(implObj, "get_clipPath"), flags, 2)
        this.vtbl.put_clipRule := CallbackCreate(GetMethod(implObj, "put_clipRule"), flags, 2)
        this.vtbl.get_clipRule := CallbackCreate(GetMethod(implObj, "get_clipRule"), flags, 2)
        this.vtbl.put_fill := CallbackCreate(GetMethod(implObj, "put_fill"), flags, 2)
        this.vtbl.get_fill := CallbackCreate(GetMethod(implObj, "get_fill"), flags, 2)
        this.vtbl.put_fillOpacity := CallbackCreate(GetMethod(implObj, "put_fillOpacity"), flags, 2)
        this.vtbl.get_fillOpacity := CallbackCreate(GetMethod(implObj, "get_fillOpacity"), flags, 2)
        this.vtbl.put_fillRule := CallbackCreate(GetMethod(implObj, "put_fillRule"), flags, 2)
        this.vtbl.get_fillRule := CallbackCreate(GetMethod(implObj, "get_fillRule"), flags, 2)
        this.vtbl.put_kerning := CallbackCreate(GetMethod(implObj, "put_kerning"), flags, 2)
        this.vtbl.get_kerning := CallbackCreate(GetMethod(implObj, "get_kerning"), flags, 2)
        this.vtbl.put_marker := CallbackCreate(GetMethod(implObj, "put_marker"), flags, 2)
        this.vtbl.get_marker := CallbackCreate(GetMethod(implObj, "get_marker"), flags, 2)
        this.vtbl.put_markerEnd := CallbackCreate(GetMethod(implObj, "put_markerEnd"), flags, 2)
        this.vtbl.get_markerEnd := CallbackCreate(GetMethod(implObj, "get_markerEnd"), flags, 2)
        this.vtbl.put_markerMid := CallbackCreate(GetMethod(implObj, "put_markerMid"), flags, 2)
        this.vtbl.get_markerMid := CallbackCreate(GetMethod(implObj, "get_markerMid"), flags, 2)
        this.vtbl.put_markerStart := CallbackCreate(GetMethod(implObj, "put_markerStart"), flags, 2)
        this.vtbl.get_markerStart := CallbackCreate(GetMethod(implObj, "get_markerStart"), flags, 2)
        this.vtbl.put_mask := CallbackCreate(GetMethod(implObj, "put_mask"), flags, 2)
        this.vtbl.get_mask := CallbackCreate(GetMethod(implObj, "get_mask"), flags, 2)
        this.vtbl.put_pointerEvents := CallbackCreate(GetMethod(implObj, "put_pointerEvents"), flags, 2)
        this.vtbl.get_pointerEvents := CallbackCreate(GetMethod(implObj, "get_pointerEvents"), flags, 2)
        this.vtbl.put_stopColor := CallbackCreate(GetMethod(implObj, "put_stopColor"), flags, 2)
        this.vtbl.get_stopColor := CallbackCreate(GetMethod(implObj, "get_stopColor"), flags, 2)
        this.vtbl.put_stopOpacity := CallbackCreate(GetMethod(implObj, "put_stopOpacity"), flags, 2)
        this.vtbl.get_stopOpacity := CallbackCreate(GetMethod(implObj, "get_stopOpacity"), flags, 2)
        this.vtbl.put_stroke := CallbackCreate(GetMethod(implObj, "put_stroke"), flags, 2)
        this.vtbl.get_stroke := CallbackCreate(GetMethod(implObj, "get_stroke"), flags, 2)
        this.vtbl.put_strokeDasharray := CallbackCreate(GetMethod(implObj, "put_strokeDasharray"), flags, 2)
        this.vtbl.get_strokeDasharray := CallbackCreate(GetMethod(implObj, "get_strokeDasharray"), flags, 2)
        this.vtbl.put_strokeDashoffset := CallbackCreate(GetMethod(implObj, "put_strokeDashoffset"), flags, 2)
        this.vtbl.get_strokeDashoffset := CallbackCreate(GetMethod(implObj, "get_strokeDashoffset"), flags, 2)
        this.vtbl.put_strokeLinecap := CallbackCreate(GetMethod(implObj, "put_strokeLinecap"), flags, 2)
        this.vtbl.get_strokeLinecap := CallbackCreate(GetMethod(implObj, "get_strokeLinecap"), flags, 2)
        this.vtbl.put_strokeLinejoin := CallbackCreate(GetMethod(implObj, "put_strokeLinejoin"), flags, 2)
        this.vtbl.get_strokeLinejoin := CallbackCreate(GetMethod(implObj, "get_strokeLinejoin"), flags, 2)
        this.vtbl.put_strokeMiterlimit := CallbackCreate(GetMethod(implObj, "put_strokeMiterlimit"), flags, 2)
        this.vtbl.get_strokeMiterlimit := CallbackCreate(GetMethod(implObj, "get_strokeMiterlimit"), flags, 2)
        this.vtbl.put_strokeOpacity := CallbackCreate(GetMethod(implObj, "put_strokeOpacity"), flags, 2)
        this.vtbl.get_strokeOpacity := CallbackCreate(GetMethod(implObj, "get_strokeOpacity"), flags, 2)
        this.vtbl.put_strokeWidth := CallbackCreate(GetMethod(implObj, "put_strokeWidth"), flags, 2)
        this.vtbl.get_strokeWidth := CallbackCreate(GetMethod(implObj, "get_strokeWidth"), flags, 2)
        this.vtbl.put_textAnchor := CallbackCreate(GetMethod(implObj, "put_textAnchor"), flags, 2)
        this.vtbl.get_textAnchor := CallbackCreate(GetMethod(implObj, "get_textAnchor"), flags, 2)
        this.vtbl.put_glyphOrientationHorizontal := CallbackCreate(GetMethod(implObj, "put_glyphOrientationHorizontal"), flags, 2)
        this.vtbl.get_glyphOrientationHorizontal := CallbackCreate(GetMethod(implObj, "get_glyphOrientationHorizontal"), flags, 2)
        this.vtbl.put_glyphOrientationVertical := CallbackCreate(GetMethod(implObj, "put_glyphOrientationVertical"), flags, 2)
        this.vtbl.get_glyphOrientationVertical := CallbackCreate(GetMethod(implObj, "get_glyphOrientationVertical"), flags, 2)
        this.vtbl.put_borderRadius := CallbackCreate(GetMethod(implObj, "put_borderRadius"), flags, 2)
        this.vtbl.get_borderRadius := CallbackCreate(GetMethod(implObj, "get_borderRadius"), flags, 2)
        this.vtbl.put_borderTopLeftRadius := CallbackCreate(GetMethod(implObj, "put_borderTopLeftRadius"), flags, 2)
        this.vtbl.get_borderTopLeftRadius := CallbackCreate(GetMethod(implObj, "get_borderTopLeftRadius"), flags, 2)
        this.vtbl.put_borderTopRightRadius := CallbackCreate(GetMethod(implObj, "put_borderTopRightRadius"), flags, 2)
        this.vtbl.get_borderTopRightRadius := CallbackCreate(GetMethod(implObj, "get_borderTopRightRadius"), flags, 2)
        this.vtbl.put_borderBottomRightRadius := CallbackCreate(GetMethod(implObj, "put_borderBottomRightRadius"), flags, 2)
        this.vtbl.get_borderBottomRightRadius := CallbackCreate(GetMethod(implObj, "get_borderBottomRightRadius"), flags, 2)
        this.vtbl.put_borderBottomLeftRadius := CallbackCreate(GetMethod(implObj, "put_borderBottomLeftRadius"), flags, 2)
        this.vtbl.get_borderBottomLeftRadius := CallbackCreate(GetMethod(implObj, "get_borderBottomLeftRadius"), flags, 2)
        this.vtbl.put_clipTop := CallbackCreate(GetMethod(implObj, "put_clipTop"), flags, 2)
        this.vtbl.get_clipTop := CallbackCreate(GetMethod(implObj, "get_clipTop"), flags, 2)
        this.vtbl.put_clipRight := CallbackCreate(GetMethod(implObj, "put_clipRight"), flags, 2)
        this.vtbl.get_clipRight := CallbackCreate(GetMethod(implObj, "get_clipRight"), flags, 2)
        this.vtbl.get_clipBottom := CallbackCreate(GetMethod(implObj, "get_clipBottom"), flags, 2)
        this.vtbl.put_clipLeft := CallbackCreate(GetMethod(implObj, "put_clipLeft"), flags, 2)
        this.vtbl.get_clipLeft := CallbackCreate(GetMethod(implObj, "get_clipLeft"), flags, 2)
        this.vtbl.put_cssFloat := CallbackCreate(GetMethod(implObj, "put_cssFloat"), flags, 2)
        this.vtbl.get_cssFloat := CallbackCreate(GetMethod(implObj, "get_cssFloat"), flags, 2)
        this.vtbl.put_backgroundClip := CallbackCreate(GetMethod(implObj, "put_backgroundClip"), flags, 2)
        this.vtbl.get_backgroundClip := CallbackCreate(GetMethod(implObj, "get_backgroundClip"), flags, 2)
        this.vtbl.put_backgroundOrigin := CallbackCreate(GetMethod(implObj, "put_backgroundOrigin"), flags, 2)
        this.vtbl.get_backgroundOrigin := CallbackCreate(GetMethod(implObj, "get_backgroundOrigin"), flags, 2)
        this.vtbl.put_backgroundSize := CallbackCreate(GetMethod(implObj, "put_backgroundSize"), flags, 2)
        this.vtbl.get_backgroundSize := CallbackCreate(GetMethod(implObj, "get_backgroundSize"), flags, 2)
        this.vtbl.put_boxShadow := CallbackCreate(GetMethod(implObj, "put_boxShadow"), flags, 2)
        this.vtbl.get_boxShadow := CallbackCreate(GetMethod(implObj, "get_boxShadow"), flags, 2)
        this.vtbl.put_msTransform := CallbackCreate(GetMethod(implObj, "put_msTransform"), flags, 2)
        this.vtbl.get_msTransform := CallbackCreate(GetMethod(implObj, "get_msTransform"), flags, 2)
        this.vtbl.put_msTransformOrigin := CallbackCreate(GetMethod(implObj, "put_msTransformOrigin"), flags, 2)
        this.vtbl.get_msTransformOrigin := CallbackCreate(GetMethod(implObj, "get_msTransformOrigin"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get_parentRule)
        CallbackFree(this.vtbl.getPropertyValue)
        CallbackFree(this.vtbl.getPropertyPriority)
        CallbackFree(this.vtbl.removeProperty)
        CallbackFree(this.vtbl.setProperty)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.put_fontFamily)
        CallbackFree(this.vtbl.get_fontFamily)
        CallbackFree(this.vtbl.put_fontStyle)
        CallbackFree(this.vtbl.get_fontStyle)
        CallbackFree(this.vtbl.put_fontVariant)
        CallbackFree(this.vtbl.get_fontVariant)
        CallbackFree(this.vtbl.put_fontWeight)
        CallbackFree(this.vtbl.get_fontWeight)
        CallbackFree(this.vtbl.put_fontSize)
        CallbackFree(this.vtbl.get_fontSize)
        CallbackFree(this.vtbl.put_font)
        CallbackFree(this.vtbl.get_font)
        CallbackFree(this.vtbl.put_color)
        CallbackFree(this.vtbl.get_color)
        CallbackFree(this.vtbl.put_background)
        CallbackFree(this.vtbl.get_background)
        CallbackFree(this.vtbl.put_backgroundColor)
        CallbackFree(this.vtbl.get_backgroundColor)
        CallbackFree(this.vtbl.put_backgroundImage)
        CallbackFree(this.vtbl.get_backgroundImage)
        CallbackFree(this.vtbl.put_backgroundRepeat)
        CallbackFree(this.vtbl.get_backgroundRepeat)
        CallbackFree(this.vtbl.put_backgroundAttachment)
        CallbackFree(this.vtbl.get_backgroundAttachment)
        CallbackFree(this.vtbl.put_backgroundPosition)
        CallbackFree(this.vtbl.get_backgroundPosition)
        CallbackFree(this.vtbl.put_backgroundPositionX)
        CallbackFree(this.vtbl.get_backgroundPositionX)
        CallbackFree(this.vtbl.put_backgroundPositionY)
        CallbackFree(this.vtbl.get_backgroundPositionY)
        CallbackFree(this.vtbl.put_wordSpacing)
        CallbackFree(this.vtbl.get_wordSpacing)
        CallbackFree(this.vtbl.put_letterSpacing)
        CallbackFree(this.vtbl.get_letterSpacing)
        CallbackFree(this.vtbl.put_textDecoration)
        CallbackFree(this.vtbl.get_textDecoration)
        CallbackFree(this.vtbl.put_verticalAlign)
        CallbackFree(this.vtbl.get_verticalAlign)
        CallbackFree(this.vtbl.put_textTransform)
        CallbackFree(this.vtbl.get_textTransform)
        CallbackFree(this.vtbl.put_textAlign)
        CallbackFree(this.vtbl.get_textAlign)
        CallbackFree(this.vtbl.put_textIndent)
        CallbackFree(this.vtbl.get_textIndent)
        CallbackFree(this.vtbl.put_lineHeight)
        CallbackFree(this.vtbl.get_lineHeight)
        CallbackFree(this.vtbl.put_marginTop)
        CallbackFree(this.vtbl.get_marginTop)
        CallbackFree(this.vtbl.put_marginRight)
        CallbackFree(this.vtbl.get_marginRight)
        CallbackFree(this.vtbl.put_marginBottom)
        CallbackFree(this.vtbl.get_marginBottom)
        CallbackFree(this.vtbl.put_marginLeft)
        CallbackFree(this.vtbl.get_marginLeft)
        CallbackFree(this.vtbl.put_margin)
        CallbackFree(this.vtbl.get_margin)
        CallbackFree(this.vtbl.put_paddingTop)
        CallbackFree(this.vtbl.get_paddingTop)
        CallbackFree(this.vtbl.put_paddingRight)
        CallbackFree(this.vtbl.get_paddingRight)
        CallbackFree(this.vtbl.put_paddingBottom)
        CallbackFree(this.vtbl.get_paddingBottom)
        CallbackFree(this.vtbl.put_paddingLeft)
        CallbackFree(this.vtbl.get_paddingLeft)
        CallbackFree(this.vtbl.put_padding)
        CallbackFree(this.vtbl.get_padding)
        CallbackFree(this.vtbl.put_border)
        CallbackFree(this.vtbl.get_border)
        CallbackFree(this.vtbl.put_borderTop)
        CallbackFree(this.vtbl.get_borderTop)
        CallbackFree(this.vtbl.put_borderRight)
        CallbackFree(this.vtbl.get_borderRight)
        CallbackFree(this.vtbl.put_borderBottom)
        CallbackFree(this.vtbl.get_borderBottom)
        CallbackFree(this.vtbl.put_borderLeft)
        CallbackFree(this.vtbl.get_borderLeft)
        CallbackFree(this.vtbl.put_borderColor)
        CallbackFree(this.vtbl.get_borderColor)
        CallbackFree(this.vtbl.put_borderTopColor)
        CallbackFree(this.vtbl.get_borderTopColor)
        CallbackFree(this.vtbl.put_borderRightColor)
        CallbackFree(this.vtbl.get_borderRightColor)
        CallbackFree(this.vtbl.put_borderBottomColor)
        CallbackFree(this.vtbl.get_borderBottomColor)
        CallbackFree(this.vtbl.put_borderLeftColor)
        CallbackFree(this.vtbl.get_borderLeftColor)
        CallbackFree(this.vtbl.put_borderWidth)
        CallbackFree(this.vtbl.get_borderWidth)
        CallbackFree(this.vtbl.put_borderTopWidth)
        CallbackFree(this.vtbl.get_borderTopWidth)
        CallbackFree(this.vtbl.put_borderRightWidth)
        CallbackFree(this.vtbl.get_borderRightWidth)
        CallbackFree(this.vtbl.put_borderBottomWidth)
        CallbackFree(this.vtbl.get_borderBottomWidth)
        CallbackFree(this.vtbl.put_borderLeftWidth)
        CallbackFree(this.vtbl.get_borderLeftWidth)
        CallbackFree(this.vtbl.put_borderStyle)
        CallbackFree(this.vtbl.get_borderStyle)
        CallbackFree(this.vtbl.put_borderTopStyle)
        CallbackFree(this.vtbl.get_borderTopStyle)
        CallbackFree(this.vtbl.put_borderRightStyle)
        CallbackFree(this.vtbl.get_borderRightStyle)
        CallbackFree(this.vtbl.put_borderBottomStyle)
        CallbackFree(this.vtbl.get_borderBottomStyle)
        CallbackFree(this.vtbl.put_borderLeftStyle)
        CallbackFree(this.vtbl.get_borderLeftStyle)
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.put_styleFloat)
        CallbackFree(this.vtbl.get_styleFloat)
        CallbackFree(this.vtbl.put_clear)
        CallbackFree(this.vtbl.get_clear)
        CallbackFree(this.vtbl.put_display)
        CallbackFree(this.vtbl.get_display)
        CallbackFree(this.vtbl.put_visibility)
        CallbackFree(this.vtbl.get_visibility)
        CallbackFree(this.vtbl.put_listStyleType)
        CallbackFree(this.vtbl.get_listStyleType)
        CallbackFree(this.vtbl.put_listStylePosition)
        CallbackFree(this.vtbl.get_listStylePosition)
        CallbackFree(this.vtbl.put_listStyleImage)
        CallbackFree(this.vtbl.get_listStyleImage)
        CallbackFree(this.vtbl.put_listStyle)
        CallbackFree(this.vtbl.get_listStyle)
        CallbackFree(this.vtbl.put_whiteSpace)
        CallbackFree(this.vtbl.get_whiteSpace)
        CallbackFree(this.vtbl.put_top)
        CallbackFree(this.vtbl.get_top)
        CallbackFree(this.vtbl.put_left)
        CallbackFree(this.vtbl.get_left)
        CallbackFree(this.vtbl.put_zIndex)
        CallbackFree(this.vtbl.get_zIndex)
        CallbackFree(this.vtbl.put_overflow)
        CallbackFree(this.vtbl.get_overflow)
        CallbackFree(this.vtbl.put_pageBreakBefore)
        CallbackFree(this.vtbl.get_pageBreakBefore)
        CallbackFree(this.vtbl.put_pageBreakAfter)
        CallbackFree(this.vtbl.get_pageBreakAfter)
        CallbackFree(this.vtbl.put_cssText)
        CallbackFree(this.vtbl.get_cssText)
        CallbackFree(this.vtbl.put_cursor)
        CallbackFree(this.vtbl.get_cursor)
        CallbackFree(this.vtbl.put_clip)
        CallbackFree(this.vtbl.get_clip)
        CallbackFree(this.vtbl.put_filter)
        CallbackFree(this.vtbl.get_filter)
        CallbackFree(this.vtbl.put_tableLayout)
        CallbackFree(this.vtbl.get_tableLayout)
        CallbackFree(this.vtbl.put_borderCollapse)
        CallbackFree(this.vtbl.get_borderCollapse)
        CallbackFree(this.vtbl.put_direction)
        CallbackFree(this.vtbl.get_direction)
        CallbackFree(this.vtbl.put_behavior)
        CallbackFree(this.vtbl.get_behavior)
        CallbackFree(this.vtbl.put_position)
        CallbackFree(this.vtbl.get_position)
        CallbackFree(this.vtbl.put_unicodeBidi)
        CallbackFree(this.vtbl.get_unicodeBidi)
        CallbackFree(this.vtbl.put_bottom)
        CallbackFree(this.vtbl.get_bottom)
        CallbackFree(this.vtbl.put_right)
        CallbackFree(this.vtbl.get_right)
        CallbackFree(this.vtbl.put_imeMode)
        CallbackFree(this.vtbl.get_imeMode)
        CallbackFree(this.vtbl.put_rubyAlign)
        CallbackFree(this.vtbl.get_rubyAlign)
        CallbackFree(this.vtbl.put_rubyPosition)
        CallbackFree(this.vtbl.get_rubyPosition)
        CallbackFree(this.vtbl.put_rubyOverhang)
        CallbackFree(this.vtbl.get_rubyOverhang)
        CallbackFree(this.vtbl.put_layoutGridChar)
        CallbackFree(this.vtbl.get_layoutGridChar)
        CallbackFree(this.vtbl.put_layoutGridLine)
        CallbackFree(this.vtbl.get_layoutGridLine)
        CallbackFree(this.vtbl.put_layoutGridMode)
        CallbackFree(this.vtbl.get_layoutGridMode)
        CallbackFree(this.vtbl.put_layoutGridType)
        CallbackFree(this.vtbl.get_layoutGridType)
        CallbackFree(this.vtbl.put_layoutGrid)
        CallbackFree(this.vtbl.get_layoutGrid)
        CallbackFree(this.vtbl.put_textAutospace)
        CallbackFree(this.vtbl.get_textAutospace)
        CallbackFree(this.vtbl.put_wordBreak)
        CallbackFree(this.vtbl.get_wordBreak)
        CallbackFree(this.vtbl.put_lineBreak)
        CallbackFree(this.vtbl.get_lineBreak)
        CallbackFree(this.vtbl.put_textJustify)
        CallbackFree(this.vtbl.get_textJustify)
        CallbackFree(this.vtbl.put_textJustifyTrim)
        CallbackFree(this.vtbl.get_textJustifyTrim)
        CallbackFree(this.vtbl.put_textKashida)
        CallbackFree(this.vtbl.get_textKashida)
        CallbackFree(this.vtbl.put_overflowX)
        CallbackFree(this.vtbl.get_overflowX)
        CallbackFree(this.vtbl.put_overflowY)
        CallbackFree(this.vtbl.get_overflowY)
        CallbackFree(this.vtbl.put_accelerator)
        CallbackFree(this.vtbl.get_accelerator)
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
        CallbackFree(this.vtbl.put_textOverflow)
        CallbackFree(this.vtbl.get_textOverflow)
        CallbackFree(this.vtbl.put_minHeight)
        CallbackFree(this.vtbl.get_minHeight)
        CallbackFree(this.vtbl.put_msInterpolationMode)
        CallbackFree(this.vtbl.get_msInterpolationMode)
        CallbackFree(this.vtbl.put_maxHeight)
        CallbackFree(this.vtbl.get_maxHeight)
        CallbackFree(this.vtbl.put_minWidth)
        CallbackFree(this.vtbl.get_minWidth)
        CallbackFree(this.vtbl.put_maxWidth)
        CallbackFree(this.vtbl.get_maxWidth)
        CallbackFree(this.vtbl.put_content)
        CallbackFree(this.vtbl.get_content)
        CallbackFree(this.vtbl.put_captionSide)
        CallbackFree(this.vtbl.get_captionSide)
        CallbackFree(this.vtbl.put_counterIncrement)
        CallbackFree(this.vtbl.get_counterIncrement)
        CallbackFree(this.vtbl.put_counterReset)
        CallbackFree(this.vtbl.get_counterReset)
        CallbackFree(this.vtbl.put_outline)
        CallbackFree(this.vtbl.get_outline)
        CallbackFree(this.vtbl.put_outlineWidth)
        CallbackFree(this.vtbl.get_outlineWidth)
        CallbackFree(this.vtbl.put_outlineStyle)
        CallbackFree(this.vtbl.get_outlineStyle)
        CallbackFree(this.vtbl.put_outlineColor)
        CallbackFree(this.vtbl.get_outlineColor)
        CallbackFree(this.vtbl.put_boxSizing)
        CallbackFree(this.vtbl.get_boxSizing)
        CallbackFree(this.vtbl.put_borderSpacing)
        CallbackFree(this.vtbl.get_borderSpacing)
        CallbackFree(this.vtbl.put_orphans)
        CallbackFree(this.vtbl.get_orphans)
        CallbackFree(this.vtbl.put_widows)
        CallbackFree(this.vtbl.get_widows)
        CallbackFree(this.vtbl.put_pageBreakInside)
        CallbackFree(this.vtbl.get_pageBreakInside)
        CallbackFree(this.vtbl.put_emptyCells)
        CallbackFree(this.vtbl.get_emptyCells)
        CallbackFree(this.vtbl.put_msBlockProgression)
        CallbackFree(this.vtbl.get_msBlockProgression)
        CallbackFree(this.vtbl.put_quotes)
        CallbackFree(this.vtbl.get_quotes)
        CallbackFree(this.vtbl.put_alignmentBaseline)
        CallbackFree(this.vtbl.get_alignmentBaseline)
        CallbackFree(this.vtbl.put_baselineShift)
        CallbackFree(this.vtbl.get_baselineShift)
        CallbackFree(this.vtbl.put_dominantBaseline)
        CallbackFree(this.vtbl.get_dominantBaseline)
        CallbackFree(this.vtbl.put_fontSizeAdjust)
        CallbackFree(this.vtbl.get_fontSizeAdjust)
        CallbackFree(this.vtbl.put_fontStretch)
        CallbackFree(this.vtbl.get_fontStretch)
        CallbackFree(this.vtbl.put_opacity)
        CallbackFree(this.vtbl.get_opacity)
        CallbackFree(this.vtbl.put_clipPath)
        CallbackFree(this.vtbl.get_clipPath)
        CallbackFree(this.vtbl.put_clipRule)
        CallbackFree(this.vtbl.get_clipRule)
        CallbackFree(this.vtbl.put_fill)
        CallbackFree(this.vtbl.get_fill)
        CallbackFree(this.vtbl.put_fillOpacity)
        CallbackFree(this.vtbl.get_fillOpacity)
        CallbackFree(this.vtbl.put_fillRule)
        CallbackFree(this.vtbl.get_fillRule)
        CallbackFree(this.vtbl.put_kerning)
        CallbackFree(this.vtbl.get_kerning)
        CallbackFree(this.vtbl.put_marker)
        CallbackFree(this.vtbl.get_marker)
        CallbackFree(this.vtbl.put_markerEnd)
        CallbackFree(this.vtbl.get_markerEnd)
        CallbackFree(this.vtbl.put_markerMid)
        CallbackFree(this.vtbl.get_markerMid)
        CallbackFree(this.vtbl.put_markerStart)
        CallbackFree(this.vtbl.get_markerStart)
        CallbackFree(this.vtbl.put_mask)
        CallbackFree(this.vtbl.get_mask)
        CallbackFree(this.vtbl.put_pointerEvents)
        CallbackFree(this.vtbl.get_pointerEvents)
        CallbackFree(this.vtbl.put_stopColor)
        CallbackFree(this.vtbl.get_stopColor)
        CallbackFree(this.vtbl.put_stopOpacity)
        CallbackFree(this.vtbl.get_stopOpacity)
        CallbackFree(this.vtbl.put_stroke)
        CallbackFree(this.vtbl.get_stroke)
        CallbackFree(this.vtbl.put_strokeDasharray)
        CallbackFree(this.vtbl.get_strokeDasharray)
        CallbackFree(this.vtbl.put_strokeDashoffset)
        CallbackFree(this.vtbl.get_strokeDashoffset)
        CallbackFree(this.vtbl.put_strokeLinecap)
        CallbackFree(this.vtbl.get_strokeLinecap)
        CallbackFree(this.vtbl.put_strokeLinejoin)
        CallbackFree(this.vtbl.get_strokeLinejoin)
        CallbackFree(this.vtbl.put_strokeMiterlimit)
        CallbackFree(this.vtbl.get_strokeMiterlimit)
        CallbackFree(this.vtbl.put_strokeOpacity)
        CallbackFree(this.vtbl.get_strokeOpacity)
        CallbackFree(this.vtbl.put_strokeWidth)
        CallbackFree(this.vtbl.get_strokeWidth)
        CallbackFree(this.vtbl.put_textAnchor)
        CallbackFree(this.vtbl.get_textAnchor)
        CallbackFree(this.vtbl.put_glyphOrientationHorizontal)
        CallbackFree(this.vtbl.get_glyphOrientationHorizontal)
        CallbackFree(this.vtbl.put_glyphOrientationVertical)
        CallbackFree(this.vtbl.get_glyphOrientationVertical)
        CallbackFree(this.vtbl.put_borderRadius)
        CallbackFree(this.vtbl.get_borderRadius)
        CallbackFree(this.vtbl.put_borderTopLeftRadius)
        CallbackFree(this.vtbl.get_borderTopLeftRadius)
        CallbackFree(this.vtbl.put_borderTopRightRadius)
        CallbackFree(this.vtbl.get_borderTopRightRadius)
        CallbackFree(this.vtbl.put_borderBottomRightRadius)
        CallbackFree(this.vtbl.get_borderBottomRightRadius)
        CallbackFree(this.vtbl.put_borderBottomLeftRadius)
        CallbackFree(this.vtbl.get_borderBottomLeftRadius)
        CallbackFree(this.vtbl.put_clipTop)
        CallbackFree(this.vtbl.get_clipTop)
        CallbackFree(this.vtbl.put_clipRight)
        CallbackFree(this.vtbl.get_clipRight)
        CallbackFree(this.vtbl.get_clipBottom)
        CallbackFree(this.vtbl.put_clipLeft)
        CallbackFree(this.vtbl.get_clipLeft)
        CallbackFree(this.vtbl.put_cssFloat)
        CallbackFree(this.vtbl.get_cssFloat)
        CallbackFree(this.vtbl.put_backgroundClip)
        CallbackFree(this.vtbl.get_backgroundClip)
        CallbackFree(this.vtbl.put_backgroundOrigin)
        CallbackFree(this.vtbl.get_backgroundOrigin)
        CallbackFree(this.vtbl.put_backgroundSize)
        CallbackFree(this.vtbl.get_backgroundSize)
        CallbackFree(this.vtbl.put_boxShadow)
        CallbackFree(this.vtbl.get_boxShadow)
        CallbackFree(this.vtbl.put_msTransform)
        CallbackFree(this.vtbl.get_msTransform)
        CallbackFree(this.vtbl.put_msTransformOrigin)
        CallbackFree(this.vtbl.get_msTransformOrigin)
    }
}
