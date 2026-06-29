#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICorProfilerCallback7.ahk" { ICorProfilerCallback7 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback8 extends ICorProfilerCallback7 {
    /**
     * The interface identifier for ICorProfilerCallback8
     * @type {Guid}
     */
    static IID := Guid("{5bed9b15-c079-4d47-bfe2-215a140c07e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback8 interfaces
    */
    struct Vtbl extends ICorProfilerCallback7.Vtbl {
        DynamicMethodJITCompilationStarted  : IntPtr
        DynamicMethodJITCompilationFinished : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {BOOL} fIsSafeToBlock 
     * @param {Pointer<Integer>} pILHeader 
     * @param {Integer} cbILHeader 
     * @returns {HRESULT} 
     */
    DynamicMethodJITCompilationStarted(functionId, fIsSafeToBlock, pILHeader, cbILHeader) {
        pILHeaderMarshal := pILHeader is VarRef ? "char*" : "ptr"

        result := ComCall(92, this, "ptr", functionId, BOOL, fIsSafeToBlock, pILHeaderMarshal, pILHeader, "uint", cbILHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {HRESULT} hrStatus 
     * @param {BOOL} fIsSafeToBlock 
     * @returns {HRESULT} 
     */
    DynamicMethodJITCompilationFinished(functionId, hrStatus, fIsSafeToBlock) {
        result := ComCall(93, this, "ptr", functionId, "int", hrStatus, BOOL, fIsSafeToBlock, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerCallback8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DynamicMethodJITCompilationStarted := CallbackCreate(GetMethod(implObj, "DynamicMethodJITCompilationStarted"), flags, 5)
        this.vtbl.DynamicMethodJITCompilationFinished := CallbackCreate(GetMethod(implObj, "DynamicMethodJITCompilationFinished"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DynamicMethodJITCompilationStarted)
        CallbackFree(this.vtbl.DynamicMethodJITCompilationFinished)
    }
}
