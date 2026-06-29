#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\GAMESTATS_OPEN_TYPE.ahk" { GAMESTATS_OPEN_TYPE }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\GAMESTATS_OPEN_RESULT.ahk" { GAMESTATS_OPEN_RESULT }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGameStatistics.ahk" { IGameStatistics }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Gaming
 */
export default struct IGameStatisticsMgr extends IUnknown {
    /**
     * The interface identifier for IGameStatisticsMgr
     * @type {Guid}
     */
    static IID := Guid("{aff3ea11-e70e-407d-95dd-35e612c41ce2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameStatisticsMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGameStatistics    : IntPtr
        RemoveGameStatistics : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameStatisticsMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} GDFBinaryPath 
     * @param {GAMESTATS_OPEN_TYPE} openType 
     * @param {Pointer<GAMESTATS_OPEN_RESULT>} pOpenResult 
     * @param {Pointer<IGameStatistics>} ppiStats 
     * @returns {HRESULT} 
     */
    GetGameStatistics(GDFBinaryPath, openType, pOpenResult, ppiStats) {
        GDFBinaryPath := GDFBinaryPath is String ? StrPtr(GDFBinaryPath) : GDFBinaryPath

        pOpenResultMarshal := pOpenResult is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", GDFBinaryPath, GAMESTATS_OPEN_TYPE, openType, pOpenResultMarshal, pOpenResult, IGameStatistics.Ptr, ppiStats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} GDFBinaryPath 
     * @returns {HRESULT} 
     */
    RemoveGameStatistics(GDFBinaryPath) {
        GDFBinaryPath := GDFBinaryPath is String ? StrPtr(GDFBinaryPath) : GDFBinaryPath

        result := ComCall(4, this, "ptr", GDFBinaryPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGameStatisticsMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGameStatistics := CallbackCreate(GetMethod(implObj, "GetGameStatistics"), flags, 5)
        this.vtbl.RemoveGameStatistics := CallbackCreate(GetMethod(implObj, "RemoveGameStatistics"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGameStatistics)
        CallbackFree(this.vtbl.RemoveGameStatistics)
    }
}
