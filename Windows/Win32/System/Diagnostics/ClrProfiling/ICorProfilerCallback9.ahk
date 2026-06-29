#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICorProfilerCallback8.ahk" { ICorProfilerCallback8 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback9 extends ICorProfilerCallback8 {
    /**
     * The interface identifier for ICorProfilerCallback9
     * @type {Guid}
     */
    static IID := Guid("{27583ec3-c8f5-482f-8052-194b8ce4705a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback9 interfaces
    */
    struct Vtbl extends ICorProfilerCallback8.Vtbl {
        DynamicMethodUnloaded : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    DynamicMethodUnloaded(functionId) {
        result := ComCall(94, this, "ptr", functionId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerCallback9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DynamicMethodUnloaded := CallbackCreate(GetMethod(implObj, "DynamicMethodUnloaded"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DynamicMethodUnloaded)
    }
}
