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
export default struct IHTMLCurrentStyle extends IDispatch {
    /**
     * The interface identifier for IHTMLCurrentStyle
     * @type {Guid}
     */
    static IID := Guid("{3050f3db-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCurrentStyle
     * @type {Guid}
     */
    static CLSID := Guid("{3050f3dc-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCurrentStyle interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_position             : IntPtr
        get_styleFloat           : IntPtr
        get_color                : IntPtr
        get_backgroundColor      : IntPtr
        get_fontFamily           : IntPtr
        get_fontStyle            : IntPtr
        get_fontVariant          : IntPtr
        get_fontWeight           : IntPtr
        get_fontSize             : IntPtr
        get_backgroundImage      : IntPtr
        get_backgroundPositionX  : IntPtr
        get_backgroundPositionY  : IntPtr
        get_backgroundRepeat     : IntPtr
        get_borderLeftColor      : IntPtr
        get_borderTopColor       : IntPtr
        get_borderRightColor     : IntPtr
        get_borderBottomColor    : IntPtr
        get_borderTopStyle       : IntPtr
        get_borderRightStyle     : IntPtr
        get_borderBottomStyle    : IntPtr
        get_borderLeftStyle      : IntPtr
        get_borderTopWidth       : IntPtr
        get_borderRightWidth     : IntPtr
        get_borderBottomWidth    : IntPtr
        get_borderLeftWidth      : IntPtr
        get_left                 : IntPtr
        get_top                  : IntPtr
        get_width                : IntPtr
        get_height               : IntPtr
        get_paddingLeft          : IntPtr
        get_paddingTop           : IntPtr
        get_paddingRight         : IntPtr
        get_paddingBottom        : IntPtr
        get_textAlign            : IntPtr
        get_textDecoration       : IntPtr
        get_display              : IntPtr
        get_visibility           : IntPtr
        get_zIndex               : IntPtr
        get_letterSpacing        : IntPtr
        get_lineHeight           : IntPtr
        get_textIndent           : IntPtr
        get_verticalAlign        : IntPtr
        get_backgroundAttachment : IntPtr
        get_marginTop            : IntPtr
        get_marginRight          : IntPtr
        get_marginBottom         : IntPtr
        get_marginLeft           : IntPtr
        get_clear                : IntPtr
        get_listStyleType        : IntPtr
        get_listStylePosition    : IntPtr
        get_listStyleImage       : IntPtr
        get_clipTop              : IntPtr
        get_clipRight            : IntPtr
        get_clipBottom           : IntPtr
        get_clipLeft             : IntPtr
        get_overflow             : IntPtr
        get_pageBreakBefore      : IntPtr
        get_pageBreakAfter       : IntPtr
        get_cursor               : IntPtr
        get_tableLayout          : IntPtr
        get_borderCollapse       : IntPtr
        get_direction            : IntPtr
        get_behavior             : IntPtr
        getAttribute             : IntPtr
        get_unicodeBidi          : IntPtr
        get_right                : IntPtr
        get_bottom               : IntPtr
        get_imeMode              : IntPtr
        get_rubyAlign            : IntPtr
        get_rubyPosition         : IntPtr
        get_rubyOverhang         : IntPtr
        get_textAutospace        : IntPtr
        get_lineBreak            : IntPtr
        get_wordBreak            : IntPtr
        get_textJustify          : IntPtr
        get_textJustifyTrim      : IntPtr
        get_textKashida          : IntPtr
        get_blockDirection       : IntPtr
        get_layoutGridChar       : IntPtr
        get_layoutGridLine       : IntPtr
        get_layoutGridMode       : IntPtr
        get_layoutGridType       : IntPtr
        get_borderStyle          : IntPtr
        get_borderColor          : IntPtr
        get_borderWidth          : IntPtr
        get_padding              : IntPtr
        get_margin               : IntPtr
        get_accelerator          : IntPtr
        get_overflowX            : IntPtr
        get_overflowY            : IntPtr
        get_textTransform        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCurrentStyle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    position {
        get => this.get_position()
    }

    /**
     * @type {BSTR} 
     */
    styleFloat {
        get => this.get_styleFloat()
    }

    /**
     * @type {VARIANT} 
     */
    color {
        get => this.get_color()
    }

    /**
     * @type {VARIANT} 
     */
    backgroundColor {
        get => this.get_backgroundColor()
    }

    /**
     * @type {BSTR} 
     */
    fontFamily {
        get => this.get_fontFamily()
    }

    /**
     * @type {BSTR} 
     */
    fontStyle {
        get => this.get_fontStyle()
    }

    /**
     * @type {BSTR} 
     */
    fontVariant {
        get => this.get_fontVariant()
    }

    /**
     * @type {VARIANT} 
     */
    fontWeight {
        get => this.get_fontWeight()
    }

    /**
     * @type {VARIANT} 
     */
    fontSize {
        get => this.get_fontSize()
    }

    /**
     * @type {BSTR} 
     */
    backgroundImage {
        get => this.get_backgroundImage()
    }

    /**
     * @type {VARIANT} 
     */
    backgroundPositionX {
        get => this.get_backgroundPositionX()
    }

    /**
     * @type {VARIANT} 
     */
    backgroundPositionY {
        get => this.get_backgroundPositionY()
    }

    /**
     * @type {BSTR} 
     */
    backgroundRepeat {
        get => this.get_backgroundRepeat()
    }

    /**
     * @type {VARIANT} 
     */
    borderLeftColor {
        get => this.get_borderLeftColor()
    }

    /**
     * @type {VARIANT} 
     */
    borderTopColor {
        get => this.get_borderTopColor()
    }

    /**
     * @type {VARIANT} 
     */
    borderRightColor {
        get => this.get_borderRightColor()
    }

    /**
     * @type {VARIANT} 
     */
    borderBottomColor {
        get => this.get_borderBottomColor()
    }

    /**
     * @type {BSTR} 
     */
    borderTopStyle {
        get => this.get_borderTopStyle()
    }

    /**
     * @type {BSTR} 
     */
    borderRightStyle {
        get => this.get_borderRightStyle()
    }

    /**
     * @type {BSTR} 
     */
    borderBottomStyle {
        get => this.get_borderBottomStyle()
    }

    /**
     * @type {BSTR} 
     */
    borderLeftStyle {
        get => this.get_borderLeftStyle()
    }

    /**
     * @type {VARIANT} 
     */
    borderTopWidth {
        get => this.get_borderTopWidth()
    }

    /**
     * @type {VARIANT} 
     */
    borderRightWidth {
        get => this.get_borderRightWidth()
    }

    /**
     * @type {VARIANT} 
     */
    borderBottomWidth {
        get => this.get_borderBottomWidth()
    }

    /**
     * @type {VARIANT} 
     */
    borderLeftWidth {
        get => this.get_borderLeftWidth()
    }

    /**
     * @type {VARIANT} 
     */
    left {
        get => this.get_left()
    }

    /**
     * @type {VARIANT} 
     */
    top {
        get => this.get_top()
    }

    /**
     * @type {VARIANT} 
     */
    width {
        get => this.get_width()
    }

    /**
     * @type {VARIANT} 
     */
    height {
        get => this.get_height()
    }

    /**
     * @type {VARIANT} 
     */
    paddingLeft {
        get => this.get_paddingLeft()
    }

    /**
     * @type {VARIANT} 
     */
    paddingTop {
        get => this.get_paddingTop()
    }

    /**
     * @type {VARIANT} 
     */
    paddingRight {
        get => this.get_paddingRight()
    }

    /**
     * @type {VARIANT} 
     */
    paddingBottom {
        get => this.get_paddingBottom()
    }

    /**
     * @type {BSTR} 
     */
    textAlign {
        get => this.get_textAlign()
    }

    /**
     * @type {BSTR} 
     */
    textDecoration {
        get => this.get_textDecoration()
    }

    /**
     * @type {BSTR} 
     */
    display {
        get => this.get_display()
    }

    /**
     * @type {BSTR} 
     */
    visibility {
        get => this.get_visibility()
    }

    /**
     * @type {VARIANT} 
     */
    zIndex {
        get => this.get_zIndex()
    }

    /**
     * @type {VARIANT} 
     */
    letterSpacing {
        get => this.get_letterSpacing()
    }

    /**
     * @type {VARIANT} 
     */
    lineHeight {
        get => this.get_lineHeight()
    }

    /**
     * @type {VARIANT} 
     */
    textIndent {
        get => this.get_textIndent()
    }

    /**
     * @type {VARIANT} 
     */
    verticalAlign {
        get => this.get_verticalAlign()
    }

    /**
     * @type {BSTR} 
     */
    backgroundAttachment {
        get => this.get_backgroundAttachment()
    }

    /**
     * @type {VARIANT} 
     */
    marginTop {
        get => this.get_marginTop()
    }

    /**
     * @type {VARIANT} 
     */
    marginRight {
        get => this.get_marginRight()
    }

    /**
     * @type {VARIANT} 
     */
    marginBottom {
        get => this.get_marginBottom()
    }

    /**
     * @type {VARIANT} 
     */
    marginLeft {
        get => this.get_marginLeft()
    }

    /**
     * @type {BSTR} 
     */
    clear {
        get => this.get_clear()
    }

    /**
     * @type {BSTR} 
     */
    listStyleType {
        get => this.get_listStyleType()
    }

    /**
     * @type {BSTR} 
     */
    listStylePosition {
        get => this.get_listStylePosition()
    }

    /**
     * @type {BSTR} 
     */
    listStyleImage {
        get => this.get_listStyleImage()
    }

    /**
     * @type {VARIANT} 
     */
    clipTop {
        get => this.get_clipTop()
    }

    /**
     * @type {VARIANT} 
     */
    clipRight {
        get => this.get_clipRight()
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
    }

    /**
     * @type {BSTR} 
     */
    overflow {
        get => this.get_overflow()
    }

    /**
     * @type {BSTR} 
     */
    pageBreakBefore {
        get => this.get_pageBreakBefore()
    }

    /**
     * @type {BSTR} 
     */
    pageBreakAfter {
        get => this.get_pageBreakAfter()
    }

    /**
     * @type {BSTR} 
     */
    cursor {
        get => this.get_cursor()
    }

    /**
     * @type {BSTR} 
     */
    tableLayout {
        get => this.get_tableLayout()
    }

    /**
     * @type {BSTR} 
     */
    borderCollapse {
        get => this.get_borderCollapse()
    }

    /**
     * @type {BSTR} 
     */
    direction {
        get => this.get_direction()
    }

    /**
     * @type {BSTR} 
     */
    behavior {
        get => this.get_behavior()
    }

    /**
     * @type {BSTR} 
     */
    unicodeBidi {
        get => this.get_unicodeBidi()
    }

    /**
     * @type {VARIANT} 
     */
    right {
        get => this.get_right()
    }

    /**
     * @type {VARIANT} 
     */
    bottom {
        get => this.get_bottom()
    }

    /**
     * @type {BSTR} 
     */
    imeMode {
        get => this.get_imeMode()
    }

    /**
     * @type {BSTR} 
     */
    rubyAlign {
        get => this.get_rubyAlign()
    }

    /**
     * @type {BSTR} 
     */
    rubyPosition {
        get => this.get_rubyPosition()
    }

    /**
     * @type {BSTR} 
     */
    rubyOverhang {
        get => this.get_rubyOverhang()
    }

    /**
     * @type {BSTR} 
     */
    textAutospace {
        get => this.get_textAutospace()
    }

    /**
     * @type {BSTR} 
     */
    lineBreak {
        get => this.get_lineBreak()
    }

    /**
     * @type {BSTR} 
     */
    wordBreak {
        get => this.get_wordBreak()
    }

    /**
     * @type {BSTR} 
     */
    textJustify {
        get => this.get_textJustify()
    }

    /**
     * @type {BSTR} 
     */
    textJustifyTrim {
        get => this.get_textJustifyTrim()
    }

    /**
     * @type {VARIANT} 
     */
    textKashida {
        get => this.get_textKashida()
    }

    /**
     * @type {BSTR} 
     */
    blockDirection {
        get => this.get_blockDirection()
    }

    /**
     * @type {VARIANT} 
     */
    layoutGridChar {
        get => this.get_layoutGridChar()
    }

    /**
     * @type {VARIANT} 
     */
    layoutGridLine {
        get => this.get_layoutGridLine()
    }

    /**
     * @type {BSTR} 
     */
    layoutGridMode {
        get => this.get_layoutGridMode()
    }

    /**
     * @type {BSTR} 
     */
    layoutGridType {
        get => this.get_layoutGridType()
    }

    /**
     * @type {BSTR} 
     */
    borderStyle {
        get => this.get_borderStyle()
    }

    /**
     * @type {BSTR} 
     */
    borderColor {
        get => this.get_borderColor()
    }

    /**
     * @type {BSTR} 
     */
    borderWidth {
        get => this.get_borderWidth()
    }

    /**
     * @type {BSTR} 
     */
    padding {
        get => this.get_padding()
    }

    /**
     * @type {BSTR} 
     */
    margin {
        get => this.get_margin()
    }

    /**
     * @type {BSTR} 
     */
    accelerator {
        get => this.get_accelerator()
    }

    /**
     * @type {BSTR} 
     */
    overflowX {
        get => this.get_overflowX()
    }

    /**
     * @type {BSTR} 
     */
    overflowY {
        get => this.get_overflowY()
    }

    /**
     * @type {BSTR} 
     */
    textTransform {
        get => this.get_textTransform()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_position() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_styleFloat() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_color() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundColor() {
        p := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontFamily() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontStyle() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fontVariant() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fontWeight() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_fontSize() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundImage() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionX() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_backgroundPositionY() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundRepeat() {
        p := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftColor() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopColor() {
        p := VARIANT()
        result := ComCall(21, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightColor() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomColor() {
        p := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderTopStyle() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderRightStyle() {
        p := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderBottomStyle() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderLeftStyle() {
        p := BSTR.Owned()
        result := ComCall(27, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderTopWidth() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderRightWidth() {
        p := VARIANT()
        result := ComCall(29, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderBottomWidth() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderLeftWidth() {
        p := VARIANT()
        result := ComCall(31, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_left() {
        p := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_top() {
        p := VARIANT()
        result := ComCall(33, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(35, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingLeft() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingTop() {
        p := VARIANT()
        result := ComCall(37, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingRight() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_paddingBottom() {
        p := VARIANT()
        result := ComCall(39, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAlign() {
        p := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textDecoration() {
        p := BSTR.Owned()
        result := ComCall(41, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_display() {
        p := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_visibility() {
        p := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_zIndex() {
        p := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_letterSpacing() {
        p := VARIANT()
        result := ComCall(45, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_lineHeight() {
        p := VARIANT()
        result := ComCall(46, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textIndent() {
        p := VARIANT()
        result := ComCall(47, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_verticalAlign() {
        p := VARIANT()
        result := ComCall(48, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_backgroundAttachment() {
        p := BSTR.Owned()
        result := ComCall(49, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginTop() {
        p := VARIANT()
        result := ComCall(50, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginRight() {
        p := VARIANT()
        result := ComCall(51, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginBottom() {
        p := VARIANT()
        result := ComCall(52, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_marginLeft() {
        p := VARIANT()
        result := ComCall(53, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_clear() {
        p := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleType() {
        p := BSTR.Owned()
        result := ComCall(55, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStylePosition() {
        p := BSTR.Owned()
        result := ComCall(56, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_listStyleImage() {
        p := BSTR.Owned()
        result := ComCall(57, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipTop() {
        p := VARIANT()
        result := ComCall(58, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipRight() {
        p := VARIANT()
        result := ComCall(59, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipBottom() {
        p := VARIANT()
        result := ComCall(60, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_clipLeft() {
        p := VARIANT()
        result := ComCall(61, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflow() {
        p := BSTR.Owned()
        result := ComCall(62, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakBefore() {
        p := BSTR.Owned()
        result := ComCall(63, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakAfter() {
        p := BSTR.Owned()
        result := ComCall(64, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cursor() {
        p := BSTR.Owned()
        result := ComCall(65, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tableLayout() {
        p := BSTR.Owned()
        result := ComCall(66, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderCollapse() {
        p := BSTR.Owned()
        result := ComCall(67, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_direction() {
        p := BSTR.Owned()
        result := ComCall(68, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_behavior() {
        p := BSTR.Owned()
        result := ComCall(69, this, BSTR.Ptr, p, "HRESULT")
        return p
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
        result := ComCall(70, this, BSTR, strAttributeName, "int", lFlags, VARIANT.Ptr, AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_unicodeBidi() {
        p := BSTR.Owned()
        result := ComCall(71, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_right() {
        p := VARIANT()
        result := ComCall(72, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bottom() {
        p := VARIANT()
        result := ComCall(73, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_imeMode() {
        p := BSTR.Owned()
        result := ComCall(74, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyAlign() {
        p := BSTR.Owned()
        result := ComCall(75, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyPosition() {
        p := BSTR.Owned()
        result := ComCall(76, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rubyOverhang() {
        p := BSTR.Owned()
        result := ComCall(77, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textAutospace() {
        p := BSTR.Owned()
        result := ComCall(78, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lineBreak() {
        p := BSTR.Owned()
        result := ComCall(79, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_wordBreak() {
        p := BSTR.Owned()
        result := ComCall(80, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustify() {
        p := BSTR.Owned()
        result := ComCall(81, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textJustifyTrim() {
        p := BSTR.Owned()
        result := ComCall(82, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textKashida() {
        p := VARIANT()
        result := ComCall(83, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_blockDirection() {
        p := BSTR.Owned()
        result := ComCall(84, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridChar() {
        p := VARIANT()
        result := ComCall(85, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_layoutGridLine() {
        p := VARIANT()
        result := ComCall(86, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridMode() {
        p := BSTR.Owned()
        result := ComCall(87, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_layoutGridType() {
        p := BSTR.Owned()
        result := ComCall(88, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderStyle() {
        p := BSTR.Owned()
        result := ComCall(89, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderColor() {
        p := BSTR.Owned()
        result := ComCall(90, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderWidth() {
        p := BSTR.Owned()
        result := ComCall(91, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_padding() {
        p := BSTR.Owned()
        result := ComCall(92, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_margin() {
        p := BSTR.Owned()
        result := ComCall(93, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_accelerator() {
        p := BSTR.Owned()
        result := ComCall(94, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowX() {
        p := BSTR.Owned()
        result := ComCall(95, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_overflowY() {
        p := BSTR.Owned()
        result := ComCall(96, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textTransform() {
        p := BSTR.Owned()
        result := ComCall(97, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCurrentStyle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_position := CallbackCreate(GetMethod(implObj, "get_position"), flags, 2)
        this.vtbl.get_styleFloat := CallbackCreate(GetMethod(implObj, "get_styleFloat"), flags, 2)
        this.vtbl.get_color := CallbackCreate(GetMethod(implObj, "get_color"), flags, 2)
        this.vtbl.get_backgroundColor := CallbackCreate(GetMethod(implObj, "get_backgroundColor"), flags, 2)
        this.vtbl.get_fontFamily := CallbackCreate(GetMethod(implObj, "get_fontFamily"), flags, 2)
        this.vtbl.get_fontStyle := CallbackCreate(GetMethod(implObj, "get_fontStyle"), flags, 2)
        this.vtbl.get_fontVariant := CallbackCreate(GetMethod(implObj, "get_fontVariant"), flags, 2)
        this.vtbl.get_fontWeight := CallbackCreate(GetMethod(implObj, "get_fontWeight"), flags, 2)
        this.vtbl.get_fontSize := CallbackCreate(GetMethod(implObj, "get_fontSize"), flags, 2)
        this.vtbl.get_backgroundImage := CallbackCreate(GetMethod(implObj, "get_backgroundImage"), flags, 2)
        this.vtbl.get_backgroundPositionX := CallbackCreate(GetMethod(implObj, "get_backgroundPositionX"), flags, 2)
        this.vtbl.get_backgroundPositionY := CallbackCreate(GetMethod(implObj, "get_backgroundPositionY"), flags, 2)
        this.vtbl.get_backgroundRepeat := CallbackCreate(GetMethod(implObj, "get_backgroundRepeat"), flags, 2)
        this.vtbl.get_borderLeftColor := CallbackCreate(GetMethod(implObj, "get_borderLeftColor"), flags, 2)
        this.vtbl.get_borderTopColor := CallbackCreate(GetMethod(implObj, "get_borderTopColor"), flags, 2)
        this.vtbl.get_borderRightColor := CallbackCreate(GetMethod(implObj, "get_borderRightColor"), flags, 2)
        this.vtbl.get_borderBottomColor := CallbackCreate(GetMethod(implObj, "get_borderBottomColor"), flags, 2)
        this.vtbl.get_borderTopStyle := CallbackCreate(GetMethod(implObj, "get_borderTopStyle"), flags, 2)
        this.vtbl.get_borderRightStyle := CallbackCreate(GetMethod(implObj, "get_borderRightStyle"), flags, 2)
        this.vtbl.get_borderBottomStyle := CallbackCreate(GetMethod(implObj, "get_borderBottomStyle"), flags, 2)
        this.vtbl.get_borderLeftStyle := CallbackCreate(GetMethod(implObj, "get_borderLeftStyle"), flags, 2)
        this.vtbl.get_borderTopWidth := CallbackCreate(GetMethod(implObj, "get_borderTopWidth"), flags, 2)
        this.vtbl.get_borderRightWidth := CallbackCreate(GetMethod(implObj, "get_borderRightWidth"), flags, 2)
        this.vtbl.get_borderBottomWidth := CallbackCreate(GetMethod(implObj, "get_borderBottomWidth"), flags, 2)
        this.vtbl.get_borderLeftWidth := CallbackCreate(GetMethod(implObj, "get_borderLeftWidth"), flags, 2)
        this.vtbl.get_left := CallbackCreate(GetMethod(implObj, "get_left"), flags, 2)
        this.vtbl.get_top := CallbackCreate(GetMethod(implObj, "get_top"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.get_paddingLeft := CallbackCreate(GetMethod(implObj, "get_paddingLeft"), flags, 2)
        this.vtbl.get_paddingTop := CallbackCreate(GetMethod(implObj, "get_paddingTop"), flags, 2)
        this.vtbl.get_paddingRight := CallbackCreate(GetMethod(implObj, "get_paddingRight"), flags, 2)
        this.vtbl.get_paddingBottom := CallbackCreate(GetMethod(implObj, "get_paddingBottom"), flags, 2)
        this.vtbl.get_textAlign := CallbackCreate(GetMethod(implObj, "get_textAlign"), flags, 2)
        this.vtbl.get_textDecoration := CallbackCreate(GetMethod(implObj, "get_textDecoration"), flags, 2)
        this.vtbl.get_display := CallbackCreate(GetMethod(implObj, "get_display"), flags, 2)
        this.vtbl.get_visibility := CallbackCreate(GetMethod(implObj, "get_visibility"), flags, 2)
        this.vtbl.get_zIndex := CallbackCreate(GetMethod(implObj, "get_zIndex"), flags, 2)
        this.vtbl.get_letterSpacing := CallbackCreate(GetMethod(implObj, "get_letterSpacing"), flags, 2)
        this.vtbl.get_lineHeight := CallbackCreate(GetMethod(implObj, "get_lineHeight"), flags, 2)
        this.vtbl.get_textIndent := CallbackCreate(GetMethod(implObj, "get_textIndent"), flags, 2)
        this.vtbl.get_verticalAlign := CallbackCreate(GetMethod(implObj, "get_verticalAlign"), flags, 2)
        this.vtbl.get_backgroundAttachment := CallbackCreate(GetMethod(implObj, "get_backgroundAttachment"), flags, 2)
        this.vtbl.get_marginTop := CallbackCreate(GetMethod(implObj, "get_marginTop"), flags, 2)
        this.vtbl.get_marginRight := CallbackCreate(GetMethod(implObj, "get_marginRight"), flags, 2)
        this.vtbl.get_marginBottom := CallbackCreate(GetMethod(implObj, "get_marginBottom"), flags, 2)
        this.vtbl.get_marginLeft := CallbackCreate(GetMethod(implObj, "get_marginLeft"), flags, 2)
        this.vtbl.get_clear := CallbackCreate(GetMethod(implObj, "get_clear"), flags, 2)
        this.vtbl.get_listStyleType := CallbackCreate(GetMethod(implObj, "get_listStyleType"), flags, 2)
        this.vtbl.get_listStylePosition := CallbackCreate(GetMethod(implObj, "get_listStylePosition"), flags, 2)
        this.vtbl.get_listStyleImage := CallbackCreate(GetMethod(implObj, "get_listStyleImage"), flags, 2)
        this.vtbl.get_clipTop := CallbackCreate(GetMethod(implObj, "get_clipTop"), flags, 2)
        this.vtbl.get_clipRight := CallbackCreate(GetMethod(implObj, "get_clipRight"), flags, 2)
        this.vtbl.get_clipBottom := CallbackCreate(GetMethod(implObj, "get_clipBottom"), flags, 2)
        this.vtbl.get_clipLeft := CallbackCreate(GetMethod(implObj, "get_clipLeft"), flags, 2)
        this.vtbl.get_overflow := CallbackCreate(GetMethod(implObj, "get_overflow"), flags, 2)
        this.vtbl.get_pageBreakBefore := CallbackCreate(GetMethod(implObj, "get_pageBreakBefore"), flags, 2)
        this.vtbl.get_pageBreakAfter := CallbackCreate(GetMethod(implObj, "get_pageBreakAfter"), flags, 2)
        this.vtbl.get_cursor := CallbackCreate(GetMethod(implObj, "get_cursor"), flags, 2)
        this.vtbl.get_tableLayout := CallbackCreate(GetMethod(implObj, "get_tableLayout"), flags, 2)
        this.vtbl.get_borderCollapse := CallbackCreate(GetMethod(implObj, "get_borderCollapse"), flags, 2)
        this.vtbl.get_direction := CallbackCreate(GetMethod(implObj, "get_direction"), flags, 2)
        this.vtbl.get_behavior := CallbackCreate(GetMethod(implObj, "get_behavior"), flags, 2)
        this.vtbl.getAttribute := CallbackCreate(GetMethod(implObj, "getAttribute"), flags, 4)
        this.vtbl.get_unicodeBidi := CallbackCreate(GetMethod(implObj, "get_unicodeBidi"), flags, 2)
        this.vtbl.get_right := CallbackCreate(GetMethod(implObj, "get_right"), flags, 2)
        this.vtbl.get_bottom := CallbackCreate(GetMethod(implObj, "get_bottom"), flags, 2)
        this.vtbl.get_imeMode := CallbackCreate(GetMethod(implObj, "get_imeMode"), flags, 2)
        this.vtbl.get_rubyAlign := CallbackCreate(GetMethod(implObj, "get_rubyAlign"), flags, 2)
        this.vtbl.get_rubyPosition := CallbackCreate(GetMethod(implObj, "get_rubyPosition"), flags, 2)
        this.vtbl.get_rubyOverhang := CallbackCreate(GetMethod(implObj, "get_rubyOverhang"), flags, 2)
        this.vtbl.get_textAutospace := CallbackCreate(GetMethod(implObj, "get_textAutospace"), flags, 2)
        this.vtbl.get_lineBreak := CallbackCreate(GetMethod(implObj, "get_lineBreak"), flags, 2)
        this.vtbl.get_wordBreak := CallbackCreate(GetMethod(implObj, "get_wordBreak"), flags, 2)
        this.vtbl.get_textJustify := CallbackCreate(GetMethod(implObj, "get_textJustify"), flags, 2)
        this.vtbl.get_textJustifyTrim := CallbackCreate(GetMethod(implObj, "get_textJustifyTrim"), flags, 2)
        this.vtbl.get_textKashida := CallbackCreate(GetMethod(implObj, "get_textKashida"), flags, 2)
        this.vtbl.get_blockDirection := CallbackCreate(GetMethod(implObj, "get_blockDirection"), flags, 2)
        this.vtbl.get_layoutGridChar := CallbackCreate(GetMethod(implObj, "get_layoutGridChar"), flags, 2)
        this.vtbl.get_layoutGridLine := CallbackCreate(GetMethod(implObj, "get_layoutGridLine"), flags, 2)
        this.vtbl.get_layoutGridMode := CallbackCreate(GetMethod(implObj, "get_layoutGridMode"), flags, 2)
        this.vtbl.get_layoutGridType := CallbackCreate(GetMethod(implObj, "get_layoutGridType"), flags, 2)
        this.vtbl.get_borderStyle := CallbackCreate(GetMethod(implObj, "get_borderStyle"), flags, 2)
        this.vtbl.get_borderColor := CallbackCreate(GetMethod(implObj, "get_borderColor"), flags, 2)
        this.vtbl.get_borderWidth := CallbackCreate(GetMethod(implObj, "get_borderWidth"), flags, 2)
        this.vtbl.get_padding := CallbackCreate(GetMethod(implObj, "get_padding"), flags, 2)
        this.vtbl.get_margin := CallbackCreate(GetMethod(implObj, "get_margin"), flags, 2)
        this.vtbl.get_accelerator := CallbackCreate(GetMethod(implObj, "get_accelerator"), flags, 2)
        this.vtbl.get_overflowX := CallbackCreate(GetMethod(implObj, "get_overflowX"), flags, 2)
        this.vtbl.get_overflowY := CallbackCreate(GetMethod(implObj, "get_overflowY"), flags, 2)
        this.vtbl.get_textTransform := CallbackCreate(GetMethod(implObj, "get_textTransform"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_position)
        CallbackFree(this.vtbl.get_styleFloat)
        CallbackFree(this.vtbl.get_color)
        CallbackFree(this.vtbl.get_backgroundColor)
        CallbackFree(this.vtbl.get_fontFamily)
        CallbackFree(this.vtbl.get_fontStyle)
        CallbackFree(this.vtbl.get_fontVariant)
        CallbackFree(this.vtbl.get_fontWeight)
        CallbackFree(this.vtbl.get_fontSize)
        CallbackFree(this.vtbl.get_backgroundImage)
        CallbackFree(this.vtbl.get_backgroundPositionX)
        CallbackFree(this.vtbl.get_backgroundPositionY)
        CallbackFree(this.vtbl.get_backgroundRepeat)
        CallbackFree(this.vtbl.get_borderLeftColor)
        CallbackFree(this.vtbl.get_borderTopColor)
        CallbackFree(this.vtbl.get_borderRightColor)
        CallbackFree(this.vtbl.get_borderBottomColor)
        CallbackFree(this.vtbl.get_borderTopStyle)
        CallbackFree(this.vtbl.get_borderRightStyle)
        CallbackFree(this.vtbl.get_borderBottomStyle)
        CallbackFree(this.vtbl.get_borderLeftStyle)
        CallbackFree(this.vtbl.get_borderTopWidth)
        CallbackFree(this.vtbl.get_borderRightWidth)
        CallbackFree(this.vtbl.get_borderBottomWidth)
        CallbackFree(this.vtbl.get_borderLeftWidth)
        CallbackFree(this.vtbl.get_left)
        CallbackFree(this.vtbl.get_top)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.get_paddingLeft)
        CallbackFree(this.vtbl.get_paddingTop)
        CallbackFree(this.vtbl.get_paddingRight)
        CallbackFree(this.vtbl.get_paddingBottom)
        CallbackFree(this.vtbl.get_textAlign)
        CallbackFree(this.vtbl.get_textDecoration)
        CallbackFree(this.vtbl.get_display)
        CallbackFree(this.vtbl.get_visibility)
        CallbackFree(this.vtbl.get_zIndex)
        CallbackFree(this.vtbl.get_letterSpacing)
        CallbackFree(this.vtbl.get_lineHeight)
        CallbackFree(this.vtbl.get_textIndent)
        CallbackFree(this.vtbl.get_verticalAlign)
        CallbackFree(this.vtbl.get_backgroundAttachment)
        CallbackFree(this.vtbl.get_marginTop)
        CallbackFree(this.vtbl.get_marginRight)
        CallbackFree(this.vtbl.get_marginBottom)
        CallbackFree(this.vtbl.get_marginLeft)
        CallbackFree(this.vtbl.get_clear)
        CallbackFree(this.vtbl.get_listStyleType)
        CallbackFree(this.vtbl.get_listStylePosition)
        CallbackFree(this.vtbl.get_listStyleImage)
        CallbackFree(this.vtbl.get_clipTop)
        CallbackFree(this.vtbl.get_clipRight)
        CallbackFree(this.vtbl.get_clipBottom)
        CallbackFree(this.vtbl.get_clipLeft)
        CallbackFree(this.vtbl.get_overflow)
        CallbackFree(this.vtbl.get_pageBreakBefore)
        CallbackFree(this.vtbl.get_pageBreakAfter)
        CallbackFree(this.vtbl.get_cursor)
        CallbackFree(this.vtbl.get_tableLayout)
        CallbackFree(this.vtbl.get_borderCollapse)
        CallbackFree(this.vtbl.get_direction)
        CallbackFree(this.vtbl.get_behavior)
        CallbackFree(this.vtbl.getAttribute)
        CallbackFree(this.vtbl.get_unicodeBidi)
        CallbackFree(this.vtbl.get_right)
        CallbackFree(this.vtbl.get_bottom)
        CallbackFree(this.vtbl.get_imeMode)
        CallbackFree(this.vtbl.get_rubyAlign)
        CallbackFree(this.vtbl.get_rubyPosition)
        CallbackFree(this.vtbl.get_rubyOverhang)
        CallbackFree(this.vtbl.get_textAutospace)
        CallbackFree(this.vtbl.get_lineBreak)
        CallbackFree(this.vtbl.get_wordBreak)
        CallbackFree(this.vtbl.get_textJustify)
        CallbackFree(this.vtbl.get_textJustifyTrim)
        CallbackFree(this.vtbl.get_textKashida)
        CallbackFree(this.vtbl.get_blockDirection)
        CallbackFree(this.vtbl.get_layoutGridChar)
        CallbackFree(this.vtbl.get_layoutGridLine)
        CallbackFree(this.vtbl.get_layoutGridMode)
        CallbackFree(this.vtbl.get_layoutGridType)
        CallbackFree(this.vtbl.get_borderStyle)
        CallbackFree(this.vtbl.get_borderColor)
        CallbackFree(this.vtbl.get_borderWidth)
        CallbackFree(this.vtbl.get_padding)
        CallbackFree(this.vtbl.get_margin)
        CallbackFree(this.vtbl.get_accelerator)
        CallbackFree(this.vtbl.get_overflowX)
        CallbackFree(this.vtbl.get_overflowY)
        CallbackFree(this.vtbl.get_textTransform)
    }
}
