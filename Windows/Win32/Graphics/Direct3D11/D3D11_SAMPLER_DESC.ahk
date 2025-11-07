#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a sampler state.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_sampler_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SAMPLER_DESC extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_filter">D3D11_FILTER</a></b>
     * 
     * Filtering method to use when sampling a texture (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_filter">D3D11_FILTER</a>).
     * @type {Integer}
     */
    Filter {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_texture_address_mode">D3D11_TEXTURE_ADDRESS_MODE</a></b>
     * 
     * Method to use for resolving a u texture coordinate that is outside the 0 to 1 range (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_texture_address_mode">D3D11_TEXTURE_ADDRESS_MODE</a>).
     * @type {Integer}
     */
    AddressU {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_texture_address_mode">D3D11_TEXTURE_ADDRESS_MODE</a></b>
     * 
     * Method to use for resolving a v texture coordinate that is outside the 0 to 1 range.
     * @type {Integer}
     */
    AddressV {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_texture_address_mode">D3D11_TEXTURE_ADDRESS_MODE</a></b>
     * 
     * Method to use for resolving a w texture coordinate that is outside the 0 to 1 range.
     * @type {Integer}
     */
    AddressW {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Offset from the calculated mipmap level. For example, if Direct3D calculates that a texture should be sampled at mipmap level 3 and MipLODBias is 2, then the texture will be sampled at mipmap level 5.
     * @type {Float}
     */
    MipLODBias {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Clamping value used if D3D11_FILTER_ANISOTROPIC or D3D11_FILTER_COMPARISON_ANISOTROPIC is specified in Filter. Valid values are between 1 and 16.
     * @type {Integer}
     */
    MaxAnisotropy {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a></b>
     * 
     * A function that compares sampled data against existing sampled data. The function options are listed in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_comparison_func">D3D11_COMPARISON_FUNC</a>.
     * @type {Integer}
     */
    ComparisonFunc {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a>[4]</b>
     * 
     * Border color to use if D3D11_TEXTURE_ADDRESS_BORDER is specified for AddressU, AddressV, or AddressW. Range must be between 0.0 and 1.0 inclusive.
     * @type {Array<Single>}
     */
    BorderColor{
        get {
            if(!this.HasProp("__BorderColorProxyArray"))
                this.__BorderColorProxyArray := Win32FixedArray(this.ptr + 28, 4, Primitive, "float")
            return this.__BorderColorProxyArray
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Lower end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed.
     * @type {Float}
     */
    MinLOD {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Upper end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed. This value must be greater than or equal to MinLOD. To have no upper limit on LOD set this to a large value such as D3D11_FLOAT32_MAX.
     * @type {Float}
     */
    MaxLOD {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }
}
