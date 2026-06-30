#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BUFFER_UAV_FLAGS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_BUFFER_UAV_BYTE_OFFSET extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    StructureByteStride {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    CounterOffsetInBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {D3D12_BUFFER_UAV_FLAGS}
     */
    Flags {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
