#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGMatrix.ahk" { ISVGMatrix }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGElement.ahk" { ISVGElement }
#Import ".\ISVGRect.ahk" { ISVGRect }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGLocatable extends IDispatch {
    /**
     * The interface identifier for ISVGLocatable
     * @type {Guid}
     */
    static IID := Guid("{305104db-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGLocatable interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_nearestViewportElement  : IntPtr
        get_farthestViewportElement : IntPtr
        getBBox                     : IntPtr
        getCTM                      : IntPtr
        getScreenCTM                : IntPtr
        getTransformToElement       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGLocatable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGElement} 
     */
    nearestViewportElement {
        get => this.get_nearestViewportElement()
    }

    /**
     * @type {ISVGElement} 
     */
    farthestViewportElement {
        get => this.get_farthestViewportElement()
    }

    /**
     * 
     * @returns {ISVGElement} 
     */
    get_nearestViewportElement() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElement(p)
    }

    /**
     * 
     * @returns {ISVGElement} 
     */
    get_farthestViewportElement() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGElement(p)
    }

    /**
     * 
     * @returns {ISVGRect} 
     */
    getBBox() {
        result := ComCall(9, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGRect(ppResult)
    }

    /**
     * 
     * @returns {ISVGMatrix} 
     */
    getCTM() {
        result := ComCall(10, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @returns {ISVGMatrix} 
     */
    getScreenCTM() {
        result := ComCall(11, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    /**
     * 
     * @param {ISVGElement} pElement 
     * @returns {ISVGMatrix} 
     */
    getTransformToElement(pElement) {
        result := ComCall(12, this, "ptr", pElement, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGMatrix(ppResult)
    }

    Query(iid) {
        if (ISVGLocatable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_nearestViewportElement := CallbackCreate(GetMethod(implObj, "get_nearestViewportElement"), flags, 2)
        this.vtbl.get_farthestViewportElement := CallbackCreate(GetMethod(implObj, "get_farthestViewportElement"), flags, 2)
        this.vtbl.getBBox := CallbackCreate(GetMethod(implObj, "getBBox"), flags, 2)
        this.vtbl.getCTM := CallbackCreate(GetMethod(implObj, "getCTM"), flags, 2)
        this.vtbl.getScreenCTM := CallbackCreate(GetMethod(implObj, "getScreenCTM"), flags, 2)
        this.vtbl.getTransformToElement := CallbackCreate(GetMethod(implObj, "getTransformToElement"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_nearestViewportElement)
        CallbackFree(this.vtbl.get_farthestViewportElement)
        CallbackFree(this.vtbl.getBBox)
        CallbackFree(this.vtbl.getCTM)
        CallbackFree(this.vtbl.getScreenCTM)
        CallbackFree(this.vtbl.getTransformToElement)
    }
}
