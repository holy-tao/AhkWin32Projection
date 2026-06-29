#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_TEX2D_ARRAY_SRV.ahk" { D3D12_TEX2D_ARRAY_SRV }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_TEX2DMS_ARRAY_SRV.ahk" { D3D12_TEX2DMS_ARRAY_SRV }
#Import ".\D3D12_BUFFER_SRV_BYTE_OFFSET.ahk" { D3D12_BUFFER_SRV_BYTE_OFFSET }
#Import ".\D3D12_TEX1D_ARRAY_SRV.ahk" { D3D12_TEX1D_ARRAY_SRV }
#Import ".\D3D12_BUFFER_SRV.ahk" { D3D12_BUFFER_SRV }
#Import ".\D3D12_TEX3D_SRV.ahk" { D3D12_TEX3D_SRV }
#Import ".\D3D12_TEXCUBE_SRV.ahk" { D3D12_TEXCUBE_SRV }
#Import ".\D3D12_SRV_DIMENSION.ahk" { D3D12_SRV_DIMENSION }
#Import ".\D3D12_RAYTRACING_ACCELERATION_STRUCTURE_SRV.ahk" { D3D12_RAYTRACING_ACCELERATION_STRUCTURE_SRV }
#Import ".\D3D12_TEX2DMS_SRV.ahk" { D3D12_TEX2DMS_SRV }
#Import ".\D3D12_TEX1D_SRV.ahk" { D3D12_TEX1D_SRV }
#Import ".\D3D12_TEXCUBE_ARRAY_SRV.ahk" { D3D12_TEXCUBE_ARRAY_SRV }
#Import ".\D3D12_TEX2D_SRV.ahk" { D3D12_TEX2D_SRV }
#Import ".\D3D12_BUFFER_SRV_FLAGS.ahk" { D3D12_BUFFER_SRV_FLAGS }

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
 */
export default struct D3D12_SHADER_RESOURCE_VIEW_DESC {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the viewing format. See remarks.
     */
    Format : DXGI_FORMAT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_srv_dimension">D3D12_SRV_DIMENSION</a>-typed value that specifies the resource type of the view. This type is the same as the resource type of the underlying resource. This member also determines which _SRV to use in the union below.
     */
    ViewDimension : D3D12_SRV_DIMENSION

    /**
     * A value, constructed using the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_component_mapping">D3D12_ENCODE_SHADER_4_COMPONENT_MAPPING</a> macro. The **D3D12_SHADER_COMPONENT_MAPPING** enumeration specifies what values from memory should be returned when the texture is accessed in a shader via this shader resource view (SRV). For example, it can route component 1 (green) from memory, or the constant `0`, into component 2 (`.b`) of the value given to the shader.
     */
    Shader4ComponentMapping : UInt32

    Buffer : D3D12_BUFFER_SRV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D12_TEX1D_SRV, offset: 16 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D12_TEX1D_ARRAY_SRV, offset: 16 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D12_TEX2D_SRV, offset: 16 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D12_TEX2D_ARRAY_SRV, offset: 16 })
        DefineProp(this.Prototype, 'Texture2DMS', { type: D3D12_TEX2DMS_SRV, offset: 16 })
        DefineProp(this.Prototype, 'Texture2DMSArray', { type: D3D12_TEX2DMS_ARRAY_SRV, offset: 16 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D12_TEX3D_SRV, offset: 16 })
        DefineProp(this.Prototype, 'TextureCube', { type: D3D12_TEXCUBE_SRV, offset: 16 })
        DefineProp(this.Prototype, 'TextureCubeArray', { type: D3D12_TEXCUBE_ARRAY_SRV, offset: 16 })
        DefineProp(this.Prototype, 'RaytracingAccelerationStructure', { type: D3D12_RAYTRACING_ACCELERATION_STRUCTURE_SRV, offset: 16 })
        DefineProp(this.Prototype, 'BufferByteOffset', { type: D3D12_BUFFER_SRV_BYTE_OFFSET, offset: 16 })
        this.DeleteProp("__New")
    }
}
