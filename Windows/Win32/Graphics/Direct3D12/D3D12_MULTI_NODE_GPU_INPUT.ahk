#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MULTI_NODE_GPU_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumNodeInputs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE}
     */
    NodeInputs{
        get {
            if(!this.HasProp("__NodeInputs"))
                this.__NodeInputs := D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE(this.ptr + 8)
            return this.__NodeInputs
        }
    }
}
