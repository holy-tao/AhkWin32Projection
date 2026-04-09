#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_PRIMITIVE_TOPOLOGY_TYPE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_PRIMITIVE_TOPOLOGY_DESC extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {D3D12_PRIMITIVE_TOPOLOGY_TYPE}
     */
    PrimitiveTopology {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
