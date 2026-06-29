#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IActiveScriptProfilerControl4.ahk" { IActiveScriptProfilerControl4 }
#Import ".\PROFILER_HEAP_ENUM_FLAGS.ahk" { PROFILER_HEAP_ENUM_FLAGS }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IActiveScriptProfilerHeapEnum.ahk" { IActiveScriptProfilerHeapEnum }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProfilerControl5 extends IActiveScriptProfilerControl4 {
    /**
     * The interface identifier for IActiveScriptProfilerControl5
     * @type {Guid}
     */
    static IID := Guid("{1c01a2d1-8f0f-46a5-9720-0d7ed2c62f0a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProfilerControl5 interfaces
    */
    struct Vtbl extends IActiveScriptProfilerControl4.Vtbl {
        EnumHeap2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProfilerControl5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PROFILER_HEAP_ENUM_FLAGS} enumFlags 
     * @returns {IActiveScriptProfilerHeapEnum} 
     */
    EnumHeap2(enumFlags) {
        result := ComCall(10, this, PROFILER_HEAP_ENUM_FLAGS, enumFlags, "ptr*", &ppEnum := 0, "HRESULT")
        return IActiveScriptProfilerHeapEnum(ppEnum)
    }

    Query(iid) {
        if (IActiveScriptProfilerControl5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumHeap2 := CallbackCreate(GetMethod(implObj, "EnumHeap2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumHeap2)
    }
}
