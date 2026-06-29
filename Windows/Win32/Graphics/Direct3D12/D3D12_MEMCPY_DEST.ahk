#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the destination of a memory copy operation.
 * @remarks
 * This structure is used by a number of helper methods, refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/helper-structures-and-functions-for-d3d12">Helper Structures and Functions for D3D12</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_memcpy_dest
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_MEMCPY_DEST {
    #StructPack 8

    /**
     * A pointer to a memory block that receives the copied data.
     */
    pData : IntPtr

    /**
     * The row pitch, or width, or physical size, in bytes, of the subresource data.
     */
    RowPitch : IntPtr

    /**
     * The slice pitch, or width, or physical size, in bytes, of the subresource data.
     */
    SlicePitch : IntPtr

}
