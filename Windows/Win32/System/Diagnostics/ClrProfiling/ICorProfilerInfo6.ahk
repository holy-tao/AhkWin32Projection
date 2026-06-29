#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICorProfilerMethodEnum.ahk" { ICorProfilerMethodEnum }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerInfo5.ahk" { ICorProfilerInfo5 }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo6 extends ICorProfilerInfo5 {
    /**
     * The interface identifier for ICorProfilerInfo6
     * @type {Guid}
     */
    static IID := Guid("{f30a070d-bffb-46a7-b1d8-8781ef7b698a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo6 interfaces
    */
    struct Vtbl extends ICorProfilerInfo5.Vtbl {
        EnumNgenModuleMethodsInliningThisMethod : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} inlinersModuleId 
     * @param {Pointer} inlineeModuleId 
     * @param {Integer} inlineeMethodId 
     * @param {Pointer<BOOL>} incompleteData 
     * @param {Pointer<ICorProfilerMethodEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumNgenModuleMethodsInliningThisMethod(inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum) {
        incompleteDataMarshal := incompleteData is VarRef ? "int*" : "ptr"

        result := ComCall(83, this, "ptr", inlinersModuleId, "ptr", inlineeModuleId, "uint", inlineeMethodId, incompleteDataMarshal, incompleteData, ICorProfilerMethodEnum.Ptr, ppEnum, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerInfo6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumNgenModuleMethodsInliningThisMethod := CallbackCreate(GetMethod(implObj, "EnumNgenModuleMethodsInliningThisMethod"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumNgenModuleMethodsInliningThisMethod)
    }
}
