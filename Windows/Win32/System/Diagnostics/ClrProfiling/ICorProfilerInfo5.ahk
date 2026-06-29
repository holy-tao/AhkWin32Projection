#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICorProfilerInfo4.ahk" { ICorProfilerInfo4 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo5 extends ICorProfilerInfo4 {
    /**
     * The interface identifier for ICorProfilerInfo5
     * @type {Guid}
     */
    static IID := Guid("{07602928-ce38-4b83-81e7-74adaf781214}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo5 interfaces
    */
    struct Vtbl extends ICorProfilerInfo4.Vtbl {
        GetEventMask2 : IntPtr
        SetEventMask2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwEventsLow 
     * @param {Pointer<Integer>} pdwEventsHigh 
     * @returns {HRESULT} 
     */
    GetEventMask2(pdwEventsLow, pdwEventsHigh) {
        pdwEventsLowMarshal := pdwEventsLow is VarRef ? "uint*" : "ptr"
        pdwEventsHighMarshal := pdwEventsHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(81, this, pdwEventsLowMarshal, pdwEventsLow, pdwEventsHighMarshal, pdwEventsHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEventsLow 
     * @param {Integer} dwEventsHigh 
     * @returns {HRESULT} 
     */
    SetEventMask2(dwEventsLow, dwEventsHigh) {
        result := ComCall(82, this, "uint", dwEventsLow, "uint", dwEventsHigh, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerInfo5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventMask2 := CallbackCreate(GetMethod(implObj, "GetEventMask2"), flags, 3)
        this.vtbl.SetEventMask2 := CallbackCreate(GetMethod(implObj, "SetEventMask2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventMask2)
        CallbackFree(this.vtbl.SetEventMask2)
    }
}
