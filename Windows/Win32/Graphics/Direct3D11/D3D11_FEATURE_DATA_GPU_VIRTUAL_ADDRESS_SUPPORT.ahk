#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes feature data GPU virtual address support, including maximum address bits per resource and per process.
 * @remarks
 * 
  * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_feature">D3D11_FEATURE</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_gpu_virtual_address_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_GPU_VIRTUAL_ADDRESS_SUPPORT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The maximum GPU virtual address bits per resource.
     * @type {Integer}
     */
    MaxGPUVirtualAddressBitsPerResource {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum GPU virtual address bits per process.
     * @type {Integer}
     */
    MaxGPUVirtualAddressBitsPerProcess {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
