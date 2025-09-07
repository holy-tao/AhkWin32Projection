#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the level of GPU-based validation to perform at runtime.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debug2-setgpubasedvalidationflags">ID3D12Debug2::SetGPUBasedValidationFlags</a> method to configure the amount of runtime validation that will occur.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_GPU_BASED_VALIDATION_FLAGS{

    /**
     * Default behavior; resource states, descriptors, and descriptor tables are all validated.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_FLAGS_NONE => 0

    /**
     * When set, GPU-based validation does not perform resource state validation which greatly reduces the performance cost of GPU-based validation. Descriptors and descriptor heaps are still validated.
     * @type {Integer (Int32)}
     */
    static D3D12_GPU_BASED_VALIDATION_FLAGS_DISABLE_STATE_TRACKING => 1
}
