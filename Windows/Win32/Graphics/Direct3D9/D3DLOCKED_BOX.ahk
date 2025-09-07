#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a locked box (volume).
 * @remarks
 * Volumes can be visualized as being organized into slices of width x height 2D surfaces stacked up to make a width x height x depth volume. For more information, see [Volume Texture Resources (Direct3D 9)](volume-texture-resources.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dlocked-box
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DLOCKED_BOX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[**int**](../winprog/windows-data-types.md)**
     * 
     * 
     * Byte offset from the left edge of one row to the left edge of the next row.
     * @type {Integer}
     */
    RowPitch {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[**int**](../winprog/windows-data-types.md)**
     * 
     * 
     * Byte offset from the top-left of one slice to the top-left of the next deepest slice.
     * @type {Integer}
     */
    SlicePitch {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **void\***
     * 
     * 
     * Pointer to the beginning of the volume box. If a [**D3DBOX**](d3dbox.md) was provided to the LockBox call, pBits will be appropriately offset from the start of the volume.
     * @type {Pointer<Void>}
     */
    pBits {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
