#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_SERIALIZED_BLOCK_TYPE.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_RAYTRACING_SERIALIZED_BLOCK extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {D3D12_SERIALIZED_BLOCK_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumBlockPointersAfterHeader {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
