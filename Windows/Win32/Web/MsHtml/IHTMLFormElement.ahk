#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLFormElement extends IDispatch {
    /**
     * The interface identifier for IHTMLFormElement
     * @type {Guid}
     */
    static IID := Guid("{3050f1f7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLFormElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f251-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLFormElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_action   : IntPtr
        get_action   : IntPtr
        put_dir      : IntPtr
        get_dir      : IntPtr
        put_encoding : IntPtr
        get_encoding : IntPtr
        put_method   : IntPtr
        get_method   : IntPtr
        get_elements : IntPtr
        put_target   : IntPtr
        get_target   : IntPtr
        put_name     : IntPtr
        get_name     : IntPtr
        put_onsubmit : IntPtr
        get_onsubmit : IntPtr
        put_onreset  : IntPtr
        get_onreset  : IntPtr
        submit       : IntPtr
        reset        : IntPtr
        put_length   : IntPtr
        get_length   : IntPtr
        get__newEnum : IntPtr
        item         : IntPtr
        tags         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLFormElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    action {
        get => this.get_action()
        set => this.put_action(value)
    }

    /**
     * @type {BSTR} 
     */
    dir {
        get => this.get_dir()
        set => this.put_dir(value)
    }

    /**
     * @type {BSTR} 
     */
    encoding {
        get => this.get_encoding()
        set => this.put_encoding(value)
    }

    /**
     * @type {BSTR} 
     */
    method {
        get => this.get_method()
        set => this.put_method(value)
    }

    /**
     * @type {IDispatch} 
     */
    elements {
        get => this.get_elements()
    }

    /**
     * @type {BSTR} 
     */
    target {
        get => this.get_target()
        set => this.put_target(value)
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
    onsubmit {
        get => this.get_onsubmit()
        set => this.put_onsubmit(value)
    }

    /**
     * @type {VARIANT} 
     */
    onreset {
        get => this.get_onreset()
        set => this.put_onreset(value)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
        set => this.put_length(value)
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_action(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_action() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_dir(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_dir() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_encoding(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_encoding() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_method(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_method() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_elements() {
        result := ComCall(15, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_target(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_target() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onsubmit(v) {
        result := ComCall(20, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onsubmit() {
        p := VARIANT()
        result := ComCall(21, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreset(v) {
        result := ComCall(22, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreset() {
        p := VARIANT()
        result := ComCall(23, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    submit() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_length(v) {
        result := ComCall(26, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(27, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(28, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @param {VARIANT} name 
     * @param {VARIANT} index 
     * @returns {IDispatch} 
     */
    item(name, index) {
        result := ComCall(29, this, VARIANT, name, VARIANT, index, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }

    /**
     * 
     * @param {VARIANT} tagName 
     * @returns {IDispatch} 
     */
    tags(tagName) {
        result := ComCall(30, this, VARIANT, tagName, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }

    Query(iid) {
        if (IHTMLFormElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_action := CallbackCreate(GetMethod(implObj, "put_action"), flags, 2)
        this.vtbl.get_action := CallbackCreate(GetMethod(implObj, "get_action"), flags, 2)
        this.vtbl.put_dir := CallbackCreate(GetMethod(implObj, "put_dir"), flags, 2)
        this.vtbl.get_dir := CallbackCreate(GetMethod(implObj, "get_dir"), flags, 2)
        this.vtbl.put_encoding := CallbackCreate(GetMethod(implObj, "put_encoding"), flags, 2)
        this.vtbl.get_encoding := CallbackCreate(GetMethod(implObj, "get_encoding"), flags, 2)
        this.vtbl.put_method := CallbackCreate(GetMethod(implObj, "put_method"), flags, 2)
        this.vtbl.get_method := CallbackCreate(GetMethod(implObj, "get_method"), flags, 2)
        this.vtbl.get_elements := CallbackCreate(GetMethod(implObj, "get_elements"), flags, 2)
        this.vtbl.put_target := CallbackCreate(GetMethod(implObj, "put_target"), flags, 2)
        this.vtbl.get_target := CallbackCreate(GetMethod(implObj, "get_target"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_onsubmit := CallbackCreate(GetMethod(implObj, "put_onsubmit"), flags, 2)
        this.vtbl.get_onsubmit := CallbackCreate(GetMethod(implObj, "get_onsubmit"), flags, 2)
        this.vtbl.put_onreset := CallbackCreate(GetMethod(implObj, "put_onreset"), flags, 2)
        this.vtbl.get_onreset := CallbackCreate(GetMethod(implObj, "get_onreset"), flags, 2)
        this.vtbl.submit := CallbackCreate(GetMethod(implObj, "submit"), flags, 1)
        this.vtbl.reset := CallbackCreate(GetMethod(implObj, "reset"), flags, 1)
        this.vtbl.put_length := CallbackCreate(GetMethod(implObj, "put_length"), flags, 2)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 4)
        this.vtbl.tags := CallbackCreate(GetMethod(implObj, "tags"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_action)
        CallbackFree(this.vtbl.get_action)
        CallbackFree(this.vtbl.put_dir)
        CallbackFree(this.vtbl.get_dir)
        CallbackFree(this.vtbl.put_encoding)
        CallbackFree(this.vtbl.get_encoding)
        CallbackFree(this.vtbl.put_method)
        CallbackFree(this.vtbl.get_method)
        CallbackFree(this.vtbl.get_elements)
        CallbackFree(this.vtbl.put_target)
        CallbackFree(this.vtbl.get_target)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_onsubmit)
        CallbackFree(this.vtbl.get_onsubmit)
        CallbackFree(this.vtbl.put_onreset)
        CallbackFree(this.vtbl.get_onreset)
        CallbackFree(this.vtbl.submit)
        CallbackFree(this.vtbl.reset)
        CallbackFree(this.vtbl.put_length)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get__newEnum)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.tags)
    }
}
