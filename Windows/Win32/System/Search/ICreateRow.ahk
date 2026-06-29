#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBIMPLICITSESSION.ahk" { DBIMPLICITSESSION }
#Import "..\Com\IAuthenticate.ahk" { IAuthenticate }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ICreateRow extends IUnknown {
    /**
     * The interface identifier for ICreateRow
     * @type {Guid}
     */
    static IID := Guid("{0c733ab2-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateRow interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateRow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateRow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwBindURLFlags 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<Guid>} riid 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<DBIMPLICITSESSION>} pImplSession 
     * @param {Pointer<Integer>} pdwBindStatus 
     * @param {Pointer<PWSTR>} ppwszNewURL 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    CreateRow(pUnkOuter, pwszURL, dwBindURLFlags, rguid, riid, pAuthenticate, pImplSession, pdwBindStatus, ppwszNewURL, ppUnk) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pdwBindStatusMarshal := pdwBindStatus is VarRef ? "uint*" : "ptr"
        ppwszNewURLMarshal := ppwszNewURL is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", pwszURL, "uint", dwBindURLFlags, Guid.Ptr, rguid, Guid.Ptr, riid, "ptr", pAuthenticate, DBIMPLICITSESSION.Ptr, pImplSession, pdwBindStatusMarshal, pdwBindStatus, ppwszNewURLMarshal, ppwszNewURL, IUnknown.Ptr, ppUnk, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICreateRow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateRow := CallbackCreate(GetMethod(implObj, "CreateRow"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateRow)
    }
}
