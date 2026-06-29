#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerCallback5.ahk" { ICorProfilerCallback5 }
#Import ".\ICorProfilerAssemblyReferenceProvider.ahk" { ICorProfilerAssemblyReferenceProvider }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback6 extends ICorProfilerCallback5 {
    /**
     * The interface identifier for ICorProfilerCallback6
     * @type {Guid}
     */
    static IID := Guid("{fc13df4b-4448-4f4f-950c-ba8d19d00c36}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback6 interfaces
    */
    struct Vtbl extends ICorProfilerCallback5.Vtbl {
        GetAssemblyReferences : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} wszAssemblyPath 
     * @param {ICorProfilerAssemblyReferenceProvider} pAsmRefProvider 
     * @returns {HRESULT} 
     */
    GetAssemblyReferences(wszAssemblyPath, pAsmRefProvider) {
        wszAssemblyPath := wszAssemblyPath is String ? StrPtr(wszAssemblyPath) : wszAssemblyPath

        result := ComCall(90, this, "ptr", wszAssemblyPath, "ptr", pAsmRefProvider, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerCallback6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAssemblyReferences := CallbackCreate(GetMethod(implObj, "GetAssemblyReferences"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAssemblyReferences)
    }
}
