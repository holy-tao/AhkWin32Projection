#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_COMPARISON_FUNC.ahk" { D3D12_COMPARISON_FUNC }
#Import ".\D3D12_TEXTURE_ADDRESS_MODE.ahk" { D3D12_TEXTURE_ADDRESS_MODE }
#Import ".\D3D12_FILTER.ahk" { D3D12_FILTER }

/**
 * Describes a sampler state. (D3D12_SAMPLER_DESC)
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createsampler">CreateSampler</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_sampler_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SAMPLER_DESC {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_filter">D3D12_FILTER</a>-typed value that specifies the filtering method to use when sampling a texture.
     */
    Filter : D3D12_FILTER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE</a>-typed value that specifies the method to use for resolving a u texture coordinate that is outside the 0 to 1 range.
     */
    AddressU : D3D12_TEXTURE_ADDRESS_MODE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE</a>-typed value that specifies the method to use for resolving a v texture coordinate that is outside the 0 to 1 range.
     */
    AddressV : D3D12_TEXTURE_ADDRESS_MODE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE</a>-typed value that specifies the method to use for resolving a w texture coordinate that is outside the 0 to 1 range.
     */
    AddressW : D3D12_TEXTURE_ADDRESS_MODE

    /**
     * Offset from the calculated mipmap level. For example, if the runtime calculates that a texture should be sampled at mipmap level 3 and <b>MipLODBias</b> is 2, the texture will be sampled at mipmap level 5.
     */
    MipLODBias : Float32

    /**
     * Clamping value used if <b>D3D12_FILTER_ANISOTROPIC</b> or <b>D3D12_FILTER_COMPARISON_ANISOTROPIC</b> is specified in <b>Filter</b>. Valid values are between 1 and 16.
     */
    MaxAnisotropy : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_comparison_func">D3D12_COMPARISON_FUNC</a>-typed value that specifies a function that compares sampled data against existing sampled data.
     */
    ComparisonFunc : D3D12_COMPARISON_FUNC

    /**
     * RGBA border color to use if <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE_BORDER</a> is specified for <b>AddressU</b>, <b>AddressV</b>, or <b>AddressW</b>. Range must be between 0.0 and 1.0 inclusive.
     */
    BorderColor : Float32[4]

    /**
     * Lower end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed.
     */
    MinLOD : Float32

    /**
     * Upper end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed. This value must be greater than or equal to <b>MinLOD</b>. To have no upper limit on LOD, set this member to a large value.
     */
    MaxLOD : Float32

}
