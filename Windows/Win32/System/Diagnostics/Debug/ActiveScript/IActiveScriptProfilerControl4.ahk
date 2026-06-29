#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IActiveScriptProfilerControl3.ahk" { IActiveScriptProfilerControl3 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PROFILER_HEAP_SUMMARY.ahk" { PROFILER_HEAP_SUMMARY }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProfilerControl4 extends IActiveScriptProfilerControl3 {
    /**
     * The interface identifier for IActiveScriptProfilerControl4
     * @type {Guid}
     */
    static IID := Guid("{160f94fd-9dbc-40d4-9eac-2b71db3132f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProfilerControl4 interfaces
    */
    struct Vtbl extends IActiveScriptProfilerControl3.Vtbl {
        SummarizeHeap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProfilerControl4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<PROFILER_HEAP_SUMMARY>} heapSummary 
     * @returns {HRESULT} 
     */
    SummarizeHeap(heapSummary) {
        result := ComCall(9, this, PROFILER_HEAP_SUMMARY.Ptr, heapSummary, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptProfilerControl4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SummarizeHeap := CallbackCreate(GetMethod(implObj, "SummarizeHeap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SummarizeHeap)
    }
}
