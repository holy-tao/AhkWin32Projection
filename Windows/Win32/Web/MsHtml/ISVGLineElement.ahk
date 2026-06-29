#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedLength.ahk" { ISVGAnimatedLength }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGLineElement extends IDispatch {
    /**
     * The interface identifier for ISVGLineElement
     * @type {Guid}
     */
    static IID := Guid("{30510516-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGLineElement
     * @type {Guid}
     */
    static CLSID := Guid("{3051057a-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGLineElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_x1 : IntPtr
        get_x1    : IntPtr
        putref_y1 : IntPtr
        get_y1    : IntPtr
        putref_x2 : IntPtr
        get_x2    : IntPtr
        putref_y2 : IntPtr
        get_y2    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGLineElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    x1 {
        get => this.get_x1()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    y1 {
        get => this.get_y1()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    x2 {
        get => this.get_x2()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    y2 {
        get => this.get_y2()
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_x1(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_x1() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_y1(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_y1() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_x2(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_x2() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_y2(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_y2() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    Query(iid) {
        if (ISVGLineElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_x1 := CallbackCreate(GetMethod(implObj, "putref_x1"), flags, 2)
        this.vtbl.get_x1 := CallbackCreate(GetMethod(implObj, "get_x1"), flags, 2)
        this.vtbl.putref_y1 := CallbackCreate(GetMethod(implObj, "putref_y1"), flags, 2)
        this.vtbl.get_y1 := CallbackCreate(GetMethod(implObj, "get_y1"), flags, 2)
        this.vtbl.putref_x2 := CallbackCreate(GetMethod(implObj, "putref_x2"), flags, 2)
        this.vtbl.get_x2 := CallbackCreate(GetMethod(implObj, "get_x2"), flags, 2)
        this.vtbl.putref_y2 := CallbackCreate(GetMethod(implObj, "putref_y2"), flags, 2)
        this.vtbl.get_y2 := CallbackCreate(GetMethod(implObj, "get_y2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_x1)
        CallbackFree(this.vtbl.get_x1)
        CallbackFree(this.vtbl.putref_y1)
        CallbackFree(this.vtbl.get_y1)
        CallbackFree(this.vtbl.putref_x2)
        CallbackFree(this.vtbl.get_x2)
        CallbackFree(this.vtbl.putref_y2)
        CallbackFree(this.vtbl.get_y2)
    }
}
