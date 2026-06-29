#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGAnimatedBoolean extends IDispatch {
    /**
     * The interface identifier for ISVGAnimatedBoolean
     * @type {Guid}
     */
    static IID := Guid("{305104c6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAnimatedBoolean
     * @type {Guid}
     */
    static CLSID := Guid("{3051058b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGAnimatedBoolean interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_baseVal : IntPtr
        get_baseVal : IntPtr
        put_animVal : IntPtr
        get_animVal : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGAnimatedBoolean.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    baseVal {
        get => this.get_baseVal()
        set => this.put_baseVal(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    animVal {
        get => this.get_animVal()
        set => this.put_animVal(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_baseVal(v) {
        result := ComCall(7, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_baseVal() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_animVal(v) {
        result := ComCall(9, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_animVal() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGAnimatedBoolean.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_baseVal := CallbackCreate(GetMethod(implObj, "put_baseVal"), flags, 2)
        this.vtbl.get_baseVal := CallbackCreate(GetMethod(implObj, "get_baseVal"), flags, 2)
        this.vtbl.put_animVal := CallbackCreate(GetMethod(implObj, "put_animVal"), flags, 2)
        this.vtbl.get_animVal := CallbackCreate(GetMethod(implObj, "get_animVal"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_baseVal)
        CallbackFree(this.vtbl.get_baseVal)
        CallbackFree(this.vtbl.put_animVal)
        CallbackFree(this.vtbl.get_animVal)
    }
}
