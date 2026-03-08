#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext2.ahk
#Include .\ID3D11Device1.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device2 adds new methods to those in ID3D11Device1.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nn-d3d11_2-id3d11device2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device2 extends ID3D11Device1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Device2
     * @type {Guid}
     */
    static IID => Guid("{9d06dffa-d1e5-4d07-83a8-1bb123f2f841}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 50

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImmediateContext2", "CreateDeferredContext2", "GetResourceTiling", "CheckMultisampleQualityLevels1"]

    /**
     * Gets an immediate context, which can play back command lists. (ID3D11Device2.GetImmediateContext2)
     * @remarks
     * The <b>GetImmediateContext2</b> method returns an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nn-d3d11_2-id3d11devicecontext2">ID3D11DeviceContext2</a> object that represents an immediate context, which is used to perform rendering that you want immediately submitted to a device. For most apps, an immediate context is the primary object that is used to draw your scene.
     * 
     * The <b>GetImmediateContext2</b> method increments the reference count of the immediate context by one. Therefore, you must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned interface pointer when you are done with it to avoid a memory leak.
     * @param {Pointer<ID3D11DeviceContext2>} ppImmediateContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nn-d3d11_2-id3d11devicecontext2">ID3D11DeviceContext2</a>**</b>
     * 
     * Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nn-d3d11_2-id3d11devicecontext2">ID3D11DeviceContext2</a> interface pointer is initialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11device2-getimmediatecontext2
     */
    GetImmediateContext2(ppImmediateContext) {
        ComCall(50, this, "ptr*", ppImmediateContext)
    }

    /**
     * Creates a deferred context, which can record command lists. (ID3D11Device2.CreateDeferredContext2)
     * @remarks
     * A deferred context is a thread-safe context that you can use to record graphics commands on a thread other than the main rendering thread.
     *           By using a deferred context, you can record graphics commands into a command list that is encapsulated by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11commandlist">ID3D11CommandList</a> interface.
     *           After you record all scene items, you can then submit them to the main render thread for final rendering.
     *           In this manner, you can perform rendering tasks concurrently across multiple threads and potentially improve performance in multi-core CPU scenarios.
     *         
     * 
     * You can create multiple deferred contexts.
     *         
     * 
     * <div class="alert"><b>Note</b>  If you use the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_SINGLETHREADED</a> value to create the device,
     *           <b>CreateDeferredContext2</b> fails with <b>DXGI_ERROR_INVALID_CALL</b>, and you can't create a deferred context.
     *         </div>
     * <div> </div>
     * For more information about deferred contexts, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-render">Immediate and Deferred Rendering</a>.
     * @param {Integer} ContextFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Reserved for future use.
     *             Pass 0.
     * @returns {ID3D11DeviceContext2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nn-d3d11_2-id3d11devicecontext2">ID3D11DeviceContext2</a>**</b>
     * 
     * Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nn-d3d11_2-id3d11devicecontext2">ID3D11DeviceContext2</a> interface pointer is initialized.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11device2-createdeferredcontext2
     */
    CreateDeferredContext2(ContextFlags) {
        result := ComCall(51, this, "uint", ContextFlags, "ptr*", &ppDeferredContext := 0, "HRESULT")
        return ID3D11DeviceContext2(ppDeferredContext)
    }

    /**
     * Gets info about how a tiled resource is broken into tiles. (ID3D11Device2.GetResourceTiling)
     * @remarks
     * For more info about tiled resources, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/tiled-resources">Tiled resources</a>.
     * @param {ID3D11Resource} pTiledResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a>*</b>
     * 
     * A pointer to the tiled resource to get info about.
     * @param {Pointer<Integer>} pNumTilesForEntireResource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that receives the number of tiles needed to store the entire tiled resource.
     * @param {Pointer<D3D11_PACKED_MIP_DESC>} pPackedMipDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_packed_mip_desc">D3D11_PACKED_MIP_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_packed_mip_desc">D3D11_PACKED_MIP_DESC</a> structure that <b>GetResourceTiling</b> fills with info about how the tiled resource's mipmaps are packed.
     * @param {Pointer<D3D11_TILE_SHAPE>} pStandardTileShapeForNonPackedMips Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_shape">D3D11_TILE_SHAPE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_tile_shape">D3D11_TILE_SHAPE</a> structure that <b>GetResourceTiling</b> fills with info about the tile shape. This is info about how pixels fit in the tiles, independent of tiled resource's dimensions,
     *             not including packed mipmaps.  If the entire tiled resource is packed, this parameter is meaningless because the tiled resource has no defined layout
     *             for packed mipmaps.
     *             In this situation, <b>GetResourceTiling</b> sets the members of <b>D3D11_TILE_SHAPE</b> to zeros.
     * @param {Pointer<Integer>} pNumSubresourceTilings Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that contains the number of tiles in the subresource. On input, this is the number of subresources to query tilings for; on output, this is the number that was actually retrieved at <i>pSubresourceTilingsForNonPackedMips</i> (clamped to what's available).
     * @param {Integer} FirstSubresourceTilingToGet Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of the first subresource tile to get. <b>GetResourceTiling</b> ignores this parameter if the number that <i>pNumSubresourceTilings</i> points to is 0.
     * @param {Pointer<D3D11_SUBRESOURCE_TILING>} pSubresourceTilingsForNonPackedMips Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_subresource_tiling">D3D11_SUBRESOURCE_TILING</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_subresource_tiling">D3D11_SUBRESOURCE_TILING</a> structure that <b>GetResourceTiling</b> fills with info about subresource tiles.
     *           
     * 
     * If subresource tiles are part of packed mipmaps, <b>GetResourceTiling</b> sets the members of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_subresource_tiling">D3D11_SUBRESOURCE_TILING</a> to zeros, except the <b>StartTileIndexInOverallResource</b> member, which <b>GetResourceTiling</b> sets to <b>D3D11_PACKED_TILE</b> (0xffffffff). The <b>D3D11_PACKED_TILE</b> constant indicates that the whole
     *             <b>D3D11_SUBRESOURCE_TILING</b> structure is meaningless for this situation, and the info that the <i>pPackedMipDesc</i> parameter points to applies.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11device2-getresourcetiling
     */
    GetResourceTiling(pTiledResource, pNumTilesForEntireResource, pPackedMipDesc, pStandardTileShapeForNonPackedMips, pNumSubresourceTilings, FirstSubresourceTilingToGet, pSubresourceTilingsForNonPackedMips) {
        pNumTilesForEntireResourceMarshal := pNumTilesForEntireResource is VarRef ? "uint*" : "ptr"
        pNumSubresourceTilingsMarshal := pNumSubresourceTilings is VarRef ? "uint*" : "ptr"

        ComCall(52, this, "ptr", pTiledResource, pNumTilesForEntireResourceMarshal, pNumTilesForEntireResource, "ptr", pPackedMipDesc, "ptr", pStandardTileShapeForNonPackedMips, pNumSubresourceTilingsMarshal, pNumSubresourceTilings, "uint", FirstSubresourceTilingToGet, "ptr", pSubresourceTilingsForNonPackedMips)
    }

    /**
     * Get the number of quality levels available during multisampling. (ID3D11Device2.CheckMultisampleQualityLevels1)
     * @remarks
     * When you multisample a texture, the number of quality levels available for an adapter is dependent on the texture format that you use and the number of 
     *       samples that you request. The maximum number of quality levels is defined by <b>D3D11_MAX_MULTISAMPLE_SAMPLE_COUNT</b> in D3D11.h. If this method returns 0, the format 
     *       and sample count combination is not supported for the installed adapter.
     * 
     * Furthermore, the definition of a quality level is up to each hardware vendor to define, however no facility is provided by Direct3D to help discover 
     *       this information.
     * 
     * Note that FEATURE_LEVEL_10_1 devices are required to support 4x MSAA for all render targets except R32G32B32A32 and R32G32B32.
     *       FEATURE_LEVEL_11_0 devices are required to support 4x MSAA for all render target formats, and 8x MSAA for all render target formats 
     *       except R32G32B32A32 formats.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The texture format during multisampling.
     * @param {Integer} SampleCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of samples during multisampling.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ne-d3d11_2-d3d11_check_multisample_quality_levels_flag">D3D11_CHECK_MULTISAMPLE_QUALITY_LEVELS_FLAGS</a> values that are combined by using a bitwise OR operation. Currently, only <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ne-d3d11_2-d3d11_check_multisample_quality_levels_flag">D3D11_CHECK_MULTISAMPLE_QUALITY_LEVELS_TILED_RESOURCE</a> is supported.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable the receives the number of quality levels supported by the adapter. See Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/nf-d3d11_2-id3d11device2-checkmultisamplequalitylevels1
     */
    CheckMultisampleQualityLevels1(Format, SampleCount, Flags) {
        result := ComCall(53, this, "int", Format, "uint", SampleCount, "uint", Flags, "uint*", &pNumQualityLevels := 0, "HRESULT")
        return pNumQualityLevels
    }
}
