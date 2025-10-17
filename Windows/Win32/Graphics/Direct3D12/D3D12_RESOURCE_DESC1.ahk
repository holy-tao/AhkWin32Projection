#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Dxgi\Common\DXGI_SAMPLE_DESC.ahk
#Include .\D3D12_MIP_REGION.ahk

/**
 * Describes a resource, such as a texture, including a mip region. This structure is used in several methods.
 * @remarks
 * 
  * For remarks, see [D3D12_RESOURCE_DESC1](./ns-d3d12-d3d12_resource_desc.md).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_resource_desc1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_DESC1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * One member of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_dimension">D3D12_RESOURCE_DIMENSION</a>, specifying the dimensions of the resource (for example, D3D12_RESOURCE_DIMENSION_TEXTURE1D), or whether it is a buffer ((D3D12_RESOURCE_DIMENSION_BUFFER).
     * @type {Integer}
     */
    Dimension {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the alignment.
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the width of the resource.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the height of the resource.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the depth of the resource, if it is 3D, or the array size if it is an array of 1D or 2D resources.
     * @type {Integer}
     */
    DepthOrArraySize {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * Specifies the number of MIP levels.
     * @type {Integer}
     */
    MipLevels {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * Specifies one member of <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure.
     * @type {DXGI_SAMPLE_DESC}
     */
    SampleDesc{
        get {
            if(!this.HasProp("__SampleDesc"))
                this.__SampleDesc := DXGI_SAMPLE_DESC(40, this)
            return this.__SampleDesc
        }
    }

    /**
     * Specifies one member of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_texture_layout">D3D12_TEXTURE_LAYOUT</a>.
     * @type {Integer}
     */
    Layout {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Bitwise-OR'd flags, as <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_flags">D3D12_RESOURCE_FLAGS</a> enumeration constants.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * A [D3D12_MIP_REGION](./ns-d3d12-d3d12_mip_region.md) struct.
     * @type {D3D12_MIP_REGION}
     */
    SamplerFeedbackMipRegion{
        get {
            if(!this.HasProp("__SamplerFeedbackMipRegion"))
                this.__SamplerFeedbackMipRegion := D3D12_MIP_REGION(56, this)
            return this.__SamplerFeedbackMipRegion
        }
    }
}
