#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedLength.ahk" { ISVGAnimatedLength }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGEllipseElement extends IDispatch {
    /**
     * The interface identifier for ISVGEllipseElement
     * @type {Guid}
     */
    static IID := Guid("{30510515-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGEllipseElement
     * @type {Guid}
     */
    static CLSID := Guid("{30510579-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGEllipseElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_cx : IntPtr
        get_cx    : IntPtr
        putref_cy : IntPtr
        get_cy    : IntPtr
        putref_rx : IntPtr
        get_rx    : IntPtr
        putref_ry : IntPtr
        get_ry    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGEllipseElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    cx {
        get => this.get_cx()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    cy {
        get => this.get_cy()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    rx {
        get => this.get_rx()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    ry {
        get => this.get_ry()
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_cx(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_cx() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_cy(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_cy() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_rx(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_rx() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_ry(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_ry() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    Query(iid) {
        if (ISVGEllipseElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_cx := CallbackCreate(GetMethod(implObj, "putref_cx"), flags, 2)
        this.vtbl.get_cx := CallbackCreate(GetMethod(implObj, "get_cx"), flags, 2)
        this.vtbl.putref_cy := CallbackCreate(GetMethod(implObj, "putref_cy"), flags, 2)
        this.vtbl.get_cy := CallbackCreate(GetMethod(implObj, "get_cy"), flags, 2)
        this.vtbl.putref_rx := CallbackCreate(GetMethod(implObj, "putref_rx"), flags, 2)
        this.vtbl.get_rx := CallbackCreate(GetMethod(implObj, "get_rx"), flags, 2)
        this.vtbl.putref_ry := CallbackCreate(GetMethod(implObj, "putref_ry"), flags, 2)
        this.vtbl.get_ry := CallbackCreate(GetMethod(implObj, "get_ry"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_cx)
        CallbackFree(this.vtbl.get_cx)
        CallbackFree(this.vtbl.putref_cy)
        CallbackFree(this.vtbl.get_cy)
        CallbackFree(this.vtbl.putref_rx)
        CallbackFree(this.vtbl.get_rx)
        CallbackFree(this.vtbl.putref_ry)
        CallbackFree(this.vtbl.get_ry)
    }
}
