#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DSV_FLAGS.ahk" { D3D12_DSV_FLAGS }
#Import ".\D3D12_DSV_DIMENSION.ahk" { D3D12_DSV_DIMENSION }
#Import ".\D3D12_TEX2D_ARRAY_DSV.ahk" { D3D12_TEX2D_ARRAY_DSV }
#Import ".\D3D12_TEX1D_DSV.ahk" { D3D12_TEX1D_DSV }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_TEX2DMS_ARRAY_DSV.ahk" { D3D12_TEX2DMS_ARRAY_DSV }
#Import ".\D3D12_TEX2DMS_DSV.ahk" { D3D12_TEX2DMS_DSV }
#Import ".\D3D12_TEX1D_ARRAY_DSV.ahk" { D3D12_TEX1D_ARRAY_DSV }
#Import ".\D3D12_TEX2D_DSV.ahk" { D3D12_TEX2D_DSV }

/**
 * Describes the subresources of a texture that are accessible from a depth-stencil view.
 * @remarks
 * These are valid formats for a depth-stencil view:
 *         
 * 
 * <ul>
 * <li>DXGI_FORMAT_D16_UNORM</li>
 * <li>DXGI_FORMAT_D24_UNORM_S8_UINT</li>
 * <li>DXGI_FORMAT_D32_FLOAT</li>
 * <li>DXGI_FORMAT_D32_FLOAT_S8X24_UINT</li>
 * <li>DXGI_FORMAT_UNKNOWN</li>
 * </ul>
 * A depth-stencil view can't use a typeless format.  If the format chosen is DXGI_FORMAT_UNKNOWN, the format of the parent resource is used.
 *         
 * 
 * Pass a depth-stencil-view description into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createdepthstencilview">ID3D12Device::CreateDepthStencilView</a> to create a depth-stencil view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEPTH_STENCIL_VIEW_DESC {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the viewing format.  For allowable formats, see Remarks.
     */
    Format : DXGI_FORMAT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_dsv_dimension">D3D12_DSV_DIMENSION</a>-typed value that specifies how the depth-stencil resource will be accessed. This member also determines which _DSV to use in the following union.
     */
    ViewDimension : D3D12_DSV_DIMENSION

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_dsv_flags">D3D12_DSV_FLAGS</a> enumeration constants that are combined by using a bitwise OR operation. 
     *             The resulting value specifies whether the texture is read only.  
     *             Pass 0 to specify that it isn't read only; otherwise, pass one or more of the members of the <b>D3D12_DSV_FLAGS</b> enumerated type.
     */
    Flags : D3D12_DSV_FLAGS

    Texture1D : D3D12_TEX1D_DSV

    static __New() {
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D12_TEX1D_ARRAY_DSV, offset: 12 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D12_TEX2D_DSV, offset: 12 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D12_TEX2D_ARRAY_DSV, offset: 12 })
        DefineProp(this.Prototype, 'Texture2DMS', { type: D3D12_TEX2DMS_DSV, offset: 12 })
        DefineProp(this.Prototype, 'Texture2DMSArray', { type: D3D12_TEX2DMS_ARRAY_DSV, offset: 12 })
        this.DeleteProp("__New")
    }
}
