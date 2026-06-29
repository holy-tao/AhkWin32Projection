#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISVGAnimatedNumber.ahk" { ISVGAnimatedNumber }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGStopElement extends IDispatch {
    /**
     * The interface identifier for ISVGStopElement
     * @type {Guid}
     */
    static IID := Guid("{3051052b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGStopElement
     * @type {Guid}
     */
    static CLSID := Guid("{305105d5-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGStopElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        putref_offset : IntPtr
        get_offset    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGStopElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISVGAnimatedNumber} 
     */
    offset {
        get => this.get_offset()
    }

    /**
     * 
     * @param {ISVGAnimatedNumber} v 
     * @returns {HRESULT} 
     */
    putref_offset(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISVGAnimatedNumber} 
     */
    get_offset() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGAnimatedNumber(p)
    }

    Query(iid) {
        if (ISVGStopElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putref_offset := CallbackCreate(GetMethod(implObj, "putref_offset"), flags, 2)
        this.vtbl.get_offset := CallbackCreate(GetMethod(implObj, "get_offset"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putref_offset)
        CallbackFree(this.vtbl.get_offset)
    }
}
