#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_OPACITY_MICROMAP_ARRAY_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumOmmHistogramEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<D3D12_RAYTRACING_OPACITY_MICROMAP_HISTOGRAM_ENTRY>}
     */
    pOmmHistogram {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    InputBuffer {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE}
     */
    PerOmmDescs{
        get {
            if(!this.HasProp("__PerOmmDescs"))
                this.__PerOmmDescs := D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE(this.ptr + 24)
            return this.__PerOmmDescs
        }
    }
}
