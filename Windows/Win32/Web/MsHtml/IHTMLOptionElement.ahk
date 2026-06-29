#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLFormElement.ahk" { IHTMLFormElement }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLOptionElement extends IDispatch {
    /**
     * The interface identifier for IHTMLOptionElement
     * @type {Guid}
     */
    static IID := Guid("{3050f211-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLOptionElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f24d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLOptionElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_selected        : IntPtr
        get_selected        : IntPtr
        put_value           : IntPtr
        get_value           : IntPtr
        put_defaultSelected : IntPtr
        get_defaultSelected : IntPtr
        put_index           : IntPtr
        get_index           : IntPtr
        put_text            : IntPtr
        get_text            : IntPtr
        get_form            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLOptionElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    selected {
        get => this.get_selected()
        set => this.put_selected(value)
    }

    /**
     * @type {BSTR} 
     */
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    defaultSelected {
        get => this.get_defaultSelected()
        set => this.put_defaultSelected(value)
    }

    /**
     * @type {Integer} 
     */
    index {
        get => this.get_index()
        set => this.put_index(value)
    }

    /**
     * @type {BSTR} 
     */
    text {
        get => this.get_text()
        set => this.put_text(value)
    }

    /**
     * @type {IHTMLFormElement} 
     */
    form {
        get => this.get_form()
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_selected(v) {
        result := ComCall(7, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_selected() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(9, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_defaultSelected(v) {
        result := ComCall(11, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_defaultSelected() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_index(v) {
        result := ComCall(13, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_index() {
        result := ComCall(14, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_text(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_text() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(17, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    Query(iid) {
        if (IHTMLOptionElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_selected := CallbackCreate(GetMethod(implObj, "put_selected"), flags, 2)
        this.vtbl.get_selected := CallbackCreate(GetMethod(implObj, "get_selected"), flags, 2)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.put_defaultSelected := CallbackCreate(GetMethod(implObj, "put_defaultSelected"), flags, 2)
        this.vtbl.get_defaultSelected := CallbackCreate(GetMethod(implObj, "get_defaultSelected"), flags, 2)
        this.vtbl.put_index := CallbackCreate(GetMethod(implObj, "put_index"), flags, 2)
        this.vtbl.get_index := CallbackCreate(GetMethod(implObj, "get_index"), flags, 2)
        this.vtbl.put_text := CallbackCreate(GetMethod(implObj, "put_text"), flags, 2)
        this.vtbl.get_text := CallbackCreate(GetMethod(implObj, "get_text"), flags, 2)
        this.vtbl.get_form := CallbackCreate(GetMethod(implObj, "get_form"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_selected)
        CallbackFree(this.vtbl.get_selected)
        CallbackFree(this.vtbl.put_value)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.put_defaultSelected)
        CallbackFree(this.vtbl.get_defaultSelected)
        CallbackFree(this.vtbl.put_index)
        CallbackFree(this.vtbl.get_index)
        CallbackFree(this.vtbl.put_text)
        CallbackFree(this.vtbl.get_text)
        CallbackFree(this.vtbl.get_form)
    }
}
