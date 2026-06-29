#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGPathSegArcRel extends IDispatch {
    /**
     * The interface identifier for ISVGPathSegArcRel
     * @type {Guid}
     */
    static IID := Guid("{30510507-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathSegArcRel
     * @type {Guid}
     */
    static CLSID := Guid("{305105bc-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGPathSegArcRel interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_x            : IntPtr
        get_x            : IntPtr
        put_y            : IntPtr
        get_y            : IntPtr
        put_r1           : IntPtr
        get_r1           : IntPtr
        put_r2           : IntPtr
        get_r2           : IntPtr
        put_angle        : IntPtr
        get_angle        : IntPtr
        put_largeArcFlag : IntPtr
        get_largeArcFlag : IntPtr
        put_sweepFlag    : IntPtr
        get_sweepFlag    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGPathSegArcRel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    x {
        get => this.get_x()
        set => this.put_x(value)
    }

    /**
     * @type {Float} 
     */
    y {
        get => this.get_y()
        set => this.put_y(value)
    }

    /**
     * @type {Float} 
     */
    r1 {
        get => this.get_r1()
        set => this.put_r1(value)
    }

    /**
     * @type {Float} 
     */
    r2 {
        get => this.get_r2()
        set => this.put_r2(value)
    }

    /**
     * @type {Float} 
     */
    angle {
        get => this.get_angle()
        set => this.put_angle(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    largeArcFlag {
        get => this.get_largeArcFlag()
        set => this.put_largeArcFlag(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    sweepFlag {
        get => this.get_sweepFlag()
        set => this.put_sweepFlag(value)
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_x(v) {
        result := ComCall(7, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_x() {
        result := ComCall(8, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_y(v) {
        result := ComCall(9, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_y() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_r1(v) {
        result := ComCall(11, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_r1() {
        result := ComCall(12, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_r2(v) {
        result := ComCall(13, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_r2() {
        result := ComCall(14, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_angle(v) {
        result := ComCall(15, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_angle() {
        result := ComCall(16, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_largeArcFlag(v) {
        result := ComCall(17, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_largeArcFlag() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_sweepFlag(v) {
        result := ComCall(19, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_sweepFlag() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGPathSegArcRel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_x := CallbackCreate(GetMethod(implObj, "put_x"), flags, 2)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.put_y := CallbackCreate(GetMethod(implObj, "put_y"), flags, 2)
        this.vtbl.get_y := CallbackCreate(GetMethod(implObj, "get_y"), flags, 2)
        this.vtbl.put_r1 := CallbackCreate(GetMethod(implObj, "put_r1"), flags, 2)
        this.vtbl.get_r1 := CallbackCreate(GetMethod(implObj, "get_r1"), flags, 2)
        this.vtbl.put_r2 := CallbackCreate(GetMethod(implObj, "put_r2"), flags, 2)
        this.vtbl.get_r2 := CallbackCreate(GetMethod(implObj, "get_r2"), flags, 2)
        this.vtbl.put_angle := CallbackCreate(GetMethod(implObj, "put_angle"), flags, 2)
        this.vtbl.get_angle := CallbackCreate(GetMethod(implObj, "get_angle"), flags, 2)
        this.vtbl.put_largeArcFlag := CallbackCreate(GetMethod(implObj, "put_largeArcFlag"), flags, 2)
        this.vtbl.get_largeArcFlag := CallbackCreate(GetMethod(implObj, "get_largeArcFlag"), flags, 2)
        this.vtbl.put_sweepFlag := CallbackCreate(GetMethod(implObj, "put_sweepFlag"), flags, 2)
        this.vtbl.get_sweepFlag := CallbackCreate(GetMethod(implObj, "get_sweepFlag"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_x)
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.put_y)
        CallbackFree(this.vtbl.get_y)
        CallbackFree(this.vtbl.put_r1)
        CallbackFree(this.vtbl.get_r1)
        CallbackFree(this.vtbl.put_r2)
        CallbackFree(this.vtbl.get_r2)
        CallbackFree(this.vtbl.put_angle)
        CallbackFree(this.vtbl.get_angle)
        CallbackFree(this.vtbl.put_largeArcFlag)
        CallbackFree(this.vtbl.get_largeArcFlag)
        CallbackFree(this.vtbl.put_sweepFlag)
        CallbackFree(this.vtbl.get_sweepFlag)
    }
}
