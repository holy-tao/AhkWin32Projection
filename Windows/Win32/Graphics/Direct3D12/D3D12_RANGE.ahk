#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a memory range.
 * @remarks
 * <b>End</b> is one-past-the-end.
 *         When <b>Begin</b> equals <b>End</b>, the range is empty.
 *         The size of the range is (<b>End</b> - <b>Begin</b>).
 *       
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-map">Map</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12resource-unmap">Unmap</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_range
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RANGE {
    #StructPack 8

    /**
     * The offset, in bytes, denoting the beginning of a memory range.
     */
    Begin : IntPtr

    /**
     * The offset, in bytes, denoting the end of a memory range.
     *             <b>End</b> is one-past-the-end.
     */
    End : IntPtr

}
