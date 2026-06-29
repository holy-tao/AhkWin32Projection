#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLFormElement.ahk" { IHTMLFormElement }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLOptionButtonElement extends IDispatch {
    /**
     * The interface identifier for IHTMLOptionButtonElement
     * @type {Guid}
     */
    static IID := Guid("{3050f2bc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLOptionButtonElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f2be-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLOptionButtonElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_value          : IntPtr
        get_value          : IntPtr
        get_type           : IntPtr
        put_name           : IntPtr
        get_name           : IntPtr
        put_checked        : IntPtr
        get_checked        : IntPtr
        put_defaultChecked : IntPtr
        get_defaultChecked : IntPtr
        put_onchange       : IntPtr
        get_onchange       : IntPtr
        put_disabled       : IntPtr
        get_disabled       : IntPtr
        put_status         : IntPtr
        get_status         : IntPtr
        put_indeterminate  : IntPtr
        get_indeterminate  : IntPtr
        get_form           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLOptionButtonElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    value {
        get => this.get_value()
        set => this.put_value(value)
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
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    checked {
        get => this.get_checked()
        set => this.put_checked(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    defaultChecked {
        get => this.get_defaultChecked()
        set => this.put_defaultChecked(value)
    }

    /**
     * @type {VARIANT} 
     */
    onchange {
        get => this.get_onchange()
        set => this.put_onchange(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    disabled {
        get => this.get_disabled()
        set => this.put_disabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    status {
        get => this.get_status()
        set => this.put_status(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    indeterminate {
        get => this.get_indeterminate()
        set => this.put_indeterminate(value)
    }

    /**
     * @type {IHTMLFormElement} 
     */
    form {
        get => this.get_form()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_checked(v) {
        result := ComCall(12, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_checked() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_defaultChecked(v) {
        result := ComCall(14, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_defaultChecked() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(16, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(18, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_status(v) {
        result := ComCall(20, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_status() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_indeterminate(v) {
        result := ComCall(22, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_indeterminate() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(24, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    Query(iid) {
        if (IHTMLOptionButtonElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_checked := CallbackCreate(GetMethod(implObj, "put_checked"), flags, 2)
        this.vtbl.get_checked := CallbackCreate(GetMethod(implObj, "get_checked"), flags, 2)
        this.vtbl.put_defaultChecked := CallbackCreate(GetMethod(implObj, "put_defaultChecked"), flags, 2)
        this.vtbl.get_defaultChecked := CallbackCreate(GetMethod(implObj, "get_defaultChecked"), flags, 2)
        this.vtbl.put_onchange := CallbackCreate(GetMethod(implObj, "put_onchange"), flags, 2)
        this.vtbl.get_onchange := CallbackCreate(GetMethod(implObj, "get_onchange"), flags, 2)
        this.vtbl.put_disabled := CallbackCreate(GetMethod(implObj, "put_disabled"), flags, 2)
        this.vtbl.get_disabled := CallbackCreate(GetMethod(implObj, "get_disabled"), flags, 2)
        this.vtbl.put_status := CallbackCreate(GetMethod(implObj, "put_status"), flags, 2)
        this.vtbl.get_status := CallbackCreate(GetMethod(implObj, "get_status"), flags, 2)
        this.vtbl.put_indeterminate := CallbackCreate(GetMethod(implObj, "put_indeterminate"), flags, 2)
        this.vtbl.get_indeterminate := CallbackCreate(GetMethod(implObj, "get_indeterminate"), flags, 2)
        this.vtbl.get_form := CallbackCreate(GetMethod(implObj, "get_form"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_value)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_checked)
        CallbackFree(this.vtbl.get_checked)
        CallbackFree(this.vtbl.put_defaultChecked)
        CallbackFree(this.vtbl.get_defaultChecked)
        CallbackFree(this.vtbl.put_onchange)
        CallbackFree(this.vtbl.get_onchange)
        CallbackFree(this.vtbl.put_disabled)
        CallbackFree(this.vtbl.get_disabled)
        CallbackFree(this.vtbl.put_status)
        CallbackFree(this.vtbl.get_status)
        CallbackFree(this.vtbl.put_indeterminate)
        CallbackFree(this.vtbl.get_indeterminate)
        CallbackFree(this.vtbl.get_form)
    }
}
