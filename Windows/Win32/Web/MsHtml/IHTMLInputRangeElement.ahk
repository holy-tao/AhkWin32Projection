#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLInputRangeElement extends IDispatch {
    /**
     * The interface identifier for IHTMLInputRangeElement
     * @type {Guid}
     */
    static IID := Guid("{3050f2d4-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLInputRangeElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_disabled      : IntPtr
        get_disabled      : IntPtr
        get_type          : IntPtr
        put_alt           : IntPtr
        get_alt           : IntPtr
        put_name          : IntPtr
        get_name          : IntPtr
        put_value         : IntPtr
        get_value         : IntPtr
        put_min           : IntPtr
        get_min           : IntPtr
        put_max           : IntPtr
        get_max           : IntPtr
        put_step          : IntPtr
        get_step          : IntPtr
        put_valueAsNumber : IntPtr
        get_valueAsNumber : IntPtr
        stepUp            : IntPtr
        stepDown          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLInputRangeElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    disabled {
        get => this.get_disabled()
        set => this.put_disabled(value)
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
    alt {
        get => this.get_alt()
        set => this.put_alt(value)
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
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * @type {BSTR} 
     */
    min {
        get => this.get_min()
        set => this.put_min(value)
    }

    /**
     * @type {BSTR} 
     */
    max {
        get => this.get_max()
        set => this.put_max(value)
    }

    /**
     * @type {BSTR} 
     */
    step {
        get => this.get_step()
        set => this.put_step(value)
    }

    /**
     * @type {Float} 
     */
    valueAsNumber {
        get => this.get_valueAsNumber()
        set => this.put_valueAsNumber(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(7, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
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
    put_alt(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(10, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_alt() {
        p := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(12, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(14, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        p := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_min(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(16, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_min() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_max(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(18, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_max() {
        p := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_step(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(20, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_step() {
        p := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_valueAsNumber(v) {
        result := ComCall(22, this, "double", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_valueAsNumber() {
        result := ComCall(23, this, "double*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} n 
     * @returns {HRESULT} 
     */
    stepUp(n) {
        result := ComCall(24, this, "int", n, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} n 
     * @returns {HRESULT} 
     */
    stepDown(n) {
        result := ComCall(25, this, "int", n, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLInputRangeElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_disabled := CallbackCreate(GetMethod(implObj, "put_disabled"), flags, 2)
        this.vtbl.get_disabled := CallbackCreate(GetMethod(implObj, "get_disabled"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.put_alt := CallbackCreate(GetMethod(implObj, "put_alt"), flags, 2)
        this.vtbl.get_alt := CallbackCreate(GetMethod(implObj, "get_alt"), flags, 2)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.put_min := CallbackCreate(GetMethod(implObj, "put_min"), flags, 2)
        this.vtbl.get_min := CallbackCreate(GetMethod(implObj, "get_min"), flags, 2)
        this.vtbl.put_max := CallbackCreate(GetMethod(implObj, "put_max"), flags, 2)
        this.vtbl.get_max := CallbackCreate(GetMethod(implObj, "get_max"), flags, 2)
        this.vtbl.put_step := CallbackCreate(GetMethod(implObj, "put_step"), flags, 2)
        this.vtbl.get_step := CallbackCreate(GetMethod(implObj, "get_step"), flags, 2)
        this.vtbl.put_valueAsNumber := CallbackCreate(GetMethod(implObj, "put_valueAsNumber"), flags, 2)
        this.vtbl.get_valueAsNumber := CallbackCreate(GetMethod(implObj, "get_valueAsNumber"), flags, 2)
        this.vtbl.stepUp := CallbackCreate(GetMethod(implObj, "stepUp"), flags, 2)
        this.vtbl.stepDown := CallbackCreate(GetMethod(implObj, "stepDown"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_disabled)
        CallbackFree(this.vtbl.get_disabled)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.put_alt)
        CallbackFree(this.vtbl.get_alt)
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.put_value)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.put_min)
        CallbackFree(this.vtbl.get_min)
        CallbackFree(this.vtbl.put_max)
        CallbackFree(this.vtbl.get_max)
        CallbackFree(this.vtbl.put_step)
        CallbackFree(this.vtbl.get_step)
        CallbackFree(this.vtbl.put_valueAsNumber)
        CallbackFree(this.vtbl.get_valueAsNumber)
        CallbackFree(this.vtbl.stepUp)
        CallbackFree(this.vtbl.stepDown)
    }
}
