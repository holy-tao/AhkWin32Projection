#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ExtendedDebugPropertyInfo.ahk" { ExtendedDebugPropertyInfo }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IEnumDebugExtendedPropertyInfo extends IUnknown {
    /**
     * The interface identifier for IEnumDebugExtendedPropertyInfo
     * @type {Guid}
     */
    static IID := Guid("{51973c53-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumDebugExtendedPropertyInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next     : IntPtr
        Skip     : IntPtr
        Reset    : IntPtr
        Clone    : IntPtr
        GetCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumDebugExtendedPropertyInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ExtendedDebugPropertyInfo>} rgExtendedPropertyInfo 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgExtendedPropertyInfo, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, ExtendedDebugPropertyInfo.Ptr, rgExtendedPropertyInfo, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
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
     * @returns {IEnumDebugExtendedPropertyInfo} 
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &pedpe := 0, "HRESULT")
        return IEnumDebugExtendedPropertyInfo(pedpe)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }

    Query(iid) {
        if (IEnumDebugExtendedPropertyInfo.IID.Equals(iid)) {
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
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
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
        CallbackFree(this.vtbl.GetCount)
    }
}
