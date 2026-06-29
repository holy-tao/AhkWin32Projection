#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedEnumeration.ahk" { ISVGAnimatedEnumeration }
#Import ".\ISVGAnimatedLength.ahk" { ISVGAnimatedLength }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGTextPathElement extends IDispatch {
    /**
     * The interface identifier for ISVGTextPathElement
     * @type {Guid}
     */
    static IID := Guid("{3051051f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGTextPathElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105eb-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGTextPathElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_startOffset : IntPtr
        get_startOffset    : IntPtr
        putref_method      : IntPtr
        get_method         : IntPtr
        putref_spacing     : IntPtr
        get_spacing        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGTextPathElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    startOffset {
        get => this.get_startOffset()
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    method {
        get => this.get_method()
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    spacing {
        get => this.get_spacing()
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_startOffset(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_startOffset() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_method(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_method() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_spacing(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_spacing() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    Query(iid) {
        if (ISVGTextPathElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_startOffset := CallbackCreate(GetMethod(implObj, "putref_startOffset"), flags, 2)
        this.vtbl.get_startOffset := CallbackCreate(GetMethod(implObj, "get_startOffset"), flags, 2)
        this.vtbl.putref_method := CallbackCreate(GetMethod(implObj, "putref_method"), flags, 2)
        this.vtbl.get_method := CallbackCreate(GetMethod(implObj, "get_method"), flags, 2)
        this.vtbl.putref_spacing := CallbackCreate(GetMethod(implObj, "putref_spacing"), flags, 2)
        this.vtbl.get_spacing := CallbackCreate(GetMethod(implObj, "get_spacing"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_startOffset)
        CallbackFree(this.vtbl.get_startOffset)
        CallbackFree(this.vtbl.putref_method)
        CallbackFree(this.vtbl.get_method)
        CallbackFree(this.vtbl.putref_spacing)
        CallbackFree(this.vtbl.get_spacing)
    }
}
