#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLPerformanceTiming.ahk" { IHTMLPerformanceTiming }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLPerformanceNavigation.ahk" { IHTMLPerformanceNavigation }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLPerformance extends IDispatch {
    /**
     * The interface identifier for IHTMLPerformance
     * @type {Guid}
     */
    static IID := Guid("{3051074e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPerformance
     * @type {Guid}
     */
    static CLSID := Guid("{3051074f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPerformance interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_navigation : IntPtr
        get_timing     : IntPtr
        toString       : IntPtr
        toJSON         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPerformance.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLPerformanceNavigation} 
     */
    navigation {
        get => this.get_navigation()
    }

    /**
     * @type {IHTMLPerformanceTiming} 
     */
    timing {
        get => this.get_timing()
    }

    /**
     * 
     * @returns {IHTMLPerformanceNavigation} 
     */
    get_navigation() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLPerformanceNavigation(p)
    }

    /**
     * 
     * @returns {IHTMLPerformanceTiming} 
     */
    get_timing() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLPerformanceTiming(p)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        _string := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, _string, "HRESULT")
        return _string
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    toJSON() {
        pVar := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, pVar, "HRESULT")
        return pVar
    }

    Query(iid) {
        if (IHTMLPerformance.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_navigation := CallbackCreate(GetMethod(implObj, "get_navigation"), flags, 2)
        this.vtbl.get_timing := CallbackCreate(GetMethod(implObj, "get_timing"), flags, 2)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
        this.vtbl.toJSON := CallbackCreate(GetMethod(implObj, "toJSON"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_navigation)
        CallbackFree(this.vtbl.get_timing)
        CallbackFree(this.vtbl.toString)
        CallbackFree(this.vtbl.toJSON)
    }
}
