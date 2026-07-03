#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLComputedStyle extends IUnknown {
    /**
     * The interface identifier for IHTMLComputedStyle
     * @type {Guid}
     */
    static IID := Guid("{3050f6c3-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLComputedStyle interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_bold            : IntPtr
        get_italic          : IntPtr
        get_underline       : IntPtr
        get_overline        : IntPtr
        get_strikeOut       : IntPtr
        get_subScript       : IntPtr
        get_superScript     : IntPtr
        get_explicitFace    : IntPtr
        get_fontWeight      : IntPtr
        get_fontSize        : IntPtr
        get_fontName        : IntPtr
        get_hasBgColor      : IntPtr
        get_textColor       : IntPtr
        get_backgroundColor : IntPtr
        get_preFormatted    : IntPtr
        get_direction       : IntPtr
        get_blockDirection  : IntPtr
        get_OL              : IntPtr
        IsEqual             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLComputedStyle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    bold {
        get => this.get_bold()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    italic {
        get => this.get_italic()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    underline {
        get => this.get_underline()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    overline {
        get => this.get_overline()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    strikeOut {
        get => this.get_strikeOut()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    subScript {
        get => this.get_subScript()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    superScript {
        get => this.get_superScript()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    explicitFace {
        get => this.get_explicitFace()
    }

    /**
     * @type {Integer} 
     */
    fontWeight {
        get => this.get_fontWeight()
    }

    /**
     * @type {Integer} 
     */
    fontSize {
        get => this.get_fontSize()
    }

    /**
     * @type {Integer} 
     */
    fontName {
        get => this.get_fontName()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    hasBgColor {
        get => this.get_hasBgColor()
    }

    /**
     * @type {Integer} 
     */
    textColor {
        get => this.get_textColor()
    }

    /**
     * @type {Integer} 
     */
    backgroundColor {
        get => this.get_backgroundColor()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    preFormatted {
        get => this.get_preFormatted()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    direction {
        get => this.get_direction()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    blockDirection {
        get => this.get_blockDirection()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    OL {
        get => this.get_OL()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_bold() {
        result := ComCall(3, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_italic() {
        result := ComCall(4, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_underline() {
        result := ComCall(5, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_overline() {
        result := ComCall(6, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_strikeOut() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_subScript() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_superScript() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_explicitFace() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_fontWeight() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_fontSize() {
        result := ComCall(12, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_fontName() {
        result := ComCall(13, this, "char*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_hasBgColor() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_textColor() {
        result := ComCall(15, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_backgroundColor() {
        result := ComCall(16, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_preFormatted() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_direction() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_blockDirection() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_OL() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IHTMLComputedStyle} pComputedStyle 
     * @returns {VARIANT_BOOL} 
     */
    IsEqual(pComputedStyle) {
        result := ComCall(21, this, "ptr", pComputedStyle, VARIANT_BOOL.Ptr, &pfEqual := 0, "HRESULT")
        return pfEqual
    }

    Query(iid) {
        if (IHTMLComputedStyle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_bold := CallbackCreate(GetMethod(implObj, "get_bold"), flags, 2)
        this.vtbl.get_italic := CallbackCreate(GetMethod(implObj, "get_italic"), flags, 2)
        this.vtbl.get_underline := CallbackCreate(GetMethod(implObj, "get_underline"), flags, 2)
        this.vtbl.get_overline := CallbackCreate(GetMethod(implObj, "get_overline"), flags, 2)
        this.vtbl.get_strikeOut := CallbackCreate(GetMethod(implObj, "get_strikeOut"), flags, 2)
        this.vtbl.get_subScript := CallbackCreate(GetMethod(implObj, "get_subScript"), flags, 2)
        this.vtbl.get_superScript := CallbackCreate(GetMethod(implObj, "get_superScript"), flags, 2)
        this.vtbl.get_explicitFace := CallbackCreate(GetMethod(implObj, "get_explicitFace"), flags, 2)
        this.vtbl.get_fontWeight := CallbackCreate(GetMethod(implObj, "get_fontWeight"), flags, 2)
        this.vtbl.get_fontSize := CallbackCreate(GetMethod(implObj, "get_fontSize"), flags, 2)
        this.vtbl.get_fontName := CallbackCreate(GetMethod(implObj, "get_fontName"), flags, 2)
        this.vtbl.get_hasBgColor := CallbackCreate(GetMethod(implObj, "get_hasBgColor"), flags, 2)
        this.vtbl.get_textColor := CallbackCreate(GetMethod(implObj, "get_textColor"), flags, 2)
        this.vtbl.get_backgroundColor := CallbackCreate(GetMethod(implObj, "get_backgroundColor"), flags, 2)
        this.vtbl.get_preFormatted := CallbackCreate(GetMethod(implObj, "get_preFormatted"), flags, 2)
        this.vtbl.get_direction := CallbackCreate(GetMethod(implObj, "get_direction"), flags, 2)
        this.vtbl.get_blockDirection := CallbackCreate(GetMethod(implObj, "get_blockDirection"), flags, 2)
        this.vtbl.get_OL := CallbackCreate(GetMethod(implObj, "get_OL"), flags, 2)
        this.vtbl.IsEqual := CallbackCreate(GetMethod(implObj, "IsEqual"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_bold)
        CallbackFree(this.vtbl.get_italic)
        CallbackFree(this.vtbl.get_underline)
        CallbackFree(this.vtbl.get_overline)
        CallbackFree(this.vtbl.get_strikeOut)
        CallbackFree(this.vtbl.get_subScript)
        CallbackFree(this.vtbl.get_superScript)
        CallbackFree(this.vtbl.get_explicitFace)
        CallbackFree(this.vtbl.get_fontWeight)
        CallbackFree(this.vtbl.get_fontSize)
        CallbackFree(this.vtbl.get_fontName)
        CallbackFree(this.vtbl.get_hasBgColor)
        CallbackFree(this.vtbl.get_textColor)
        CallbackFree(this.vtbl.get_backgroundColor)
        CallbackFree(this.vtbl.get_preFormatted)
        CallbackFree(this.vtbl.get_direction)
        CallbackFree(this.vtbl.get_blockDirection)
        CallbackFree(this.vtbl.get_OL)
        CallbackFree(this.vtbl.IsEqual)
    }
}
