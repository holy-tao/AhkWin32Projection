#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Details the adapter's GPU virtual address space limitations, including maximum address bits per resource and per process.
 * @remarks
 * 
  * See the enumeration constant D3D12_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a> enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_gpu_virtual_address_support
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_GPU_VIRTUAL_ADDRESS_SUPPORT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The maximum GPU virtual address bits per resource.
     * 
     * Some adapters have significantly less bits available per resource than per process, while other adapters have significantly greater bits available per resource than per process. The latter scenario tends to happen in less common scenarios, like when running a 32-bit process on certain UMA adapters.
     * When per resource capabilities are greater than per process, the greater per resource capabilities can only be leveraged by reserved resources or NULL mapped pages.
     * @type {Integer}
     */
    MaxGPUVirtualAddressBitsPerResource {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum GPU virtual address bits per process.
     * 
     * When this value is nearly equal to the available residency budget, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-evict">Evict</a> will not be a feasible option to manage residency. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-makeresident">MakeResident</a> for more details.
     * @type {Integer}
     */
    MaxGPUVirtualAddressBitsPerProcess {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
