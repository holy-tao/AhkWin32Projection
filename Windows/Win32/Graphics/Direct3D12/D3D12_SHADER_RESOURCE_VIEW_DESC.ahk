#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BUFFER_SRV.ahk
#Include .\D3D12_TEX1D_SRV.ahk
#Include .\D3D12_TEX1D_ARRAY_SRV.ahk
#Include .\D3D12_TEX2D_SRV.ahk
#Include .\D3D12_TEX2D_ARRAY_SRV.ahk
#Include .\D3D12_TEX2DMS_SRV.ahk
#Include .\D3D12_TEX2DMS_ARRAY_SRV.ahk
#Include .\D3D12_TEX3D_SRV.ahk
#Include .\D3D12_TEXCUBE_SRV.ahk
#Include .\D3D12_TEXCUBE_ARRAY_SRV.ahk
#Include .\D3D12_RAYTRACING_ACCELERATION_STRUCTURE_SRV.ahk

/**
 * Describes a shader-resource view. (D3D12_SHADER_RESOURCE_VIEW_DESC)
 * @remarks
 * A view is a format-specific way to look at the data in a resource. The view determines what data to look at, and how it is cast when read.
 * 
 * When viewing a resource, the resource-view description must specify a typed format, that is compatible with the resource format. So that means that you can't create a resource-view description using any format with _TYPELESS in the name. You can however view a typeless resource by specifying a typed format for the view. For example, a DXGI_FORMAT_R32G32B32_TYPELESS resource can be viewed with one of these typed formats: DXGI_FORMAT_R32G32B32_FLOAT, DXGI_FORMAT_R32G32B32_UINT, and DXGI_FORMAT_R32G32B32_SINT, since these typed formats are compatible with the typeless resource.
 * 
 * Create a shader-resource-view description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview">ID3D12Device::CreateShaderResourceView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_RESOURCE_VIEW_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the viewing format. See remarks.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_srv_dimension">D3D12_SRV_DIMENSION</a>-typed value that specifies the resource type of the view. This type is the same as the resource type of the underlying resource. This member also determines which _SRV to use in the union below.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A value, constructed using the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_component_mapping">D3D12_ENCODE_SHADER_4_COMPONENT_MAPPING</a> macro. The **D3D12_SHADER_COMPONENT_MAPPING** enumeration specifies what values from memory should be returned when the texture is accessed in a shader via this shader resource view (SRV). For example, it can route component 1 (green) from memory, or the constant `0`, into component 2 (`.b`) of the value given to the shader.
     * @type {Integer}
     */
    Shader4ComponentMapping {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3D12_BUFFER_SRV}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := D3D12_BUFFER_SRV(16, this)
            return this.__Buffer
        }
    }

    /**
     * @type {D3D12_TEX1D_SRV}
     */
    Texture1D{
        get {
            if(!this.HasProp("__Texture1D"))
                this.__Texture1D := D3D12_TEX1D_SRV(16, this)
            return this.__Texture1D
        }
    }

    /**
     * @type {D3D12_TEX1D_ARRAY_SRV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D12_TEX1D_ARRAY_SRV(16, this)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {D3D12_TEX2D_SRV}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D12_TEX2D_SRV(16, this)
            return this.__Texture2D
        }
    }

    /**
     * @type {D3D12_TEX2D_ARRAY_SRV}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D12_TEX2D_ARRAY_SRV(16, this)
            return this.__Texture2DArray
        }
    }

    /**
     * @type {D3D12_TEX2DMS_SRV}
     */
    Texture2DMS{
        get {
            if(!this.HasProp("__Texture2DMS"))
                this.__Texture2DMS := D3D12_TEX2DMS_SRV(16, this)
            return this.__Texture2DMS
        }
    }

    /**
     * @type {D3D12_TEX2DMS_ARRAY_SRV}
     */
    Texture2DMSArray{
        get {
            if(!this.HasProp("__Texture2DMSArray"))
                this.__Texture2DMSArray := D3D12_TEX2DMS_ARRAY_SRV(16, this)
            return this.__Texture2DMSArray
        }
    }

    /**
     * @type {D3D12_TEX3D_SRV}
     */
    Texture3D{
        get {
            if(!this.HasProp("__Texture3D"))
                this.__Texture3D := D3D12_TEX3D_SRV(16, this)
            return this.__Texture3D
        }
    }

    /**
     * @type {D3D12_TEXCUBE_SRV}
     */
    TextureCube{
        get {
            if(!this.HasProp("__TextureCube"))
                this.__TextureCube := D3D12_TEXCUBE_SRV(16, this)
            return this.__TextureCube
        }
    }

    /**
     * @type {D3D12_TEXCUBE_ARRAY_SRV}
     */
    TextureCubeArray{
        get {
            if(!this.HasProp("__TextureCubeArray"))
                this.__TextureCubeArray := D3D12_TEXCUBE_ARRAY_SRV(16, this)
            return this.__TextureCubeArray
        }
    }

    /**
     * @type {D3D12_RAYTRACING_ACCELERATION_STRUCTURE_SRV}
     */
    RaytracingAccelerationStructure{
        get {
            if(!this.HasProp("__RaytracingAccelerationStructure"))
                this.__RaytracingAccelerationStructure := D3D12_RAYTRACING_ACCELERATION_STRUCTURE_SRV(16, this)
            return this.__RaytracingAccelerationStructure
        }
    }
}
