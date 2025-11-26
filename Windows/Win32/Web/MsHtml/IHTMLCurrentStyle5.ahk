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
class IHTMLCurrentStyle5 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCurrentStyle5
     * @type {Guid}
     */
    static IID => Guid("{30510481-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_captionSide", "get_outline", "get_outlineWidth", "get_outlineStyle", "get_outlineColor", "get_boxSizing", "get_borderSpacing", "get_orphans", "get_widows", "get_pageBreakInside", "get_emptyCells", "get_msBlockProgression", "get_quotes"]

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
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outline() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_outlineWidth() {
        p := VARIANT()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outlineStyle() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_outlineColor() {
        p := VARIANT()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_boxSizing() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_borderSpacing() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_orphans() {
        p := VARIANT()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_widows() {
        p := VARIANT()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pageBreakInside() {
        p := BSTR()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_emptyCells() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_msBlockProgression() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_quotes() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }
}
