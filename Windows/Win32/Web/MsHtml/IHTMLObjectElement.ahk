#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLFormElement.ahk" { IHTMLFormElement }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLObjectElement extends IDispatch {
    /**
     * The interface identifier for IHTMLObjectElement
     * @type {Guid}
     */
    static IID := Guid("{3050f24f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLObjectElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f24e-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLObjectElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_object             : IntPtr
        get_classid            : IntPtr
        get_data               : IntPtr
        putref_recordset       : IntPtr
        get_recordset          : IntPtr
        put_align              : IntPtr
        get_align              : IntPtr
        put_name               : IntPtr
        get_name               : IntPtr
        put_codeBase           : IntPtr
        get_codeBase           : IntPtr
        put_codeType           : IntPtr
        get_codeType           : IntPtr
        put_code               : IntPtr
        get_code               : IntPtr
        get_BaseHref           : IntPtr
        put_type               : IntPtr
        get_type               : IntPtr
        get_form               : IntPtr
        put_width              : IntPtr
        get_width              : IntPtr
        put_height             : IntPtr
        get_height             : IntPtr
        get_readyState         : IntPtr
        put_onreadystatechange : IntPtr
        get_onreadystatechange : IntPtr
        put_onerror            : IntPtr
        get_onerror            : IntPtr
        put_altHtml            : IntPtr
        get_altHtml            : IntPtr
        put_vspace             : IntPtr
        get_vspace             : IntPtr
        put_hspace             : IntPtr
        get_hspace             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLObjectElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    object {
        get => this.get_object()
    }

    /**
     * @type {BSTR} 
     */
    classid {
        get => this.get_classid()
    }

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
    }

    /**
     * @type {IDispatch} 
     */
    recordset {
        get => this.get_recordset()
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
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {BSTR} 
     */
    codeBase {
        get => this.get_codeBase()
        set => this.put_codeBase(value)
    }

    /**
     * @type {BSTR} 
     */
    codeType {
        get => this.get_codeType()
        set => this.put_codeType(value)
    }

    /**
     * @type {BSTR} 
     */
    code {
        get => this.get_code()
        set => this.put_code(value)
    }

    /**
     * @type {BSTR} 
     */
    BaseHref {
        get => this.get_BaseHref()
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
        set => this.put_type(value)
    }

    /**
     * @type {IHTMLFormElement} 
     */
    form {
        get => this.get_form()
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
    readyState {
        get => this.get_readyState()
    }

    /**
     * @type {VARIANT} 
     */
    onreadystatechange {
        get => this.get_onreadystatechange()
        set => this.put_onreadystatechange(value)
    }

    /**
     * @type {VARIANT} 
     */
    onerror {
        get => this.get_onerror()
        set => this.put_onerror(value)
    }

    /**
     * @type {BSTR} 
     */
    altHtml {
        get => this.get_altHtml()
        set => this.put_altHtml(value)
    }

    /**
     * @type {Integer} 
     */
    vspace {
        get => this.get_vspace()
        set => this.put_vspace(value)
    }

    /**
     * @type {Integer} 
     */
    hspace {
        get => this.get_hspace()
        set => this.put_hspace(value)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_object() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_classid() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IDispatch} v 
     * @returns {HRESULT} 
     */
    putref_recordset(v) {
        result := ComCall(10, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_recordset() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_align(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_align() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(14, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_codeBase(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_codeBase() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_codeType(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_codeType() {
        p := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_code(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_code() {
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BaseHref() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_type(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(25, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(26, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_width() {
        p := VARIANT()
        result := ComCall(27, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(28, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_height() {
        p := VARIANT()
        result := ComCall(29, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_readyState() {
        result := ComCall(30, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onreadystatechange(v) {
        result := ComCall(31, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onreadystatechange() {
        p := VARIANT()
        result := ComCall(32, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onerror(v) {
        result := ComCall(33, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onerror() {
        p := VARIANT()
        result := ComCall(34, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_altHtml(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_altHtml() {
        p := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_vspace(v) {
        result := ComCall(37, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_vspace() {
        result := ComCall(38, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_hspace(v) {
        result := ComCall(39, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_hspace() {
        result := ComCall(40, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLObjectElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_object := CallbackCreate(GetMethod(implObj, "get_object"), flags, 2)
        this.vtbl.get_classid := CallbackCreate(GetMethod(implObj, "get_classid"), flags, 2)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
        this.vtbl.putref_recordset := CallbackCreate(GetMethod(implObj, "putref_recordset"), flags, 2)
        this.vtbl.get_recordset := CallbackCreate(GetMethod(implObj, "get_recordset"), flags, 2)
        this.vtbl.put_align := CallbackCreate(GetMethod(implObj, "put_align"), flags, 2)
        this.vtbl.get_align := CallbackCreate(GetMethod(implObj, "get_align"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_codeBase := CallbackCreate(GetMethod(implObj, "put_codeBase"), flags, 2)
        this.vtbl.get_codeBase := CallbackCreate(GetMethod(implObj, "get_codeBase"), flags, 2)
        this.vtbl.put_codeType := CallbackCreate(GetMethod(implObj, "put_codeType"), flags, 2)
        this.vtbl.get_codeType := CallbackCreate(GetMethod(implObj, "get_codeType"), flags, 2)
        this.vtbl.put_code := CallbackCreate(GetMethod(implObj, "put_code"), flags, 2)
        this.vtbl.get_code := CallbackCreate(GetMethod(implObj, "get_code"), flags, 2)
        this.vtbl.get_BaseHref := CallbackCreate(GetMethod(implObj, "get_BaseHref"), flags, 2)
        this.vtbl.put_type := CallbackCreate(GetMethod(implObj, "put_type"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_form := CallbackCreate(GetMethod(implObj, "get_form"), flags, 2)
        this.vtbl.put_width := CallbackCreate(GetMethod(implObj, "put_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.put_height := CallbackCreate(GetMethod(implObj, "put_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
        this.vtbl.get_readyState := CallbackCreate(GetMethod(implObj, "get_readyState"), flags, 2)
        this.vtbl.put_onreadystatechange := CallbackCreate(GetMethod(implObj, "put_onreadystatechange"), flags, 2)
        this.vtbl.get_onreadystatechange := CallbackCreate(GetMethod(implObj, "get_onreadystatechange"), flags, 2)
        this.vtbl.put_onerror := CallbackCreate(GetMethod(implObj, "put_onerror"), flags, 2)
        this.vtbl.get_onerror := CallbackCreate(GetMethod(implObj, "get_onerror"), flags, 2)
        this.vtbl.put_altHtml := CallbackCreate(GetMethod(implObj, "put_altHtml"), flags, 2)
        this.vtbl.get_altHtml := CallbackCreate(GetMethod(implObj, "get_altHtml"), flags, 2)
        this.vtbl.put_vspace := CallbackCreate(GetMethod(implObj, "put_vspace"), flags, 2)
        this.vtbl.get_vspace := CallbackCreate(GetMethod(implObj, "get_vspace"), flags, 2)
        this.vtbl.put_hspace := CallbackCreate(GetMethod(implObj, "put_hspace"), flags, 2)
        this.vtbl.get_hspace := CallbackCreate(GetMethod(implObj, "get_hspace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_object)
        CallbackFree(this.vtbl.get_classid)
        CallbackFree(this.vtbl.get_data)
        CallbackFree(this.vtbl.putref_recordset)
        CallbackFree(this.vtbl.get_recordset)
        CallbackFree(this.vtbl.put_align)
        CallbackFree(this.vtbl.get_align)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_codeBase)
        CallbackFree(this.vtbl.get_codeBase)
        CallbackFree(this.vtbl.put_codeType)
        CallbackFree(this.vtbl.get_codeType)
        CallbackFree(this.vtbl.put_code)
        CallbackFree(this.vtbl.get_code)
        CallbackFree(this.vtbl.get_BaseHref)
        CallbackFree(this.vtbl.put_type)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_form)
        CallbackFree(this.vtbl.put_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.put_height)
        CallbackFree(this.vtbl.get_height)
        CallbackFree(this.vtbl.get_readyState)
        CallbackFree(this.vtbl.put_onreadystatechange)
        CallbackFree(this.vtbl.get_onreadystatechange)
        CallbackFree(this.vtbl.put_onerror)
        CallbackFree(this.vtbl.get_onerror)
        CallbackFree(this.vtbl.put_altHtml)
        CallbackFree(this.vtbl.get_altHtml)
        CallbackFree(this.vtbl.put_vspace)
        CallbackFree(this.vtbl.get_vspace)
        CallbackFree(this.vtbl.put_hspace)
        CallbackFree(this.vtbl.get_hspace)
    }
}
