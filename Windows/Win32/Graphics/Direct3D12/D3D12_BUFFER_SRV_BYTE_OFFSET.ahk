#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BUFFER_SRV_FLAGS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_BUFFER_SRV_BYTE_OFFSET extends Win32Struct {
    static sizeof => 24

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
     * @type {D3D12_BUFFER_SRV_FLAGS}
     */
    Flags {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
