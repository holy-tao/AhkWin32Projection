#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Ole\CALPOLESTR.ahk" { CALPOLESTR }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Ole\CADWORD.ahk" { CADWORD }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IPerPropertyBrowsing2 extends IUnknown {
    /**
     * The interface identifier for IPerPropertyBrowsing2
     * @type {Guid}
     */
    static IID := Guid("{51973c54-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPerPropertyBrowsing2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDisplayString     : IntPtr
        MapPropertyToPage    : IntPtr
        GetPredefinedStrings : IntPtr
        SetPredefinedValue   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPerPropertyBrowsing2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dispid 
     * @returns {BSTR} 
     */
    GetDisplayString(dispid) {
        pBstr := BSTR.Owned()
        result := ComCall(3, this, "int", dispid, BSTR.Ptr, pBstr, "HRESULT")
        return pBstr
    }

    /**
     * 
     * @param {Integer} dispid 
     * @returns {Guid} 
     */
    MapPropertyToPage(dispid) {
        pClsidPropPage := Guid()
        result := ComCall(4, this, "int", dispid, Guid.Ptr, pClsidPropPage, "HRESULT")
        return pClsidPropPage
    }

    /**
     * 
     * @param {Integer} dispid 
     * @param {Pointer<CALPOLESTR>} pCaStrings 
     * @param {Pointer<CADWORD>} pCaCookies 
     * @returns {HRESULT} 
     */
    GetPredefinedStrings(dispid, pCaStrings, pCaCookies) {
        result := ComCall(5, this, "int", dispid, CALPOLESTR.Ptr, pCaStrings, CADWORD.Ptr, pCaCookies, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispid 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    SetPredefinedValue(dispid, dwCookie) {
        result := ComCall(6, this, "int", dispid, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPerPropertyBrowsing2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDisplayString := CallbackCreate(GetMethod(implObj, "GetDisplayString"), flags, 3)
        this.vtbl.MapPropertyToPage := CallbackCreate(GetMethod(implObj, "MapPropertyToPage"), flags, 3)
        this.vtbl.GetPredefinedStrings := CallbackCreate(GetMethod(implObj, "GetPredefinedStrings"), flags, 4)
        this.vtbl.SetPredefinedValue := CallbackCreate(GetMethod(implObj, "SetPredefinedValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDisplayString)
        CallbackFree(this.vtbl.MapPropertyToPage)
        CallbackFree(this.vtbl.GetPredefinedStrings)
        CallbackFree(this.vtbl.SetPredefinedValue)
    }
}
