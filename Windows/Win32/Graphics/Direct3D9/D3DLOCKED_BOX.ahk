#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a locked box (volume).
 * @remarks
 * Volumes can be visualized as being organized into slices of width x height 2D surfaces stacked up to make a width x height x depth volume. For more information, see [Volume Texture Resources (Direct3D 9)](volume-texture-resources.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dlocked-box
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DLOCKED_BOX {
    #StructPack 8

    /**
     * Type: **[**int**](../winprog/windows-data-types.md)**
     * 
     * 
     * Byte offset from the left edge of one row to the left edge of the next row.
     */
    RowPitch : Int32

    /**
     * Type: **[**int**](../winprog/windows-data-types.md)**
     * 
     * 
     * Byte offset from the top-left of one slice to the top-left of the next deepest slice.
     */
    SlicePitch : Int32

    /**
     * Type: **void\***
     * 
     * 
     * Pointer to the beginning of the volume box. If a [**D3DBOX**](d3dbox.md) was provided to the LockBox call, pBits will be appropriately offset from the start of the volume.
     */
    pBits : IntPtr

}
