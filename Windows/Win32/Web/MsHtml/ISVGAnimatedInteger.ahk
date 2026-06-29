#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGAnimatedInteger extends IDispatch {
    /**
     * The interface identifier for ISVGAnimatedInteger
     * @type {Guid}
     */
    static IID := Guid("{305104ca-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAnimatedInteger
     * @type {Guid}
     */
    static CLSID := Guid("{3051058f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGAnimatedInteger interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_baseVal : IntPtr
        get_baseVal : IntPtr
        put_animVal : IntPtr
        get_animVal : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGAnimatedInteger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    baseVal {
        get => this.get_baseVal()
        set => this.put_baseVal(value)
    }

    /**
     * @type {Integer} 
     */
    animVal {
        get => this.get_animVal()
        set => this.put_animVal(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_baseVal(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_baseVal() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_animVal(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_animVal() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (ISVGAnimatedInteger.IID.Equals(iid)) {
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
