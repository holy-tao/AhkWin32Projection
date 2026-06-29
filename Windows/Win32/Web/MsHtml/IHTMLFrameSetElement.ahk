#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLFrameSetElement extends IDispatch {
    /**
     * The interface identifier for IHTMLFrameSetElement
     * @type {Guid}
     */
    static IID := Guid("{3050f319-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLFrameSetElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_rows           : IntPtr
        get_rows           : IntPtr
        put_cols           : IntPtr
        get_cols           : IntPtr
        put_border         : IntPtr
        get_border         : IntPtr
        put_borderColor    : IntPtr
        get_borderColor    : IntPtr
        put_frameBorder    : IntPtr
        get_frameBorder    : IntPtr
        put_frameSpacing   : IntPtr
        get_frameSpacing   : IntPtr
        put_name           : IntPtr
        get_name           : IntPtr
        put_onload         : IntPtr
        get_onload         : IntPtr
        put_onunload       : IntPtr
        get_onunload       : IntPtr
        put_onbeforeunload : IntPtr
        get_onbeforeunload : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLFrameSetElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    rows {
        get => this.get_rows()
        set => this.put_rows(value)
    }

    /**
     * @type {BSTR} 
     */
    cols {
        get => this.get_cols()
        set => this.put_cols(value)
    }

    /**
     * @type {VARIANT} 
     */
    border {
        get => this.get_border()
        set => this.put_border(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColor {
        get => this.get_borderColor()
        set => this.put_borderColor(value)
    }

    /**
     * @type {BSTR} 
     */
    frameBorder {
        get => this.get_frameBorder()
        set => this.put_frameBorder(value)
    }

    /**
     * @type {VARIANT} 
     */
    frameSpacing {
        get => this.get_frameSpacing()
        set => this.put_frameSpacing(value)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
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
    put_rows(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_rows() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cols(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cols() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_border(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_border() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColor() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_frameBorder(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_frameBorder() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_frameSpacing(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_frameSpacing() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onload(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onload() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onunload(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onunload() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onbeforeunload(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onbeforeunload() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLFrameSetElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_rows := CallbackCreate(GetMethod(implObj, "put_rows"), flags, 2)
        this.vtbl.get_rows := CallbackCreate(GetMethod(implObj, "get_rows"), flags, 2)
        this.vtbl.put_cols := CallbackCreate(GetMethod(implObj, "put_cols"), flags, 2)
        this.vtbl.get_cols := CallbackCreate(GetMethod(implObj, "get_cols"), flags, 2)
        this.vtbl.put_border := CallbackCreate(GetMethod(implObj, "put_border"), flags, 2)
        this.vtbl.get_border := CallbackCreate(GetMethod(implObj, "get_border"), flags, 2)
        this.vtbl.put_borderColor := CallbackCreate(GetMethod(implObj, "put_borderColor"), flags, 2)
        this.vtbl.get_borderColor := CallbackCreate(GetMethod(implObj, "get_borderColor"), flags, 2)
        this.vtbl.put_frameBorder := CallbackCreate(GetMethod(implObj, "put_frameBorder"), flags, 2)
        this.vtbl.get_frameBorder := CallbackCreate(GetMethod(implObj, "get_frameBorder"), flags, 2)
        this.vtbl.put_frameSpacing := CallbackCreate(GetMethod(implObj, "put_frameSpacing"), flags, 2)
        this.vtbl.get_frameSpacing := CallbackCreate(GetMethod(implObj, "get_frameSpacing"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_onload := CallbackCreate(GetMethod(implObj, "put_onload"), flags, 2)
        this.vtbl.get_onload := CallbackCreate(GetMethod(implObj, "get_onload"), flags, 2)
        this.vtbl.put_onunload := CallbackCreate(GetMethod(implObj, "put_onunload"), flags, 2)
        this.vtbl.get_onunload := CallbackCreate(GetMethod(implObj, "get_onunload"), flags, 2)
        this.vtbl.put_onbeforeunload := CallbackCreate(GetMethod(implObj, "put_onbeforeunload"), flags, 2)
        this.vtbl.get_onbeforeunload := CallbackCreate(GetMethod(implObj, "get_onbeforeunload"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_rows)
        CallbackFree(this.vtbl.get_rows)
        CallbackFree(this.vtbl.put_cols)
        CallbackFree(this.vtbl.get_cols)
        CallbackFree(this.vtbl.put_border)
        CallbackFree(this.vtbl.get_border)
        CallbackFree(this.vtbl.put_borderColor)
        CallbackFree(this.vtbl.get_borderColor)
        CallbackFree(this.vtbl.put_frameBorder)
        CallbackFree(this.vtbl.get_frameBorder)
        CallbackFree(this.vtbl.put_frameSpacing)
        CallbackFree(this.vtbl.get_frameSpacing)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_onload)
        CallbackFree(this.vtbl.get_onload)
        CallbackFree(this.vtbl.put_onunload)
        CallbackFree(this.vtbl.get_onunload)
        CallbackFree(this.vtbl.put_onbeforeunload)
        CallbackFree(this.vtbl.get_onbeforeunload)
    }
}
