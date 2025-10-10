#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a pipeline state stream.
 * @remarks
 * 
  * 
  * 
  * Use this structure with the **[ID3D12Device1::CreatePipelineState](/windows/win32/api/d3d12/nf-d3d12-id3d12device2-createpipelinestate)** method to create pipeline state objects. 
  * 
  * The format of the provided stream should consist of an alternating set of **[D3D12_PIPELINE_STATE_SUBOBJECT_TYPE](/windows/win32/api/d3d12/ne-d3d12-d3d12_pipeline_state_subobject_type)**, and the correspending subobject types for them (for example, **D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RASTERIZER** pairs with **[D3D12_RASTERIZER_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_rasterizer_desc)**. In terms of alignment, the D3D12 runtime expects subobjects to be individual struct pairs of enum-struct, rather than a continous set of fields. It also expects them to be aligned to the natural word alignment of the system. This can be achieved either using `alignas(void*)`, or making a `union` of the enum + subobject and a `void*`. 
  * 
  * > [!IMPORTANT]
  * > It isn't sufficient to simply union the **D3D12_PIPELINE_STATE_SUBOBJECT_TYPE** with a **void\***, because this will result in certain subobjects being misaligned.
  * > For example, **D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_PRIMITIVE_TOPOLOGY** is followed by a **[D3D12_PRIMITIVE_TOPOLOGY_TYPE](/windows/win32/api/d3d12/ne-d3d12-d3d12_primitive_topology_type)** enum. If the subobject type is unioned with a **void\***, then there will be additional padding between these 2 members, resulting in corruption of the stream.
  * > Because of this, you should union the entire subobject struct with a **void\***, when `alignas` is not available
  * 
  * An example of a suitable subobject for use with **[D3D12_RASTERIZER_DESC](/windows/win32/api/d3d12/ns-d3d12-d3d12_rasterizer_desc)** is shown here:
  * 
  * ```cpp
  * struct alignas(void*) StreamingRasterizerDesc
  * {
  * private:
  *   D3D12_PIPELINE_STATE_SUBOBJECT_TYPE Type = D3D12_PIPELINE_STATE_SUBOBJECT_TYPE_RASTERIZER;
  * public:
  *   D3D12_RASTERIZER_DESC Desc;
  * }
  * ```
  * 
  * The runtime will determine the type of a pipeline stream (valid types being **COMPUTE**, **GRAPHICS**, and **MESH**), by which subobject type, out of **VS** (vertex shader), **CS** (compute shader), and **MS** (mesh shader), is found. If the runtime finds none of these shaders, it will fail pipeline creation. If it finds multiple of these shaders which are not null, it will also fail. This means it is legal to have both, for example, a **CS** and **VS** in your stream object, provided only one has a non-null pointer for the shader bytecode for any given call to **[ID3D12Device1::CreatePipelineState](/windows/win32/api/d3d12/nf-d3d12-id3d12device2-createpipelinestate)**.
  * Subobject types irrelevant to the pipeline (e.g a compute shader subobject in a graphics stream) will be ignored.
  * If a subobject is not provided (excluding the above required subobjects), the runtime will provide a default value for it.
  * 
  * Consider using the `d3dx12.h` extensions for C++, which provide a set of helper structs for all pipeline subobjects (for example, the above struct is very similar to `CD3DX12_PIPELINE_STATE_STREAM_RASTERIZER`). This header can be found under the **[DirectX-Graphics-Samples]**(https://github.com/microsoft/DirectX-Graphics-Samples/blob/master/Libraries/D3DX12/d3dx12.h) repo on github.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PIPELINE_STATE_STREAM_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes?view=vs-2015">SAL</a>: <c>_In_</c>
     * 
     * Specifies the size of the opaque data structure pointed to by the pPipelineStateSubobjectStream member, in bytes.
     * @type {Pointer}
     */
    SizeInBytes {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes?view=vs-2015">SAL</a>: <c>_In_reads_(_Inexpressible_("Dependentonsizeofsubobjects"))</c>
     * 
     * Specifies the address of a data structure that describes as a bytestream an arbitrary pipeline state subobject.
     * @type {Pointer<Void>}
     */
    pPipelineStateSubobjectStream {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
