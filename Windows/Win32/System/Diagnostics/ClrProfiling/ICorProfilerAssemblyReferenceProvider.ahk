#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\COR_PRF_ASSEMBLY_REFERENCE_INFO.ahk" { COR_PRF_ASSEMBLY_REFERENCE_INFO }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerAssemblyReferenceProvider extends IUnknown {
    /**
     * The interface identifier for ICorProfilerAssemblyReferenceProvider
     * @type {Guid}
     */
    static IID := Guid("{66a78c24-2eef-4f65-b45f-dd1d8038bf3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerAssemblyReferenceProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddAssemblyReference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerAssemblyReferenceProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<COR_PRF_ASSEMBLY_REFERENCE_INFO>} pAssemblyRefInfo 
     * @returns {HRESULT} 
     */
    AddAssemblyReference(pAssemblyRefInfo) {
        result := ComCall(3, this, COR_PRF_ASSEMBLY_REFERENCE_INFO.Ptr, pAssemblyRefInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerAssemblyReferenceProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddAssemblyReference := CallbackCreate(GetMethod(implObj, "AddAssemblyReference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddAssemblyReference)
    }
}
