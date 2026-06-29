#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTableCell extends IDispatch {
    /**
     * The interface identifier for IHTMLTableCell
     * @type {Guid}
     */
    static IID := Guid("{3050f23d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTableCell
     * @type {Guid}
     */
    static CLSID := Guid("{3050f246-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTableCell interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_rowSpan          : IntPtr
        get_rowSpan          : IntPtr
        put_colSpan          : IntPtr
        get_colSpan          : IntPtr
        put_align            : IntPtr
        get_align            : IntPtr
        put_vAlign           : IntPtr
        get_vAlign           : IntPtr
        put_bgColor          : IntPtr
        get_bgColor          : IntPtr
        put_noWrap           : IntPtr
        get_noWrap           : IntPtr
        put_background       : IntPtr
        get_background       : IntPtr
        put_borderColor      : IntPtr
        get_borderColor      : IntPtr
        put_borderColorLight : IntPtr
        get_borderColorLight : IntPtr
        put_borderColorDark  : IntPtr
        get_borderColorDark  : IntPtr
        put_width            : IntPtr
        get_width            : IntPtr
        put_height           : IntPtr
        get_height           : IntPtr
        get_cellIndex        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTableCell.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    rowSpan {
        get => this.get_rowSpan()
        set => this.put_rowSpan(value)
    }

    /**
     * @type {Integer} 
     */
    colSpan {
        get => this.get_colSpan()
        set => this.put_colSpan(value)
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
    vAlign {
        get => this.get_vAlign()
        set => this.put_vAlign(value)
    }

    /**
     * @type {VARIANT} 
     */
    bgColor {
        get => this.get_bgColor()
        set => this.put_bgColor(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    noWrap {
        get => this.get_noWrap()
        set => this.put_noWrap(value)
    }

    /**
     * @type {BSTR} 
     */
    background {
        get => this.get_background()
        set => this.put_background(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColor {
        get => this.get_borderColor()
        set => this.put_borderColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColorLight {
        get => this.get_borderColorLight()
        set => this.put_borderColorLight(value)
    }

    /**
     * @type {VARIANT} 
     */
    borderColorDark {
        get => this.get_borderColorDark()
        set => this.put_borderColorDark(value)
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
    cellIndex {
        get => this.get_cellIndex()
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_rowSpan(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_rowSpan() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_colSpan(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_colSpan() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_vAlign(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_vAlign() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_bgColor(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_bgColor() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_noWrap(v) {
        result := ComCall(17, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_noWrap() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_background(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_background() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColor(v) {
        result := ComCall(21, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColor() {
        p := VARIANT()
        result := ComCall(22, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorLight(v) {
        result := ComCall(23, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorLight() {
        p := VARIANT()
        result := ComCall(24, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_borderColorDark(v) {
        result := ComCall(25, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_borderColorDark() {
        p := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(27, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(28, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(29, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(30, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_cellIndex() {
        result := ComCall(31, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLTableCell.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_rowSpan := CallbackCreate(GetMethod(implObj, "put_rowSpan"), flags, 2)
        this.vtbl.get_rowSpan := CallbackCreate(GetMethod(implObj, "get_rowSpan"), flags, 2)
        this.vtbl.put_colSpan := CallbackCreate(GetMethod(implObj, "put_colSpan"), flags, 2)
        this.vtbl.get_colSpan := CallbackCreate(GetMethod(implObj, "get_colSpan"), flags, 2)
        this.vtbl.put_align := CallbackCreate(GetMethod(implObj, "put_align"), flags, 2)
        this.vtbl.get_align := CallbackCreate(GetMethod(implObj, "get_align"), flags, 2)
        this.vtbl.put_vAlign := CallbackCreate(GetMethod(implObj, "put_vAlign"), flags, 2)
        this.vtbl.get_vAlign := CallbackCreate(GetMethod(implObj, "get_vAlign"), flags, 2)
        this.vtbl.put_bgColor := CallbackCreate(GetMethod(implObj, "put_bgColor"), flags, 2)
        this.vtbl.get_bgColor := CallbackCreate(GetMethod(implObj, "get_bgColor"), flags, 2)
        this.vtbl.put_noWrap := CallbackCreate(GetMethod(implObj, "put_noWrap"), flags, 2)
        this.vtbl.get_noWrap := CallbackCreate(GetMethod(implObj, "get_noWrap"), flags, 2)
        this.vtbl.put_background := CallbackCreate(GetMethod(implObj, "put_background"), flags, 2)
        this.vtbl.get_background := CallbackCreate(GetMethod(implObj, "get_background"), flags, 2)
        this.vtbl.put_borderColor := CallbackCreate(GetMethod(implObj, "put_borderColor"), flags, 2)
        this.vtbl.get_borderColor := CallbackCreate(GetMethod(implObj, "get_borderColor"), flags, 2)
        this.vtbl.put_borderColorLight := CallbackCreate(GetMethod(implObj, "put_borderColorLight"), flags, 2)
        this.vtbl.get_borderColorLight := CallbackCreate(GetMethod(implObj, "get_borderColorLight"), flags, 2)
        this.vtbl.put_borderColorDark := CallbackCreate(GetMethod(implObj, "put_borderColorDark"), flags, 2)
        this.vtbl.get_borderColorDark := CallbackCreate(GetMethod(implObj, "get_borderColorDark"), flags, 2)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.get_cellIndex := CallbackCreate(GetMethod(implObj, "get_cellIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_rowSpan)
        CallbackFree(this.vtbl.get_rowSpan)
        CallbackFree(this.vtbl.put_colSpan)
        CallbackFree(this.vtbl.get_colSpan)
        CallbackFree(this.vtbl.put_align)
        CallbackFree(this.vtbl.get_align)
        CallbackFree(this.vtbl.put_vAlign)
        CallbackFree(this.vtbl.get_vAlign)
        CallbackFree(this.vtbl.put_bgColor)
        CallbackFree(this.vtbl.get_bgColor)
        CallbackFree(this.vtbl.put_noWrap)
        CallbackFree(this.vtbl.get_noWrap)
        CallbackFree(this.vtbl.put_background)
        CallbackFree(this.vtbl.get_background)
        CallbackFree(this.vtbl.put_borderColor)
        CallbackFree(this.vtbl.get_borderColor)
        CallbackFree(this.vtbl.put_borderColorLight)
        CallbackFree(this.vtbl.get_borderColorLight)
        CallbackFree(this.vtbl.put_borderColorDark)
        CallbackFree(this.vtbl.get_borderColorDark)
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.get_cellIndex)
    }
}
