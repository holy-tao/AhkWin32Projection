#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptStats extends IUnknown {
    /**
     * The interface identifier for IActiveScriptStats
     * @type {Guid}
     */
    static IID := Guid("{b8da6310-e19b-11d0-933c-00a0c90dcaa9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptStats interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStat    : IntPtr
        GetStatEx  : IntPtr
        ResetStats : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptStats.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} stid 
     * @param {Pointer<Integer>} pluHi 
     * @param {Pointer<Integer>} pluLo 
     * @returns {HRESULT} 
     */
    GetStat(stid, pluHi, pluLo) {
        pluHiMarshal := pluHi is VarRef ? "uint*" : "ptr"
        pluLoMarshal := pluLo is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", stid, pluHiMarshal, pluHi, pluLoMarshal, pluLo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Integer>} pluHi 
     * @param {Pointer<Integer>} pluLo 
     * @returns {HRESULT} 
     */
    GetStatEx(guid, pluHi, pluLo) {
        pluHiMarshal := pluHi is VarRef ? "uint*" : "ptr"
        pluLoMarshal := pluLo is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, Guid.Ptr, guid, pluHiMarshal, pluHi, pluLoMarshal, pluLo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetStats() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptStats.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStat := CallbackCreate(GetMethod(implObj, "GetStat"), flags, 4)
        this.vtbl.GetStatEx := CallbackCreate(GetMethod(implObj, "GetStatEx"), flags, 4)
        this.vtbl.ResetStats := CallbackCreate(GetMethod(implObj, "ResetStats"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStat)
        CallbackFree(this.vtbl.GetStatEx)
        CallbackFree(this.vtbl.ResetStats)
    }
}
