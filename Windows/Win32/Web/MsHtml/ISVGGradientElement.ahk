#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedEnumeration.ahk" { ISVGAnimatedEnumeration }
#Import ".\ISVGAnimatedTransformList.ahk" { ISVGAnimatedTransformList }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGGradientElement extends IDispatch {
    /**
     * The interface identifier for ISVGGradientElement
     * @type {Guid}
     */
    static IID := Guid("{30510528-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGGradientElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105d6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGGradientElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_gradientUnits     : IntPtr
        get_gradientUnits        : IntPtr
        putref_gradientTransform : IntPtr
        get_gradientTransform    : IntPtr
        putref_spreadMethod      : IntPtr
        get_spreadMethod         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGGradientElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    gradientUnits {
        get => this.get_gradientUnits()
    }

    /**
     * @type {ISVGAnimatedTransformList} 
     */
    gradientTransform {
        get => this.get_gradientTransform()
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    spreadMethod {
        get => this.get_spreadMethod()
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_gradientUnits(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_gradientUnits() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    /**
     * 
     * @param {ISVGAnimatedTransformList} v 
     * @returns {HRESULT} 
     */
    putref_gradientTransform(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedTransformList} 
     */
    get_gradientTransform() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedTransformList(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_spreadMethod(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_spreadMethod() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    Query(iid) {
        if (ISVGGradientElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_gradientUnits := CallbackCreate(GetMethod(implObj, "putref_gradientUnits"), flags, 2)
        this.vtbl.get_gradientUnits := CallbackCreate(GetMethod(implObj, "get_gradientUnits"), flags, 2)
        this.vtbl.putref_gradientTransform := CallbackCreate(GetMethod(implObj, "putref_gradientTransform"), flags, 2)
        this.vtbl.get_gradientTransform := CallbackCreate(GetMethod(implObj, "get_gradientTransform"), flags, 2)
        this.vtbl.putref_spreadMethod := CallbackCreate(GetMethod(implObj, "putref_spreadMethod"), flags, 2)
        this.vtbl.get_spreadMethod := CallbackCreate(GetMethod(implObj, "get_spreadMethod"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_gradientUnits)
        CallbackFree(this.vtbl.get_gradientUnits)
        CallbackFree(this.vtbl.putref_gradientTransform)
        CallbackFree(this.vtbl.get_gradientTransform)
        CallbackFree(this.vtbl.putref_spreadMethod)
        CallbackFree(this.vtbl.get_spreadMethod)
    }
}
