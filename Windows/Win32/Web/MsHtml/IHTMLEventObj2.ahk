#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElementCollection.ahk" { IHTMLElementCollection }
#Import ".\IHTMLBookmarkCollection.ahk" { IHTMLBookmarkCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLDataTransfer.ahk" { IHTMLDataTransfer }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLEventObj2 extends IDispatch {
    /**
     * The interface identifier for IHTMLEventObj2
     * @type {Guid}
     */
    static IID := Guid("{3050f48b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLEventObj2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        setAttribute         : IntPtr
        getAttribute         : IntPtr
        removeAttribute      : IntPtr
        put_propertyName     : IntPtr
        get_propertyName     : IntPtr
        putref_bookmarks     : IntPtr
        get_bookmarks        : IntPtr
        putref_recordset     : IntPtr
        get_recordset        : IntPtr
        put_dataFld          : IntPtr
        get_dataFld          : IntPtr
        putref_boundElements : IntPtr
        get_boundElements    : IntPtr
        put_repeat           : IntPtr
        get_repeat           : IntPtr
        put_srcUrn           : IntPtr
        get_srcUrn           : IntPtr
        putref_srcElement    : IntPtr
        get_srcElement       : IntPtr
        put_altKey           : IntPtr
        get_altKey           : IntPtr
        put_ctrlKey          : IntPtr
        get_ctrlKey          : IntPtr
        put_shiftKey         : IntPtr
        get_shiftKey         : IntPtr
        putref_fromElement   : IntPtr
        get_fromElement      : IntPtr
        putref_toElement     : IntPtr
        get_toElement        : IntPtr
        put_button           : IntPtr
        get_button           : IntPtr
        put_type             : IntPtr
        get_type             : IntPtr
        put_qualifier        : IntPtr
        get_qualifier        : IntPtr
        put_reason           : IntPtr
        get_reason           : IntPtr
        put_x                : IntPtr
        get_x                : IntPtr
        put_y                : IntPtr
        get_y                : IntPtr
        put_clientX          : IntPtr
        get_clientX          : IntPtr
        put_clientY          : IntPtr
        get_clientY          : IntPtr
        put_offsetX          : IntPtr
        get_offsetX          : IntPtr
        put_offsetY          : IntPtr
        get_offsetY          : IntPtr
        put_screenX          : IntPtr
        get_screenX          : IntPtr
        put_screenY          : IntPtr
        get_screenY          : IntPtr
        putref_srcFilter     : IntPtr
        get_srcFilter        : IntPtr
        get_dataTransfer     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLEventObj2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
    put_propertyName(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_propertyName() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
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

        result := ComCall(16, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dataFld() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
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
        result := ComCall(20, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_repeat() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_srcUrn(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(22, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_srcUrn() {
        p := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, p, "HRESULT")
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
        result := ComCall(26, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altKey() {
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_ctrlKey(v) {
        result := ComCall(28, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ctrlKey() {
        result := ComCall(29, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_shiftKey(v) {
        result := ComCall(30, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftKey() {
        result := ComCall(31, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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

        result := ComCall(38, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(39, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_qualifier(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(40, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_qualifier() {
        p := BSTR.Owned()
        result := ComCall(41, this, BSTR.Ptr, p, "HRESULT")
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

    Query(iid) {
        if (IHTMLEventObj2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.setAttribute := CallbackCreate(GetMethod(implObj, "setAttribute"), flags, 4)
        this.vtbl.getAttribute := CallbackCreate(GetMethod(implObj, "getAttribute"), flags, 4)
        this.vtbl.removeAttribute := CallbackCreate(GetMethod(implObj, "removeAttribute"), flags, 4)
        this.vtbl.put_propertyName := CallbackCreate(GetMethod(implObj, "put_propertyName"), flags, 2)
        this.vtbl.get_propertyName := CallbackCreate(GetMethod(implObj, "get_propertyName"), flags, 2)
        this.vtbl.putref_bookmarks := CallbackCreate(GetMethod(implObj, "putref_bookmarks"), flags, 2)
        this.vtbl.get_bookmarks := CallbackCreate(GetMethod(implObj, "get_bookmarks"), flags, 2)
        this.vtbl.putref_recordset := CallbackCreate(GetMethod(implObj, "putref_recordset"), flags, 2)
        this.vtbl.get_recordset := CallbackCreate(GetMethod(implObj, "get_recordset"), flags, 2)
        this.vtbl.put_dataFld := CallbackCreate(GetMethod(implObj, "put_dataFld"), flags, 2)
        this.vtbl.get_dataFld := CallbackCreate(GetMethod(implObj, "get_dataFld"), flags, 2)
        this.vtbl.putref_boundElements := CallbackCreate(GetMethod(implObj, "putref_boundElements"), flags, 2)
        this.vtbl.get_boundElements := CallbackCreate(GetMethod(implObj, "get_boundElements"), flags, 2)
        this.vtbl.put_repeat := CallbackCreate(GetMethod(implObj, "put_repeat"), flags, 2)
        this.vtbl.get_repeat := CallbackCreate(GetMethod(implObj, "get_repeat"), flags, 2)
        this.vtbl.put_srcUrn := CallbackCreate(GetMethod(implObj, "put_srcUrn"), flags, 2)
        this.vtbl.get_srcUrn := CallbackCreate(GetMethod(implObj, "get_srcUrn"), flags, 2)
        this.vtbl.putref_srcElement := CallbackCreate(GetMethod(implObj, "putref_srcElement"), flags, 2)
        this.vtbl.get_srcElement := CallbackCreate(GetMethod(implObj, "get_srcElement"), flags, 2)
        this.vtbl.put_altKey := CallbackCreate(GetMethod(implObj, "put_altKey"), flags, 2)
        this.vtbl.get_altKey := CallbackCreate(GetMethod(implObj, "get_altKey"), flags, 2)
        this.vtbl.put_ctrlKey := CallbackCreate(GetMethod(implObj, "put_ctrlKey"), flags, 2)
        this.vtbl.get_ctrlKey := CallbackCreate(GetMethod(implObj, "get_ctrlKey"), flags, 2)
        this.vtbl.put_shiftKey := CallbackCreate(GetMethod(implObj, "put_shiftKey"), flags, 2)
        this.vtbl.get_shiftKey := CallbackCreate(GetMethod(implObj, "get_shiftKey"), flags, 2)
        this.vtbl.putref_fromElement := CallbackCreate(GetMethod(implObj, "putref_fromElement"), flags, 2)
        this.vtbl.get_fromElement := CallbackCreate(GetMethod(implObj, "get_fromElement"), flags, 2)
        this.vtbl.putref_toElement := CallbackCreate(GetMethod(implObj, "putref_toElement"), flags, 2)
        this.vtbl.get_toElement := CallbackCreate(GetMethod(implObj, "get_toElement"), flags, 2)
        this.vtbl.put_button := CallbackCreate(GetMethod(implObj, "put_button"), flags, 2)
        this.vtbl.get_button := CallbackCreate(GetMethod(implObj, "get_button"), flags, 2)
        this.vtbl.put_type := CallbackCreate(GetMethod(implObj, "put_type"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.put_qualifier := CallbackCreate(GetMethod(implObj, "put_qualifier"), flags, 2)
        this.vtbl.get_qualifier := CallbackCreate(GetMethod(implObj, "get_qualifier"), flags, 2)
        this.vtbl.put_reason := CallbackCreate(GetMethod(implObj, "put_reason"), flags, 2)
        this.vtbl.get_reason := CallbackCreate(GetMethod(implObj, "get_reason"), flags, 2)
        this.vtbl.put_x := CallbackCreate(GetMethod(implObj, "put_x"), flags, 2)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.put_y := CallbackCreate(GetMethod(implObj, "put_y"), flags, 2)
        this.vtbl.get_y := CallbackCreate(GetMethod(implObj, "get_y"), flags, 2)
        this.vtbl.put_clientX := CallbackCreate(GetMethod(implObj, "put_clientX"), flags, 2)
        this.vtbl.get_clientX := CallbackCreate(GetMethod(implObj, "get_clientX"), flags, 2)
        this.vtbl.put_clientY := CallbackCreate(GetMethod(implObj, "put_clientY"), flags, 2)
        this.vtbl.get_clientY := CallbackCreate(GetMethod(implObj, "get_clientY"), flags, 2)
        this.vtbl.put_offsetX := CallbackCreate(GetMethod(implObj, "put_offsetX"), flags, 2)
        this.vtbl.get_offsetX := CallbackCreate(GetMethod(implObj, "get_offsetX"), flags, 2)
        this.vtbl.put_offsetY := CallbackCreate(GetMethod(implObj, "put_offsetY"), flags, 2)
        this.vtbl.get_offsetY := CallbackCreate(GetMethod(implObj, "get_offsetY"), flags, 2)
        this.vtbl.put_screenX := CallbackCreate(GetMethod(implObj, "put_screenX"), flags, 2)
        this.vtbl.get_screenX := CallbackCreate(GetMethod(implObj, "get_screenX"), flags, 2)
        this.vtbl.put_screenY := CallbackCreate(GetMethod(implObj, "put_screenY"), flags, 2)
        this.vtbl.get_screenY := CallbackCreate(GetMethod(implObj, "get_screenY"), flags, 2)
        this.vtbl.putref_srcFilter := CallbackCreate(GetMethod(implObj, "putref_srcFilter"), flags, 2)
        this.vtbl.get_srcFilter := CallbackCreate(GetMethod(implObj, "get_srcFilter"), flags, 2)
        this.vtbl.get_dataTransfer := CallbackCreate(GetMethod(implObj, "get_dataTransfer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.setAttribute)
        CallbackFree(this.vtbl.getAttribute)
        CallbackFree(this.vtbl.removeAttribute)
        CallbackFree(this.vtbl.put_propertyName)
        CallbackFree(this.vtbl.get_propertyName)
        CallbackFree(this.vtbl.putref_bookmarks)
        CallbackFree(this.vtbl.get_bookmarks)
        CallbackFree(this.vtbl.putref_recordset)
        CallbackFree(this.vtbl.get_recordset)
        CallbackFree(this.vtbl.put_dataFld)
        CallbackFree(this.vtbl.get_dataFld)
        CallbackFree(this.vtbl.putref_boundElements)
        CallbackFree(this.vtbl.get_boundElements)
        CallbackFree(this.vtbl.put_repeat)
        CallbackFree(this.vtbl.get_repeat)
        CallbackFree(this.vtbl.put_srcUrn)
        CallbackFree(this.vtbl.get_srcUrn)
        CallbackFree(this.vtbl.putref_srcElement)
        CallbackFree(this.vtbl.get_srcElement)
        CallbackFree(this.vtbl.put_altKey)
        CallbackFree(this.vtbl.get_altKey)
        CallbackFree(this.vtbl.put_ctrlKey)
        CallbackFree(this.vtbl.get_ctrlKey)
        CallbackFree(this.vtbl.put_shiftKey)
        CallbackFree(this.vtbl.get_shiftKey)
        CallbackFree(this.vtbl.putref_fromElement)
        CallbackFree(this.vtbl.get_fromElement)
        CallbackFree(this.vtbl.putref_toElement)
        CallbackFree(this.vtbl.get_toElement)
        CallbackFree(this.vtbl.put_button)
        CallbackFree(this.vtbl.get_button)
        CallbackFree(this.vtbl.put_type)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.put_qualifier)
        CallbackFree(this.vtbl.get_qualifier)
        CallbackFree(this.vtbl.put_reason)
        CallbackFree(this.vtbl.get_reason)
        CallbackFree(this.vtbl.put_x)
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.put_y)
        CallbackFree(this.vtbl.get_y)
        CallbackFree(this.vtbl.put_clientX)
        CallbackFree(this.vtbl.get_clientX)
        CallbackFree(this.vtbl.put_clientY)
        CallbackFree(this.vtbl.get_clientY)
        CallbackFree(this.vtbl.put_offsetX)
        CallbackFree(this.vtbl.get_offsetX)
        CallbackFree(this.vtbl.put_offsetY)
        CallbackFree(this.vtbl.get_offsetY)
        CallbackFree(this.vtbl.put_screenX)
        CallbackFree(this.vtbl.get_screenX)
        CallbackFree(this.vtbl.put_screenY)
        CallbackFree(this.vtbl.get_screenY)
        CallbackFree(this.vtbl.putref_srcFilter)
        CallbackFree(this.vtbl.get_srcFilter)
        CallbackFree(this.vtbl.get_dataTransfer)
    }
}
