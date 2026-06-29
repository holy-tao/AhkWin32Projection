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
export default struct IHTMLRuleStyle6 extends IDispatch {
    /**
     * The interface identifier for IHTMLRuleStyle6
     * @type {Guid}
     */
    static IID := Guid("{30510471-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLRuleStyle6 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_content            : IntPtr
        get_content            : IntPtr
        put_captionSide        : IntPtr
        get_captionSide        : IntPtr
        put_counterIncrement   : IntPtr
        get_counterIncrement   : IntPtr
        put_counterReset       : IntPtr
        get_counterReset       : IntPtr
        put_outline            : IntPtr
        get_outline            : IntPtr
        put_outlineWidth       : IntPtr
        get_outlineWidth       : IntPtr
        put_outlineStyle       : IntPtr
        get_outlineStyle       : IntPtr
        put_outlineColor       : IntPtr
        get_outlineColor       : IntPtr
        put_boxSizing          : IntPtr
        get_boxSizing          : IntPtr
        put_borderSpacing      : IntPtr
        get_borderSpacing      : IntPtr
        put_orphans            : IntPtr
        get_orphans            : IntPtr
        put_widows             : IntPtr
        get_widows             : IntPtr
        put_pageBreakInside    : IntPtr
        get_pageBreakInside    : IntPtr
        put_emptyCells         : IntPtr
        get_emptyCells         : IntPtr
        put_msBlockProgression : IntPtr
        get_msBlockProgression : IntPtr
        put_quotes             : IntPtr
        get_quotes             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLRuleStyle6.Vtbl()
        }
        super.__New(implObj, flags)
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
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_content(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_content() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_captionSide(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_captionSide() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_counterIncrement(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_counterIncrement() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_counterReset(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_counterReset() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outline(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outline() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_outlineWidth(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_outlineWidth() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outlineStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outlineStyle() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_outlineColor(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_outlineColor() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_boxSizing(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_boxSizing() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_borderSpacing(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderSpacing() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_orphans(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_orphans() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_widows(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_widows() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_pageBreakInside(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakInside() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_emptyCells(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_emptyCells() {
        p := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_msBlockProgression(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msBlockProgression() {
        p := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_quotes(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(37, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_quotes() {
        p := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLRuleStyle6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
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
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
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
    }
}
