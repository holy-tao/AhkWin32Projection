#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDtcToXaHelper.ahk" { IDtcToXaHelper }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcToXaHelperFactory extends IUnknown {
    /**
     * The interface identifier for IDtcToXaHelperFactory
     * @type {Guid}
     */
    static IID := Guid("{a9861610-304a-11d1-9813-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcToXaHelperFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcToXaHelperFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @param {PSTR} pszDSN 
     * @param {PSTR} pszClientDllName 
     * @param {Pointer<Guid>} pguidRm 
     * @param {Pointer<IDtcToXaHelper>} ppXaHelper 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create(pszDSN, pszClientDllName, pguidRm, ppXaHelper) {
        pszDSN := pszDSN is String ? StrPtr(pszDSN) : pszDSN
        pszClientDllName := pszClientDllName is String ? StrPtr(pszClientDllName) : pszClientDllName

        result := ComCall(3, this, "ptr", pszDSN, "ptr", pszClientDllName, Guid.Ptr, pguidRm, IDtcToXaHelper.Ptr, ppXaHelper, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcToXaHelperFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
    }
}
