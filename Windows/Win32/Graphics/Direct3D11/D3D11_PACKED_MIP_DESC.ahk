#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the tile structure of a tiled resource with mipmaps. (D3D11_PACKED_MIP_DESC)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_packed_mip_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_PACKED_MIP_DESC {
    #StructPack 4

    /**
     * Number of standard mipmaps in the tiled resource.
     */
    NumStandardMips : Int8

    /**
     * Number of packed mipmaps in the tiled resource. 
     * 
     * This number starts from the least detailed mipmap (either sharing tiles or using non standard tile layout). This number is 0 if no
     * such packing is in the resource.  For array surfaces, this value is the number of mipmaps that are packed for a given array slice where each array slice repeats the same
     * packing.
     * 
     * 
     * On Tier_2 tiled resources hardware, mipmaps that fill at least one standard shaped tile in all dimensions 
     * are not allowed to be included in the set of packed mipmaps.  On Tier_1 hardware, mipmaps that are an integer multiple of one standard shaped tile in all dimensions are not allowed to be included in the set of packed mipmaps.  Mipmaps with at least one 
     * dimension less than the standard tile shape may or may not be packed.  When a given mipmap needs to be packed, all coarser 
     * mipmaps for a given array slice are considered packed as well.
     */
    NumPackedMips : Int8

    /**
     * Number of tiles for the packed mipmaps in the tiled resource. 
     * 
     * If there is no packing, this value is meaningless and is set to 0.
     * Otherwise, it is set to the number of tiles
     * that are needed to represent the set of packed mipmaps.  
     * The pixel layout within the packed mipmaps is hardware specific. 
     * If apps define only partial mappings for the set of tiles in packed mipmaps, read and write behavior is vendor specific and undefined.
     * For arrays, this value is only the count of packed mipmaps within
     * the subresources for each array slice.
     */
    NumTilesForPackedMips : UInt32

    /**
     * Offset of the first packed tile for the resource
     * in the overall range of tiles.  If <b>NumPackedMips</b> is 0, this
     * value is meaningless and is 0.  Otherwise, it is the
     * offset of the first packed tile for the resource in the overall
     * range of tiles for the resource.  A value of 0 for 
     * <b>StartTileIndexInOverallResource</b> means the entire resource is packed.  
     * For array surfaces, this is the offset for the tiles that contain the packed 
     * mipmaps for the first array slice. Packed mipmaps for each array slice in arrayed surfaces are at this offset
     * past the beginning of the tiles for each array slice.  
     * 
     * <div class="alert"><b>Note</b>  The 
     * number of overall tiles, packed or not, for a given array slice is
     * simply the total number of tiles for the resource divided by the 
     * resource's array size, so it is easy to locate the range of tiles for 
     * any given array slice, out of which <b>StartTileIndexInOverallResource</b> identifies
     * which of those are packed.</div>
     * <div> </div>
     */
    StartTileIndexInOverallResource : UInt32

}
