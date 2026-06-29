#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMsmDependency.ahk" { IMsmDependency }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IEnumMsmDependency extends IUnknown {
    /**
     * The interface identifier for IEnumMsmDependency
     * @type {Guid}
     */
    static IID := Guid("{0adda82c-2c26-11d2-ad65-00a0c9af11a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumMsmDependency interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumMsmDependency.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cFetch 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {IMsmDependency} 
     */
    Next(cFetch, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFetch, "ptr*", &rgmsmDependencies := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return IMsmDependency(rgmsmDependencies)
    }

    /**
     * 
     * @param {Integer} cSkip 
     * @returns {HRESULT} 
     */
    Skip(cSkip) {
        result := ComCall(4, this, "uint", cSkip, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumMsmDependency} 
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &pemsmDependencies := 0, "HRESULT")
        return IEnumMsmDependency(pemsmDependencies)
    }

    Query(iid) {
        if (IEnumMsmDependency.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
