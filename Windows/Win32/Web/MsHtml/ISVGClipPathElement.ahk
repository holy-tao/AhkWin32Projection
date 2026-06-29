#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISVGAnimatedEnumeration.ahk" { ISVGAnimatedEnumeration }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGClipPathElement extends IDispatch {
    /**
     * The interface identifier for ISVGClipPathElement
     * @type {Guid}
     */
    static IID := Guid("{3051052d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGClipPathElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105e6-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGClipPathElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_clipPathUnits : IntPtr
        get_clipPathUnits    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGClipPathElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedEnumeration} 
     */
    clipPathUnits {
        get => this.get_clipPathUnits()
    }

    /**
     * 
     * @param {ISVGAnimatedEnumeration} v 
     * @returns {HRESULT} 
     */
    putref_clipPathUnits(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedEnumeration} 
     */
    get_clipPathUnits() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedEnumeration(p)
    }

    Query(iid) {
        if (ISVGClipPathElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_clipPathUnits := CallbackCreate(GetMethod(implObj, "putref_clipPathUnits"), flags, 2)
        this.vtbl.get_clipPathUnits := CallbackCreate(GetMethod(implObj, "get_clipPathUnits"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_clipPathUnits)
        CallbackFree(this.vtbl.get_clipPathUnits)
    }
}
