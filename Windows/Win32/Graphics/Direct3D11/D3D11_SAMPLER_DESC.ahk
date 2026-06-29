#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_TEXTURE_ADDRESS_MODE.ahk" { D3D11_TEXTURE_ADDRESS_MODE }
#Import ".\D3D11_FILTER.ahk" { D3D11_FILTER }
#Import ".\D3D11_COMPARISON_FUNC.ahk" { D3D11_COMPARISON_FUNC }

/**
 * Describes a sampler state. (D3D11_SAMPLER_DESC)
 * @remarks
 * These are the default values for sampler state.
 * 
 * <table>
 * <tr>
 * <th>State</th>
 * <th>Default Value</th>
 * </tr>
 * <tr>
 * <td>Filter</td>
 * <td>D3D11_FILTER_MIN_MAG_MIP_LINEAR</td>
 * </tr>
 * <tr>
 * <td>AddressU</td>
 * <td>D3D11_TEXTURE_ADDRESS_CLAMP</td>
 * </tr>
 * <tr>
 * <td>AddressV</td>
 * <td>D3D11_TEXTURE_ADDRESS_CLAMP</td>
 * </tr>
 * <tr>
 * <td>AddressW</td>
 * <td>D3D11_TEXTURE_ADDRESS_CLAMP</td>
 * </tr>
 * <tr>
 * <td>MinLOD</td>
 * <td>-3.402823466e+38F (-FLT_MAX)</td>
 * </tr>
 * <tr>
 * <td>MaxLOD</td>
 * <td>3.402823466e+38F (FLT_MAX)</td>
 * </tr>
 * <tr>
 * <td>MipMapLODBias</td>
 * <td>0.0f</td>
 * </tr>
 * <tr>
 * <td>MaxAnisotropy</td>
 * <td>1</td>
 * </tr>
 * <tr>
 * <td>ComparisonFunc</td>
 * <td>D3D11_COMPARISON_NEVER</td>
 * </tr>
 * <tr>
 * <td>BorderColor</td>
 * <td>float4(1.0f,1.0f,1.0f,1.0f)</td>
 * </tr>
 * <tr>
 * <td>Texture</td>
 * <td>N/A</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_sampler_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_SAMPLER_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_filter">D3D11_FILTER</a></b>
     * 
     * Filtering method to use when sampling a texture (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_filter">D3D11_FILTER</a>).
     */
    Filter : D3D11_FILTER

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_texture_address_mode">D3D11_TEXTURE_ADDRESS_MODE</a></b>
     * 
     * Method to use for resolving a u texture coordinate that is outside the 0 to 1 range (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_texture_address_mode">D3D11_TEXTURE_ADDRESS_MODE</a>).
     */
    AddressU : D3D11_TEXTURE_ADDRESS_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_texture_address_mode">D3D11_TEXTURE_ADDRESS_MODE</a></b>
     * 
     * Method to use for resolving a v texture coordinate that is outside the 0 to 1 range.
     */
    AddressV : D3D11_TEXTURE_ADDRESS_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_texture_address_mode">D3D11_TEXTURE_ADDRESS_MODE</a></b>
     * 
     * Method to use for resolving a w texture coordinate that is outside the 0 to 1 range.
     */
    AddressW : D3D11_TEXTURE_ADDRESS_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Offset from the calculated mipmap level. For example, if Direct3D calculates that a texture should be sampled at mipmap level 3 and MipLODBias is 2, then the texture will be sampled at mipmap level 5.
     */
    MipLODBias : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Clamping value used if D3D11_FILTER_ANISOTROPIC or D3D11_FILTER_COMPARISON_ANISOTROPIC is specified in Filter. Valid values are between 1 and 16.
     */
    MaxAnisotropy : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a></b>
     * 
     * A function that compares sampled data against existing sampled data. The function options are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a>.
     */
    ComparisonFunc : D3D11_COMPARISON_FUNC

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a>[4]</b>
     * 
     * Border color to use if D3D11_TEXTURE_ADDRESS_BORDER is specified for AddressU, AddressV, or AddressW. Range must be between 0.0 and 1.0 inclusive.
     */
    BorderColor : Float32[4]

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Lower end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed.
     */
    MinLOD : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Upper end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed. This value must be greater than or equal to MinLOD. To have no upper limit on LOD set this to a large value such as D3D11_FLOAT32_MAX.
     */
    MaxLOD : Float32

}
