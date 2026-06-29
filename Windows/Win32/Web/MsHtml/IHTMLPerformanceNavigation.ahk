#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLPerformanceNavigation extends IDispatch {
    /**
     * The interface identifier for IHTMLPerformanceNavigation
     * @type {Guid}
     */
    static IID := Guid("{30510750-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLPerformanceNavigation
     * @type {Guid}
     */
    static CLSID := Guid("{30510751-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLPerformanceNavigation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_type          : IntPtr
        get_redirectCount : IntPtr
        toString          : IntPtr
        toJSON            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLPerformanceNavigation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {Integer} 
     */
    redirectCount {
        get => this.get_redirectCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_type() {
        result := ComCall(7, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_redirectCount() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
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
        if (IHTMLPerformanceNavigation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_redirectCount := CallbackCreate(GetMethod(implObj, "get_redirectCount"), flags, 2)
        this.vtbl.toString := CallbackCreate(GetMethod(implObj, "toString"), flags, 2)
        this.vtbl.toJSON := CallbackCreate(GetMethod(implObj, "toJSON"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_redirectCount)
        CallbackFree(this.vtbl.toString)
        CallbackFree(this.vtbl.toJSON)
    }
}
