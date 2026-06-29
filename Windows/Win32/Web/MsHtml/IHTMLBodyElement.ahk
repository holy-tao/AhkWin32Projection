#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLTxtRange.ahk" { IHTMLTxtRange }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLBodyElement extends IDispatch {
    /**
     * The interface identifier for IHTMLBodyElement
     * @type {Guid}
     */
    static IID := Guid("{3050f1d8-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLBodyElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_background     : IntPtr
        get_background     : IntPtr
        put_bgProperties   : IntPtr
        get_bgProperties   : IntPtr
        put_leftMargin     : IntPtr
        get_leftMargin     : IntPtr
        put_topMargin      : IntPtr
        get_topMargin      : IntPtr
        put_rightMargin    : IntPtr
        get_rightMargin    : IntPtr
        put_bottomMargin   : IntPtr
        get_bottomMargin   : IntPtr
        put_noWrap         : IntPtr
        get_noWrap         : IntPtr
        put_bgColor        : IntPtr
        get_bgColor        : IntPtr
        put_text           : IntPtr
        get_text           : IntPtr
        put_link           : IntPtr
        get_link           : IntPtr
        put_vLink          : IntPtr
        get_vLink          : IntPtr
        put_aLink          : IntPtr
        get_aLink          : IntPtr
        put_onload         : IntPtr
        get_onload         : IntPtr
        put_onunload       : IntPtr
        get_onunload       : IntPtr
        put_scroll         : IntPtr
        get_scroll         : IntPtr
        put_onselect       : IntPtr
        get_onselect       : IntPtr
        put_onbeforeunload : IntPtr
        get_onbeforeunload : IntPtr
        createTextRange    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLBodyElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    background {
        get => this.get_background()
        set => this.put_background(value)
    }

    /**
     * @type {BSTR} 
     */
    bgProperties {
        get => this.get_bgProperties()
        set => this.put_bgProperties(value)
    }

    /**
     * @type {VARIANT} 
     */
    leftMargin {
        get => this.get_leftMargin()
        set => this.put_leftMargin(value)
    }

    /**
     * @type {VARIANT} 
     */
    topMargin {
        get => this.get_topMargin()
        set => this.put_topMargin(value)
    }

    /**
     * @type {VARIANT} 
     */
    rightMargin {
        get => this.get_rightMargin()
        set => this.put_rightMargin(value)
    }

    /**
     * @type {VARIANT} 
     */
    bottomMargin {
        get => this.get_bottomMargin()
        set => this.put_bottomMargin(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    noWrap {
        get => this.get_noWrap()
        set => this.put_noWrap(value)
    }

    /**
     * @type {VARIANT} 
     */
    bgColor {
        get => this.get_bgColor()
        set => this.put_bgColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    text {
        get => this.get_text()
        set => this.put_text(value)
    }

    /**
     * @type {VARIANT} 
     */
    link {
        get => this.get_link()
        set => this.put_link(value)
    }

    /**
     * @type {VARIANT} 
     */
    vLink {
        get => this.get_vLink()
        set => this.put_vLink(value)
    }

    /**
     * @type {VARIANT} 
     */
    aLink {
        get => this.get_aLink()
        set => this.put_aLink(value)
    }

    /**
     * @type {VARIANT} 
     */
    onload {
        get => this.get_onload()
        set => this.put_onload(value)
    }

    /**
     * @type {VARIANT} 
     */
    onunload {
        get => this.get_onunload()
        set => this.put_onunload(value)
    }

    /**
     * @type {BSTR} 
     */
    scroll {
        get => this.get_scroll()
        set => this.put_scroll(value)
    }

    /**
     * @type {VARIANT} 
     */
    onselect {
        get => this.get_onselect()
        set => this.put_onselect(value)
    }

    /**
     * @type {VARIANT} 
     */
    onbeforeunload {
        get => this.get_onbeforeunload()
        set => this.put_onbeforeunload(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_background(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_background() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_bgProperties(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_bgProperties() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_leftMargin(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_leftMargin() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_topMargin(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_topMargin() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_rightMargin(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_rightMargin() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bottomMargin(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bottomMargin() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_noWrap(v) {
        result := ComCall(19, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_noWrap() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_text(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_text() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_link(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_link() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_vLink(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_vLink() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_aLink(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_aLink() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(31, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onunload(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onunload() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_scroll(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_scroll() {
        p := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onselect(v) {
        result := ComCall(37, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onselect() {
        p := VARIANT()
        result := ComCall(38, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeunload(v) {
        result := ComCall(39, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeunload() {
        p := VARIANT()
        result := ComCall(40, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLTxtRange} 
     */
    createTextRange() {
        result := ComCall(41, this, "ptr*", &range := 0, "HRESULT")
        return IHTMLTxtRange(range)
    }

    Query(iid) {
        if (IHTMLBodyElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_background := CallbackCreate(GetMethod(implObj, "put_background"), flags, 2)
        this.vtbl.get_background := CallbackCreate(GetMethod(implObj, "get_background"), flags, 2)
        this.vtbl.put_bgProperties := CallbackCreate(GetMethod(implObj, "put_bgProperties"), flags, 2)
        this.vtbl.get_bgProperties := CallbackCreate(GetMethod(implObj, "get_bgProperties"), flags, 2)
        this.vtbl.put_leftMargin := CallbackCreate(GetMethod(implObj, "put_leftMargin"), flags, 2)
        this.vtbl.get_leftMargin := CallbackCreate(GetMethod(implObj, "get_leftMargin"), flags, 2)
        this.vtbl.put_topMargin := CallbackCreate(GetMethod(implObj, "put_topMargin"), flags, 2)
        this.vtbl.get_topMargin := CallbackCreate(GetMethod(implObj, "get_topMargin"), flags, 2)
        this.vtbl.put_rightMargin := CallbackCreate(GetMethod(implObj, "put_rightMargin"), flags, 2)
        this.vtbl.get_rightMargin := CallbackCreate(GetMethod(implObj, "get_rightMargin"), flags, 2)
        this.vtbl.put_bottomMargin := CallbackCreate(GetMethod(implObj, "put_bottomMargin"), flags, 2)
        this.vtbl.get_bottomMargin := CallbackCreate(GetMethod(implObj, "get_bottomMargin"), flags, 2)
        this.vtbl.put_noWrap := CallbackCreate(GetMethod(implObj, "put_noWrap"), flags, 2)
        this.vtbl.get_noWrap := CallbackCreate(GetMethod(implObj, "get_noWrap"), flags, 2)
        this.vtbl.put_bgColor := CallbackCreate(GetMethod(implObj, "put_bgColor"), flags, 2)
        this.vtbl.get_bgColor := CallbackCreate(GetMethod(implObj, "get_bgColor"), flags, 2)
        this.vtbl.put_text := CallbackCreate(GetMethod(implObj, "put_text"), flags, 2)
        this.vtbl.get_text := CallbackCreate(GetMethod(implObj, "get_text"), flags, 2)
        this.vtbl.put_link := CallbackCreate(GetMethod(implObj, "put_link"), flags, 2)
        this.vtbl.get_link := CallbackCreate(GetMethod(implObj, "get_link"), flags, 2)
        this.vtbl.put_vLink := CallbackCreate(GetMethod(implObj, "put_vLink"), flags, 2)
        this.vtbl.get_vLink := CallbackCreate(GetMethod(implObj, "get_vLink"), flags, 2)
        this.vtbl.put_aLink := CallbackCreate(GetMethod(implObj, "put_aLink"), flags, 2)
        this.vtbl.get_aLink := CallbackCreate(GetMethod(implObj, "get_aLink"), flags, 2)
        this.vtbl.put_onload := CallbackCreate(GetMethod(implObj, "put_onload"), flags, 2)
        this.vtbl.get_onload := CallbackCreate(GetMethod(implObj, "get_onload"), flags, 2)
        this.vtbl.put_onunload := CallbackCreate(GetMethod(implObj, "put_onunload"), flags, 2)
        this.vtbl.get_onunload := CallbackCreate(GetMethod(implObj, "get_onunload"), flags, 2)
        this.vtbl.put_scroll := CallbackCreate(GetMethod(implObj, "put_scroll"), flags, 2)
        this.vtbl.get_scroll := CallbackCreate(GetMethod(implObj, "get_scroll"), flags, 2)
        this.vtbl.put_onselect := CallbackCreate(GetMethod(implObj, "put_onselect"), flags, 2)
        this.vtbl.get_onselect := CallbackCreate(GetMethod(implObj, "get_onselect"), flags, 2)
        this.vtbl.put_onbeforeunload := CallbackCreate(GetMethod(implObj, "put_onbeforeunload"), flags, 2)
        this.vtbl.get_onbeforeunload := CallbackCreate(GetMethod(implObj, "get_onbeforeunload"), flags, 2)
        this.vtbl.createTextRange := CallbackCreate(GetMethod(implObj, "createTextRange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_background)
        CallbackFree(this.vtbl.get_background)
        CallbackFree(this.vtbl.put_bgProperties)
        CallbackFree(this.vtbl.get_bgProperties)
        CallbackFree(this.vtbl.put_leftMargin)
        CallbackFree(this.vtbl.get_leftMargin)
        CallbackFree(this.vtbl.put_topMargin)
        CallbackFree(this.vtbl.get_topMargin)
        CallbackFree(this.vtbl.put_rightMargin)
        CallbackFree(this.vtbl.get_rightMargin)
        CallbackFree(this.vtbl.put_bottomMargin)
        CallbackFree(this.vtbl.get_bottomMargin)
        CallbackFree(this.vtbl.put_noWrap)
        CallbackFree(this.vtbl.get_noWrap)
        CallbackFree(this.vtbl.put_bgColor)
        CallbackFree(this.vtbl.get_bgColor)
        CallbackFree(this.vtbl.put_text)
        CallbackFree(this.vtbl.get_text)
        CallbackFree(this.vtbl.put_link)
        CallbackFree(this.vtbl.get_link)
        CallbackFree(this.vtbl.put_vLink)
        CallbackFree(this.vtbl.get_vLink)
        CallbackFree(this.vtbl.put_aLink)
        CallbackFree(this.vtbl.get_aLink)
        CallbackFree(this.vtbl.put_onload)
        CallbackFree(this.vtbl.get_onload)
        CallbackFree(this.vtbl.put_onunload)
        CallbackFree(this.vtbl.get_onunload)
        CallbackFree(this.vtbl.put_scroll)
        CallbackFree(this.vtbl.get_scroll)
        CallbackFree(this.vtbl.put_onselect)
        CallbackFree(this.vtbl.get_onselect)
        CallbackFree(this.vtbl.put_onbeforeunload)
        CallbackFree(this.vtbl.get_onbeforeunload)
        CallbackFree(this.vtbl.createTextRange)
    }
}
