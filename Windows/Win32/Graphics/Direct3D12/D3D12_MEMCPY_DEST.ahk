#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the destination of a memory copy operation.
 * @remarks
 * 
  * This structure is used by a number of helper methods, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/helper-structures-and-functions-for-d3d12">Helper Structures and Functions for D3D12</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_memcpy_dest
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MEMCPY_DEST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to a memory block that receives the copied data.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The row pitch, or width, or physical size, in bytes, of the subresource data.
     * @type {Pointer}
     */
    RowPitch {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The slice pitch, or width, or physical size, in bytes, of the subresource data.
     * @type {Pointer}
     */
    SlicePitch {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
