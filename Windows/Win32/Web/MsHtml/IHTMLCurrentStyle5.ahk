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
export default struct IHTMLCurrentStyle5 extends IDispatch {
    /**
     * The interface identifier for IHTMLCurrentStyle5
     * @type {Guid}
     */
    static IID := Guid("{30510481-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCurrentStyle5 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_captionSide        : IntPtr
        get_outline            : IntPtr
        get_outlineWidth       : IntPtr
        get_outlineStyle       : IntPtr
        get_outlineColor       : IntPtr
        get_boxSizing          : IntPtr
        get_borderSpacing      : IntPtr
        get_orphans            : IntPtr
        get_widows             : IntPtr
        get_pageBreakInside    : IntPtr
        get_emptyCells         : IntPtr
        get_msBlockProgression : IntPtr
        get_quotes             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCurrentStyle5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    captionSide {
        get => this.get_captionSide()
    }

    /**
     * @type {BSTR} 
     */
    outline {
        get => this.get_outline()
    }

    /**
     * @type {VARIANT} 
     */
    outlineWidth {
        get => this.get_outlineWidth()
    }

    /**
     * @type {BSTR} 
     */
    outlineStyle {
        get => this.get_outlineStyle()
    }

    /**
     * @type {VARIANT} 
     */
    outlineColor {
        get => this.get_outlineColor()
    }

    /**
     * @type {BSTR} 
     */
    boxSizing {
        get => this.get_boxSizing()
    }

    /**
     * @type {BSTR} 
     */
    borderSpacing {
        get => this.get_borderSpacing()
    }

    /**
     * @type {VARIANT} 
     */
    orphans {
        get => this.get_orphans()
    }

    /**
     * @type {VARIANT} 
     */
    widows {
        get => this.get_widows()
    }

    /**
     * @type {BSTR} 
     */
    pageBreakInside {
        get => this.get_pageBreakInside()
    }

    /**
     * @type {BSTR} 
     */
    emptyCells {
        get => this.get_emptyCells()
    }

    /**
     * @type {BSTR} 
     */
    msBlockProgression {
        get => this.get_msBlockProgression()
    }

    /**
     * @type {BSTR} 
     */
    quotes {
        get => this.get_quotes()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_captionSide() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outline() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_outlineWidth() {
        p := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outlineStyle() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_outlineColor() {
        p := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_boxSizing() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderSpacing() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_orphans() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_widows() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakInside() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_emptyCells() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msBlockProgression() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_quotes() {
        p := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCurrentStyle5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_captionSide := CallbackCreate(GetMethod(implObj, "get_captionSide"), flags, 2)
        this.vtbl.get_outline := CallbackCreate(GetMethod(implObj, "get_outline"), flags, 2)
        this.vtbl.get_outlineWidth := CallbackCreate(GetMethod(implObj, "get_outlineWidth"), flags, 2)
        this.vtbl.get_outlineStyle := CallbackCreate(GetMethod(implObj, "get_outlineStyle"), flags, 2)
        this.vtbl.get_outlineColor := CallbackCreate(GetMethod(implObj, "get_outlineColor"), flags, 2)
        this.vtbl.get_boxSizing := CallbackCreate(GetMethod(implObj, "get_boxSizing"), flags, 2)
        this.vtbl.get_borderSpacing := CallbackCreate(GetMethod(implObj, "get_borderSpacing"), flags, 2)
        this.vtbl.get_orphans := CallbackCreate(GetMethod(implObj, "get_orphans"), flags, 2)
        this.vtbl.get_widows := CallbackCreate(GetMethod(implObj, "get_widows"), flags, 2)
        this.vtbl.get_pageBreakInside := CallbackCreate(GetMethod(implObj, "get_pageBreakInside"), flags, 2)
        this.vtbl.get_emptyCells := CallbackCreate(GetMethod(implObj, "get_emptyCells"), flags, 2)
        this.vtbl.get_msBlockProgression := CallbackCreate(GetMethod(implObj, "get_msBlockProgression"), flags, 2)
        this.vtbl.get_quotes := CallbackCreate(GetMethod(implObj, "get_quotes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_captionSide)
        CallbackFree(this.vtbl.get_outline)
        CallbackFree(this.vtbl.get_outlineWidth)
        CallbackFree(this.vtbl.get_outlineStyle)
        CallbackFree(this.vtbl.get_outlineColor)
        CallbackFree(this.vtbl.get_boxSizing)
        CallbackFree(this.vtbl.get_borderSpacing)
        CallbackFree(this.vtbl.get_orphans)
        CallbackFree(this.vtbl.get_widows)
        CallbackFree(this.vtbl.get_pageBreakInside)
        CallbackFree(this.vtbl.get_emptyCells)
        CallbackFree(this.vtbl.get_msBlockProgression)
        CallbackFree(this.vtbl.get_quotes)
    }
}
