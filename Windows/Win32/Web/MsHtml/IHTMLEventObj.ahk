#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLEventObj extends IDispatch {
    /**
     * The interface identifier for IHTMLEventObj
     * @type {Guid}
     */
    static IID := Guid("{3050f32d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLEventObj interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_srcElement   : IntPtr
        get_altKey       : IntPtr
        get_ctrlKey      : IntPtr
        get_shiftKey     : IntPtr
        put_returnValue  : IntPtr
        get_returnValue  : IntPtr
        put_cancelBubble : IntPtr
        get_cancelBubble : IntPtr
        get_fromElement  : IntPtr
        get_toElement    : IntPtr
        put_keyCode      : IntPtr
        get_keyCode      : IntPtr
        get_button       : IntPtr
        get_type         : IntPtr
        get_qualifier    : IntPtr
        get_reason       : IntPtr
        get_x            : IntPtr
        get_y            : IntPtr
        get_clientX      : IntPtr
        get_clientY      : IntPtr
        get_offsetX      : IntPtr
        get_offsetY      : IntPtr
        get_screenX      : IntPtr
        get_screenY      : IntPtr
        get_srcFilter    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLEventObj.Vtbl()
        }
        super.__New(implObj, flags)
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
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ctrlKey {
        get => this.get_ctrlKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    shiftKey {
        get => this.get_shiftKey()
    }

    /**
     * @type {VARIANT} 
     */
    returnValue {
        get => this.get_returnValue()
        set => this.put_returnValue(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    cancelBubble {
        get => this.get_cancelBubble()
        set => this.put_cancelBubble(value)
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
    keyCode {
        get => this.get_keyCode()
        set => this.put_keyCode(value)
    }

    /**
     * @type {Integer} 
     */
    button {
        get => this.get_button()
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {BSTR} 
     */
    qualifier {
        get => this.get_qualifier()
    }

    /**
     * @type {Integer} 
     */
    reason {
        get => this.get_reason()
    }

    /**
     * @type {Integer} 
     */
    x {
        get => this.get_x()
    }

    /**
     * @type {Integer} 
     */
    y {
        get => this.get_y()
    }

    /**
     * @type {Integer} 
     */
    clientX {
        get => this.get_clientX()
    }

    /**
     * @type {Integer} 
     */
    clientY {
        get => this.get_clientY()
    }

    /**
     * @type {Integer} 
     */
    offsetX {
        get => this.get_offsetX()
    }

    /**
     * @type {Integer} 
     */
    offsetY {
        get => this.get_offsetY()
    }

    /**
     * @type {Integer} 
     */
    screenX {
        get => this.get_screenX()
    }

    /**
     * @type {Integer} 
     */
    screenY {
        get => this.get_screenY()
    }

    /**
     * @type {IDispatch} 
     */
    srcFilter {
        get => this.get_srcFilter()
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_srcElement() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_altKey() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ctrlKey() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_shiftKey() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_returnValue(v) {
        result := ComCall(11, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_returnValue() {
        p := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_cancelBubble(v) {
        result := ComCall(13, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_cancelBubble() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_fromElement() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_toElement() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_keyCode(v) {
        result := ComCall(17, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_keyCode() {
        result := ComCall(18, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_button() {
        result := ComCall(19, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_qualifier() {
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_reason() {
        result := ComCall(22, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_x() {
        result := ComCall(23, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_y() {
        result := ComCall(24, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientX() {
        result := ComCall(25, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_clientY() {
        result := ComCall(26, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetX() {
        result := ComCall(27, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_offsetY() {
        result := ComCall(28, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenX() {
        result := ComCall(29, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_screenY() {
        result := ComCall(30, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_srcFilter() {
        result := ComCall(31, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    Query(iid) {
        if (IHTMLEventObj.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_srcElement := CallbackCreate(GetMethod(implObj, "get_srcElement"), flags, 2)
        this.vtbl.get_altKey := CallbackCreate(GetMethod(implObj, "get_altKey"), flags, 2)
        this.vtbl.get_ctrlKey := CallbackCreate(GetMethod(implObj, "get_ctrlKey"), flags, 2)
        this.vtbl.get_shiftKey := CallbackCreate(GetMethod(implObj, "get_shiftKey"), flags, 2)
        this.vtbl.put_returnValue := CallbackCreate(GetMethod(implObj, "put_returnValue"), flags, 2)
        this.vtbl.get_returnValue := CallbackCreate(GetMethod(implObj, "get_returnValue"), flags, 2)
        this.vtbl.put_cancelBubble := CallbackCreate(GetMethod(implObj, "put_cancelBubble"), flags, 2)
        this.vtbl.get_cancelBubble := CallbackCreate(GetMethod(implObj, "get_cancelBubble"), flags, 2)
        this.vtbl.get_fromElement := CallbackCreate(GetMethod(implObj, "get_fromElement"), flags, 2)
        this.vtbl.get_toElement := CallbackCreate(GetMethod(implObj, "get_toElement"), flags, 2)
        this.vtbl.put_keyCode := CallbackCreate(GetMethod(implObj, "put_keyCode"), flags, 2)
        this.vtbl.get_keyCode := CallbackCreate(GetMethod(implObj, "get_keyCode"), flags, 2)
        this.vtbl.get_button := CallbackCreate(GetMethod(implObj, "get_button"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_qualifier := CallbackCreate(GetMethod(implObj, "get_qualifier"), flags, 2)
        this.vtbl.get_reason := CallbackCreate(GetMethod(implObj, "get_reason"), flags, 2)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.get_y := CallbackCreate(GetMethod(implObj, "get_y"), flags, 2)
        this.vtbl.get_clientX := CallbackCreate(GetMethod(implObj, "get_clientX"), flags, 2)
        this.vtbl.get_clientY := CallbackCreate(GetMethod(implObj, "get_clientY"), flags, 2)
        this.vtbl.get_offsetX := CallbackCreate(GetMethod(implObj, "get_offsetX"), flags, 2)
        this.vtbl.get_offsetY := CallbackCreate(GetMethod(implObj, "get_offsetY"), flags, 2)
        this.vtbl.get_screenX := CallbackCreate(GetMethod(implObj, "get_screenX"), flags, 2)
        this.vtbl.get_screenY := CallbackCreate(GetMethod(implObj, "get_screenY"), flags, 2)
        this.vtbl.get_srcFilter := CallbackCreate(GetMethod(implObj, "get_srcFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_srcElement)
        CallbackFree(this.vtbl.get_altKey)
        CallbackFree(this.vtbl.get_ctrlKey)
        CallbackFree(this.vtbl.get_shiftKey)
        CallbackFree(this.vtbl.put_returnValue)
        CallbackFree(this.vtbl.get_returnValue)
        CallbackFree(this.vtbl.put_cancelBubble)
        CallbackFree(this.vtbl.get_cancelBubble)
        CallbackFree(this.vtbl.get_fromElement)
        CallbackFree(this.vtbl.get_toElement)
        CallbackFree(this.vtbl.put_keyCode)
        CallbackFree(this.vtbl.get_keyCode)
        CallbackFree(this.vtbl.get_button)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_qualifier)
        CallbackFree(this.vtbl.get_reason)
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.get_y)
        CallbackFree(this.vtbl.get_clientX)
        CallbackFree(this.vtbl.get_clientY)
        CallbackFree(this.vtbl.get_offsetX)
        CallbackFree(this.vtbl.get_offsetY)
        CallbackFree(this.vtbl.get_screenX)
        CallbackFree(this.vtbl.get_screenY)
        CallbackFree(this.vtbl.get_srcFilter)
    }
}
