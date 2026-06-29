#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IHTMLFormElement.ahk" { IHTMLFormElement }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLSelectElement extends IDispatch {
    /**
     * The interface identifier for IHTMLSelectElement
     * @type {Guid}
     */
    static IID := Guid("{3050f244-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLSelectElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f245-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLSelectElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_size          : IntPtr
        get_size          : IntPtr
        put_multiple      : IntPtr
        get_multiple      : IntPtr
        put_name          : IntPtr
        get_name          : IntPtr
        get_options       : IntPtr
        put_onchange      : IntPtr
        get_onchange      : IntPtr
        put_selectedIndex : IntPtr
        get_selectedIndex : IntPtr
        get_type          : IntPtr
        put_value         : IntPtr
        get_value         : IntPtr
        put_disabled      : IntPtr
        get_disabled      : IntPtr
        get_form          : IntPtr
        add               : IntPtr
        remove            : IntPtr
        put_length        : IntPtr
        get_length        : IntPtr
        get__newEnum      : IntPtr
        item              : IntPtr
        tags              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLSelectElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    size {
        get => this.get_size()
        set => this.put_size(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    multiple {
        get => this.get_multiple()
        set => this.put_multiple(value)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {IDispatch} 
     */
    options {
        get => this.get_options()
    }

    /**
     * @type {VARIANT} 
     */
    onchange {
        get => this.get_onchange()
        set => this.put_onchange(value)
    }

    /**
     * @type {Integer} 
     */
    selectedIndex {
        get => this.get_selectedIndex()
        set => this.put_selectedIndex(value)
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
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    disabled {
        get => this.get_disabled()
        set => this.put_disabled(value)
    }

    /**
     * @type {IHTMLFormElement} 
     */
    form {
        get => this.get_form()
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
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_size(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_size() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_multiple(v) {
        result := ComCall(9, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_multiple() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_options() {
        result := ComCall(13, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_onchange(v) {
        result := ComCall(14, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_onchange() {
        p := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_selectedIndex(v) {
        result := ComCall(16, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_selectedIndex() {
        result := ComCall(17, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(21, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(23, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    /**
     * Component-wise add of 2 vectors.
     * @remarks
     * The following table shows the results obtained when executing the instruction with various classes of numbers, assuming that neither overflow or underflow occurs. F means finite real number.
     * 
     * 
     * 
     * | **src0 src1->** | **-inf** | **-F**     | **-denorm** | **-0** | **+0** | **denorm** | **+F**     | **+inf** | **NaN** |
     * |--------------------|----------|------------|-------------|--------|--------|------------|------------|----------|---------|
     * | **-inf**           | -inf     | -inf       | -inf        | -inf   | -inf   | -inf       | -inf       | NaN      | NaN     |
     * | **-F**             | -inf     | -F         | src0        | src0   | src0   | src0       | +-F or +-0 | +inf     | NaN     |
     * | **-denorm**        | -inf     | src1       | -0          | -0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **-0**             | -inf     | src1       | -0          | -0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **+0**             | i-inf    | src1       | +0          | +0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **+denorm**        | -inf     | src1       | +0          | +0     | +0     | +0         | src1       | +inf     | NaN     |
     * | **+F**             | -inf     | +-F or +-0 | src0        | src0   | src0   | src0       | +F         | +inf     | NaN     |
     * | **+inf**           | NaN      | +inf       | +inf        | +inf   | +inf   | +inf       | +inf       | +inf     | NaN     |
     * | **NaN**            | NaN      | NaN        | NaN         | NaN    | NaN    | NaN        | NaN        | NaN      | NaN     |
     * 
     * 
     * 
     *  
     * 
     * This instruction applies to the following shader stages:
     * 
     * 
     * 
     * | Vertex Shader | Geometry Shader | Pixel Shader |
     * |---------------|-----------------|--------------|
     * | x             | x               | x            |
     * @param {IHTMLElement} element 
     * @param {VARIANT} before 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/add--sm4---asm-
     */
    add(element, before) {
        result := ComCall(24, this, "ptr", element, VARIANT, before, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    remove(index) {
        result := ComCall(25, this, "int", index, "HRESULT")
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
        if (IHTMLSelectElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_size := CallbackCreate(GetMethod(implObj, "put_size"), flags, 2)
        this.vtbl.get_size := CallbackCreate(GetMethod(implObj, "get_size"), flags, 2)
        this.vtbl.put_multiple := CallbackCreate(GetMethod(implObj, "put_multiple"), flags, 2)
        this.vtbl.get_multiple := CallbackCreate(GetMethod(implObj, "get_multiple"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_options := CallbackCreate(GetMethod(implObj, "get_options"), flags, 2)
        this.vtbl.put_onchange := CallbackCreate(GetMethod(implObj, "put_onchange"), flags, 2)
        this.vtbl.get_onchange := CallbackCreate(GetMethod(implObj, "get_onchange"), flags, 2)
        this.vtbl.put_selectedIndex := CallbackCreate(GetMethod(implObj, "put_selectedIndex"), flags, 2)
        this.vtbl.get_selectedIndex := CallbackCreate(GetMethod(implObj, "get_selectedIndex"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.put_disabled := CallbackCreate(GetMethod(implObj, "put_disabled"), flags, 2)
        this.vtbl.get_disabled := CallbackCreate(GetMethod(implObj, "get_disabled"), flags, 2)
        this.vtbl.get_form := CallbackCreate(GetMethod(implObj, "get_form"), flags, 2)
        this.vtbl.add := CallbackCreate(GetMethod(implObj, "add"), flags, 3)
        this.vtbl.remove := CallbackCreate(GetMethod(implObj, "remove"), flags, 2)
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
        CallbackFree(this.vtbl.put_size)
        CallbackFree(this.vtbl.get_size)
        CallbackFree(this.vtbl.put_multiple)
        CallbackFree(this.vtbl.get_multiple)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_options)
        CallbackFree(this.vtbl.put_onchange)
        CallbackFree(this.vtbl.get_onchange)
        CallbackFree(this.vtbl.put_selectedIndex)
        CallbackFree(this.vtbl.get_selectedIndex)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.put_value)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.put_disabled)
        CallbackFree(this.vtbl.get_disabled)
        CallbackFree(this.vtbl.get_form)
        CallbackFree(this.vtbl.add)
        CallbackFree(this.vtbl.remove)
        CallbackFree(this.vtbl.put_length)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get__newEnum)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.tags)
    }
}
