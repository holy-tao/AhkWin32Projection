#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerCallback6.ahk" { ICorProfilerCallback6 }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback7 extends ICorProfilerCallback6 {
    /**
     * The interface identifier for ICorProfilerCallback7
     * @type {Guid}
     */
    static IID := Guid("{f76a2dba-1d52-4539-866c-2aa518f9efc3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback7 interfaces
    */
    struct Vtbl extends ICorProfilerCallback6.Vtbl {
        ModuleInMemorySymbolsUpdated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @returns {HRESULT} 
     */
    ModuleInMemorySymbolsUpdated(moduleId) {
        result := ComCall(91, this, "ptr", moduleId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerCallback7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ModuleInMemorySymbolsUpdated := CallbackCreate(GetMethod(implObj, "ModuleInMemorySymbolsUpdated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ModuleInMemorySymbolsUpdated)
    }
}
