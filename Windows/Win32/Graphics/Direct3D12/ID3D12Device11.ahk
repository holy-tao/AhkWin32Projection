#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_CPU_DESCRIPTOR_HANDLE.ahk" { D3D12_CPU_DESCRIPTOR_HANDLE }
#Import ".\ID3D12Device10.ahk" { ID3D12Device10 }
#Import ".\D3D12_SAMPLER_DESC2.ahk" { D3D12_SAMPLER_DESC2 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device11 extends ID3D12Device10 {
    /**
     * The interface identifier for ID3D12Device11
     * @type {Guid}
     */
    static IID := Guid("{5405c344-d457-444e-b4dd-2366e45aee39}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device11 interfaces
    */
    struct Vtbl extends ID3D12Device10.Vtbl {
        CreateSampler2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device11.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12_SAMPLER_DESC2>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    CreateSampler2(pDesc, DestDescriptor) {
        ComCall(79, this, D3D12_SAMPLER_DESC2.Ptr, pDesc, D3D12_CPU_DESCRIPTOR_HANDLE, DestDescriptor)
    }

    Query(iid) {
        if (ID3D12Device11.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSampler2 := CallbackCreate(GetMethod(implObj, "CreateSampler2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSampler2)
    }
}
