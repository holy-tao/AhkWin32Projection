#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAngle.ahk" { ISVGAngle }
#Import ".\ISVGAnimatedEnumeration.ahk" { ISVGAnimatedEnumeration }
#Import ".\ISVGAnimatedLength.ahk" { ISVGAnimatedLength }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGAnimatedAngle.ahk" { ISVGAnimatedAngle }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGMarkerElement extends IDispatch {
    /**
     * The interface identifier for ISVGMarkerElement
     * @type {Guid}
     */
    static IID := Guid("{30510525-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGMarkerElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105de-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGMarkerElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_refX         : IntPtr
        get_refX            : IntPtr
        putref_refY         : IntPtr
        get_refY            : IntPtr
        putref_markerUnits  : IntPtr
        get_markerUnits     : IntPtr
        putref_markerWidth  : IntPtr
        get_markerWidth     : IntPtr
        putref_markerHeight : IntPtr
        get_markerHeight    : IntPtr
        putref_orientType   : IntPtr
        get_orientType      : IntPtr
        putref_orientAngle  : IntPtr
        get_orientAngle     : IntPtr
        setOrientToAuto     : IntPtr
        setOrientToAngle    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGMarkerElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    refX {
        get => this.get_refX()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    refY {
        get => this.get_refY()
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    markerUnits {
        get => this.get_markerUnits()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    markerWidth {
        get => this.get_markerWidth()
    }

    /**
     * @type {ISVGAnimatedLength} 
     */
    markerHeight {
        get => this.get_markerHeight()
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    orientType {
        get => this.get_orientType()
    }

    /**
     * @type {ISVGAnimatedAngle} 
     */
    orientAngle {
        get => this.get_orientAngle()
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_refX(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_refX() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_refY(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_refY() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_markerUnits(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_markerUnits() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_markerWidth(v) {
        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_markerWidth() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedLength} v 
     * @returns {HRESULT} 
     */
    putref_markerHeight(v) {
        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedLength} 
     */
    get_markerHeight() {
        result := ComCall(16, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedLength(p)
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_orientType(v) {
        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_orientType() {
        result := ComCall(18, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    /**
     * 
     * @param {ISVGAnimatedAngle} v 
     * @returns {HRESULT} 
     */
    putref_orientAngle(v) {
        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedAngle} 
     */
    get_orientAngle() {
        result := ComCall(20, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedAngle(p)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    setOrientToAuto() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGAngle} pSVGAngle 
     * @returns {HRESULT} 
     */
    setOrientToAngle(pSVGAngle) {
        result := ComCall(22, this, "ptr", pSVGAngle, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISVGMarkerElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_refX := CallbackCreate(GetMethod(implObj, "putref_refX"), flags, 2)
        this.vtbl.get_refX := CallbackCreate(GetMethod(implObj, "get_refX"), flags, 2)
        this.vtbl.putref_refY := CallbackCreate(GetMethod(implObj, "putref_refY"), flags, 2)
        this.vtbl.get_refY := CallbackCreate(GetMethod(implObj, "get_refY"), flags, 2)
        this.vtbl.putref_markerUnits := CallbackCreate(GetMethod(implObj, "putref_markerUnits"), flags, 2)
        this.vtbl.get_markerUnits := CallbackCreate(GetMethod(implObj, "get_markerUnits"), flags, 2)
        this.vtbl.putref_markerWidth := CallbackCreate(GetMethod(implObj, "putref_markerWidth"), flags, 2)
        this.vtbl.get_markerWidth := CallbackCreate(GetMethod(implObj, "get_markerWidth"), flags, 2)
        this.vtbl.putref_markerHeight := CallbackCreate(GetMethod(implObj, "putref_markerHeight"), flags, 2)
        this.vtbl.get_markerHeight := CallbackCreate(GetMethod(implObj, "get_markerHeight"), flags, 2)
        this.vtbl.putref_orientType := CallbackCreate(GetMethod(implObj, "putref_orientType"), flags, 2)
        this.vtbl.get_orientType := CallbackCreate(GetMethod(implObj, "get_orientType"), flags, 2)
        this.vtbl.putref_orientAngle := CallbackCreate(GetMethod(implObj, "putref_orientAngle"), flags, 2)
        this.vtbl.get_orientAngle := CallbackCreate(GetMethod(implObj, "get_orientAngle"), flags, 2)
        this.vtbl.setOrientToAuto := CallbackCreate(GetMethod(implObj, "setOrientToAuto"), flags, 1)
        this.vtbl.setOrientToAngle := CallbackCreate(GetMethod(implObj, "setOrientToAngle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_refX)
        CallbackFree(this.vtbl.get_refX)
        CallbackFree(this.vtbl.putref_refY)
        CallbackFree(this.vtbl.get_refY)
        CallbackFree(this.vtbl.putref_markerUnits)
        CallbackFree(this.vtbl.get_markerUnits)
        CallbackFree(this.vtbl.putref_markerWidth)
        CallbackFree(this.vtbl.get_markerWidth)
        CallbackFree(this.vtbl.putref_markerHeight)
        CallbackFree(this.vtbl.get_markerHeight)
        CallbackFree(this.vtbl.putref_orientType)
        CallbackFree(this.vtbl.get_orientType)
        CallbackFree(this.vtbl.putref_orientAngle)
        CallbackFree(this.vtbl.get_orientAngle)
        CallbackFree(this.vtbl.setOrientToAuto)
        CallbackFree(this.vtbl.setOrientToAngle)
    }
}
