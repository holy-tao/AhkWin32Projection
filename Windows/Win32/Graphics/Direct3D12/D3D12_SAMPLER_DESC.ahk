#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a sampler state. (D3D12_SAMPLER_DESC)
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createsampler">CreateSampler</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_sampler_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SAMPLER_DESC extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_filter">D3D12_FILTER</a>-typed value that specifies the filtering method to use when sampling a texture.
     * @type {Integer}
     */
    Filter {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE</a>-typed value that specifies the method to use for resolving a u texture coordinate that is outside the 0 to 1 range.
     * @type {Integer}
     */
    AddressU {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE</a>-typed value that specifies the method to use for resolving a v texture coordinate that is outside the 0 to 1 range.
     * @type {Integer}
     */
    AddressV {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE</a>-typed value that specifies the method to use for resolving a w texture coordinate that is outside the 0 to 1 range.
     * @type {Integer}
     */
    AddressW {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Offset from the calculated mipmap level. For example, if the runtime calculates that a texture should be sampled at mipmap level 3 and <b>MipLODBias</b> is 2, the texture will be sampled at mipmap level 5.
     * @type {Float}
     */
    MipLODBias {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Clamping value used if <b>D3D12_FILTER_ANISOTROPIC</b> or <b>D3D12_FILTER_COMPARISON_ANISOTROPIC</b> is specified in <b>Filter</b>. Valid values are between 1 and 16.
     * @type {Integer}
     */
    MaxAnisotropy {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_comparison_func">D3D12_COMPARISON_FUNC</a>-typed value that specifies a function that compares sampled data against existing sampled data.
     * @type {Integer}
     */
    ComparisonFunc {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * RGBA border color to use if <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_address_mode">D3D12_TEXTURE_ADDRESS_MODE_BORDER</a> is specified for <b>AddressU</b>, <b>AddressV</b>, or <b>AddressW</b>. Range must be between 0.0 and 1.0 inclusive.
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
     * Lower end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed.
     * @type {Float}
     */
    MinLOD {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * Upper end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed. This value must be greater than or equal to <b>MinLOD</b>. To have no upper limit on LOD, set this member to a large value.
     * @type {Float}
     */
    MaxLOD {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }
}
