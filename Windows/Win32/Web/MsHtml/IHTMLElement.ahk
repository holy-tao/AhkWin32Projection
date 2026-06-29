#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLStyle.ahk" { IHTMLStyle }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLFiltersCollection.ahk" { IHTMLFiltersCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElement extends IDispatch {
    /**
     * The interface identifier for IHTMLElement
     * @type {Guid}
     */
    static IID := Guid("{3050f1ff-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        setAttribute          : IntPtr
        getAttribute          : IntPtr
        removeAttribute       : IntPtr
        put_className         : IntPtr
        get_className         : IntPtr
        put_id                : IntPtr
        get_id                : IntPtr
        get_tagName           : IntPtr
        get_parentElement     : IntPtr
        get_style             : IntPtr
        put_onhelp            : IntPtr
        get_onhelp            : IntPtr
        put_onclick           : IntPtr
        get_onclick           : IntPtr
        put_ondblclick        : IntPtr
        get_ondblclick        : IntPtr
        put_onkeydown         : IntPtr
        get_onkeydown         : IntPtr
        put_onkeyup           : IntPtr
        get_onkeyup           : IntPtr
        put_onkeypress        : IntPtr
        get_onkeypress        : IntPtr
        put_onmouseout        : IntPtr
        get_onmouseout        : IntPtr
        put_onmouseover       : IntPtr
        get_onmouseover       : IntPtr
        put_onmousemove       : IntPtr
        get_onmousemove       : IntPtr
        put_onmousedown       : IntPtr
        get_onmousedown       : IntPtr
        put_onmouseup         : IntPtr
        get_onmouseup         : IntPtr
        get_document          : IntPtr
        put_title             : IntPtr
        get_title             : IntPtr
        put_language          : IntPtr
        get_language          : IntPtr
        put_onselectstart     : IntPtr
        get_onselectstart     : IntPtr
        scrollIntoView        : IntPtr
        contains              : IntPtr
        get_sourceIndex       : IntPtr
        get_recordNumber      : IntPtr
        put_lang              : IntPtr
        get_lang              : IntPtr
        get_offsetLeft        : IntPtr
        get_offsetTop         : IntPtr
        get_offsetWidth       : IntPtr
        get_offsetHeight      : IntPtr
        get_offsetParent      : IntPtr
        put_innerHTML         : IntPtr
        get_innerHTML         : IntPtr
        put_innerText         : IntPtr
        get_innerText         : IntPtr
        put_outerHTML         : IntPtr
        get_outerHTML         : IntPtr
        put_outerText         : IntPtr
        get_outerText         : IntPtr
        insertAdjacentHTML    : IntPtr
        insertAdjacentText    : IntPtr
        get_parentTextEdit    : IntPtr
        get_isTextEdit        : IntPtr
        click                 : IntPtr
        get_filters           : IntPtr
        put_ondragstart       : IntPtr
        get_ondragstart       : IntPtr
        toString              : IntPtr
        put_onbeforeupdate    : IntPtr
        get_onbeforeupdate    : IntPtr
        put_onafterupdate     : IntPtr
        get_onafterupdate     : IntPtr
        put_onerrorupdate     : IntPtr
        get_onerrorupdate     : IntPtr
        put_onrowexit         : IntPtr
        get_onrowexit         : IntPtr
        put_onrowenter        : IntPtr
        get_onrowenter        : IntPtr
        put_ondatasetchanged  : IntPtr
        get_ondatasetchanged  : IntPtr
        put_ondataavailable   : IntPtr
        get_ondataavailable   : IntPtr
        put_ondatasetcomplete : IntPtr
        get_ondatasetcomplete : IntPtr
        put_onfilterchange    : IntPtr
        get_onfilterchange    : IntPtr
        get_children          : IntPtr
        get_all               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    className {
        get => this.get_className()
        set => this.put_className(value)
    }

    /**
     * @type {BSTR} 
     */
    id {
        get => this.get_id()
        set => this.put_id(value)
    }

    /**
     * @type {BSTR} 
     */
    tagName {
        get => this.get_tagName()
    }

    /**
     * @type {IHTMLElement} 
     */
    parentElement {
        get => this.get_parentElement()
    }

    /**
     * @type {IHTMLStyle} 
     */
    style {
        get => this.get_style()
    }

    /**
     * @type {VARIANT} 
     */
    onhelp {
        get => this.get_onhelp()
        set => this.put_onhelp(value)
    }

    /**
     * @type {VARIANT} 
     */
    onclick {
        get => this.get_onclick()
        set => this.put_onclick(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondblclick {
        get => this.get_ondblclick()
        set => this.put_ondblclick(value)
    }

    /**
     * @type {VARIANT} 
     */
    onkeydown {
        get => this.get_onkeydown()
        set => this.put_onkeydown(value)
    }

    /**
     * @type {VARIANT} 
     */
    onkeyup {
        get => this.get_onkeyup()
        set => this.put_onkeyup(value)
    }

    /**
     * @type {VARIANT} 
     */
    onkeypress {
        get => this.get_onkeypress()
        set => this.put_onkeypress(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseout {
        get => this.get_onmouseout()
        set => this.put_onmouseout(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseover {
        get => this.get_onmouseover()
        set => this.put_onmouseover(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmousemove {
        get => this.get_onmousemove()
        set => this.put_onmousemove(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmousedown {
        get => this.get_onmousedown()
        set => this.put_onmousedown(value)
    }

    /**
     * @type {VARIANT} 
     */
    onmouseup {
        get => this.get_onmouseup()
        set => this.put_onmouseup(value)
    }

    /**
     * @type {IDispatch} 
     */
    document {
        get => this.get_document()
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
    language {
        get => this.get_language()
        set => this.put_language(value)
    }

    /**
     * @type {VARIANT} 
     */
    onselectstart {
        get => this.get_onselectstart()
        set => this.put_onselectstart(value)
    }

    /**
     * @type {Integer} 
     */
    sourceIndex {
        get => this.get_sourceIndex()
    }

    /**
     * @type {VARIANT} 
     */
    recordNumber {
        get => this.get_recordNumber()
    }

    /**
     * @type {BSTR} 
     */
    lang {
        get => this.get_lang()
        set => this.put_lang(value)
    }

    /**
     * @type {Integer} 
     */
    offsetLeft {
        get => this.get_offsetLeft()
    }

    /**
     * @type {Integer} 
     */
    offsetTop {
        get => this.get_offsetTop()
    }

    /**
     * @type {Integer} 
     */
    offsetWidth {
        get => this.get_offsetWidth()
    }

    /**
     * @type {Integer} 
     */
    offsetHeight {
        get => this.get_offsetHeight()
    }

    /**
     * @type {IHTMLElement} 
     */
    offsetParent {
        get => this.get_offsetParent()
    }

    /**
     * @type {BSTR} 
     */
    innerHTML {
        get => this.get_innerHTML()
        set => this.put_innerHTML(value)
    }

    /**
     * @type {BSTR} 
     */
    innerText {
        get => this.get_innerText()
        set => this.put_innerText(value)
    }

    /**
     * @type {BSTR} 
     */
    outerHTML {
        get => this.get_outerHTML()
        set => this.put_outerHTML(value)
    }

    /**
     * @type {BSTR} 
     */
    outerText {
        get => this.get_outerText()
        set => this.put_outerText(value)
    }

    /**
     * @type {IHTMLElement} 
     */
    parentTextEdit {
        get => this.get_parentTextEdit()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isTextEdit {
        get => this.get_isTextEdit()
    }

    /**
     * @type {IHTMLFiltersCollection} 
     */
    filters {
        get => this.get_filters()
    }

    /**
     * @type {VARIANT} 
     */
    ondragstart {
        get => this.get_ondragstart()
        set => this.put_ondragstart(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeupdate {
        get => this.get_onbeforeupdate()
        set => this.put_onbeforeupdate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onafterupdate {
        get => this.get_onafterupdate()
        set => this.put_onafterupdate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onerrorupdate {
        get => this.get_onerrorupdate()
        set => this.put_onerrorupdate(value)
    }

    /**
     * @type {VARIANT} 
     */
    onrowexit {
        get => this.get_onrowexit()
        set => this.put_onrowexit(value)
    }

    /**
     * @type {VARIANT} 
     */
    onrowenter {
        get => this.get_onrowenter()
        set => this.put_onrowenter(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondatasetchanged {
        get => this.get_ondatasetchanged()
        set => this.put_ondatasetchanged(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondataavailable {
        get => this.get_ondataavailable()
        set => this.put_ondataavailable(value)
    }

    /**
     * @type {VARIANT} 
     */
    ondatasetcomplete {
        get => this.get_ondatasetcomplete()
        set => this.put_ondatasetcomplete(value)
    }

    /**
     * @type {VARIANT} 
     */
    onfilterchange {
        get => this.get_onfilterchange()
        set => this.put_onfilterchange(value)
    }

    /**
     * @type {IDispatch} 
     */
    children {
        get => this.get_children()
    }

    /**
     * @type {IDispatch} 
     */
    all {
        get => this.get_all()
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

        result := ComCall(7, this, BSTR, strAttributeName, VARIANT, AttributeValue, "int", lFlags, "HRESULT")
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
        result := ComCall(8, this, BSTR, strAttributeName, "int", lFlags, VARIANT.Ptr, AttributeValue, "HRESULT")
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

        result := ComCall(9, this, BSTR, strAttributeName, "int", lFlags, VARIANT_BOOL.Ptr, &pfSuccess := 0, "HRESULT")
        return pfSuccess
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_className(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_className() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_id(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_id() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagName() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
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
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onhelp() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onclick(v) {
        result := ComCall(19, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onclick() {
        p := VARIANT()
        result := ComCall(20, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondblclick(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondblclick() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeydown(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeydown() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeyup(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeyup() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onkeypress(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onkeypress() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseout(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseout() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseover(v) {
        result := ComCall(31, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseover() {
        p := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousemove(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousemove() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmousedown(v) {
        result := ComCall(35, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmousedown() {
        p := VARIANT()
        result := ComCall(36, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onmouseup(v) {
        result := ComCall(37, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onmouseup() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
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

        result := ComCall(40, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR.Owned()
        result := ComCall(41, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_language(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(42, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_language() {
        p := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselectstart(v) {
        result := ComCall(44, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselectstart() {
        p := VARIANT()
        result := ComCall(45, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} varargStart 
     * @returns {HRESULT} 
     */
    scrollIntoView(varargStart) {
        result := ComCall(46, this, VARIANT, varargStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLElement} pChild 
     * @returns {VARIANT_BOOL} 
     */
    contains(pChild) {
        result := ComCall(47, this, "ptr", pChild, VARIANT_BOOL.Ptr, &pfResult := 0, "HRESULT")
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
        result := ComCall(49, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_lang(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(50, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_lang() {
        p := BSTR.Owned()
        result := ComCall(51, this, BSTR.Ptr, p, "HRESULT")
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

        result := ComCall(57, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_innerHTML() {
        p := BSTR.Owned()
        result := ComCall(58, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_innerText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(59, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_innerText() {
        p := BSTR.Owned()
        result := ComCall(60, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outerHTML(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outerHTML() {
        p := BSTR.Owned()
        result := ComCall(62, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_outerText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_outerText() {
        p := BSTR.Owned()
        result := ComCall(64, this, BSTR.Ptr, p, "HRESULT")
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

        result := ComCall(65, this, BSTR, where, BSTR, html, "HRESULT")
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

        result := ComCall(66, this, BSTR, where, BSTR, text, "HRESULT")
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
        result := ComCall(68, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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
        result := ComCall(71, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondragstart() {
        p := VARIANT()
        result := ComCall(72, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        _String := BSTR.Owned()
        result := ComCall(73, this, BSTR.Ptr, _String, "HRESULT")
        return _String
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeupdate(v) {
        result := ComCall(74, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeupdate() {
        p := VARIANT()
        result := ComCall(75, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onafterupdate(v) {
        result := ComCall(76, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onafterupdate() {
        p := VARIANT()
        result := ComCall(77, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerrorupdate(v) {
        result := ComCall(78, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerrorupdate() {
        p := VARIANT()
        result := ComCall(79, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowexit(v) {
        result := ComCall(80, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowexit() {
        p := VARIANT()
        result := ComCall(81, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onrowenter(v) {
        result := ComCall(82, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onrowenter() {
        p := VARIANT()
        result := ComCall(83, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondatasetchanged(v) {
        result := ComCall(84, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondatasetchanged() {
        p := VARIANT()
        result := ComCall(85, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondataavailable(v) {
        result := ComCall(86, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondataavailable() {
        p := VARIANT()
        result := ComCall(87, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_ondatasetcomplete(v) {
        result := ComCall(88, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ondatasetcomplete() {
        p := VARIANT()
        result := ComCall(89, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onfilterchange(v) {
        result := ComCall(90, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onfilterchange() {
        p := VARIANT()
        result := ComCall(91, this, VARIANT.Ptr, p, "HRESULT")
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

    Query(iid) {
        if (IHTMLElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.setAttribute := CallbackCreate(GetMethod(implObj, "setAttribute"), flags, 4)
        this.vtbl.getAttribute := CallbackCreate(GetMethod(implObj, "getAttribute"), flags, 4)
        this.vtbl.removeAttribute := CallbackCreate(GetMethod(implObj, "removeAttribute"), flags, 4)
        this.vtbl.put_className := CallbackCreate(GetMethod(implObj, "put_className"), flags, 2)
        this.vtbl.get_className := CallbackCreate(GetMethod(implObj, "get_className"), flags, 2)
        this.vtbl.put_id := CallbackCreate(GetMethod(implObj, "put_id"), flags, 2)
        this.vtbl.get_id := CallbackCreate(GetMethod(implObj, "get_id"), flags, 2)
        this.vtbl.get_tagName := CallbackCreate(GetMethod(implObj, "get_tagName"), flags, 2)
        this.vtbl.get_parentElement := CallbackCreate(GetMethod(implObj, "get_parentElement"), flags, 2)
        this.vtbl.get_style := CallbackCreate(GetMethod(implObj, "get_style"), flags, 2)
        this.vtbl.put_onhelp := CallbackCreate(GetMethod(implObj, "put_onhelp"), flags, 2)
        this.vtbl.get_onhelp := CallbackCreate(GetMethod(implObj, "get_onhelp"), flags, 2)
        this.vtbl.put_onclick := CallbackCreate(GetMethod(implObj, "put_onclick"), flags, 2)
        this.vtbl.get_onclick := CallbackCreate(GetMethod(implObj, "get_onclick"), flags, 2)
        this.vtbl.put_ondblclick := CallbackCreate(GetMethod(implObj, "put_ondblclick"), flags, 2)
        this.vtbl.get_ondblclick := CallbackCreate(GetMethod(implObj, "get_ondblclick"), flags, 2)
        this.vtbl.put_onkeydown := CallbackCreate(GetMethod(implObj, "put_onkeydown"), flags, 2)
        this.vtbl.get_onkeydown := CallbackCreate(GetMethod(implObj, "get_onkeydown"), flags, 2)
        this.vtbl.put_onkeyup := CallbackCreate(GetMethod(implObj, "put_onkeyup"), flags, 2)
        this.vtbl.get_onkeyup := CallbackCreate(GetMethod(implObj, "get_onkeyup"), flags, 2)
        this.vtbl.put_onkeypress := CallbackCreate(GetMethod(implObj, "put_onkeypress"), flags, 2)
        this.vtbl.get_onkeypress := CallbackCreate(GetMethod(implObj, "get_onkeypress"), flags, 2)
        this.vtbl.put_onmouseout := CallbackCreate(GetMethod(implObj, "put_onmouseout"), flags, 2)
        this.vtbl.get_onmouseout := CallbackCreate(GetMethod(implObj, "get_onmouseout"), flags, 2)
        this.vtbl.put_onmouseover := CallbackCreate(GetMethod(implObj, "put_onmouseover"), flags, 2)
        this.vtbl.get_onmouseover := CallbackCreate(GetMethod(implObj, "get_onmouseover"), flags, 2)
        this.vtbl.put_onmousemove := CallbackCreate(GetMethod(implObj, "put_onmousemove"), flags, 2)
        this.vtbl.get_onmousemove := CallbackCreate(GetMethod(implObj, "get_onmousemove"), flags, 2)
        this.vtbl.put_onmousedown := CallbackCreate(GetMethod(implObj, "put_onmousedown"), flags, 2)
        this.vtbl.get_onmousedown := CallbackCreate(GetMethod(implObj, "get_onmousedown"), flags, 2)
        this.vtbl.put_onmouseup := CallbackCreate(GetMethod(implObj, "put_onmouseup"), flags, 2)
        this.vtbl.get_onmouseup := CallbackCreate(GetMethod(implObj, "get_onmouseup"), flags, 2)
        this.vtbl.get_document := CallbackCreate(GetMethod(implObj, "get_document"), flags, 2)
        this.vtbl.put_title := CallbackCreate(GetMethod(implObj, "put_title"), flags, 2)
        this.vtbl.get_title := CallbackCreate(GetMethod(implObj, "get_title"), flags, 2)
        this.vtbl.put_language := CallbackCreate(GetMethod(implObj, "put_language"), flags, 2)
        this.vtbl.get_language := CallbackCreate(GetMethod(implObj, "get_language"), flags, 2)
        this.vtbl.put_onselectstart := CallbackCreate(GetMethod(implObj, "put_onselectstart"), flags, 2)
        this.vtbl.get_onselectstart := CallbackCreate(GetMethod(implObj, "get_onselectstart"), flags, 2)
        this.vtbl.scrollIntoView := CallbackCreate(GetMethod(implObj, "scrollIntoView"), flags, 2)
        this.vtbl.contains := CallbackCreate(GetMethod(implObj, "contains"), flags, 3)
        this.vtbl.get_sourceIndex := CallbackCreate(GetMethod(implObj, "get_sourceIndex"), flags, 2)
        this.vtbl.get_recordNumber := CallbackCreate(GetMethod(implObj, "get_recordNumber"), flags, 2)
        this.vtbl.put_lang := CallbackCreate(GetMethod(implObj, "put_lang"), flags, 2)
        this.vtbl.get_lang := CallbackCreate(GetMethod(implObj, "get_lang"), flags, 2)
        this.vtbl.get_offsetLeft := CallbackCreate(GetMethod(implObj, "get_offsetLeft"), flags, 2)
        this.vtbl.get_offsetTop := CallbackCreate(GetMethod(implObj, "get_offsetTop"), flags, 2)
        this.vtbl.get_offsetWidth := CallbackCreate(GetMethod(implObj, "get_offsetWidth"), flags, 2)
        this.vtbl.get_offsetHeight := CallbackCreate(GetMethod(implObj, "get_offsetHeight"), flags, 2)
        this.vtbl.get_offsetParent := CallbackCreate(GetMethod(implObj, "get_offsetParent"), flags, 2)
        this.vtbl.put_innerHTML := CallbackCreate(GetMethod(implObj, "put_innerHTML"), flags, 2)
        this.vtbl.get_innerHTML := CallbackCreate(GetMethod(implObj, "get_innerHTML"), flags, 2)
        this.vtbl.put_innerText := CallbackCreate(GetMethod(implObj, "put_innerText"), flags, 2)
        this.vtbl.get_innerText := CallbackCreate(GetMethod(implObj, "get_innerText"), flags, 2)
        this.vtbl.put_outerHTML := CallbackCreate(GetMethod(implObj, "put_outerHTML"), flags, 2)
        this.vtbl.get_outerHTML := CallbackCreate(GetMethod(implObj, "get_outerHTML"), flags, 2)
        this.vtbl.put_outerText := CallbackCreate(GetMethod(implObj, "put_outerText"), flags, 2)
        this.vtbl.get_outerText := CallbackCreate(GetMethod(implObj, "get_outerText"), flags, 2)
        this.vtbl.insertAdjacentHTML := CallbackCreate(GetMethod(implObj, "insertAdjacentHTML"), flags, 3)
        this.vtbl.insertAdjacentText := CallbackCreate(GetMethod(implObj, "insertAdjacentText"), flags, 3)
        this.vtbl.get_parentTextEdit := CallbackCreate(GetMethod(implObj, "get_parentTextEdit"), flags, 2)
        this.vtbl.get_isTextEdit := CallbackCreate(GetMethod(implObj, "get_isTextEdit"), flags, 2)
        this.vtbl.click := CallbackCreate(GetMethod(implObj, "click"), flags, 1)
        this.vtbl.get_filters := CallbackCreate(GetMethod(implObj, "get_filters"), flags, 2)
        this.vtbl.put_ondragstart := CallbackCreate(GetMethod(implObj, "put_ondragstart"), flags, 2)
        this.vtbl.get_ondragstart := CallbackCreate(GetMethod(implObj, "get_ondragstart"), flags, 2)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
        this.vtbl.put_onbeforeupdate := CallbackCreate(GetMethod(implObj, "put_onbeforeupdate"), flags, 2)
        this.vtbl.get_onbeforeupdate := CallbackCreate(GetMethod(implObj, "get_onbeforeupdate"), flags, 2)
        this.vtbl.put_onafterupdate := CallbackCreate(GetMethod(implObj, "put_onafterupdate"), flags, 2)
        this.vtbl.get_onafterupdate := CallbackCreate(GetMethod(implObj, "get_onafterupdate"), flags, 2)
        this.vtbl.put_onerrorupdate := CallbackCreate(GetMethod(implObj, "put_onerrorupdate"), flags, 2)
        this.vtbl.get_onerrorupdate := CallbackCreate(GetMethod(implObj, "get_onerrorupdate"), flags, 2)
        this.vtbl.put_onrowexit := CallbackCreate(GetMethod(implObj, "put_onrowexit"), flags, 2)
        this.vtbl.get_onrowexit := CallbackCreate(GetMethod(implObj, "get_onrowexit"), flags, 2)
        this.vtbl.put_onrowenter := CallbackCreate(GetMethod(implObj, "put_onrowenter"), flags, 2)
        this.vtbl.get_onrowenter := CallbackCreate(GetMethod(implObj, "get_onrowenter"), flags, 2)
        this.vtbl.put_ondatasetchanged := CallbackCreate(GetMethod(implObj, "put_ondatasetchanged"), flags, 2)
        this.vtbl.get_ondatasetchanged := CallbackCreate(GetMethod(implObj, "get_ondatasetchanged"), flags, 2)
        this.vtbl.put_ondataavailable := CallbackCreate(GetMethod(implObj, "put_ondataavailable"), flags, 2)
        this.vtbl.get_ondataavailable := CallbackCreate(GetMethod(implObj, "get_ondataavailable"), flags, 2)
        this.vtbl.put_ondatasetcomplete := CallbackCreate(GetMethod(implObj, "put_ondatasetcomplete"), flags, 2)
        this.vtbl.get_ondatasetcomplete := CallbackCreate(GetMethod(implObj, "get_ondatasetcomplete"), flags, 2)
        this.vtbl.put_onfilterchange := CallbackCreate(GetMethod(implObj, "put_onfilterchange"), flags, 2)
        this.vtbl.get_onfilterchange := CallbackCreate(GetMethod(implObj, "get_onfilterchange"), flags, 2)
        this.vtbl.get_children := CallbackCreate(GetMethod(implObj, "get_children"), flags, 2)
        this.vtbl.get_all := CallbackCreate(GetMethod(implObj, "get_all"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.setAttribute)
        CallbackFree(this.vtbl.getAttribute)
        CallbackFree(this.vtbl.removeAttribute)
        CallbackFree(this.vtbl.put_className)
        CallbackFree(this.vtbl.get_className)
        CallbackFree(this.vtbl.put_id)
        CallbackFree(this.vtbl.get_id)
        CallbackFree(this.vtbl.get_tagName)
        CallbackFree(this.vtbl.get_parentElement)
        CallbackFree(this.vtbl.get_style)
        CallbackFree(this.vtbl.put_onhelp)
        CallbackFree(this.vtbl.get_onhelp)
        CallbackFree(this.vtbl.put_onclick)
        CallbackFree(this.vtbl.get_onclick)
        CallbackFree(this.vtbl.put_ondblclick)
        CallbackFree(this.vtbl.get_ondblclick)
        CallbackFree(this.vtbl.put_onkeydown)
        CallbackFree(this.vtbl.get_onkeydown)
        CallbackFree(this.vtbl.put_onkeyup)
        CallbackFree(this.vtbl.get_onkeyup)
        CallbackFree(this.vtbl.put_onkeypress)
        CallbackFree(this.vtbl.get_onkeypress)
        CallbackFree(this.vtbl.put_onmouseout)
        CallbackFree(this.vtbl.get_onmouseout)
        CallbackFree(this.vtbl.put_onmouseover)
        CallbackFree(this.vtbl.get_onmouseover)
        CallbackFree(this.vtbl.put_onmousemove)
        CallbackFree(this.vtbl.get_onmousemove)
        CallbackFree(this.vtbl.put_onmousedown)
        CallbackFree(this.vtbl.get_onmousedown)
        CallbackFree(this.vtbl.put_onmouseup)
        CallbackFree(this.vtbl.get_onmouseup)
        CallbackFree(this.vtbl.get_document)
        CallbackFree(this.vtbl.put_title)
        CallbackFree(this.vtbl.get_title)
        CallbackFree(this.vtbl.put_language)
        CallbackFree(this.vtbl.get_language)
        CallbackFree(this.vtbl.put_onselectstart)
        CallbackFree(this.vtbl.get_onselectstart)
        CallbackFree(this.vtbl.scrollIntoView)
        CallbackFree(this.vtbl.contains)
        CallbackFree(this.vtbl.get_sourceIndex)
        CallbackFree(this.vtbl.get_recordNumber)
        CallbackFree(this.vtbl.put_lang)
        CallbackFree(this.vtbl.get_lang)
        CallbackFree(this.vtbl.get_offsetLeft)
        CallbackFree(this.vtbl.get_offsetTop)
        CallbackFree(this.vtbl.get_offsetWidth)
        CallbackFree(this.vtbl.get_offsetHeight)
        CallbackFree(this.vtbl.get_offsetParent)
        CallbackFree(this.vtbl.put_innerHTML)
        CallbackFree(this.vtbl.get_innerHTML)
        CallbackFree(this.vtbl.put_innerText)
        CallbackFree(this.vtbl.get_innerText)
        CallbackFree(this.vtbl.put_outerHTML)
        CallbackFree(this.vtbl.get_outerHTML)
        CallbackFree(this.vtbl.put_outerText)
        CallbackFree(this.vtbl.get_outerText)
        CallbackFree(this.vtbl.insertAdjacentHTML)
        CallbackFree(this.vtbl.insertAdjacentText)
        CallbackFree(this.vtbl.get_parentTextEdit)
        CallbackFree(this.vtbl.get_isTextEdit)
        CallbackFree(this.vtbl.click)
        CallbackFree(this.vtbl.get_filters)
        CallbackFree(this.vtbl.put_ondragstart)
        CallbackFree(this.vtbl.get_ondragstart)
        CallbackFree(this.vtbl.toString)
        CallbackFree(this.vtbl.put_onbeforeupdate)
        CallbackFree(this.vtbl.get_onbeforeupdate)
        CallbackFree(this.vtbl.put_onafterupdate)
        CallbackFree(this.vtbl.get_onafterupdate)
        CallbackFree(this.vtbl.put_onerrorupdate)
        CallbackFree(this.vtbl.get_onerrorupdate)
        CallbackFree(this.vtbl.put_onrowexit)
        CallbackFree(this.vtbl.get_onrowexit)
        CallbackFree(this.vtbl.put_onrowenter)
        CallbackFree(this.vtbl.get_onrowenter)
        CallbackFree(this.vtbl.put_ondatasetchanged)
        CallbackFree(this.vtbl.get_ondatasetchanged)
        CallbackFree(this.vtbl.put_ondataavailable)
        CallbackFree(this.vtbl.get_ondataavailable)
        CallbackFree(this.vtbl.put_ondatasetcomplete)
        CallbackFree(this.vtbl.get_ondatasetcomplete)
        CallbackFree(this.vtbl.put_onfilterchange)
        CallbackFree(this.vtbl.get_onfilterchange)
        CallbackFree(this.vtbl.get_children)
        CallbackFree(this.vtbl.get_all)
    }
}
