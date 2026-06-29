#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10Resource.ahk" { ID3D10Resource }
#Import ".\D3D10_MAP.ahk" { D3D10_MAP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D10_TEXTURE1D_DESC.ahk" { D3D10_TEXTURE1D_DESC }

/**
 * A 1D texture interface accesses texel data, which is structured memory. (ID3D10Texture1D)
 * @remarks
 * To create an empty 1D texture, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture1d">ID3D10Device::CreateTexture1D</a>. For more details on creating and loading textures, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating-textures">Creating Texture Resources</a>.
 * 
 * Textures cannot be bound directly to the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-pipeline-stages">pipeline</a>; instead, a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">view</a> must be created and bound. Using a view, texture data can be interpreted at run time within certain restrictions. To use the texture as a render target or depth-stencil resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrendertargetview">ID3D10Device::CreateRenderTargetView</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilview">ID3D10Device::CreateDepthStencilView</a>, respectively. To use the texture as an input to a shader, create a  by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10texture1d
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10Texture1D extends ID3D10Resource {
    /**
     * The interface identifier for ID3D10Texture1D
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c03-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10Texture1D interfaces
    */
    struct Vtbl extends ID3D10Resource.Vtbl {
        Map     : IntPtr
        Unmap   : IntPtr
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10Texture1D.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a pointer to the data contained in a subresource, and deny the GPU access to that subresource.
     * @remarks
     * <h3><a id="Remarks"></a><a id="remarks"></a><a id="REMARKS"></a></h3>
     * Mapping a texture enables the CPU to directly access the underlying data in the subresource of a texture. For the method to succeed, the texture being mapped must be created with the appropriate flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_cpu_access_flag">D3D10_CPU_ACCESS_FLAG</a>), and its specified usage (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE</a>) must be either D3D10_USAGE_DYNAMIC or D3D10_USAGE_STAGING.
     * 
     * Common failures of <b>Map</b> methods are indicated by the following return values:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Item</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="DXGI_ERROR_WAS_STILL_DRAWING"></a><a id="dxgi_error_was_still_drawing"></a>DXGI_ERROR_WAS_STILL_DRAWING
     * 
     * </td>
     * <td width="60%">
     * If <i>MapFlags</i> specifies D3D10_MAP_FLAG_DO_NOT_WAIT and the GPU is not yet finished with the resource, <b>Map</b> returns DXGI_ERROR_WAS_STILL_DRAWING.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="DXGI_ERROR_DEVICE_REMOVED"></a><a id="dxgi_error_device_removed"></a>DXGI_ERROR_DEVICE_REMOVED
     * 
     * </td>
     * <td width="60%">
     * <b>Map</b> returns DXGI_ERROR_DEVICE_REMOVED if <i>MapType</i> allows any CPU read access and the video card has been removed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information about the preceding return values, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * 
     * <b>Map</b> has the following restrictions:
     * 
     * <ul>
     * <li>A single subresource cannot be mapped multiple times; in other words, do not call <b>Map</b> on a subresource that is already mapped.</li>
     * <li>Any subresource that is bound to the pipeline must be unmapped before any render operation (that is, before <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-draw">ID3D10Device::Draw</a>) can be executed.</li>
     * </ul>
     * Applications must cast the void pData pointer to the appropriate type to meaningfully access the underlying subresource data. For example, the following code demonstrates how to read each texel of a 1D subresource. It is assumed that the texture was created using <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R32G32B32A32_FLOAT</a> and that pData is the pointer to the texture resource data output from a successful call to this method.
     * 
     * 
     * ```
     * 
     * FLOAT* pTexels = (FLOAT*)pData;
     * for( UINT col = 0; col < width; col++ )
     * {
     *   pTexels[col*4 + 0]; // Alpha
     *   pTexels[col*4 + 1]; // Blue
     *   pTexels[col*4 + 2]; // Green
     *   pTexels[col*4 + 3]; // Red
     * }
     * 
     * ```
     * 
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 10:
     * 
     * <b>Map</b> in Direct3D 10 is analogous to resource <a href="https://docs.microsoft.com/windows/desktop/direct3d9/locking-resources">Lock</a> in Direct3D 9.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Subresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index number of the subresource. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-d3d10calcsubresource">D3D10CalcSubresource</a> for more details.
     * @param {D3D10_MAP} MapType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a></b>
     * 
     * Specifies the CPU's read and write permissions for a resource. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a>.
     * @param {Integer} MapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map_flag">Flag</a> that specifies what the CPU should do when the GPU is busy. This flag is optional.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Pointer to the texture resource data.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10texture1d-map
     */
    Map(Subresource, MapType, MapFlags) {
        result := ComCall(10, this, "uint", Subresource, D3D10_MAP, MapType, "uint", MapFlags, "ptr*", &ppData := 0, "HRESULT")
        return ppData
    }

    /**
     * Invalidate the pointer to a resource that was retrieved by ID3D10Texture1D::Map, and re-enable the GPU's access to that resource.
     * @remarks
     * A subresource must be mapped before Unmap is called.
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 10:
     * 
     * Unmap in Direct3D 10 is analogous to resource Unlock in Direct3D 9.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Subresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Subresource</a> to be unmapped. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-d3d10calcsubresource">D3D10CalcSubresource</a> for more details.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10texture1d-unmap
     */
    Unmap(Subresource) {
        ComCall(11, this, "uint", Subresource)
    }

    /**
     * Get the properties of the texture resource. (ID3D10Texture1D.GetDesc)
     * @param {Pointer<D3D10_TEXTURE1D_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture1d_desc">D3D10_TEXTURE1D_DESC</a>*</b>
     * 
     * Pointer to a resource description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture1d_desc">D3D10_TEXTURE1D_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10texture1d-getdesc
     */
    GetDesc(pDesc) {
        ComCall(12, this, D3D10_TEXTURE1D_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10Texture1D.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Map := CallbackCreate(GetMethod(implObj, "Map"), flags, 5)
        this.vtbl.Unmap := CallbackCreate(GetMethod(implObj, "Unmap"), flags, 2)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Map)
        CallbackFree(this.vtbl.Unmap)
        CallbackFree(this.vtbl.GetDesc)
    }
}
