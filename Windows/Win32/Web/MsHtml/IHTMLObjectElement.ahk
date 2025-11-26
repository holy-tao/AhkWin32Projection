#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IHTMLFormElement.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLObjectElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLObjectElement
     * @type {Guid}
     */
    static IID => Guid("{3050f24f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLObjectElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f24e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_object", "get_classid", "get_data", "putref_recordset", "get_recordset", "put_align", "get_align", "put_name", "get_name", "put_codeBase", "get_codeBase", "put_codeType", "get_codeType", "put_code", "get_code", "get_BaseHref", "put_type", "get_type", "get_form", "put_width", "get_width", "put_height", "get_height", "get_readyState", "put_onreadystatechange", "get_onreadystatechange", "put_onerror", "get_onerror", "put_altHtml", "get_altHtml", "put_vspace", "get_vspace", "put_hspace", "get_hspace"]

    /**
     * @type {IDispatch} 
     */
    object {
        get => this.get_object()
    }

    /**
     * @type {BSTR} 
     */
    classid {
        get => this.get_classid()
    }

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
    }

    /**
     * @type {IDispatch} 
     */
    recordset {
        get => this.get_recordset()
    }

    /**
     * @type {BSTR} 
     */
    align {
        get => this.get_align()
        set => this.put_align(value)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {BSTR} 
     */
    codeBase {
        get => this.get_codeBase()
        set => this.put_codeBase(value)
    }

    /**
     * @type {BSTR} 
     */
    codeType {
        get => this.get_codeType()
        set => this.put_codeType(value)
    }

    /**
     * @type {BSTR} 
     */
    code {
        get => this.get_code()
        set => this.put_code(value)
    }

    /**
     * @type {BSTR} 
     */
    BaseHref {
        get => this.get_BaseHref()
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
        set => this.put_type(value)
    }

    /**
     * @type {IHTMLFormElement} 
     */
    form {
        get => this.get_form()
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
     * @type {Integer} 
     */
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {VARIANT} 
     */
    onreadystatechange {
        get => this.get_onreadystatechange()
        set => this.put_onreadystatechange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onerror {
        get => this.get_onerror()
        set => this.put_onerror(value)
    }

    /**
     * @type {BSTR} 
     */
    altHtml {
        get => this.get_altHtml()
        set => this.put_altHtml(value)
    }

    /**
     * @type {Integer} 
     */
    vspace {
        get => this.get_vspace()
        set => this.put_vspace(value)
    }

    /**
     * @type {Integer} 
     */
    hspace {
        get => this.get_hspace()
        set => this.put_hspace(value)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_object() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_classid() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IDispatch} v 
     * @returns {HRESULT} 
     */
    putref_recordset(v) {
        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_recordset() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(14, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_codeBase(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_codeBase() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_codeType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_codeType() {
        p := BSTR()
        result := ComCall(19, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_code(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_code() {
        p := BSTR()
        result := ComCall(21, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BaseHref() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_type(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(26, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(27, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(28, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(29, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(30, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_altHtml(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_altHtml() {
        p := BSTR()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_vspace(v) {
        result := ComCall(37, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_vspace() {
        result := ComCall(38, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_hspace(v) {
        result := ComCall(39, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_hspace() {
        result := ComCall(40, this, "int*", &p := 0, "HRESULT")
        return p
    }
}
