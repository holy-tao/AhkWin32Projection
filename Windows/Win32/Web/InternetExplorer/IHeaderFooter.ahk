#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IHeaderFooter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHeaderFooter
     * @type {Guid}
     */
    static IID => Guid("{3050f6ce-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_htmlHead", "get_htmlFoot", "put_textHead", "get_textHead", "put_textFoot", "get_textFoot", "put_page", "get_page", "put_pageTotal", "get_pageTotal", "put_URL", "get_URL", "put_title", "get_title", "put_dateShort", "get_dateShort", "put_dateLong", "get_dateLong", "put_timeShort", "get_timeShort", "put_timeLong", "get_timeLong"]

    /**
     * @type {BSTR} 
     */
    htmlHead {
        get => this.get_htmlHead()
    }

    /**
     * @type {BSTR} 
     */
    htmlFoot {
        get => this.get_htmlFoot()
    }

    /**
     * @type {BSTR} 
     */
    textHead {
        get => this.get_textHead()
        set => this.put_textHead(value)
    }

    /**
     * @type {BSTR} 
     */
    textFoot {
        get => this.get_textFoot()
        set => this.put_textFoot(value)
    }

    /**
     * @type {Integer} 
     */
    page {
        get => this.get_page()
        set => this.put_page(value)
    }

    /**
     * @type {Integer} 
     */
    pageTotal {
        get => this.get_pageTotal()
        set => this.put_pageTotal(value)
    }

    /**
     * @type {BSTR} 
     */
    URL {
        get => this.get_URL()
        set => this.put_URL(value)
    }

    /**
     * @type {BSTR} 
     */
    title {
        get => this.get_title()
        set => this.put_title(value)
    }

    /**
     * @type {BSTR} 
     */
    dateShort {
        get => this.get_dateShort()
        set => this.put_dateShort(value)
    }

    /**
     * @type {BSTR} 
     */
    dateLong {
        get => this.get_dateLong()
        set => this.put_dateLong(value)
    }

    /**
     * @type {BSTR} 
     */
    timeShort {
        get => this.get_timeShort()
        set => this.put_timeShort(value)
    }

    /**
     * @type {BSTR} 
     */
    timeLong {
        get => this.get_timeLong()
        set => this.put_timeLong(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_htmlHead() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_htmlFoot() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textHead(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textHead() {
        p := BSTR()
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textFoot(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textFoot() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_page(v) {
        result := ComCall(13, this, "uint", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_page() {
        result := ComCall(14, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_pageTotal(v) {
        result := ComCall(15, this, "uint", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_pageTotal() {
        result := ComCall(16, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_URL(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URL() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_title(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dateShort(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dateShort() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dateLong(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dateLong() {
        p := BSTR()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_timeShort(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_timeShort() {
        p := BSTR()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_timeLong(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_timeLong() {
        p := BSTR()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }
}
