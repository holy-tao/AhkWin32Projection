#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk

/**
 * Describes a set of triangles used as raytracing geometry. The geometry pointed to by this struct are always in triangle list form, indexed or non-indexed. Triangle strips are not supported.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_raytracing_geometry_triangles_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Address of a 3x4 affine transform matrix in row-major layout to be applied to the vertices in the <i>VertexBuffer</i> during an acceleration structure build.  The contents of <i>VertexBuffer</i> are not modified.  If a 2D vertex format is used, the transformation is applied with the third vertex component assumed to be zero. 
     * 
     * If <i>Transform3x4</i> is NULL the vertices will not be transformed. Using <i>Transform3x4</i> may result in increased computation and/or memory requirements for the acceleration structure build.
     * 
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  The address must be aligned to 16 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants">D3D12_RAYTRACING_TRANSFORM3X4_BYTE_ALIGNMENT</a>.
     * @type {Integer}
     */
    Transform3x4 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Format of the indices in the <i>IndexBuffer</i>.  Must be one of the following:
     * 
     * <ul>
     * <li><b>DXGI_FORMAT_UNKNOWN</b> - when IndexBuffer is NULL</li>
     * <li><b>DXGI_FORMAT_R32_UINT</b></li>
     * <li><b>DXGI_FORMAT_R16_UINT</b></li>
     * </ul>
     * @type {Integer}
     */
    IndexFormat {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Format of the vertices in <i>VertexBuffer</i>.  Must be one of the following:
     * 
     * <ul>
     * <li><b>DXGI_FORMAT_R32G32_FLOAT</b> - third component is assumed 0</li>
     * <li><b>DXGI_FORMAT_R32G32B32_FLOAT</b></li>
     * <li><b>DXGI_FORMAT_R16G16_FLOAT</b> - third component is assumed 0</li>
     * <li><b>DXGI_FORMAT_R16G16B16A16_FLOAT</b>  - A16 component is ignored, other data can be packed there, such as setting vertex stride to 6 bytes.</li>
     * <li><b>DXGI_FORMAT_R16G16_SNORM</b>  - third component is assumed 0</li>
     * <li><b>DXGI_FORMAT_R16G16B16A16_SNORM</b>   - A16 component is ignored, other data can be packed there, such as setting vertex stride to 6 bytes.</li>
     * </ul>
     * @type {Integer}
     */
    VertexFormat {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Number of indices in <i>IndexBuffer</i>.  Must be 0 if <i>IndexBuffer</i> is NULL.
     * @type {Integer}
     */
    IndexCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of vertices in <i>VertexBuffer</i>.
     * @type {Integer}
     */
    VertexCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Array of vertex indices.  If NULL, triangles are non-indexed.  Just as with graphics, the address must be aligned to the size of <i>IndexFormat</i>.
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  Note that if an app wants to share index buffer inputs between graphics input assembler and raytracing acceleration structure build input, it can always put a resource into a combination of read states simultaneously, e.g. <b>D3D12_RESOURCE_STATE_INDEX_BUFFER</b> | <b>D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</b>.
     * @type {Integer}
     */
    IndexBuffer {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Array of vertices including a stride.  The alignment on the address and stride must be a multiple of the component size, so 4 bytes for formats with 32bit components and 2 bytes for formats with 16bit components.  Unlike graphics, there is no constraint on the stride, other than that the bottom 32bits of the value are all that are used – the field is UINT64 purely to make neighboring fields align cleanly/obviously everywhere.  Each vertex position is expected to be at the start address of the stride range and any excess space is ignored by acceleration structure builds.  This excess space might contain other app data such as vertex attributes, which the app is responsible for manually fetching in shaders, whether it is interleaved in vertex buffers or elsewhere.
     * 
     * The memory pointed to must be in state <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</a>.  Note that if an app wants to share vertex buffer inputs between graphics input assembler and raytracing acceleration structure build input, it can always put a resource into a combination of read states simultaneously, e.g. <b>D3D12_RESOURCE_STATE_VERTEX_AND_CONSTANT_BUFFER</b> | <b>D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE</b>
     * @type {D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE}
     */
    VertexBuffer{
        get {
            if(!this.HasProp("__VertexBuffer"))
                this.__VertexBuffer := D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE(32, this)
            return this.__VertexBuffer
        }
    }
}
