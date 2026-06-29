#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISVGStringList.ahk" { ISVGStringList }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGViewElement extends IDispatch {
    /**
     * The interface identifier for ISVGViewElement
     * @type {Guid}
     */
    static IID := Guid("{3051054c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGViewElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105dc-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGViewElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_viewTarget : IntPtr
        get_viewTarget    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGViewElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGStringList} 
     */
    viewTarget {
        get => this.get_viewTarget()
    }

    /**
     * 
     * @param {ISVGStringList} v 
     * @returns {HRESULT} 
     */
    putref_viewTarget(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGStringList} 
     */
    get_viewTarget() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGStringList(p)
    }

    Query(iid) {
        if (ISVGViewElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_viewTarget := CallbackCreate(GetMethod(implObj, "putref_viewTarget"), flags, 2)
        this.vtbl.get_viewTarget := CallbackCreate(GetMethod(implObj, "get_viewTarget"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_viewTarget)
        CallbackFree(this.vtbl.get_viewTarget)
    }
}
