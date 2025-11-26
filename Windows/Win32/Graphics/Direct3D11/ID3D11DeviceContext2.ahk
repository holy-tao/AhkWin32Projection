#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext1.ahk

/**
 * The device context interface represents a device context; it is used to render commands. ID3D11DeviceContext2 adds new methods to those in ID3D11DeviceContext1.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nn-d3d11_2-id3d11devicecontext2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceContext2 extends ID3D11DeviceContext1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11DeviceContext2
     * @type {Guid}
     */
    static IID => Guid("{420d5b32-b90c-4da4-bef0-359f6a24a83a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 134

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateTileMappings", "CopyTileMappings", "CopyTiles", "UpdateTiles", "ResizeTilePool", "TiledResourceBarrier", "IsAnnotationEnabled", "SetMarkerInt", "BeginEventInt", "EndEvent"]

    /**
     * Updates mappings of tile locations in tiled resources to memory locations in a tile pool.
     * @param {ID3D11Resource} pTiledResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the tiled resource.
     * @param {Integer} NumTiledResourceRegions Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of tiled resource regions.
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pTiledResourceRegionStartCoordinates Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a> structures that describe the starting coordinates of the tiled resource regions. The <i>NumTiledResourceRegions</i> parameter specifies the number of <b>D3D11_TILED_RESOURCE_COORDINATE</b> structures in the array.
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pTiledResourceRegionSizes Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_region_size">D3D11_TILE_REGION_SIZE</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_region_size">D3D11_TILE_REGION_SIZE</a> structures that describe the sizes of the tiled resource regions. The <i>NumTiledResourceRegions</i> parameter specifies the number of <b>D3D11_TILE_REGION_SIZE</b> structures in the array.
     * @param {ID3D11Buffer} pTilePool Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * A pointer to the tile pool.
     * @param {Integer} NumRanges Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of tile-pool ranges.
     * @param {Pointer<Integer>} pRangeFlags Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ne-d3d11_2-d3d11_tile_range_flag">D3D11_TILE_RANGE_FLAG</a> values that describe each tile-pool range. The <i>NumRanges</i> parameter specifies the number of values in the array.
     * @param {Pointer<Integer>} pTilePoolStartOffsets Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array of offsets into the tile pool. These are 0-based tile offsets, counting in tiles (not bytes).
     * @param {Pointer<Integer>} pRangeTileCounts Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An array of tiles. 
     * 
     * An array of values that specify the number of tiles in each tile-pool range. The <i>NumRanges</i> parameter specifies the number of values in the array.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ne-d3d11_2-d3d11_tile_mapping_flag">D3D11_TILE_MAPPING_FLAGS</a> values that are combined by using a bitwise OR operation.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the following:
     * 
     * <ul>
     * <li>Returns <b>E_INVALIDARG</b> if various conditions such as invalid flags result in the call being dropped.The debug layer will emit an error.
     * 
     * </li>
     * <li>Returns <b>E_OUTOFMEMORY</b> if the call results in the driver having to allocate space for new page table mappings but running out of memory.If out of memory occurs when this is called in a commandlist and the commandlist is being executed, the device will be removed. Apps can avoid this situation by only doing update calls that change existing mappings from tiled resources within commandlists (so drivers will not have to allocate page table memory, only change the mapping).
     * 
     * </li>
     * <li>Returns <b>DXGI_ERROR_DEVICE_REMOVED</b> if the video card has been physically removed from the system, or a driver upgrade for the video card has occurred.
     *             </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-updatetilemappings
     */
    UpdateTileMappings(pTiledResource, NumTiledResourceRegions, pTiledResourceRegionStartCoordinates, pTiledResourceRegionSizes, pTilePool, NumRanges, pRangeFlags, pTilePoolStartOffsets, pRangeTileCounts, Flags) {
        pRangeFlagsMarshal := pRangeFlags is VarRef ? "uint*" : "ptr"
        pTilePoolStartOffsetsMarshal := pTilePoolStartOffsets is VarRef ? "uint*" : "ptr"
        pRangeTileCountsMarshal := pRangeTileCounts is VarRef ? "uint*" : "ptr"

        result := ComCall(134, this, "ptr", pTiledResource, "uint", NumTiledResourceRegions, "ptr", pTiledResourceRegionStartCoordinates, "ptr", pTiledResourceRegionSizes, "ptr", pTilePool, "uint", NumRanges, pRangeFlagsMarshal, pRangeFlags, pTilePoolStartOffsetsMarshal, pTilePoolStartOffsets, pRangeTileCountsMarshal, pRangeTileCounts, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Copies mappings from a source tiled resource to a destination tiled resource.
     * @param {ID3D11Resource} pDestTiledResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the destination tiled resource.
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pDestRegionStartCoordinate Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a> structure that describes the starting coordinates of the destination tiled resource.
     * @param {ID3D11Resource} pSourceTiledResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the source tiled resource.
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pSourceRegionStartCoordinate Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a> structure that describes the starting coordinates of the source tiled resource.
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pTileRegionSize Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_region_size">D3D11_TILE_REGION_SIZE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_region_size">D3D11_TILE_REGION_SIZE</a> structure that describes the size of the tiled region.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ne-d3d11_2-d3d11_tile_mapping_flag">D3D11_TILE_MAPPING_FLAGS</a> values that are combined by using a bitwise OR operation. The only valid value is <b>D3D11_TILE_MAPPING_NO_OVERWRITE</b>, which indicates that previously submitted commands to the device that may still be executing do not reference any of the tile region being updated. The device can then avoid having to flush previously submitted work to perform the tile mapping update.  If the app violates this promise by updating tile mappings for locations in tiled resources that are still being referenced by outstanding commands, undefined rendering behavior results, including the potential for significant slowdowns on some architectures.  This is like the "no overwrite" concept that exists elsewhere in the Direct3D API, except applied to the tile mapping data structure itself (which in hardware is a page table). The absence of the <b>D3D11_TILE_MAPPING_NO_OVERWRITE</b> value requires that tile mapping updates that <b>CopyTileMappings</b> specifies must be completed before any subsequent Direct3D command can proceed.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the following:
     *          
     * 
     * <ul>
     * <li>Returns <b>E_INVALIDARG</b> if various conditions such as invalid flags or passing in non Tiled Resources result in the call being dropped.
     *              The dest and the source regions must each entirely fit in their resource or behavior is undefined (debug layer will emit an error).
     *              
     * 
     * </li>
     * <li>Returns <b>E_OUTOFMEMORY</b> if the call results in the driver having to allocate space for new page table mappings but running out of memory.
     *              If out of memory occurs when this is called in a commandlist and the commandlist is being executed, the device will be removed. Applications can avoid this situation by only doing update calls that change existing mappings from Tiled Resources within commandlists (so drivers will not have to allocate page table memory, only change the mapping).
     *              
     * 
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-copytilemappings
     */
    CopyTileMappings(pDestTiledResource, pDestRegionStartCoordinate, pSourceTiledResource, pSourceRegionStartCoordinate, pTileRegionSize, Flags) {
        result := ComCall(135, this, "ptr", pDestTiledResource, "ptr", pDestRegionStartCoordinate, "ptr", pSourceTiledResource, "ptr", pSourceRegionStartCoordinate, "ptr", pTileRegionSize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Copies tiles from buffer to tiled resource or vice versa.
     * @remarks
     * 
     * <b>CopyTiles</b> drops write operations to unmapped areas and handles read operations from unmapped areas (except on <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_tiled_resources_tier">Tier_1</a> tiled resources, where reading and writing unmapped areas is invalid).
     *       
     * 
     * If a copy operation involves writing to the same memory location multiple times because multiple locations in the destination resource are mapped to the same tile memory, the resulting write operations to multi-mapped tiles are non-deterministic and non-repeatable; that is, accesses to the tile memory happen in whatever order the hardware happens to execute the copy operation.
     * 
     * The tiles involved in the copy operation can't include tiles that contain packed mipmaps or results of the copy operation are undefined. To transfer data to and from mipmaps that the hardware packs into the one-or-more tiles that constitute the packed mips, you must use the standard (that is, non-tile specific) copy and update APIs (like <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-copysubresourceregion1">ID3D11DeviceContext1::CopySubresourceRegion1</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-updatesubresource1">ID3D11DeviceContext1::UpdateSubresource1</a>) or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-generatemips">ID3D11DeviceContext::GenerateMips</a> for the whole mipmap chain.
     *       
     * 
     * The memory layout of the tiles in the non-tiled buffer resource side of the copy operation is linear in memory within 64 KB tiles, which the hardware and driver swizzle and deswizzle per tile as appropriate when they transfer to and from a tiled resource. For multisample antialiasing (MSAA) surfaces, the hardware and driver traverse each pixel's samples in sample-index order before they move to the next pixel. For tiles that are partially filled on the right side (for a surface that has a width not a multiple of tile width in pixels), the pitch and stride to move down a row is the full size in bytes of the number pixels that would fit across the tile if the tile was full. So, there can be a gap between each row of pixels in memory. Mipmaps that are smaller than a tile are not packed together in the linear layout, which might seem to be a waste of memory space, but as mentioned you can't use <b>CopyTiles</b> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-updatetiles">ID3D11DeviceContext2::UpdateTiles</a> to copy to mipmaps that the hardware packs together. You can just use generic copy and update APIs (like <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-copysubresourceregion1">ID3D11DeviceContext1::CopySubresourceRegion1</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-updatesubresource1">ID3D11DeviceContext1::UpdateSubresource1</a>) to copy small mipmaps individually. Although in the case of a generic copy API (like <b>ID3D11DeviceContext1::CopySubresourceRegion1</b>), the linear memory must be the same dimension as the tiled resource; <b>ID3D11DeviceContext1::CopySubresourceRegion1</b> can't copy from a buffer resource to a Texture2D for instance.
     *       
     * 
     * For more info about tiled resources, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/tiled-resources">Tiled resources</a>.
     * 
     * 
     * @param {ID3D11Resource} pTiledResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to a tiled resource.
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pTileRegionStartCoordinate Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a> structure that describes the starting coordinates of the tiled resource.
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pTileRegionSize Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_region_size">D3D11_TILE_REGION_SIZE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_region_size">D3D11_TILE_REGION_SIZE</a> structure that describes the size of the tiled region.
     * @param {ID3D11Buffer} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> that represents a default, dynamic, or staging buffer.
     * @param {Integer} BufferStartOffsetInBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The offset in bytes into the buffer at <i>pBuffer</i> to start the operation.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ne-d3d11_2-d3d11_tile_copy_flag">D3D11_TILE_COPY_FLAG</a>-typed values that are combined by using a bitwise OR operation and that identifies how to copy tiles.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-copytiles
     */
    CopyTiles(pTiledResource, pTileRegionStartCoordinate, pTileRegionSize, pBuffer, BufferStartOffsetInBytes, Flags) {
        ComCall(136, this, "ptr", pTiledResource, "ptr", pTileRegionStartCoordinate, "ptr", pTileRegionSize, "ptr", pBuffer, "uint", BufferStartOffsetInBytes, "uint", Flags)
    }

    /**
     * Updates tiles by copying from app memory to the tiled resource.
     * @remarks
     * 
     * <b>UpdateTiles</b> drops write operations to unmapped areas (except on <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_tiled_resources_tier">Tier_1</a> tiled resources, where writing to unmapped areas is invalid).  
     * 
     * If a copy operation involves writing to the same memory location multiple times because multiple locations in the destination resource are mapped to the same tile memory, the resulting write operations to multi-mapped tiles are non-deterministic and non-repeatable; that is, accesses to the tile memory happen in whatever order the hardware happens to execute the copy operation.
     * 
     * The tiles involved in the copy operation can't include tiles that contain packed mipmaps or results of the copy operation are undefined. To transfer data to and from mipmaps that the hardware packs into one tile, you must use the standard (that is, non-tile specific) copy and update APIs (like <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-copysubresourceregion1">ID3D11DeviceContext1::CopySubresourceRegion1</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-updatesubresource1">ID3D11DeviceContext1::UpdateSubresource1</a>) or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-generatemips">ID3D11DeviceContext::GenerateMips</a> for the whole mipmap chain.
     * 
     * The memory layout of the data on the source side of the copy operation is linear in memory within 64 KB tiles, which the hardware and driver swizzle and deswizzle per tile as appropriate when they transfer to and from a tiled resource. For multisample antialiasing (MSAA) surfaces, the hardware and driver traverse each pixel's samples in sample-index order before they move to the next pixel. For tiles that are partially filled on the right side (for a surface that has a width not a multiple of tile width in pixels), the pitch and stride to move down a row is the full size in bytes of the number pixels that would fit across the tile if the tile was full. So, there can be a gap between each row of pixels in memory. Mipmaps that are smaller than a tile are not packed together in the linear layout, which might seem to be a waste of memory space, but as mentioned you can't use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nf-d3d11_2-id3d11devicecontext2-copytiles">ID3D11DeviceContext2::CopyTiles</a> or <b>UpdateTiles</b> to copy to mipmaps that the hardware packs together. You can just use generic copy and update APIs (like <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-copysubresourceregion1">ID3D11DeviceContext1::CopySubresourceRegion1</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-updatesubresource1">ID3D11DeviceContext1::UpdateSubresource1</a>) to copy small mipmaps individually. Although in the case of a generic copy API (like <b>ID3D11DeviceContext1::CopySubresourceRegion1</b>), the linear memory must be the same dimension as the tiled resource; <b>ID3D11DeviceContext1::CopySubresourceRegion1</b> can't copy from a buffer resource to a Texture2D for instance.
     * 
     * For more info about tiled resources, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/tiled-resources">Tiled resources</a>.
     * 
     * 
     * @param {ID3D11Resource} pDestTiledResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to a tiled resource to update.
     * @param {Pointer<D3D11_TILED_RESOURCE_COORDINATE>} pDestTileRegionStartCoordinate Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate">D3D11_TILED_RESOURCE_COORDINATE</a> structure that describes the starting coordinates of the tiled resource.
     * @param {Pointer<D3D11_TILE_REGION_SIZE>} pDestTileRegionSize Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_region_size">D3D11_TILE_REGION_SIZE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_region_size">D3D11_TILE_REGION_SIZE</a> structure that describes the size of the tiled region.
     * @param {Pointer<Void>} pSourceTileData Type: <b>const void*</b>
     * 
     * A pointer to memory that contains the source tile data that <b>UpdateTiles</b> uses to update the tiled resource.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ne-d3d11_2-d3d11_tile_copy_flag">D3D11_TILE_COPY_FLAG</a>-typed values that are combined by using a bitwise OR operation. The only valid value is <b>D3D11_TILE_COPY_NO_OVERWRITE</b>.
     *  The other values aren't meaningful here, though
     * by definition the <b>D3D11_TILE_COPY_LINEAR_BUFFER_TO_SWIZZLED_TILED_RESOURCE</b> value is basically what <b>UpdateTiles</b> does, but sources from app memory.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-updatetiles
     */
    UpdateTiles(pDestTiledResource, pDestTileRegionStartCoordinate, pDestTileRegionSize, pSourceTileData, Flags) {
        pSourceTileDataMarshal := pSourceTileData is VarRef ? "ptr" : "ptr"

        ComCall(137, this, "ptr", pDestTiledResource, "ptr", pDestTileRegionStartCoordinate, "ptr", pDestTileRegionSize, pSourceTileDataMarshal, pSourceTileData, "uint", Flags)
    }

    /**
     * Resizes a tile pool.
     * @param {ID3D11Buffer} pTilePool Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> for the tile pool to resize.
     * @param {Integer} NewSizeInBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The new size in bytes of the tile pool. The size must be a multiple of 64 KB or 0.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; otherwise, returns one of the following:
     * 
     * <ul>
     * <li>Returns <b>E_INVALIDARG</b> if the new tile pool size isn't a multiple of 64 KB or 0.</li>
     * <li>Returns <b>E_OUTOFMEMORY</b> if the call results in the driver having to allocate space for new page table mappings but running out of memory.</li>
     * <li>Returns <b>DXGI_ERROR_DEVICE_REMOVED</b> if the video card has been physically removed from the system, or a driver upgrade for the video card has occurred.</li>
     * </ul>
     * For <b>E_INVALIDARG</b> or <b>E_OUTOFMEMORY</b>, the existing tile pool remains unchanged, which includes existing mappings.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-resizetilepool
     */
    ResizeTilePool(pTilePool, NewSizeInBytes) {
        result := ComCall(138, this, "ptr", pTilePool, "uint", NewSizeInBytes, "HRESULT")
        return result
    }

    /**
     * Specifies a data access ordering constraint between multiple tiled resources.
     * @remarks
     * 
     * Apps can use tiled resources to reuse tiles in different resources. But, a device and driver might not be able to determine whether some memory in a tile pool that was just rendered to is now being used for reading.
     * 
     * 
     * For example, an app can render to some tiles in a tile pool with one tiled resource but then read from the same tiles by using a different tiled resource. These tiled-resource operations are different from using one resource and then just switching from writing with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11rendertargetview">ID3D11RenderTargetView</a> to reading with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11shaderresourceview">ID3D11ShaderResourceView</a>. The runtime already tracks and handles these one resource operations using <b>ID3D11RenderTargetView</b> and <b>ID3D11ShaderResourceView</b>.
     * 
     * 
     * When an app transitions from accessing (reading or writing) some location in a tile pool with one resource to accessing the same memory (read or write) via another tiled resource (with mappings to the same memory), the app must call <b>TiledResourceBarrier</b> after the first use of the resource and before the second. The parameters are the <i>pTiledResourceOrViewAccessBeforeBarrier</i> for accesses before the barrier (via rendering, copying), and the <i>pTiledResourceOrViewAccessAfterBarrier</i> for accesses after the barrier by using the same tile pool memory. If the resources are identical, the app doesn't need to call <b>TiledResourceBarrier</b> because this kind of hazard is already tracked and handled.
     * 
     * 
     * The barrier call informs the driver that operations issued to the resource before the call must complete before any accesses that occur after the call via a different tiled resource that shares the same memory.
     * 
     * 
     * Either or both of the parameters (before or after the barrier) can be <b>NULL</b>. <b>NULL</b> before the barrier means all tiled resource accesses before the barrier must complete before the resource specified after the barrier can be referenced by the graphics processing unit (GPU). <b>NULL</b> after the barrier means that any tiled resources accessed after the barrier can only be executed by the GPU after accesses to the tiled resources before the barrier are finished. Both <b>NULL</b> means all previous tiled resource accesses are complete before any subsequent tiled resource access can proceed. 
     * 
     * 
     * An app can pass a view pointer, a resource, or <b>NULL</b> for each parameter. Views are allowed not only for convenience but also to allow the app to scope the barrier effect to a relevant portion of a resource.
     * 
     * 
     * For more info about tiled resources, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/tiled-resources">Tiled resources</a>.
     * 
     * 
     * @param {ID3D11DeviceChild} pTiledResourceOrViewAccessBeforeBarrier Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicechild">ID3D11DeviceChild</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11view">ID3D11View</a> for a resource that was created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_TILED</a> flag.  Access operations on this object must complete before the access operations on the object that <i>pTiledResourceOrViewAccessAfterBarrier</i> specifies.
     * @param {ID3D11DeviceChild} pTiledResourceOrViewAccessAfterBarrier Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicechild">ID3D11DeviceChild</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11view">ID3D11View</a> for a resource that was created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_TILED</a> flag.  Access operations on this object must begin after the access operations on the object that <i>pTiledResourceOrViewAccessBeforeBarrier</i> specifies.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-tiledresourcebarrier
     */
    TiledResourceBarrier(pTiledResourceOrViewAccessBeforeBarrier, pTiledResourceOrViewAccessAfterBarrier) {
        ComCall(139, this, "ptr", pTiledResourceOrViewAccessBeforeBarrier, "ptr", pTiledResourceOrViewAccessAfterBarrier)
    }

    /**
     * Allows apps to determine when either a capture or profiling request is enabled.
     * @returns {BOOL} Returns <b>TRUE</b> if capture or profiling is enabled and <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-isannotationenabled
     */
    IsAnnotationEnabled() {
        result := ComCall(140, this, "int")
        return result
    }

    /**
     * Allows applications to annotate graphics commands.
     * @remarks
     * 
     * <b>SetMarkerInt</b> allows applications to annotate graphics commands, in order to provide more context to what the GPU is executing. When ETW logging or a support tool is enabled, an additional marker is correlated between the CPU and GPU timelines. The <i>pLabel</i> and <i>Data</i> value are logged to ETW. When the appropriate ETW logging is not enabled, this method does nothing.
     * 
     * 
     * @param {PWSTR} pLabel An optional string that will be logged to <a href="https://docs.microsoft.com/previous-versions/dotnet/netframework-3.0/ms751538(v=vs.85)">ETW</a> when ETW logging is active. If <b>‘#d’</b> appears in the string, it will be replaced by the value of the <i>Data</i> parameter similar to the way <b>printf</b> works.
     * @param {Integer} Data A signed data value that will be logged to ETW when ETW logging is active.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-setmarkerint
     */
    SetMarkerInt(pLabel, Data) {
        pLabel := pLabel is String ? StrPtr(pLabel) : pLabel

        ComCall(141, this, "ptr", pLabel, "int", Data)
    }

    /**
     * Allows applications to annotate the beginning of a range of graphics commands.
     * @remarks
     * 
     * <b>BeginEventInt</b> allows applications to annotate the beginning of a range of graphics commands, in order to provide more context to what the GPU is executing. When <a href="https://docs.microsoft.com/previous-versions/dotnet/netframework-3.0/ms751538(v=vs.85)">ETW</a> logging (or a supported tool) is enabled, an additional marker is correlated between the CPU and GPU timelines. The <i>pLabel</i> and <i>Data</i> value are logged to ETW. When the appropriate ETW logging is not enabled, this method does nothing.
     * 
     * 
     * @param {PWSTR} pLabel An optional string that will be logged to <a href="https://docs.microsoft.com/previous-versions/dotnet/netframework-3.0/ms751538(v=vs.85)">ETW</a> when ETW logging is active. If <b>‘#d’</b> appears in the string, it will be replaced by the value of the <i>Data</i> parameter similar to the way <b>printf</b> works.
     * @param {Integer} Data A signed data value that will be logged to ETW when ETW logging is active.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-begineventint
     */
    BeginEventInt(pLabel, Data) {
        pLabel := pLabel is String ? StrPtr(pLabel) : pLabel

        ComCall(142, this, "ptr", pLabel, "int", Data)
    }

    /**
     * Allows applications to annotate the end of a range of graphics commands.
     * @remarks
     * 
     * <b>EndEvent</b> allows applications to annotate the end of a range of graphics commands, in order to provide more context to what the GPU is executing. When the appropriate <a href="https://docs.microsoft.com/previous-versions/dotnet/netframework-3.0/ms751538(v=vs.85)">ETW</a> logging is not enabled, this method does nothing. When ETW logging is enabled, an additional marker is correlated between the CPU and GPU timelines.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_2/nf-d3d11_2-id3d11devicecontext2-endevent
     */
    EndEvent() {
        ComCall(143, this)
    }
}
