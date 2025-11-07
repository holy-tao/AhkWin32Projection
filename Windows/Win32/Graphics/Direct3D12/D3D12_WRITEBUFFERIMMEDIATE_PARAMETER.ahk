#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the immediate value and destination address written using ID3D12CommandList2::WriteBufferImmediate.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_writebufferimmediate_parameter
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_WRITEBUFFERIMMEDIATE_PARAMETER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The GPU virtual address at which to write the value. The address must be aligned to a 32-bit (4-byte) boundary.
     * @type {Integer}
     */
    Dest {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The 32-bit value to write.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
