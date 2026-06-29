#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAngle.ahk" { ISVGAngle }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGAnimatedAngle extends IDispatch {
    /**
     * The interface identifier for ISVGAnimatedAngle
     * @type {Guid}
     */
    static IID := Guid("{305104d4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAnimatedAngle
     * @type {Guid}
     */
    static CLSID := Guid("{305105e4-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGAnimatedAngle interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_baseVal : IntPtr
        get_baseVal    : IntPtr
        putref_animVal : IntPtr
        get_animVal    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGAnimatedAngle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAngle} 
     */
    baseVal {
        get => this.get_baseVal()
    }

    /**
     * @type {ISVGAngle} 
     */
    animVal {
        get => this.get_animVal()
    }

    /**
     * 
     * @param {ISVGAngle} v 
     * @returns {HRESULT} 
     */
    putref_baseVal(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAngle} 
     */
    get_baseVal() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAngle(p)
    }

    /**
     * 
     * @param {ISVGAngle} v 
     * @returns {HRESULT} 
     */
    putref_animVal(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAngle} 
     */
    get_animVal() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAngle(p)
    }

    Query(iid) {
        if (ISVGAnimatedAngle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_baseVal := CallbackCreate(GetMethod(implObj, "putref_baseVal"), flags, 2)
        this.vtbl.get_baseVal := CallbackCreate(GetMethod(implObj, "get_baseVal"), flags, 2)
        this.vtbl.putref_animVal := CallbackCreate(GetMethod(implObj, "putref_animVal"), flags, 2)
        this.vtbl.get_animVal := CallbackCreate(GetMethod(implObj, "get_animVal"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_baseVal)
        CallbackFree(this.vtbl.get_baseVal)
        CallbackFree(this.vtbl.putref_animVal)
        CallbackFree(this.vtbl.get_animVal)
    }
}
