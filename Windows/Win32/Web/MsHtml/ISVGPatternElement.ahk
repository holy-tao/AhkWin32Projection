#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedEnumeration.ahk" { ISVGAnimatedEnumeration }
#Import ".\ISVGAnimatedLength.ahk" { ISVGAnimatedLength }
#Import ".\ISVGAnimatedTransformList.ahk" { ISVGAnimatedTransformList }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGPatternElement extends IDispatch {
    /**
     * The interface identifier for ISVGPatternElement
     * @type {Guid}
     */
    static IID := Guid("{3051052c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPatternElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105d4-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGPatternElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_patternUnits        : IntPtr
        get_patternUnits           : IntPtr
        putref_patternContentUnits : IntPtr
        get_patternContentUnits    : IntPtr
        putref_patternTransform    : IntPtr
        get_patternTransform       : IntPtr
        putref_x                   : IntPtr
        get_x                      : IntPtr
        putref_y                   : IntPtr
        get_y                      : IntPtr
        putref_width               : IntPtr
        get_width                  : IntPtr
        putref_height              : IntPtr
        get_height                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGPatternElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    patternUnits {
        get => this.get_patternUnits()
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    patternContentUnits {
        get => this.get_patternContentUnits()
    }

    /**
     * @type {ISVGAnimatedTransformList} 
     */
    patternTransform {
        get => this.get_patternTransform()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    x {
        get => this.get_x()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    y {
        get => this.get_y()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    width {
        get => this.get_width()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    height {
        get => this.get_height()
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_patternUnits(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_patternUnits() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_patternContentUnits(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_patternContentUnits() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    /**
     * 
     * @param {ISVGAnimatedTransformList} v 
     * @returns {HRESULT} 
     */
    putref_patternTransform(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedTransformList} 
     */
    get_patternTransform() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedTransformList(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_x(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_x() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_y(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_y() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_width(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_width() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_height(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_height() {
        result := ComCall(20, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    Query(iid) {
        if (ISVGPatternElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_patternUnits := CallbackCreate(GetMethod(implObj, "putref_patternUnits"), flags, 2)
        this.vtbl.get_patternUnits := CallbackCreate(GetMethod(implObj, "get_patternUnits"), flags, 2)
        this.vtbl.putref_patternContentUnits := CallbackCreate(GetMethod(implObj, "putref_patternContentUnits"), flags, 2)
        this.vtbl.get_patternContentUnits := CallbackCreate(GetMethod(implObj, "get_patternContentUnits"), flags, 2)
        this.vtbl.putref_patternTransform := CallbackCreate(GetMethod(implObj, "putref_patternTransform"), flags, 2)
        this.vtbl.get_patternTransform := CallbackCreate(GetMethod(implObj, "get_patternTransform"), flags, 2)
        this.vtbl.putref_x := CallbackCreate(GetMethod(implObj, "putref_x"), flags, 2)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.putref_y := CallbackCreate(GetMethod(implObj, "putref_y"), flags, 2)
        this.vtbl.get_y := CallbackCreate(GetMethod(implObj, "get_y"), flags, 2)
        this.vtbl.putref_width := CallbackCreate(GetMethod(implObj, "putref_width"), flags, 2)
        this.vtbl.get_width := CallbackCreate(GetMethod(implObj, "get_width"), flags, 2)
        this.vtbl.putref_height := CallbackCreate(GetMethod(implObj, "putref_height"), flags, 2)
        this.vtbl.get_height := CallbackCreate(GetMethod(implObj, "get_height"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_patternUnits)
        CallbackFree(this.vtbl.get_patternUnits)
        CallbackFree(this.vtbl.putref_patternContentUnits)
        CallbackFree(this.vtbl.get_patternContentUnits)
        CallbackFree(this.vtbl.putref_patternTransform)
        CallbackFree(this.vtbl.get_patternTransform)
        CallbackFree(this.vtbl.putref_x)
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.putref_y)
        CallbackFree(this.vtbl.get_y)
        CallbackFree(this.vtbl.putref_width)
        CallbackFree(this.vtbl.get_width)
        CallbackFree(this.vtbl.putref_height)
        CallbackFree(this.vtbl.get_height)
    }
}
