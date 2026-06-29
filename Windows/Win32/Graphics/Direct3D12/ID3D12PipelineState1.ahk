#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12PipelineState.ahk" { ID3D12PipelineState }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12PipelineState1 extends ID3D12PipelineState {
    /**
     * The interface identifier for ID3D12PipelineState1
     * @type {Guid}
     */
    static IID := Guid("{5646804c-9638-48f7-9182-b3ee5a6b60fb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12PipelineState1 interfaces
    */
    struct Vtbl extends ID3D12PipelineState.Vtbl {
        GetRootSignature : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12PipelineState1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetRootSignature(riid) {
        result := ComCall(9, this, Guid.Ptr, riid, "ptr*", &ppvRootSignature := 0, "HRESULT")
        return ppvRootSignature
    }

    Query(iid) {
        if (ID3D12PipelineState1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRootSignature := CallbackCreate(GetMethod(implObj, "GetRootSignature"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRootSignature)
    }
}
