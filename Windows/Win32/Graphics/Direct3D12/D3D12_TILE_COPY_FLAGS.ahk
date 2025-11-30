#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to copy a tile.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytiles">CopyTiles</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_tile_copy_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TILE_COPY_FLAGS extends Win32BitflagEnum{

    /**
     * No tile-copy flags are specified.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_COPY_FLAG_NONE => 0

    /**
     * Indicates that the GPU isn't currently referencing any of the
     *             portions of destination memory being written.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_COPY_FLAG_NO_HAZARD => 1

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytiles">ID3D12GraphicsCommandList::CopyTiles</a> operation involves copying a linear buffer to a swizzled tiled resource. This means to copy tile data from the
     *             specified buffer location, reading tiles sequentially,
     *             to the specified tile region (in x,y,z order if the region is a box), swizzling to optimal hardware memory layout as needed.
     *             In this <b>ID3D12GraphicsCommandList::CopyTiles</b> call, you specify the source data with the  <i>pBuffer</i> parameter and the destination with the <i>pTiledResource</i> parameter.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_COPY_FLAG_LINEAR_BUFFER_TO_SWIZZLED_TILED_RESOURCE => 2

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytiles">ID3D12GraphicsCommandList::CopyTiles</a> operation involves copying a swizzled tiled resource to a linear buffer. This means to copy tile data from the tile region, reading tiles sequentially (in x,y,z order if the region is a box),
     *             to the specified buffer location, deswizzling to linear memory layout as needed.
     *             In this <b>ID3D12GraphicsCommandList::CopyTiles</b> call, you specify the source data with the <i>pTiledResource</i> parameter and the destination with the  <i>pBuffer</i> parameter.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_COPY_FLAG_SWIZZLED_TILED_RESOURCE_TO_LINEAR_BUFFER => 4
}
