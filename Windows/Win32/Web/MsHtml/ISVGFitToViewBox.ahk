#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedRect.ahk" { ISVGAnimatedRect }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISVGAnimatedPreserveAspectRatio.ahk" { ISVGAnimatedPreserveAspectRatio }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGFitToViewBox extends IDispatch {
    /**
     * The interface identifier for ISVGFitToViewBox
     * @type {Guid}
     */
    static IID := Guid("{305104e0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGFitToViewBox interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_viewBox                : IntPtr
        putref_preserveAspectRatio : IntPtr
        get_preserveAspectRatio    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGFitToViewBox.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedRect} 
     */
    viewBox {
        get => this.get_viewBox()
    }

    /**
     * @type {ISVGAnimatedPreserveAspectRatio} 
     */
    preserveAspectRatio {
        get => this.get_preserveAspectRatio()
    }

    /**
     * 
     * @returns {ISVGAnimatedRect} 
     */
    get_viewBox() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedRect(p)
    }

    /**
     * 
     * @param {ISVGAnimatedPreserveAspectRatio} v 
     * @returns {HRESULT} 
     */
    putref_preserveAspectRatio(v) {
        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedPreserveAspectRatio} 
     */
    get_preserveAspectRatio() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedPreserveAspectRatio(p)
    }

    Query(iid) {
        if (ISVGFitToViewBox.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_viewBox := CallbackCreate(GetMethod(implObj, "get_viewBox"), flags, 2)
        this.vtbl.putref_preserveAspectRatio := CallbackCreate(GetMethod(implObj, "putref_preserveAspectRatio"), flags, 2)
        this.vtbl.get_preserveAspectRatio := CallbackCreate(GetMethod(implObj, "get_preserveAspectRatio"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_viewBox)
        CallbackFree(this.vtbl.putref_preserveAspectRatio)
        CallbackFree(this.vtbl.get_preserveAspectRatio)
    }
}
