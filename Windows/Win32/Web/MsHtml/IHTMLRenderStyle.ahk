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
export default struct IHTMLRenderStyle extends IDispatch {
    /**
     * The interface identifier for IHTMLRenderStyle
     * @type {Guid}
     */
    static IID := Guid("{3050f6ae-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLRenderStyle
     * @type {Guid}
     */
    static CLSID := Guid("{3050f6aa-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLRenderStyle interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_textLineThroughStyle : IntPtr
        get_textLineThroughStyle : IntPtr
        put_textUnderlineStyle   : IntPtr
        get_textUnderlineStyle   : IntPtr
        put_textEffect           : IntPtr
        get_textEffect           : IntPtr
        put_textColor            : IntPtr
        get_textColor            : IntPtr
        put_textBackgroundColor  : IntPtr
        get_textBackgroundColor  : IntPtr
        put_textDecorationColor  : IntPtr
        get_textDecorationColor  : IntPtr
        put_renderingPriority    : IntPtr
        get_renderingPriority    : IntPtr
        put_defaultTextSelection : IntPtr
        get_defaultTextSelection : IntPtr
        put_textDecoration       : IntPtr
        get_textDecoration       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLRenderStyle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    textLineThroughStyle {
        get => this.get_textLineThroughStyle()
        set => this.put_textLineThroughStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    textUnderlineStyle {
        get => this.get_textUnderlineStyle()
        set => this.put_textUnderlineStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    textEffect {
        get => this.get_textEffect()
        set => this.put_textEffect(value)
    }

    /**
     * @type {VARIANT} 
     */
    textColor {
        get => this.get_textColor()
        set => this.put_textColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    textBackgroundColor {
        get => this.get_textBackgroundColor()
        set => this.put_textBackgroundColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    textDecorationColor {
        get => this.get_textDecorationColor()
        set => this.put_textDecorationColor(value)
    }

    /**
     * @type {Integer} 
     */
    renderingPriority {
        get => this.get_renderingPriority()
        set => this.put_renderingPriority(value)
    }

    /**
     * @type {BSTR} 
     */
    defaultTextSelection {
        get => this.get_defaultTextSelection()
        set => this.put_defaultTextSelection(value)
    }

    /**
     * @type {BSTR} 
     */
    textDecoration {
        get => this.get_textDecoration()
        set => this.put_textDecoration(value)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textLineThroughStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textLineThroughStyle() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textUnderlineStyle(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textUnderlineStyle() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textEffect(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textEffect() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textColor(v) {
        result := ComCall(13, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textColor() {
        p := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textBackgroundColor(v) {
        result := ComCall(15, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textBackgroundColor() {
        p := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_textDecorationColor(v) {
        result := ComCall(17, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_textDecorationColor() {
        p := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_renderingPriority(v) {
        result := ComCall(19, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_renderingPriority() {
        result := ComCall(20, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_defaultTextSelection(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultTextSelection() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_textDecoration(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_textDecoration() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLRenderStyle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_textLineThroughStyle := CallbackCreate(GetMethod(implObj, "put_textLineThroughStyle"), flags, 2)
        this.vtbl.get_textLineThroughStyle := CallbackCreate(GetMethod(implObj, "get_textLineThroughStyle"), flags, 2)
        this.vtbl.put_textUnderlineStyle := CallbackCreate(GetMethod(implObj, "put_textUnderlineStyle"), flags, 2)
        this.vtbl.get_textUnderlineStyle := CallbackCreate(GetMethod(implObj, "get_textUnderlineStyle"), flags, 2)
        this.vtbl.put_textEffect := CallbackCreate(GetMethod(implObj, "put_textEffect"), flags, 2)
        this.vtbl.get_textEffect := CallbackCreate(GetMethod(implObj, "get_textEffect"), flags, 2)
        this.vtbl.put_textColor := CallbackCreate(GetMethod(implObj, "put_textColor"), flags, 2)
        this.vtbl.get_textColor := CallbackCreate(GetMethod(implObj, "get_textColor"), flags, 2)
        this.vtbl.put_textBackgroundColor := CallbackCreate(GetMethod(implObj, "put_textBackgroundColor"), flags, 2)
        this.vtbl.get_textBackgroundColor := CallbackCreate(GetMethod(implObj, "get_textBackgroundColor"), flags, 2)
        this.vtbl.put_textDecorationColor := CallbackCreate(GetMethod(implObj, "put_textDecorationColor"), flags, 2)
        this.vtbl.get_textDecorationColor := CallbackCreate(GetMethod(implObj, "get_textDecorationColor"), flags, 2)
        this.vtbl.put_renderingPriority := CallbackCreate(GetMethod(implObj, "put_renderingPriority"), flags, 2)
        this.vtbl.get_renderingPriority := CallbackCreate(GetMethod(implObj, "get_renderingPriority"), flags, 2)
        this.vtbl.put_defaultTextSelection := CallbackCreate(GetMethod(implObj, "put_defaultTextSelection"), flags, 2)
        this.vtbl.get_defaultTextSelection := CallbackCreate(GetMethod(implObj, "get_defaultTextSelection"), flags, 2)
        this.vtbl.put_textDecoration := CallbackCreate(GetMethod(implObj, "put_textDecoration"), flags, 2)
        this.vtbl.get_textDecoration := CallbackCreate(GetMethod(implObj, "get_textDecoration"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_textLineThroughStyle)
        CallbackFree(this.vtbl.get_textLineThroughStyle)
        CallbackFree(this.vtbl.put_textUnderlineStyle)
        CallbackFree(this.vtbl.get_textUnderlineStyle)
        CallbackFree(this.vtbl.put_textEffect)
        CallbackFree(this.vtbl.get_textEffect)
        CallbackFree(this.vtbl.put_textColor)
        CallbackFree(this.vtbl.get_textColor)
        CallbackFree(this.vtbl.put_textBackgroundColor)
        CallbackFree(this.vtbl.get_textBackgroundColor)
        CallbackFree(this.vtbl.put_textDecorationColor)
        CallbackFree(this.vtbl.get_textDecorationColor)
        CallbackFree(this.vtbl.put_renderingPriority)
        CallbackFree(this.vtbl.get_renderingPriority)
        CallbackFree(this.vtbl.put_defaultTextSelection)
        CallbackFree(this.vtbl.get_defaultTextSelection)
        CallbackFree(this.vtbl.put_textDecoration)
        CallbackFree(this.vtbl.get_textDecoration)
    }
}
