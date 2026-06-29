#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedNumberList.ahk" { ISVGAnimatedNumberList }
#Import ".\ISVGAnimatedLengthList.ahk" { ISVGAnimatedLengthList }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGTextPositioningElement extends IDispatch {
    /**
     * The interface identifier for ISVGTextPositioningElement
     * @type {Guid}
     */
    static IID := Guid("{3051051b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGTextPositioningElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105e0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGTextPositioningElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_x      : IntPtr
        get_x         : IntPtr
        putref_y      : IntPtr
        get_y         : IntPtr
        putref_dx     : IntPtr
        get_dx        : IntPtr
        putref_dy     : IntPtr
        get_dy        : IntPtr
        putref_rotate : IntPtr
        get_rotate    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGTextPositioningElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedLengthList} 
     */
    x {
        get => this.get_x()
    }

    /**
     * @type {ISVGAnimatedLengthList} 
     */
    y {
        get => this.get_y()
    }

    /**
     * @type {ISVGAnimatedLengthList} 
     */
    dx {
        get => this.get_dx()
    }

    /**
     * @type {ISVGAnimatedLengthList} 
     */
    dy {
        get => this.get_dy()
    }

    /**
     * @type {ISVGAnimatedNumberList} 
     */
    rotate {
        get => this.get_rotate()
    }

    /**
     * 
     * @param {ISVGAnimatedLengthList} v 
     * @returns {HRESULT} 
     */
    putref_x(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLengthList} 
     */
    get_x() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLengthList(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLengthList} v 
     * @returns {HRESULT} 
     */
    putref_y(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLengthList} 
     */
    get_y() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLengthList(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLengthList} v 
     * @returns {HRESULT} 
     */
    putref_dx(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLengthList} 
     */
    get_dx() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLengthList(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLengthList} v 
     * @returns {HRESULT} 
     */
    putref_dy(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLengthList} 
     */
    get_dy() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLengthList(p)
    }

    /**
     * 
     * @param {ISVGAnimatedNumberList} v 
     * @returns {HRESULT} 
     */
    putref_rotate(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedNumberList} 
     */
    get_rotate() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedNumberList(p)
    }

    Query(iid) {
        if (ISVGTextPositioningElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_x := CallbackCreate(GetMethod(implObj, "putref_x"), flags, 2)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.putref_y := CallbackCreate(GetMethod(implObj, "putref_y"), flags, 2)
        this.vtbl.get_y := CallbackCreate(GetMethod(implObj, "get_y"), flags, 2)
        this.vtbl.putref_dx := CallbackCreate(GetMethod(implObj, "putref_dx"), flags, 2)
        this.vtbl.get_dx := CallbackCreate(GetMethod(implObj, "get_dx"), flags, 2)
        this.vtbl.putref_dy := CallbackCreate(GetMethod(implObj, "putref_dy"), flags, 2)
        this.vtbl.get_dy := CallbackCreate(GetMethod(implObj, "get_dy"), flags, 2)
        this.vtbl.putref_rotate := CallbackCreate(GetMethod(implObj, "putref_rotate"), flags, 2)
        this.vtbl.get_rotate := CallbackCreate(GetMethod(implObj, "get_rotate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_x)
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.putref_y)
        CallbackFree(this.vtbl.get_y)
        CallbackFree(this.vtbl.putref_dx)
        CallbackFree(this.vtbl.get_dx)
        CallbackFree(this.vtbl.putref_dy)
        CallbackFree(this.vtbl.get_dy)
        CallbackFree(this.vtbl.putref_rotate)
        CallbackFree(this.vtbl.get_rotate)
    }
}
