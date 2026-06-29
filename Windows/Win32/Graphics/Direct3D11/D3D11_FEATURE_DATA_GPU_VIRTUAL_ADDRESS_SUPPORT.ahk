#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes feature data GPU virtual address support, including maximum address bits per resource and per process.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_gpu_virtual_address_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FEATURE_DATA_GPU_VIRTUAL_ADDRESS_SUPPORT {
    #StructPack 4

    /**
     * The maximum GPU virtual address bits per resource.
     */
    MaxGPUVirtualAddressBitsPerResource : UInt32

    /**
     * The maximum GPU virtual address bits per process.
     */
    MaxGPUVirtualAddressBitsPerProcess : UInt32

}
