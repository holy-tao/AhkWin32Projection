#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_TEXTURE_LAYOUT.ahk" { D3D12_TEXTURE_LAYOUT }
#Import ".\D3D12_RESOURCE_FLAGS.ahk" { D3D12_RESOURCE_FLAGS }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_MIP_REGION.ahk" { D3D12_MIP_REGION }
#Import "..\Dxgi\Common\DXGI_SAMPLE_DESC.ahk" { DXGI_SAMPLE_DESC }
#Import ".\D3D12_RESOURCE_DIMENSION.ahk" { D3D12_RESOURCE_DIMENSION }

/**
 * Describes a resource, such as a texture, including a mip region. This structure is used in several methods.
 * @remarks
 * For remarks, see [D3D12_RESOURCE_DESC1](./ns-d3d12-d3d12_resource_desc.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_desc1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RESOURCE_DESC1 {
    #StructPack 8

    /**
     * One member of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_dimension">D3D12_RESOURCE_DIMENSION</a>, specifying the dimensions of the resource (for example, D3D12_RESOURCE_DIMENSION_TEXTURE1D), or whether it is a buffer ((D3D12_RESOURCE_DIMENSION_BUFFER).
     */
    Dimension : D3D12_RESOURCE_DIMENSION

    /**
     * Specifies the alignment.
     */
    Alignment : Int64

    /**
     * Specifies the width of the resource.
     */
    Width : Int64

    /**
     * Specifies the height of the resource.
     */
    Height : UInt32

    /**
     * Specifies the depth of the resource, if it is 3D, or the array size if it is an array of 1D or 2D resources.
     */
    DepthOrArraySize : UInt16

    /**
     * Specifies the number of MIP levels.
     */
    MipLevels : UInt16

    /**
     * Specifies one member of <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>.
     */
    Format : DXGI_FORMAT

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure.
     */
    SampleDesc : DXGI_SAMPLE_DESC

    /**
     * Specifies one member of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_texture_layout">D3D12_TEXTURE_LAYOUT</a>.
     */
    Layout : D3D12_TEXTURE_LAYOUT

    /**
     * Bitwise-OR'd flags, as <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAGS</a> enumeration constants.
     */
    Flags : D3D12_RESOURCE_FLAGS

    /**
     * A [D3D12_MIP_REGION](./ns-d3d12-d3d12_mip_region.md) struct.
     */
    SamplerFeedbackMipRegion : D3D12_MIP_REGION

}
