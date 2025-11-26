#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLStyle.ahk
#Include .\IHTMLDocument.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElementDefaults extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElementDefaults
     * @type {Guid}
     */
    static IID => Guid("{3050f6c9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_style", "put_tabStop", "get_tabStop", "put_viewInheritStyle", "get_viewInheritStyle", "put_viewMasterTab", "get_viewMasterTab", "put_scrollSegmentX", "get_scrollSegmentX", "put_scrollSegmentY", "get_scrollSegmentY", "put_isMultiLine", "get_isMultiLine", "put_contentEditable", "get_contentEditable", "put_canHaveHTML", "get_canHaveHTML", "putref_viewLink", "get_viewLink", "put_frozen", "get_frozen"]

    /**
     * @type {IHTMLStyle} 
     */
    style {
        get => this.get_style()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    tabStop {
        get => this.get_tabStop()
        set => this.put_tabStop(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    viewInheritStyle {
        get => this.get_viewInheritStyle()
        set => this.put_viewInheritStyle(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    viewMasterTab {
        get => this.get_viewMasterTab()
        set => this.put_viewMasterTab(value)
    }

    /**
     * @type {Integer} 
     */
    scrollSegmentX {
        get => this.get_scrollSegmentX()
        set => this.put_scrollSegmentX(value)
    }

    /**
     * @type {Integer} 
     */
    scrollSegmentY {
        get => this.get_scrollSegmentY()
        set => this.put_scrollSegmentY(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isMultiLine {
        get => this.get_isMultiLine()
        set => this.put_isMultiLine(value)
    }

    /**
     * @type {BSTR} 
     */
    contentEditable {
        get => this.get_contentEditable()
        set => this.put_contentEditable(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    canHaveHTML {
        get => this.get_canHaveHTML()
        set => this.put_canHaveHTML(value)
    }

    /**
     * @type {IHTMLDocument} 
     */
    viewLink {
        get => this.get_viewLink()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    frozen {
        get => this.get_frozen()
        set => this.put_frozen(value)
    }

    /**
     * 
     * @returns {IHTMLStyle} 
     */
    get_style() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyle(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_tabStop(v) {
        result := ComCall(8, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_tabStop() {
        result := ComCall(9, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_viewInheritStyle(v) {
        result := ComCall(10, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_viewInheritStyle() {
        result := ComCall(11, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_viewMasterTab(v) {
        result := ComCall(12, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_viewMasterTab() {
        result := ComCall(13, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollSegmentX(v) {
        result := ComCall(14, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollSegmentX() {
        result := ComCall(15, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_scrollSegmentY(v) {
        result := ComCall(16, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_scrollSegmentY() {
        result := ComCall(17, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_isMultiLine(v) {
        result := ComCall(18, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isMultiLine() {
        result := ComCall(19, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_contentEditable(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_contentEditable() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_canHaveHTML(v) {
        result := ComCall(22, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_canHaveHTML() {
        result := ComCall(23, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IHTMLDocument} v 
     * @returns {HRESULT} 
     */
    putref_viewLink(v) {
        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLDocument} 
     */
    get_viewLink() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDocument(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_frozen(v) {
        result := ComCall(26, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_frozen() {
        result := ComCall(27, this, "short*", &p := 0, "HRESULT")
        return p
    }
}
