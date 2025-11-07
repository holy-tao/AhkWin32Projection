#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLElement.ahk
#Include .\IHTMLStyle.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IHTMLFiltersCollection.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElement
     * @type {Guid}
     */
    static IID => Guid("{3050f1ff-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setAttribute", "getAttribute", "removeAttribute", "put_className", "get_className", "put_id", "get_id", "get_tagName", "get_parentElement", "get_style", "put_onhelp", "get_onhelp", "put_onclick", "get_onclick", "put_ondblclick", "get_ondblclick", "put_onkeydown", "get_onkeydown", "put_onkeyup", "get_onkeyup", "put_onkeypress", "get_onkeypress", "put_onmouseout", "get_onmouseout", "put_onmouseover", "get_onmouseover", "put_onmousemove", "get_onmousemove", "put_onmousedown", "get_onmousedown", "put_onmouseup", "get_onmouseup", "get_document", "put_title", "get_title", "put_language", "get_language", "put_onselectstart", "get_onselectstart", "scrollIntoView", "contains", "get_sourceIndex", "get_recordNumber", "put_lang", "get_lang", "get_offsetLeft", "get_offsetTop", "get_offsetWidth", "get_offsetHeight", "get_offsetParent", "put_innerHTML", "get_innerHTML", "put_innerText", "get_innerText", "put_outerHTML", "get_outerHTML", "put_outerText", "get_outerText", "insertAdjacentHTML", "insertAdjacentText", "get_parentTextEdit", "get_isTextEdit", "click", "get_filters", "put_ondragstart", "get_ondragstart", "toString", "put_onbeforeupdate", "get_onbeforeupdate", "put_onafterupdate", "get_onafterupdate", "put_onerrorupdate", "get_onerrorupdate", "put_onrowexit", "get_onrowexit", "put_onrowenter", "get_onrowenter", "put_ondatasetchanged", "get_ondatasetchanged", "put_ondataavailable", "get_ondataavailable", "put_ondatasetcomplete", "get_ondatasetcomplete", "put_onfilterchange", "get_onfilterchange", "get_children", "get_all"]

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {VARIANT} AttributeValue 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    setAttribute(strAttributeName, AttributeValue, lFlags) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(7, this, "ptr", strAttributeName, "ptr", AttributeValue, "int", lFlags, "HRESULT")
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
        result := ComCall(8, this, "ptr", strAttributeName, "int", lFlags, "ptr", AttributeValue, "HRESULT")
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

        result := ComCall(9, this, "ptr", strAttributeName, "int", lFlags, "short*", &pfSuccess := 0, "HRESULT")
        return pfSuccess
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_className(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_className() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_id(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_id() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagName() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_parentElement() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLStyle} 
     */
    get_style() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyle(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onhelp(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhelp() {
        p := VARIANT()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onclick(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onclick() {
        p := VARIANT()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondblclick(v) {
        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondblclick() {
        p := VARIANT()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeydown(v) {
        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeydown() {
        p := VARIANT()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeyup(v) {
        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeyup() {
        p := VARIANT()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeypress(v) {
        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeypress() {
        p := VARIANT()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseout(v) {
        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseout() {
        p := VARIANT()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseover(v) {
        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseover() {
        p := VARIANT()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousemove(v) {
        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousemove() {
        p := VARIANT()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousedown(v) {
        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousedown() {
        p := VARIANT()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseup(v) {
        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseup() {
        p := VARIANT()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_document() {
        result := ComCall(39, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_title(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(40, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR()
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_language(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(42, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_language() {
        p := BSTR()
        result := ComCall(43, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselectstart(v) {
        result := ComCall(44, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselectstart() {
        p := VARIANT()
        result := ComCall(45, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} varargStart 
     * @returns {HRESULT} 
     */
    scrollIntoView(varargStart) {
        result := ComCall(46, this, "ptr", varargStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pChild 
     * @returns {VARIANT_BOOL} 
     */
    contains(pChild) {
        result := ComCall(47, this, "ptr", pChild, "short*", &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_sourceIndex() {
        result := ComCall(48, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_recordNumber() {
        p := VARIANT()
        result := ComCall(49, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lang(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(50, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lang() {
        p := BSTR()
        result := ComCall(51, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetLeft() {
        result := ComCall(52, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetTop() {
        result := ComCall(53, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetWidth() {
        result := ComCall(54, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetHeight() {
        result := ComCall(55, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_offsetParent() {
        result := ComCall(56, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_innerHTML(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_innerHTML() {
        p := BSTR()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_innerText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(59, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_innerText() {
        p := BSTR()
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outerHTML(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outerHTML() {
        p := BSTR()
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outerText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outerText() {
        p := BSTR()
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} where 
     * @param {BSTR} html 
     * @returns {HRESULT} 
     */
    insertAdjacentHTML(where, html) {
        where := where is String ? BSTR.Alloc(where).Value : where
        html := html is String ? BSTR.Alloc(html).Value : html

        result := ComCall(65, this, "ptr", where, "ptr", html, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} where 
     * @param {BSTR} text 
     * @returns {HRESULT} 
     */
    insertAdjacentText(where, text) {
        where := where is String ? BSTR.Alloc(where).Value : where
        text := text is String ? BSTR.Alloc(text).Value : text

        result := ComCall(66, this, "ptr", where, "ptr", text, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_parentTextEdit() {
        result := ComCall(67, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isTextEdit() {
        result := ComCall(68, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    click() {
        result := ComCall(69, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLFiltersCollection} 
     */
    get_filters() {
        result := ComCall(70, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFiltersCollection(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondragstart(v) {
        result := ComCall(71, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragstart() {
        p := VARIANT()
        result := ComCall(72, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        String := BSTR()
        result := ComCall(73, this, "ptr", String, "HRESULT")
        return String
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeupdate(v) {
        result := ComCall(74, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeupdate() {
        p := VARIANT()
        result := ComCall(75, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onafterupdate(v) {
        result := ComCall(76, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onafterupdate() {
        p := VARIANT()
        result := ComCall(77, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerrorupdate(v) {
        result := ComCall(78, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerrorupdate() {
        p := VARIANT()
        result := ComCall(79, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowexit(v) {
        result := ComCall(80, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowexit() {
        p := VARIANT()
        result := ComCall(81, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowenter(v) {
        result := ComCall(82, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowenter() {
        p := VARIANT()
        result := ComCall(83, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondatasetchanged(v) {
        result := ComCall(84, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondatasetchanged() {
        p := VARIANT()
        result := ComCall(85, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondataavailable(v) {
        result := ComCall(86, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondataavailable() {
        p := VARIANT()
        result := ComCall(87, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondatasetcomplete(v) {
        result := ComCall(88, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondatasetcomplete() {
        p := VARIANT()
        result := ComCall(89, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfilterchange(v) {
        result := ComCall(90, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfilterchange() {
        p := VARIANT()
        result := ComCall(91, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_children() {
        result := ComCall(92, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_all() {
        result := ComCall(93, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }
}
