#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the tier level at which tiled resources are supported.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_tiled_resources_tier
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TILED_RESOURCES_TIER extends Win32Enum{

    /**
     * Tiled resources are not supported.
     * @type {Integer (Int32)}
     */
    static D3D11_TILED_RESOURCES_NOT_SUPPORTED => 0

    /**
     * Tier_1 tiled resources are supported.
     * 
     * The device supports calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">CreateTexture2D</a> and so on with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_TILED</a> flag.
     *             
     * 
     * The device supports calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createbuffer">CreateBuffer</a> with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_TILE_POOL</a> flag.
     *             
     * 
     * If you access tiles (read or write) that are <b>NULL</b>-mapped, you get undefined behavior, which includes device-removed.  Apps can map all tiles to a single "default" tile to avoid this condition.
     * @type {Integer (Int32)}
     */
    static D3D11_TILED_RESOURCES_TIER_1 => 1

    /**
     * Tier_2 tiled resources are supported.
     *             
     * 
     * Superset of Tier_1 functionality, which includes this additional support:
     *               
     * 
     * <ul>
     * <li>On Tier_1, if the size of a texture mipmap level is an integer multiple of the standard tile shape for its format, it is guaranteed to be nonpacked. On Tier_2, this guarantee is expanded to include mipmap levels whose size is at least one standard tile shape.
     *                 For more info, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_packed_mip_desc">D3D11_PACKED_MIP_DESC</a>.
     *               </li>
     * <li>Shader instructions are available for clamping level-of-detail (LOD) and for obtaining status about the shader operation. For info about one of these shader instructions, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sample-s-float--int-uint-">Sample(S,float,int,float,uint)</a>.
     *               </li>
     * <li>Reading from <b>NULL</b>-mapped tiles treat that sampled value as zero.  Writes to <b>NULL</b>-mapped tiles are discarded.
     *               </li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static D3D11_TILED_RESOURCES_TIER_2 => 2

    /**
     * Tier_3 tiled resources are supported.
     *             
     * 
     * Superset of Tier_2 functionality, Tier 3 is essentially Tier 2 but with the additional support of Texture3D for Tiled Resources.
     * @type {Integer (Int32)}
     */
    static D3D11_TILED_RESOURCES_TIER_3 => 3
}
