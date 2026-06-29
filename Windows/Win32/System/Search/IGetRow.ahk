#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IGetRow extends IUnknown {
    /**
     * The interface identifier for IGetRow
     * @type {Guid}
     */
    static IID := Guid("{0c733aaf-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGetRow interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRowFromHROW : IntPtr
        GetURLFromHROW : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGetRow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} hRow 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetRowFromHROW(pUnkOuter, hRow, riid) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", hRow, Guid.Ptr, riid, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @returns {PWSTR} 
     */
    GetURLFromHROW(hRow) {
        result := ComCall(4, this, "ptr", hRow, PWSTR.Ptr, &ppwszURL := 0, "HRESULT")
        return ppwszURL
    }

    Query(iid) {
        if (IGetRow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRowFromHROW := CallbackCreate(GetMethod(implObj, "GetRowFromHROW"), flags, 5)
        this.vtbl.GetURLFromHROW := CallbackCreate(GetMethod(implObj, "GetURLFromHROW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRowFromHROW)
        CallbackFree(this.vtbl.GetURLFromHROW)
    }
}
