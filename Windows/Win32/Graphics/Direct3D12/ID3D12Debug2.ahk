#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_GPU_BASED_VALIDATION_FLAGS.ahk" { D3D12_GPU_BASED_VALIDATION_FLAGS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Adds configurable levels of GPU-based validation to the debug layer. (ID3D12Debug2)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug2
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Debug2 extends IUnknown {
    /**
     * The interface identifier for ID3D12Debug2
     * @type {Guid}
     */
    static IID := Guid("{93a665c4-a3b2-4e5d-b692-a26ae14e3374}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Debug2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetGPUBasedValidationFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Debug2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method configures the level of GPU-based validation that the debug device is to perform at runtime. (ID3D12Debug2.SetGPUBasedValidationFlags)
     * @remarks
     * This method overrides the default behavior of GPU-based validation so it must be called before creating the Direct3D 12 device. These settings can't be changed or cancelled after the device is created. If you want to change the behavior of GPU-based validation at a later time, the device must be destroyed and recreated with different parameters.
     * @param {D3D12_GPU_BASED_VALIDATION_FLAGS} Flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_flags">D3D12_GPU_BASED_VALIDATION_FLAGS</a></b>
     * 
     * Specifies the level of GPU-based validation to perform at runtime.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug2-setgpubasedvalidationflags
     */
    SetGPUBasedValidationFlags(Flags) {
        ComCall(3, this, D3D12_GPU_BASED_VALIDATION_FLAGS, Flags)
    }

    Query(iid) {
        if (ID3D12Debug2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetGPUBasedValidationFlags := CallbackCreate(GetMethod(implObj, "SetGPUBasedValidationFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetGPUBasedValidationFlags)
    }
}
