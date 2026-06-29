#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IHeaderFooter extends IDispatch {
    /**
     * The interface identifier for IHeaderFooter
     * @type {Guid}
     */
    static IID := Guid("{3050f6ce-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHeaderFooter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_htmlHead  : IntPtr
        get_htmlFoot  : IntPtr
        put_textHead  : IntPtr
        get_textHead  : IntPtr
        put_textFoot  : IntPtr
        get_textFoot  : IntPtr
        put_page      : IntPtr
        get_page      : IntPtr
        put_pageTotal : IntPtr
        get_pageTotal : IntPtr
        put_URL       : IntPtr
        get_URL       : IntPtr
        put_title     : IntPtr
        get_title     : IntPtr
        put_dateShort : IntPtr
        get_dateShort : IntPtr
        put_dateLong  : IntPtr
        get_dateLong  : IntPtr
        put_timeShort : IntPtr
        get_timeShort : IntPtr
        put_timeLong  : IntPtr
        get_timeLong  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHeaderFooter.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_htmlFoot() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textHead(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textHead() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textFoot(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textFoot() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
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

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_URL() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_title(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dateShort(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dateShort() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dateLong(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dateLong() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_timeShort(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_timeShort() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_timeLong(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_timeLong() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHeaderFooter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_htmlHead := CallbackCreate(GetMethod(implObj, "get_htmlHead"), flags, 2)
        this.vtbl.get_htmlFoot := CallbackCreate(GetMethod(implObj, "get_htmlFoot"), flags, 2)
        this.vtbl.put_textHead := CallbackCreate(GetMethod(implObj, "put_textHead"), flags, 2)
        this.vtbl.get_textHead := CallbackCreate(GetMethod(implObj, "get_textHead"), flags, 2)
        this.vtbl.put_textFoot := CallbackCreate(GetMethod(implObj, "put_textFoot"), flags, 2)
        this.vtbl.get_textFoot := CallbackCreate(GetMethod(implObj, "get_textFoot"), flags, 2)
        this.vtbl.put_page := CallbackCreate(GetMethod(implObj, "put_page"), flags, 2)
        this.vtbl.get_page := CallbackCreate(GetMethod(implObj, "get_page"), flags, 2)
        this.vtbl.put_pageTotal := CallbackCreate(GetMethod(implObj, "put_pageTotal"), flags, 2)
        this.vtbl.get_pageTotal := CallbackCreate(GetMethod(implObj, "get_pageTotal"), flags, 2)
        this.vtbl.put_URL := CallbackCreate(GetMethod(implObj, "put_URL"), flags, 2)
        this.vtbl.get_URL := CallbackCreate(GetMethod(implObj, "get_URL"), flags, 2)
        this.vtbl.put_title := CallbackCreate(GetMethod(implObj, "put_title"), flags, 2)
        this.vtbl.get_title := CallbackCreate(GetMethod(implObj, "get_title"), flags, 2)
        this.vtbl.put_dateShort := CallbackCreate(GetMethod(implObj, "put_dateShort"), flags, 2)
        this.vtbl.get_dateShort := CallbackCreate(GetMethod(implObj, "get_dateShort"), flags, 2)
        this.vtbl.put_dateLong := CallbackCreate(GetMethod(implObj, "put_dateLong"), flags, 2)
        this.vtbl.get_dateLong := CallbackCreate(GetMethod(implObj, "get_dateLong"), flags, 2)
        this.vtbl.put_timeShort := CallbackCreate(GetMethod(implObj, "put_timeShort"), flags, 2)
        this.vtbl.get_timeShort := CallbackCreate(GetMethod(implObj, "get_timeShort"), flags, 2)
        this.vtbl.put_timeLong := CallbackCreate(GetMethod(implObj, "put_timeLong"), flags, 2)
        this.vtbl.get_timeLong := CallbackCreate(GetMethod(implObj, "get_timeLong"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_htmlHead)
        CallbackFree(this.vtbl.get_htmlFoot)
        CallbackFree(this.vtbl.put_textHead)
        CallbackFree(this.vtbl.get_textHead)
        CallbackFree(this.vtbl.put_textFoot)
        CallbackFree(this.vtbl.get_textFoot)
        CallbackFree(this.vtbl.put_page)
        CallbackFree(this.vtbl.get_page)
        CallbackFree(this.vtbl.put_pageTotal)
        CallbackFree(this.vtbl.get_pageTotal)
        CallbackFree(this.vtbl.put_URL)
        CallbackFree(this.vtbl.get_URL)
        CallbackFree(this.vtbl.put_title)
        CallbackFree(this.vtbl.get_title)
        CallbackFree(this.vtbl.put_dateShort)
        CallbackFree(this.vtbl.get_dateShort)
        CallbackFree(this.vtbl.put_dateLong)
        CallbackFree(this.vtbl.get_dateLong)
        CallbackFree(this.vtbl.put_timeShort)
        CallbackFree(this.vtbl.get_timeShort)
        CallbackFree(this.vtbl.put_timeLong)
        CallbackFree(this.vtbl.get_timeLong)
    }
}
