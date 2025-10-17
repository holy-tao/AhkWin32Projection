#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_NODE_GPU_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    EntrypointIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumRecords {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE}
     */
    Records{
        get {
            if(!this.HasProp("__Records"))
                this.__Records := D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE(8, this)
            return this.__Records
        }
    }
}
