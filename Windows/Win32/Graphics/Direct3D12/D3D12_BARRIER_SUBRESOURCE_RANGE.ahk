#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Allows you to transition logically-adjacent ranges of subresources.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_barrier_subresource_range
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_BARRIER_SUBRESOURCE_RANGE {
    #StructPack 4

    /**
     * The index of the first mip level in the range; or a subresource index, if *NumMipLevels* is zero. If a subresource index, then you can use the value `0xffffffff` to specify all subresources.
     */
    IndexOrFirstMipLevel : UInt32

    /**
     * Number of mip levels in the range, or zero to indicate that *IndexOrFirstMipLevel* is a subresource index.
     */
    NumMipLevels : UInt32

    /**
     * Index of first array slice in the range. Ignored if *NumMipLevels* is zero.
     */
    FirstArraySlice : UInt32

    /**
     * Number of array slices in the range. Ignored if *NumMipLevels* is zero.
     */
    NumArraySlices : UInt32

    /**
     * First plane slice in the range. Ignored if *NumMipLevels* is zero.
     */
    FirstPlane : UInt32

    /**
     * Number of plane slices in the range. Ignored if *NumMipLevels* is zero.
     */
    NumPlanes : UInt32

}
