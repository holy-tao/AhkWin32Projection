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
export default struct IHTMLStyle extends IDispatch {
    /**
     * The interface identifier for IHTMLStyle
     * @type {Guid}
     */
    static IID := Guid("{3050f25e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyle
     * @type {Guid}
     */
    static CLSID := Guid("{3050f285-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyle interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_fontFamily                : IntPtr
        get_fontFamily                : IntPtr
        put_fontStyle                 : IntPtr
        get_fontStyle                 : IntPtr
        put_fontVariant               : IntPtr
        get_fontVariant               : IntPtr
        put_fontWeight                : IntPtr
        get_fontWeight                : IntPtr
        put_fontSize                  : IntPtr
        get_fontSize                  : IntPtr
        put_font                      : IntPtr
        get_font                      : IntPtr
        put_color                     : IntPtr
        get_color                     : IntPtr
        put_background                : IntPtr
        get_background                : IntPtr
        put_backgroundColor           : IntPtr
        get_backgroundColor           : IntPtr
        put_backgroundImage           : IntPtr
        get_backgroundImage           : IntPtr
        put_backgroundRepeat          : IntPtr
        get_backgroundRepeat          : IntPtr
        put_backgroundAttachment      : IntPtr
        get_backgroundAttachment      : IntPtr
        put_backgroundPosition        : IntPtr
        get_backgroundPosition        : IntPtr
        put_backgroundPositionX       : IntPtr
        get_backgroundPositionX       : IntPtr
        put_backgroundPositionY       : IntPtr
        get_backgroundPositionY       : IntPtr
        put_wordSpacing               : IntPtr
        get_wordSpacing               : IntPtr
        put_letterSpacing             : IntPtr
        get_letterSpacing             : IntPtr
        put_textDecoration            : IntPtr
        get_textDecoration            : IntPtr
        put_textDecorationNone        : IntPtr
        get_textDecorationNone        : IntPtr
        put_textDecorationUnderline   : IntPtr
        get_textDecorationUnderline   : IntPtr
        put_textDecorationOverline    : IntPtr
        get_textDecorationOverline    : IntPtr
        put_textDecorationLineThrough : IntPtr
        get_textDecorationLineThrough : IntPtr
        put_textDecorationBlink       : IntPtr
        get_textDecorationBlink       : IntPtr
        put_verticalAlign             : IntPtr
        get_verticalAlign             : IntPtr
        put_textTransform             : IntPtr
        get_textTransform             : IntPtr
        put_textAlign                 : IntPtr
        get_textAlign                 : IntPtr
        put_textIndent                : IntPtr
        get_textIndent                : IntPtr
        put_lineHeight                : IntPtr
        get_lineHeight                : IntPtr
        put_marginTop                 : IntPtr
        get_marginTop                 : IntPtr
        put_marginRight               : IntPtr
        get_marginRight               : IntPtr
        put_marginBottom              : IntPtr
        get_marginBottom              : IntPtr
        put_marginLeft                : IntPtr
        get_marginLeft                : IntPtr
        put_margin                    : IntPtr
        get_margin                    : IntPtr
        put_paddingTop                : IntPtr
        get_paddingTop                : IntPtr
        put_paddingRight              : IntPtr
        get_paddingRight              : IntPtr
        put_paddingBottom             : IntPtr
        get_paddingBottom             : IntPtr
        put_paddingLeft               : IntPtr
        get_paddingLeft               : IntPtr
        put_padding                   : IntPtr
        get_padding                   : IntPtr
        put_border                    : IntPtr
        get_border                    : IntPtr
        put_borderTop                 : IntPtr
        get_borderTop                 : IntPtr
        put_borderRight               : IntPtr
        get_borderRight               : IntPtr
        put_borderBottom              : IntPtr
        get_borderBottom              : IntPtr
        put_borderLeft                : IntPtr
        get_borderLeft                : IntPtr
        put_borderColor               : IntPtr
        get_borderColor               : IntPtr
        put_borderTopColor            : IntPtr
        get_borderTopColor            : IntPtr
        put_borderRightColor          : IntPtr
        get_borderRightColor          : IntPtr
        put_borderBottomColor         : IntPtr
        get_borderBottomColor         : IntPtr
        put_borderLeftColor           : IntPtr
        get_borderLeftColor           : IntPtr
        put_borderWidth               : IntPtr
        get_borderWidth               : IntPtr
        put_borderTopWidth            : IntPtr
        get_borderTopWidth            : IntPtr
        put_borderRightWidth          : IntPtr
        get_borderRightWidth          : IntPtr
        put_borderBottomWidth         : IntPtr
        get_borderBottomWidth         : IntPtr
        put_borderLeftWidth           : IntPtr
        get_borderLeftWidth           : IntPtr
        put_borderStyle               : IntPtr
        get_borderStyle               : IntPtr
        put_borderTopStyle            : IntPtr
        get_borderTopStyle            : IntPtr
        put_borderRightStyle          : IntPtr
        get_borderRightStyle          : IntPtr
        put_borderBottomStyle         : IntPtr
        get_borderBottomStyle         : IntPtr
        put_borderLeftStyle           : IntPtr
        get_borderLeftStyle           : IntPtr
        put_width                     : IntPtr
        get_width                     : IntPtr
        put_height                    : IntPtr
        get_height                    : IntPtr
        put_styleFloat                : IntPtr
        get_styleFloat                : IntPtr
        put_clear                     : IntPtr
        get_clear                     : IntPtr
        put_display                   : IntPtr
        get_display                   : IntPtr
        put_visibility                : IntPtr
        get_visibility                : IntPtr
        put_listStyleType             : IntPtr
        get_listStyleType             : IntPtr
        put_listStylePosition         : IntPtr
        get_listStylePosition         : IntPtr
        put_listStyleImage            : IntPtr
        get_listStyleImage            : IntPtr
        put_listStyle                 : IntPtr
        get_listStyle                 : IntPtr
        put_whiteSpace                : IntPtr
        get_whiteSpace                : IntPtr
        put_top                       : IntPtr
        get_top                       : IntPtr
        put_left                      : IntPtr
        get_left                      : IntPtr
        get_position                  : IntPtr
        put_zIndex                    : IntPtr
        get_zIndex                    : IntPtr
        put_overflow                  : IntPtr
        get_overflow                  : IntPtr
        put_pageBreakBefore           : IntPtr
        get_pageBreakBefore           : IntPtr
        put_pageBreakAfter            : IntPtr
        get_pageBreakAfter            : IntPtr
        put_cssText                   : IntPtr
        get_cssText                   : IntPtr
        put_pixelTop                  : IntPtr
        get_pixelTop                  : IntPtr
        put_pixelLeft                 : IntPtr
        get_pixelLeft                 : IntPtr
        put_pixelWidth                : IntPtr
        get_pixelWidth                : IntPtr
        put_pixelHeight               : IntPtr
        get_pixelHeight               : IntPtr
        put_posTop                    : IntPtr
        get_posTop                    : IntPtr
        put_posLeft                   : IntPtr
        get_posLeft                   : IntPtr
        put_posWidth                  : IntPtr
        get_posWidth                  : IntPtr
        put_posHeight                 : IntPtr
        get_posHeight                 : IntPtr
        put_cursor                    : IntPtr
        get_cursor                    : IntPtr
        put_clip                      : IntPtr
        get_clip                      : IntPtr
        put_filter                    : IntPtr
        get_filter                    : IntPtr
        setAttribute                  : IntPtr
        getAttribute                  : IntPtr
        removeAttribute               : IntPtr
        toString                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyle.Vtbl()
        }
        super.__New(implObj, flags)
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
     * @type {VARIANT_BOOL} 
     */
    textDecorationNone {
        get => this.get_textDecorationNone()
        set => this.put_textDecorationNone(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    textDecorationUnderline {
        get => this.get_textDecorationUnderline()
        set => this.put_textDecorationUnderline(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    textDecorationOverline {
        get => this.get_textDecorationOverline()
        set => this.put_textDecorationOverline(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    textDecorationLineThrough {
        get => this.get_textDecorationLineThrough()
        set => this.put_textDecorationLineThrough(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    textDecorationBlink {
        get => this.get_textDecorationBlink()
        set => this.put_textDecorationBlink(value)
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
     * @type {BSTR} 
     */
    position {
        get => this.get_position()
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
     * @type {Integer} 
     */
    pixelTop {
        get => this.get_pixelTop()
        set => this.put_pixelTop(value)
    }

    /**
     * @type {Integer} 
     */
    pixelLeft {
        get => this.get_pixelLeft()
        set => this.put_pixelLeft(value)
    }

    /**
     * @type {Integer} 
     */
    pixelWidth {
        get => this.get_pixelWidth()
        set => this.put_pixelWidth(value)
    }

    /**
     * @type {Integer} 
     */
    pixelHeight {
        get => this.get_pixelHeight()
        set => this.put_pixelHeight(value)
    }

    /**
     * @type {Float} 
     */
    posTop {
        get => this.get_posTop()
        set => this.put_posTop(value)
    }

    /**
     * @type {Float} 
     */
    posLeft {
        get => this.get_posLeft()
        set => this.put_posLeft(value)
    }

    /**
     * @type {Float} 
     */
    posWidth {
        get => this.get_posWidth()
        set => this.put_posWidth(value)
    }

    /**
     * @type {Float} 
     */
    posHeight {
        get => this.get_posHeight()
        set => this.put_posHeight(value)
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
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontFamily(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontFamily() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontStyle() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontVariant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontVariant() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_fontWeight(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontWeight() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_fontSize(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fontSize() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_font(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_font() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_color(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_color() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_background(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_background() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundColor(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundColor() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundImage() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundRepeat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundRepeat() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundAttachment(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundAttachment() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_backgroundPosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundPosition() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundPositionX(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionX() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_backgroundPositionY(v) {
        result := ComCall(35, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionY() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_wordSpacing(v) {
        result := ComCall(37, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_wordSpacing() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_letterSpacing(v) {
        result := ComCall(39, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_letterSpacing() {
        p := VARIANT()
        result := ComCall(40, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textDecoration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(41, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textDecoration() {
        p := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationNone(v) {
        result := ComCall(43, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationNone() {
        result := ComCall(44, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationUnderline(v) {
        result := ComCall(45, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationUnderline() {
        result := ComCall(46, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationOverline(v) {
        result := ComCall(47, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationOverline() {
        result := ComCall(48, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationLineThrough(v) {
        result := ComCall(49, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationLineThrough() {
        result := ComCall(50, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_textDecorationBlink(v) {
        result := ComCall(51, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_textDecorationBlink() {
        result := ComCall(52, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_verticalAlign(v) {
        result := ComCall(53, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_verticalAlign() {
        p := VARIANT()
        result := ComCall(54, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textTransform(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(55, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textTransform() {
        p := BSTR.Owned()
        result := ComCall(56, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(57, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlign() {
        p := BSTR.Owned()
        result := ComCall(58, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textIndent(v) {
        result := ComCall(59, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textIndent() {
        p := VARIANT()
        result := ComCall(60, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_lineHeight(v) {
        result := ComCall(61, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_lineHeight() {
        p := VARIANT()
        result := ComCall(62, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginTop(v) {
        result := ComCall(63, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginTop() {
        p := VARIANT()
        result := ComCall(64, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginRight(v) {
        result := ComCall(65, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginRight() {
        p := VARIANT()
        result := ComCall(66, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginBottom(v) {
        result := ComCall(67, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginBottom() {
        p := VARIANT()
        result := ComCall(68, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_marginLeft(v) {
        result := ComCall(69, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginLeft() {
        p := VARIANT()
        result := ComCall(70, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_margin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(71, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_margin() {
        p := BSTR.Owned()
        result := ComCall(72, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingTop(v) {
        result := ComCall(73, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingTop() {
        p := VARIANT()
        result := ComCall(74, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingRight(v) {
        result := ComCall(75, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingRight() {
        p := VARIANT()
        result := ComCall(76, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingBottom(v) {
        result := ComCall(77, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingBottom() {
        p := VARIANT()
        result := ComCall(78, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_paddingLeft(v) {
        result := ComCall(79, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingLeft() {
        p := VARIANT()
        result := ComCall(80, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_padding(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(81, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_padding() {
        p := BSTR.Owned()
        result := ComCall(82, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(83, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_border() {
        p := BSTR.Owned()
        result := ComCall(84, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTop(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(85, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTop() {
        p := BSTR.Owned()
        result := ComCall(86, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRight(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(87, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderRight() {
        p := BSTR.Owned()
        result := ComCall(88, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottom(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(89, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottom() {
        p := BSTR.Owned()
        result := ComCall(90, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderLeft(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(91, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderLeft() {
        p := BSTR.Owned()
        result := ComCall(92, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(93, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderColor() {
        p := BSTR.Owned()
        result := ComCall(94, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderTopColor(v) {
        result := ComCall(95, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopColor() {
        p := VARIANT()
        result := ComCall(96, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderRightColor(v) {
        result := ComCall(97, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightColor() {
        p := VARIANT()
        result := ComCall(98, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderBottomColor(v) {
        result := ComCall(99, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomColor() {
        p := VARIANT()
        result := ComCall(100, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderLeftColor(v) {
        result := ComCall(101, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftColor() {
        p := VARIANT()
        result := ComCall(102, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderWidth(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(103, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderWidth() {
        p := BSTR.Owned()
        result := ComCall(104, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderTopWidth(v) {
        result := ComCall(105, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopWidth() {
        p := VARIANT()
        result := ComCall(106, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderRightWidth(v) {
        result := ComCall(107, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightWidth() {
        p := VARIANT()
        result := ComCall(108, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderBottomWidth(v) {
        result := ComCall(109, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomWidth() {
        p := VARIANT()
        result := ComCall(110, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderLeftWidth(v) {
        result := ComCall(111, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftWidth() {
        p := VARIANT()
        result := ComCall(112, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(113, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderStyle() {
        p := BSTR.Owned()
        result := ComCall(114, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderTopStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(115, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTopStyle() {
        p := BSTR.Owned()
        result := ComCall(116, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderRightStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(117, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderRightStyle() {
        p := BSTR.Owned()
        result := ComCall(118, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderBottomStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(119, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottomStyle() {
        p := BSTR.Owned()
        result := ComCall(120, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderLeftStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(121, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderLeftStyle() {
        p := BSTR.Owned()
        result := ComCall(122, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(123, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(124, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(125, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(126, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_styleFloat(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(127, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_styleFloat() {
        p := BSTR.Owned()
        result := ComCall(128, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clear(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(129, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clear() {
        p := BSTR.Owned()
        result := ComCall(130, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_display(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(131, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_display() {
        p := BSTR.Owned()
        result := ComCall(132, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_visibility(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(133, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_visibility() {
        p := BSTR.Owned()
        result := ComCall(134, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyleType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(135, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleType() {
        p := BSTR.Owned()
        result := ComCall(136, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStylePosition(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(137, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStylePosition() {
        p := BSTR.Owned()
        result := ComCall(138, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyleImage(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(139, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleImage() {
        p := BSTR.Owned()
        result := ComCall(140, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_listStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(141, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyle() {
        p := BSTR.Owned()
        result := ComCall(142, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_whiteSpace(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(143, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_whiteSpace() {
        p := BSTR.Owned()
        result := ComCall(144, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_top(v) {
        result := ComCall(145, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_top() {
        p := VARIANT()
        result := ComCall(146, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_left(v) {
        result := ComCall(147, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_left() {
        p := VARIANT()
        result := ComCall(148, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_position() {
        p := BSTR.Owned()
        result := ComCall(149, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_zIndex(v) {
        result := ComCall(150, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_zIndex() {
        p := VARIANT()
        result := ComCall(151, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_overflow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(152, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflow() {
        p := BSTR.Owned()
        result := ComCall(153, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakBefore(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(154, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakBefore() {
        p := BSTR.Owned()
        result := ComCall(155, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakAfter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(156, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakAfter() {
        p := BSTR.Owned()
        result := ComCall(157, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(158, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cssText() {
        p := BSTR.Owned()
        result := ComCall(159, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelTop(v) {
        result := ComCall(160, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelTop() {
        result := ComCall(161, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelLeft(v) {
        result := ComCall(162, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelLeft() {
        result := ComCall(163, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelWidth(v) {
        result := ComCall(164, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelWidth() {
        result := ComCall(165, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pixelHeight(v) {
        result := ComCall(166, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pixelHeight() {
        result := ComCall(167, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posTop(v) {
        result := ComCall(168, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posTop() {
        result := ComCall(169, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posLeft(v) {
        result := ComCall(170, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posLeft() {
        result := ComCall(171, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posWidth(v) {
        result := ComCall(172, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posWidth() {
        result := ComCall(173, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_posHeight(v) {
        result := ComCall(174, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_posHeight() {
        result := ComCall(175, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cursor(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(176, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cursor() {
        p := BSTR.Owned()
        result := ComCall(177, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_clip(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(178, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clip() {
        p := BSTR.Owned()
        result := ComCall(179, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_filter(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(180, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_filter() {
        p := BSTR.Owned()
        result := ComCall(181, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {VARIANT} AttributeValue 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    setAttribute(strAttributeName, AttributeValue, lFlags) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(182, this, BSTR, strAttributeName, VARIANT, AttributeValue, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Integer} lFlags 
     * @returns {VARIANT} 
     */
    getAttribute(strAttributeName, lFlags) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        AttributeValue := VARIANT()
        result := ComCall(183, this, BSTR, strAttributeName, "int", lFlags, VARIANT.Ptr, AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {Integer} lFlags 
     * @returns {VARIANT_BOOL} 
     */
    removeAttribute(strAttributeName, lFlags) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(184, this, BSTR, strAttributeName, "int", lFlags, VARIANT_BOOL.Ptr, &pfSuccess := 0, "HRESULT")
        return pfSuccess
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        _String := BSTR.Owned()
        result := ComCall(185, this, BSTR.Ptr, _String, "HRESULT")
        return _String
    }

    Query(iid) {
        if (IHTMLStyle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
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
        this.vtbl.put_textDecorationNone := CallbackCreate(GetMethod(implObj, "put_textDecorationNone"), flags, 2)
        this.vtbl.get_textDecorationNone := CallbackCreate(GetMethod(implObj, "get_textDecorationNone"), flags, 2)
        this.vtbl.put_textDecorationUnderline := CallbackCreate(GetMethod(implObj, "put_textDecorationUnderline"), flags, 2)
        this.vtbl.get_textDecorationUnderline := CallbackCreate(GetMethod(implObj, "get_textDecorationUnderline"), flags, 2)
        this.vtbl.put_textDecorationOverline := CallbackCreate(GetMethod(implObj, "put_textDecorationOverline"), flags, 2)
        this.vtbl.get_textDecorationOverline := CallbackCreate(GetMethod(implObj, "get_textDecorationOverline"), flags, 2)
        this.vtbl.put_textDecorationLineThrough := CallbackCreate(GetMethod(implObj, "put_textDecorationLineThrough"), flags, 2)
        this.vtbl.get_textDecorationLineThrough := CallbackCreate(GetMethod(implObj, "get_textDecorationLineThrough"), flags, 2)
        this.vtbl.put_textDecorationBlink := CallbackCreate(GetMethod(implObj, "put_textDecorationBlink"), flags, 2)
        this.vtbl.get_textDecorationBlink := CallbackCreate(GetMethod(implObj, "get_textDecorationBlink"), flags, 2)
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
        this.vtbl.get_position := CallbackCreate(GetMethod(implObj, "get_position"), flags, 2)
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
        this.vtbl.put_pixelTop := CallbackCreate(GetMethod(implObj, "put_pixelTop"), flags, 2)
        this.vtbl.get_pixelTop := CallbackCreate(GetMethod(implObj, "get_pixelTop"), flags, 2)
        this.vtbl.put_pixelLeft := CallbackCreate(GetMethod(implObj, "put_pixelLeft"), flags, 2)
        this.vtbl.get_pixelLeft := CallbackCreate(GetMethod(implObj, "get_pixelLeft"), flags, 2)
        this.vtbl.put_pixelWidth := CallbackCreate(GetMethod(implObj, "put_pixelWidth"), flags, 2)
        this.vtbl.get_pixelWidth := CallbackCreate(GetMethod(implObj, "get_pixelWidth"), flags, 2)
        this.vtbl.put_pixelHeight := CallbackCreate(GetMethod(implObj, "put_pixelHeight"), flags, 2)
        this.vtbl.get_pixelHeight := CallbackCreate(GetMethod(implObj, "get_pixelHeight"), flags, 2)
        this.vtbl.put_posTop := CallbackCreate(GetMethod(implObj, "put_posTop"), flags, 2)
        this.vtbl.get_posTop := CallbackCreate(GetMethod(implObj, "get_posTop"), flags, 2)
        this.vtbl.put_posLeft := CallbackCreate(GetMethod(implObj, "put_posLeft"), flags, 2)
        this.vtbl.get_posLeft := CallbackCreate(GetMethod(implObj, "get_posLeft"), flags, 2)
        this.vtbl.put_posWidth := CallbackCreate(GetMethod(implObj, "put_posWidth"), flags, 2)
        this.vtbl.get_posWidth := CallbackCreate(GetMethod(implObj, "get_posWidth"), flags, 2)
        this.vtbl.put_posHeight := CallbackCreate(GetMethod(implObj, "put_posHeight"), flags, 2)
        this.vtbl.get_posHeight := CallbackCreate(GetMethod(implObj, "get_posHeight"), flags, 2)
        this.vtbl.put_cursor := CallbackCreate(GetMethod(implObj, "put_cursor"), flags, 2)
        this.vtbl.get_cursor := CallbackCreate(GetMethod(implObj, "get_cursor"), flags, 2)
        this.vtbl.put_clip := CallbackCreate(GetMethod(implObj, "put_clip"), flags, 2)
        this.vtbl.get_clip := CallbackCreate(GetMethod(implObj, "get_clip"), flags, 2)
        this.vtbl.put_filter := CallbackCreate(GetMethod(implObj, "put_filter"), flags, 2)
        this.vtbl.get_filter := CallbackCreate(GetMethod(implObj, "get_filter"), flags, 2)
        this.vtbl.setAttribute := CallbackCreate(GetMethod(implObj, "setAttribute"), flags, 4)
        this.vtbl.getAttribute := CallbackCreate(GetMethod(implObj, "getAttribute"), flags, 4)
        this.vtbl.removeAttribute := CallbackCreate(GetMethod(implObj, "removeAttribute"), flags, 4)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
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
        CallbackFree(this.vtbl.put_textDecorationNone)
        CallbackFree(this.vtbl.get_textDecorationNone)
        CallbackFree(this.vtbl.put_textDecorationUnderline)
        CallbackFree(this.vtbl.get_textDecorationUnderline)
        CallbackFree(this.vtbl.put_textDecorationOverline)
        CallbackFree(this.vtbl.get_textDecorationOverline)
        CallbackFree(this.vtbl.put_textDecorationLineThrough)
        CallbackFree(this.vtbl.get_textDecorationLineThrough)
        CallbackFree(this.vtbl.put_textDecorationBlink)
        CallbackFree(this.vtbl.get_textDecorationBlink)
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
        CallbackFree(this.vtbl.get_position)
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
        CallbackFree(this.vtbl.put_pixelTop)
        CallbackFree(this.vtbl.get_pixelTop)
        CallbackFree(this.vtbl.put_pixelLeft)
        CallbackFree(this.vtbl.get_pixelLeft)
        CallbackFree(this.vtbl.put_pixelWidth)
        CallbackFree(this.vtbl.get_pixelWidth)
        CallbackFree(this.vtbl.put_pixelHeight)
        CallbackFree(this.vtbl.get_pixelHeight)
        CallbackFree(this.vtbl.put_posTop)
        CallbackFree(this.vtbl.get_posTop)
        CallbackFree(this.vtbl.put_posLeft)
        CallbackFree(this.vtbl.get_posLeft)
        CallbackFree(this.vtbl.put_posWidth)
        CallbackFree(this.vtbl.get_posWidth)
        CallbackFree(this.vtbl.put_posHeight)
        CallbackFree(this.vtbl.get_posHeight)
        CallbackFree(this.vtbl.put_cursor)
        CallbackFree(this.vtbl.get_cursor)
        CallbackFree(this.vtbl.put_clip)
        CallbackFree(this.vtbl.get_clip)
        CallbackFree(this.vtbl.put_filter)
        CallbackFree(this.vtbl.get_filter)
        CallbackFree(this.vtbl.setAttribute)
        CallbackFree(this.vtbl.getAttribute)
        CallbackFree(this.vtbl.removeAttribute)
        CallbackFree(this.vtbl.toString)
    }
}
