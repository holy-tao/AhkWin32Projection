#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Debug.ahk" { ID3D12Debug }
#Import ".\D3D12_GPU_BASED_VALIDATION_FLAGS.ahk" { D3D12_GPU_BASED_VALIDATION_FLAGS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Adds configurable levels of GPU-based validation to the debug layer. (ID3D12Debug3)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug3
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Debug3 extends ID3D12Debug {
    /**
     * The interface identifier for ID3D12Debug3
     * @type {Guid}
     */
    static IID := Guid("{5cf4e58f-f671-4ff1-a542-3686e3d153d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Debug3 interfaces
    */
    struct Vtbl extends ID3D12Debug.Vtbl {
        SetEnableGPUBasedValidation                 : IntPtr
        SetEnableSynchronizedCommandQueueValidation : IntPtr
        SetGPUBasedValidationFlags                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Debug3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method enables or disables GPU-based validation (GBV) before creating a device with the debug layer enabled.
     * @remarks
     * GPU-based validation can be enabled/disabled only prior to creating a device. By default, GPU-based validation is disabled. To disable GPU-based validation after initially enabling it, the device must be fully released and recreated.
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/win32/direct3d12/using-d3d12-debug-layer-gpu-based-validation">Using D3D12 Debug Layer GPU-based validation</a>.
     * @param {BOOL} Enable Type: <b>BOOL</b>
     * 
     * TRUE to enable GPU-based validation, otherwise FALSE.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug3-setenablegpubasedvalidation
     */
    SetEnableGPUBasedValidation(Enable) {
        ComCall(4, this, BOOL, Enable)
    }

    /**
     * Enables or disables dependent command queue synchronization when using a Direct3D 12 device with the debug layer enabled.
     * @remarks
     * Dependent Command Queue Synchronization is a D3D12 Debug Layer feature that gives the debug layer the ability to track resource states more accurately when enabled. Dependent Command Queue Synchronization is enabled by default. 
     * 
     * When Dependent Command Queue Synchronization is enabled, the debug layer holds back actual submission of GPU work until all outstanding fence <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-wait">Wait</a> conditions are met. This gives the debug layer the ability to make reasonable assumptions about GPU state (such as resource states) on the CPU-timeline when multiple command queues are potentially doing concurrent work.
     * 
     * With Dependent Command Queue Synchronization disabled, all resource states tracked by the debug layer are cleared each time <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-signal">ID3D12CommandQueue::Signal</a> is called. This results in significantly less useful resource state validation.
     * 
     * Disabling Dependent Command Queue Synchronization may reduce some debug layer performance overhead when using multiple command queues. However, it is suggested to leave it enabled unless this overhead is problematic. Note that applications that use only a single command queue will see no performance changes with Dependent Command Queue Synchronization disabled.
     * @param {BOOL} Enable Type: <b>BOOL</b>
     * 
     * TRUE to enable Dependent Command Queue Synchronization, otherwise FALSE.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug3-setenablesynchronizedcommandqueuevalidation
     */
    SetEnableSynchronizedCommandQueueValidation(Enable) {
        ComCall(5, this, BOOL, Enable)
    }

    /**
     * This method configures the level of GPU-based validation that the debug device is to perform at runtime. (ID3D12Debug3.SetGPUBasedValidationFlags)
     * @remarks
     * This method overrides the default behavior of GPU-based validation so it must be called before creating the D3D12 Device. These settings can't be changed or cancelled after the device is created. If you want to change the behavior of GPU-based validation at a later time, the device must be destroyed and recreated with different parameters.
     * @param {D3D12_GPU_BASED_VALIDATION_FLAGS} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_flags">D3D12_GPU_BASED_VALIDATION_FLAGS</a></b>
     * 
     * Specifies the level of GPU-based validation to perform at runtime.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug3-setgpubasedvalidationflags
     */
    SetGPUBasedValidationFlags(Flags) {
        ComCall(6, this, D3D12_GPU_BASED_VALIDATION_FLAGS, Flags)
    }

    Query(iid) {
        if (ID3D12Debug3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetEnableGPUBasedValidation := CallbackCreate(GetMethod(implObj, "SetEnableGPUBasedValidation"), flags, 2)
        this.vtbl.SetEnableSynchronizedCommandQueueValidation := CallbackCreate(GetMethod(implObj, "SetEnableSynchronizedCommandQueueValidation"), flags, 2)
        this.vtbl.SetGPUBasedValidationFlags := CallbackCreate(GetMethod(implObj, "SetGPUBasedValidationFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetEnableGPUBasedValidation)
        CallbackFree(this.vtbl.SetEnableSynchronizedCommandQueueValidation)
        CallbackFree(this.vtbl.SetGPUBasedValidationFlags)
    }
}
