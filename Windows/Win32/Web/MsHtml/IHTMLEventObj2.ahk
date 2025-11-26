#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLBookmarkCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IHTMLElementCollection.ahk
#Include .\IHTMLElement.ahk
#Include .\IHTMLDataTransfer.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEventObj2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLEventObj2
     * @type {Guid}
     */
    static IID => Guid("{3050f48b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setAttribute", "getAttribute", "removeAttribute", "put_propertyName", "get_propertyName", "putref_bookmarks", "get_bookmarks", "putref_recordset", "get_recordset", "put_dataFld", "get_dataFld", "putref_boundElements", "get_boundElements", "put_repeat", "get_repeat", "put_srcUrn", "get_srcUrn", "putref_srcElement", "get_srcElement", "put_altKey", "get_altKey", "put_ctrlKey", "get_ctrlKey", "put_shiftKey", "get_shiftKey", "putref_fromElement", "get_fromElement", "putref_toElement", "get_toElement", "put_button", "get_button", "put_type", "get_type", "put_qualifier", "get_qualifier", "put_reason", "get_reason", "put_x", "get_x", "put_y", "get_y", "put_clientX", "get_clientX", "put_clientY", "get_clientY", "put_offsetX", "get_offsetX", "put_offsetY", "get_offsetY", "put_screenX", "get_screenX", "put_screenY", "get_screenY", "putref_srcFilter", "get_srcFilter", "get_dataTransfer"]

    /**
     * @type {BSTR} 
     */
    propertyName {
        get => this.get_propertyName()
        set => this.put_propertyName(value)
    }

    /**
     * @type {IHTMLBookmarkCollection} 
     */
    bookmarks {
        get => this.get_bookmarks()
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
    dataFld {
        get => this.get_dataFld()
        set => this.put_dataFld(value)
    }

    /**
     * @type {IHTMLElementCollection} 
     */
    boundElements {
        get => this.get_boundElements()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    repeat {
        get => this.get_repeat()
        set => this.put_repeat(value)
    }

    /**
     * @type {BSTR} 
     */
    srcUrn {
        get => this.get_srcUrn()
        set => this.put_srcUrn(value)
    }

    /**
     * @type {IHTMLElement} 
     */
    srcElement {
        get => this.get_srcElement()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    altKey {
        get => this.get_altKey()
        set => this.put_altKey(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ctrlKey {
        get => this.get_ctrlKey()
        set => this.put_ctrlKey(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    shiftKey {
        get => this.get_shiftKey()
        set => this.put_shiftKey(value)
    }

    /**
     * @type {IHTMLElement} 
     */
    fromElement {
        get => this.get_fromElement()
    }

    /**
     * @type {IHTMLElement} 
     */
    toElement {
        get => this.get_toElement()
    }

    /**
     * @type {Integer} 
     */
    button {
        get => this.get_button()
        set => this.put_button(value)
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
        set => this.put_type(value)
    }

    /**
     * @type {BSTR} 
     */
    qualifier {
        get => this.get_qualifier()
        set => this.put_qualifier(value)
    }

    /**
     * @type {Integer} 
     */
    reason {
        get => this.get_reason()
        set => this.put_reason(value)
    }

    /**
     * @type {Integer} 
     */
    x {
        get => this.get_x()
        set => this.put_x(value)
    }

    /**
     * @type {Integer} 
     */
    y {
        get => this.get_y()
        set => this.put_y(value)
    }

    /**
     * @type {Integer} 
     */
    clientX {
        get => this.get_clientX()
        set => this.put_clientX(value)
    }

    /**
     * @type {Integer} 
     */
    clientY {
        get => this.get_clientY()
        set => this.put_clientY(value)
    }

    /**
     * @type {Integer} 
     */
    offsetX {
        get => this.get_offsetX()
        set => this.put_offsetX(value)
    }

    /**
     * @type {Integer} 
     */
    offsetY {
        get => this.get_offsetY()
        set => this.put_offsetY(value)
    }

    /**
     * @type {Integer} 
     */
    screenX {
        get => this.get_screenX()
        set => this.put_screenX(value)
    }

    /**
     * @type {Integer} 
     */
    screenY {
        get => this.get_screenY()
        set => this.put_screenY(value)
    }

    /**
     * @type {IDispatch} 
     */
    srcFilter {
        get => this.get_srcFilter()
    }

    /**
     * @type {IHTMLDataTransfer} 
     */
    dataTransfer {
        get => this.get_dataTransfer()
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
    put_propertyName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_propertyName() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IHTMLBookmarkCollection} v 
     * @returns {HRESULT} 
     */
    putref_bookmarks(v) {
        result := ComCall(12, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLBookmarkCollection} 
     */
    get_bookmarks() {
        result := ComCall(13, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLBookmarkCollection(p)
    }

    /**
     * 
     * @param {IDispatch} v 
     * @returns {HRESULT} 
     */
    putref_recordset(v) {
        result := ComCall(14, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_recordset() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dataFld(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dataFld() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IHTMLElementCollection} v 
     * @returns {HRESULT} 
     */
    putref_boundElements(v) {
        result := ComCall(18, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLElementCollection} 
     */
    get_boundElements() {
        result := ComCall(19, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElementCollection(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_repeat(v) {
        result := ComCall(20, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_repeat() {
        result := ComCall(21, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_srcUrn(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(22, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_srcUrn() {
        p := BSTR()
        result := ComCall(23, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IHTMLElement} v 
     * @returns {HRESULT} 
     */
    putref_srcElement(v) {
        result := ComCall(24, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_srcElement() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_altKey(v) {
        result := ComCall(26, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altKey() {
        result := ComCall(27, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_ctrlKey(v) {
        result := ComCall(28, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ctrlKey() {
        result := ComCall(29, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_shiftKey(v) {
        result := ComCall(30, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftKey() {
        result := ComCall(31, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IHTMLElement} v 
     * @returns {HRESULT} 
     */
    putref_fromElement(v) {
        result := ComCall(32, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_fromElement() {
        result := ComCall(33, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @param {IHTMLElement} v 
     * @returns {HRESULT} 
     */
    putref_toElement(v) {
        result := ComCall(34, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_toElement() {
        result := ComCall(35, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_button(v) {
        result := ComCall(36, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_button() {
        result := ComCall(37, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_type(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(38, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR()
        result := ComCall(39, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_qualifier(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(40, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_qualifier() {
        p := BSTR()
        result := ComCall(41, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_reason(v) {
        result := ComCall(42, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_reason() {
        result := ComCall(43, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_x(v) {
        result := ComCall(44, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_x() {
        result := ComCall(45, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_y(v) {
        result := ComCall(46, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_y() {
        result := ComCall(47, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_clientX(v) {
        result := ComCall(48, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientX() {
        result := ComCall(49, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_clientY(v) {
        result := ComCall(50, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientY() {
        result := ComCall(51, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_offsetX(v) {
        result := ComCall(52, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetX() {
        result := ComCall(53, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_offsetY(v) {
        result := ComCall(54, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetY() {
        result := ComCall(55, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_screenX(v) {
        result := ComCall(56, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenX() {
        result := ComCall(57, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_screenY(v) {
        result := ComCall(58, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenY() {
        result := ComCall(59, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IDispatch} v 
     * @returns {HRESULT} 
     */
    putref_srcFilter(v) {
        result := ComCall(60, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_srcFilter() {
        result := ComCall(61, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IHTMLDataTransfer} 
     */
    get_dataTransfer() {
        result := ComCall(62, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDataTransfer(p)
    }
}
