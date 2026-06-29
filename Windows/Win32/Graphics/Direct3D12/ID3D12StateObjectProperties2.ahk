#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12StateObjectProperties1.ahk" { ID3D12StateObjectProperties1 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12StateObjectProperties2 extends ID3D12StateObjectProperties1 {
    /**
     * The interface identifier for ID3D12StateObjectProperties2
     * @type {Guid}
     */
    static IID := Guid("{d5e82917-f0f1-44cf-ae5e-ce222dd0b884}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12StateObjectProperties2 interfaces
    */
    struct Vtbl extends ID3D12StateObjectProperties1.Vtbl {
        GetGlobalRootSignatureForProgram : IntPtr
        GetGlobalRootSignatureForShader  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12StateObjectProperties2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pProgramName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetGlobalRootSignatureForProgram(pProgramName, riid) {
        pProgramName := pProgramName is String ? StrPtr(pProgramName) : pProgramName

        result := ComCall(8, this, "ptr", pProgramName, Guid.Ptr, riid, "ptr*", &ppvRootSignature := 0, "HRESULT")
        return ppvRootSignature
    }

    /**
     * 
     * @param {PWSTR} pExportName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetGlobalRootSignatureForShader(pExportName, riid) {
        pExportName := pExportName is String ? StrPtr(pExportName) : pExportName

        result := ComCall(9, this, "ptr", pExportName, Guid.Ptr, riid, "ptr*", &ppvRootSignature := 0, "HRESULT")
        return ppvRootSignature
    }

    Query(iid) {
        if (ID3D12StateObjectProperties2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGlobalRootSignatureForProgram := CallbackCreate(GetMethod(implObj, "GetGlobalRootSignatureForProgram"), flags, 4)
        this.vtbl.GetGlobalRootSignatureForShader := CallbackCreate(GetMethod(implObj, "GetGlobalRootSignatureForShader"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGlobalRootSignatureForProgram)
        CallbackFree(this.vtbl.GetGlobalRootSignatureForShader)
    }
}
