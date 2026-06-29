#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataFilter.ahk" { IDataFilter }
#Import "..\IUnknown.ahk" { IUnknown }
#Import ".\DATAINFO.ahk" { DATAINFO }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IEncodingFilterFactory extends IUnknown {
    /**
     * The interface identifier for IEncodingFilterFactory
     * @type {Guid}
     */
    static IID := Guid("{70bdde00-c18e-11d0-a9ce-006097942311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEncodingFilterFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindBestFilter   : IntPtr
        GetDefaultFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEncodingFilterFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzCodeIn 
     * @param {PWSTR} pwzCodeOut 
     * @param {DATAINFO} info 
     * @returns {IDataFilter} 
     */
    FindBestFilter(pwzCodeIn, pwzCodeOut, info) {
        pwzCodeIn := pwzCodeIn is String ? StrPtr(pwzCodeIn) : pwzCodeIn
        pwzCodeOut := pwzCodeOut is String ? StrPtr(pwzCodeOut) : pwzCodeOut

        result := ComCall(3, this, "ptr", pwzCodeIn, "ptr", pwzCodeOut, DATAINFO, info, "ptr*", &ppDF := 0, "HRESULT")
        return IDataFilter(ppDF)
    }

    /**
     * 
     * @param {PWSTR} pwzCodeIn 
     * @param {PWSTR} pwzCodeOut 
     * @returns {IDataFilter} 
     */
    GetDefaultFilter(pwzCodeIn, pwzCodeOut) {
        pwzCodeIn := pwzCodeIn is String ? StrPtr(pwzCodeIn) : pwzCodeIn
        pwzCodeOut := pwzCodeOut is String ? StrPtr(pwzCodeOut) : pwzCodeOut

        result := ComCall(4, this, "ptr", pwzCodeIn, "ptr", pwzCodeOut, "ptr*", &ppDF := 0, "HRESULT")
        return IDataFilter(ppDF)
    }

    Query(iid) {
        if (IEncodingFilterFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindBestFilter := CallbackCreate(GetMethod(implObj, "FindBestFilter"), flags, 5)
        this.vtbl.GetDefaultFilter := CallbackCreate(GetMethod(implObj, "GetDefaultFilter"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindBestFilter)
        CallbackFree(this.vtbl.GetDefaultFilter)
    }
}
