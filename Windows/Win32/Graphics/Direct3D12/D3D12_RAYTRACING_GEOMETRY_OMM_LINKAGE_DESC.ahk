#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_GEOMETRY_OMM_LINKAGE_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE}
     */
    OpacityMicromapIndexBuffer{
        get {
            if(!this.HasProp("__OpacityMicromapIndexBuffer"))
                this.__OpacityMicromapIndexBuffer := D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE(this.ptr + 0)
            return this.__OpacityMicromapIndexBuffer
        }
    }

    /**
     * @type {Integer}
     */
    OpacityMicromapIndexFormat {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    OpacityMicromapBaseLocation {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    OpacityMicromapArray {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
