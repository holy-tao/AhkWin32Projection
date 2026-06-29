#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGPointList.ahk" { ISVGPointList }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGAnimatedPoints extends IDispatch {
    /**
     * The interface identifier for ISVGAnimatedPoints
     * @type {Guid}
     */
    static IID := Guid("{30510517-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGAnimatedPoints interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_points         : IntPtr
        get_points            : IntPtr
        putref_animatedPoints : IntPtr
        get_animatedPoints    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGAnimatedPoints.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGPointList} 
     */
    points {
        get => this.get_points()
    }

    /**
     * @type {ISVGPointList} 
     */
    animatedPoints {
        get => this.get_animatedPoints()
    }

    /**
     * 
     * @param {ISVGPointList} v 
     * @returns {HRESULT} 
     */
    putref_points(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGPointList} 
     */
    get_points() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPointList(p)
    }

    /**
     * 
     * @param {ISVGPointList} v 
     * @returns {HRESULT} 
     */
    putref_animatedPoints(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGPointList} 
     */
    get_animatedPoints() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return ISVGPointList(p)
    }

    Query(iid) {
        if (ISVGAnimatedPoints.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_points := CallbackCreate(GetMethod(implObj, "putref_points"), flags, 2)
        this.vtbl.get_points := CallbackCreate(GetMethod(implObj, "get_points"), flags, 2)
        this.vtbl.putref_animatedPoints := CallbackCreate(GetMethod(implObj, "putref_animatedPoints"), flags, 2)
        this.vtbl.get_animatedPoints := CallbackCreate(GetMethod(implObj, "get_animatedPoints"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_points)
        CallbackFree(this.vtbl.get_points)
        CallbackFree(this.vtbl.putref_animatedPoints)
        CallbackFree(this.vtbl.get_animatedPoints)
    }
}
