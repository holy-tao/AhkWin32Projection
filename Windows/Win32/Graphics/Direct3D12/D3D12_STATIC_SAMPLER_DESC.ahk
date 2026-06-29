#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_STATIC_BORDER_COLOR.ahk" { D3D12_STATIC_BORDER_COLOR }
#Import ".\D3D12_SHADER_VISIBILITY.ahk" { D3D12_SHADER_VISIBILITY }
#Import ".\D3D12_COMPARISON_FUNC.ahk" { D3D12_COMPARISON_FUNC }
#Import ".\D3D12_TEXTURE_ADDRESS_MODE.ahk" { D3D12_TEXTURE_ADDRESS_MODE }
#Import ".\D3D12_FILTER.ahk" { D3D12_FILTER }

/**
 * Describes a static sampler.
 * @remarks
 * Use this structure with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_static_sampler_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_STATIC_SAMPLER_DESC {
    #StructPack 4

    /**
     * The filtering method to use when sampling a texture, as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_filter">D3D12_FILTER</a> enumeration constant.
     */
    Filter : D3D12_FILTER

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE</a> mode to use for resolving a <i>u</i> texture coordinate that is outside the 0 to 1 range.
     */
    AddressU : D3D12_TEXTURE_ADDRESS_MODE

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE</a> mode to use for resolving a <i>v</i> texture coordinate that is outside the 0 to 1 range.
     */
    AddressV : D3D12_TEXTURE_ADDRESS_MODE

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE</a> mode to use for resolving a <i>w</i> texture coordinate that is outside the 0 to 1 range.
     */
    AddressW : D3D12_TEXTURE_ADDRESS_MODE

    /**
     * Offset from the calculated mipmap level. For example, if Direct3D calculates that a texture should be sampled at mipmap level 3 and MipLODBias is 2, then the texture will be sampled at mipmap level 5.
     */
    MipLODBias : Float32

    /**
     * Clamping value used if D3D12_FILTER_ANISOTROPIC or D3D12_FILTER_COMPARISON_ANISOTROPIC is specified as the filter. Valid values are between 1 and 16.
     */
    MaxAnisotropy : UInt32

    /**
     * A function that compares sampled data against existing sampled data. 
     *             The function options are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_comparison_func">D3D12_COMPARISON_FUNC</a>.
     */
    ComparisonFunc : D3D12_COMPARISON_FUNC

    /**
     * One member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_static_border_color">D3D12_STATIC_BORDER_COLOR</a>, the border color to use if D3D12_TEXTURE_ADDRESS_MODE_BORDER is specified for AddressU, AddressV, or AddressW. 
     *             Range must be between 0.0 and 1.0 inclusive.
     */
    BorderColor : D3D12_STATIC_BORDER_COLOR

    /**
     * Lower end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed.
     */
    MinLOD : Float32

    /**
     * Upper end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed. This value must be greater than or equal to MinLOD. To have no upper limit on LOD set this to a large value such as D3D12_FLOAT32_MAX.
     */
    MaxLOD : Float32

    /**
     * The <i>ShaderRegister</i> and <i>RegisterSpace</i> parameters correspond to the binding syntax of HLSL.  For example, in HLSL:
     *             
     * 
     * 
     * ``` syntax
     * Texture2D&lt;float4&gt; a : register(t2, space3);
     * ```
     * 
     * This corresponds to a  <i>ShaderRegister</i> of 2 (indicating the type is SRV), and <i>RegisterSpace</i> is 3.
     *             
     * 
     * The  <i>ShaderRegister</i> and <i>RegisterSpace</i> pair is needed to establish correspondence between shader resources and runtime heap descriptors, using the root signature data structure.
     */
    ShaderRegister : UInt32

    /**
     * See the description for <i>ShaderRegister</i>.
     *             Register space is optional; the default register space is 0.
     */
    RegisterSpace : UInt32

    /**
     * Specifies the visibility of the sampler to the pipeline shaders, one member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_shader_visibility">D3D12_SHADER_VISIBILITY</a>.
     */
    ShaderVisibility : D3D12_SHADER_VISIBILITY

}
