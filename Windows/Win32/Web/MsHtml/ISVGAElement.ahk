#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGAnimatedString.ahk" { ISVGAnimatedString }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGAElement extends IDispatch {
    /**
     * The interface identifier for ISVGAElement
     * @type {Guid}
     */
    static IID := Guid("{3051054b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105db-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGAElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_target : IntPtr
        get_target    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGAElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedString} 
     */
    target {
        get => this.get_target()
    }

    /**
     * 
     * @param {ISVGAnimatedString} v 
     * @returns {HRESULT} 
     */
    putref_target(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedString} 
     */
    get_target() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedString(p)
    }

    Query(iid) {
        if (ISVGAElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_target := CallbackCreate(GetMethod(implObj, "putref_target"), flags, 2)
        this.vtbl.get_target := CallbackCreate(GetMethod(implObj, "get_target"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_target)
        CallbackFree(this.vtbl.get_target)
    }
}
